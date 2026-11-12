Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490772;
	b=NwWfaWb8YHmlCz8U2yGvLR2u+ne6W2VMaRb1OGX1e4+/fW/Kb9KIQSMUmjj3Ga3RKLZK
	 WJnoq7OxfcCz9FN9w89EpxZMREaWTwf90buFIuv9YGI+DASGqDluBsrElBPBOedyrWE7+
	 jmykkh0ZCD0cgfYb0iJqUvgrn/xzMPlaHor0KXA4NckPUnG5JyOsmNaEmGD6TJHUJXE6u
	 z73mRhxq0q6hTda7DawxFwc8ivpwX1qdMqEUif/dUrtRgkG1bxg7SzwCBWibY6hJCio6S
	 G8QnFiTgA0VN+tnNto0iS7DPHHgiLfJgZsfttUFKKqTf0ij3Aj1Js6BnQKKDQM96Ehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490772;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=QfoQYK5GTllfN8cs3tAtillMPMU+lGS2lXGFEwCI3Kk=;
	b=rCCy8VX5/rsE4JNeV+nexo5LSabUeH9VI1+Mjh+pju3Sp49nV/9mUiGE8z6ncbGJbz3s
	 8XM634Tr+0gfiiC+8xHNv/zrBC2EzJT1mC/YT3UJREDto5AMezCqQKLkTgDb6HgJhPoE3
	 ZpKlyNqGpZoFzagvSVVSVOMQiW/fdRnRiJBWkPIK5ZbIwTdJkF00zhzaCw1hJ5G9vWKZz
	 UwEnyabb1ALtZyRExplgbvV9Mh8GTd944arQvXVuyKUh4JGh2KY2jQ2o/fXgRGUmHCoZq
	 NKAUfdEqbBxuAHu1HWErQsKNnr2K51dJHgVG7AyDnsbUbNyWatPlfS3w4mIEvQYpXBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ub+J5JYu;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ub+J5JYu;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6335606A897
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 13:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6335606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ub+J5JYu;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ub+J5JYu
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ADC981F863;
	Thu, 12 Nov 2026 13:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794490769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QfoQYK5GTllfN8cs3tAtillMPMU+lGS2lXGFEwCI3Kk=;
	b=ub+J5JYu2PlfqJKn5sKT2reov0JTEMSqgsUF7ilAc8sSr0OTJg1HkVOxi8UkmWlLP90G4L
	XNHM7khph8Nl9W9CuSiu7jMggkbO6cz9u7K41SvM5Pua0kcCSYzD5I5WiaprftRK7oDlur
	CVZP33ixLa1uK+qBuIcWA6BhohD4080=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ub+J5JYu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794490769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QfoQYK5GTllfN8cs3tAtillMPMU+lGS2lXGFEwCI3Kk=;
	b=ub+J5JYu2PlfqJKn5sKT2reov0JTEMSqgsUF7ilAc8sSr0OTJg1HkVOxi8UkmWlLP90G4L
	XNHM7khph8Nl9W9CuSiu7jMggkbO6cz9u7K41SvM5Pua0kcCSYzD5I5WiaprftRK7oDlur
	CVZP33ixLa1uK+qBuIcWA6BhohD4080=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B277134A0;
	Thu, 12 Nov 2026 13:39:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WYwUEJHB9WrLDgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 12 Nov 2026 13:39:29 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC]usb: uas: cancel outstanding commands
Date: Thu, 12 Nov 2026 14:38:02 +0100
Message-ID: <20261112133926.878432-1-oneukum@suse.com>
X-Mailer: git-send-email 2.56.0
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
X-Rspamd-Queue-Id: ADC981F863
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -12.01

Draft of an actually working eh_abort_handler.
It works by reusing the tag, which forces the
devices to generate and report an error.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/uas.c | 212 +++++++++++++++++++++++++++++++++++---
 1 file changed, 195 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 8655edbd66b1..99ded579349a 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -38,6 +38,7 @@ struct uas_dev_info {
 	struct usb_anchor cmd_urbs;
 	struct usb_anchor sense_urbs;
 	struct usb_anchor data_urbs;
+	struct usb_anchor killer_urbs;
 	u64 flags;
 	int qdepth, resetting;
 	unsigned cmd_pipe, status_pipe, data_in_pipe, data_out_pipe;
@@ -71,6 +72,9 @@ struct uas_cmd_info {
 	struct urb *cmd_urb;
 	struct urb *data_in_urb;
 	struct urb *data_out_urb;
+	struct urb *killer;
+	wait_queue_head_t cancel;
+	int cleanly_cancelled;
 };
 
 /* I hate forward declarations, but I actually have a loop */
@@ -166,7 +170,7 @@ static void uas_zap_pending(struct uas_dev_info *devinfo, int result)
 		cmdinfo = scsi_cmd_priv(cmnd);
 		uas_log_cmd_state(cmnd, __func__, 0);
 		/* Sense urbs were killed, clear COMMAND_INFLIGHT manually */
-		cmdinfo->state &= ~COMMAND_INFLIGHT;
+		cmdinfo->state &= ~(COMMAND_INFLIGHT | COMMAND_ABORTED);
 		cmnd->result = result << 16;
 		err = uas_try_complete(cmnd, __func__);
 		WARN_ON(err != 0);
@@ -274,6 +278,7 @@ static void uas_xfer_data(struct urb *urb, struct scsi_cmnd *cmnd,
 
 static bool uas_evaluate_response_iu(struct response_iu *riu, struct scsi_cmnd *cmnd)
 {
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	u8 response_code = riu->response_code;
 
 	switch (response_code) {
@@ -282,10 +287,17 @@ static bool uas_evaluate_response_iu(struct response_iu *riu, struct scsi_cmnd *
 		break;
 	case RC_TMF_SUCCEEDED:
 		set_host_byte(cmnd, DID_OK);
+		/* in case we win the race */
+		cmdinfo->cleanly_cancelled = 1;
 		break;
 	case RC_TMF_NOT_SUPPORTED:
 		set_host_byte(cmnd, DID_BAD_TARGET);
 		break;
+	case RC_OVERLAPPED_TAG:
+		set_host_byte(cmnd, DID_ABORT);
+		cmdinfo->cleanly_cancelled = 1;
+		wake_up_all(&cmdinfo->cancel);
+		break;
 	default:
 		uas_log_cmd_state(cmnd, "response iu", response_code);
 		set_host_byte(cmnd, DID_ERROR);
@@ -678,6 +690,7 @@ static enum scsi_qc_status uas_queuecommand_lck(struct scsi_cmnd *cmnd)
 	memset(cmdinfo, 0, sizeof(*cmdinfo));
 	cmdinfo->uas_tag = idx + 1; /* uas-tag == usb-stream-id, so 1 based */
 	cmdinfo->state = SUBMIT_STATUS_URB | ALLOC_CMD_URB | SUBMIT_CMD_URB;
+	init_waitqueue_head(&cmdinfo->cancel);
 
 	switch (cmnd->sc_data_direction) {
 	case DMA_FROM_DEVICE:
@@ -730,35 +743,197 @@ static enum scsi_qc_status uas_queuecommand_lck(struct scsi_cmnd *cmnd)
 static DEF_SCSI_QCMD(uas_queuecommand)
 
 /*
- * For now we do not support actually sending an abort to the device, so
- * this eh always fails. Still we must define it to make sure that we've
- * dropped all references to the cmnd in question once this function exits.
+ * We abort a command by reusing the tag, thus forcing an error
  */
+
+static struct command_iu *allocate_double_command(int tag, struct scsi_device *sdev)
+{
+	struct command_iu *test_unit_ready;
+
+	test_unit_ready = kzalloc(sizeof(*test_unit_ready), GFP_ATOMIC);
+	if (!test_unit_ready)
+		return NULL;
+
+	test_unit_ready->iu_id = IU_ID_COMMAND;
+	test_unit_ready->tag = cpu_to_be16(tag);
+	test_unit_ready->prio_attr = UAS_SIMPLE_TAG;
+	int_to_scsilun(sdev->lun, &test_unit_ready->lun);
+	/*
+	 * We need something that does not do harm
+	 * if the command to be aborted does finish
+	 * regularly
+	 */
+	test_unit_ready->cdb[0] = TEST_UNIT_READY;
+
+	return test_unit_ready;
+}
+
+static void uas_dummy_sense(struct urb *u)
+{
+	struct scsi_cmnd *cmnd = u->context;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
+	struct uas_dev_info *devinfo = (void *)cmnd->device->hostdata;
+	int tag = cmdinfo->uas_tag;
+	unsigned long flags;
+	/*
+	 * An error implies success
+	 */
+	int status = u->status;
+
+	/*
+	 * The tag must be freed in every case
+	 */
+	spin_lock_irqsave(&devinfo->lock, flags);
+	devinfo->cmnd[tag - 1] = NULL;
+	spin_unlock_irqrestore(&devinfo->lock, flags);
+
+	kfree(u->transfer_buffer);
+	wake_up_all(&cmdinfo->cancel);
+	dev_info(&u->dev->dev, "Dummy sense completed with status %d\n", status);
+}
+
+static void uas_abort_complete(struct urb *u)
+{
+	int status = u->status;
+	struct scsi_cmnd *cmnd = u->context;
+	struct uas_dev_info *devinfo = (void *)cmnd->device->hostdata;
+	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
+	struct usb_device *udev = devinfo->udev;
+	struct response_iu *dummy;
+	int tag = cmdinfo->uas_tag;
+	unsigned long flags;
+	int rv;
+
+	switch (status) {
+	default:
+		/*
+		 * immediate cleanup
+		 */
+		kfree(u->transfer_buffer);
+		spin_lock_irqsave(&devinfo->lock, flags);
+		devinfo->cmnd[tag - 1] = NULL;
+		spin_unlock_irqrestore(&devinfo->lock, flags);
+		wake_up_all(&cmdinfo->cancel);
+		break;
+	case 0:
+		kfree(u->transfer_buffer);
+		dummy = kzalloc(sizeof(*dummy), GFP_ATOMIC);
+		if (!dummy) {
+			spin_lock_irqsave(&devinfo->lock, flags);
+			goto bailout;
+		}
+		usb_fill_bulk_urb(cmdinfo->killer, udev, devinfo->status_pipe,
+				dummy, sizeof(*dummy), uas_dummy_sense, cmnd);
+		if (devinfo->use_streams)
+			cmdinfo->killer->stream_id = cmdinfo->uas_tag;
+
+		spin_lock_irqsave(&devinfo->lock, flags);
+		usb_anchor_urb(u, &devinfo->killer_urbs);
+		rv = usb_submit_urb(cmdinfo->killer, GFP_ATOMIC);
+		if (rv < 0) {
+bailout:
+			devinfo->cmnd[tag - 1] = NULL;
+			spin_unlock_irqrestore(&devinfo->lock, flags);
+			usb_unanchor_urb(u);
+			kfree(dummy);
+			usb_free_urb(u);
+		} else {
+			spin_unlock_irqrestore(&devinfo->lock, flags);
+			dev_info(&u->dev->dev, "Submitted dummy tag %d\n", tag -1);
+		}
+		break;
+	}
+}
+
 static int uas_eh_abort_handler(struct scsi_cmnd *cmnd)
 {
+	DECLARE_WAITQUEUE(wait, current);
 	struct uas_cmd_info *cmdinfo = scsi_cmd_priv(cmnd);
 	struct uas_dev_info *devinfo = (void *)cmnd->device->hostdata;
+	struct usb_device *udev = devinfo->udev;
 	struct urb *data_in_urb = NULL;
 	struct urb *data_out_urb = NULL;
-	unsigned long flags;
+	struct urb *killer = NULL;
+	struct command_iu *bullet = NULL;
+	int target_tag, rv;
+	int result = FAILED;
 
-	spin_lock_irqsave(&devinfo->lock, flags);
+	killer = usb_alloc_urb(0, GFP_NOIO);
 
-	uas_log_cmd_state(cmnd, __func__, 0);
+	set_current_state(TASK_UNINTERRUPTIBLE);
+	add_wait_queue(&cmdinfo->cancel, &wait);
+	spin_lock_irq(&devinfo->lock);
+	if (devinfo->resetting)
+		goto futile;
+	target_tag = cmdinfo->uas_tag;
 
 	/* Ensure that try_complete does not call scsi_done */
 	cmdinfo->state |= COMMAND_ABORTED;
 
-	/* Drop all refs to this cmnd, kill data urbs to break their ref */
-	devinfo->cmnd[cmdinfo->uas_tag - 1] = NULL;
-	if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
-		data_in_urb = usb_get_urb(cmdinfo->data_in_urb);
-	if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
-		data_out_urb = usb_get_urb(cmdinfo->data_out_urb);
-
-	uas_free_unsubmitted_urbs(cmnd);
+	if (!killer)
+		goto admit_failure;
+	cmdinfo->killer = killer;
+	bullet = allocate_double_command(target_tag, cmnd->device);
+	if (!bullet)
+		goto admit_failure;
+
+	usb_fill_bulk_urb(killer, udev, devinfo->cmd_pipe,
+			bullet, sizeof(*bullet), uas_abort_complete, cmnd);
+
+	cmdinfo->killer = killer;
+
+	usb_anchor_urb(killer, &devinfo->killer_urbs);
+	rv = usb_submit_urb(killer, GFP_ATOMIC);
+	if (rv < 0) {
+admit_failure:
+		/* Drop all refs to this cmnd, kill data urbs to break their ref */
+		devinfo->cmnd[cmdinfo->uas_tag - 1] = NULL;
+		if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
+			data_in_urb = usb_get_urb(cmdinfo->data_in_urb);
+		if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
+			data_out_urb = usb_get_urb(cmdinfo->data_out_urb);
 
-	spin_unlock_irqrestore(&devinfo->lock, flags);
+		uas_free_unsubmitted_urbs(cmnd);
+		spin_unlock_irq(&devinfo->lock);
+		usb_unanchor_urb(killer);
+		kfree(bullet);
+	} else {
+		spin_unlock_irq(&devinfo->lock);
+		/*
+		 * if something woke us up the command
+		 * has been cancelled.
+		 * If we do take the timeout we have lost
+		 * the race against the hardware or
+		 * the hardware is broken. If the
+		 * command succeeded we can count this
+		 * as success. Otherwise we've failed.
+		 *
+		 * We will kill the URB later, thereby
+		 * freeing the tag
+		 */
+		rv = schedule_timeout(HZ);
+		if (rv)
+			result = SUCCESS;
+		else
+			result = cmdinfo->cleanly_cancelled ? SUCCESS : FAILED;
+		spin_lock_irq(&devinfo->lock);
+		if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
+			data_in_urb = usb_get_urb(cmdinfo->data_in_urb);
+		if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
+			data_out_urb = usb_get_urb(cmdinfo->data_out_urb);
+		spin_unlock_irq(&devinfo->lock);
+	}
+	set_current_state(TASK_RUNNING);
+	remove_wait_queue(&cmdinfo->cancel, &wait);
+	/*
+	 * we know a callback will free the tag
+	 */
+	spin_lock_irq(&devinfo->lock);
+	cmdinfo->killer = NULL;
+futile:
+	spin_unlock_irq(&devinfo->lock);
+	usb_kill_urb(killer);
+	usb_free_urb(killer);
 
 	if (data_in_urb) {
 		usb_kill_urb(data_in_urb);
@@ -769,7 +944,7 @@ static int uas_eh_abort_handler(struct scsi_cmnd *cmnd)
 		usb_put_urb(data_out_urb);
 	}
 
-	return FAILED;
+	return result;
 }
 
 static int uas_eh_host_reset_handler(struct scsi_cmnd *cmnd)
@@ -796,6 +971,7 @@ static int uas_eh_host_reset_handler(struct scsi_cmnd *cmnd)
 	usb_kill_anchored_urbs(&devinfo->cmd_urbs);
 	usb_kill_anchored_urbs(&devinfo->sense_urbs);
 	usb_kill_anchored_urbs(&devinfo->data_urbs);
+	usb_kill_anchored_urbs(&devinfo->killer_urbs);
 	uas_zap_pending(devinfo, DID_RESET);
 
 	err = usb_reset_device(udev);
@@ -1038,6 +1214,7 @@ static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	init_usb_anchor(&devinfo->cmd_urbs);
 	init_usb_anchor(&devinfo->sense_urbs);
 	init_usb_anchor(&devinfo->data_urbs);
+	init_usb_anchor(&devinfo->killer_urbs);
 	spin_lock_init(&devinfo->lock);
 	INIT_WORK(&devinfo->work, uas_do_work);
 	INIT_WORK(&devinfo->scan_work, uas_scan_work);
@@ -1225,6 +1402,7 @@ static void uas_disconnect(struct usb_interface *intf)
 	usb_kill_anchored_urbs(&devinfo->cmd_urbs);
 	usb_kill_anchored_urbs(&devinfo->sense_urbs);
 	usb_kill_anchored_urbs(&devinfo->data_urbs);
+	usb_kill_anchored_urbs(&devinfo->killer_urbs);
 	uas_zap_pending(devinfo, DID_NO_CONNECT);
 
 	/*
-- 
2.56.0

