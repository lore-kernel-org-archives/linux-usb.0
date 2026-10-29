Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257032;
	b=NyunW+x+o15DzGgMSQWPJsb/UdyOLf/EAJwYzuHqq8yzClH7sVp632fnj6GJp6HvF+4Z
	 50fZxm37E7dBksRFY1Vbrnq1r5gECsv3bpgK5L6Xk5mMeG/1GiVzB7Z/sCgJ5QqsG8VAK
	 xFfKC6pAJLYoNa9ay9NPokckbqTbx3rbHIqEcTyPHbmyxJlLmxpTNxl/m8zxUvJzgZx2F
	 mlUl77wDmZRMUiuokMvDKhL4aBQpWESBOl37pmK5PeHJWVBySPGjzmFPebu7UQdrNXES3
	 M3IRB6IkyEyj8Nq/MTH6PZTJhiGSvkS4FPTihpw5A/bYSAFbcPlmqoHAnXOamQ+G9qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A30FZzabbD5cMKb9xpxtiuIiZ1pI6R+Xz37DjCLPTT0=;
	b=Ana8NmWMsS6albwArM24+4MO5vMbkzqk3T1lGvYktz4nNcPUJKPJOylxekk+dVaYXpn+
	 Or7gb7/PG8wiCxg+WoDUmUQmhtAouE51Waz7D1vlV+LXFZlm6wnrCfKzl2IXiWLXBm+kx
	 xfz29dCiKf5POrKDFO2DNAknfBCFXMXsjfI/eXK5vhXI6/qyyQNGvXMl+koSXk5bAd9Ad
	 3nXbN3wlWkxYoSltlwEUYuaKmWyRyWaMCaQf68hQf7aLzTGv0HY6ib2ElqJBDA47F85CX
	 MsuggCeZtBECzdnvXvAXT3K7NUtAYyC1q5cYXqriRrdEZYmGMDX8JKJDbjOOlFt237g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FS5ACMcj;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21566606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 06:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21566606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FS5ACMcj
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so14561445e9.2
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 23:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257030; x=1793861830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A30FZzabbD5cMKb9xpxtiuIiZ1pI6R+Xz37DjCLPTT0=;
        b=FS5ACMcjAPN+lEeqcudQIs8KyazPxVtumG5y5HyKCiP9G66nr4ud6JAPG6Qxv8rkpY
         KQBGFGlvcpEksEhQluKPEVzwFQDVHTkF6Sb+MSqsrPh6Aq8O3D9wdShNI5RbEG9OOF+g
         UUnMuP7rrNOuG+wIzMVNJTRwKzrnulSMkNey3QeKVuVn/+I1bFSAPisfj6vd9wU0ZWnj
         HM7Dae394q3nD14ggEWlebIkGtrAzTnrGe1i7r6vYi8mi0mOOFDnQwqZwpid0AoKmix7
         ZQrDU23yavlVJp6/raBosM3kfpVpyAUZ6bc4U8IufNDmpJudW+pS5hpKJ+ZcehnEAQJ3
         u4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257030; x=1793861830;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A30FZzabbD5cMKb9xpxtiuIiZ1pI6R+Xz37DjCLPTT0=;
        b=lrNZRumeEBA9L/mR3/EBIdsY8ulAI12+nDyHB5+K6ZNjGGcgGq/hOUpMzVe6ALi5bD
         yQ+5/rG6djZ8lA+gyM45TTbI5XNXo50PaoqEOJ2NFQepLLPva4qXHpgTz3FatJnt0iZe
         E/KHX1Kp8Pr9mgRFO68PU8mx5FRmw5/pQNnFPjv9O2dZDilDDAvqm+pit6Ua4wq0Oh66
         xNM7xQCE8DB/vFDr9xfX7VzFI97s5Zp4NNcY/ZvEjf3XmLYsg7/KG7Pq+/bVkvQOi0YA
         9ju1YUkGUokJajZvCOKjg0MuoDKs5waZ3RUD5IGfP/T6Jlv5EICNTpPvKlt7WR4pyDgi
         OSEQ==
X-Forwarded-Encrypted: i=1; AKwUvByBNi6mJtph/NMUKU1xiw/SyqT5AvEaT9DgQPvuHGPtK+2Gwli73OeaWD/H0D5KCc4gcM1D1/eQv2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYII5aBWkt/R0z+TaFFXRS2tYoB+WeppnS0du9nvMYfEyD3ecWdg
	5andq3KcAk55qh2ZLfN1x2JyqrCgdcucZ1jQTrB08v8YPReQyWNMNewBxJK+o6H1
X-Gm-Gg: AYBFou1vOffbDIEU2dgWh5AxjDZK6Ey6C+OLCelgjcmIi/ucv/E5qKioDhjonQAcL2Y
	d1uv8jAst9UqQBOr0yYDNl31QpjL4qe5xbewU+BxMrX8LXFOuqWFz1bD5lux35PUGfbzHPTdUbY
	NHNolJ8mY3S7qb+P63WQofqPBneA8WRGz+keylkS9R+4l1PeTjc8BrsjpJCTfya32xE/7DF4d7P
	Kma/blsmPbvRHPL0chc9x+y9/+mAd9NhOyW2mw4E3XXP6vkFLF0Q0fQEQuV+1POmVlMq1gZTjS+
	ISCKYbC6wpnHMP0dPilfkJppDNpoLBScO7/j4y7Ec11t7yeCsa6Xe/8r86/2agqBehjCvnI2hgN
	DXzbI9iduZl65gzouK/osqco7O9stVjjfhNKfD79bNxR0iKIgqw5++Y6idfi8Y/I+LNoUam1euc
	nOPp3DxU8M9xffAOAI47Qw4OdxFcjahw7mnS717hfERiZQqnXc5Ipkd3LUEDyhJ6Vtt2U+dRkJQ
	r0XK0o+M9vnBcxRvJ9Nhf+b/fJrddR2FMmISslr7tNzqd3PYixfZnyRXBtI1PV2WwJdXfQ8wukD
	2M7ND3uaV34WMpjQPmWH2ZzDQ2ZTNVrwR/c6SpA=
X-Received: by 2002:a05:600c:1391:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a966c41a4emr99419435e9.9.1793257030439;
        Wed, 28 Oct 2026 23:57:10 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dd7sm32815744f8f.15.2026.10.28.23.57.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:57:09 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:57:06 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 4/4] usb: xhci: Reject URBs to disconnected devices
Message-ID: <20261029075706.69aaa77f.michal.pecio@gmail.com>
In-Reply-To: <20261029075409.4b203658.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
	<20261027192128.386082-1-mathias.nyman@linux.intel.com>
	<20261028080734.173da0e4.michal.pecio@gmail.com>
	<20261029075409.4b203658.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Restarting halted endpoints of disconnected USB3 devices triggers
some HW bugs and we actually prevent this on all devices now. Keep
drivers from pointlessly submitting URBs and needing to unlink
them later, which may involve excessive timeouts.

This generalizes existing check for USB3 ports in the Error state.

Suggested-by: Yiyu Zhou <yiyu@yiyuzhou.io>
Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect or link error.")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e5c8b3a945a6..66b9fed65ac7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1662,12 +1662,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 		goto free_priv;
 	}
 
-	if (xhci->devs[slot_id]->rhub_port->link_inactive) {
-		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
-		ret = -ENODEV;
-		goto free_priv;
-	}
-
 	if (xhci->xhc_state & XHCI_STATE_DYING) {
 		xhci_dbg(xhci, "Ep 0x%x: URB %p submitted for non-responsive xHCI host.\n",
 			 urb->ep->desc.bEndpointAddress, urb);
@@ -1677,6 +1671,13 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	ep_state = &xhci->devs[slot_id]->eps[ep_index].ep_state;
 
+	if (xhci->devs[slot_id]->rhub_port->link_inactive ||
+	    !xhci->devs[slot_id]->rhub_port->connected || *ep_state & EP_DROP_PENDING) {
+		xhci_dbg(xhci, "Can't queue urb, link error or disconnected\n");
+		ret = -ENODEV;
+		goto free_priv;
+	}
+
 	if (*ep_state & (EP_GETTING_STREAMS | EP_GETTING_NO_STREAMS)) {
 		xhci_warn(xhci, "WARN: Can't enqueue URB, ep in streams transition state %x\n",
 			  *ep_state);
-- 
2.48.1
