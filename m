Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794089960;
	b=N78Q3qGKijHGIVqqdcR2BDHFMBvPMBI5CkH/7PY38AnhkDqNhzS/m/8Gp7v89Dtch3Yk
	 b3ECwEZFdsPwtYikJdlHk7gsBg+JvgdY5GtGVnthi0i/IqPiA+h4mWCo7yk7WiOyjhKc+
	 vst0KO7Gw9KJDmFgbBmcf05/JMbjkOqTsVlnVwHpRfiGawd/6tuccJOh6Zxf86riiXfPU
	 1ZWthiX7X0GhH9v1L/851/Jt91v8SoKBxywtUJ/f0Wz+B8SMm0u30TKc5vHE+iIrnzTNk
	 0fGpaWjayQYMr1ysKc2gS/rfqVaC0E70QkyPWdmjcLaKnt5Nk6BFa5ErhCCbAjCPT/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mC2u0vUUXfAcht3UeB6sS34d5oV5j/9WVSnyafoVF9E=;
	b=3XNZQzxVYpjtznc09jjaXqIiLUiG4AdDO/t0eQtQk9P9Oiag2st4yC/11o+IT6PX2GV+
	 QLQq++iyP5JhX3NG3Feav0QugorncoG+AYG3aa9PA1syFqvr3WzMDQSBqtE0vZ/+wQ4mo
	 UTEM8zVANu2I3a+IIxbr/ub/IUOw7yWMEh1QLIr30tIljU9dWIg1WcxSboz7iakuefXs8
	 KPxnTh/1fietbUD0rTb0IBnehhsCqJAFIjk1efIZXC//B5nqN4fWz9pNPW7XXPUzrUbOX
	 mwK8EOyJV+BBHF7xA5O5gEdrB50aKRkj1tN2mdtx7FJZ2/6NP4wJiPRBUBP+Yn1RJcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qw/4HWuw";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A460606D807
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 22:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A460606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qw/4HWuw
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4550d8ab15so5489866b.2
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 14:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794089959; x=1794694759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mC2u0vUUXfAcht3UeB6sS34d5oV5j/9WVSnyafoVF9E=;
        b=qw/4HWuwg2WHlPYs4w4+6HZZGNYix40p5q1PClBBb75bpM/OFOGzBZoBtqOshx/ehX
         NrvU9SYGaIvI9rDZYrSndfWENYgxQVImvywQSbs9U+0qdXMJAagtY3+1ogqB1SYUnwK1
         q68O6zAT3N7nP758LpE1my+WAz3CH4wYPxljvZH1GIj3qK2C8xDIXj6wuVP/eU2HqUUZ
         n/iwOj1uv1HjTnqqITN+QTmhNS8SKD4HN08/jh3cAS5t9dDminiegVYf87rO5UNOGtJr
         MQqBQtbVffwIxYC9clD4QZxZFBNZKafkal9iyTneJA614yiQItovEVvPh48ldZ7HavMS
         5Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794089959; x=1794694759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mC2u0vUUXfAcht3UeB6sS34d5oV5j/9WVSnyafoVF9E=;
        b=qwobMDBuHw0/5okAnmN0o3lTk+XKQjptHk6FIz4fo35CvjdsjC1/XrsTUBYn+bs0od
         v7WDIf3FgtrWtlGn8EFW3lybJF8hsiDGvvkRDrpPVIyTDVmVwluzt++BIp3sGiT5aRV1
         thmQiuWacPnt4T7I585ICIO13N0WWhCUNoL24bXWrNsHTdljQkqE0ECN5ND0ghwrle/B
         7lxydSZuTve+x5eb41izA7hnQMALbxpHQfex6z6fAUAloJK+vYckeXYyDqEh3BDQ4uiT
         QVAoFNFPObCRqNNV/THyralq/FU+kEYXuZWSMKZZLn2gd2N7SjG1YA4lwoTDj4m/pVd4
         DSCg==
X-Forwarded-Encrypted: i=1; AL+hErHE6JL5lE2Pk+/0G1EjbAjI+pQIqsABHkTvfZw6T2v8qRStFZ/SgS31/r+UBMPahxVzT6vXV0d1/CY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/is22HBeYGvQlcTXoW7MWlDEc+qSk/ITJY1w0Enj/sbWX0qSov
	JcZwS5cV3IveTSgsuVCmasfW+73QY0316eT5t7tkFMhvK+y4VbUze5IX
X-Gm-Gg: AYBFou2SQ62mzIFB9FIJfnbvrqNQUNRyqN307sf1ByCSIsJbUXVL3idRoT635ywbVk3
	/l3t6EA0o4os02pYEl8/uMXM4T9BKE/VMomFPcpSpnw9IGHheieYl8F26tgdAydaN0CrqZBhUaH
	ZHr9Yg3fchikIZwd38RgEmlqbyzhq0z82Lc01x2H1bjqN2dJY9GTevsrLcZEjxcS+qLHuX4kjgd
	p+Hec9Zi7GyOO8D7Ruimn/u4hY4JzzXyanNABJclE/S3G+L3BR+eu2HlCerqVmtvCxaKqdQOEPO
	+QOdjxguPCEjDO52NtJxbXfOtYSSaQJHadYyRstGPKPl7TiWxbYkwobkqVdZEG/1fbz9PaKxvYU
	ycIG2KCprYbE93wO0qhNdLeyC6M2yRtMYDP8mCSwkVGHp06rayrC43AvENTYkV5AKa1pkHhG1/O
	hlGJNNFfjgbEZr+r982ppuWg7o5REVMxsXq84VcQyfvwJlHEpPnDMg6bLvw1dYZ7H0zVTczIwhq
	b1xVK2bVTi06Qxs/wttUxyqNjo6Pxtf9M7naq6NQqvrT4babYItRDQN1CuzEPDoVApBZHA5jKyq
	F4KTcLAgj4qUMS4rplIDBw00WYvXlWCOlIaFCrdqi3xuWtwCrpWDRjniBes=
X-Received: by 2002:a17:907:6d16:b0:c49:a4b1:9cb1 with SMTP id a640c23a62f3a-c4d6d160ecdmr19605866b.3.1794089958683;
        Sat, 07 Nov 2026 14:19:18 -0800 (PST)
Received: from frame (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e3dsm14108866b.42.2026.11.07.14.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 14:19:17 -0800 (PST)
From: Elvira Khabirova <lineprinter0@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Hubert=20Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elvira Khabirova <lineprinter0@gmail.com>
Subject: [PATCH v4 1/2] usb: musb: gadget: count givebacks in busy
Date: Sat,  7 Nov 2026 23:19:03 +0100
Message-ID: <20261107221904.82487-2-lineprinter0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107221904.82487-1-lineprinter0@gmail.com>
References: <20261107221904.82487-1-lineprinter0@gmail.com>
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

The ep->busy flag is used by musb_g_giveback() to signal that
req->complete() is running on an endpoint, the ep is busy and
starting a new request is not appropriate right now.

It is only a flag and not a counter currently;
musb_g_giveback() saves the old ep->busy value, sets busy to 1,
releases musb->lock, runs req->complete(), restores the old ep->busy.
This works when there is no possibility of two musb_g_giveback()s
running in parallel.

This does not work when musb_gadget_dequeue()->...->musb_g_giveback()
happens at the same time as musb_interrupt()->...->musb_g_giveback().
The above save-then-restore can get the busy flag stuck at 1.

  CPU0 (interrupt)                CPU1 (usb_ep_dequeue())
  giveback: saved 0, busy = 1
  unlock, ->complete()
                                  giveback: saved 1, busy = 1
                                  unlock, ->complete()
  lock, busy = 0
                                  lock, busy = 1

...and this gets the entire endpoint stuck.

This was reproduced and the patch was tested on a Pine A64+
(Allwinner A64, four cores, no DMA) with PREEMPT_DYNAMIC and lockdep,
using a specially constructed f_fs function that keeps two AIO requests
queued on a bulk endpoint and cancels the newer one with io_cancel(),
in a loop. Tested with both a bulk IN and a bulk OUT endpoint.

If musb_g_giveback() were to be started from some other context,
the same issue would come up.

"Promote" ep->busy from a flag to a counter.

musb_gadget_enable() should not reset `busy` to 0 anymore because
musb_g_giveback() decrements busy, and if these two run in parallel,
it would be problematic (cause an underflow).

Signed-off-by: Elvira Khabirova <lineprinter0@gmail.com>
---
 drivers/usb/musb/musb_gadget.c | 10 +++++-----
 drivers/usb/musb/musb_gadget.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 016d3f3fc..b500e0d8b 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -129,7 +129,6 @@ __acquires(ep->musb->lock)
 {
 	struct musb_request	*req;
 	struct musb		*musb;
-	int			busy = ep->busy;
 
 	req = to_musb_request(request);
 
@@ -138,7 +137,7 @@ __acquires(ep->musb->lock)
 		req->request.status = status;
 	musb = req->musb;
 
-	ep->busy = 1;
+	ep->busy++;
 	spin_unlock(&musb->lock);
 
 	if (!dma_mapping_error(&musb->g.dev, request->dma))
@@ -147,7 +146,7 @@ __acquires(ep->musb->lock)
 	trace_musb_req_gb(req);
 	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
 	spin_lock(&musb->lock);
-	ep->busy = busy;
+	ep->busy--;
 }
 
 /* ----------------------------------------------------------------------- */
@@ -162,7 +161,7 @@ static void nuke(struct musb_ep *ep, const int status)
 	struct musb_request	*req = NULL;
 	void __iomem *epio = ep->musb->endpoints[ep->current_epnum].regs;
 
-	ep->busy = 1;
+	ep->busy++;
 
 	if (is_dma_capable() && ep->dma) {
 		struct dma_controller	*c = ep->musb->dma_controller;
@@ -195,6 +194,8 @@ static void nuke(struct musb_ep *ep, const int status)
 		req = list_first_entry(&ep->req_list, struct musb_request, list);
 		musb_g_giveback(ep, &req->request, status);
 	}
+
+	ep->busy--;
 }
 
 /* ----------------------------------------------------------------------- */
@@ -1061,7 +1062,6 @@ static int musb_gadget_enable(struct usb_ep *ep,
 		musb_ep->dma = NULL;
 
 	musb_ep->desc = desc;
-	musb_ep->busy = 0;
 	musb_ep->wedged = 0;
 	status = 0;
 
diff --git a/drivers/usb/musb/musb_gadget.h b/drivers/usb/musb/musb_gadget.h
index f49f25b3b..95bc746f7 100644
--- a/drivers/usb/musb/musb_gadget.h
+++ b/drivers/usb/musb/musb_gadget.h
@@ -90,7 +90,7 @@ struct musb_ep {
 
 	u8				wedged;
 
-	/* true if lock must be dropped but req_list may not be advanced */
+	/* number of givebacks in progress; req_list may not be advanced */
 	u8				busy;
 
 	u8				hb_mult;
-- 
2.53.0

