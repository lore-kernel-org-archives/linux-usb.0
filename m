Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D798B3BADB7;
	Wed, 26 Aug 2026 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735717; cv=none; b=X5dbXc8UzGKZ+u220SLuiwMSfrnzmfOEQUIaDUnHVZ5La02gwZh/O1gWR+tK6oZ4ipLfa5aTEZvuXasES51S2snr89AIf7jGX9nq4o6o8JaGESP3bFc9fB2qyOzyFfo9GyzK19xERnoR6N/7NEpIOrN0pKnTxIlaGrOnpUmOdPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735717; c=relaxed/simple;
	bh=CsYghwwh9fnhiBRcCRq1GoF54LorAw/a2y4hXWURchA=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:References:
	 In-Reply-To:To:Cc; b=YknxatpMoonyBYTVMabobG44iP9QCX7CXzZqfGWx5BMKa8+L1JOptIQgFgnDnW7F4FBU8rZaRKF3U0MN9OM9fKTzP9JsLdoSmfYxz03HxMebYly2vpMKl+BuWNrThMkLIPlnELnyCX/PR1YdL9xUrrWFVBiuv8QJxfC2MC0ztw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=HTotRM9f; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="HTotRM9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1787735710;
	bh=heG+AiZ60Iipw6Q7xWnmFyhG9xzhVZooxNRh3QBuA40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HTotRM9f4KdH8rwi80af4U/vJ0obu+rJsRy1RHOVwiTds2avUVRMB/71N8EjCjzc9
	 xE+/YIn59V2XF4caaoWsxRp94HfIQRv2Pzmx5IuF0MQlRyrN/Q4oZsUSS6mhAT9Ki2
	 EyRUQ+xTzfAx72fr3wyrFLdZUmQuYitk1RYjysH0=
Received: from [127.0.1.1] ([2001:da8:283:e049::9:8de6])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3C73C662; Wed, 26 Aug 2026 17:15:07 +0800
X-QQ-mid: xmsmtpt1787735709tkvulifvh
Message-ID: <tencent_D7673CCE71B03F2C90CD60873AB4A245D808@qq.com>
X-QQ-XMAILINFO: OAavc0uSY/c2SJEDxMk6LOOyV2yPpmYKAdq3z9k3xFAfKn1FXGLLcXJGT7rwD7
	 92Ch2rkrkZYHlQ0FSdfOi0i1c/nASUIoaSNm2F1r1sEelZaR0QcTQv/n0FxuvwZDoomSVmwgqqNo
	 anFQzBmMbaEOU6KY2Jqrs4vgPio5rViMEyYRGx1/Erp5LsYTDs/fip0GwpAtdCF087gEjB1IRDZL
	 0626WJ8Ml6HJaaaf1GxEB4tQjJssizFP1UDaCKUb+nEERDXeWELB6OX/GbWb8O9ul9MbAf3+uedZ
	 4/fiSoISqOWWxQh6gyCmMziu4Y4T+lXuC9SOPtKCj71QhG/RrS8h8OqiJ524u+oX6TBGRuuIhjGF
	 ukbjCdmlx0AFl5LzD+mH+S66dusO6R+IkHCRYPexgH6+EXhzxUGeomdWfYTKwJgzj3lIRsLZt9Af
	 21MnK8gJ8Ak43CeMURVv3ZyULsw8UM+az3PYsbRu4dL5c94Q/aKB4178oHgTj9dm89UPdAj2V3sk
	 AjkvLIkfXsZGOjZawOICjQtS+8w9b2pZFuuB9WB7qY9nT00IpThnLO7WeQ/TH2JGLV4lBokIfkUn
	 VvsyT7Rkw9vMGuaNfCwnSfDaeDAa3z9kdkT3QoNfcY1v5z8FM3kbV94eJsZstzR2J/H7EPwbwZXn
	 Cm+kCN8lu8pZfUeKPXHl/KuJ2LTSkVtq+8TZ6lt00z1NBhdsLhozKhd7QHIdnvMjjWosTm3i8SWm
	 hLzbqe/OoWzBcuSaVweNDkWdIIGFNrrEEnaCKXmHZPHseL+7SaShSPXyO1vr+uK821x7UOua5Z/n
	 nLo4PZUK/hZowwbRRy4rm97mtGMhICDp1MVKs3KATuwE6e5IWwxR7He542ucQaVrqZcBV1QS3elf
	 FdURtQPz1kNwEoCSltg/5m0SY6fiHT3QJCuPF76EbbRr2jL5PS2wSkV53CF2ihTVHAYT30ptha7f
	 gPFgHyQrrIOKorY7fzoF65QoZZAIkCkj18TnOplS4PCLWnj2Yq2gBLFW3izG4iXF4eOew365zE68
	 lkt1Hjyc9SIoFKH3rNItQaXsmKe/yXMqAx6K7uX7sQQeQMBcjOlxDEQCpV7uUfO8PYPVYmfK0wug
	 FVJ0+P+n9e1JF1o6l6++jLiR7D+eek8Crq75kgKqammS/Yj1wFDik0N7z+Usjz8HeOu8CCf1ukMq
	 3iofg91I5YvkOs6ssAwPXMiz0dCRRd3slWd0Fg7T9aLiAhQPS436NvYXIVEGXHR9pcngc=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Cheng Lingfei <chenglingfei@foxmail.com>
Date: Wed, 26 Aug 2026 17:15:06 +0800
Subject: [PATCH v3 1/2] usb: gadget: goku_udc: move debug output to debugfs
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260826-b4-fix-usb-v3-1-b28366e817f3@foxmail.com>
References: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
In-Reply-To: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>, 
 Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cheng Lingfei <chenglingfei@foxmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735707; l=4454;
 i=chenglingfei@foxmail.com; s=20260824; h=from:subject:message-id;
 bh=CsYghwwh9fnhiBRcCRq1GoF54LorAw/a2y4hXWURchA=;
 b=Z27kxlYRrI8LjK+LrfOnqZaFiKG7Im3voIbViT3hMxRRCiDBYVGkloLQc8kImNF6ozGeCYiQz
 dzlDxT/PiPmAId/El+GdLYFex87xg1y7I7EhXJu34iX7+8YS9k5Z5Up
X-Developer-Key: i=chenglingfei@foxmail.com; a=ed25519;
 pk=jJFtzwUiUOhTRJNlFx9WjsWHIYGk49Br17a7AD8MH2I=

goku_udc exposes diagnostic state through /proc/driver/udc. The single
global proc entry collides when more than one controller is probed and
triggers a proc registration warning.

The data is intended only for debugging and is not a userspace ABI. Move it
under the USB debugfs root and use the PCI device name for a per-device
directory. Create the file only after the UDC has been registered.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/2026082616-glue-atlas-0cfd@gregkh
Assisted-by: Codex:gpt-5.6
Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
---
 drivers/usb/gadget/udc/goku_udc.c | 47 +++++++++++++++++++++++++++------------
 drivers/usb/gadget/udc/goku_udc.h |  5 ++++-
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
index ac2a984c2f87..5ad8633f522b 100644
--- a/drivers/usb/gadget/udc/goku_udc.c
+++ b/drivers/usb/gadget/udc/goku_udc.c
@@ -20,6 +20,7 @@
 // #define	VERBOSE		/* extra debug messages (success too) */
 // #define	USB_TRACE	/* packet-level success messages */
 
+#include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -30,9 +31,9 @@
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
@@ -1050,9 +1051,7 @@ static inline const char *dmastr(void)
 		return "(dma IN)";
 }
 
-#ifdef CONFIG_USB_GADGET_DEBUG_FILES
-
-static const char proc_node_name [] = "driver/udc";
+#ifdef CONFIG_USB_GADGET_DEBUG_FS
 
 #define FOURBITS "%s%s%s%s"
 #define EIGHTBITS FOURBITS FOURBITS
@@ -1134,7 +1133,7 @@ static const char *udc_ep_status(u32 status)
 	return "?";
 }
 
-static int udc_proc_read(struct seq_file *m, void *v)
+static int goku_debugfs_show(struct seq_file *m, void *v)
 {
 	struct goku_udc			*dev = m->private;
 	struct goku_udc_regs __iomem	*regs = dev->regs;
@@ -1246,7 +1245,33 @@ static int udc_proc_read(struct seq_file *m, void *v)
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
 
@@ -1718,9 +1743,7 @@ static void goku_remove(struct pci_dev *pdev)
 
 	BUG_ON(dev->driver);
 
-#ifdef CONFIG_USB_GADGET_DEBUG_FILES
-	remove_proc_entry(proc_node_name, NULL);
-#endif
+	goku_debugfs_remove(dev);
 	if (dev->regs)
 		udc_reset(dev);
 	if (dev->got_irq)
@@ -1813,15 +1836,11 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (use_dma)
 		pci_set_master(pdev);
 
-
-#ifdef CONFIG_USB_GADGET_DEBUG_FILES
-	proc_create_single_data(proc_node_name, 0, NULL, udc_proc_read, dev);
-#endif
-
 	retval = usb_add_gadget_udc_release(&pdev->dev, &dev->gadget,
 			gadget_release);
 	if (retval)
 		goto err;
+	goku_debugfs_create(dev);
 
 	return 0;
 
diff --git a/drivers/usb/gadget/udc/goku_udc.h b/drivers/usb/gadget/udc/goku_udc.h
index 70023d401079..4885b1dae928 100644
--- a/drivers/usb/gadget/udc/goku_udc.h
+++ b/drivers/usb/gadget/udc/goku_udc.h
@@ -249,6 +249,10 @@ struct goku_udc {
 					configured:1,
 					enabled:1;
 
+#ifdef CONFIG_USB_GADGET_DEBUG_FS
+	struct dentry			*debugfs_root;
+#endif
+
 	/* pci state used to access those endpoints */
 	struct pci_dev			*pdev;
 	struct goku_udc_regs __iomem	*regs;
@@ -286,4 +290,3 @@ struct goku_udc {
 	xprintk(dev , KERN_WARNING , fmt , ## args)
 #define INFO(dev,fmt,args...) \
 	xprintk(dev , KERN_INFO , fmt , ## args)
-

-- 
2.53.0

