Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595291;
	b=uxp6/9KoHCByr0MPBYxg2k9zuqEhdrjQ8qS92Az1Pw15bjRn8G1ePvBfhqayINvSyQN9
	 b3yxnUnPzse1d07867IGOUy2AxH5vBS6sTw0DKF157QuT0vjWoB+qMWpUmxKUcqQfo0w2
	 lp2T/sOMvbytSPQXG8I0WPeO7d1oJ1qITBaNSV2cZcy4gh+dVxmK6xz3J08B9giGz9Xnl
	 GSY2Rnc+5QPEV4GeFra9PWLVPGOKr6wq8iIwk9lbejvXopSH3abpCFErQQNDCoweIudam
	 93yM3hIvleHTkK2IMB+e4KalndHV5+fC8MhDIgrt9DjdJ33cb4t7B6iniK8XXYCyB2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1xd2G1a6EwVoj0fOyb9t0PAej9iO13m2addwjCedmFo=;
	b=VrLoSNAhtXy8sETxllB9dqd8E9i8DAFYC6fxzyQPCJPHb3/Zu8NIIYvbss43fSBCwmE2
	 ODZ4A6x+byKWTVlOMtGWGEfXiziGBLXyXDa/nBVxJXwERZ2K4VsTflpS18giBnxzDyY7n
	 Gy8P4Cv/fFL3lf1KYcUbXvo3KmzxUa2lIpmH4T9/nHG3MOSegEEmJ4DWW23BhlcC9DuHf
	 Bd+7qK1EWny4nTz8vqrW3hewlY9R6ZN3tX8sH4I3FyKXgo9akAqJHOJhkX9idI8abcCfM
	 /BlBrkDtYQUCtHYP24PAJ7ZpgqzRw+wu8FNmhxr4GF75WeMPUv0q1KB3S7AwhWfbgHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OL5xFrtM;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AD4606A337
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46AD4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OL5xFrtM
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7fccba9c675so2571578a34.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595290; x=1793200090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xd2G1a6EwVoj0fOyb9t0PAej9iO13m2addwjCedmFo=;
        b=OL5xFrtMjErJRdSKQEUBMY60T4dNxi1k0X6hw3RVvRjMS9VQlsTv383JOK/OSFND39
         e28RtA+s9BYZdiFdelXqqP1mTMVsqyg6ddIO4dNMw1T66yImgMoEJuoHGfe6tTPMIxlM
         LIS0jEgdk34C5pCKZA0eOmIL7viX9PvCYeWaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595290; x=1793200090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xd2G1a6EwVoj0fOyb9t0PAej9iO13m2addwjCedmFo=;
        b=cI7PZ8Aj1g7z6F6t3KXAG04U7E7OmKvhRF7OfpChcp8S9BayYSMO4PDo5tKFlue3TF
         69hewsppzRkVzBuwJbWMXPb39trT3jl1x6o3xrVFQULencXTPek6t63ACwkJISezwnAI
         9IcKy86gHrzPHcg+GRODJoKYTSoFnjv4NgOkp0YOjXbFpDjH5KyPtednWILfkAKYphUG
         JYDoFpwQSEKdIEc+A6NxIas0vXGM+NtJysmGUEZhg6nn9Lq39+JhL0PUIZOS6F21q6jD
         HaiuB5LSXLBTo5xl6oU1dw1Av6WzaV/AkzxZWKAlnQ7peezqTNBtTJ7aThxAb2YcYjzL
         8FKg==
X-Forwarded-Encrypted: i=1; AKwUvBy6a7ui1gRIQnW9aO6d5rPQQ9b9vIX9miAnDLd1WMHNUvwpvnSGInjhbNPyh1hsaZ6pWjhKyOxfK90=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7kbWGi4LLkObO1k3QC5gY3zlzDobMVDL+k6R6d301wN2sZBiE
	UcSfrNlYZQPbdUg2/fqJBWhCYrH8M0UBqIMpkxI88dbQ1Mq297KZf3a7Dvb4O99WCg==
X-Gm-Gg: AYBFou0AtLW7LQGUO4Bz9QiPcxbrv2wL3LN1OtIV2uKb0Fbwp7upSWdijNIFAflbdpB
	sdWs7C7OKq06E1wRoIjXxfhlYRYSxPshnY+mxdld3qNp2l7vbSIsP/twgXwlkXTQWVgGzFAiVBS
	Yx71YCuAQkfUrLn+OYzQOc2+imn9MapnROihrdVDBOiXeGIK+xiFl4I1YRhBcXwSBlHiiLEevhy
	7hUiQkwFIaW41ZaDZXff/XmYk6Cy4+6VivBvMZyqWkTKzX6GdrIPF8RNlcEnFbVFdV5wY1t3xvL
	KRP/x0812TjYNg4MAq4hFt0EW3n9mLZbHqx65OUr9Nf1TWJbkktiqUYYVfvqbP1ZFSbCguU22ZI
	D1TA5VxGclh1L/MGrOIsiPttDcgd0SO50GyTiI5vgdtfsqfq8N78avtw46oWd5qNzrAgyBcktMw
	aeVCcNCFn2/TjxtQsAoLkLg6J7z+Ro6MwN0dHyX4UsBIXtdrrEVLPwACIH7S9vHFu1f+OBbQYhm
	Mju2xWhSDu0AL7P6ViVuhbwF3SDSP8JxAt5+G5HXS6zgkAvCk5kNl+DoFhAdpPH2zdziWEq+tHM
	X52WISZBndhKTA6t1QksKr+SfNhTogLaLv9dDvzgBAc1
X-Received: by 2002:a05:6808:1a07:b0:4c2:a312:f0ad with SMTP id 5614622812f47-55353a9aef2mr1312261b6e.8.1792595290146;
        Wed, 21 Oct 2026 08:08:10 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:08 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Raul E Rangel <rrangel@chromium.org>,
	stable@vger.kernel.org,
	"Brian G. Merrell" <bgmerrell@novell.com>
Subject: [PATCH 1/6] usbip: vhci_hcd: protect urb->hcpriv with priv_lock in vhci_urb_dequeue()
Date: Wed, 21 Oct 2026 09:06:56 -0600
Message-ID: <20261021150704.3129446-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021150704.3129446-1-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
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

In vhci_urb_dequeue(), urb->hcpriv is read and priv->vdev is
dereferenced while holding only vhci->lock, before acquiring
vdev->priv_lock. However, pickup_urb_and_free_priv() in vhci_rx.c frees
priv and clears urb->hcpriv under vdev->priv_lock without holding
vhci->lock.

If vhci_urb_dequeue() races with pickup_urb_and_free_priv() on a
completing URB, vhci_urb_dequeue() can observe a non-NULL priv pointer
just before pickup_urb_and_free_priv() frees it, leading to a
use-after-free when dereferencing priv->vdev or priv->seqnum, or a
double-free of priv.

Resolve the race by deriving vdev from urb->dev->portnum (matching
vhci_urb_enqueue(), and guarding against portnum == 0 in both) and
acquiring vdev->priv_lock (nested inside vhci->lock) before reading
urb->hcpriv.

Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Cc: stable@vger.kernel.org
Assisted-by: Gemini
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/usb/usbip/vhci_hcd.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..3196ea80e7c2 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -704,7 +704,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	struct vhci_device *vdev;
 	unsigned long flags;
 
-	if (portnum > VHCI_HC_PORTS) {
+	if (!portnum || portnum > VHCI_HC_PORTS) {
 		dev_err(hcd_dev(hcd), "invalid port number %d\n", portnum);
 		return -ENODEV;
 	}
@@ -899,34 +899,35 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	struct vhci_priv *priv;
 	struct vhci_device *vdev;
 	unsigned long flags;
+	u8 portnum = urb->dev->portnum;
+	int ret;
+
+	if (!portnum || portnum > VHCI_HC_PORTS)
+		return -ENODEV;
+	vdev = &vhci_hcd->vdev[portnum - 1];
 
 	spin_lock_irqsave(&vhci->lock, flags);
+	spin_lock(&vdev->priv_lock);
 
 	priv = urb->hcpriv;
 	if (!priv) {
 		/* URB was never linked! or will be soon given back by
 		 * vhci_rx. */
+		spin_unlock(&vdev->priv_lock);
 		spin_unlock_irqrestore(&vhci->lock, flags);
 		return -EIDRM;
 	}
 
-	{
-		int ret = 0;
-
-		ret = usb_hcd_check_unlink_urb(hcd, urb, status);
-		if (ret) {
-			spin_unlock_irqrestore(&vhci->lock, flags);
-			return ret;
-		}
+	ret = usb_hcd_check_unlink_urb(hcd, urb, status);
+	if (ret) {
+		spin_unlock(&vdev->priv_lock);
+		spin_unlock_irqrestore(&vhci->lock, flags);
+		return ret;
 	}
 
 	 /* send unlink request here? */
-	vdev = priv->vdev;
-
 	if (!vdev->ud.tcp_socket) {
 		/* tcp connection is closed */
-		spin_lock(&vdev->priv_lock);
-
 		list_del(&priv->list);
 		kfree(priv);
 		urb->hcpriv = NULL;
@@ -948,8 +949,6 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* tcp connection is alive */
 		struct vhci_unlink *unlink;
 
-		spin_lock(&vdev->priv_lock);
-
 		/* setup CMD_UNLINK pdu */
 		unlink = kzalloc_obj(struct vhci_unlink, GFP_ATOMIC);
 		if (!unlink) {
-- 
2.56.0.212.g129ede20d9-goog

