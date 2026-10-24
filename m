Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792868923;
	b=c4Ny8qRK/kW3O6ZmYtbCA/GXJytvai1KsBPYT8jWYSDhuLDR3NK0dqMQLhBHf9oQRFyp
	 JKVlNqIsR5j98qa34PyDLpmMklSjhj8Vd7StlwOQEnSmw6qP2DPKaXhnTMHfgUkwsHLuO
	 Hh40fyy5WilHeizkipqNxrKSyN2Tfe5WMM0ynFcVSxEhHLHiLWkb5GChhLMg8HOUgLn2G
	 FyrzqJJ3p6l4IpbmIcxyLrw0EPLrCf8TZLuWnH9rDbNnmpzBycH/k+NxUL/X5SBPNqCzt
	 oN1JOcjtxMZ8geZ0N0Lf+BiJAZMtKzyoNQW4t3SDtE5UU9YDkRiND7weCdqAGSg8PBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792868923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h0buNEI0lCJJCgoM1UYKZVz0XsBP4KkH0W95H0CbqBI=;
	b=Y/xjDtoGmBXr4rB01p2cctqRhDj3zuOZPBWStO+DjrriSNxj9kkRc9g3GXpwylDSYvzE
	 fRqYc7uAQTQ0PDo8dmjTK8tUrrdQPsfyKPsO51piMIcDjQr+0uBWd+35m6DrvRXSRHpgZ
	 I0fiwocS/57dnaIrpVW/IAFfH0ZRYRRRxldrvw866WX57BwzgVreXRseEV9cwhty5ya6F
	 ZreEKvMpwe/3yEklh7S7RHEXDHaGiMc4kt5FkKN6wPezPNT+rWyitaLrJBv8bYitwNZwR
	 q7sWNPNgOgHzvEBgnw+U2l/BIG+OjHzlCDvjfAgItns7x50jx/i3Vl7AYBp517ERnRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ps30KaC4;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE734606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 19:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE734606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ps30KaC4
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3dd9670bso14656611fa.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792868921; x=1793473721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0buNEI0lCJJCgoM1UYKZVz0XsBP4KkH0W95H0CbqBI=;
        b=ps30KaC4LcxN0pKtqOCXqtxdBEtVN+LYEc7sesWnBq0HahPnvdICoess/QzilKIaWQ
         kv/W2KKI9XeUEtnjm/QUpi843Cle5p5Z2IHNIbofhXz9HP9WYFiJ1cDDSRneQ/mNhPfQ
         GMa0BFA41d/aArBsJhdmFv+n5yMLKi5aIFZJuNuiWK5JUcejZW30YvevTt3R6aQQah36
         X4m8frfpsLK4QyjQe3ewstWfTPf722Kx0vofkJRx1IfEVYB6ym2wRUP7hfdfoOeqeOOQ
         Cxk5rQj3Rfy516yqU56pPDlvWR+wMx6vhiGOSkr7uWGS1JwrCpLvhT9W3UE+bYYJUS5B
         5QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792868921; x=1793473721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0buNEI0lCJJCgoM1UYKZVz0XsBP4KkH0W95H0CbqBI=;
        b=rQEokkxC81vgFv9Cpd34rEc3Wi6XnNkMrh+nE7q3XFeYVZDyZT2HfZiBvqPanKUQ2K
         NJO89H+Bc+Gz0RIseVO6OtBOfXosIpzPIBUAaUVzR+rhCf0SsflmLif+V84DaWmFEGnY
         mv90pqVJ7XkNY7v2dv13n5hyOTFKar+cjaol/mnPb4ww8mQAfFz8atvGJyk1ugkxWEq0
         6fgZIx84uvpRDr78R3JlI4hy7MnkEvPDLEt9YGlT549KCLWI4TfvZTFWVlOzJMeg7sEh
         0oX/16JfLlXOhTxNF6l5rivymOFOIQh+asH8Wu5cq0SX0/LuvHO7ffMTq8e1W2kqnj6r
         bQMA==
X-Gm-Message-State: AFq9FYIq5SgV5KFtOONK72f9ACgjJx5nm03rNhD07T4qv5WM0O0A++44
	GTxsKW/KPOyHw+GeF/I+ewOkc18XIXIDVN5r7vGKdJgFdoAM06cuRGqz
X-Gm-Gg: AYBFou0dWGqGRXTnyXupyFoyuG0IgkmIM8QsUiWppgbzGALBBjSPOMOA8HI4W7ifK5X
	QdC8QtiYCC/lAtCJmw3EBPoP/muZCc1Adbh327C6YKtI8IHrlErkQMckSZ6zxGfHLbg7PKfSY45
	++fQuadX8+3m1w1hYgjPhihKqbmUwV2dczp4m8jsNNqbFarVASGIpKhvApwMKUfxtgWu7P8MRw5
	bsz5oJDiOy51MrXhlr5DLQl6i9oNBMkt0XHPm3O4x31eqaguWyTzEKdQqC47xQVSjErVyrVUoUK
	0qDX/2o8KqLHuUvt/ktYhUmF0sLG5L1f1JUJm6NnUK1tnAD2arikOG+YmHWeTIF9NUZgi3sMBvh
	7J3S13s4git4/k6L90Wpy8/1vK8Gr+SZw7Eh1RHzqbWDZoV209xk0GjjqX+ss4mEkAtvX6TWsIw
	0wwgIDZZgmA4fTUZzPw2R7VyMYY9BTZlLcOft2cngAofafZLjvwAK7S0kXoNh3/KK71UUSYoUsf
	kn/CkO4zP3MEKks465IZ2yuqU9ps4vScSa8b5gA1KqMkef+2X95P0VzcZa/0X8EzNDQRUZbY8nw
	2O4G7FVZQycgKjCY35Yv5riKAbGEY4H2q6SrF52LKqqLB0kK79GpnCH3slYB
X-Received: by 2002:a2e:bc05:0:b0:3aa:f72e:8ef5 with SMTP id 38308e7fff4ca-3ac6fd3cdacmr7038501fa.19.1792868920702;
        Sat, 24 Oct 2026 12:08:40 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993dddsm5764931fa.7.2026.10.24.12.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 12:08:40 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Andrey Konovalov <andreyknvl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2] usb: raw-gadget: fix double-free race during UDC unbind and rebind
Date: Sat, 24 Oct 2026 22:07:58 +0300
Message-ID: <20261024190758.2526-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024183727.42339-1-igorpetindev@gmail.com>
References: <20261024183727.42339-1-igorpetindev@gmail.com>
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

Tear down active endpoints and requests synchronously in gadget_unbind()
before the UDC can be bound again. Keep the descriptor pointer inside
struct raw_ep and clear ep->ep->desc on error and disable paths so no
dangling pointers are left on the UDC endpoints.

Reported-by: syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b7534c9b380f81a3b4be
Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
v1 -> v2:
- Keep ep0 request handling in dev_free() to avoid any lock recursion.
- Synchronously disable and clean up active endpoints in gadget_unbind()
  to prevent use after UDC unbind.
- Update endpoint cleanup in dev_free() to free raw_ep->desc.
---
---
 drivers/usb/gadget/legacy/raw_gadget.c | 30 ++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
index 4febf8dac7ca..a6b42679acc7 100644
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
@@ -223,7 +224,9 @@ static void dev_free(struct kref *kref)
 			continue;
 		usb_ep_disable(dev->eps[i].ep);
 		usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-		kfree(dev->eps[i].ep->desc);
+		kfree(dev->eps[i].desc);
+		dev->eps[i].desc = NULL;
+		dev->eps[i].ep->desc = NULL;
 		dev->eps[i].state = STATE_EP_DISABLED;
 	}
 	kfree(dev);
@@ -328,6 +331,20 @@ static int gadget_bind(struct usb_gadget *gadget,
 static void gadget_unbind(struct usb_gadget *gadget)
 {
 	struct raw_dev *dev = get_gadget_data(gadget);
+	int i;
+
+	if (dev) {
+		for (i = 0; i < dev->eps_num; i++) {
+			if (dev->eps[i].state == STATE_EP_DISABLED)
+				continue;
+			usb_ep_disable(dev->eps[i].ep);
+			usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
+			kfree(dev->eps[i].desc);
+			dev->eps[i].desc = NULL;
+			dev->eps[i].ep->desc = NULL;
+			dev->eps[i].state = STATE_EP_DISABLED;
+		}
+	}
 
 	set_gadget_data(gadget, NULL);
 	/* Matches kref_get() in gadget_bind(). */
@@ -886,6 +903,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
 		if (ret < 0) {
 			dev_err(&dev->gadget->dev,
 				"fail, usb_ep_enable returned %d\n", ret);
+			ep->ep->desc = NULL;
 			goto out_free;
 		}
 		ep->req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
@@ -893,10 +911,12 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, unsigned long value)
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
@@ -962,7 +982,9 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, unsigned long value)
 
 	spin_lock_irqsave(&dev->lock, flags);
 	usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
-	kfree(dev->eps[i].ep->desc);
+	kfree(dev->eps[i].desc);
+	dev->eps[i].desc = NULL;
+	dev->eps[i].ep->desc = NULL;
 	dev->eps[i].state = STATE_EP_DISABLED;
 	dev->eps[i].disabling = false;
 
@@ -1010,7 +1032,7 @@ static int raw_ioctl_ep_set_clear_halt_wedge(struct raw_dev *dev,
 		ret = -EINVAL;
 		goto out_unlock;
 	}
-	if (usb_endpoint_xfer_isoc(dev->eps[i].ep->desc)) {
+	if (usb_endpoint_xfer_isoc(dev->eps[i].desc)) {
 		dev_dbg(&dev->gadget->dev,
 				"fail, can't halt/wedge ISO endpoint\n");
 		ret = -EINVAL;
@@ -1096,7 +1118,7 @@ static int raw_process_ep_io(struct raw_dev *dev, struct usb_raw_ep_io *io,
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

