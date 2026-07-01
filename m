Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF83C3624B8
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 04:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782878639; cv=none; b=CA8ou+kRA3bK8LgMbIy+O7iVlSxn4tbc1uDB4VTavfrdF7+YZ3JOYq5TL568R0wXq61kLaR/92s/LzU5WKzLtHTCvYzNhqtKojR6hLjsFUeIvuTkKtAExNc3yC6sf4j2aex8Ad1hTSFzLOTnFrYDxaa383oJZDDdL6luq0TwFzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782878639; c=relaxed/simple;
	bh=p5NgUKZ2hv+769HgwMAjnNfNVsr0gFeP4zwmzFI1fxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JMzFZEQi73c3qNBPlcA0ytt99GzFY73O8x218NvJFJwBJ5DnRjAtXP1zFWMl+gybBH+jjw0v0y3cW5RLdG5xtZm72lalbsWutwNw01lvkGMoEYCql356rZZxADFbpcrI9ELtQhh2lKv9Rgq736qHuWAKubfUWdvmPh+m94nG7Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LJqpIWCx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LJqpIWCx"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c74383c93cso1452105ad.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 21:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782878633; x=1783483433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b+K/6nqTz+KsszBu+0AY+5reuM2Ql/csxHaZ7h5OS08=;
        b=LJqpIWCxzoAYKbblN5NG6MiaME1e5FBkthIfNxI4HsVuK4CC9SM23OWHkAYYA2ZZQ2
         kYHW/v8Ok54JfH5HdJsH4i8ci0gkFPNRhPUIPNrMPZGeGo7iKsBKubTgAmYcH8ZmNZUi
         peVy3uKaX0/smSqmTBDEFyVYlkSn/OJIr2A3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782878633; x=1783483433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+K/6nqTz+KsszBu+0AY+5reuM2Ql/csxHaZ7h5OS08=;
        b=ioG6Zk9J83WM61YU8p9QKXcYiOGYqxIUkjE9P3N9diz5YsxoMcOpbw1X6skEBtVNbr
         dpuCj3d8HFDGvPddMcK+TAUYFnpwkr0DN/+VH71bcwmpAuDTz8XxMKnc3lYIv8ybZbHB
         DaHzxvF758veHOQfBYT5fCLu36wcQJrRhAB+YXyCxmmYJs0Ytyus7yzNgCqou7sl42WD
         GtnP6/KACdEJqpwaBTS6q7zJKbwYI+iYTvi3+b0hEIQPtpN/Tk0Dq9D0/VTS6jhgl1hw
         WUXeE0XxpvCpVfjgTrUkynW+Ah31wbtO8K04CQPBbwaQ1yonu4/jpc2i86rG22m5t34Q
         1iGQ==
X-Gm-Message-State: AOJu0Yw5MJnk9EPZjTAEvuGYY4gTGcoyF3pgpMUmRLMQ6mneYJRPCFNr
	q5FQvJXIMJZaPRmXFh9YepoRSHlK8tfLLz67Uq/yhKOZVq23wTnPR+kwIgXHZDPOkw==
X-Gm-Gg: AfdE7cmv7Ae+MZi6mofIvDmlEnCztQzFWYyhsaT9df9hTG00gcBM++scDKu0T45LGBy
	p10KQj9tkQLvhcwDJRgcQR3TnW+DZl7D4rMsIA2CwH/rnWVOJecn3DwCmoQuNlMh4Z4+QkTSteJ
	QGEQ9ngT6YA+LBBZWLtpb1fYuQLbkId6xbKbNeV8I2ZZkbP7iFhxfGckEZvJmkPqEn0Bpwewurs
	D6Miv/o1KTNe6jYQ97IihKLZbSINW3Zxx5xmIuAOr48JP1aQr1G0RnReikOSpwWOIv8GZFAcT4F
	toKCQagFi+KB9bYPPtETeyNPgNaWfEooYBXsIFdpYjRLJ3hzeX6KhhnCNFjaiwNhd+GLE0+/xSd
	UQ6Bn4HtXyrhuZpuk/xS+6zs8lf56q0djD4WhyCj4NXyKZkSHo3T5FqUxB7QKLjIX16mKiRnfKJ
	aCfWNmy1e4nKa2Pbsffd+yfGvXuAV4UlgAJDQJJFVrsIaEqilD9UPGMwut5Vn+xhaMhUfniMCzw
	9A=
X-Received: by 2002:a17:903:291:b0:2c1:f262:4962 with SMTP id d9443c01a7336-2ca7e6da0c0mr963905ad.20.1782878632576;
        Tue, 30 Jun 2026 21:03:52 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:1379:da2f:9be6:bff2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382bb30dsm23927835ad.68.2026.06.30.21.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 21:03:52 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC PATCH] usb: storage: uas: limit consecutive device resets in error handling
Date: Wed,  1 Jul 2026 13:03:21 +0900
Message-ID: <20260701040335.810297-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a UAS storage device experiences persistent wire or hardware IO
failures, commands time out and the SCSI error handler thread invokes
uas_eh_device_reset_handler().  If usb_reset_device() succeeds at the
USB hub level but the underlying drive remains unresponsive, the reset
handler returns SUCCESS. SCSI EH then requeues pending commands with
DID_RESET (ACTION_RETRY), causing them to time out again 30 seconds
later in an infinite loop.  This blocks block layer queues indefinitely:

[..]
 sd 0:0:0:0: [sda] tag#4 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD
 sd 0:0:0:0: [sda] tag#4 CDB: Write(10) 2a 00 00 d3 98 08 00 04 00 00
 sd 0:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD OUT
 sd 0:0:0:0: [sda] tag#0 CDB: Write(10) 2a 00 00 d3 9c 08 00 04 00 00
 scsi host0: uas_eh_device_reset_handler start
 usb 2-1.3: reset SuperSpeed Plus Gen 2x1 USB device number 4 using xhci_hcd
 scsi host0: uas_eh_device_reset_handler success
 sd 0:0:0:0: [sda] tag#3 uas_eh_abort_handler 0 uas-tag 3 inflight: CMD IN
 sd 0:0:0:0: [sda] tag#3 CDB: Read(10) 28 00 00 00 00 00 00 00 20 00
 scsi host0: uas_eh_device_reset_handler start
 sd 0:0:0:0: [sda] tag#1 uas_zap_pending 0 uas-tag 1 inflight: CMD
 sd 0:0:0:0: [sda] tag#1 CDB: Write(10) 2a 00 00 d3 98 08 00 04 00 00
 sd 0:0:0:0: [sda] tag#2 uas_zap_pending 0 uas-tag 2 inflight: CMD
 sd 0:0:0:0: [sda] tag#2 CDB: Write(10) 2a 00 00 d3 9c 08 00 04 00 00
 usb 2-1.3: reset SuperSpeed Plus Gen 2x1 USB device number 4 using xhci_hcd
 scsi host0: uas_eh_device_reset_handler success
[..]

Introduce a runtime-configurable module parameter 'reset_limit' (default
3) and track consecutive resets in devinfo->reset_cnt.  When a productive
block layer command completes successfully (SUBMITTED_BY_BLOCK_LAYER),
reset the counter to zero.  If consecutive resets exceed reset_limit,
abort the loop by completing pending commands with DID_NO_CONNECT and
returning FAILED.  This allows SCSI EH to offline the unresponsive
device.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/usb/storage/uas.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 265162981269..a63c66c8bbad 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -32,6 +32,10 @@
 
 #define MAX_CMNDS 256
 
+static int uas_reset_limit = 3;
+module_param_named(reset_limit, uas_reset_limit, int, 0644);
+MODULE_PARM_DESC(reset_limit, "Maximum number of consecutive device resets during error handling before failing");
+
 struct uas_dev_info {
 	struct usb_interface *intf;
 	struct usb_device *udev;
@@ -40,6 +44,7 @@ struct uas_dev_info {
 	struct usb_anchor data_urbs;
 	u64 flags;
 	int qdepth, resetting;
+	int reset_cnt;
 	unsigned cmd_pipe, status_pipe, data_in_pipe, data_out_pipe;
 	unsigned use_streams:1;
 	unsigned shutdown:1;
@@ -255,6 +260,8 @@ static int uas_try_complete(struct scsi_cmnd *cmnd, const char *caller)
 		return -EBUSY;
 	devinfo->cmnd[cmdinfo->uas_tag - 1] = NULL;
 	uas_free_unsubmitted_urbs(cmnd);
+	if (cmnd->result == 0 && cmnd->submitter == SUBMITTED_BY_BLOCK_LAYER)
+		devinfo->reset_cnt = 0;
 	scsi_done(cmnd);
 	return 0;
 }
@@ -796,6 +803,21 @@ static int uas_eh_host_reset_handler(struct scsi_cmnd *cmnd)
 	usb_kill_anchored_urbs(&devinfo->cmd_urbs);
 	usb_kill_anchored_urbs(&devinfo->sense_urbs);
 	usb_kill_anchored_urbs(&devinfo->data_urbs);
+
+	spin_lock_irqsave(&devinfo->lock, flags);
+	if (uas_reset_limit > 0 && devinfo->reset_cnt >= uas_reset_limit) {
+		devinfo->resetting = 0;
+		spin_unlock_irqrestore(&devinfo->lock, flags);
+		uas_zap_pending(devinfo, DID_NO_CONNECT);
+		usb_unlock_device(udev);
+		shost_printk(KERN_ERR, sdev->host,
+			     "%s FAILED reset limit %d exceeded\n",
+			     __func__, uas_reset_limit);
+		return FAILED;
+	}
+	devinfo->reset_cnt++;
+	spin_unlock_irqrestore(&devinfo->lock, flags);
+
 	uas_zap_pending(devinfo, DID_RESET);
 
 	err = usb_reset_device(udev);
-- 
2.55.0.795.g602f6c329a-goog

