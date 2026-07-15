Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A5C3ED3A6
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106513; cv=none; b=aJr9EW2BfqJGVd33EjgV94GdzlXpXuVcU+rD1o5WXxZ9FsaQq7KSFty35JkrBSq0DOQRh9kjj/WbcEdO0z1r1vZauZyN+mx2C+QnOLkXxqkvM0Y2O7tdXCvXEBV0BIX1ou9driDrv4KMiTwmS8pSQYU0um2a3lLFT7MFdmEaztY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106513; c=relaxed/simple;
	bh=OuIFKmN/aUS9qKViC8PcpXUW7K5Q6qLNVjDEbyQINhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Enbqu5R+XekwnKrHgl+KlLXgsZB9StrY9BS9jx4O2TRMS7sxPUA1FsIsIxUFOmy9y3GjUK9dShHpvK2UeXKuNpaO6W3nzM6nd3HOvxPr4ukBfqAnS5nBXJyOJqlgGSgy8OvnkvFjQ0iJaQlR3GBSbkqW4FmIqIoPWZo1rlVKykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=HuV88fLH; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ZkAPtULj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="HuV88fLH";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ZkAPtULj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7858F3DF7;
	Wed, 15 Jul 2026 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784106504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=At07cF4mO3yraHCmmZmo/4Sa4i3cUGInN4IbHuPzrdA=;
	b=HuV88fLH+MPa0ED/DUd489wwK7sjy/nwx9bVklR2jDXpNWaOO7SLkF6ovTOFN+MzAsl5l+
	H2irQW15DMARZ1vTecJCJsLLHCHwFAmaVyZB0mswWwDgPcK74/ztJqVcWrgb1n6GRly5cj
	5EyvVLgvigVQrUi9AX/g6QqwppNcEIE=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ZkAPtULj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784106503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=At07cF4mO3yraHCmmZmo/4Sa4i3cUGInN4IbHuPzrdA=;
	b=ZkAPtULjZV+kGh7s4GB+z4w+B1m88LCUIRr0CN9S/VXQ/9QY8YlLMNELw8SHwmTcSUpXLV
	VN9nCJeh2VdRkOGlXjduvKzUHJiJ5ro+MqljbTdni0mbm5n9VdgdTzGJTq3UmYYlJIJKTC
	dT7J+ndca4C+X+DOkuQDSAeJCqGsBo8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5168C779AD;
	Wed, 15 Jul 2026 09:08:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vqDXEgdOV2r8BgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 15 Jul 2026 09:08:23 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	jkrshnmenon@gmail.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>,
	Lukas Dresel <lukas@artiphishell.com>
Subject: [PATCHv2] usb: serial: sierra: deal with insufficiently long notifications
Date: Wed, 15 Jul 2026 11:04:32 +0200
Message-ID: <20260715090821.1364583-1-oneukum@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7858F3DF7
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:email,suse.com:mid];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

A malicious device can send too short messages which
would cause the driver to read beyond the part of the buffer
holding valid data.
Ignore too short packets.

Fixes: 033a3fb980b04 ("USB: Sierra Wireless driver update")
Reported-by: Jay Vadayath <jkrshnmenon@gmail.com>
Reported-by: Lukas Dresel <lukas@artiphishell.com>
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---

v2:
- fixed description and added reporters and fixes tag

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

