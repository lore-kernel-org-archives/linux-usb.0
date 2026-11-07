Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794072986;
	b=RALbi1aRFai3KtOVKM5Av5bi6ZYHxukIhvUYxxw3k8vwxyiSd1C+rM5bHJaWHTDruvDC
	 I69Q8XZMkuMEzK9CPMuhsDK7ewv7kdaOH/7LLJ8dm6fcABRkvmBIHl1M0JcB12uKYaZ6p
	 iIFAnQqMod4obHzFVKIaSx7Kum18lfvwlFm+/tfd4K2LpmS/IUuwTeWqcLrm3MiZ/FP3I
	 F94stbekPprwOIUnehiBtWQSv0TP68f72YefXN837Js5FwJpTUqmn5a/W3fmFSXiF5zxc
	 xZokDbrZ2hhXPNZ1IVNF/H7lfDE1e+YUTTTsjwb3MTw5WCkR5XwaBMu7+/mQDsaIuqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794072986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mC2u0vUUXfAcht3UeB6sS34d5oV5j/9WVSnyafoVF9E=;
	b=zaPJcKHKvDCSsmguUdEZClJU31wZKPOu2PMgLcRJoQJMkbYJzxNNz0qkxxACx+hVwINe
	 0C4fP0vSfSVVDOuQaGeKs/boVvwFj1BdY1ryyyzfdLP2jAyHeS14vJKey/iiHQihd+mdp
	 cOke6W7YAW9xN4rj/d3oFoOjsTYfu+qFOie8h4CVF3/ifldgBPZGwvjWe6imdu2A/r/Hq
	 PhiyMnsZoX4TD4038fRSYNc4IOjUVu/sORH5p53bJC6V31KKkATqiYSgy7eNydGKa2RLm
	 V1AsQNU8wMbTd0mRZhHZer6r5Sf7IBiRk0JvNZNDZVufp7bm78bfkrhKlz6J9KRsz6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcWuYdtK;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85131606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 17:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85131606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcWuYdtK
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2692455a12.2
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 09:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794072984; x=1794677784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mC2u0vUUXfAcht3UeB6sS34d5oV5j/9WVSnyafoVF9E=;
        b=LcWuYdtKzAQXjAiGkMtC7MFNLWxj5VWUkZsCGKXE/bHjOzCY800sS0xQ6APOiCApor
         zKE/pNrCyBlWUBpEKaoTFG1lNH0NlVdxnCYxjFnyCA+2lNqxYh0O51TqqxVrN3bVS9c7
         C5BJyHFx0y7nkJoPqVS5anAsm7fgUOi66fq479C17gGqt46M9CtWYSAYR86DWkONojQN
         TQErmaSF+CGLq3Ip4mpd9Twi2UEAzgXVCeR/iMIh3oMWL8oq2P+uCUljS8a0LhWrokIl
         HcmlLk+y7rgGcvfXCo+WUO5ezv5KAxsyf/+smhk+U4S9itLfTCnHDm8odwUKws6ZHBqR
         vmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794072984; x=1794677784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mC2u0vUUXfAcht3UeB6sS34d5oV5j/9WVSnyafoVF9E=;
        b=YNjqa1zIeig0Q6LF1RajYPFgT1VL4OXR+6Obm7oRL+QfDABLW+UTeja3PB+mBrjhNP
         U2SuyeUo1Gw1PwfugT6Ik0w1OSSiuXoQJ8MLx5t6hMFGWHRC+0Yjvw8AE7hAN3xEisMn
         kA2Yrk4exMgRauFcjSpaIpQvTd5mQ/5XsGffYmD3iojgBTBdH5kweNOPS4v0vFNKFE/x
         Db7UDZHV4cUWF2XXAQ6w3KPBsJIskMxhzG4aJvMUy6RTxNnPbhCHjA0EeHpi/Yw29WMr
         JKJ9Xbl+BzqL4Nj43XOp5n/nALBjU1T4xqCbQCi1UTfirYj55cQZSa2rnvyo7UQ1jDTa
         s5aA==
X-Forwarded-Encrypted: i=1; AL+hErHLjyukUKQoYZRpnco1+rupOgbNBGC6Ese4CK9sf3EA+wb6IOlRflJFcOV1egH0qa4c+stiWzfDp5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fYuB59ZDeWjMy4WtfmjeQuPAjyQn9YiQBCOtutbmDcdzd32uf
	rJOYVBd3aHmcaMdhevzkxg8lavbvQ82oEyBfILxcMHbki69KYmNa3yMB
X-Gm-Gg: AYBFou1t6BT3/1VunsGDdchjaVGKYgMBmvCDT1iFPUgHdYUoH8elvKnI5HB1BGZy92Z
	cVKEWRNuP0FYG/9o+umsqXemJXVGppKwdOICsHaGMIIsRIJAmYGZIxmK3hVpbpPihPbpqJlkZOn
	8dM3VLem14bhYm9r3yvDVxcPxK4AgFrb1WHM1WoCjpXteL76yXSJvU+wWtuAj+xkCY8iVZT1X9a
	dIQoJIt7IyCHlNYh2wVLvN7Z30WwSFZg0SbYYw6qWvuuXOGqG4frGgIrZ15cmROWfeR0STrjqiR
	Hi9w2HzpcCaUx6N9DDzSBtUwfiZZbPdlU/ymQVSQGqJIxW070qRukoiZ1OvlpOg4uje/0Sapo6w
	SlYBwj5WEnH8pfbFcQKLe6oMpqHFA5OTKge4lnMWGf6jI4zh5xUiyp+hUfWTeIePzXQSSLcgY7y
	AI6+dLQ1aqYnUpV5FvwVHOluDeGRiKFwUy50BM7MWw75QdhydwqdQeQJDr3LW6EGuNm0QTjg4vt
	HuMDBj79zgz9xsnxvaBGRPM+Q93H1wLf9NHVa4phjmjRwHGV/7kf+5BDCiZV4KyOhrDGPAWP/u7
	lVqt14oj38hjIAvv+YbHc1EuR91Pt3PKBXNM4spYdCBTfNoG12cQeecnEZc=
X-Received: by 2002:a05:6402:27cf:b0:6b4:16fb:b9ba with SMTP id 4fb4d7f45d1cf-6b5977f7062mr3789365a12.36.1794072983832;
        Sat, 07 Nov 2026 09:36:23 -0800 (PST)
Received: from frame (h-155-4-132-44.NA.cust.bahnhof.se. [155.4.132.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664afbc12sm1890076a12.22.2026.11.07.09.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:36:22 -0800 (PST)
From: Elvira Khabirova <lineprinter0@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Hubert=20Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elvira Khabirova <lineprinter0@gmail.com>
Subject: [PATCH v3 1/2] usb: musb: gadget: count givebacks in busy
Date: Sat,  7 Nov 2026 18:36:00 +0100
Message-ID: <20261107173601.63095-2-lineprinter0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107173601.63095-1-lineprinter0@gmail.com>
References: <20261107173601.63095-1-lineprinter0@gmail.com>
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

