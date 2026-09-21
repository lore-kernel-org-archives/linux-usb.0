Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39AF51A744
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 22:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790030495; cv=none; b=kiagJqpamIEPm9GQ7dFw1tbYojZkOHuGf8OecXlGSdRs/YRiJyovKM3HedbR2Qrb2c5+2ZoTiT3Gw7qcL7wiqj3lrbuTaU83k/8iIk1wfkYFILD4RfMspUqIgEqq2WcdL0nbziSrhbqLZJQKP8VttxhOy13CYQqLLyu04G8nbV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790030495; c=relaxed/simple;
	bh=tTytPSqrvOxLJfdsT1YrS+2UKUddGzFBsIq7N39JHw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQ1V5R4G44NYqXv5H5yapHsFQVZvFDpSx19suIk1tnIvpxofygYbKkPnJFFnEzDxS0l7ve8d5WH8Lw6CGxNlTtQUNGPwPI0VzkyQpvEhGCV8our50tRD4bNcOZgSoKPH9bQejE+HmSrZrWaQ/l/t6GhpP1872VBoPSnVa7GAxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBLtS2bP; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBLtS2bP"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-5308fc4b716so20653831cf.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790030493; x=1790635293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2UnjeezhHJ2PWvmnwldEhPxyIxvsTbf/269E/fdalA=;
        b=cBLtS2bPPKVj8lYeipLSkc4ihplO/OEoBRuTH5ACfNStxh9nSuBNL6tvM74yvWsG87
         jyE/kdZUGy02frhLOth2140zCJGYQ55xVBV5CuZvvOlS5U8K5oMbnC9b85Fwb9kjUkNs
         ys3Q6v2K2oFcuJ0caaKyA/3+vrsvFlh7sSftcW7Ni0wtiit/wln/eKSFZHeY3WA7JGMj
         3fXVGjLb4gKlP/sRqFXFwRW0PmvF8PfiGV/dTU0FuC1TgEEfVgTXXnxCwtJJ0GDR4qTU
         iFDDlwVFJSlyjmUIhqiyljIDUpww9i9dmgFuZuKUtC6fk8WXN60V1pLvgzqm7mbHAY0m
         x7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790030493; x=1790635293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2UnjeezhHJ2PWvmnwldEhPxyIxvsTbf/269E/fdalA=;
        b=R5WALwS1EtXNv+9bif563Xr6ce/2ZN82MF8sNhnVlK6mMyesaR9rSKH9eG8WM8UHuN
         C5Cp4Sj5x/hQoUgXSJ+AER54d3jPAOhYz37DxCe1jy4oPUytRfBUpS6TnKx/SPbT5rdD
         3SpjBom6oCW4J/i7na6q2CJWJ9rHEs552MSk42OnLVjoWxIrSCSQUc0JEw1RGo1bDKjA
         FdeR0/hNAWIJiXFGKd63bBSutp0jMlj41I239RpAbYNJpfNYzavgFGewToy7Gwr7/xrc
         JnnrnJAxSPE7oi+ZXHtPXTmG496znG+x99qxAbgSfFYHpkUx9eirEO06V5YJfhXhLowo
         uBkg==
X-Forwarded-Encrypted: i=1; AKwUvByZaMmvw2g2eQQ7HWmmhLF/1LZPMJlciAGfn/cvx4WQurtkaWb4xHxm6GCLHBdG/bjdEItzszgdDOg=@vger.kernel.org
X-Gm-Message-State: AFuF++kaHLdbbxP3k4r9HmLXuAroP9eCMaPOlsES1OnXYfr7g22DIQDp
	R0F5wBvbU9I6qWFUdcnNHjYM4uZk35ilzqKGxdbC1w5w7ldpjq2Ot6I=
X-Gm-Gg: AYBFou0g6Y0mmeNOAggRks5Jt1MGxvroMIDBTTQtaayWg/FRgyMJ6cPocj8W7Wv0hVD
	CV4Jnj7P7WY/ViD3+W8Q6I5NZyTaLB3WYnLINDpMG1wTU7ffX3yMEWIjmpUx2TDr4bh7iG6Lk9e
	z2cMvR+Uv7bfPS4pB2+NKJ6ca0H1UYMlcp0HkF1G/WP6V/SJAJhDeWhCaiJZRs+gAfzLsbaPN0y
	WOJ0855rxiMmQfzKcnw3Q2OEdu+oKvhhmMdhiWMfriz/qc7za/2tD98nAX0DIwhWZ2GoK1xL1tn
	RZZzqOqGlttToeCHveGYhfmDz2A+nzTckSGQcP6o9NWz4WRbQZYEoK93TwgkjuWCrm2oNeNlvmi
	BCM5Jb2ihN+SCo1w2gqbFPhfobBb3HQ8axvPL7Ya2H8GVdZDpYiI9iY+411XrNR/30Wh+rH7IyG
	2TyL1+83xHHObIFX2bc8rhsG54+vB4lJ2pRiVagSQbV2kk+V+42oHdywDM2xjDsykoW216A3eSr
	yTTLUHZ2qC7OBCynXsyJEDcFqq7hdoq4fBJsgli6hhW73u21VAIwI47/75Avomg8DkWwN2EeX2B
	qwQ1CQF5bPPUgDTx4VfFjvL/gvuu
X-Received: by 2002:ac8:5a8b:0:b0:532:a5f4:df25 with SMTP id d75a77b69052e-532d8e4f628mr30628351cf.57.1790030492569;
        Mon, 21 Sep 2026 15:41:32 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024a1b21sm661856d6.15.2026.09.21.15.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:41:31 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ijae Kim <ae878000@gmail.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usbip: vudc: Prevent transfer timer rearm during teardown
Date: Mon, 21 Sep 2026 18:41:30 -0400
Message-ID: <20260921224130.492681-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
vudc_remove due to race condition") made v_stop_timer() delete the
transfer timer synchronously before vudc_remove() frees its containing
struct vudc.

That does not close the race with the receive thread, which is stopped
later through usb_del_gadget_udc() and vudc_shutdown().  The thread
calls v_kick_timer() for CMD_SUBMIT and CMD_UNLINK packets, and
v_kick_timer() deliberately calls mod_timer() when the transfer state is
VUDC_TR_STOPPED.  A packet received after v_stop_timer() returns can
therefore enqueue the timer again before the vudc is freed.

timer_delete_sync() only drains the current timer instance and cannot
prevent such a rearm.  Use timer_shutdown_sync(), which makes subsequent
attempts to arm the timer no-ops.  The transfer state no longer needs to
be updated, as it is freed along with the timer.

On a KASAN and DEBUG_OBJECTS enabled x86_64 QEMU guest, repeatedly
binding the device, submitting a request and unbinding it produced a
"free active timer_list" warning followed by a slab-use-after-free in
v_timer().  With this change the same harness completed 4000 iterations
cleanly.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remove due to race condition")
Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@163.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/usbip/vudc_transfer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc_transfer.c
index d4ce85c4c6a2..4146b746a320 100644
--- a/drivers/usb/usbip/vudc_transfer.c
+++ b/drivers/usb/usbip/vudc_transfer.c
@@ -441,7 +441,7 @@ static void v_timer(struct timer_list *t)
 	spin_unlock_irqrestore(&udc->lock, flags);
 }
 
-/* All timer functions are run with udc->lock held */
+/* v_start_timer() and v_kick_timer() are called with udc->lock held. */
 
 void v_init_timer(struct vudc *udc)
 {
@@ -490,8 +490,6 @@ void v_stop_timer(struct vudc *udc)
 {
 	struct transfer_timer *t = &udc->tr_timer;
 
-	/* Delete the timer synchronously before teardown frees udc. */
 	dev_dbg(&udc->pdev->dev, "timer stop");
-	timer_delete_sync(&t->timer);
-	t->state = VUDC_TR_STOPPED;
+	timer_shutdown_sync(&t->timer);
 }

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

