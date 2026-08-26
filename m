Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B44430BBBF;
	Wed, 26 Aug 2026 03:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787715371; cv=none; b=ipGGqyrWxnjM564oxNFzUgTlOY82ENSSq90G9dmYIdgEBdbfOQFXTSJRgHCuCdNSVMTi1Nk8NHV0Kuti4kAuShzy7eV3N2hsd3LTn6g7GSEztBV/XUTAmMjg5z90hCcOVTHkx4yHkiL/MQBdfhe5oJOsyJoOJ7vVPPg9+x8HayI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787715371; c=relaxed/simple;
	bh=pT2kRI7nk6B0XNhqRiDni/PI606Buu039BwlmwG5YOo=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=Hn4zzkns6MMJf4Sv0UHMNh18Nh4StFkxzUBeHo+kwklUz74u3L/Rv48xzUjniw6jfgbJ0bdMLgU4o1APlMx7qqJAa5PEUsrZjYuOcZ3ddrfEFfDF52bIHgr2rujiyZuebcp3bJyvhTRRntnwbIAmPfudirUz66V6m5mC+HhfSiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=s8wRoEFi; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="s8wRoEFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1787715362;
	bh=faAhhzYjT9hlzVBDEPU+ZQBSgld45YbwHqgeyUCtdoE=;
	h=From:Date:Subject:To:Cc;
	b=s8wRoEFi44oxnJwnS3x13JPXNnvN9ke3Zhubh6vuy+PSr3GAoKfOgHUQByA/GKo/I
	 JFkRdCAzmiLvngFvEDA2LJMH/lBiq4mxUv52z0DXLeMKigebOAxk0yKJtodB1Py803
	 M2TKJGaUkYkgXyBUQrhbvktl7iX9VD+3KrGmzLZM=
Received: from [127.0.1.1] ([2001:da8:283:e049::9:8de6])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 8FB9D2AD; Wed, 26 Aug 2026 11:35:59 +0800
X-QQ-mid: xmsmtpt1787715359tf6r36bqe
Message-ID: <tencent_0AE8C419FE6042BA8081E98C88BA604FF00A@qq.com>
X-QQ-XMAILINFO: Nm45YswcjhU8bQCgp1hnIzfCrWXwKqomSlCcYDYh7lKenkoNffiGmJIcFXivbZ
	 dQ3wlH89I4geETZZP7DshwO4MUMmQ5QH+zvsNWQHmKxCZKA7s2/Jd8iyaB7zVw91rBegKXolCNka
	 H+81xiurhkdB7tnRslKtaFEGEZRdaa1rMZiTUJLYhuGbjIGNfCyAArg+0e/GyS6S4+aVINWf0HFP
	 h7r43iw68q/lyhG24McI1wk11HGE3L76boE6Y0nwLxGuHZSEbTEpPKqbfZJH/OPYGRoJff8mrh07
	 66omza2nL2mus3zO2mqxpmHsBfp8RiAE5bEFafgRkDNe9Zj1soHiZjVglnrT0lJHZnOpD0xrUuAu
	 IFbasennI2wlByf+wuttBcTSPRzgFPq3yy+Vp/OcgaIGT6MHHUZHm5IM2cA4t0stZOSKs8txNmas
	 Bu28VvO6ZZBYRByeIIpBevBMyQR8CRJFCbhvP/V2TuCP9auzlE3Vl+/g/ISVrq5w+laTFZkRgJMr
	 nyyN8O0JmiKNT+zGzdWiYhns7jArMPj0GSoA10xdrTltH5JrQ1tOrGK71Y3nF97neexeQsfGLsnU
	 o3Ez/BoLFTDVfHkoLC1Tgk9FHcX9he6cE2uyOllq6XvLTt+t6jlqIe0Wt59Ox989rfVhfIZqsUTt
	 vQ8ErjF9jAXnYdHtgFeqcfGz4Sz07LVugaj1yNVisiTaN3noAfKuNREoyVJVLdC1mkOe1MkPHY2K
	 keZvgVTBwp00ulV+Xziyix+xHu3ZYLKgX++3AoP0eY8OtXzQvh3Cu0GEjQIHTND1DcPRG5R/U89k
	 XTztosxw24T9kwf52IZ9yJR/eelXBMfCmQ73Ze1XTru6WgsWY8z7Y+Dlo9t7BgCXvpMBfT8G8kek
	 KhqhBKHRLCpc61UInUE2XCcAuCCljkeG1op886JZgbwVujlDD21EUc/yMY9nttSuSn5vYRmETZoO
	 ln8NIuh1yR7Eq2xFdPpCteDNRFudlTTt+Y46rLJkhEO/0GS+BWG1SCcWOdXoqxHqyFlVOSxFn+W+
	 peDzmWs3nad4OoJJzM4itZ6XToaEkk8PRDBQ3ZZ/l74o9be3gOiExQM0h2YGxoSkCOQtlmyiT5Xn
	 s2SX7Nck5FQur5hVUSXsM9WA1wnaQYQGxnG+xAsOYOC0D9yNSE1LLhdh/iG9lkWtDE6sO3224ts3
	 FqhC1mm1plb0lMIaMskz1FvAFPSH+fhHfAD/k=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Cheng Lingfei <chenglingfei@foxmail.com>
Date: Wed, 26 Aug 2026 11:35:58 +0800
Subject: [PATCH] usb: gadget: goku_udc: fix kobject warning on probe
 failure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260826-b4-fix-usb-v1-1-a090b5b3534c@foxmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4as0szZJ25SIq4iF1mAskA4iEXdXL
 L+8vP8CocgkUKkLIh0svMwJJlMQxnYeCLlLBqttoUtboHfY84m7eAymdb3Odd6VAdJhjZSmL1Y
 3v2X3E4XtLcB9P5+emKluAAAA
X-Change-ID: 20260826-b4-fix-usb-c1a4f0505d8c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>, 
 Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+06ec7624018233e17113@syzkaller.appspotmail.com, 
 Cheng Lingfei <chenglingfei@foxmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787715359; l=5823;
 i=chenglingfei@foxmail.com; s=20260824; h=from:subject:message-id;
 bh=pT2kRI7nk6B0XNhqRiDni/PI606Buu039BwlmwG5YOo=;
 b=gnbyZcdUfyyF+SR4b2V5Jn6gbP4uHpvOlXlUyg6ZqlT9mftWxW0zsm/06r/dwVvojasklRmkn
 JKKlFskFaN9Agnf2pSpG+o5doFo0TcAzEr8comhp7EjWRsmlkGC1Glj
X-Developer-Key: i=chenglingfei@foxmail.com; a=ed25519;
 pk=jJFtzwUiUOhTRJNlFx9WjsWHIYGk49Br17a7AD8MH2I=

goku_probe() calls goku_remove() when hardware initialization fails, but
the gadget device is initialized only near the end of probe. As a result,
goku_remove() calls usb_del_gadget_udc(), which drops a reference to an
uninitialized gadget device and triggers a kobject warning.

Initialize the gadget device immediately after allocating the controller,
but add it only after all hardware resources have been acquired. Track the
gadget and proc entry registration state so goku_remove() can safely clean
up both partial probe state and a fully initialized device.

Use the split gadget removal API and drop the final gadget reference only
after all hardware resources have been released.

Also obtain the controller from the embedded gadget device in the release
callback. Driver data is set on the PCI device rather than the gadget
device, so using dev_get_drvdata() there fails to free the controller.

Use a per-device name for the debug proc entry so that multiple
controllers can be registered without colliding on /proc/driver/udc.

Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
Reported-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=06ec7624018233e17113
Tested-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com

Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
---
 drivers/usb/gadget/udc/goku_udc.c | 40 +++++++++++++++++++++------------------
 drivers/usb/gadget/udc/goku_udc.h |  8 ++++++--
 2 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
index ac2a984c2f87..7af6da63e83b 100644
--- a/drivers/usb/gadget/udc/goku_udc.c
+++ b/drivers/usb/gadget/udc/goku_udc.c
@@ -20,6 +20,7 @@
 // #define	VERBOSE		/* extra debug messages (success too) */
 // #define	USB_TRACE	/* packet-level success messages */
 
+#include <linux/container_of.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -1052,8 +1053,6 @@ static inline const char *dmastr(void)
 
 #ifdef CONFIG_USB_GADGET_DEBUG_FILES
 
-static const char proc_node_name [] = "driver/udc";
-
 #define FOURBITS "%s%s%s%s"
 #define EIGHTBITS FOURBITS FOURBITS
 
@@ -1701,7 +1700,7 @@ static irqreturn_t goku_irq(int irq, void *_dev)
 
 static void gadget_release(struct device *_dev)
 {
-	struct goku_udc	*dev = dev_get_drvdata(_dev);
+	struct goku_udc *dev = container_of(_dev, struct goku_udc, gadget.dev);
 
 	kfree(dev);
 }
@@ -1714,12 +1713,13 @@ static void goku_remove(struct pci_dev *pdev)
 
 	DBG(dev, "%s\n", __func__);
 
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 
 	BUG_ON(dev->driver);
 
 #ifdef CONFIG_USB_GADGET_DEBUG_FILES
-	remove_proc_entry(proc_node_name, NULL);
+	proc_remove(dev->proc_entry);
 #endif
 	if (dev->regs)
 		udc_reset(dev);
@@ -1736,6 +1736,8 @@ static void goku_remove(struct pci_dev *pdev)
 	dev->regs = NULL;
 
 	INFO(dev, "unbind\n");
+
+	usb_put_gadget(&dev->gadget);
 }
 
 /* wrap this driver around the specified pci device, but
@@ -1748,19 +1750,19 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	unsigned long		resource, len;
 	void __iomem		*base = NULL;
 	int			retval;
+#ifdef CONFIG_USB_GADGET_DEBUG_FILES
+	char			proc_node_name[64];
+#endif
 
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
@@ -1771,6 +1773,8 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* the "gadget" abstracts/virtualizes the controller */
 	dev->gadget.name = driver_name;
 
+	usb_initialize_gadget(&pdev->dev, &dev->gadget, gadget_release);
+
 	/* now all the pci goodies ... */
 	retval = pci_enable_device(pdev);
 	if (retval < 0) {
@@ -1815,21 +1819,21 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 
 #ifdef CONFIG_USB_GADGET_DEBUG_FILES
-	proc_create_single_data(proc_node_name, 0, NULL, udc_proc_read, dev);
+	snprintf(proc_node_name, sizeof(proc_node_name), "driver/goku_udc-%s",
+		 pci_name(pdev));
+	dev->proc_entry = proc_create_single_data(proc_node_name, 0, NULL,
+						  udc_proc_read, dev);
 #endif
 
-	retval = usb_add_gadget_udc_release(&pdev->dev, &dev->gadget,
-			gadget_release);
+	retval = usb_add_gadget(&dev->gadget);
 	if (retval)
 		goto err;
+	dev->added = 1;
 
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
index 70023d401079..0ca2d49d25ba 100644
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
+#ifdef CONFIG_USB_GADGET_DEBUG_FILES
+	struct proc_dir_entry		*proc_entry;
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

