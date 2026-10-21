Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595299;
	b=eQtF3aMquLrOiOdXae6cAoZUQIX6KD2mVreCNnFkKEQHtvScANLF7hJnrJ/jDHy1Ibck
	 Jdy+Iwq9jmQAoCwcCdarxl6Zw5xIXpubuMdxReDAvgZKW1i3AE2LMwmqD/ccwoDF5MHnU
	 eZ73CRL+h+B1Qv3VT0OOtJ4eFLGvzgzIK4aDieD/3xKnBDGB+61H23CA4qhKmBacQu16z
	 QimFeCmjS3CIau1ePJPC1lWSj1p95zxYQ1AE04AmEkrwBcjVAZIYdOiszHkHPpfECLhCX
	 J10RzPxtNJzgykulyu+NMbiPUZy1cAXlXae6MnsFB3W2EXiCcMKkMi3ivK3Nu6gfq0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SKh8lPT5SEfMc99OwulIZQOlMHEzODfvv6gUt03pNys=;
	b=j+adHrEBc1uDeIcMUMzeldcclE5mAwB6nrckLHsPWVfLOd//s8cPFdE8hWVGmaAzOhnf
	 9uGr/TsrF2VZoUJ+3Dj6NPgRDHMtXNd0cdfWGphKX24fKNtEvL0YtqsW2CoB3f8cybQU4
	 IHKvKfQI13OgtyvKhYDgaV33x/HQVY7Fmvk/vq9PDiIPoW3LnoWs4IEn2ZvvEIoZd3YLf
	 S+xjKt8jonXYstGZTbVFO4A6EK4hE11GDeeKe9cBCrnNdkEVQ5v/vl20uLgCFssJiokHm
	 hlRGDidUUFO+FP/1yiU1O4o1vt8yXEfZba5aGIAibQexIVvohUTEPsDqyjjmb/4ucoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VJpeNPVz;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEC660A3824
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAEC660A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VJpeNPVz
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-833e671ee9fso623525a34.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595298; x=1793200098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKh8lPT5SEfMc99OwulIZQOlMHEzODfvv6gUt03pNys=;
        b=VJpeNPVzzW2m9IiLhWBOP6SQVFen0qc3AlMOAVzSp2Y+DLTEnxZzmTyRkWda+g5U4A
         mp4KnQyGKOPH9pwQCWFtDjIVB3KbAQ58lrLDu/ilmQ3nKK/GWj5LF5himQIbPb9ZB627
         v2KncJj/J6NMNZY+tZ4WPIwnPkR4wJyM470iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595298; x=1793200098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SKh8lPT5SEfMc99OwulIZQOlMHEzODfvv6gUt03pNys=;
        b=QCnb0bv2Odii6l4OYH7v/LDZY3+TmeLZqbIRXSqNLebbIF1QVyNjS9vdXkbUj2tWV5
         tEgSovh9ZIELibUjqljFtto+elGvGF00HPX+9SLZPm5Ykx1vtuJooXTA/fUjRJBxJls/
         2k/IoZnMDuWBN622VVqfCtrW3SWurZhwDvM/SS9YsgkVgL4FiH4bcKFYbHg7aC333u1l
         qlKEiuJKClbS3zWKlEz/cuefxB2Ty4CnaMZWndtaMunwHCuPuxyiNWA8yYdct+azTdGv
         1yDRAAWygWY9wAhtwnBq3PKpx9jqvnXIIMNHNK56xbmN2XJa9hH9DHewjFNrKuOHCw4P
         gDgw==
X-Forwarded-Encrypted: i=1; AKwUvBz/uatoA2e5MJYxf31aA8kYtnxZVI71NjKPVPH3EctQ8Oryeokc3nuzUC8utnj0V97E5q7TlBjc0r0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7tnH/xJSDXhDDUG+W1VT/jjfaP5sSMbOZP2Y+7W9AY5dJtaf+
	uPikizG5c2wyEMolnIrqwQUlQaV9xfA42jlUq8xj1mvVAROD++nlVELWesVXHTwRoQ==
X-Gm-Gg: AYBFou2KXK10jYv2jAdwgAEFRLWq5jADplykZIDzpFauk+78rPzzympxI0mqriW9qzm
	yTa0VBNTU4PEwZyocHlDbyo92uUQO7vNKzstY+HA7buGIBSIRz+43o7atLWVvPD+NJDxPf40Mpy
	QONd/VAfTylWEtoFh40eHXVTstTIiQGE8uE/djOUdRTf3ZmhuJECprb3UdiCb5hP+ywJzoNcYzE
	rz2nd8pQ26jzNKbr2dwaCsk42m07OC+B/ZHSXQMOi5HFVhvKl6jtZaTw/knuYNRZ6O8se7vumJc
	s9ceUAXAu+ySs4TreaDMl1ny00/65zFRjV2XcdhO2aDM+87W+rzGvXq9OWi/xG9bVZGY0tRmpv/
	QOGW8q9tEgZyJ41WFaxvSETHEsawCj9taZ2KaUkzqxtYjFOnW1+sk6kUUXBv3ABcfMtGl5MQo5a
	X83kzU1ZCP69an5/D4cwdYMBfB1dfrE0jAcBo0mObWl01kFpZTz94BNb+8J1YdB7N89L5LwT7uR
	XSIjXsZ8Khn8q/pUuFXZQKLPgGR+aeMIwDVLSTm1/N0Djo0/4nVACXdV8tBwFpM8UOT3uHZuD+h
	WieuDj3yHG+qQMUCdjEE97OL3NKveBc1tonR6RK8ecEP
X-Received: by 2002:a05:6808:10cf:b0:53c:8f0e:ee21 with SMTP id 5614622812f47-5535876bca3mr1511006b6e.10.1792595297620;
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
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
Subject: [PATCH 6/6] usbip: vhci_hcd: reject URBs from stale usb_device after port re-attach
Date: Wed, 21 Oct 2026 09:07:01 -0600
Message-ID: <20261021150704.3129446-7-rrangel@chromium.org>
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

After vhci_shutdown_connection() runs, event_handler() immediately
calls vhci_device_reset(), setting vdev->ud.status to VDEV_ST_NULL and
clearing vdev->udev before usb_hub_wq finishes running usb_disconnect()
on the detached usb_device.

If attach_store() attaches a new connection to the same rhport before
usb_hub_wq disconnects the old usb_device, vdev->ud.tcp_socket becomes
non-NULL and vdev->ud.status becomes VDEV_ST_NOTASSIGNED. Because
vhci_urb_enqueue() maps urb->dev->portnum to vdev without verifying that
urb->dev matches vdev->udev, URBs submitted on the old usb_device pass
the connection state checks and get sent to the new remote device (or,
if a concurrent USBDEVFS_RESET resets the old usb_device to address 0,
overwrite vdev->udev).

Serialize vdev->udev clearing in vhci_device_reset() under vhci->lock
and ud->lock (dropping old usb_device and socket references outside the
spinlocks in both vhci_device_reset() and vhci_urb_enqueue()), and
reject URBs in vhci_urb_enqueue() when urb->dev != vdev->udev and either
usb_pipedevice(urb->pipe) != 0 or urb->dev is already registered
(device_is_registered(&urb->dev->dev)). During initial enumeration and
PORT_INIT_TRIES retries in hub_port_connect(), each candidate usb_device
is unregistered until usb_new_device() runs after hub_port_init() has
assigned vdev->udev, whereas an already-registered usb_device resetting
via usb_reset_device() is only valid when urb->dev == vdev->udev.

Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Cc: stable@vger.kernel.org
Assisted-by: Gemini
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/usb/usbip/vhci_hcd.c | 44 +++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 27dba51392b7..e8ff63c2276f 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -693,6 +693,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
 	struct vhci *vhci = vhci_hcd->vhci;
 	struct device *dev = &urb->dev->dev;
+	struct usb_device *old = NULL;
 	u8 portnum = urb->dev->portnum;
 	int ret = 0;
 	struct vhci_device *vdev;
@@ -737,6 +738,17 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		kfree(priv);
 		return -ENODEV;
 	}
+	if ((usb_pipedevice(urb->pipe) != 0 ||
+	     device_is_registered(&urb->dev->dev)) &&
+	    urb->dev != vdev->udev) {
+		dev_err_ratelimited(dev,
+				    "enqueue from stale usb_device on port %d\n",
+				    vdev->rhport);
+		spin_unlock(&vdev->ud.lock);
+		spin_unlock_irqrestore(&vhci->lock, flags);
+		kfree(priv);
+		return -ENODEV;
+	}
 	spin_unlock(&vdev->ud.lock);
 
 	ret = usb_hcd_link_urb_to_ep(hcd, urb);
@@ -753,7 +765,6 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	 *
 	 */
 	if (usb_pipedevice(urb->pipe) == 0) {
-		struct usb_device *old;
 		__u8 type = usb_pipetype(urb->pipe);
 		struct usb_ctrlrequest *ctrlreq =
 			(struct usb_ctrlrequest *) urb->setup_packet;
@@ -764,13 +775,13 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 			goto no_need_xmit;
 		}
 
-		old = vdev->udev;
 		switch (ctrlreq->bRequest) {
 		case USB_REQ_SET_ADDRESS:
 			/* set_address may come when a device is reset */
 			dev_info(dev, "SetAddress Request (%d) to port %d\n",
 				 ctrlreq->wValue, vdev->rhport);
 
+			old = vdev->udev;
 			vdev->udev = usb_get_dev(urb->dev);
 			/*
 			 * NOTE: A similar operation has been done via
@@ -783,7 +794,6 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 			 * should be dropped.
 			 */
 			dev_pm_syscore_device(&vdev->udev->dev, true);
-			usb_put_dev(old);
 
 			spin_lock(&vdev->ud.lock);
 			vdev->ud.status = VDEV_ST_USED;
@@ -802,6 +812,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 				usbip_dbg_vhci_hc(
 					"Not yet?:Get_Descriptor to device 0 (get max pipe size)\n");
 
+			old = vdev->udev;
 			vdev->udev = usb_get_dev(urb->dev);
 			/*
 			 * Set syscore PM flag for the virtually attached
@@ -814,7 +825,6 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 			 * on disconnect.
 			 */
 			dev_pm_syscore_device(&vdev->udev->dev, true);
-			usb_put_dev(old);
 			goto out;
 
 		default:
@@ -832,6 +842,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 out:
 	vhci_tx_urb(urb, vdev, priv);
 	spin_unlock_irqrestore(&vhci->lock, flags);
+	usb_put_dev(old);
 
 	return 0;
 
@@ -848,6 +859,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		spin_lock(&vhci->lock);
 	}
 	spin_unlock_irqrestore(&vhci->lock, flags);
+	usb_put_dev(old);
 	return ret;
 }
 
@@ -1156,25 +1168,31 @@ static void vhci_shutdown_connection(struct usbip_device *ud)
 static void vhci_device_reset(struct usbip_device *ud)
 {
 	struct vhci_device *vdev = container_of(ud, struct vhci_device, ud);
-	struct usb_device *old = vdev->udev;
+	struct vhci *vhci = vdev_to_vhci_hcd(vdev)->vhci;
+	struct usb_device *old;
+	struct socket *socket;
 	unsigned long flags;
 
-	spin_lock_irqsave(&ud->lock, flags);
+	spin_lock_irqsave(&vhci->lock, flags);
+	spin_lock(&ud->lock);
 
 	vdev->speed  = 0;
 	vdev->devid  = 0;
 
+	old = vdev->udev;
 	vdev->udev = NULL;
-	usb_put_dev(old);
 
-	if (ud->tcp_socket) {
-		sockfd_put(ud->tcp_socket);
-		ud->tcp_socket = NULL;
-		ud->sockfd = -1;
-	}
+	socket = ud->tcp_socket;
+	ud->tcp_socket = NULL;
+	ud->sockfd = -1;
 	ud->status = VDEV_ST_NULL;
 
-	spin_unlock_irqrestore(&ud->lock, flags);
+	spin_unlock(&ud->lock);
+	spin_unlock_irqrestore(&vhci->lock, flags);
+
+	usb_put_dev(old);
+	if (socket)
+		sockfd_put(socket);
 }
 
 static void vhci_device_unusable(struct usbip_device *ud)
-- 
2.56.0.212.g129ede20d9-goog

