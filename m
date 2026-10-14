Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E0E4E5337
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970761; cv=none; b=smlqMfxJQQKTdJoWagaLrRK8V298mCdL+2wcH9dcrlkqwoD8JebrnzNvbXfs5dIAdrFZ9BJYkUbXMeUi22tT4G4tNUx1qsqLAGME9bLjzSsCuNCSRxRgAOlodbpX+IGguFX1vopG32Jqsgg3Qw/OTT/UgQUJIk+B4B1RM7CT81Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970761; c=relaxed/simple;
	bh=lwLTnWkw2QbpMsgGznoa4wf50q2gJDEynEMjODgtbGM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QrZ3OefSfjMB68C1pJ5chO4ADquilRypMBWpyOm34SuZ69ECmrGyu26jDbFZOpGXL3ZPPRVzQWKAXe5NakMY4+k6GmaMRYM7TkSJQLQt7Gfvdxkr4a0tzKn5+84BqFxs8m8I5HXVbSFAFpijxgWCpqossyi72iqpUB010xeHknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso154377a91.3
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 02:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970758; x=1792575558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oP4dNmygS7uyOL+9ZYR4iCmzy+Ai9zwLwjIst1maoF0=;
        b=R8UzRWZfudJiDuhbISVTSWzt6FqV+4LxwjNJF/bfUWT1keGHPOZ3KA6QyxMXrtWyfK
         9VcLD5DLoauCzz/4t03kR902dPGwRTcrqVCwtav4yKk0yZ7TS5JQoYKt0nK3HFWnsAuc
         BVBTVH+0KSC7V80esC/MxOUFJRseKKd7mstnzEUg3zKkdgl2LExmIPtYy+GmLn7GzvrS
         /qN0oE1S8Wdl9GIHBCSlInrlfpwDLG4OQPBr132xmbCSdrMQvvRV2QxZ9CrkM1nn0TIp
         qmc7gOkbgSby13D/wa/u/ycxRxEO5QkFmUEdio2kUq+1KYrpD+IT2kVCWz29w4N2BtNO
         4ftA==
X-Gm-Message-State: AFq9FYLjXmxqqqYu+at6Qgq0jYh8ACgfNpbmfozwZjb56+nykBnhC1zW
	S0DpMuTisriz4+eq1PURinwYZdHLKi03Qp4Ksd2vZ9tJG7TWLLLZxIiBdWJuKcV5rVT1+g==
X-Gm-Gg: AYBFou0GFWFsp7N8mB+xOQfpVHMk7IN99hlnoP1F/VmrOZklniFD/q7wh0AFudzl8Dm
	xKuVarnp75MsYh1/vT3xWiEdsQgpiKEVMTlJ0FUyTb6vaYrufoLhW/35/a54KttZ/RkI3ZfluLU
	IGKDpTCzl2jqM2oRUsqqSTp6nCNSSNGoi4L1WKWUMJGkqxUBFoV/ScJ2x2BOZfI5SvIE/fdV00r
	aQy8v8cEI9fxkhRX+r++JQ0F4acj1qBXJp15jVAp31+ZJfbaREy/iSEEHXd+tqLs8N64jlLXYYp
	XwOnqxqib2CTPxZgB3J4vTr5zpFYFH8YOq55badP0Z9TKYnbGe5E6nwFIYoKqIYOMK4MUXLh5IT
	8559Bz4g9GSt3A1YDPAKhmudbPgvSM2YnxWUfq95zPW8f+vYv3PoEruJ8fONjCEKtKLj/7brKNW
	US0I8fvYHuI2HLPtdILtYmDNG2RfrfYe1715W3BAOsnCTUWtv4dGW29bWXmhl3/IVXLKYB4TtTG
	wNYvs7FvxkOxyE=
X-Received: by 2002:a17:90b:1c08:b0:3a0:c3d4:f3b2 with SMTP id 98e67ed59e1d1-3ab3a8d6296mr13308362a91.56.1791970758194;
        Wed, 14 Oct 2026 02:39:18 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac760fc92csm1938622a91.14.2026.10.14.02.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:39:17 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] usb: storage: bound timeout=0 URB waits to 30s
Date: Wed, 14 Oct 2026 17:38:56 +0800
Message-Id: <20261014093856.415812-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_stor_msg_common() is the common URB submission/wait helper for
usb-storage transfers.  Callers that pass a positive timeout get that
timeout, but the three internal transfer helpers (usb_stor_ctrl_transfer,
usb_stor_intr_transfer and usb_stor_bulk_transfer_buf) all pass 0,
which selects MAX_SCHEDULE_TIMEOUT: the control thread waits for the URB
forever.

A device that stops responding while such a transfer is pending hangs the
control thread permanently, and the hang propagates into the SCSI error
handler:

    scsi command timeout -> eh_abort_handler -> command_abort()
      -> usb_stor_stop_transport()  /* URB unlink issued, but the URB of
                                      a device wedged mid-transition
                                      never completes */
      -> wait_for_completion(&us->notify)  /* no timeout */

The unbounded wait also closes a deadlock cycle observed on arm64 servers
running 5.4.x, where a Realtek USB WiFi dongle in CD-ROM mode (sr0)
wedges during usb_modeswitch's re-enumeration transition: the system
shutdown hook (mdadm --wait-clean --scan, which opens every block device)
blocks in disk_block_events() holding ev->block_mutex, waiting for the
disk events work whose TEST UNIT READY timed out into the
command_abort() wait above.  No timeout anywhere in the cycle means the
shutdown hangs forever -- hung_task warnings every 120s until power loss,
two production incidents with identical stacks.

Bound the fallback wait to 30s, matching the SCSI layer's default command
timeout for disk and CD-ROM LUs (SD_TIMEOUT / SR_TIMEOUT).  When the bound
fires, the URB is killed, the transport reports USB_STOR_XFER_ERROR, and
the command fails through the regular paths: the control thread
completes, notify is signalled, the abort returns, and the events work
(and with it the shutdown) can finish.

For disk and CD-ROM LUs this bound introduces no new policy: a transfer
that produced no URB completion for 30s has already exhausted the SCSI
layer's patience, and the error handler trying to abort it cannot make
progress while the control thread is stuck in the unbounded wait.

A blanket bound for this helper was suggested before [1] but dropped over
concern that legitimate SCSI commands (format, tape rewind) can exceed
60 seconds.  Those commands are issued to tape LUs whose SCSI timeouts
are much longer than 30s; usb-storage-attached tapes holding back a CSW
for more than 30 seconds remain the residual false-positive window of
this change (modern tape bridges use UAS, which is unaffected).

The scatter-gather data path (usb_stor_bulk_transfer_sglist(), which
waits in usb_sg_wait()) is a separate unbounded wait and is not covered
by this change; a device that stalls mid data phase can still wedge the
control thread there.

Validation: on the affected production machine the hang occurred twice
across ~4800 hibernate cycles with identical stacks; with this bound in
place, 990+ hibernate cycles completed without a recurrence.

[1] https://lkml.rescloud.iu.edu/hypermail/linux/kernel/2207.0/05816.html

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -112,6 +112,15 @@
  * command _must_ pass through this function (or something like it) for the
  * abort mechanisms to work properly.
  */
+
+/*
+ * Bound for the URB wait when the caller passes timeout == 0: matches the
+ * SCSI layer's default command timeout for disk and CD-ROM LUs (SD_TIMEOUT /
+ * SR_TIMEOUT), so a wedged device surfaces as a regular command failure
+ * instead of hanging the control thread forever.
+ */
+#define USB_STOR_URB_TIMEOUT	(30 * HZ)
+
 static int usb_stor_msg_common(struct us_data *us, int timeout)
 {
 	struct completion urb_done;
@@ -164,7 +173,7 @@
  
 	/* wait for the completion of the URB */
 	timeleft = wait_for_completion_interruptible_timeout(
-			&urb_done, timeout ? : MAX_SCHEDULE_TIMEOUT);
+			&urb_done, timeout ? : USB_STOR_URB_TIMEOUT);
  
 	clear_bit(US_FLIDX_URB_ACTIVE, &us->dflags);

-- 
2.25.1
