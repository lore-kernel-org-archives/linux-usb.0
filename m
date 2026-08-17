Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180AF440A13
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979978; cv=none; b=t2E4XHF42xUcOQAHp2q1FpiSK/clv9bbiYFgx8rm/GFlwBREHQfvj9vRn/vv9HikVJKeKnZvbft+hkS7L9Frj4a7SDz2OgeyhHYUIz42Tky4Giqs1+DUtZpNnuUAiGFJhIbc/UmjUfyb3OG3BmzhoJHnffEOXYHsK57okRFYl1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979978; c=relaxed/simple;
	bh=OhND/qvWSkqE3s18woFDpmymL+MfxuThSmxLnhoyubc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4xtxVCXH28Lax/TLaTzBY/TTqSE99hqf+FrQAStcySUia8xqJQWQJAFHYEp8GSZvy1+wZGEV+xruveTffNOhaZO8Xz0uORn+BP2Z5ZZ+IeFB6QrO7+BBeaZB8xYcvqMUxQbGq1aqEzZAEQvSVA+rQxtOqX4DbzH4mLA9JWrMSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAtd9Ot3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAtd9Ot3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so3806607b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786979971; x=1787584771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKqm42/ODNCgkRQzNhF5koc+EyW84bXZD1789uSuy2Y=;
        b=dAtd9Ot3dGaPioW6GX5R1QbuQkxZ5khkt+nSgMh1Cq08NGuPtDBasEP6imugMM61yc
         xsswnU81cfc4UHvf67ZmZoTfBJFLb9cAdIAWOIqt/kRTk1Iz4MNtdqwLtVYJTy5LH1HA
         Jo0bIxhEi2iLRO1bXKr1/8T3uUWkfbuzwHL8xmh76Cr1LPlzH6oJCawWPN1Ei9KLbHy1
         x6/ZRO9EpUQUs0C2Ri4YpJBd3e7SRwdMpY1He1zGg8j/J0iJhB3oulYd+J8NtY0cpdDR
         NPaRb8wh2Gm3G6QCqZd5vcBgxwxcYrETx6bI163wNcPSM4wExmIygqJ93F5KPBpTmwFL
         6UyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979971; x=1787584771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKqm42/ODNCgkRQzNhF5koc+EyW84bXZD1789uSuy2Y=;
        b=EfeK2QDqlzcwPZaBFBcDiGP0LFpjIYnvL/gJ2shJpcR1UcQOll1Vzmvl8w+X5eLZmG
         6bzHDtPzqB4jpskPtpCLuF90rFA9qBvFMy6wKhR424g7piIrkF25YiVANojZtJMYX66T
         VcrpetLEUyqEawHoTVdUAWPW3nQqAtEN2dPg+6x68da5FOYdUxedIO86Kt9XR4tXC428
         mP0PVSBy6NP4Fq7/xnXaW0M8JguMTADZRjeazy72epKMZmGf60W1sjZyB4SJ+CQTZRSC
         PsGc39bhYDyFaP8RseaNDnmkFvVWBQSFONxoXrIvoz8tgUCc3oXLCq8t4+XnSvbAHvhf
         Cmtw==
X-Gm-Message-State: AOJu0YzAt1FLzFooB/Ip0OySwCSn7t1WFczKZnd92yA5hx9M54tJ7s5K
	4xZ64tu7r42b+mFrLQ5Hu4pkRPomXdY/JdHf30Z/kGptK2utd4cnq/E=
X-Gm-Gg: AR+sD13700zu2JellZXOgg3r3spdFjt9GvqQWoGtchsUSMLY2nJfkS+9fq17WZ94MjM
	93OtXlaq27zf/fDtWeTza59GWyhFQHqkISdFLMnnjoHgHsVJ+m5QzefJ/9QxO5uWzjKLuBgWPxY
	QYFxsnBR5Zi+LMJHxdfonLdItH+YQpO/LzmNrEPVMIxkOaM7SBxDraIpQRu47g5x5zrwY9MdCPL
	PTjVbkSics1v+XM/AzOAX9qZmWlAubLAkahd3Y0kdpLPUyujkh48TYfPJYcpb78t9cXYWxbfJjl
	a4JMC2U1L1OvTgO/JwDh/ZkufbzvU3xdLQOuJ04/Yx6U5NmmYBQpisbmd2HCSoEOnwnXG21tGcM
	FHjoHm35uUWgjCi8DROCa1aERgiEIaYL2y/5Saot+QP/8OfZPOgIcmit05iCgspm0nFXeag1ow1
	KqCPYruFvFw1FVFKE1USTzbVIAR0YRZEpV8INpUSDl3B2DZebPeFI08urvEuw+GHw4F5qW1wPvA
	mDOWrkGp7ZF2MxF8mj1RSk+UsxenZpT0dVq1FuPLXmWZjEPRs0TY7X1KXDkj6f58g==
X-Received: by 2002:a05:6a00:23c1:b0:847:968d:b101 with SMTP id d2e1a72fcca58-851b88ce701mr1194606b3a.21.1786979970648;
        Mon, 17 Aug 2026 08:19:30 -0700 (PDT)
Received: from codespaces-2db70c.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([207.46.224.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b404a4d2sm770372b3a.16.2026.08.17.08.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:19:30 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] usb: cdns2: Handle ZLP request allocation failure
Date: Mon, 17 Aug 2026 15:19:03 +0000
Message-ID: <20260817151903.188692-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of cdns2_gadget_ep_alloc_request() before
dereferencing the returned request.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 25 +++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
index 308d3c468ab1..40c02159ff4d 100644
--- a/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
+++ b/drivers/usb/gadget/udc/cdns2/cdns2-gadget.c
@@ -1696,7 +1696,7 @@ static int cdns2_ep_enqueue(struct cdns2_endpoint *pep,
 static int cdns2_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 				 gfp_t gfp_flags)
 {
-	struct usb_request *zlp_request;
+	struct usb_request *zlp_request = NULL;
 	struct cdns2_request *preq;
 	struct cdns2_endpoint *pep;
 	struct cdns2_device *pdev;
@@ -1717,21 +1717,32 @@ static int cdns2_gadget_ep_queue(struct usb_ep *ep, struct usb_request *request,
 
 	spin_lock_irqsave(&pdev->lock, flags);
 
-	preq =  to_cdns2_request(request);
-	ret = cdns2_ep_enqueue(pep, preq, gfp_flags);
-
-	if (ret == 0 && request->zero && request->length &&
+	if (request->zero && request->length &&
 	    (request->length % ep->maxpacket == 0)) {
-		struct cdns2_request *preq;
-
 		zlp_request = cdns2_gadget_ep_alloc_request(ep, GFP_ATOMIC);
+		if (!zlp_request) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
 		zlp_request->buf = pdev->zlp_buf;
 		zlp_request->length = 0;
+	}
 
+	preq = to_cdns2_request(request);
+	ret = cdns2_ep_enqueue(pep, preq, gfp_flags);
+	if (ret)
+		goto out;
+
+	if (zlp_request) {
 		preq = to_cdns2_request(zlp_request);
 		ret = cdns2_ep_enqueue(pep, preq, gfp_flags);
 	}
 
+out:
+	if (ret && zlp_request)
+		cdns2_gadget_ep_free_request(ep, zlp_request);
+
 	spin_unlock_irqrestore(&pdev->lock, flags);
 	return ret;
 }
-- 
2.53.0

