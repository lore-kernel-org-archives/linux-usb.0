Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E545000;
	Wed,  1 Jul 2026 10:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782901758; cv=none; b=r7h/p2lrDWLfjSyIPrO6+EOuNZjDFx35SZO+fDOr5iXiFr6B3UDu6FU5cZW8IG9pfBVVgCXC+I/aVrzawa1lG2lX2gu0SxV1JHbD26An2QnHAZ3Ey0oZgwBSO8TV8Z0sGxy4W3BCqnTjqj54gU8CHgW9L5Om9BSJrZIBNXNRATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782901758; c=relaxed/simple;
	bh=185QWXoYyL0j3fU1M0pO3Cn5pgoy93IXmihA/x6GG1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i5ZxPfFYPZlZPN7MrMDjX6kqQ276T6Fc4wh554E7BHXc1Sjh/3a1fKMnqx1ItEcLP+J/zKKZ/UWw+0NJNe/QGcPGgUjn7AZz+/TkDwcXe4p2h31B0pVcFKPwNnF0fvXWCw6VJAP3SSzYe9nkpCnu10c0H1HmiZxZImtgIcCDr+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu.molgen.mpg.de (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7A0934C442FCCA;
	Wed, 01 Jul 2026 12:28:52 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: typec: class: do not pin the alt mode driver module
Date: Wed,  1 Jul 2026 12:28:26 +0200
Message-ID: <20260701102831.34954-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Plugging or unplugging a USB-C dock on a Dell XPS 13 9370 running v7.1.1
triggers a WARN splat and, on unplug, a module refcount underflow:

    WARNING: drivers/usb/typec/class.c:311 at typec_altmode_update_active+0x100/0x110 [typec]
    Workqueue: USBC000:00-con3 ucsi_poll_worker [typec_ucsi]
    Call Trace:
     ucsi_altmode_update_active+0x101/0x1a0 [typec_ucsi]
     ucsi_check_altmodes+0x92/0xd0 [typec_ucsi]
     ucsi_poll_worker+0x3a/0x110 [typec_ucsi]
  
    WARNING: kernel/module/main.c:957 at module_put+0x96/0xa0
    Workqueue: events ucsi_handle_connector_change [typec_ucsi]
    Call Trace:
     typec_altmode_update_active+0x6f/0x110 [typec]
     typec_remove+0x85/0x90 [typec]
     device_release_driver_internal+0x19e/0x200
     ucsi_unregister_altmodes+0x49/0xb0 [typec_ucsi]
     ucsi_unregister_partner+0x9e/0x160 [typec_ucsi]
     ucsi_handle_connector_change+0x386/0x420 [typec_ucsi]

For a partner or plug alt mode, typec_altmode_update_active() takes a
reference on the bound alt mode driver's module when the mode is entered
and drops it when the mode is exited, to keep the driver from being
unloaded while a mode is active.

That reference counting is unbalanced.  The get and put are keyed on
adev->dev.driver, but the alt mode driver bind/unbind runs asynchronously
and is not serialised against the active state changes issued by the UCSI
poll and connector-change workers.  If the mode is reported active before
the driver has bound, no reference is taken but adev->active is set, and
the module_put() on unbind then underflows the refcount.  try_module_get()
can also fail when the module is already going away.  These are the splats
above, seen for years via Fedora ABRT on several Dell laptops.

The pin is not needed.  When the alt mode driver is unbound—including
on module unload, which unbinds first—typec_remove() puts the mode back
into TYPEC_STATE_SAFE, clears adev->active and adev->ops, and the driver's
own remove callback drains its work (cancel_work_sync() in
dp_altmode_remove()).  The mode is torn down cleanly without the extra
module reference; all it ever bought was making rmmod of an alt mode
driver fail with -EBUSY while a mode happened to be active.

Drop the module get/put instead of trying to balance it.

Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
Link: https://retrace.fedoraproject.org/faf/reports/542503/
Link: https://retrace.fedoraproject.org/faf/reports/1278469/
Assisted-by: Claude:claude-opus-4-8 [Claude Code]
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
Changes in v2 (addressing review from Greg Kroah-Hartman and the
Sashiko automated review):
- Drop the alt mode driver module reference counting entirely instead
  of balancing it with a tracking flag; the unbind path already tears
  the mode down safely, so the pin is unnecessary (Greg).
- Drop the WARN_ON(), which could reboot panic_on_warn systems (Greg).
- Drop the large explanatory comment (Greg).
- No new struct altmode flag, so the unlocked-flag, wrong-module and
  double-put concerns from the Sashiko review no longer apply.

v1: https://lore.kernel.org/linux-usb/20260701062417.15314-2-pmenzel@molgen.mpg.de/
sashiko: https://sashiko.dev/#/patchset/20260701062417.15314-2-pmenzel%40molgen.mpg.de
 drivers/usb/typec/class.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0977581ad1b6e..ca19eb2a3c645 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -304,13 +304,6 @@ void typec_altmode_update_active(struct typec_altmode *adev, bool active)
 	if (adev->active == active)
 		return;
 
-	if (!is_typec_port(adev->dev.parent) && adev->dev.driver) {
-		if (!active)
-			module_put(adev->dev.driver->owner);
-		else
-			WARN_ON(!try_module_get(adev->dev.driver->owner));
-	}
-
 	adev->active = active;
 	snprintf(dir, sizeof(dir), "mode%d", adev->mode);
 	sysfs_notify(&adev->dev.kobj, dir, "active");
-- 
2.54.0

