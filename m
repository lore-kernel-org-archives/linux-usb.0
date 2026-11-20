Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190791;
	b=d/iSHGltsY0OTc1cZE+6rm4J+ZC+waaRReRgtLO7I3ZPCxz8O8iP65WZriWyaLWPF5q8
	 /NwO++wiNih5Pm9NHizlqbqQqibGZlsu98bkj75VcHcmOYo+NJ8vOS39dHPlvM19KQAa7
	 eQt/ksydxRMEoVhRv8x9HVk5BCfApSmE9tcyIzjRjen2EvSP/8PTmAZzLMVqQXRRkB/Uo
	 6zSzIJYENwkHPddaYu6eAubBwvyQ0eAYAXm21LTs9PI6CGje3x3q8ZdGRdq4mHFNXXerB
	 8zXBXAflb6dZO552P7wMTiDQP71UgV1srtmaAnxIkX9SvcleQa+apEfOOtZOtPcmqXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2iaqDbMLo2PBDXw3bvFIW2CKUPXMeT1acdIM4Uz2ChA=;
	b=tqWAvFyRr9zjMRPHStMhOf4RbhjNuOPvcCPIZJPvD8tMJFKJL41nrWaYs28taIzV7H6w
	 Oa3PZF951lbux8tdVvsbCk6T9I3+UjcmBqR8eJ5V5DjnoJMwSSowThrzaolPxYEzWgwbR
	 YHHKsh1UXnthHlTISCkpErEjEehZFFZ5B1354uUs5leONd/qa2DO2601/kyVD5hBjWd3d
	 TJkQRNojWQFo4P0SkOr56j+d/s49C8QyJWKXECm4HmwzTMABzSUZKrf/WXUr8akp+zMVw
	 CVwxeN1SsLnOHPz06tGvg6kwyRNMaBIWLNFL2sn/4AOZsneqrcImX3Y+eDkx1nhiA+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hYmf3JRv;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D94606A331
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 16:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11D94606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hYmf3JRv
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb684859cbso637152a12.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 08:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795190789; x=1795795589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2iaqDbMLo2PBDXw3bvFIW2CKUPXMeT1acdIM4Uz2ChA=;
        b=hYmf3JRv85wQz3okg9MQr17gWKdQSYOYUxTs0gY33kbtFwZB7ty4FqzyikyMcT+0Xh
         AO+62TPZX1Sx2RMqm46nlVTRScSl827JHpGMFsoFX2wEe8SMKx1Eu9wlxkp1sgVkfphK
         1Obcaio7EPLcYR8OaPAmsh7dRHMaM8YdZqsIOAM/eUmfcw1o0Si3oprRV3EuKT9Ur9LG
         TS0WgNLX1dxuayDsvW35tAD9qj8edUAn/0UaNFScpgMfz+/TT6CxlkLTdmFjFoGjE+8p
         OIjlFKZIBgfqKdHkUGQWGTqFory/K6hTTOwKf5dE0vQnR7jM5QhQE37YPmHNUYnlI13y
         6YMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190789; x=1795795589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2iaqDbMLo2PBDXw3bvFIW2CKUPXMeT1acdIM4Uz2ChA=;
        b=J64fj3UchOSgo5B+GepdH6fXjOM7COnF1J38r5pDvEQsIrhSViywjX0HThIgf0LgPC
         /v5cQR9FXl9Lq4OT70pZogzFT9EeOsZ5aGZq0Jlhlm+AgYBUYB/nwoHo8bRfFx7S3PrN
         Nr9pvU5cgsAT44e7oNTevm845zRCYGqPQEpNZc9EzQTCOXOS6WAAByBGG2ER3XhyNXah
         gcy36QMhlLeM97208feMEyIdjhfRa1KfR6ACHA2BAUgQREkPTDwOednBlx2waZOzDqAc
         9RfB2hQyu9F+v0WJ4g8qOZUEm6wcrt1F2pbH/6lHDogT5NheOzAhGe6yJcjE81MYNSDY
         LZVQ==
X-Forwarded-Encrypted: i=1; AL+hErHbCLfg8lFydQhvbtM4o8eXS/i+NmniZsbt/WSVsecE38KSCmmKII/i9/lzWbClefGjo6JflGU1Rds=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fxj1m0rajB5ld9T+Bxw7ykFaI9GEZDkw3QKS9qhKSNnXVc+pL
	UzHJWeWt9sMjRqsXFo46ItQ4h9puH8THnAisTLVjM8VLqGCBVGIsLpKs37VMf8+DYPU=
X-Gm-Gg: AZFdTZcvE/IGqeDG90Lr6YP/8UY9eovairz0PQ2V6mru0IoV9by5R6u6dV75QMZK8CC
	pYnBPV2V0aVs1Q8LLwFDqQ7P7SCgTiYNi394SMaTlnjgYeXDARNJEAB70inQM4h4ivLfFzwlNSL
	BC37aGT6k2TvEZhhsOvpSTSm9I9Cbi4FVLZX82FIR2VuU+UIIwvTwDo8akaKlkKD1iQPpHhyt2c
	7axFwW6q6QEK0qZuLpLIfFdAn4ss+R1sWqr8N+DrAIAeYYqG6kunUA1gmIIPVxM4EXmtuV5ZCKz
	hVjSnX3SrIv66lK7vii1UlV8Cjk/f4HLoteXUJQj55rMANf1wOY3i76W67B9JuBOlsCIfdCT0SQ
	Rg2J4ZbGeuX5snH5ugekGSnO8hX0aNHzt2dTib/+NY/W7n5tcXPvCoWiS83AEvvXN1keLaoC5ls
	APCuBBTpsu2SmpzO0P6THcihyca7aH9IKw2GAG/zJFl+MxFC+7y6bYX9yBd1KO5Xjv6iacmLtfh
	m2o4itZgQjFvVVANr6x0v3T97HfefLMpSScvN+MEkd/YorNTGcNT8V9AqA4mgNV5FqPbIYu8y6b
	CDZ9BjL6AmWmF7Hjcfaot5RVdl0EERFkBgl0L79qpYchQoGfyHC0agIsQx+pUmf4Ik3IKXUQAmL
	iCc2VMHVHeAbuX+VJJmeqsEHHlz2s4ubQHZyH9q3I/PhgNSJKe4BXUriNHUs=
X-Received: by 2002:a17:90b:5109:b0:3b1:82fb:7e03 with SMTP id 98e67ed59e1d1-3b41c9b25a2mr3313827a91.11.1795190788963;
        Fri, 20 Nov 2026 08:06:28 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm4860540a91.13.2026.11.20.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:06:28 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com
Subject: [PATCH] usb: gadget: f_tcm: lock the UAS stream requests in .aborted_task()
Date: Sat, 21 Nov 2026 01:06:15 +0900
Message-ID: <20261120160616.3219043-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
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

usbg_aborted_task() starts by reading stream->req_out->status.  The three
stream requests are allocated by uasp_alloc_stream_res() for the UAS
alternate setting only, so in BOT mode they are NULL, and
uasp_cleanup_one_stream() frees them again when that alternate setting
goes away.  Nothing keeps them alive while the callback runs: the only
thing a .disable() or an alternate setting change waits for is the
delayed set_alt work, never the commands the target core still holds.

The target core calls .aborted_task() from target_handle_abort() for an
aborted command whose CMD_T_TAS is clear.  A BOT command gets there when
a LUN RESET arrives on another fabric that exports the same backstore and
the backstore has emulate_tas set to 0: core_tmr_drain_state_list()
aborts every command on the device, no TASK ABORTED status is owed, and
the core calls .aborted_task(), where the read faults.  With the default
emulate_tas of 1 the core sends TASK ABORTED status instead.  In UAS mode
the overlapped tag path calls the same function directly, and there the
host can take the alternate setting away while it runs.

Add fu->stream_lock.  uasp_alloc_stream_res() publishes the three
pointers under it, uasp_cleanup_one_stream() clears them under it and
frees them afterwards, and usbg_aborted_task() holds it while it tests
and dequeues them, skipping a request that is not there.  So the callback
either dequeues a live request or finds none.  The lock disables
interrupts because the cleanup side also runs from .disable(), which
composite_setup() and composite_disconnect() call with cdev->lock held
from the UDC's interrupt handler.

usbg_send_status_response(), usbg_send_write_request() and
usbg_send_read_response() also read fu->flags unlocked.  They only go
wrong if the alternate setting changes under an outstanding command, and
are left to a separate patch.

The BOT case, on dummy_hcd with the LUN RESET coming from tcm_loop:

  BUG: kernel NULL pointer dereference, address: 000000000000005c
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  PGD 0 P4D 0
  Oops: Oops: 0000 [#1] SMP NOPTI
  CPU: 1 UID: 0 PID: 30 Comm: kworker/1:1 Not tainted 7.4.0-rc3-FT9NNM-00395-g8dac6df92a2e #1 PREEMPT(lazy)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: target_completion target_abort_work
  RIP: 0010:usbg_aborted_task+0x2d/0xc0
  Code: fa 55 53 48 8b 87 e0 01 00 00 48 89 fb 48 8b 50 38 48 8b 52 30 48 8b 2a 8b 57 24 48 8d 14 d2 48 8d 14 d0 48 8b b2 58 03 00 00 <83> 7e 5c 8d 74 2b 48 8b b2 50 03 00 00 83 7e 5c 8d 74 58 48 8b b2
  RSP: 0018:ffffc90000107e40 EFLAGS: 00010246
  RAX: ffff88800540d000 RBX: ffff888006c6c870 RCX: 0000000000000001
  RDX: ffff88800540d6c0 RSI: 0000000000000000 RDI: ffff888006c6c870
  RBP: ffff8880053febc8 R08: 8080808080808080 R09: ffff88800491c218
  R10: ffff888005031cc0 R11: fefefefefefefeff R12: ffff88807db295c0
  R13: ffff888006c6c9a8 R14: ffff888005031805 R15: 0000000000000000
  FS:  0000000000000000(0000) GS:ffff8880f9e92000(0000) knlGS:0000000000000000
  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  CR2: 000000000000005c CR3: 0000000003030002 CR4: 0000000000770ef0
  PKRU: 55555554
  Call Trace:
   <TASK>
   target_handle_abort+0x6b/0x130
   process_one_work+0x19e/0x3f0
   worker_thread+0x180/0x2f0
   ? __pfx_worker_thread+0x10/0x10
   kthread+0xee/0x120
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x186/0x230
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  Modules linked in:
  CR2: 000000000000005c
  ---[ end trace 0000000000000000 ]---
  note: kworker/1:1[30] exited with irqs disabled

Fixes: 76003eb6d09278 ("usb: gadget: f_tcm: Handle abort command")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v2: nothing stopped the flags from changing after the test, as Greg pointed
out, so v2 drops the mode test and locks the stream requests themselves.
v1: https://lore.kernel.org/r/20261120113956.3071640-1-yhlee@isslab.korea.ac.kr

The usbg_send_*() paths are what Yu Zhang reported for a disconnect
during in-flight I/O; that needs the teardown to drain the commands and
is not attempted here:
  https://lore.kernel.org/all/20261020052629.92551-1-yuz08559@gmail.com/

Reproduced on dummy_hcd in BOT mode with a fileio backstore that is also
exported through tcm_loop and has emulate_tas set to 0: a WRITE(10) has
its data stage held while SG_SCSI_RESET_DEVICE on the loopback disk
issues the LUN RESET.  Without this patch 3 of 3 boots oops;
with it none do, and the write does not reach the backing store.  The
UAS race needs no such setting: a duplicate command tag followed by a
switch to the BOT alternate setting, with a test delay holding
.aborted_task() between its test and the dequeue, gives a KASAN
null-ptr-deref there in 3 of 3 boots without this patch and none of 3
with it.

 drivers/usb/gadget/function/f_tcm.c | 61 +++++++++++++++++++----------
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a27..21e5ef629319ae 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -510,17 +510,25 @@ static unsigned char uasp_to_tcm_func(int code)
 
 static void uasp_cleanup_one_stream(struct f_uas *fu, struct uas_stream *stream)
 {
-	/* We have either all three allocated or none */
-	if (!stream->req_in)
-		return;
-
-	usb_ep_free_request(fu->ep_in, stream->req_in);
-	usb_ep_free_request(fu->ep_out, stream->req_out);
-	usb_ep_free_request(fu->ep_status, stream->req_status);
+	struct usb_request *req_in, *req_out, *req_status;
+	unsigned long flags;
 
+	spin_lock_irqsave(&fu->stream_lock, flags);
+	req_in = stream->req_in;
+	req_out = stream->req_out;
+	req_status = stream->req_status;
 	stream->req_in = NULL;
 	stream->req_out = NULL;
 	stream->req_status = NULL;
+	spin_unlock_irqrestore(&fu->stream_lock, flags);
+
+	/* We have either all three allocated or none */
+	if (!req_in)
+		return;
+
+	usb_ep_free_request(fu->ep_in, req_in);
+	usb_ep_free_request(fu->ep_out, req_out);
+	usb_ep_free_request(fu->ep_status, req_status);
 }
 
 static void uasp_free_cmdreq(struct f_uas *fu)
@@ -876,28 +884,35 @@ static void uasp_cmd_complete(struct usb_ep *ep, struct usb_request *req)
 
 static int uasp_alloc_stream_res(struct f_uas *fu, struct uas_stream *stream)
 {
+	struct usb_request *req_in, *req_out, *req_status;
+	unsigned long flags;
+
 	init_completion(&stream->cmd_completion);
 
-	stream->req_in = usb_ep_alloc_request(fu->ep_in, GFP_KERNEL);
-	if (!stream->req_in)
+	req_in = usb_ep_alloc_request(fu->ep_in, GFP_KERNEL);
+	if (!req_in)
 		goto out;
 
-	stream->req_out = usb_ep_alloc_request(fu->ep_out, GFP_KERNEL);
-	if (!stream->req_out)
+	req_out = usb_ep_alloc_request(fu->ep_out, GFP_KERNEL);
+	if (!req_out)
 		goto err_out;
 
-	stream->req_status = usb_ep_alloc_request(fu->ep_status, GFP_KERNEL);
-	if (!stream->req_status)
+	req_status = usb_ep_alloc_request(fu->ep_status, GFP_KERNEL);
+	if (!req_status)
 		goto err_sts;
 
+	spin_lock_irqsave(&fu->stream_lock, flags);
+	stream->req_in = req_in;
+	stream->req_out = req_out;
+	stream->req_status = req_status;
+	spin_unlock_irqrestore(&fu->stream_lock, flags);
+
 	return 0;
 
 err_sts:
-	usb_ep_free_request(fu->ep_out, stream->req_out);
-	stream->req_out = NULL;
+	usb_ep_free_request(fu->ep_out, req_out);
 err_out:
-	usb_ep_free_request(fu->ep_in, stream->req_in);
-	stream->req_in = NULL;
+	usb_ep_free_request(fu->ep_in, req_in);
 out:
 	return -ENOMEM;
 }
@@ -1612,14 +1627,19 @@ static void usbg_aborted_task(struct se_cmd *se_cmd)
 	struct f_uas *fu = cmd->fu;
 	struct usb_gadget *gadget = fuas_to_gadget(fu);
 	struct uas_stream *stream = &fu->stream[se_cmd->map_tag];
+	unsigned long flags;
 	int ret = 0;
 
-	if (stream->req_out->status == -EINPROGRESS)
+	/* the stream requests are NULL in BOT mode and freed on an alt change */
+	spin_lock_irqsave(&fu->stream_lock, flags);
+	if (stream->req_out && stream->req_out->status == -EINPROGRESS)
 		ret = usb_ep_dequeue(fu->ep_out, stream->req_out);
-	else if (stream->req_in->status == -EINPROGRESS)
+	else if (stream->req_in && stream->req_in->status == -EINPROGRESS)
 		ret = usb_ep_dequeue(fu->ep_in, stream->req_in);
-	else if (stream->req_status->status == -EINPROGRESS)
+	else if (stream->req_status &&
+		 stream->req_status->status == -EINPROGRESS)
 		ret = usb_ep_dequeue(fu->ep_status, stream->req_status);
+	spin_unlock_irqrestore(&fu->stream_lock, flags);
 
 	if (ret)
 		dev_err(&gadget->dev, "Failed to abort cmd tag %d, (%d)\n",
@@ -2757,6 +2777,7 @@ static struct usb_function *tcm_alloc(struct usb_function_instance *fi)
 	fu->tpg = tpg_instances[i].tpg;
 	INIT_WORK(&fu->delayed_set_alt, tcm_delayed_set_alt);
 	spin_lock_init(&fu->delayed_set_alt_lock);
+	spin_lock_init(&fu->stream_lock);
 
 	hash_init(fu->stream_hash);
 	mutex_unlock(&tpg_instances_lock);
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/function/tcm.h
index e1d5a939161273..dfd01131597c68 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -153,6 +153,7 @@ struct f_uas {
 	struct usb_ep		*ep_status;
 	struct usb_ep		*ep_cmd;
 	struct uas_stream	stream[USBG_NUM_CMDS];
+	spinlock_t		stream_lock; /* protects stream[].req_* */
 	DECLARE_HASHTABLE(stream_hash, UASP_SS_EP_COMP_LOG_STREAMS);
 
 	/* BOT */
-- 
2.43.0

