Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777278;
	b=kYHItt7lmUmUshTidzXBMHZRhmv13W2W8t1T/lmmDstm9jbuwohY2GkxdBjUV88IQ38T
	 F1vObXfepQZYNYlYxrk8Iqf80gCahOd+kTJMnvjG0JMHMApFjUeY1vCYgnU9bV3FeauHX
	 8ByPDQ6UrCwFt+d1qQrTyt1ZTWy1G6HN0paxi5s2SpgXDr8+K42xTsnul++apfY41Xm9Q
	 PVJ18GOgB7vHjGFpch09OcbeIulPv32rb3W+AaushiXvZynN7v6VerhrJC1qRozBW/uIe
	 N7U4UfDIBy+T2wnGDFS6O1ysAkXczrl+3vxtdoA8Pfo2WdaCUVhjUA7X6XsTXD2mSFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=truzcLzI1/fzEeSBbN3XZWCls+HY9QGypr22D9AUbNQ=;
	b=Xfg8iWpkIwhOJXRPmOeZ+DAh4MgMF+1SotktoIdThL3ypCh7Ummq8BqgH16xieJAbhQp
	 zKVl1nw+jyiz7zHa6LT/erBrwNRVMVWRPZw5niQgeGMZwOX/6pJxQmYaoduFXJnLvE42z
	 O/xXYDLpSpNQqocJSk/GUsSNHgn+mPtZyt80PBZ6V48kYhf22i81WILJ4eiArzFFNoai8
	 IivML7HTzVe/ECp18JLVy3jcOEv6I33zlXNm5TVhRGGZ+g8PDxgjteyiVshaZJvn/4MuC
	 1BUur6rqGlU59AMV+UFaCgTKDI+i4D9eK+ge1pwM5LDxmGjXwYjFmCsDyg8qakeyzwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwq7HXJ3;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A28606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 17:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A28606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fwq7HXJ3
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so8198601fa.3
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 10:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792777275; x=1793382075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=truzcLzI1/fzEeSBbN3XZWCls+HY9QGypr22D9AUbNQ=;
        b=fwq7HXJ3055YN84gik4gwErUSx/7NlBw6Abzp7HJ7SZ23AouCbTUXRGUqc2YRPxA5D
         Q/qIsx0eCtwq71y6UROQO0s94tvRyE+o74UOkoy+20GzDVNrwSXdjg87lmRwDEvBYiug
         tHGiLyCKPP/3PH9Sw4QYDFCiSlRfzjIG8RfHuw6EbRyNcPLrA+BfIyKrfH98Gy8gXqvl
         wk6jHPWeSSETItc++bdi9NftMuVAfrgCRxT0lLWpK3WofE4YWnKwVh72sTQ5mabdAMbQ
         PbBH97IAH5Z5WQGB+BKC76trV8vqsUTa4inKJA6J/sz04L/tAO872COL+f9CDA8AnLje
         8EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777275; x=1793382075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=truzcLzI1/fzEeSBbN3XZWCls+HY9QGypr22D9AUbNQ=;
        b=gXAxs3tmyfYhNK1WEiLJ6b0c3+UqsHn5+TKHjb17ZqBq9xz4Ial0AKLwY2GqbLCWdo
         oXJf4YZF1FLwrAac+djnpx+UmtC02g6ZXMYAYbIDxzn3wTNLa1qwc0izlw+yNXTAAVK2
         R0VAXGLueGYUxgEYyPONnTQTKyMXBigzAkvZ2OUU1rKypWX8p35mWM4c548obIm0bEKe
         JvyJUcA4X6ltE6lTyFZBMCZ78Lc9tTgrx3YhSXQEJE8coKcRdj+kM4gl4uuiGDEhFjXZ
         0A2KNMlIW8q0LSInpK5z61qDhShkjImcAHcrF7tRXAzKbHUVQjh3F2V3IVO5ZvrUro4o
         S41Q==
X-Forwarded-Encrypted: i=1; AKwUvBwG94yb2lSt007iC4gi6oksVmovs8xXgjgOBwvnnEGatspE9AneoBSQpeSmnnQ3KuvykwWd5BQKIuU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwuuMg3F2EU6Xhe/YKgdXJB7kiU8K6ukw5bsjllHRRumzV0wmD
	S2LSIkQFHJXbEC7JipOj9+HD6prykbIaWc31x4rJgtitLp53UW9/jujZP+AlLKi0m+g=
X-Gm-Gg: AYBFou1g1K+jG4PcY6/6YNHr1x71DY8UrujiEIdvytzGXcnlApQmxSR9gOKlPzIfXeq
	1qxFOAHS7pDaJEB0WQG4Eh4qLaHRqqyxNEuXNjtWNOw3Xls87CfxGwpUM+6W5Apy+d/FcoBXRP+
	0Qx4MoWZB+lYOfy5rn7is8osAO4G4mkIuoFQL05AiErhXHwC0Z0Ddm7hTo3/hkaQDepWkY+XOqH
	+s8y1kqedROVMmebPJJiIr9u6iH6N1R5QfHH0H6+cRYyBpbFpWGe5Xyh/ATKv7apkkOq3RfWNqL
	7G4m7TX1AiPMJ42uFEByfKa9hBquoN0ZS3LLkiY33SP3oRmM/o+mAr/GvfVvUiICzmcwJsA5erO
	Iq+lLzKpHZfM5Uvi+g6N0UsGW/Mwk7Bhd43EmquOZXYeGYbn8P7kjgNqjt3Hb6sawhBFsfkludB
	YQwHnWq0WD3vkCtdJErGBxcx71t2/xtOjbjD5y7E9C1PGzqIoyFtyxJWH4fzYBEvgHqLpbP8XZC
	S9ZeDn4TRgCGQ2HmBsPNisMgyPEzx/RyWG9vEWH+yzmVOkuzwgc0cNt68xN92rQfYlsLoko0AQm
	TjTZIzKt/M7cgbZMxMoCn4Hvtxz7Y6q0rjDwaJbvJH3AdMsoNrAPlN2ROP/VNtiNoTWSrerYWsr
	uJXNBAw==
X-Received: by 2002:a05:6512:3984:b0:5be:32b8:e32c with SMTP id 2adb3069b0e04-5bfb0b3e2c7mr1148573e87.35.1792777275127;
        Fri, 23 Oct 2026 10:41:15 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb670e8acsm59975e87.15.2026.10.23.10.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:41:14 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: [PATCH] usb: core: hcd: cancel giveback work synchronously on stop
Date: Fri, 23 Oct 2026 20:40:15 +0300
Message-ID: <20261023174015.54793-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
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

When an HCD is stopped/removed (either during module unload, driver
unbind, or an error path in probe), pending URBs are unlinked and
completed. However, for root hubs or HCDs with giveback done in BH
context, the work function usb_giveback_urb_bh() may still be executing
on another CPU after __usb_hcd_giveback_urb() finishes.

Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
the embedded giveback_urb_bh structure after it has been freed,
triggering a slab-use-after-free write detected by KASAN.

Ensure all giveback work is fully flushed and cancelled in usb_stop_hcd()
by calling cancel_work_sync() on both high and low priority BHs.

Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueue")
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspotmail.com/bug?extid=a5b220cacb0618384d5a
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/usb/core/hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..0b7d30900f7a 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2787,6 +2787,9 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
 	/* In case the HCD restarted the timer, stop it again. */
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	timer_delete_sync(&hcd->rh_timer);
+
+	cancel_work_sync(&hcd->high_prio_bh.bh);
+	cancel_work_sync(&hcd->low_prio_bh.bh);
 }
 
 /**
-- 
2.47.3

