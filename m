Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59213C553A;
	Thu,  2 Jul 2026 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.58.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980015; cv=none; b=hJenoMBdgdm/1y4mM4vATSbfaWNxxiantFP4Z1t1+pYVd0ommIU+brderH2INYVTbHNMdznuGtZWR0+EHUeaWoRjTQ50mEZhGQ3PrAhWw6vNdiuXddPK8QhkmqzqyTbY3sMRaTkqq7HZBirG7NBmnplLSuJ0WsxEYwBqC3Lgsb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980015; c=relaxed/simple;
	bh=2ZcerHJBaMq2e/JMGr86nJo2ZzsoboFMfGwfCDcbVUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDPx99tgZ7MfhTg+7iB1ziXQ1SAu6Ghsn7GARZjXhy7wi0wk8oRqnw9zPz5VPVTE7YqzyEwumK7BJtPTJoHzd3SDlApoHoV9w+aM9qQRT3OSgf3QfGZwc7aVrc91b9O6R1oXaTCDdewgQFcfx6+OCuAbsTVYOLCVd3jSjv+PPC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=IIgj03PO; arc=none smtp.client-ip=114.132.58.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="IIgj03PO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1782979972;
	bh=bH/3ksGMfagOroq13frQLZrH/1toIP3H6hqHcfqLuAY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=IIgj03POA3mWC1Gr7+9pQNeMXVm8MjpmD6oS4ErSptYsU1g4CpKWvcq2VKv0xW2nS
	 B9u2W9Kk+8NaGjny48DQDesmzaZhoJoU3vXGeHUQ11CvOOiRMZWo3b1+aAEXpzgSoe
	 E04e75qg3SpuKgwZvdQzn7kiJ01Z1RyFZSGqVxlA=
X-QQ-mid: zesmtpsz9t1782979957t91bfa5a4
X-QQ-Originating-IP: iFLHnTjMURipjn2fIgcpHQSeeYeKZzBL3pmN8Xpq2yU=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 16:12:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17426908569751530168
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: valentina.manea.m@gmail.com
Cc: shuah@kernel.org,
	gregkh@linuxfoundation.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [RESEND PATCH] usbip: vudc: fix NULL pointer dereference in vep_dequeue()
Date: Thu,  2 Jul 2026 16:12:32 +0800
Message-ID: <2B1E59F5E4C6B935+20260702081232.2477777-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mv3l2S4IM5FYM/mM30XKbRu9zik2hnaVwjwHSBGQz14DKqz88bmm1rJ1
	ccXpHc+DtIVLK/WlddEVYEZRH7o3ZgfNPCl9/3Qi1qXX23Jqvw2iHiFnxir6NqC1fJHuFvJ
	BdyhIhGfo/6vBp+EsBxKlBtSsAYDDQqgT+fY6TPIeyEwHwgqhuR3X0veWu8V8GuSf6W/cAQ
	YuSEbgTzRyqpkiqIneB8/8LY7a5j+V5SeTGhmjcDcpp8YiS+LCEoM4Tt9cGE9SUPwvlfffT
	EmjOUe9HjUPJhaiGriUgwP4FiRl5BRE+/N8l79E6bI23Id6/F2d92WERs1u7cKTp5CuEYvR
	rk75gWvY9TwTkyg4oPTPlWs8a9NrFQpnw4NAEvadVjVBj7FUYbSP42OLWLKHJVZIXmaaWoD
	mhJftmEJi2YS8xTdC71WKAj7Os0uIMiLKNV9LqfSVtytfYwZBNXn1umJj/2gswDXDZz6mE6
	0jezPpvviQPgzdrCTYZT7+mK/4pWXQdJO9PRBciBId/qgl4VR4Z6M3fSqGmYBvT5ImzU1Sg
	XT7Nxm8o7uGSBfKkZG+qzt4Qmii1lT95WQNOt/CqbzFhjXMyr2rdclGZLC9AsOncD5MxJwl
	cwDun8wNwwTmzp4rpMgLd+edhMv0LrNhryQ/dVxfbwScZHKmlbuRR5XW8T2WFAMdYuRVL8Y
	NLkX2zRFbY4t7rHwbLQ/KYQeWJta0BeUgP9H3McwrUuZe/vWPp3nym/cu15VaN0i6y3CjOG
	6B/SU4qOdYPNoh5fmvfvxRsBCTIMQpjyhPscbU+V8VAPoKqJ3hPo9uw5mbwwY+DspqR/gjL
	QgZHVNwhVBwELDcLTwOPbfhpChDWikOAWysfElnRuyRBb2ipvETrtCG4ciNWSCy416YmVVv
	PulWyU+tIcC7vlElkh9/jcVGZVC0a4CUrjZavVXtn4ujAWqlwnU1TsDNg39mQZYoKPjeD8+
	eZE/l9k7YmHKSJ6x1Det6p2QWg/XwU34SVKP6lCqTk7RUSo1COxXqPiEnL2Yp/TXbPiSJN7
	ntkjTWyxu1NhjWZjc4qNsDUdOyu+wMsHQJA2eCTg2JAUYfG5/WAhjmdnLcXn/FqggS+AcI4
	g==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

vep_alloc_request() zero-initializes struct vrequest but never assigns
vrequest::udc. vep_dequeue() then reads that field and dereferences it
while checking udc->driver. Consequently, any usb_ep_dequeue() call that
reaches the vUDC dequeue operation can crash the kernel.

The endpoint passed to ->dequeue() identifies both the request queue
being searched and the owning vUDC. Derive the controller from that
endpoint with ep_to_vudc(), as the other endpoint operations do.

After this change, vrequest::udc has no users. Remove the redundant
controller backpointer.

Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/usbip/vudc.h     | 1 -
 drivers/usb/usbip/vudc_dev.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
index faf61c9c6a98..5ef0e7d9b23a 100644
--- a/drivers/usb/usbip/vudc.h
+++ b/drivers/usb/usbip/vudc.h
@@ -38,7 +38,6 @@ struct vep {

 struct vrequest {
 	struct usb_request req;
-	struct vudc *udc;
 	struct list_head req_entry; /* Request queue */
 };

diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index c5f079c5a1ea..5ef88117965d 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -333,7 +333,6 @@ static int vep_queue(struct usb_ep *_ep, struct usb_request *_req,
 static int vep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct vep *ep;
-	struct vrequest *req;
 	struct vudc *udc;
 	struct vrequest *lst;
 	unsigned long flags;
@@ -343,8 +342,7 @@ static int vep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 		return ret;

 	ep = to_vep(_ep);
-	req = to_vrequest(_req);
-	udc = req->udc;
+	udc = ep_to_vudc(ep);

 	if (!udc->driver)
 		return -ESHUTDOWN;
--
2.50.1

