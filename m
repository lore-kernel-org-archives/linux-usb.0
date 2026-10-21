Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595297;
	b=aeJEHv9BwEwkLWo67F74arUWDB0N5FF92JYljTkgLBJotIs8kxnQthkJrRl1WT8eHsjd
	 4ezEWBVw9uyTWoEOIgfwb+nFtQCnN/c4NL5E/SqM53mOJTFGGVDuxxtAKHeP5H6GDWw4G
	 uwxWIgxYyfjpVETzXreMZ7P25/janSGD/kFwUoP8oKZbCSpRWbBiv1jlgQgpElU78XwFK
	 F/OBQqJCPkXj2gMo6IRr6s7M1OAOfWwcP1Cis+hCRSTyB74BDJCGSfCCZgK9YHCvzUkH7
	 fKhFSKWyzPFFzsS26YP8ByPQh7kEeXehcS0eA0pG6Ky+gzZt6BMRv513UNbocDOgfmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nX+gP2drifdU2o+OF+ySLEpKlcNDTqHvU5zt6uKwARU=;
	b=fcdrsgh6cVcGOXiS227jOup9F07aC7Y3l0UZ3zA3ytxsIkpVqTFhgpgEZkx5DQNLyu/T
	 AGDHV+lx03932meqkbUfE3czuQ92FOTUK34BfjjbiEn7exT4cLRpIK8tt54puynh8goHO
	 Cq6Flnu/4ucMalBPffMk+7Umx1CFPhuy9Cl7P6x9c1Y+QVuOTV3QRii4oGukuP5ixN0IN
	 tcWOevLjsGFP36CFO/WgN/5pjiYCsM0Uyn1Uj5Eq7qJP86wLuHgRdMM8LzFu7OU0vu+NR
	 1MJQuyGVOuCI152oIJ482w2Hy61FJE84jgSONFkpHsGJI83J4KI5iCLYk4b40MslSxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oVC2S4B7;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C17460A380F
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C17460A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oVC2S4B7
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84621d8c7aaso445411a34.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792595296; x=1793200096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nX+gP2drifdU2o+OF+ySLEpKlcNDTqHvU5zt6uKwARU=;
        b=oVC2S4B7NFJNQTrSito4yJfEumKFdCgmaWTW1R8xRymEe+S9WdzW5tinIY4IOobWb5
         NQxBC4YgeLe2VNjzyzR+jYDQN+hf0aOFqnAL5RroVOYue/nVYJXrCremCd9qZD8Af0M3
         p1iWgRi6XHyNYyirbChTYVvH3G5LthAyLYQng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595296; x=1793200096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nX+gP2drifdU2o+OF+ySLEpKlcNDTqHvU5zt6uKwARU=;
        b=E0auucjacoAJgLKK/RdG26FRc74cBJgs+pptuYHM+IyENLPQ/2CeeccpOrjxIeLyPX
         6LckPuGqDNm1KiSn4N/tYUxMpwbDMlom9I8CvufbaKfe2QujtY9NcXj5q44zCmyhyIKo
         HlGg3fezJN2LfIo/AgP+4L0wpKXtRDjYn2qoWE4efEnTdb0P1HSjsYGwEON6eX3PbVlu
         fJs+/70enwtroqR+hNm2dEgmBZNCxdF09pbl4hHDrTkoKYpKfVZHnOofWaN8KzzobQH0
         KCdVBHZOZKEVc91qDz47seza03sZE3gAn+Y7dCCQVtVkaQVoHQsLnrwkX8M4rSfRjEZg
         ctkg==
X-Forwarded-Encrypted: i=1; AKwUvBxWnl+0noLjD3mFVFs6/Nl8goIv6dX2pgzkvSviXP5ly1o0OpvZez25eP/U4NfIFnfm36ScVCZZc9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIIYFtxD1hzM/9qk3Du/UH2bNERz6mwv/6xfCtymUqh45o8Uvq
	rD+1lY4SY5L+/OOIkKgtL4bDoOpDUE+mLlrg/eRSWQPBjfv16+ZPocx/FvpWOozHdA==
X-Gm-Gg: AYBFou0pWpu/fYHEgJoJK6CxSN664JKpiPKLt3KwztShrRBmjmdcqZzb/fY6UwYxo3B
	i9EvejbF1EGr/qg6OrVy4Que8GUVQoGVR5vxULAkdeJqog2RQN6qJlhD5CqLNWqqTgH6fWQYW2a
	x0O8hedn4x69o7YsC8jHbd/45QKHBtjyB5lZWEL5pOLTDKynaOgGLveYsatPoM9FICsHhl5J0ht
	XJPghlENsMCEn0uu3CCRBhbIIkr6wy8TYMtFBeMidwxm31TF0dHbofvFtdBvAo9/X7ib7eXAh6A
	TIULE3ewlfLgnNkjfatW58X6B78xEa0PDMcDWE/sSCSgKaD6PNhc5n6x8NiImMHB8BEhlq/igGI
	Z2zqGZ6DTdK4F72E5Ja/tJHXwNj4kI9EFW+6L2o6E4ygaMKtFv9kHTVjBYmWPaADfno/r19KMU+
	xdmEBcCujNZslsBP4cjwjxcgF0jVmO910zElhxOr7eZNfzlWhkc8uUdJj4h/PcyyBgRcsPqoMlN
	pQSb3oA4fYD2ES23quWyfm3TqKt7qCvyszgZdGr0Uo70sXvPhHGAqzqG0JZinr6XLKOOJfnGmRR
	+l7pu256/Wy72Y9ZJ+EQy+d3ymFqujPU9HHaCXIgi3No
X-Received: by 2002:a05:6808:148e:b0:4ea:5e0e:7dab with SMTP id 5614622812f47-5535818f4edmr1498560b6e.37.1792595295749;
        Wed, 21 Oct 2026 08:08:15 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b400bd39sm2023922b6e.6.2026.10.21.08.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:08:15 -0700 (PDT)
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
Subject: [PATCH 5/6] usbip: vhci_hcd: allocate vhci_priv outside lock and handle ENOMEM
Date: Wed, 21 Oct 2026 09:07:00 -0600
Message-ID: <20261021150704.3129446-6-rrangel@chromium.org>
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

In vhci_urb_enqueue(), usb_hcd_link_urb_to_ep() links the URB onto the
endpoint before calling vhci_tx_urb(), which allocates struct vhci_priv
with GFP_ATOMIC while holding vhci->lock. If that allocation fails,
vhci_tx_urb() triggers VDEV_EVENT_ERROR_MALLOC and returns while
vhci_urb_enqueue() still returns 0, leaving urb->hcpriv NULL and the URB
linked on ep->urb_list where vhci_urb_dequeue() rejects it with -EIDRM.
Moreover, failing a single URB submission should return -ENOMEM to the
caller rather than tearing down the entire USB/IP connection.

Allocate struct vhci_priv in vhci_urb_enqueue() using the caller's
mem_flags before acquiring vhci->lock, pass it to vhci_tx_urb(), and
free it on early-exit and non-transmit paths.

In vhci_urb_dequeue(), if allocating struct vhci_unlink fails after
usb_hcd_check_unlink_urb() has already marked urb->unlinked, return 0
after triggering VDEV_EVENT_ERROR_MALLOC so callers know the unlink was
accepted and connection teardown will drain priv_rx and give back the
URB.

Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
Cc: stable@vger.kernel.org
Assisted-by: Gemini
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/usb/usbip/vhci_hcd.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 522cbaa6eb0a..27dba51392b7 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -665,18 +665,12 @@ static int vhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	return retval;
 }
 
-static void vhci_tx_urb(struct urb *urb, struct vhci_device *vdev)
+static void vhci_tx_urb(struct urb *urb, struct vhci_device *vdev,
+			struct vhci_priv *priv)
 {
-	struct vhci_priv *priv;
 	struct vhci_hcd *vhci_hcd = vdev_to_vhci_hcd(vdev);
 	unsigned long flags;
 
-	priv = kzalloc_obj(struct vhci_priv, GFP_ATOMIC);
-	if (!priv) {
-		usbip_event_add(&vdev->ud, VDEV_EVENT_ERROR_MALLOC);
-		return;
-	}
-
 	spin_lock_irqsave(&vdev->priv_lock, flags);
 
 	priv->seqnum = (u32)atomic_inc_return(&vhci_hcd->seqnum);
@@ -702,6 +696,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	u8 portnum = urb->dev->portnum;
 	int ret = 0;
 	struct vhci_device *vdev;
+	struct vhci_priv *priv;
 	unsigned long flags;
 
 	if (!portnum || portnum > VHCI_HC_PORTS) {
@@ -716,11 +711,16 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		return -EINVAL;
 	}
 
+	priv = kzalloc_obj(struct vhci_priv, mem_flags);
+	if (!priv)
+		return -ENOMEM;
+
 	spin_lock_irqsave(&vhci->lock, flags);
 
 	if (urb->status != -EINPROGRESS) {
 		dev_err(dev, "URB already unlinked!, status %d\n", urb->status);
 		spin_unlock_irqrestore(&vhci->lock, flags);
+		kfree(priv);
 		return urb->status;
 	}
 
@@ -734,6 +734,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 				    vdev->rhport);
 		spin_unlock(&vdev->ud.lock);
 		spin_unlock_irqrestore(&vhci->lock, flags);
+		kfree(priv);
 		return -ENODEV;
 	}
 	spin_unlock(&vdev->ud.lock);
@@ -829,7 +830,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	}
 
 out:
-	vhci_tx_urb(urb, vdev);
+	vhci_tx_urb(urb, vdev, priv);
 	spin_unlock_irqrestore(&vhci->lock, flags);
 
 	return 0;
@@ -837,6 +838,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 no_need_xmit:
 	usb_hcd_unlink_urb_from_ep(hcd, urb);
 no_need_unlink:
+	kfree(priv);
 	if (!ret) {
 		/* usb_hcd_giveback_urb() should be called with
 		 * irqs disabled
@@ -956,10 +958,18 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* setup CMD_UNLINK pdu */
 		unlink = kzalloc_obj(struct vhci_unlink, GFP_ATOMIC);
 		if (!unlink) {
+			/*
+			 * Leave urb->unlinked set and return 0 so callers know
+			 * the unlink was accepted and usb_hcd_flush_endpoint()
+			 * does not busy-spin retrying unlink1(); the shutdown
+			 * triggered below (assuming usbip_event_add() can
+			 * allocate its event node) will drain priv_rx and give
+			 * back the URB.
+			 */
 			spin_unlock(&vdev->priv_lock);
 			spin_unlock_irqrestore(&vhci->lock, flags);
 			usbip_event_add(&vdev->ud, VDEV_EVENT_ERROR_MALLOC);
-			return -ENOMEM;
+			return 0;
 		}
 
 		unlink->seqnum = atomic_inc_return(&vhci_hcd->seqnum);
-- 
2.56.0.212.g129ede20d9-goog

