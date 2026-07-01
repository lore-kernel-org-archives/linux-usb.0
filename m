Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F8A3A3809;
	Wed,  1 Jul 2026 06:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887131; cv=none; b=n80RX0sciFZRqSOqhMxO2ZPg76tY8+TZ+7TVdfA54hOR2I/WRgkZjjedA3G/YfUhvUPpcqWvvMbrNbt+7I2wYD4YJYtpiuxtO6T0lCZnH6rIaBmygtCi33dNwbyW2uJzmoxhmMP5BhgdLtA2ho6yGSC1TiVc2Ps9lcnz9m+Ebzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887131; c=relaxed/simple;
	bh=vydphQVMDhQC8y3vQ9xuUu8t8noiOJh62FT+4YDV6Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1W9mIVOBFVROM13JkBXfQQvEVO64/Fa/umlh3zBlMS/patzNmnmUy8Wq503+j4Pf64WnT2HX/DR6mpOAKVt5wsFZFnFuxzx3LRJ4Twt8rVFQA6pZN6fpnTYQ53RTvZ9AV4N+3CDhe8r4Zy4F1nRds0W+jxjUugiqs6VsxRXZ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu (ip5f5af73c.dynamic.kabel-deutschland.de [95.90.247.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7F3194C2C37D68;
	Wed, 01 Jul 2026 08:24:58 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: class: balance alt mode driver module refcount
Date: Wed,  1 Jul 2026 08:24:16 +0200
Message-ID: <20260701062417.15314-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Plugging or unplugging a USB-C dock on a Dell XPS 13 9370 running v7.1.1
triggers a WARN splat and, on unplug, a module refcount underflow.  The
UCSI alt mode poll worker warns that it cannot pin the alt mode driver:

  WARNING: drivers/usb/typec/class.c:311 at typec_altmode_update_active+0x100/0x110 [typec]
  Workqueue: USBC000:00-con3 ucsi_poll_worker [typec_ucsi]
  Call Trace:
   ucsi_altmode_update_active+0x101/0x1a0 [typec_ucsi]
   ucsi_check_altmodes+0x92/0xd0 [typec_ucsi]
   ucsi_poll_worker+0x3a/0x110 [typec_ucsi]

This is neither specific to this machine nor new in v7.1.  The same two
splats have been collected for years by Fedora ABRT on other Dell
laptops: the module_put() underflow as far back as the Fedora 6.0.5
kernel (first seen 2022-11-06) on an XPS 13 9300, and the
try_module_get() warning on a Precision 7550 running the Fedora 6.14.5
kernel.

On unplug the partner alt mode is torn down and the imbalance surfaces
as a module_put() underflow:

  WARNING: kernel/module/main.c:957 at module_put+0x96/0xa0
  Workqueue: events ucsi_handle_connector_change [typec_ucsi]
  Call Trace:
   typec_altmode_update_active+0x6f/0x110 [typec]
   typec_remove+0x85/0x90 [typec]
   device_release_driver_internal+0x19e/0x200
   bus_remove_device+0xe4/0x1c0
   device_del+0x160/0x3d0
   ucsi_unregister_altmodes+0x49/0xb0 [typec_ucsi]
   ucsi_unregister_partner+0x9e/0x160 [typec_ucsi]
   ucsi_handle_connector_change+0x386/0x420 [typec_ucsi]

typec_altmode_update_active() pins the alt mode driver's module while a
partner or plug alt mode is active: it takes a reference in the enter
path and drops it in the exit path.  The get and put are keyed on
adev->dev.driver, but the alt mode driver bind/unbind is not serialised
against the active state transitions:

 - If the mode is reported active while no driver is bound yet (the UCSI
   poll worker racing ahead of asynchronous driver binding), no
   reference is taken, but adev->active is still set.  On unbind
   typec_remove() sees adev->active and issues an unconditional
   module_put(), underflowing the refcount.

 - try_module_get() can also fail when the module is already going away,
   which the code only WARN_ON()s while still marking the mode active,
   producing the same imbalance on the following put.

Both conditions are races with narrow timing windows.  The active state
is updated by the UCSI poll and connector-change workers, which are not
serialised against the asynchronous alt mode driver bind/unbind or
against module unload, so the imbalance only triggers on an unlucky
interleaving (a quick unplug/replug, or hotplug-driven module churn) and
is not reproducible on demand.  That matches it being seen only once on
the affected machine and the reports above turning up years apart.  The
skewed refcount is not merely cosmetic: an rmmod racing the underflow
can unload the alt mode driver while a mode is still active.

Track whether a reference is actually held in struct altmode and only
put it when held, so the get and put always balance and the module_put()
underflow can no longer occur.  Keep the WARN_ON() on a failed
try_module_get(): it flags the genuine oddity of entering a mode whose
driver module is already going away, and with the reference now tracked
it no longer leaves the refcount skewed for the following put.

Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
Link: https://retrace.fedoraproject.org/faf/reports/542503/
Link: https://retrace.fedoraproject.org/faf/reports/1278469/
Assisted-by: Claude:claude-opus-4-8 [Claude Code]
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/usb/typec/bus.h   |  2 ++
 drivers/usb/typec/class.c | 23 +++++++++++++++++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 7df5deb1dd3a5..c3509a5e57fd0 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -23,6 +23,8 @@ struct altmode {
 
 	struct altmode			*partner;
 	struct altmode			*plug[2];
+
+	bool				module_hold;
 };
 
 #define to_altmode(d) container_of(d, struct altmode, adev)
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 0977581ad1b6e..aa7665a418b2f 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -299,16 +299,31 @@ static void typec_altmode_put_partner(struct altmode *altmode)
  */
 void typec_altmode_update_active(struct typec_altmode *adev, bool active)
 {
+	struct altmode *alt = to_altmode(adev);
 	char dir[6];
 
 	if (adev->active == active)
 		return;
 
+	/*
+	 * A partner/plug alternate mode pins its driver's module while the
+	 * mode is active. The driver bind/unbind and the active state change
+	 * are not serialised: the driver may be (un)bound between the enter
+	 * and exit updates, and try_module_get() can fail if the module is
+	 * already going away. Track whether a reference is actually held so
+	 * the get and put always balance instead of underflowing module
+	 * refcounts.
+	 */
 	if (!is_typec_port(adev->dev.parent) && adev->dev.driver) {
-		if (!active)
-			module_put(adev->dev.driver->owner);
-		else
-			WARN_ON(!try_module_get(adev->dev.driver->owner));
+		if (!active) {
+			if (alt->module_hold) {
+				module_put(adev->dev.driver->owner);
+				alt->module_hold = false;
+			}
+		} else if (!alt->module_hold) {
+			alt->module_hold = try_module_get(adev->dev.driver->owner);
+			WARN_ON(!alt->module_hold);
+		}
 	}
 
 	adev->active = active;
-- 
2.54.0

