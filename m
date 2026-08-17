Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2463D2EEE99
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957408; cv=none; b=oypOIqNtT6BitjN+fU64aStY2eyCKgJfUmW9+ymTL5Na3MQ77y0almCgfHz+cQIvhx2BKNMhqUH8aKxB+10ADhVgTkqJ/5vkUX1+qrDeOKYtg735xiSn5KGvi4SpisXMSS3cfuNAK8A2ZD/kmMMXDLrTfguussBivD743SkTXGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957408; c=relaxed/simple;
	bh=Gsm78FdDURTwGEtRi7PbbtQblZGO/rlLl2zrSxlPekU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GlGXkl3Fs10Qh13UwXmCnG4rySx49Jeiu/orQyAqjtb0qll6oBqOwiH91bPCS7k0ocDvtU/mxCb+H8RQpoMBRkByN85LtkHTqBPtSDNOrpSpprMS0svmyFCaBczZVFTCwTMU0swx4Ito4tgw6KZZf1Fl60eA3yyQC1VK05NKpGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jx/Dj8F3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jx/Dj8F3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39266382df6so2467116a91.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786957406; x=1787562206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qup8wHSqTNWqZ291WX414Vh9WOIqgyCwHVdx/0J522I=;
        b=jx/Dj8F3i4EJeTQAc7SKCmYD1UuFLCPviJJparV1aQqVbxqTwHtDKKq0mP+drL64KE
         0l85dWI73etSaxNbtoyyxrB36YcQzA2NmUGvdmA9XgjlX8/KWPmZ8XxNRF5wxX7ejOSc
         3sBNTlxzW0w6bUWOeA8mz4zaZrq0m3JvexXJ0MlIGyX10w0Zwog8gs1a0HjkAVGhadhJ
         w3RkoQX0gQ/CQj+3UCVSNhHHQhbF0Og0ImghWjPzwM7eKSwkCGmP2bQO8T7vlii58D+S
         MR9IiVIFix2qGpMBRFQxkqmyrvEj9aafUeujO1tTkT6NFFPZ4o7K2DOQMpdAvbK2i9IF
         5x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957406; x=1787562206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qup8wHSqTNWqZ291WX414Vh9WOIqgyCwHVdx/0J522I=;
        b=nFczAwxxm1OJtO2PSZjEsaMMRaQqmFRNnIkOS7qWj0mkKZM4gx2HmqUaTksto2vN0n
         kjjKQnIQ02XMAnEUt5PHmE7XZ2p2tIuhf88OEbfshWglGMu5h4XDdS96W+VgmsI1dxec
         FlF23kkGfVnbZ0bFXd2PJDJFn5M8xL/k+iMNhKfQv9xgBVTn+FOqFmj0Q1s1ZrI5BGev
         Uskbs47qRNU6twDXVIeDXCbL/893LbuU/KJTr2zfPIV6qyZLvhYjph/fw9jznO3xSpcX
         M19DLrFzswEDQBkQw6veTYZjdm5cdnyO5Mh9hP7tcDahTGfrdZq/aFtJjQ+Ne3FZbFJi
         XOUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMagp1zPLYzmFppv7cIi8Fu/9uojPDzoCFxBj8Oa1UPHVOqCnyZK7sTntccOnyV9+JeekfIsE+M7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDUXOWIEkHEnd2zZIJxHTOIp+xgxL4YH8N0y/d/GixwXcTX4M
	8Sm2pHPSDWlroGQpwKV2F4mtUPeAT1udRZuqntx25f2TdTyW2Uptnpg=
X-Gm-Gg: AR+sD10qA24+xrjrVNlgE27cMPA2hZOpJqSYHv1DDiK4YQ28v9CZbtPiook5NdZXyE9
	ZKxirC0d+nAbhQaWnbgI8tPU2yloTIQArjqvOz58z6XGPuIl+Dn1FnK1dtamOl5i/4a4Rln/UBX
	muOWbzGPDct4TXz2RwpRgyO/4fJRZPMDrTReJfc8cL31lD6EvadALVAHgnbqGG/bLwcLnuZtjbg
	91fhWhBCyZzBTCqa8ieuSqp30fK0WYfKHdN8TZZwWq37bAG/NvgSrIH61/3teSYWPNeQx5bPvfH
	T0PIDjtV1UhiYxwrdTVYhxUwXW/c7U9ea+vb3BwFWHia69V2EOB+fX7Kn4RrN4f+48OCuXgWy82
	8velwqGBoF0SdNLVomREZV5PqdP+TRcS3doyoz6GxkR9snkeu+MAHPv1GGNNUxX4TGhpkEokqY9
	bYwV4GzrWJYwK7OQ0zErN5RFWTvKoRrCBv/g+jz1/Uok1MK/oS3sJm9oxOO7Q=
X-Received: by 2002:a17:90b:3889:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3933b8ace11mr21789029a91.14.1786957406258;
        Mon, 17 Aug 2026 02:03:26 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b68adefsm4614751a91.3.2026.08.17.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:03:25 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: peter.chen@kernel.org
Cc: pawell@cadence.com,
	rogerq@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH v2] usb: cdns3: Handle ZLP request allocation failure
Date: Mon, 17 Aug 2026 16:03:20 +0700
Message-ID: <20260817090321.955841-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817075929.899795-1-triet.hoang.dev@gmail.com>
References: <20260817075929.899795-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of cdns3_gadget_ep_alloc_request() before
dereferencing the returned request.

Changes in v2:
- Allocate the ZLP request before queuing the primary request.
- Free the allocated ZLP request when the primary request queueing fails.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/usb/cdns3/cdns3-gadget.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index 42311c1bfada..05d225f99012 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2641,7 +2641,7 @@ static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
 static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 				 gfp_t gfp_flags)
 {
-	struct usb_request *zlp_request;
+	struct usb_request *zlp_request = NULL;
 	struct cdns3_endpoint *priv_ep;
 	struct cdns3_device *priv_dev;
 	unsigned long flags;
@@ -2655,24 +2655,36 @@ static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 
 	spin_lock_irqsave(&priv_dev->lock, flags);
 
-	ret = __cdns3_gadget_ep_queue(ep, request, gfp_flags);
-
-	if (ret == 0 && request->zero && request->length &&
+	if (request->zero && request->length &&
 	    (request->length % ep->maxpacket == 0)) {
 		struct cdns3_request *priv_req;
 
 		zlp_request = cdns3_gadget_ep_alloc_request(ep, GFP_ATOMIC);
+		if (!zlp_request) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
 		zlp_request->buf = priv_dev->zlp_buf;
 		zlp_request->length = 0;
 
 		priv_req = to_cdns3_request(zlp_request);
 		priv_req->flags |= REQUEST_ZLP;
+	}
+
+	ret = __cdns3_gadget_ep_queue(ep, request, gfp_flags);
+	if (ret)
+		goto out;
 
+	if (zlp_request) {
 		dev_dbg(priv_dev->dev, "Queuing ZLP for endpoint: %s\n",
 			priv_ep->name);
 		ret = __cdns3_gadget_ep_queue(ep, zlp_request, gfp_flags);
 	}
 
+out:
+	if (ret && zlp_request)
+		cdns3_gadget_ep_free_request(ep, zlp_request);
 	spin_unlock_irqrestore(&priv_dev->lock, flags);
 	return ret;
 }
-- 
2.53.0

