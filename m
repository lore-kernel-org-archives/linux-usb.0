Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CCF23ABBE
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812270; cv=none; b=YBerC9qzuVUTVhHE7WqFw+2SuXPCeFZRjsoRuNrZmMR+UBBrpZ0SYr78OAMfkPK8+r05DxIIKsb3woujAeopKcWmuHfWmG3UUtq1r+B4ibf4pl6rid2U4DjtWa27lPE73A04jlffQ004hC1/8xUGWtqyajUemfAf7dOeHFfxcwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812270; c=relaxed/simple;
	bh=0EHaYA31AKMkwGKZxxnGPfk5inRyKwHFRdZ52h6KFJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVZEdjEzhoe+AERI+8BAL+0dDpTSoUSRvqm6MuFXC0vqx7d04NBl3giE47TyNZaQPKZYjrp+A2IL/cv9C5jXVWj0CPwFcBvZiO3Psba4pGLEI+fWGRSbhnC7cJDdAtdko2qkzFA4vcM1I8Ed/a8tMcFIgGVgPs6nw7R+pakSmlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ht7+6nHx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ht7+6nHx"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1602878a91.1
        for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 03:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789812256; x=1790417056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQH2rf6Bzcf6E6BADc6NPp0Qmbe39wDm40LygUzO/Os=;
        b=ht7+6nHxEVp78xrB0wgCKi3OhuSe+YeGfdWr6KpaGg9J9n7ZdXQGT7kW1JtAeu4UqH
         0Tuei5JETBDdlMaBF/rEwA0k3mpMSgtkoQKZJC7yCyrDqRDSiJnY5lszQvNiwq0uLIIy
         YWXcCSUMecRVs2tgf1bOS40bjm0yV7fB8bRz9oJgiTzOJKUnnPnaP7Apcn7d7CRWri0X
         ZWNg4Od3AQpx5USfwWK4p3CEf/RZEmHQtVD+S3UwVFTRD/XB6L3bkYBpKKdwCLZoe6JG
         inWFAYwUB1tzmYkbS0EeVu9IkPqI1PZJn8NqsMTU29rD5HJOJ65ZoP8UiKtGIev4TYLp
         Cs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789812256; x=1790417056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQH2rf6Bzcf6E6BADc6NPp0Qmbe39wDm40LygUzO/Os=;
        b=zNBF3V+AFQ5YbYj7TKQfTwK25MEpzx/EGmSAnRFd8cq2px9xHq98AidPMJJ0l27vKe
         g1Kjr4r37oDqo7lv68OQ1QIoBdDsKIjO2Gfok3NclhbBSn484+K2Nlv9AuYF+uJfTjlP
         siH1+ODd8QOyZKiUOm9huwJIgQ06va05M8AwaTomnGxKCbDQGeSkqzSe0nlREF39Tb8C
         kKBO2JhyBtBA7jq9yM4JTaoS4Wr8ppmlUtJZPv34N/q8VZSaMg9PXdTRlOVxQtBUNQBY
         Wa8uFOBormDMgRgBNYVbVz1Hnk+wzOJFhszi1LokyPZPSH3EXDbYfavIaJB1fAiNkjds
         C2Kw==
X-Forwarded-Encrypted: i=1; AKwUvBx02EQsJ+uZiqCk2rX1MFDXWfKMbAtVp1UBRnpnok2ZYl0LaErrejmWjvHyi49mXpwthnKWkFrJTcs=@vger.kernel.org
X-Gm-Message-State: AFuF++lfaNzqDOGY0ePMCNSvqdtRVMgzYNh45ElHML46KssUdm3tKPNT
	qmjMwZ9QY8yah3cY48wNq/6PIZQKehgNHJQw71a/H2P/eHGkk3p3jjxK
X-Gm-Gg: AYBFou2axYwMeOu4RrlkNGIDzTHMRPO1N8l5IttdPuC9hzeA/3UGf37f+cAp0x4Jptx
	6gt+50txUfXFEssRO++SKmLI8Q+xj8dwN2lRoZxEZOmZlBtLrzWdiADi3zCkNwJpbgp4quDGMx9
	sGTB2vVlNoD5fKAuFr/yKMTFyn30uGhR+Sno5ihDC5+ahrCqnNHEZvGDDR13G545cLFaGF04Fje
	RJO0lFW3s90YRZwoc4LebxGuSdCWY2dekqAAYUwZ/hpor8vA2lFUgiSRBKB1DBMYJlXwKzPRz9v
	WF1VXFI5Lc3seNZ/dS6FL0OPa6mBipkEzjnFH7jSS2Re0NeLky3w9FhiqBm8L/G0A+NtE38luvA
	co56hX2QhKWbTINa4detU12bbzXE2QIhwT2/6EofarQD0wqdpGRS1iTFDG0Ik6b6wRh+P2avpGS
	GQXnoBb5bMfgIXG9p1CsV9mQFEfHFvYSFZjZ7kph9ixwAVRIjps84bQ+X04RBXSQEQGCojcUS+W
	LBRAQbXEGkSIvqECOF7H/nIqFI=
X-Received: by 2002:a17:90b:574f:b0:39e:6a81:f34f with SMTP id 98e67ed59e1d1-39e6a81fd3cmr4027760a91.41.1789812255651;
        Sat, 19 Sep 2026 03:04:15 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:814e:e9d3:767e:9a2a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm3843697a91.4.2026.09.19.03.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:04:14 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>
Cc: linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] memstick: core: reclaim the request before freeing a timed-out card
Date: Sat, 19 Sep 2026 17:04:08 +0700
Message-ID: <20260919100408.113979-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memstick_alloc_card() hands card->current_mrq to the host and waits 500 ms
for it. If the host is still busy, the wait times out, the card is freed,
but the host keeps its pointer to the freed request.

rtsx_usb_ms hits this easily: its handle_req work can block in USB
transfers for seconds. When it returns, it reads and writes the freed
request, including the retry path in memstick_next_req():

  BUG: KASAN: slab-use-after-free in rtsx_usb_ms_handle_req+0x17ff/0x1a00
  Read of size 1 by task kworker/1:3
  Workqueue: events rtsx_usb_ms_handle_req
  Allocated by task 1656:
   memstick_alloc_card
   memstick_check
  Freed by task 1656:
   memstick_alloc_card
   memstick_check

Add an optional host->cancel() hook that stops the host from using the
current request, and call it from a common wait helper on timeout, before
the request's owner can go away. rtsx_usb_ms implements it by draining its
work item. The helper also covers memstick_set_rw_addr() and both waits in
memstick_alloc_card().

Reported-by: syzbot+3ee5da0319ca17ef1f4e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3ee5da0319ca17ef1f4e
Fixes: 99451dceeb5f ("memstick: Add realtek USB memstick host driver")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Testing: no hardware. A raw-gadget emulation of an RTS5129 (0bda:0129) on
dummy_hcd delays every bulk-IN reply by 550 ms (above the core's 500 ms wait,
below the driver's 600 ms USB timeout). On a KASAN kernel the unpatched tree
reproduces the report (same offset and alloc/free stacks); the patched tree
takes the timeout+cancel path (~0.6 s) with no KASAN.

I first considered a second unbounded wait_for_completion() instead of a hook,
but rtsx_usb_ms_request() skips scheduling once host->eject is set and
memstick_remove_host() flushes the workqueue, so that can deadlock.

Known limit: cancel waits for the worker's remaining retries (a few seconds
with a device that never answers) while memstick_check() holds host->lock.
Other hosts leave ->cancel NULL, so their behaviour is unchanged.

 drivers/memstick/core/memstick.c    | 22 ++++++++++++++++------
 drivers/memstick/host/rtsx_usb_ms.c |  8 ++++++++
 include/linux/memstick.h            |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
index e03989c4e99e..ea09a63286bb 100644
--- a/drivers/memstick/core/memstick.c
+++ b/drivers/memstick/core/memstick.c
@@ -359,6 +359,20 @@ static int h_memstick_set_rw_addr(struct memstick_dev *card,
 	}
 }
 
+/* On timeout the host may still hold current_mrq; make it let go first. */
+static void memstick_wait_req(struct memstick_dev *card)
+{
+	struct memstick_host *host = card->host;
+
+	if (wait_for_completion_timeout(&card->mrq_complete,
+					msecs_to_jiffies(500)))
+		return;
+
+	if (host->cancel)
+		host->cancel(host);
+	card->current_mrq.error = -ETIMEDOUT;
+}
+
 /**
  * memstick_set_rw_addr - issue SET_RW_REG_ADDR request and wait for it to
  *                        complete
@@ -370,9 +384,7 @@ int memstick_set_rw_addr(struct memstick_dev *card)
 {
 	card->next_request = h_memstick_set_rw_addr;
 	memstick_new_req(card->host);
-	if (!wait_for_completion_timeout(&card->mrq_complete,
-			msecs_to_jiffies(500)))
-		card->current_mrq.error = -ETIMEDOUT;
+	memstick_wait_req(card);
 
 	return card->current_mrq.error;
 }
@@ -405,9 +417,7 @@ static struct memstick_dev *memstick_alloc_card(struct memstick_host *host)
 
 		card->next_request = h_memstick_read_dev_id;
 		memstick_new_req(host);
-		if (!wait_for_completion_timeout(&card->mrq_complete,
-				msecs_to_jiffies(500)))
-			card->current_mrq.error = -ETIMEDOUT;
+		memstick_wait_req(card);
 
 		if (card->current_mrq.error)
 			goto err_out;
diff --git a/drivers/memstick/host/rtsx_usb_ms.c b/drivers/memstick/host/rtsx_usb_ms.c
index beadc389f15f..403144a39a53 100644
--- a/drivers/memstick/host/rtsx_usb_ms.c
+++ b/drivers/memstick/host/rtsx_usb_ms.c
@@ -551,6 +551,13 @@ static void rtsx_usb_ms_request(struct memstick_host *msh)
 		schedule_work(&host->handle_req);
 }
 
+static void rtsx_usb_ms_cancel(struct memstick_host *msh)
+{
+	struct rtsx_usb_ms *host = memstick_priv(msh);
+
+	cancel_work_sync(&host->handle_req);
+}
+
 static int rtsx_usb_ms_set_param(struct memstick_host *msh,
 		enum memstick_param param, int value)
 {
@@ -787,6 +794,7 @@ static int rtsx_usb_ms_drv_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&host->poll_card, rtsx_usb_ms_poll_card);
 
 	msh->request = rtsx_usb_ms_request;
+	msh->cancel = rtsx_usb_ms_cancel;
 	msh->set_param = rtsx_usb_ms_set_param;
 	msh->caps = MEMSTICK_CAP_PAR4;
 
diff --git a/include/linux/memstick.h b/include/linux/memstick.h
index 107bdcbedf79..e86f7f6e3e4b 100644
--- a/include/linux/memstick.h
+++ b/include/linux/memstick.h
@@ -285,6 +285,8 @@ struct memstick_host {
 
 	/* Notify the host that some requests are pending. */
 	void                (*request)(struct memstick_host *host);
+	/* Stop using the current request; may sleep until the host is idle. */
+	void                (*cancel)(struct memstick_host *host);
 	/* Set host IO parameters (power, clock, etc).     */
 	int                 (*set_param)(struct memstick_host *host,
 					 enum memstick_param param,
-- 
2.43.0

