Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F5839D6CB
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455864; cv=none; b=YLLk/SPzJ3ZOdRmXGXZRjXkvcC0vhjTMyoeeELAm6Y9UsznLjpR0D7Ew8sf/W7gr4BwjyJXLfjNmICdH+IzBsVZ/3CPmSlOcTDR3d6bGU+voyIziUhbA5jY1dLcTk2iprS+FKPjurJjEqww/8eSuivzMCuPk1PGq/uhDFfYAAAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455864; c=relaxed/simple;
	bh=snUDSmDlMV0BGcBhWZIwhx7jTGrqS7yO4T3Q6jJ1zx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AnwiruwGeUZxekZ4xKxAQzdUdPlpNWoOttw6Yd++7PitEntRfZLevKnImf3b4OgYtm0+tfIg5KZsG47XhhcQU3DGkmpYJIZKyZ5ib1Nxpso34vu4xgbyqNpBW0HXyATnk2Hot36DlL3K8Uo5RVqMGTDjol89OyY8v8/1sSxWVic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=QcGZeFJs; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=QcGZeFJs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="QcGZeFJs";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="QcGZeFJs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 20C785BD0C;
	Wed, 29 Apr 2026 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777455861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mFQeRa9CBku2TKi/eTqU2uJ49CcjrsHCRxGAMqWqXmU=;
	b=QcGZeFJs1bWdZIFOWDVQTetk4PrEWub17N4s+2VkQiZcuGki07aPzT7vRSmaeBId80dYm0
	AGlAjFOMJVMJZCQ8eNAE7Omqk/N4JgFJGXwTAbgOYsQR7vefkyNPmzy4RY314ap99Jzqab
	DkR9zs1FPfry3qrqZp0bTJbWByHl83M=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QcGZeFJs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777455861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=mFQeRa9CBku2TKi/eTqU2uJ49CcjrsHCRxGAMqWqXmU=;
	b=QcGZeFJs1bWdZIFOWDVQTetk4PrEWub17N4s+2VkQiZcuGki07aPzT7vRSmaeBId80dYm0
	AGlAjFOMJVMJZCQ8eNAE7Omqk/N4JgFJGXwTAbgOYsQR7vefkyNPmzy4RY314ap99Jzqab
	DkR9zs1FPfry3qrqZp0bTJbWByHl83M=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F25A4593B0;
	Wed, 29 Apr 2026 09:44:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NAMwOfTS8WnARAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 29 Apr 2026 09:44:20 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	xu.yang_2@nxp.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: core: hcd: fix possible deadlock in rh control transfers
Date: Wed, 29 Apr 2026 11:44:04 +0200
Message-ID: <20260429094413.181038-1-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 20C785BD0C

From within the SCSI error handler memory allocations must not
trigger IO. Handling errors in UAS and the storage driver may
involve resetting a device. The thread doing the reset itself
relies on VM magic. However, that is insufficient, as resetting
a device involves resuming it. Resumption as well as resetting
involves conrol transfers to the parent of the device to be reset.
That may be a root hub. Hence usbcore must heed the flags passed
to usb_submit_urb() processing control transfers to root hubs.

The problem exist since the storage driver has been merged.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/hcd.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 89221f1ce769..29c74ed40526 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -448,7 +448,8 @@ rh_string(int id, struct usb_hcd const *hcd, u8 *data, unsigned len)
 
 
 /* Root hub control transfers execute synchronously */
-static int rh_call_control (struct usb_hcd *hcd, struct urb *urb)
+static int rh_call_control(struct usb_hcd *hcd,
+		struct urb *urb, gfp_t mem_flags)
 {
 	struct usb_ctrlrequest *cmd;
 	u16		typeReq, wValue, wIndex, wLength;
@@ -483,8 +484,8 @@ static int rh_call_control (struct usb_hcd *hcd, struct urb *urb)
 	 * tbuf should be at least as big as the
 	 * USB hub descriptor.
 	 */
-	tbuf_size =  max_t(u16, sizeof(struct usb_hub_descriptor), wLength);
-	tbuf = kzalloc(tbuf_size, GFP_KERNEL);
+	tbuf_size = max_t(u16, sizeof(struct usb_hub_descriptor), wLength);
+	tbuf = kzalloc(tbuf_size, mem_flags);
 	if (!tbuf) {
 		status = -ENOMEM;
 		goto err_alloc;
@@ -809,12 +810,13 @@ static int rh_queue_status (struct usb_hcd *hcd, struct urb *urb)
 	return retval;
 }
 
-static int rh_urb_enqueue (struct usb_hcd *hcd, struct urb *urb)
+static int rh_urb_enqueue(struct usb_hcd *hcd,
+		struct urb *urb, gfp_t mem_flags)
 {
 	if (usb_endpoint_xfer_int(&urb->ep->desc))
 		return rh_queue_status (hcd, urb);
 	if (usb_endpoint_xfer_control(&urb->ep->desc))
-		return rh_call_control (hcd, urb);
+		return rh_call_control(hcd, urb, mem_flags);
 	return -EINVAL;
 }
 
@@ -1535,7 +1537,7 @@ int usb_hcd_submit_urb (struct urb *urb, gfp_t mem_flags)
 	 */
 
 	if (is_root_hub(urb->dev)) {
-		status = rh_urb_enqueue(hcd, urb);
+		status = rh_urb_enqueue(hcd, urb, mem_flags);
 	} else {
 		status = map_urb_for_dma(hcd, urb, mem_flags);
 		if (likely(status == 0)) {
-- 
2.54.0

