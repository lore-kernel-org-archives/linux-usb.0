Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792857415;
	b=qHYcJphKQ4zCPydLzWVniT3v4QeVOP3L0WSsKApU4C1OmPcM4zmfS5akxvnM+Sl1sjFV
	 3Grkn9+P1/PG6hVrjnOWGCeD9yGTQBan0KauosTO7lxub2NNg0HRa+GlyzcqsKK/aHjW9
	 +fJjOw4F9GtVOu6C+PstJweWDVyZqSnp3fsCtTIqAgfBBv6bJAjXW3giywLe+Yn52t++h
	 t72pDB47HKoUGYf6oDzFBDBDQSDn0V/YaQurnWIpKN9dG4r08GSpFyZPLqcAmFFOFJGsW
	 hTI0vHFNKHy6Z0afdTaA1Gjh9oD9lb2Ltg78rJna3XB1PZG66DJVQAh+hUW/E5c0Mzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792857415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4IGEtUDUP8hIGn1B6H6glwiRUGb2LO/zEIMANk76MHE=;
	b=iLujvqDwRoQHiK+JDuFSWeVAIbxBJwGnn1Rmp3gLVntvnV+h//bMC3v08Ec6WGf415R4
	 HmP3SKyW9/XVBaxwTwMZcBxwse5mD69Vi8WwdfziXlR+OH2BILEUfJLranzAQSyBTy/z7
	 QxXA6qFBvputjdMZvko7otauegpBPOPvXc6B8W852Has5KhvfpJIAkNixxgLNhwftJezP
	 1Yi2KFGwB68CQQrYjngAb5UB1mlWE5PKbbZFoj/FxWVwUra17CyulS3jQ81LweoBVGiOM
	 auGlp7WntLUfdr52rTR+ImCSq8ZilyHYj8m/5bopvz1ypGHWMmt/GCS3/+diJbnsJbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="cJ/chxiA";
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBDF606A31D
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 15:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBDF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cJ/chxiA
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bccecba199so1433791e87.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792857413; x=1793462213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IGEtUDUP8hIGn1B6H6glwiRUGb2LO/zEIMANk76MHE=;
        b=cJ/chxiAGQdCLJ7qIgX4jKU3DfB4TEGMxUrjXMK3Cpc23TyIwLB+pczz6G6eNaItEE
         4IopNSI8HH2LZSX1BPlG+NShrscu+D+4Tdupw7beFLq3wBIIS3BRvi+orn2WW9gUpnuC
         jDyHVIvW3SYt4sb6iOW3Mh8DpFq/T0WVoavGq5sGELjnu3mZsfoDcZrB4XO72nHAO7aT
         0ifhjkq8x/Rtcu7FFdZfpFMXABvAgkTufOTaE6YL8UkY3mpWnx6/gj1GTgl3T1g4t+Fb
         eQSHldZTJGVlABideEsHp/GYLYmMFU3hXzIXGQFkFRLXSpTK0TG6dOCqRLA9YvJMqUeJ
         yyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792857413; x=1793462213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IGEtUDUP8hIGn1B6H6glwiRUGb2LO/zEIMANk76MHE=;
        b=CudVZgjpVnMuD3aOOtPnPJhZagSN6UOplYKXeNeMbO5LDP8a5Sz0XWOaaWhAF0C6kf
         qiIyFaBSF1vKQuyfs6L1gpGo85I4xsd6GWF79er6DeTOu60bwTfPcPejx6+TgLIAfA0U
         WfMLnpp7XMe9CT0zOyVf7mOGKrN7jBfwIh6hBMGCYJp/IvOMjwjF53iX0EQDLcU5UFKV
         5mUngGyf3k4GkK2+VYs6h92zsbvEVfcU7FtJa5hFnV8k8DZAOfFnc3baFvu5UbZ1oPBU
         InSbch6Z/QlxKFwd1kshpqgBq1ec3R2Pe3edMd7E3jRBeC9ssM4DFuDNnnvxkONISsAy
         V/mA==
X-Forwarded-Encrypted: i=1; AKwUvByWCVdWPnZsngLIFeZITTFkxc1mjrEAkzfZPwE9Ss6htUlk0fX1CHmVYgs2it7hIFj0O+jftB09VZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5asgrE71tWPtdCeGvJhF864OI9dUAIw76BWKHGnAqr3BLGeb8
	Xhb5BCOl18If38EHYJbWqbXjbZSWKh9qZkoprMmF8yZbpFCQY6qdTVaa
X-Gm-Gg: AYBFou1HkyeHgQTR44lUm9dzcWjwhzsxTFPj+MNzPPyQEqpGkAvw2UaCi++P2gvL8d+
	kfVKqxjuZGU+qMQucBSuIoBBFhE+OZSEOzJROqvKPfl5sq2TOEQJCG2jJwCNr4zpzprmljmn8yc
	iS2nTh78OB250oudU+p3JpPrCqIEoYaXJgdUkJJcEyFUmbczZBt8mnvxpdVj4Jj49g3Lp3w4rOY
	Gbc65kfY4sAeQD3C27oNlPK7z0JUysRadbvC0z4luRoOTI1LyhJCa+8PCNu4jyrMGsKbRihEXQN
	wE1GsxHGQBDgugWdz4Y+HP0P0AAllTrcyGHdwpb7IdDq78tdSQhJmsqmsDkfMQ/HxtqwIszoKnZ
	BstJXC/ibfwteSpZtx8paHvmyWyQbUpch/SFny6UBVeM5DaWMqhF4xedI6GfzlrL0zRHywh6w+p
	mcu+Ug9l7JqMgH/mRl//KceoMRJjz5780381mf34yFjH9Dy4m8LqsA3gsi2y+dUmp2DZTHFikIS
	2/3NEfPiAJFepEygww9TEWVivXFvh3mPe2dsVenHUa3Xt64mGCmrgplvKFcCFwnj76w645ZrPN5
	feFipM9QYJ+6yHGmtKPhNyDdx4CugeTyOmjVZtFH1nkj2ERB/9WGKtUtqYehXyYSLtN5Fwr1raP
	w7fkqUQ==
X-Received: by 2002:a05:6512:128d:b0:5be:51d0:e355 with SMTP id 2adb3069b0e04-5bfb719e481mr754446e87.11.1792857412423;
        Sat, 24 Oct 2026 08:56:52 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7d7d6fcsm459298e87.20.2026.10.24.08.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:56:52 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v3] usb: core: hcd: flush giveback work on stop
Date: Sat, 24 Oct 2026 18:56:14 +0300
Message-ID: <20261024155614.2732-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174015.54793-1-igorpetindev@gmail.com>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
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
Closes: https://syzkaller.appspotmail.com/bug?extid=a5b220cacb0618384d5a
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
v2 -> v3:
- Remove obsolete comment in usb_remove_hcd() regarding flush_work().
- Add comment in usb_stop_hcd() explaining why flush_work() is needed.
- Update kerneldoc for usb_stop_hcd() to state giveback queues are empty.
v1 -> v2:
- Use flush_work() instead of cancel_work_sync() as suggested by Alan Stern.

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

