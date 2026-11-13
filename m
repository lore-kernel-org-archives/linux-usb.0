Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538170;
	b=w3OSFLQD7sqCmwBF9C4JSlbnNCGWyCleaykwfA8qUXWWVP237bq1w9gYPLCF/mmFcqjb
	 1MfydnwgQNxsBvyIB5pgjtSTdaOcP5tIwvGWB+Z+8LLzfn/u+e/Hnz8tedHdhMI1jSuaF
	 2AFMVeIqO+wqOweZny8byDOJvPUagMpnT/ZRbzfzY/2warHKrmfDWUvovRGp4Xys4m9Vs
	 niLus9XapI2EN/Bms9IqWO/xFZCPZhCKAWP3HtEvCSMJDCnux6Nda7ki+dCmPg7myQ6h0
	 GltvcSxLHKoaLBwTGzfsPPwSW056ro2Za35uELIyHHcpPOi59gQqcEkOl33jscyJtyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UFDe9lCkInupU9qUtl4bkONEihH6NAtH6iCQTIvpiRM=;
	b=nCQzHZDNVFiL8W1olaWUb92FBkc7KWIuWoFn0wI0f7sKfND5K5MA10+LvTo97UnC8EYh
	 5cDRqKnmSkiUvREqfF/45JI9kEwpziDEdyqx2mm23/pmXOgxJWpybwG/NL8FRUAAgOytk
	 1q9CTlkCtVZx3xuo+AgXwoyVYWiZkrHU6EgakdUOOqzshrG0FQ4csx29mUIiEPitLn474
	 ARWAC3EMXD2dvoS3YXTK/DEIwW4C6pPoFyzUcAaY99kCA9xcj+e9Wkfpo7TZTp6xjNl+6
	 +TVPx8FRK/J/tm2Q1ToVK29P26CPkKyCU8oI3bFtZQgs0NQIyC6dsl+dUmoAEoyy9UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iLrTuznz;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2E3606A886
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC2E3606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iLrTuznz
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so618937eec.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 18:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794538168; x=1795142968; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFDe9lCkInupU9qUtl4bkONEihH6NAtH6iCQTIvpiRM=;
        b=iLrTuznz9sLy6cNj9ylnQ0iW06i+WW28+tFuLq2/LPZ7ckr3ucDGMcNtry2QGg3VZR
         0OFNiwrcfDbEoUbv3uFWJWHHsJFGGkZdYHRgcbOyS+I7xu8Ewj6zDWCaIIPxfZ3KcLFe
         n5z6+tasYWo/qpLMe38PNcHrBtjrph8G9YApqYRmm+GSZ8JmnUdiGvna6xDzBz7zTXib
         uzxHqJcd6cM1DUsUe2T44mBAlh5C/TVauI4899Q1fjeXFSzlFCPDsdzAFVPgh11Qpu/W
         K9j4avVVWlPKNDrmE3Hvq6tLZSsa5vt7IKGHwNbDbjmNZ40L1ItnCHKFRS5KVMVxjJcX
         gAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538168; x=1795142968;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFDe9lCkInupU9qUtl4bkONEihH6NAtH6iCQTIvpiRM=;
        b=w2lmnh4EEslc8Dj5tsODXhOF0xWbsAvxiFB6Lq30mkFQ1AhZfOIrkBpiBASqwLhhED
         UdxWQ7VzlF6Il4awMG0iUfbcAfCzuMNW9xZPnr+w1VwC0c/6Qp4IJfsMFh7BmNFhzdku
         UOclYFBhvyfR+ybL9J3qTJiNqYBWGMK7daZzs29jYcVfmWDlwj2gCjyCv2jiw68bbYdw
         /IoqFiTBPsUXB524HY1u8z7dnmkZ0OcqexzMS/c3r2UF07TPF/Rx1X2ZzFyGQxtf2Sh5
         CcAMyrUD27bo6tIDFoAo29uqSDYWVK7GpkGkgMXdYlOJ1cq8IfayAiYOp1M9cgZ+GUpV
         krUw==
X-Gm-Message-State: APuU4Z9Vxtp3/BTBiea3Z+mpQWsagWtveV75ZftvYA6WaEFPFVpy12yQ
	ape1SRS/72YaW7VeOrMsVxD944X3b8UTNWKc4LWdAezzivdIei2pMxQONCmI9+zm4KfhzZSkhIk
	t0jbtLC6e0NF7OTP73r1+PvvyPGnnBDRiOuGdwA==
X-Received: from dlbrp2.prod.google.com ([2002:a05:7022:1602:b0:1ab:7a71:e7])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:290a:b0:151:6e80:ba7e with SMTP id a92af1059eb24-1b503055016mr1176900c88.4.1794538167602;
 Thu, 12 Nov 2026 18:49:27 -0800 (PST)
Date: Thu, 12 Nov 2026 18:49:19 -0800
In-Reply-To: <20261113024922.27977-1-sarthakkukreti@google.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113024922.27977-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113024922.27977-2-sarthakkukreti@google.com>
Subject: [PATCH v2 1/3] usb: uas: complete command on status URB error
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

When a UAS device is unplugged while hub_wq is frozen during system
suspend, usb_disconnect() is deferred and sd_sync_cache() issues
SYNCHRONIZE_CACHE to the disconnected target. If the status URB fails in
uas_stat_cmplt(), uas_stat_cmplt() logs the error and frees the URB
without completing the command, leaving SYNCHRONIZE_CACHE pending until
the 60s SCSI timeout and triggering the 25s DPM watchdog.

Track each command's active sense_urb in uas_cmd_info. When a status URB
fails in uas_stat_cmplt() while not resetting, complete the command that
owns the failed status URB (with DID_NO_CONNECT on -ENODEV/-ESHUTDOWN
and DID_ERROR otherwise), free unsubmitted URBs, and unlink any inflight
data URBs outside devinfo->lock. Set DID_NO_CONNECT on -ENODEV/-ESHUTDOWN
and preserve non-DID_OK host bytes in uas_data_cmplt().

Fixes: 115bb1ffa54c ("USB: Add UAS driver")
Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 drivers/usb/storage/uas.c | 76 +++++++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 265162981269..904b4ce04fc6 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -71,6 +71,7 @@ struct uas_cmd_info {
 	struct urb *cmd_urb;
 	struct urb *data_in_urb;
 	struct urb *data_out_urb;
+	struct urb *sense_urb;
 };
 
 /* I hate forward declarations, but I actually have a loop */
@@ -232,14 +233,20 @@ static void uas_free_unsubmitted_urbs(struct scsi_cmnd *cmnd)
 
 	cmdinfo = scsi_cmd_priv(cmnd);
 
-	if (cmdinfo->state & SUBMIT_CMD_URB)
+	if (cmdinfo->state & SUBMIT_CMD_URB) {
 		usb_free_urb(cmdinfo->cmd_urb);
+		cmdinfo->cmd_urb = NULL;
+	}
 
 	/* data urbs may have never gotten their submit flag set */
-	if (!(cmdinfo->state & DATA_IN_URB_INFLIGHT))
+	if (!(cmdinfo->state & DATA_IN_URB_INFLIGHT)) {
 		usb_free_urb(cmdinfo->data_in_urb);
-	if (!(cmdinfo->state & DATA_OUT_URB_INFLIGHT))
+		cmdinfo->data_in_urb = NULL;
+	}
+	if (!(cmdinfo->state & DATA_OUT_URB_INFLIGHT)) {
 		usb_free_urb(cmdinfo->data_out_urb);
+		cmdinfo->data_out_urb = NULL;
+	}
 }
 
 static int uas_try_complete(struct scsi_cmnd *cmnd, const char *caller)
@@ -304,23 +311,58 @@ static void uas_stat_cmplt(struct urb *urb)
 	struct urb *data_out_urb = NULL;
 	struct scsi_cmnd *cmnd;
 	struct uas_cmd_info *cmdinfo;
+	struct uas_cmd_info *s_cmdinfo = NULL;
 	unsigned long flags;
 	unsigned int idx;
+	int s_idx;
 	int status = urb->status;
 	bool success;
 
+	spin_lock_irqsave(&devinfo->lock, flags);
+
+	for (s_idx = 0; s_idx < devinfo->qdepth; s_idx++) {
+		if (!devinfo->cmnd[s_idx])
+			continue;
+		cmdinfo = scsi_cmd_priv(devinfo->cmnd[s_idx]);
+		if (cmdinfo->sense_urb == urb) {
+			s_cmdinfo = cmdinfo;
+			s_cmdinfo->sense_urb = NULL;
+			break;
+		}
+	}
+
+	if (devinfo->resetting)
+		goto out;
+
 	if (status) {
 		if (status != -ENOENT && status != -ECONNRESET && status != -ESHUTDOWN)
 			dev_err(&urb->dev->dev, "stat urb: status %d\n", status);
-		goto bail;
+		if (!s_cmdinfo)
+			goto out;
+		cmnd = devinfo->cmnd[s_idx];
+		if (s_cmdinfo->state & DATA_IN_URB_INFLIGHT)
+			data_in_urb = usb_get_urb(s_cmdinfo->data_in_urb);
+		if (s_cmdinfo->state & DATA_OUT_URB_INFLIGHT)
+			data_out_urb = usb_get_urb(s_cmdinfo->data_out_urb);
+		uas_free_unsubmitted_urbs(cmnd);
+		s_cmdinfo->state &= ~(COMMAND_INFLIGHT |
+				      SUBMIT_STATUS_URB |
+				      ALLOC_DATA_IN_URB |
+				      SUBMIT_DATA_IN_URB |
+				      ALLOC_DATA_OUT_URB |
+				      SUBMIT_DATA_OUT_URB |
+				      ALLOC_CMD_URB |
+				      SUBMIT_CMD_URB |
+				      IS_IN_WORK_LIST);
+		if (status == -ENODEV || status == -ESHUTDOWN)
+			set_host_byte(cmnd, DID_NO_CONNECT);
+		else if (host_byte(cmnd->result) == DID_OK)
+			set_host_byte(cmnd, DID_ERROR);
+		uas_try_complete(cmnd, __func__);
+		goto out_unlink;
 	}
 
 	idx = be16_to_cpup(&iu->tag) - 1;
-
-	spin_lock_irqsave(&devinfo->lock, flags);
-
-	if (devinfo->resetting)
-		goto out;
 	if (idx >= MAX_CMNDS || !devinfo->cmnd[idx]) {
 		dev_err(&urb->dev->dev,
 			"stat urb: no pending cmd for uas-tag %d\n", idx + 1);
@@ -335,6 +377,10 @@ static void uas_stat_cmplt(struct urb *urb)
 		goto out;
 	}
 
+	if (s_cmdinfo)
+		s_cmdinfo->sense_urb = cmdinfo->sense_urb;
+	cmdinfo->sense_urb = NULL;
+
 	switch (iu->iu_id) {
 	case IU_ID_STATUS:
 		uas_sense(urb, cmnd);
@@ -375,6 +421,7 @@ static void uas_stat_cmplt(struct urb *urb)
 	default:
 		uas_log_cmd_state(cmnd, "bogus IU", iu->iu_id);
 	}
+out_unlink:
 	spin_unlock_irqrestore(&devinfo->lock, flags);
 	usb_free_urb(urb);
 
@@ -391,7 +438,6 @@ static void uas_stat_cmplt(struct urb *urb)
 
 out:
 	spin_unlock_irqrestore(&devinfo->lock, flags);
-bail:
 	usb_free_urb(urb);
 }
 
@@ -428,7 +474,10 @@ static void uas_data_cmplt(struct urb *urb)
 			uas_log_cmd_state(cmnd, "data cmplt err", status);
 		/* error: no data transfered */
 		scsi_set_resid(cmnd, sdb->length);
-		set_host_byte(cmnd, DID_ERROR);
+		if (status == -ENODEV || status == -ESHUTDOWN)
+			set_host_byte(cmnd, DID_NO_CONNECT);
+		else if (host_byte(cmnd->result) == DID_OK)
+			set_host_byte(cmnd, DID_ERROR);
 	} else {
 		scsi_set_resid(cmnd, sdb->length - urb->actual_length);
 	}
@@ -543,6 +592,7 @@ static struct urb *uas_alloc_cmd_urb(struct uas_dev_info *devinfo, gfp_t gfp,
 static int uas_submit_sense_urb(struct scsi_cmnd *cmnd, gfp_t gfp)
 {
 	struct uas_dev_info *devinfo = cmnd->device->hostdata;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct urb *urb;
 	int err;
 
@@ -555,8 +605,10 @@ static int uas_submit_sense_urb(struct scsi_cmnd *cmnd, gfp_t gfp)
 		usb_unanchor_urb(urb);
 		uas_log_cmd_state(cmnd, "sense submit err", err);
 		usb_free_urb(urb);
+		return err;
 	}
-	return err;
+	cmdinfo->sense_urb = urb;
+	return 0;
 }
 
 static int uas_submit_urbs(struct scsi_cmnd *cmnd,
-- 
2.56.0.611.g1030f0b940-goog

