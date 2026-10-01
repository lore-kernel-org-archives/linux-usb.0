Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA1C3A872B
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857993; cv=none; b=utRJrCY8G44xjieYybo1yxxautqdXJP9tamXOVY70PE6m1sIeGdnecHllzk5tqXNjKfNktuZik3Y1cPDvEViujjvLRIX9n4FtxCUyqcXQtU/4ttZkHU/iZXLxAFA7Zn0bsk0SYCTpxoicfoTYO6Et0wGuM7wDOdyKcmG+SUa2GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857993; c=relaxed/simple;
	bh=gxTFTJ2gf5me8NWecc2zCQI9jTVbkUgex9sKXhK8hAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QUyanPv7ET74t7xRfbco6RaBU6L8eYDGrGg4dQ1IeZzCj8/3eQIMJ/6xHEHuqZCoP3+mUGSmfQwgXu+/vkC2+eXZxRaGg85e8Db4h6E8DFfeL2zSmLvipt0IP81a5oDICYVAlTmlzYdJEy7XIV6L9OmNm8QcUL+5cRXmXYouwL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyuHBxy9; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyuHBxy9"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a498cb99b3so1590511a91.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790857991; x=1791462791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gvQXLvIpm1maufE+uqo97ZK01Jyrgab11AvbAiIumac=;
        b=hyuHBxy9IadCvNMyafkbHrURzljo6Ubsanr3noOm+L/ANdQw8CYBBovHY7CM9cfmnJ
         SKZH67ZSHkGC1GrpNkmIquXW0R0VqRTS/vdcJNpcPgluR8NAYzNy/TYoz2ZZvKTUM5cl
         TCBXDrWC+KJQM+tIKdHhFmOrd4NuXm+mDq6K7SbaHX/pAtEzA5wBnKZVjj7EMrk8Q5Xa
         rcsLyzhEQGfFwZ3UhFCM5D2tnaVJYkfK3WVt0Ua2C6JidlO/9bCAPHjSHw/8dipyic3z
         3hW5QVJhPjNs7jpR429iHDF1V8TLCS2Wm+fv48yemN+9j87fFeBCc8CiKBjjrYyEstVx
         oXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857991; x=1791462791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gvQXLvIpm1maufE+uqo97ZK01Jyrgab11AvbAiIumac=;
        b=UBTmxtwtEt5GHFVrhKOdCr/D2b2EqltceVUgiGC/pS1jrRx50WprKx4WS+FVPwwiEo
         0siUJDEr1rm8dKtOJHrd9zGgFQoLc3SepDsUPDOqZvB32xlb8znrO8Pz8VLP9XbNNwwo
         kMK+YZAKvH5A5bV626nRF2/jwZAdhu1MSQ1WKekLFWRQnmKnPzJfTpXGGy60DGcI9UCI
         kQ3oRKvMauhfR2MZscuTKNbmOlpP4jG0KL9wINBfMWr5KwE8FdA5WOfD+7FkFKdq5QyN
         cptTkT8LG2QH6MY9sN6ogxIjgoy2XRHzas4p964y5/gxm6av9sX/fJypIkcPNrunU66H
         Ij6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZmWgRSu19haHH3y+nXptj0y/1a5JvJ9kDaVpz+Qs3I3aUleqWl74EP+mc+HVjl65BxVUUHqqOUPA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0PdQgFaTgy2qwhZcZNWS8FXmAu/Idv6vsM7xeVJjsJtS/VMVm
	kRaT0Bxq6MdzT2x1uZ4fwyLI41n1mZauotrE9MoFvHJY/TUhLjHhiWOr
X-Gm-Gg: AYBFou2oFPsqVGoweybapq/J74lwcfQtKVkrjg0DO10yBmIjqfpP5qwtV2xaHTP5j5J
	HKvgRg4qXYxDu1H8QaffG2RwXsR5da3a/zmkM/YUqr1C57WwjBypcb59uWJVXDoFlc1pa2qBnBj
	pTxc7uPH3BMCsLFE3TdMqyt+UqXSBjkxR0DfvjKaBAmt9fXipX893EGjrFA3c8bj7+N0jsWWt69
	AiSprrFoyAjrZH2bZEGJ4RjsNjinu5VOukqfSDi/40JeTwpoSNjrMJx9uT092wU2dnFE2xyHwnT
	NOYeDjKLkqbQiKkHYb8ViAjoWC2bDX2FZJj6LxPaIY/lcBk8C85HScxehhJK4ct/SYkcnV3nB8D
	UU3sSbg0cKYCkbFaqp5iYTCgQzXV7Go+3WOgLVxZAMpxdTso7aRLM/PyKuyxLmHTuNgCv1/0ppV
	5HMVMfkeCyt7CiYr3iAus3dnpewjVWcRX1l4Y/a8u3v7Auu28D1tSfDtRua4wm/oTMG9Lo8lhGe
	aDI6y2xslesNw4tbxEtqs3zftGc
X-Received: by 2002:a17:90b:3b50:b0:3a2:b036:ed64 with SMTP id 98e67ed59e1d1-3a4d18f7838mr2589594a91.39.1790857990476;
        Thu, 01 Oct 2026 05:33:10 -0700 (PDT)
Received: from localhost.localdomain ([2408:8352:470:235:7e7d:21ff:fedc:f409])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm4464178a91.13.2026.10.01.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:33:10 -0700 (PDT)
From: xy521521@gmail.com
To: stern@rowland.harvard.edu
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] usb-storage: ene_ub6250: don't let the card-type probe hang forever
Date: Thu,  1 Oct 2026 20:31:34 +0800
Message-Id: <20261001123135.38831-2-xy521521@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20261001123135.38831-1-xy521521@gmail.com>
References: <20261001123135.38831-1-xy521521@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

ene_ub6250_probe() queries the card type with ene_get_card_type() while
holding us->dev_mutex (the locking added by commit 445fc368c6bc
("usb-storage: ene_ub6250: fix race between scan work and probe")).
The query is a bulk-only transaction: CBW, 1-byte data-in and CSW, each
transferred by usb_stor_bulk_transfer_buf(), which waits for URB
completion with MAX_SCHEDULE_TIMEOUT.

That unbounded wait is safe only while a SCSI command is being handled,
because the command's abort machinery (usb_stor_stop_transport() via
US_FLIDX_ABORTING) is the only thing that can terminate it.  At probe
time no SCSI command exists, so a device that passes enumeration but
never services bulk transfers wedges the probe forever:

    hub_event:         usb_stor_msg_common() <- ene_send_scsi_cmd
                       <- ene_ub6250_probe  (holds us->dev_mutex)
    events_freezable:  usb_stor_scan_dwork  (blocked on us->dev_mutex)

syzbot reports the second worker as "INFO: task hung in
usb_stor_scan_dwork"; the hub_event worker is stuck in the same wait
but sleeps interruptibly, which the hung-task detector ignores.

Bound the three probe-time transfers with a 30 s timeout through a new
usb_stor_bulk_transfer_buf_timeout() helper, so a dead device fails the
probe cleanly and the existing error path unwinds via
usb_stor_disconnect().

Fixes: 445fc368c6bc ("usb-storage: ene_ub6250: fix race between scan work and probe")
Reported-by: syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=30552b4cbe99d6d91306
Cc: stable@vger.kernel.org
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
Changes in v3: split the coding-style changes folded into v2 out into
a separate follow-up patch (2/2), as requested by Greg [1]; the diff
is unchanged since v1.

v2: https://lore.kernel.org/r/20261001091523.16934-1-xy521521@gmail.com/
v1: https://lore.kernel.org/r/20260929144640.2028-1-xy521521@gmail.com/
[1] https://lore.kernel.org/r/2026100128-crystal-islamic-b783@gregkh/
 drivers/usb/storage/ene_ub6250.c | 55 ++++++++++++++++++++++++--------
 drivers/usb/storage/transport.c  | 31 ++++++++++++++----
 drivers/usb/storage/transport.h  |  3 ++
 3 files changed, 69 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index 895f90c7a3fa..109336bd7e30 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -24,6 +24,13 @@
 
 #define DRV_NAME "ums_eneub6250"
 
+/*
+ * Bound for the probe-time card-type query.  It runs under us->dev_mutex
+ * with no SCSI command in flight, so nothing else would terminate the
+ * bulk transfer wait if the device stopped responding.
+ */
+#define ENE_PROBE_TIMEOUT (30 * HZ)
+
 MODULE_DESCRIPTION("Driver for ENE UB6250 reader");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("USB_STORAGE");
@@ -487,7 +494,8 @@ static void ene_ub6250_info_destructor(void *extra)
 	kfree(info->bbuf);
 }
 
-static int ene_send_scsi_cmd(struct us_data *us, u8 fDir, void *buf, int use_sg)
+static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
+				     int use_sg, int timeout)
 {
 	struct bulk_cb_wrap *bcb = (struct bulk_cb_wrap *) us->iobuf;
 	struct bulk_cs_wrap *bcs = (struct bulk_cs_wrap *) us->iobuf;
@@ -499,8 +507,9 @@ static int ene_send_scsi_cmd(struct us_data *us, u8 fDir, void *buf, int use_sg)
 
 	/* usb_stor_dbg(us, "transport --- ene_send_scsi_cmd\n"); */
 	/* send cmd to out endpoint */
-	result = usb_stor_bulk_transfer_buf(us, us->send_bulk_pipe,
-					    bcb, US_BULK_CB_WRAP_LEN, NULL);
+	result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
+					    bcb, US_BULK_CB_WRAP_LEN, NULL,
+					    timeout);
 	if (result != USB_STOR_XFER_GOOD) {
 		usb_stor_dbg(us, "send cmd to out endpoint fail ---\n");
 		return USB_STOR_TRANSPORT_ERROR;
@@ -517,6 +526,10 @@ static int ene_send_scsi_cmd(struct us_data *us, u8 fDir, void *buf, int use_sg)
 		/* Bulk */
 		if (use_sg) {
 			result = usb_stor_bulk_srb(us, pipe, us->srb);
+		} else if (timeout) {
+			result = usb_stor_bulk_transfer_buf_timeout(us, pipe,
+					buf, transfer_length, &partial,
+					timeout);
 		} else {
 			result = usb_stor_bulk_transfer_sg(us, pipe, buf,
 						transfer_length, 0, &partial);
@@ -528,20 +541,25 @@ static int ene_send_scsi_cmd(struct us_data *us, u8 fDir, void *buf, int use_sg)
 	}
 
 	/* Get CSW for device status */
-	result = usb_stor_bulk_transfer_buf(us, us->recv_bulk_pipe, bcs,
-					    US_BULK_CS_WRAP_LEN, &cswlen);
+	result = usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
+					    bcs, US_BULK_CS_WRAP_LEN, &cswlen,
+					    timeout);
 
 	if (result == USB_STOR_XFER_SHORT && cswlen == 0) {
 		usb_stor_dbg(us, "Received 0-length CSW; retrying...\n");
-		result = usb_stor_bulk_transfer_buf(us, us->recv_bulk_pipe,
-					    bcs, US_BULK_CS_WRAP_LEN, &cswlen);
+		result = usb_stor_bulk_transfer_buf_timeout(us,
+					    us->recv_bulk_pipe, bcs,
+					    US_BULK_CS_WRAP_LEN, &cswlen,
+					    timeout);
 	}
 
 	if (result == USB_STOR_XFER_STALLED) {
 		/* get the status again */
 		usb_stor_dbg(us, "Attempting to get CSW (2nd try)...\n");
-		result = usb_stor_bulk_transfer_buf(us, us->recv_bulk_pipe,
-						bcs, US_BULK_CS_WRAP_LEN, NULL);
+		result = usb_stor_bulk_transfer_buf_timeout(us,
+						us->recv_bulk_pipe, bcs,
+						US_BULK_CS_WRAP_LEN, NULL,
+						timeout);
 	}
 
 	if (result != USB_STOR_XFER_GOOD)
@@ -567,6 +585,15 @@ static int ene_send_scsi_cmd(struct us_data *us, u8 fDir, void *buf, int use_sg)
 	return USB_STOR_TRANSPORT_GOOD;
 }
 
+/*
+ * Unbounded variant for command-path callers: the command's abort
+ * machinery terminates usb_stor_msg_common()'s wait if the device dies.
+ */
+static int ene_send_scsi_cmd(struct us_data *us, u8 fDir, void *buf, int use_sg)
+{
+	return ene_send_scsi_cmd_timeout(us, fDir, buf, use_sg, 0);
+}
+
 static int do_scsi_request_sense(struct us_data *us, struct scsi_cmnd *srb)
 {
 	struct ene_ub6250_info *info = (struct ene_ub6250_info *) us->extra;
@@ -1826,7 +1853,8 @@ static int ms_scsi_write(struct us_data *us, struct scsi_cmnd *srb)
  * ENE MS Card
  */
 
-static int ene_get_card_type(struct us_data *us, u16 index, void *buf)
+static int ene_get_card_type(struct us_data *us, u16 index, void *buf,
+			     int timeout)
 {
 	struct bulk_cb_wrap *bcb = (struct bulk_cb_wrap *) us->iobuf;
 	int result;
@@ -1839,7 +1867,7 @@ static int ene_get_card_type(struct us_data *us, u16 index, void *buf)
 	bcb->CDB[2]			= (unsigned char)(index>>8);
 	bcb->CDB[3]			= (unsigned char)index;
 
-	result = ene_send_scsi_cmd(us, FDIR_READ, buf, 0);
+	result = ene_send_scsi_cmd_timeout(us, FDIR_READ, buf, 0, timeout);
 	return result;
 }
 
@@ -2193,7 +2221,7 @@ static int ene_init(struct us_data *us)
 	struct ene_ub6250_info *info = (struct ene_ub6250_info *)(us->extra);
 	u8 *bbuf = info->bbuf;
 
-	result = ene_get_card_type(us, REG_CARD_STATUS, bbuf);
+	result = ene_get_card_type(us, REG_CARD_STATUS, bbuf, 0);
 	if (result != USB_STOR_XFER_GOOD)
 		return USB_STOR_TRANSPORT_ERROR;
 
@@ -2358,7 +2386,8 @@ static int ene_ub6250_probe(struct usb_interface *intf,
 
 	/* probe card type */
 	mutex_lock(&us->dev_mutex);
-	result = ene_get_card_type(us, REG_CARD_STATUS, info->bbuf);
+	result = ene_get_card_type(us, REG_CARD_STATUS, info->bbuf,
+				   ENE_PROBE_TIMEOUT);
 	mutex_unlock(&us->dev_mutex);
 	if (result != USB_STOR_XFER_GOOD) {
 		usb_stor_disconnect(intf);
diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 9a4bf86e7b6a..c586d2021b7e 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -378,12 +378,18 @@ static int usb_stor_intr_transfer(struct us_data *us, void *buf,
 }
 
 /*
- * Transfer one buffer via bulk pipe, without timeouts, but allowing early
- * termination.  Return codes are USB_STOR_XFER_xxx.  If the bulk pipe
- * stalls during the transfer, the halt is automatically cleared.
+ * Transfer one buffer via bulk pipe, allowing early termination.  Return
+ * codes are USB_STOR_XFER_xxx.  If the bulk pipe stalls during the
+ * transfer, the halt is automatically cleared.
+ *
+ * A nonzero timeout bounds the wait for URB completion.  It must be used
+ * only when no SCSI command is being handled: usb_stor_msg_common()
+ * otherwise waits indefinitely, relying on the active command's abort
+ * machinery to terminate the wait.
  */
-int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
-	void *buf, unsigned int length, unsigned int *act_len)
+int usb_stor_bulk_transfer_buf_timeout(struct us_data *us, unsigned int pipe,
+		void *buf, unsigned int length, unsigned int *act_len,
+		int timeout)
 {
 	int result;
 
@@ -392,14 +398,25 @@ int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
 	/* fill and submit the URB */
 	usb_fill_bulk_urb(us->current_urb, us->pusb_dev, pipe, buf, length,
 		      usb_stor_blocking_completion, NULL);
-	result = usb_stor_msg_common(us, 0);
+	result = usb_stor_msg_common(us, timeout);
 
 	/* store the actual length of the data transferred */
 	if (act_len)
 		*act_len = us->current_urb->actual_length;
-	return interpret_urb_result(us, pipe, length, result, 
+	return interpret_urb_result(us, pipe, length, result,
 			us->current_urb->actual_length);
 }
+EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf_timeout);
+
+/*
+ * Same as usb_stor_bulk_transfer_buf_timeout() with an unbounded wait.
+ */
+int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
+		void *buf, unsigned int length, unsigned int *act_len)
+{
+	return usb_stor_bulk_transfer_buf_timeout(us, pipe, buf, length,
+			act_len, 0);
+}
 EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf);
 
 /*
diff --git a/drivers/usb/storage/transport.h b/drivers/usb/storage/transport.h
index 74ffd0d7e7b6..dc0442efc24d 100644
--- a/drivers/usb/storage/transport.h
+++ b/drivers/usb/storage/transport.h
@@ -77,6 +77,9 @@ extern int usb_stor_clear_halt(struct us_data *us, unsigned int pipe);
 extern int usb_stor_ctrl_transfer(struct us_data *us, unsigned int pipe,
 		u8 request, u8 requesttype, u16 value, u16 index,
 		void *data, u16 size);
+extern int usb_stor_bulk_transfer_buf_timeout(struct us_data *us,
+		unsigned int pipe, void *buf, unsigned int length,
+		unsigned int *act_len, int timeout);
 extern int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
 		void *buf, unsigned int length, unsigned int *act_len);
 extern int usb_stor_bulk_transfer_sg(struct us_data *us, unsigned int pipe,
-- 
2.32.0

