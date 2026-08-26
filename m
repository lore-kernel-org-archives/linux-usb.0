Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C003BADB7;
	Wed, 26 Aug 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735797; cv=none; b=jhE0ME4qMntBzCRTT4Cr9xqR8IiYYvVz7DQBbuO6tBMxrHJffm/tVeopad5O5Y1LiNMpsOS0gRpHyR6uTNpHSyhSs4ZEyEoIB5DeakouWbVjt5GkTHVoIPVGdxTtdJTfuTS+pswu4A+rYPFDdoM1atUTzR9r8Gbgdiv22ydAF9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735797; c=relaxed/simple;
	bh=6qZO0aB78g49wpMdMVXAbO7zofFk2G3JmMSg2bKrjZ4=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:References:
	 In-Reply-To:To:Cc; b=BYkw9wWUDH5eV0iyldPfFdFST/hRhNDK18FRHLesriPZdMROSbZ942oxlOCEfCzhNhWIYvGNgriHRQjRH4TMeuql6P5q94DPZk8xjwCmu+hUHW4d4NqVPLYRRv8N/JPBErwFhTtMOzuDIdod7rpEpMkMOGMjJthZMOUpOhMLKUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=vuj5+Thh; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="vuj5+Thh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1787735783;
	bh=wU2FH5GaIRpo8bfgl68ZKO7IJAfXauJVmlb20GLowOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=vuj5+ThhxuSwqjRe7QkIk5EuM8UlMsTxBKsDw43C8AeCGejjRuOtCb0OGMq9LlqLH
	 yUdv3UkG9aHubTCFUPo69C8ZZH8gqoDrSBbt0rJYHQ9Ok0ha7am2emuOOzbXJNyegx
	 uJ89HViHcVD2O9WEagvt9/D4UZMHBgF0E7CO7UBg=
Received: from [127.0.1.1] ([2001:da8:283:e049::9:8de6])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3C73C662; Wed, 26 Aug 2026 17:15:07 +0800
X-QQ-mid: xmsmtpt1787735710ty84556xk
Message-ID: <tencent_79E338821F4FC825B0149D5951476C189E07@qq.com>
X-QQ-XMAILINFO: NNbrgP+FE+VzPei9M+vzvCIHh/W8rCt13otVYBEB4SAZwz0Udd0nHfw0jLll90
	 sLTWLnsAc7UMFjEFsZHlZqJ+x6TNZQbmWx5gA/dx2U6ldiPjKk3andiSxsDdboo6W5EOs1cIfNCp
	 arXWjIpLsdQCsVrK84vMYIuLdrFDi3RaQyP55acwZWGfA4VqU6IDe6aCy/pkaNTRdJHy00H7H8WF
	 HtfuPxEsqxHahW1TsNFzM4DQhizxGY6xA17tt1EKIrjl1PhoLz4z6OdZqXGdKwt+fnyBLxnZNNUs
	 zhxDEEGxKkbBwRQou/yj6vfYl9UEXG92FcSaT4VDqgZ8KuHf2ifauhFIdcEkOlnsrhaOYRq6+dno
	 bXpmQgijjuZheltz6t/635OeL+nv+HE6DZeGWg+gxftRAB/bUIujhSP4faj3TJeIZx9/cxhD8niQ
	 J7VpaNpVwnWADTUr0d8Ofh6oJ0CUPqEnMAs3XYCiVIUsBuNlWR3Bcx823VVzVgkCh9Kd2hdinVa8
	 0hgTIXyCZlwZLU5SqjQUkmXCsRMYprCD8ax2RwuA2NNkL22c/GEBQgJtqKRH99YMXdC1oNJ/MDEB
	 TlEOdcpsk0or/vL2sknjNz1VfjXLMLzKjtWHiyMbCffNZikylG+WABm0q0uqBnYbBQqRVRYrOJwz
	 ykQWDQKLHKQ+e2+iXzR/dmOoG6tXJUzJXeIaeVayGWT9CghqhT1cgnMTK7Y1q6pSpYGjkAaPDFjv
	 d0XFNKSCO0NCpSYr/p6ixwfwV5pKR+441vh7D5WRoKA52FAz2X58ZD5wHueUZKF34U0iJCdY2KOv
	 nlcAEhiHYQEQfoBmSICSSiDBGLaEYvesuZM9PZO7FfvzzXO0syNnYxGxrSyGj4noQEeAYgie4UcO
	 UsIOL/aqgy5sPj0I4++8qOIFXmSDLa9g9HjUvJOIhUlK4qluXpQtk/fnvv61/OTLaYKimXJoBKbF
	 seAzP1j8FuCrXt050nC8nvj0jJtPRoZeOx6BxVkxE0J08v9rlvvXYxbbceTwBoG0KVonSmVCmB3I
	 nl+mkF6y+4Ot+j6gQ4iyUG0P5FaTw7k9bIjsaL2GUlGmQwTgeHGgfzEdaUpI8DKTpqs/jITEB/zv
	 Oof3K5Z6tlqTC4vn3KX79Y4m8zk7w3DqpyhimsmczTC97l8Q0Dkl+z9o0JUTfxN+pU3jf3cKc9IW
	 d4Qfxe+9KV1A1vziiELQ2FQ8joB7qiJilu3kYkgnXbfatMvHYeZSMnJGLBzWB/8JYzfFpc1fNUDG
	 4hwA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Cheng Lingfei <chenglingfei@foxmail.com>
Date: Wed, 26 Aug 2026 17:15:07 +0800
Subject: [PATCH v3 2/2] usb: gadget: goku_udc: fix kobject warning on probe
 failure
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260826-b4-fix-usb-v3-2-b28366e817f3@foxmail.com>
References: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
In-Reply-To: <20260826-b4-fix-usb-v3-0-b28366e817f3@foxmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>, 
 Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cheng Lingfei <chenglingfei@foxmail.com>, 
 syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735707; l=4387;
 i=chenglingfei@foxmail.com; s=20260824; h=from:subject:message-id;
 bh=6qZO0aB78g49wpMdMVXAbO7zofFk2G3JmMSg2bKrjZ4=;
 b=d29vP7sSv4hnmAByjthjPgl43PvEUd34N2NFziRHuiM5e5RNibKQLIzr/YRpE4G3j9CWGp7CC
 jNTZL8YmMX8B19dp6Ou03y3snKvjhJSXTiK/RT+WO/W8GFhg14Ri3e+
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

Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
Reported-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=06ec7624018233e17113
Tested-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
Assisted-by: Codex:gpt-5.6
Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
---
 drivers/usb/gadget/udc/goku_udc.c | 28 ++++++++++++++--------------
 drivers/usb/gadget/udc/goku_udc.h |  3 ++-
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
index 5ad8633f522b..615cc6b8f354 100644
--- a/drivers/usb/gadget/udc/goku_udc.c
+++ b/drivers/usb/gadget/udc/goku_udc.c
@@ -20,6 +20,7 @@
 // #define	VERBOSE		/* extra debug messages (success too) */
 // #define	USB_TRACE	/* packet-level success messages */
 
+#include <linux/container_of.h>
 #include <linux/debugfs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -1726,7 +1727,7 @@ static irqreturn_t goku_irq(int irq, void *_dev)
 
 static void gadget_release(struct device *_dev)
 {
-	struct goku_udc	*dev = dev_get_drvdata(_dev);
+	struct goku_udc *dev = container_of(_dev, struct goku_udc, gadget.dev);
 
 	kfree(dev);
 }
@@ -1739,7 +1740,8 @@ static void goku_remove(struct pci_dev *pdev)
 
 	DBG(dev, "%s\n", __func__);
 
-	usb_del_gadget_udc(&dev->gadget);
+	if (dev->added)
+		usb_del_gadget(&dev->gadget);
 
 	BUG_ON(dev->driver);
 
@@ -1759,6 +1761,8 @@ static void goku_remove(struct pci_dev *pdev)
 	dev->regs = NULL;
 
 	INFO(dev, "unbind\n");
+
+	usb_put_gadget(&dev->gadget);
 }
 
 /* wrap this driver around the specified pci device, but
@@ -1774,16 +1778,13 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
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
@@ -1794,6 +1795,8 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* the "gadget" abstracts/virtualizes the controller */
 	dev->gadget.name = driver_name;
 
+	usb_initialize_gadget(&pdev->dev, &dev->gadget, gadget_release);
+
 	/* now all the pci goodies ... */
 	retval = pci_enable_device(pdev);
 	if (retval < 0) {
@@ -1836,19 +1839,16 @@ static int goku_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (use_dma)
 		pci_set_master(pdev);
 
-	retval = usb_add_gadget_udc_release(&pdev->dev, &dev->gadget,
-			gadget_release);
+	retval = usb_add_gadget(&dev->gadget);
 	if (retval)
 		goto err;
+	dev->added = 1;
 	goku_debugfs_create(dev);
 
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
index 4885b1dae928..ed39e7080536 100644
--- a/drivers/usb/gadget/udc/goku_udc.h
+++ b/drivers/usb/gadget/udc/goku_udc.h
@@ -247,7 +247,8 @@ struct goku_udc {
 					got_region:1,
 					req_config:1,
 					configured:1,
-					enabled:1;
+					enabled:1,
+					added:1;
 
 #ifdef CONFIG_USB_GADGET_DEBUG_FS
 	struct dentry			*debugfs_root;

-- 
2.53.0

