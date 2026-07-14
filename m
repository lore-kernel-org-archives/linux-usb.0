Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F04445AFF
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 18:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053992; cv=none; b=TSyKVH8R/mE3LByNq/NBtz6aEj0MC/0IK8sistX1SnTzTzORcw52E30m/1uSjgDGvm6YPgFH4x1c2H7OB+kIuxFuoKZHHLre1yvlKRYQ/OUIK5lheM5RRpUu4B4MPw4NGN4IEdJVc+K8Nu2P5aP5z+M1U9p1ZhhLJfD1frKmyjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053992; c=relaxed/simple;
	bh=Vq1GY3w81Hv1SWzW8iw8rrToR3MCkQCiGqAPkhHcMSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OTZQSirFw72hf01mVS6SHGDtiUlRC7wo3w6CytaVbDP+RAk7NVqdGnA6T/+ti7iUiaTuYBuEllv7nb6+ovGnRAujyhf3fSZv8qU4sYLDjB3CdeH+/lZ5AI0XcXLKww5qRPisYj8thBJw6QL1NmfAm+dhLxjC6QYqo+n2ZQutHMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ctKDnKXf; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ctKDnKXf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ctKDnKXf";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ctKDnKXf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9169576293;
	Tue, 14 Jul 2026 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784053988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TJ9yAiJlKzyAbKEuJdPAYuGMx2zXMl/IBVaqw7VnF0Q=;
	b=ctKDnKXfs0tycObcKlqhxQ3THCmJEr7cQ/cL5pGJVrdb5QiKTXH0ViuYoCtxy+umgacpiH
	KOjo8qCMMOAtYrflAjqcCeXPNvPg9sHtOtRhxNIxcalBDLRlgSjB6epz2bGYf4IyLDR8vg
	+yu7d+VQ/ZULnExxOpsIfYS42OdZv4c=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784053988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=TJ9yAiJlKzyAbKEuJdPAYuGMx2zXMl/IBVaqw7VnF0Q=;
	b=ctKDnKXfs0tycObcKlqhxQ3THCmJEr7cQ/cL5pGJVrdb5QiKTXH0ViuYoCtxy+umgacpiH
	KOjo8qCMMOAtYrflAjqcCeXPNvPg9sHtOtRhxNIxcalBDLRlgSjB6epz2bGYf4IyLDR8vg
	+yu7d+VQ/ZULnExxOpsIfYS42OdZv4c=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 694BC779AE;
	Tue, 14 Jul 2026 18:33:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vRtDGOSAVmr0DgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 14 Jul 2026 18:33:08 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	jkrshnmenon@gmail.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: serial: sierra: deal with insufficiently long notifications
Date: Tue, 14 Jul 2026 20:33:05 +0200
Message-ID: <20260714183305.1331363-1-oneukum@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.966];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -2.79

A malicious device can send too short messages which
would cause the driver to overflow the buffer and hit
stale data in their interpretation.
Ignore too short packets.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/serial/sierra.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/sierra.c b/drivers/usb/serial/sierra.c
index 6e443aacae07..f50833055360 100644
--- a/drivers/usb/serial/sierra.c
+++ b/drivers/usb/serial/sierra.c
@@ -575,10 +575,19 @@ static void sierra_instat_callback(struct urb *urb)
 				__func__);
 			return;
 		}
+
+		if (urb->actual_length < sizeof(struct usb_ctrlrequest))
+			goto skip_too_short;
+
 		if ((req_pkt->bRequestType == 0xA1) &&
 				(req_pkt->bRequest == 0x20)) {
 			int old_dcd_state;
-			unsigned char signals = *((unsigned char *)
+			unsigned char signals;
+
+			if (urb->actual_length < sizeof(struct usb_ctrlrequest) + 1)
+				goto skip_too_short;
+
+			signals = *((unsigned char *)
 					urb->transfer_buffer +
 					sizeof(struct usb_ctrlrequest));
 
@@ -603,6 +612,7 @@ static void sierra_instat_callback(struct urb *urb)
 
 	/* Resubmit urb so we continue receiving IRQ data */
 	if (status != -ESHUTDOWN && status != -ENOENT) {
+skip_too_short:
 		usb_mark_last_busy(serial->dev);
 		err = usb_submit_urb(urb, GFP_ATOMIC);
 		if (err && err != -EPERM)
-- 
2.55.0

