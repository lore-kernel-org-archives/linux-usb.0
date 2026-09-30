Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F634F798F
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777293; cv=none; b=uHV+3+j+Zpppmg7SFqdEmMO4TnOQIGkjw+rXcdBqE6CgcYz+FRcDZ6nG+QTzvXOR0XCHPG1vQbJhtAxM82EQx3Ve7wtAK9rJUOA3gGJY5DoewVKsIsIr68143QkPWj8apS4i+fpSGPBxTvywyMEv7+0NM6XUOgxBQZ9rWhaYTEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777293; c=relaxed/simple;
	bh=ugKqDuDWQZBm6u98nq28c/n7WFLNiK7Z+cZC9VQNwKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wdu0IIi2pr6VjDmG92Rm+sZgQukKrTPYZbu7wAldK8NPyguiFhustmocEUNCjCPWGU8PbvUF06nfAq9i9C8MFEGX/Rc9qjSEFw9z97ae61YVHcn1I9TnVyyHcJGdUn/NNVp/fcPjXhv9/TXP9qy49M8DMe38qMys33l287B1YPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaQBQnqv; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaQBQnqv"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-86aecf49833so798650b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 07:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777274; x=1791382074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huHRNTGU5UMivKeQs9CaSmnnKBulMsdT40T8bBJxYVk=;
        b=DaQBQnqvSJVkSIt4/TyVyzRb5XSDq00gtf3me/7iTr0wAsKxpwR7koglvxPaSfSQrd
         5uqOEkamhRyllkEfBUTYpCVP03tuqDv7vl63I+TRkeTI99OUtl0QJYFmHi+19vMHoexq
         UJE7dAbIFyISJ0CXJ+eAalWfr9Frsn7opHiRAonZV1mRkc60EUNY4jINCoytl0e+krgU
         PwEVvWImjjwh952OJMP5Lv/x24CZo+RJPLs8aJhQlhwx7HAJ+irOt9duHRliGv29rzsd
         Zu6oeBVAhniAhkaZW+IKwCtnn+5nGGCB9AneQTZPcqsoqIYI1tC6B07j1g7MPUz9+gyV
         u8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777274; x=1791382074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=huHRNTGU5UMivKeQs9CaSmnnKBulMsdT40T8bBJxYVk=;
        b=WsalYVBmmJPQ5sKOyk+z4hzAjVt/9kwoFSkewdfokBec+E0PgMrkZDfxb2uKtPZ3mp
         OlXGECVTS8OufyoejS3SgMQ0U8M7WiuVr0LxdreLNIuq2R4mHzq2IV1q5azUFT/5NEJv
         r6Nx2WkFMJGP56TUsjJYLS2KY6rvyzmpBYa2z9R81V63Kni4IFAz2r+9tu0vjbp/tr9O
         UVcAu7loNKD1cmqJu5fP5S3EI977Qv+gG+UISU+OikHQ35GfQ09kgTIyEGCFLMAMkXVb
         QYHCBwoFlO5SofmHuayePcWMua41uYjGfsl8ada5nIogJNdTsNrZxAKvdMwgoN/2tQM7
         kGEQ==
X-Forwarded-Encrypted: i=1; AKwUvByj5yWxPKq6YgTdgE65byCuuhhX6CVIx8gaJn0FkjRNAXtTD7NqheOvMnQ1ADs8mz5X3tbGa6Ivt8A=@vger.kernel.org
X-Gm-Message-State: AFuF++nxDcioz8Wb8vZn5uevFBW3tUnlrlzqyXwjU38gYbwcU7QLiUwZ
	8maNwKvQnOL9aSC0WW0S1NyKCD/jOVRoOFmrgkz7EPtejqjK89NZFqj3
X-Gm-Gg: AYBFou0BE7y4ezkFKggfstuqcQksUsgXIBHEd4bSpb3h0ZOIeZq0B37I7k6hxpRn568
	asOTaRN3Jki72EvjyJXwdKYbwsO/1qSfoWV1hwpI7ESdREjIdHmvnxYym5guD5kJOvQsS8eccHQ
	x9iAa/jtLwTqdnl+s+hw4vC/tY3FsiJyUfxPk4JaF/diLYLNP9aXRJ6bHyCEN6aZvy9qhPUhIj3
	ptGvpS5eq8XbaKVtDtkJex2uXxMimkv9B5bkVI0TSkEj6dmtRlTFahg4x4o07Lk8fqh3djpDbwF
	A/85AREfx3/gg+aoKvF1vfAjBpe4uJKQtYZwWDyXg1Q7gk5QGTyi8U+y918ewF83d7eKVdTulOh
	EEtuH99fZxvPdfNtkgk2IoIH3W0UrEjxpaRaZx9EOprU8dM9cIA6QTRF1PC3MFyy+2cba+9KET/
	iqhBXig88r+cyFcvsrJL9IWuNerYcHvEmEnzt9XrejA18GigiqRz0wy6X6AcwUawYQQE1ZDgfNe
	+w=
X-Received: by 2002:a05:6a00:22d4:b0:887:29b1:27f3 with SMTP id d2e1a72fcca58-8874e34619amr786945b3a.44.1790777273482;
        Wed, 30 Sep 2026 07:07:53 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45e:16c8::245:115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726c04931sm899517b3a.55.2026.09.30.07.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:07:53 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Raj Ojha <rajojha047@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] memstick: rtsx_usb_ms: complete requests after eject instead of dropping them
Date: Wed, 30 Sep 2026 21:07:48 +0700
Message-ID: <20260930140748.15946-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAPx+jO-FBNsZFvfep-2SpqDFm3kYA=RpcF0CZx-kj0XH2juijQ@mail.gmail.com>
References: <CAPx+jO-FBNsZFvfep-2SpqDFm3kYA=RpcF0CZx-kj0XH2juijQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memstick_check() can pass its host->removing check just before
rtsx_usb_ms_drv_remove() sets eject/removing. Its next request is then
silently dropped: rtsx_usb_ms_request() skips schedule_work() once eject
is set, and drv_remove's cancel_work_sync() can also cancel a queued
handle_req before it picks the request up. Nobody completes
card->mrq_complete.

Once memstick core waits for requests without a timeout ("memstick: core:
wait for request completion before freeing card"), this hangs removal:
memstick_check() never returns and memstick_remove_host() blocks in
flush_workqueue():

  INFO: task kworker/u10:3:65 blocked for more than 20 seconds.
  Workqueue: kmemstick memstick_check
   __wait_for_common
   memstick_check

  INFO: task kworker/1:1:33 blocked for more than 20 seconds.
  Workqueue: usb_hub_wq hub_event
   __flush_workqueue
   memstick_remove_host
   rtsx_usb_ms_drv_remove

Never drop a request. rtsx_usb_ms_request() always schedules handle_req,
and handle_req fails requests with -ENOMEDIUM once eject is set, without
touching the device. drv_remove flushes handle_req instead of cancelling
it, and cancels it only after memstick_remove_host(), when no new
request can arrive, so it cannot run on a freed host.

The host_mutex drain in drv_remove is removed: handle_req always leaves
host->req NULL when it finishes, so the drain never had anything to do,
and it would now race with handle_req.

Fixes: 99451dceeb5f ("memstick: Add realtek USB memstick host driver")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260924204142.607-1-rajojha047@gmail.com/
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
This applies on top of Raj's patch:
https://lore.kernel.org/all/20260924204142.607-1-rajojha047@gmail.com/

Tested in QEMU with dummy_hcd + raw-gadget emulating an RTS5129, with a
debug msleep() after the host->removing check in memstick_check() and
the device unplugged during it: with Raj's patch alone removal hangs as
above; with this patch on top it completes, and the original UAF
reproducer stays clean.

 drivers/memstick/host/rtsx_usb_ms.c | 31 ++++++++++-------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/memstick/host/rtsx_usb_ms.c b/drivers/memstick/host/rtsx_usb_ms.c
index beadc389f15f..d5b3a96fc609 100644
--- a/drivers/memstick/host/rtsx_usb_ms.c
+++ b/drivers/memstick/host/rtsx_usb_ms.c
@@ -27,7 +27,6 @@ struct rtsx_usb_ms {
 	struct memstick_host	*msh;
 	struct memstick_request	*req;
 
-	struct mutex		host_mutex;
 	struct work_struct	handle_req;
 	struct delayed_work	poll_card;
 
@@ -514,6 +513,13 @@ static void rtsx_usb_ms_handle_req(struct work_struct *work)
 	struct memstick_host *msh = host->msh;
 	int rc;
 
+	/* Fail requests after eject so their waiters are released. */
+	if (host->eject) {
+		while (!memstick_next_req(msh, &host->req))
+			host->req->error = -ENOMEDIUM;
+		return;
+	}
+
 	if (!host->req) {
 		pm_runtime_get_sync(ms_dev(host));
 		do {
@@ -547,8 +553,7 @@ static void rtsx_usb_ms_request(struct memstick_host *msh)
 
 	dev_dbg(ms_dev(host), "--> %s\n", __func__);
 
-	if (!host->eject)
-		schedule_work(&host->handle_req);
+	schedule_work(&host->handle_req);
 }
 
 static int rtsx_usb_ms_set_param(struct memstick_host *msh,
@@ -781,7 +786,6 @@ static int rtsx_usb_ms_drv_probe(struct platform_device *pdev)
 	host->power_mode = MEMSTICK_POWER_OFF;
 	platform_set_drvdata(pdev, host);
 
-	mutex_init(&host->host_mutex);
 	INIT_WORK(&host->handle_req, rtsx_usb_ms_handle_req);
 
 	INIT_DELAYED_WORK(&host->poll_card, rtsx_usb_ms_poll_card);
@@ -812,27 +816,12 @@ static void rtsx_usb_ms_drv_remove(struct platform_device *pdev)
 {
 	struct rtsx_usb_ms *host = platform_get_drvdata(pdev);
 	struct memstick_host *msh = host->msh;
-	int err;
 
 	host->eject = true;
 	msh->removing = true;
-	cancel_work_sync(&host->handle_req);
+	flush_work(&host->handle_req);
 	cancel_delayed_work_sync(&host->poll_card);
 
-	mutex_lock(&host->host_mutex);
-	if (host->req) {
-		dev_dbg(ms_dev(host),
-			"%s: Controller removed during transfer\n",
-			dev_name(&msh->dev));
-		host->req->error = -ENOMEDIUM;
-		do {
-			err = memstick_next_req(msh, &host->req);
-			if (!err)
-				host->req->error = -ENOMEDIUM;
-		} while (!err);
-	}
-	mutex_unlock(&host->host_mutex);
-
 	/* Balance possible unbalanced usage count
 	 * e.g. unconditional module removal
 	 */
@@ -841,6 +830,8 @@ static void rtsx_usb_ms_drv_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(ms_dev(host));
 	memstick_remove_host(msh);
+	/* No card, no new requests; wait for the last failed one to finish. */
+	cancel_work_sync(&host->handle_req);
 	dev_dbg(ms_dev(host),
 		": Realtek USB Memstick controller has been removed\n");
 	memstick_free_host(msh);
-- 
2.43.0

