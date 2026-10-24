Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792867058;
	b=GW83/Ls+6ldg/5RE4cZoJf/KIpk4G5VRCPeWQeQnQbyd8jjpPryZ95ZfSJu90Nf5lviK
	 2v228jyd81vGWsnNMab7XjNihQqlEbJQWVyPw62/N71fn9FFVWT/02Gsh1XFmnuLzCNoa
	 NmdbiQhzSJisnUZuid3W9YQegGie1BrL40JpfdXJG9FTCBUW35W13UOgr03s19VTNM1oP
	 zf1+eXb0K2XB/GPRF2ej5836QZ3pbjDBywoLJZgc3exg+5dlpqfSOPRPpAxHZsXosB47o
	 XH0jOk17oezSQqk3ntru5sNoY8kdLXQOkR1Mz89bLnDpEjByU2zpvs5k25XJ0bGy5mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792867058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9kG33+vND2Vxi7z7pWua9Yb7mC6lR8Mn3eWvlvS93PQ=;
	b=YD3r4KnUfgNheQMBweLQ4lRk/onJUOR2rXXWzGz5wLotsHC+P21B6U41aBAudDrgVEVz
	 NDOUINduTjwQihaM7QYhDXxWTAoCRV4WA6s/wePihU7mcR2LSUyBX/fQ7CfQ2zbzy4nv/
	 GF5s0trnV9iRB5Mg5vhc9hoYvDv3jzG/C/XLPrs0NmH6ePXgCiwp/jo4CEI47bczpA0nj
	 K3+Z0i49/3S1zWcmJL4LkyuQY/zz3msZVQHkDejV4YIULPGPxpBwAzzy0+meyZbdvg+ji
	 ZRfne3Pm0J0FzD/UOPDv+8YRpFQIxh5r0SwwrtkasIgccxYnknD2GyY8S2S83mQOhsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCEVNksB;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E757606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 18:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E757606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GCEVNksB
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso1479474e87.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 11:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792867056; x=1793471856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9kG33+vND2Vxi7z7pWua9Yb7mC6lR8Mn3eWvlvS93PQ=;
        b=GCEVNksBh8Kd9atM5BrIoYWs55GIfI23ilBmuBNUyl3IBSB2mE2zFKkW6iI2zyrc0X
         dfljKq5O2B/qli0X8TjPaW1Tu59kWGK78oG03PXlh1VYponQn3M2zAKq6hOeQzdT0Du2
         4xMZm2/6fo+CmJWOpkJYGkxtoulr3r0a9dfmu7ZzSrvs86ivPS30ooaV1Z9GF51gfRUA
         d5VZxGdM3EoeG42UlmMC/O/ld3g+owiG4nz73n4tOuD5qER9+W9wN+IL4idYE0RPlzsQ
         +7OJNtyrN9k7Rqf5HpQ1t7y00PwJbZuPpW9Ey/xqZ2BeqzL5DoJLANEX3M+Q0T5XXCS6
         s5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792867056; x=1793471856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9kG33+vND2Vxi7z7pWua9Yb7mC6lR8Mn3eWvlvS93PQ=;
        b=Q4QE/hHEIw2b0rqggeMhFFsKo7iRVCKf1V8RN10lIbF3beBg1dWYjgI5RrPVdHWE5E
         WeN7hH5MKLNSiWu71u5wMSS47PhMXzEpILw0cfto9A8eVGlCC//t93K1jqw3HQOwSxcS
         qA0Es6JPqzvnA2vgzGMf+gR5i/VM+6lYFWcD5GTFQtQlCbtuX+YoRbv+aZsntIVM8A7f
         l0SHoFZm0xEhWu977fQrEc9N9CMZ+08vHI/EESeUdbe8QkVcV1od6krq4MmS3xqdbfao
         rXPaAGavItJSRmPTFbQ/Gg8Mi509EgouYzDX8XOLtIfKfl9uA1Y/gA+T52Av9ho8JECJ
         PO4w==
X-Gm-Message-State: AFq9FYKrQljFFbP8FCFiGzXawtmyXNtEnj4Y2lvEz/276W5fCvpruwuT
	GWtEHmdazfUOdAgVMgnTsnWXc608NCAapedXZxVX+rci52uRinR2sBHQm9xtTk5XTt5y0A==
X-Gm-Gg: AYBFou2XvpV3VXKFCbzHQZwPiJTteuNug7f6sn1qttb9RxWbYlLstBrL+NdgK9UNdA/
	14V/s3BOMIt1rqYxrChVGwXZK5tnRMSuABf+ZtV8INPw8odSYygyMIhi64E3cLN6WkPFnSEs0SD
	EyMbN/4yGa/NBuww9kedY7Lk72WXbNVccM45ifDK9MJ3slXNRU4tK5+ek9agNvSXjdqtNnPLpWq
	nhG0o4fNMltebD5D2d7ZWL3iZ86gMCk0ic1S4m4cbEJLba/HN+jXUYKrswqnbDxgOXUJG0Fz7r8
	hHU4Fm5JGI+oy4hlADSretWKJJs1+UUfmxJ4elSAxR9JIN3++4Pp/FQbWaa1bv2zZzZZY6+Vw0X
	HPyYzbhZRwGbF5hWMqmamdUcC4dvqhksQ7Kv1LSp+gk0kFipI+1ZdWBxtpDhbWpL2J4/yoaA4bR
	51GUNr3uC2EIqAuBHbQ77SN1vnY+PHm+0CUXmDEeuLNrf2nS5x5/7eHzG+OYMywR8WY7MGKxT+3
	+IPqvKglQ7R1VHwgJIeUEVpc7aPHujMNpRkb+b+7BaJ+kVPjao/JvFITTrSIQIAHJkN3KZpT2YJ
	u3UhYHO1qQMknkbi2OdsVs7Lg6UieRjLpBC+wcmVsh/0mzY18Q+52tpgAvC3
X-Received: by 2002:a05:6512:3a95:b0:5bf:a6d3:b277 with SMTP id 2adb3069b0e04-5bfb71d899dmr910515e87.42.1792867055479;
        Sat, 24 Oct 2026 11:37:35 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a920a1sm557060e87.61.2026.10.24.11.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 11:37:35 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH] usb: raw-gadget: fix double-free race during UDC unbind and rebind
Date: Sat, 24 Oct 2026 21:37:27 +0300
Message-ID: <20261024183727.42339-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

raw-gadget defers endpoint disabling, request freeing, and descriptor
cleanup to dev_free(). However, dev_free() is only called after
dev->count drops to zero in raw_release(), which happens after
usb_gadget_unregister_driver() has already returned.

Once usb_gadget_unregister_driver() finishes, the UDC can be immediately
rebound by another raw_gadget instance. If that new instance enables an
endpoint, it assigns its newly allocated descriptor to ep->ep->desc on
the shared UDC endpoint. When dev_free() from the old instance runs
concurrently, it calls usb_ep_disable() and frees dev->eps[i].ep->desc,
which now belongs to the new instance. The new instance's usb_ep_enable()
subsequently fails with -ESHUTDOWN, and its error path frees the descriptor
again, causing a KASAN double-free.

Tear down all endpoints and requests synchronously in gadget_unbind()
before the UDC can be bound again. Keep the descriptor pointer inside
struct raw_ep and clear ep->ep->desc on error and disable paths so no
dangling pointers are left on the UDC endpoints. Additionally, make sure
raw_release() always unregisters the driver if registered, and release
the ep0 request if gadget_bind() encounters an error.

Reported-by: syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b7534c9b380f81a3b4be
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/usb/gadget/legacy/raw_gadget.c | 69 +++++++++++++++++++-------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..379351a010f8 100644
--- a/drivers/usb/gadget/legacy/raw_gadget.c
+++ b/drivers/usb/gadget/legacy/raw_gadget.c
@@ -141,6 +141,7 @@ struct raw_ep {
 	enum ep_state		state;
 	struct usb_ep		*ep;
 	u8			addr;
+	struct usb_endpoint_descriptor *desc;
 	struct usb_request	*req;
 	bool			urb_queued;
 	bool			disabling;
@@ -205,7 +206,6 @@ static struct raw_dev *dev_new(void)
 static void dev_free(struct kref *kref)
 {
 	struct raw_dev *dev = container_of(kref, struct raw_dev, count);
-	int i;
 
 	kfree(dev->udc_name);
 	kfree(dev->driver.udc_name);
@@ -218,14 +218,6 @@ static void dev_free(struct kref *kref)
 		usb_ep_free_request(dev->gadget->ep0, dev->req);
 	}
 	raw_event_queue_destroy(&dev->queue);
-	for (i = 0; i < dev->eps_num; i++) {
-		if (dev->eps[i].state == STATE_EP_DISABLED)
-			continue;
-		usb_ep_disable(dev->eps[i].ep);
-		usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-		kfree(dev->eps[i].ep->desc);
-		dev->eps[i].state = STATE_EP_DISABLED;
-	}
 	kfree(dev);
 }
 
@@ -316,6 +308,12 @@ static int gadget_bind(struct usb_gadget *gadget,
 	ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
 	if (ret < 0) {
 		dev_err(&gadget->dev, "failed to queue connect event\n");
+		usb_ep_free_request(gadget->ep0, req);
+		spin_lock_irqsave(&dev->lock, flags);
+		dev->req = NULL;
+		dev->gadget = NULL;
+		dev->eps_num = 0;
+		spin_unlock_irqrestore(&dev->lock, flags);
 		set_gadget_data(gadget, NULL);
 		return ret;
 	}
@@ -328,6 +326,43 @@ static int gadget_bind(struct usb_gadget *gadget,
 static void gadget_unbind(struct usb_gadget *gadget)
 {
 	struct raw_dev *dev = get_gadget_data(gadget);
+	int i;
+	unsigned long flags;
+
+	if (!dev)
+		return;
+
+	for (i = 0; i < dev->eps_num; i++) {
+		struct raw_ep *ep = &dev->eps[i];
+
+		spin_lock_irqsave(&dev->lock, flags);
+		if (ep->state == STATE_EP_DISABLED) {
+			spin_unlock_irqrestore(&dev->lock, flags);
+			continue;
+		}
+		ep->state = STATE_EP_DISABLED;
+		spin_unlock_irqrestore(&dev->lock, flags);
+
+		usb_ep_disable(ep->ep);
+
+		spin_lock_irqsave(&dev->lock, flags);
+		usb_ep_free_request(ep->ep, ep->req);
+		kfree(ep->desc);
+		ep->desc = NULL;
+		ep->ep->desc = NULL;
+		spin_unlock_irqrestore(&dev->lock, flags);
+	}
+
+	spin_lock_irqsave(&dev->lock, flags);
+	if (dev->req) {
+		if (dev->ep0_urb_queued)
+			usb_ep_dequeue(dev->gadget->ep0, dev->req);
+		usb_ep_free_request(dev->gadget->ep0, dev->req);
+		dev->req = NULL;
+	}
+	dev->gadget = NULL;
+	dev->eps_num = 0;
+	spin_unlock_irqrestore(&dev->lock, flags);
 
 	set_gadget_data(gadget, NULL);
 	/* Matches kref_get() in gadget_bind(). */
@@ -450,10 +485,6 @@ static int raw_release(struct inode *inode, struct file *fd)
 
 	spin_lock_irqsave(&dev->lock, flags);
 	dev->state = STATE_DEV_CLOSED;
-	if (!dev->gadget) {
-		spin_unlock_irqrestore(&dev->lock, flags);
-		goto out_put;
-	}
 	if (dev->gadget_registered)
 		unregister = true;
 	dev->gadget_registered = false;
@@ -469,7 +500,6 @@ static int raw_release(struct inode *inode, struct file *fd)
 		kref_put(&dev->count, dev_free);
 	}
 
-out_put:
 	/* Matches dev_new() in raw_open(). */
 	kref_put(&dev->count, dev_free);
 	return ret;
@@ -886,6 +916,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 		if (ret < 0) {
 			dev_err(&dev->gadget->dev,
 				"fail, usb_ep_enable returned %d\n", ret);
+			ep->ep->desc = NULL;
 			goto out_free;
 		}
 		ep->req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
@@ -893,10 +924,12 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 			dev_err(&dev->gadget->dev,
 				"fail, usb_ep_alloc_request failed\n");
 			usb_ep_disable(ep->ep);
+			ep->ep->desc = NULL;
 			ret = -ENOMEM;
 			goto out_free;
 		}
 		ep->state = STATE_EP_ENABLED;
+		ep->desc = desc;
 		ep->ep->driver_data = ep;
 		ret = i;
 		goto out_unlock;
@@ -962,7 +995,9 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 
 	spin_lock_irqsave(&dev->lock, flags);
 	usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-	kfree(dev->eps[i].ep->desc);
+	kfree(dev->eps[i].desc);
+	dev->eps[i].desc = NULL;
+	dev->eps[i].ep->desc = NULL;
 	dev->eps[i].state = STATE_EP_DISABLED;
 	dev->eps[i].disabling = false;
 
@@ -1010,7 +1045,7 @@ static int raw_ioctl_ep_set_clear_halt_wedge(struct raw_dev *dev,
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-	if (usb_endpoint_xfer_isoc(dev->eps[i].ep->desc)) {
+	if (usb_endpoint_xfer_isoc(dev->eps[i].desc)) {
 		dev_dbg(&dev->gadget->dev,
 				"fail, can't halt/wedge ISO endpoint\n");
 		ret = -EINVAL;
@@ -1096,7 +1131,7 @@ static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
 		ret = -EBUSY;
 		goto out_unlock;
 	}
-	if (in != usb_endpoint_dir_in(ep->ep->desc)) {
+	if (in != usb_endpoint_dir_in(ep->desc)) {
 		dev_dbg(&dev->gadget->dev, "fail, wrong direction\n");
 		ret = -EINVAL;
 		goto out_unlock;
-- 
2.47.3

