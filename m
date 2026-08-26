Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9F3B8BA1;
	Wed, 26 Aug 2026 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732847; cv=none; b=MQO3a9KuswAY3O6EV28TMAu7ATAC1XOMgQqqXdD6CfBAJveFopTKOIzqO7UCuSRGDn/Qa4/aV6Wfhni/FuSRlTPbP1v7Jvl+66eDP5xFp6ONdfpUYVPPSfd9NF8cV9mLsTvTSt1Mm30hSrVaUuWbENdN1MozRdqecTm0NrJCOM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732847; c=relaxed/simple;
	bh=yK2SsuOYxKahXHqNlG7kVOss7VMYGKUjBTQF13/wjOQ=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=m4xgsCQR8mUal14pWW5CPoAoz0cf05prdqgs6e0k8pJ/TDkLXo46wfFZDwJ7nW3y1uZxmDEiUGchNOWF9lmWkEVeMG+nQ8xxtuZcqnqOEhWqTkGPIflzOMCFbTnrm5nvMsOzwBLhKdImKl4i15zS9nkzXlEx1dm7sZjRnKII+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=GJgLmial; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="GJgLmial"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1787732828;
	bh=YWu8HRuw6WWrbcJssCbAr7i84xwg8byr/Fmp5XPG1uU=;
	h=From:Date:Subject:To:Cc;
	b=GJgLmialhcT56taN9MbCuImX3yArblMqCQgf+ykJ1+XPItOws32fopt3uJsl+To9B
	 q6tzkMwqHWR5oDJ87pecJb+RfkeHPWXqyvKNqr+KM4BmHjhg4Y5VNJ5j9dwGQhQVPU
	 x1Jn0b0GKIeUwEKiOsfFmO5mnPk9rFKSsDSe758w=
Received: from [127.0.1.1] ([2001:da8:283:e049::9:8de6])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 6C60FCED; Wed, 26 Aug 2026 16:27:06 +0800
X-QQ-mid: xmsmtpt1787732826tne0pbznw
Message-ID: <tencent_C241874A5406FB9AE72DCEEB8717B208EC05@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoee2eulCtgIhg/xuztKl27F4Ya9uPf9sj4ZzyXPhVzWcgCSjihuj
	 cyZ6OlKRyj0sP8MjXrKaYKnxZgGgc5EeYO4VqvWkPM2AH0bQxx13E2QFJ07byWxX+wC4ZecylTBU
	 VGg3fN4hooY1DQDZob2ZN4qrrHBOxPbaokgO2BJNMQA6NgSPFiXe/9EqqTVP0cgwkOYvH/pyYfD7
	 z0qNJqZ6PBrPFm3qQsuPxMsrZSIgGBCSb1oAGHDGRMZtxFsEG9tOmuQG6hlW6jCsLimDqQIoPe0n
	 yVbKnTaa/Plq2FwqmFm/P0teX3z6MaQP1q9ZVzSJyiCD7PrQ2d2PKv5b79S2bffaJUv7vABX2j5P
	 NUARf2t7nBXjI4TGiBNbBmuuc5UNUPdHL39U7dWKKvyFZbSePZ2trS4F+f1YGz+ORWQEEqg1Hy8c
	 gY1suW3/lPsIqWF7jpxmvPw0PrnAri5M1PyZ5ZtHgaskQEpueon7Rw2qu3s64ZCdmkay/DmX6Row
	 XyoYF6XlJ2hje79PkOLqm34KsIiKw7JP2K/Osy5BAG2LFX1XXDiVQWWYsJgrOxbkrpF9kfJbUnKI
	 LqxMIqwrggOSjrgf0nQT8I/OoqpXUVyfdLCGYx1UXu4XmpTNxGrfTBwVlms+/LrALdUhqLcnIelA
	 SgrSWplSISkbSgKDiCRP5vVQ4985+RQ/v9a10B4Ug+P5B5wGEgbG46NJHKBsZOt31T6xraVDdB8O
	 +neTWtR+HGte76RcuKLVvK+Zaz08CG1BSWZhqA+Aws55o4JcZ9ZKcC53MWZO1e9tp4l3l/8Z1qay
	 0lYp78tWVwgZOg1P5F8dN2GqMylxBakCoqD2pLFdC2AAsR4QZNhSCRlkGP4zlIwaNuZHiTWJ45sP
	 MhJ97uhhVeqA248nX/Rd8gstTuTjeHUIBNazKcfWsfvYlF4zFhEuGTEPZFwF6mKQr1hCC8aocPMx
	 VJEdHddPOwouXf1QbQ7PCh+7XKVzZ47FBrYeqRB4fRJTu156AMWfJTmCqMhfcmq6vIhCD/sAClwp
	 2JGUewgWGwH3dhh7He66MWFpbf8Azjfz0yvVdYLMql6ue8lFRJwFOYWV49USNRYc50T4MCcnYAC3
	 qLOfMnpium8Oic3TyAJFsTm0EWuXSLiiZWtDxMoev6xk24ibB4aw2V/4QdGN0YZLnZonhbj8TdAj
	 pOxLaQXxg4fTDXdcEm8culuoayYKi0E8MtbxI=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Cheng Lingfei <chenglingfei@foxmail.com>
Date: Wed, 26 Aug 2026 16:26:47 +0800
Subject: [PATCH v2] usb: gadget: goku_udc: fix kobject warning on probe
 failure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260826-b4-fix-usb-v2-1-e39f343aee71@foxmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBREr0L+2m/aQgm68h6GRVta+UaoaYFgS
 O9uwa3Ll5l5s0G0gWyEa7FBsAtF8mMGcSrA9Gp8WKQuMwgmataIGnWFjlaco0bDVeWYZLJrDOT
 BO9gcHbJ7++M466c1027YGz3FyYfP8bbwvfdXvHDkqNiFaalLWVbm5vw6KHqdjR+gTSl9AYgih
 iO4AAAA
X-Change-ID: 20260826-b4-fix-usb-c1a4f0505d8c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>, 
 Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+06ec7624018233e17113@syzkaller.appspotmail.com, 
 Cheng Lingfei <chenglingfei@foxmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787732826; l=7681;
 i=chenglingfei@foxmail.com; s=20260824; h=from:subject:message-id;
 bh=yK2SsuOYxKahXHqNlG7kVOss7VMYGKUjBTQF13/wjOQ=;
 b=o3SvYfsqzKkS2GXNiQIjYROstJioK2msNbKRTlfCEFs67Rqe9W9vGbxRX3wN4UQ+2kXwTs6Rc
 3esJ8n/r/6WBFDiX9nhbCg+8X0DKiTETtCOjzd3eUS88HJ7l0uk4ZAk
X-Developer-Key: i=chenglingfei@foxmail.com; a=ed25519;
 pk=jJFtzwUiUOhTRJNlFx9WjsWHIYGk49Br17a7AD8MH2I=

goku_probe() calls goku_remove() when hardware initialization fails, but
the gadget device is initialized only near the end of probe. As a result,
goku_remove() calls usb_del_gadget_udc(), which drops a reference to an
uninitialized gadget device and triggers a kobject warning.

Initialize the gadget device immediately after allocating the controller,
but add it only after all hardware resources have been acquired. Track the
gadget registration state so goku_remove() can safely clean up both partial
probe state and a fully initialized device.

Use the split gadget removal API and drop the final gadget reference only
after all hardware resources have been released. Obtain the controller from
the embedded gadget device in the release callback because driver data is
set on the PCI device rather than the gadget device.

The legacy diagnostic proc entry uses a single global name. This causes a
collision when more than one controller is probed. Replace it with a
per-device debugfs entry.

Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
Reported-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=06ec7624018233e17113
Tested-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/2026082616-glue-atlas-0cfd@gregkh
Assisted-by: Codex:gpt-5.6
Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
---
Changes in v2:
- Replace legacy procfs with per-device debugfs entries.
- Add Assisted-by: tag as requested.
- Link to v1: https://patch.msgid.link/20260826-b4-fix-usb-v1-1-a090b5b3534c@foxmail.com

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Felipe Balbi <balbi@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
To: Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/usb/gadget/udc/goku_udc.c | 74 +++++++++++++++++++++++++--------------
 drivers/usb/gadget/udc/goku_udc.h |  8 +++--
 2 files changed, 53 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
index ac2a984c2f87..e6941b9d0f6b 100644
--- a/drivers/usb/gadget/udc/goku_udc.c
+++ b/drivers/usb/gadget/udc/goku_udc.c
@@ -20,6 +20,8 @@
 // #define	VERBOSE		/* extra debug messages (success too) */
 // #define	USB_TRACE	/* packet-level success messages */
 
+#include <linux/container_of.h>
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -30,9 +32,9 @@
 #include <linux/timer.h>
 #include <linux/list.h>
 #include <linux/interrupt.h>
-#include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/device.h>
+#include <linux/usb.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/prefetch.h>
@@ -1050,9 +1052,7 @@ static inline const char *dmastr(void)
 		return "(dma IN)";
 }
 
-#ifdef CONFIG_USB_GADGET_DEBUG_FILES
-
-static const char proc_node_name [] = "driver/udc";
+#ifdef CONFIG_USB_GADGET_DEBUG_FS
 
 #define FOURBITS "%s%s%s%s"
 #define EIGHTBITS FOURBITS FOURBITS
@@ -1134,7 +1134,7 @@ static const char *udc_ep_status(u32 status)
 	return "?";
 }
 
-static int udc_proc_read(struct seq_file *m, void *v)
+static int goku_debugfs_show(struct seq_file *m, void *v)
 {
 	struct goku_udc			*dev = m->private;
 	struct goku_udc_regs __iomem	*regs = dev->regs;
@@ -1246,7 +1246,33 @@ static int udc_proc_read(struct seq_file *m, void *v)
 	local_irq_restore(flags);
 	return 0;
 }
-#endif	/* CONFIG_USB_GADGET_DEBUG_FILES */
+DEFINE_SHOW_ATTRIBUTE(goku_debugfs);
+
+static void goku_debugfs_create(struct goku_udc *dev)
+{
+	dev->debugfs_root =
+		debugfs_create_dir(dev_name(&dev->pdev->dev), usb_debug_root);
+	debugfs_create_file("goku_udc_state", 0400, dev->debugfs_root, dev,
+			    &goku_debugfs_fops);
+}
+
+static void goku_debugfs_remove(struct goku_udc *dev)
+{
+	debugfs_remove_recursive(dev->debugfs_root);
+	dev->debugfs_root = NULL;
+}
+
+#else
+
+static inline void goku_debugfs_create(struct goku_udc *dev)
+{
+}
+
+static inline void goku_debugfs_remove(struct goku_udc *dev)
+{
+}
+
+#endif	/* CONFIG_USB_GADGET_DEBUG_FS */
 
 /*-------------------------------------------------------------------------*/
 
@@ -1701,7 +1727,7 @@ static irqreturn_t goku_irq(int irq, void *_dev)
 
 static void gadget_release(struct device *_dev)
 {
-	struct goku_udc	*dev = dev_get_drvdata(_dev);
+	struct goku_udc *dev = container_of(_dev, struct goku_udc, gadget.dev);
 
 	kfree(dev);
 }
@@ -1714,13 +1740,12 @@ static void goku_remove(struct pci_dev *pdev)
 
 	DBG(dev, "%s\n", __func__);
 
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 
 	BUG_ON(dev->driver);
 
-#ifdef CONFIG_USB_GADGET_DEBUG_FILES
-	remove_proc_entry(proc_node_name, NULL);
-#endif
+	goku_debugfs_remove(dev);
 	if (dev->regs)
 		udc_reset(dev);
 	if (dev->got_irq)
@@ -1736,6 +1761,8 @@ static void goku_remove(struct pci_dev *pdev)
 	dev->regs = NULL;
 
 	INFO(dev, "unbind\n");
+
+	usb_put_gadget(&dev->gadget);
 }
 
 /* wrap this driver around the specified pci device, but
@@ -1751,16 +1778,13 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	if (!pdev->irq) {
 		printk(KERN_ERR "Check PCI %s IRQ setup!\n", pci_name(pdev));
-		retval = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
 	/* alloc, and start init */
 	dev = kzalloc_obj(*dev);
-	if (!dev) {
-		retval = -ENOMEM;
-		goto err;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	pci_set_drvdata(pdev, dev);
 	spin_lock_init(&dev->lock);
@@ -1771,6 +1795,8 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* the "gadget" abstracts/virtualizes the controller */
 	dev->gadget.name = driver_name;
 
+	usb_initialize_gadget(&pdev->dev, &dev->gadget, gadget_release);
+
 	/* now all the pci goodies ... */
 	retval = pci_enable_device(pdev);
 	if (retval < 0) {
@@ -1814,22 +1840,16 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		pci_set_master(pdev);
 
 
-#ifdef CONFIG_USB_GADGET_DEBUG_FILES
-	proc_create_single_data(proc_node_name, 0, NULL, udc_proc_read, dev);
-#endif
-
-	retval = usb_add_gadget_udc_release(&pdev->dev, &dev->gadget,
-			gadget_release);
+	retval = usb_add_gadget(&dev->gadget);
 	if (retval)
 		goto err;
+	dev->added = 1;
+	goku_debugfs_create(dev);
 
 	return 0;
 
 err:
-	if (dev)
-		goku_remove (pdev);
-	/* gadget_release is not registered yet, kfree explicitly */
-	kfree(dev);
+	goku_remove(pdev);
 	return retval;
 }
 
diff --git a/drivers/usb/gadget/udc/goku_udc.h b/drivers/usb/gadget/udc/goku_udc.h
index 70023d401079..ed39e7080536 100644
--- a/drivers/usb/gadget/udc/goku_udc.h
+++ b/drivers/usb/gadget/udc/goku_udc.h
@@ -247,7 +247,12 @@ struct goku_udc {
 					got_region:1,
 					req_config:1,
 					configured:1,
-					enabled:1;
+					enabled:1,
+					added:1;
+
+#ifdef CONFIG_USB_GADGET_DEBUG_FS
+	struct dentry			*debugfs_root;
+#endif
 
 	/* pci state used to access those endpoints */
 	struct pci_dev			*pdev;
@@ -286,4 +291,3 @@ struct goku_udc {
 	xprintk(dev , KERN_WARNING , fmt , ## args)
 #define INFO(dev,fmt,args...) \
 	xprintk(dev , KERN_INFO , fmt , ## args)
-

---
base-commit: 3aa1dcaa4f6f5ae08936491e08bd456f331f2d40
change-id: 20260826-b4-fix-usb-c1a4f0505d8c

Best regards,
--  
Cheng Lingfei <chenglingfei@foxmail.com>

