Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274496;
	b=xCh888+QnDL5f5PdJe8HVsc7tm28aefjM5kGphxf6Z1byJhB/AnrYi5mlgCLmAt9SJ+K
	 oI17WqczBgkoz61q8NFpP5o6zcWGHWSMXBHYFToVF73b/k1B1QSADI4OJGUnrZcvd2IIV
	 ZswPhtQna/rR+nCf5Sui0tWuJGlbDdB4qD4JQ15HmYXmdNxdBjTDM9QKx+EIYDjilWV86
	 r7uFytRQOGx13EAlWd4zjecaVNSqUziSgHuD6ZSBgTTzloAmNs3OUfdknIXrfFIzCGypJ
	 0RzsZDlZ4LApGWJG991D/6AtJEgJKN23Oxc9z2lnoOUEMM6IfJ0QhrgTxcZA5eBGuXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gBO3tNs4xZSFfJsp71E9vsflV/DM+3aq9qA/XCCsF90=;
	b=GH7Md5sq9oIFcHNBjpQE9gEeAfotp98oscx2rTIyfJB55DangbqZPV/fKA7V4E+SUzw1
	 smI2e/YSzaee4X26jsf83zdIacf6X9UaW3CQyJTsuqJsemISHJHTeqWDZu6yz7LZXrMac
	 Qdi2pX+ccsgVL0abCRtDv/Cpi6ZKJ2k6SrlcDdnuBZHSYCD6rL6IlZ6I6+cCR6f1MBKEI
	 70nsY+TKBozUSpVLNK2gGVkmJAXS5Hp0ehQTbmncFxwjefFHq0CJt9L1qFf0v2PUZI71u
	 Yky9D8+E6WhsBdZx7s9oMchSpKhoegXIvCpqM3YLacuYMIBEQTsYzA/BSW7W5WDSLXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=banifaK0;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4898C606A325
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 11:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4898C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=banifaK0
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1861251e87.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 04:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793274494; x=1793879294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBO3tNs4xZSFfJsp71E9vsflV/DM+3aq9qA/XCCsF90=;
        b=banifaK0UFfcrUjrBbyfYtcH1M62FJc3B7U3lonNdqtbMRiWEu14G06UtrHq0WP8zZ
         cyqoaLkXbVlJIrWv/7faWMtAfWmsNaOic5nUQ3pvRuEsYUPouLMlBSIKYJS9xv8w9jcK
         YVbw2CyJo77JqycvfM0j8GkWrdPCqw5hjaJitlHPdqaZARbw0Rj9DSAGNWOeBj2jKL3g
         bmqKUxDSJkyqrAqQr7RE1MB/SOnVQ+01O0GF5X/jP5ZmyaiVcD9kQTlHNtOgz5wL7RUY
         rP2Bimr4tZOtsaHMfegFjYjeq4kQLkhC//gWF9CFX3X8rw+b94JsO3qsgTkI6pZiHR5x
         IUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274494; x=1793879294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBO3tNs4xZSFfJsp71E9vsflV/DM+3aq9qA/XCCsF90=;
        b=pBajlY/qqkhUL7tluMjYqh0SJO47/6EHfnKEd7zw1bMJHCHotRRZTul1XLHZnFgFCf
         mp8ReWWMYQozL9/C/JxX15jfdZojWXk03Qm9zNU2TYjfUmXhci+nI2lbk8YCRRl6DER6
         Ce8U4UdAlj25OX+ZH862iNQ38d2wHHCu6293YjOU309BkHXUVRCgqcDiqkxvUWLIWaI4
         2HuaO1QtBSP4LQ+5cFXzlI9i7RZIdLlmd0axO8G+S8tx6LBjjGVtd+ysX2l+sEoAPC6W
         MhxSFbYZ9erCJy0CHLzPxhFuSWKe/6M97PxNBgqGdDH2cZ5CYJYNX0wJ0hJv54BnN5Xq
         UgCQ==
X-Forwarded-Encrypted: i=1; AKwUvByygJcd+RgHpKjlYHYtN4rgx/uRdXhPjS/RDBQKpaKHbjGcaRsukWh0UtPoT00EWVW+FOZSjbwRo7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDPF3ofwOcTwYPekZGYA2x6dLZrMvnanzp9UDL8+FcqVeS4Ghw
	Tn/6+4OCgnpJl7aw5fFimluQa/hSGEZZRM3wyZ9+HBc5t/sZAuxZ5M6q
X-Gm-Gg: AYBFou2PD8i3deck7P7qHGlXLJkFN3i+yFR8r6AawIJXFezu834gpJwQ+NHPpzW+j/c
	GjNZzNSdFls6urgm3bpTYG2h8eheSz9LLs6A30OefA+b03dfPDf7vUh/7TCJ8mkLCQGmscU/mf4
	39L168ti/X6IrEb/Na8e+jTOD8CyJlvL1LO+ksfWEQ0clw7gzYyAgxysbvtog05bkwZKqCvtSO6
	sFCU3LzxqtSTwBnHBtC+sAXOsG8CIR4BMo+nt6o2j6rsCEbsgFqC3kXUz3loV1yn5Q/dLFd+Ty3
	078K0uD1fx94AS/xeGfiy0QT8phL+UCPMPgV3uJ9fmIecCYePYMVKgWZBJQoovKGjA3HJ5k08Sy
	A4LsVSiQoTA/uurTp8NOTBDtTY85PlsOdRx3pP8OZObXg94djsPvnlgS5MhHdlpdbD15iUqiPPN
	NlED4Wou/pFizuFk7PRlUqPH392Zk4iJRUFbknl7n8c+pXbXa9cZbHxcwsobv/DQb8Uds4eyhMz
	gx/GQJELNrfbENCql/ZwM5U002EGY6Uo1+YRF/Gp03klGL+2VsDnYXhZOVc0UPPz6xuQxDvoY7P
	DXjCtdzwSHVYm1va8urtkTLV4Okg96/Ea5im6SZr9wMxVsnIwZ20B0TiiOlL4Wol6wPGa5c2H06
	4mfKxd8LqIgOoIfEieYouCkV861Vcb9p1Fg==
X-Received: by 2002:a05:6512:3402:b0:5b8:f417:dbef with SMTP id 2adb3069b0e04-5bfcad3a1e6mr1998269e87.60.1793274494203;
        Thu, 29 Oct 2026 04:48:14 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5c9ebdsm1144138e87.84.2026.10.29.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:48:12 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v4] usb: core: hcd: flush giveback work on stop
Date: Thu, 29 Oct 2026 14:47:33 +0300
Message-ID: <20261029114733.2688-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261024155614.2732-1-igorpetindev@gmail.com>
References: <20261024155614.2732-1-igorpetindev@gmail.com>
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
on another CPU after __usb_hcd_giveback_urb() drops the URB use_count
and wakes up waiters in usb_kill_urb().

Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
the embedded giveback_urb_bh structure in its epilogue (e.g. clearing
completing_ep or clearing the running flag) after the memory has been
freed, triggering a slab-use-after-free write detected by KASAN.

Ensure all giveback work has fully completed in usb_stop_hcd() by calling
flush_work() on both high and low priority BHs before deallocating.
Also remove the misleading comment in usb_remove_hcd() claiming
flush_work() is unneeded, and document the queue emptiness in the
usb_stop_hcd() kerneldoc.

Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueue")
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a5b220cacb0618384d5a
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
v3 -> v4:
- Fix domain typo in Closes: tag URL (appspotmail.com -> appspot.com).
v2 -> v3:
- Remove obsolete comment in usb_remove_hcd() regarding flush_work().
- Add comment in usb_stop_hcd() explaining why flush_work() is needed.
- Update kerneldoc for usb_stop_hcd() to state giveback queues are empty.
v1 -> v2:
- Use flush_work() instead of cancel_work_sync() as suggested by Alan Stern.
---
 drivers/usb/core/hcd.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..f403795b17ba 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2773,6 +2773,8 @@ static void usb_put_invalidate_rhdev(struct usb_hcd *hcd)
  * usb_stop_hcd - Halt the HCD
  * @hcd: the usb_hcd that has to be halted
  *
+ * The two giveback queues should be entirely empty when this runs.
+ *
  * Stop the root-hub polling timer and invoke the HCD's ->stop callback.
  */
 static void usb_stop_hcd(struct usb_hcd *hcd)
@@ -2787,6 +2789,13 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
 	/* In case the HCD restarted the timer, stop it again. */
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	timer_delete_sync(&hcd->rh_timer);
+
+	/*
+	 * Even though all URBs have been given back, the work routine itself
+	 * may still be finishing up and accessing the usb_hcd structure.
+	 */
+	flush_work(&hcd->high_prio_bh.bh);
+	flush_work(&hcd->low_prio_bh.bh);
 }
 
 /**
@@ -3059,16 +3068,6 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 		usb_disconnect(&rhdev);		/* Sets rhdev to NULL */
 	mutex_unlock(&usb_bus_idr_lock);
 
-	/*
-	 * flush_work() isn't needed here because:
-	 * - driver's disconnect() called from usb_disconnect() should
-	 *   make sure its URBs are completed during the disconnect()
-	 *   callback
-	 *
-	 * - it is too late to run complete() here since driver may have
-	 *   been removed already now
-	 */
-
 	/* Prevent any more root-hub status calls from the timer.
 	 * The HCD might still restart the timer (if a port status change
 	 * interrupt occurs), but usb_hcd_poll_rh_status() won't invoke
-- 
2.47.3

