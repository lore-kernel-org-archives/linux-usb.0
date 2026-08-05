Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65763EE1E3
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 09:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922636; cv=none; b=Taoa5F4ezYWVTgh8HC+Zjd1/5hhOJW3sDjJQaoKA5ZEciPVVpafpbBKmOj36z4fzJ+UGYwcukAL+ZsE8DjFBwb8eLFdUw6QlSsX5WxfvcTjoRWgJsySfAsB/D9nXGCKAmGdMC2NIVe4/1cRxMuwrcM+Ap/beSOjtBkFDJtwL+yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922636; c=relaxed/simple;
	bh=6YK567IGq8h0ucz3HuSvHIVSueZqJI9msPELoAchl6c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Eq+sGWMIq7COuESk/Penve7a3oBt205XAu5L/GPgh0DTnbdW5egpfDn6Q5Oj0m0JKQGFoslRpl1fTgW8WyyriS4dn+zojXS6XBA5sLAenVsOUPUn7Wt7nm4rpio77PnEN2FLQv30+0qwS+2te9Q1D7KX+bJpkhdDbGlj12JLeEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso150642b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 02:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785922634; x=1786527434;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDykm1jGVF4ssuF+p129G5u9M/nck81rmsKdLSLWPfE=;
        b=OSJ9RxHjNnHzMyVWjOKGYMC7q5+9ysjjRVPiFHRkqqbkTMmYQP4GWEY389Prr/oD+2
         vO6pZIYU6be6gXyGH20mj4JqYk0dPvwxuQcxkMVgag8ZQaxCmOArv8S4mykq8RAGwmop
         Mk/GiXZPQBvH0az5UDfInwDhVNgvA0ovV+OWcltMJmKXIyzylcaATvARM6bUWvGT97w1
         /hhd+7RdFVm8fs+BWX0yGLRXncX4gLrw0MAeMGtQz/KvTC8G84lr6BeEhsXt+Fa87epO
         tZytLMiyjahbJeIAapLBzW/tyt/4pvO+J/Z2yNKrE54bBuDN4TmpX72H1eZaAyoEo0Z4
         dj2g==
X-Forwarded-Encrypted: i=1; AHgh+Rp+mMDLYShvibGQ7sX9/O7o5Ui5rJsHEfFuMRS7dM/OCCfYVw1AlYyIw6nXslQpqVzZTSrbRjNayPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoeR1mxH0l+hFBMglIYMxJIdM8nXBMnsIxVR6rM8++dg3pIQCh
	r0b/12w7mQmAcoYKdX6pzUxsxNwJiRRb+B4eazSZwquE5OFLGoXHnifj
X-Gm-Gg: AR+sD12rP2Y641yFe+P3x6kccJG2XfajGpQ6U8PdBakciaRHs5n8fjPrJ4pnYzPCwLj
	aCm4OoAatxZBFXiybu2pCgrHtTLz9yZE8o14ZHKkWP30qeKFNWcrUrx3DAKffvruDwUQeYkwgcP
	0r9BXBVxCwLuVht1qNiP72yqscM3MAmcZ2z7an/2d/9042lleWmlmKAJrgDVUoyXxNkQ9acLdjn
	b9yVGbtO+CITEKxa5jIj3SGJaqP6fxc3su8pJfhVgo1wmBbKlCvbJ39d90TgaKe2GL9YbirH/yK
	qYY6aJsLejNBznPGNnR37Ku+2/ZpP3XrjTDJJ8NV1TPCjYAA9xMvaiN2ZBl7SpZEV8d1l54WA3H
	3uRm38B5THgY9Q6sDO0LkhXOj+3UPUqtasdSf1aO3oCaOwMl6tzETx8QOoB9MA0w1CZ/Tw2sxKp
	D1b9YU0hl/T5aTLuZuwg4QwR41IBfn2EQhTbAbquAZwf91SHt1F4LsPBLPMKL5+PMO5WCAB77Vk
	7na
X-Received: by 2002:a05:6a00:3996:b0:84a:2fff:ced2 with SMTP id d2e1a72fcca58-84f2e0edf21mr4735589b3a.35.1785922633788;
        Wed, 05 Aug 2026 02:37:13 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e509866sm616159b3a.41.2026.08.05.02.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:37:13 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: guanyulin@google.com,
	rafael.j.wysocki@intel.com,
	sakari.ailus@linux.intel.com,
	mathias.nyman@linux.intel.com,
	eadavis@qq.com,
	kees@kernel.org,
	dominique.martinet@atmark-techno.com,
	khtsai@google.com,
	stern@rowland.harvard.edu,
	oneukum@suse.com,
	marco.crivellari@suse.com,
	thorsten.blum@linux.dev,
	amardeep.rai@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [RFC PATCH] usb: core: defer leaf-device resume off the S3 critical path
Date: Wed,  5 Aug 2026 17:36:41 +0800
Message-Id: <20260805093641.3543206-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

Problem:
System resume (dpm_resume) invokes each device's resume callback
synchronously on the wake-up critical path.  For a USB leaf device
this means port resume and, when reset_resume is needed, a port
reset that, for persistent devices, waits up to 2000 ms for the
device connection (CCS; on SuperSpeed this includes link training)
to be re-established (wait_for_connected()).  Slow link training of
some U-disks and webcams after S3 power-on therefore stalls the
entire system wake-up: on an
arm64 test machine with four leaf devices (bluetooth, UVC camera,
two U-disks) dpm_resume took 2508 ms, about 2.1 s of it caused by a
single SanDisk U-disk whose link training stayed in Rx.Detect for
2000 ms (worst case: -ENODEV fallback to disconnect +
re-enumeration).  A device compatibility issue should not lengthen
the system-wide wake-up.

Fix:
The patch addresses this on four levels:

1. Defer leaf-device recovery off the critical path.  Leaf devices
   (udev->parent && !udev->maxchild) that are port-suspended on
   system resume have their real port resume moved to a per-device
   work item queued from usb_resume_complete(), after all hubs have
   finished resume.  The work reuses the same udev (in-place reset,
   devnum preserved); drivers without reset_resume get unbind+rebind.

2. Safe abandonment.  If a new suspend or a disconnect arrives before
   the work item runs, the reset is abandoned, not flushed: the
   device is still port-suspended, which is exactly what the new
   suspend needs, and the work item then only releases the runtime
   reference it took.  The abandon decision is serialized with the
   work item by the device lock, so no cancel_work_sync() (which
   would deadlock against the work item's device_lock()) is needed
   on the suspend path.

3. Truthful runtime state with lazy resume.  The deferred branch of
   usb_resume() reports the device as suspended
   (pm_runtime_set_suspended) until recovery actually completes; the
   work item switches it back to active only after usb_resume_both()
   succeeds.  Accesses made in between trigger
   usb_autoresume_device() -> usb_port_resume() and resume the
   device synchronously, so a successful operation is a real
   confirmation of readiness.  A failed recovery leaves the device
   suspended: later accesses fail or the device is disconnected,
   both visible to user space.

4. Port-state gating.  A device is only deferred when its port is
   not connected (link training still pending, or the device was
   removed while asleep) -- the case where the long waits happen.  A
   connected port resumes in bounded time and keeps the synchronous
   path with unchanged semantics.

Results:
With four leaf devices (bluetooth, UVC camera, Kingston U-disk,
SanDisk U-disk), repeated S3 measurements (14 rounds):
- without a 2000 ms event: dpm_resume drops from ~498-502 ms to
  ~219-223 ms (-56%);
- with the occasional 2000 ms link-training wait (or the fixed
  2000 ms CONNECT timeout for a device removed during sleep):
  dpm_resume drops from ~2508-2813 ms to ~219 ms (-91%), the wait
  running in the background workqueue without affecting
  system-wide resume.
Deferred recovery completes in 0-20 ms in the common case.

Known limitations (no practical impact):
- The system resume notification (PM_POST_SYSTEM_RESUME) is
  system-wide and carries no device information; between the
  notification and deferred recovery completion an application
  accessing the device may fail.  Drivers using usb_autopm trigger
  synchronous recovery instead (lazy resume), and the window is
  milliseconds in practice.
- usb_resume() returns success before the device is actually
  recovered; the runtime PM state is truthful (suspended), but the
  PM core counts the callback as successful.  No kernel path
  depends on that accounting.
- A recovery failure in the workqueue cannot be reported through
  the dpm error path; it surfaces as device disconnect, which user
  space already handles.

Gated by module parameter usbcore.defer_resume (default off).

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/core/driver.c | 139 +++++++++++++++++++++++++++++++++++++-
 drivers/usb/core/hub.c    |  16 +++++
 drivers/usb/core/usb.c    |   3 +
 drivers/usb/core/usb.h    |   1 +
 include/linux/usb.h       |  13 ++++
 5 files changed, 169 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f63004417058..286392104330 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -32,7 +32,7 @@
 #include <linux/usb/quirks.h>
 #include <linux/usb/hcd.h>
 
-#include "usb.h"
+#include "hub.h"	/* includes "usb.h" */
 
 
 /*
@@ -1220,6 +1220,78 @@ void usb_unbind_and_rebind_marked_interfaces(struct usb_device *udev)
 
 #ifdef CONFIG_PM
 
+/*
+ * Defer slow leaf-device resume off the S3 critical path.  The per-device
+ * port reset (~1-2 s for webcams, USB NICs, etc.) is moved to a work item
+ * queued from usb_resume_complete(), after all hubs have finished resume.
+ * The deferred work reuses the same udev (in-place reset, devnum
+ * preserved).  Drivers such as ax_usb_nic lack reset_resume; the work
+ * performs unbind+rebind after reset.
+ *
+ * If a new suspend or a disconnect arrives before the work item runs, the
+ * reset is abandoned, not flushed: the device is still port-suspended,
+ * which is exactly what the new suspend needs, and the work item then only
+ * releases the runtime reference taken by the deferred resume.  The
+ * abandon decision is serialized with the work item by the device lock, so
+ * no cancel_work_sync() (which would deadlock against the work item's
+ * device_lock()) is needed on the suspend path.
+ */
+bool usb_defer_resume_enabled;
+module_param_named(defer_resume, usb_defer_resume_enabled, bool, 0644);
+MODULE_PARM_DESC(defer_resume,
+	"defer leaf USB device resume to a workqueue (off the S3 critical path)");
+
+static int usb_resume_both(struct usb_device *udev, pm_message_t msg);
+
+static bool usb_should_defer_leaf_resume(struct usb_device *udev,
+		pm_message_t msg)
+{
+	struct usb_hub *hub;
+	u16 portstatus, portchange;
+
+	if (!usb_defer_resume_enabled || PMSG_IS_AUTO(msg))
+		return false;
+	if (!udev->parent || udev->maxchild)
+		return false;
+	if (udev->state != USB_STATE_SUSPENDED)
+		return false;
+
+	/*
+	 * Only defer when the port is not connected: link training is
+	 * either still pending or the device was removed while asleep,
+	 * which is where the long waits (the 2000 ms CONNECT timeout in
+	 * wait_for_connected()) happen.  A connected port resumes in a
+	 * bounded time, so keep the synchronous path -- and its exact
+	 * "resume complete means device usable" semantics -- for it.
+	 */
+	hub = usb_hub_to_struct_hub(udev->parent);
+	if (!hub)
+		return false;
+	if (usb_hub_port_status(hub, udev->portnum, &portstatus, &portchange))
+		return false;	/* cannot read port status: stay synchronous */
+	if (portstatus & USB_PORT_STAT_CONNECTION)
+		return false;	/* connected: resume is fast, keep sync */
+
+	return true;
+}
+
+/* Finish a deferred resume synchronously.  The caller holds the device lock. */
+static int usb_defer_flush_resume(struct usb_device *udev)
+{
+	pm_message_t msg = udev->defer_resume_msg;
+	int status;
+
+	status = usb_resume_both(udev, msg);
+	if (status == 0) {
+		unbind_marked_interfaces(udev);
+		rebind_marked_interfaces(udev);
+	} else if (status != -ENODEV && status != -ESHUTDOWN) {
+		/* Don't log when the device is being disconnected */
+		dev_err(&udev->dev, "deferred resume failed: %d\n", status);
+	}
+	return status;
+}
+
 /* Unbind drivers for @udev's interfaces that don't support suspend/resume
  * There is no check for reset_resume here because it can be determined
  * only during resume whether reset_resume is needed.
@@ -1587,6 +1659,30 @@ static int usb_resume_both(struct usb_device *udev, pm_message_t msg)
 	return status;
 }
 
+void usb_defer_resume_workfn(struct work_struct *work)
+{
+	struct usb_device *udev =
+		container_of(work, struct usb_device, defer_resume_work);
+	int status = -ENODEV;
+
+	device_lock(&udev->dev);
+	if (!udev->defer_resume_cancel) {
+		if (udev->state == USB_STATE_SUSPENDED)
+			status = usb_defer_flush_resume(udev);
+		else if (udev->state != USB_STATE_NOTATTACHED)
+			/* Already resumed via the runtime PM path. */
+			status = 0;
+	}
+	device_unlock(&udev->dev);
+
+	if (status == 0) {
+		pm_runtime_disable(&udev->dev);
+		pm_runtime_set_active(&udev->dev);
+		pm_runtime_enable(&udev->dev);
+	}
+	pm_runtime_put(&udev->dev);
+}
+
 static void choose_wakeup(struct usb_device *udev, pm_message_t msg)
 {
 	int	w;
@@ -1621,6 +1717,21 @@ int usb_suspend(struct device *dev, pm_message_t msg)
 	struct usb_device	*udev = to_usb_device(dev);
 	int r;
 
+	/* A deferred leaf resume may still be outstanding (queued or
+	 * running).  The device is still port-suspended, which is exactly
+	 * what this suspend needs, so abandon the deferred port reset:
+	 * if the work item was never queued, drop the runtime reference
+	 * taken by the deferred resume here; otherwise the flag makes
+	 * the work item skip the reset and just release the reference.
+	 * Serialized with the work item by the device lock.
+	 */
+	if (udev->defer_resume_pending) {
+		udev->defer_resume_pending = 0;
+		pm_runtime_put(&udev->dev);
+	} else {
+		udev->defer_resume_cancel = 1;
+	}
+
 	unbind_no_pm_drivers_interfaces(udev);
 
 	/* From now on we are sure all drivers support suspend/resume
@@ -1643,11 +1754,22 @@ int usb_resume_complete(struct device *dev)
 {
 	struct usb_device *udev = to_usb_device(dev);
 
+	if (udev->state == USB_STATE_NOTATTACHED)
+		return 0;
+
+	/* Queue the real port reset after dpm_complete, once every hub in
+	 * the tree has finished resume and downstream ports are settled.
+	 */
+	if (udev->defer_resume_pending) {
+		udev->defer_resume_pending = 0;
+		queue_work(system_unbound_wq, &udev->defer_resume_work);
+		return 0;
+	}
+
 	/* For PM complete calls, all we do is rebind interfaces
 	 * whose needs_binding flag is set
 	 */
-	if (udev->state != USB_STATE_NOTATTACHED)
-		rebind_marked_interfaces(udev);
+	rebind_marked_interfaces(udev);
 	return 0;
 }
 
@@ -1657,6 +1779,17 @@ int usb_resume(struct device *dev, pm_message_t msg)
 	struct usb_device	*udev = to_usb_device(dev);
 	int			status;
 
+	if (usb_should_defer_leaf_resume(udev, msg)) {
+		udev->defer_resume_msg = msg;
+		udev->defer_resume_pending = 1;
+		udev->defer_resume_cancel = 0;
+		pm_runtime_get_noresume(dev);
+		pm_runtime_disable(dev);
+		pm_runtime_set_suspended(dev);
+		pm_runtime_enable(dev);
+		return 0;
+	}
+
 	/* For all calls, take the device back to full power and
 	 * tell the PM core in case it was autosuspended previously.
 	 * Unbind the interfaces that will need rebinding later,
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..43a72ebefca7 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2327,6 +2327,22 @@ void usb_disconnect(struct usb_device **pdev)
 	dev_info(&udev->dev, "USB disconnect, device number %d\n",
 			udev->devnum);
 
+#ifdef CONFIG_PM
+	/* A deferred leaf resume may still be outstanding.  If the work
+	 * item was never queued, drop the runtime reference taken by the
+	 * deferred resume here; otherwise cancel the work item so it
+	 * cannot run after teardown begins — it will release the
+	 * reference itself.  No device lock is held here, so the sync
+	 * cancel cannot deadlock against the work item.
+	 */
+	if (udev->defer_resume_pending) {
+		udev->defer_resume_pending = 0;
+		pm_runtime_put(&udev->dev);
+	}
+	if (cancel_work_sync(&udev->defer_resume_work))
+		pm_runtime_put(&udev->dev);
+#endif
+
 	/*
 	 * Ensure that the pm runtime code knows that the USB device
 	 * is in the process of being disconnected.
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index df166cafe106..2005c468ea14 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -681,6 +681,9 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
 	/* ep0 maxpacket comes later, from device descriptor */
 	usb_enable_endpoint(dev, &dev->ep0, false);
 	dev->can_submit = 1;
+#ifdef CONFIG_PM
+	INIT_WORK(&dev->defer_resume_work, usb_defer_resume_workfn);
+#endif
 
 	/* Save readable and stable topology id, distinguishing devices
 	 * by location for diagnostics, tools, driver model, etc.  The
diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
index a9b37aeb515b..3dbeede2db62 100644
--- a/drivers/usb/core/usb.h
+++ b/drivers/usb/core/usb.h
@@ -95,6 +95,7 @@ extern int usb_port_disable(struct usb_device *udev);
 extern int usb_suspend(struct device *dev, pm_message_t msg);
 extern int usb_resume(struct device *dev, pm_message_t msg);
 extern int usb_resume_complete(struct device *dev);
+extern void usb_defer_resume_workfn(struct work_struct *work);
 
 extern int usb_port_suspend(struct usb_device *dev, pm_message_t msg);
 extern int usb_port_resume(struct usb_device *dev, pm_message_t msg);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 1da4ad1610bc..be69e9318b98 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -743,6 +743,19 @@ struct usb_device {
 
 	u16 hub_delay;
 	unsigned use_generic_driver:1;
+
+#ifdef CONFIG_PM
+	/* Deferred leaf-device resume: the slow port reset runs in this
+	 * work item after dpm_complete, reusing the same udev (devnum
+	 * preserved).  defer_resume_cancel is set by a new suspend to
+	 * abandon the reset; the work item then only drops the runtime
+	 * reference.
+	 */
+	struct work_struct defer_resume_work;
+	pm_message_t defer_resume_msg;
+	unsigned defer_resume_pending:1;
+	unsigned defer_resume_cancel:1;
+#endif
 };
 
 #define to_usb_device(__dev)	container_of_const(__dev, struct usb_device, dev)
-- 
2.25.1

