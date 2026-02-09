Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871B428312F
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770646858; cv=none; b=ZaavSMchy6m7STrfMcRs18c6HmlIgj95RKRse6VSxLtUsRv36kGzo6c1fGIZoqF5bpiXQxcbhBsz3pAVLOX9UkqR13X6W/TAwsWl/uC1GwFh5uipEKagp7T93JvYCZmaI14txCo9YYju06KpReEUAT4HfRDnr/PIy7Z6VmX7NvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770646858; c=relaxed/simple;
	bh=x9ahctL5HFMRwpqo6MG4HZ2TmNeFb+G81MOKlayABQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqIWgEcKqSoWElF48GcOxtIfc/NNNjpMTfsCfHF9LEz6FXSuWZpPLAo6fIAQ+ns1y4E4K23OvF2l/XF/1fFgTblkhDG/zBDK5H9l1TAiNYGOzbuvKB787yrA21MoZ26gfTInpSZ1TUKcyIZGc+eEpYMU8LHt+0n28McnmIK02AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UViUk/45; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UViUk/45; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UViUk/45";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UViUk/45"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9DE555BD2B;
	Mon,  9 Feb 2026 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770646856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e1roNXxhNy0LKO87TqA4vk6LCGOTIJNnrPMz2nNT0rI=;
	b=UViUk/4552JUBhXZm6n+yc+wl933UWALNJjN4onCop7AxyGl6dRfOy2OUuGJUXTTt93Fry
	TUTWiC1QkNoBvxZpMIu9jEJUAA0KS/lAmKqZepCoLhl74U6pvridhqYpgxY33tzhEB0203
	KMiqBP8GYKUZWTVpy1038RXqWs1eqWs=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="UViUk/45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770646856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e1roNXxhNy0LKO87TqA4vk6LCGOTIJNnrPMz2nNT0rI=;
	b=UViUk/4552JUBhXZm6n+yc+wl933UWALNJjN4onCop7AxyGl6dRfOy2OUuGJUXTTt93Fry
	TUTWiC1QkNoBvxZpMIu9jEJUAA0KS/lAmKqZepCoLhl74U6pvridhqYpgxY33tzhEB0203
	KMiqBP8GYKUZWTVpy1038RXqWs1eqWs=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6612C3EA63;
	Mon,  9 Feb 2026 14:20:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0N2mF0jtiWkcKgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Mon, 09 Feb 2026 14:20:56 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: mdc800: handle signal and read racing
Date: Mon,  9 Feb 2026 15:20:48 +0100
Message-ID: <20260209142048.1503791-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 9DE555BD2B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

If a signal arrives after a read has partially completed,
we need to return the number of bytes read. -EINTR is correct
only if that number is zero.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/image/mdc800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/image/mdc800.c b/drivers/usb/image/mdc800.c
index 7b7e1554ea20..9132cc3a575b 100644
--- a/drivers/usb/image/mdc800.c
+++ b/drivers/usb/image/mdc800.c
@@ -707,7 +707,7 @@ static ssize_t mdc800_device_read (struct file *file, char __user *buf, size_t l
 		if (signal_pending (current)) 
 		{
 			mutex_unlock(&mdc800->io_lock);
-			return -EINTR;
+			return len == left ? -EINTR : len-left;
 		}
 
 		sts=left > (mdc800->out_count-mdc800->out_ptr)?mdc800->out_count-mdc800->out_ptr:left;
-- 
2.53.0

