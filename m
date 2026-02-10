Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5084328B45
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726139; cv=none; b=nG6Nf7KMgxhXD0WtMxhB7x2jXVhjeN6TkhN6P+KI3PLEl5Kw1DWGSzZqtGKV1fKnD3ZQRyyZyeaK8DWpUYPVLD7aICK3eXKG0wuwvM3AzPHCm3dppDNrTF7h1WbQJvxNcYMCpQ/4yTbiCcqTMfMZCX4EBoF/YFBNikzxj067IQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726139; c=relaxed/simple;
	bh=Z5dgTTrdDN5YTnSCVX5Z9v8b1qP3UUZZUvZix+Jk7oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McT2j+0QLCg4jtLqymEFSejpvLJPPxS73YqY7W4yvWtPpV5a2aY4DDsmwyMXtyhIAlB0j+Af73lH+dE/oQfXXU7Pvr7Nkma3u7QkywNg3RkST048O6RYZWyptiGeLxMTTp9et/zteW0FwcPxoi4JYgvsC9isGxQUAPTTM81TQMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=NBqmQtr0; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=NBqmQtr0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="NBqmQtr0";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="NBqmQtr0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C4935BD51;
	Tue, 10 Feb 2026 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770726136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PtaGvaD7ExNneudKvjFjP+emE5B2H67yn3ee1XHTCI0=;
	b=NBqmQtr0p/nUk/I/1pekC676YMaBfZ9EpZ1V/F8iBmw8/RzpHjgypuizBe+bKTXLJYmlyT
	QOViyon17obaqpZukF4T5xSrmgdCX9jCTYuYheylPVR27U6KHJfYAQwyjPA21KCdlM5yCY
	mIXEz4ttY4pa1ON9D4FCx59kDStKnak=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770726136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PtaGvaD7ExNneudKvjFjP+emE5B2H67yn3ee1XHTCI0=;
	b=NBqmQtr0p/nUk/I/1pekC676YMaBfZ9EpZ1V/F8iBmw8/RzpHjgypuizBe+bKTXLJYmlyT
	QOViyon17obaqpZukF4T5xSrmgdCX9jCTYuYheylPVR27U6KHJfYAQwyjPA21KCdlM5yCY
	mIXEz4ttY4pa1ON9D4FCx59kDStKnak=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE6CE3EA62;
	Tue, 10 Feb 2026 12:22:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HoM5Mfcii2nqBQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 10 Feb 2026 12:22:15 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] net: cdc-ncm: cleanup device descriptor
Date: Tue, 10 Feb 2026 13:22:08 +0100
Message-ID: <20260210122208.29244-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Flags are boolean values, hence they should be typed
as bool, not as u8.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 include/linux/usb/cdc_ncm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/usb/cdc_ncm.h b/include/linux/usb/cdc_ncm.h
index 4ac082a63173..97ef37a1ff4a 100644
--- a/include/linux/usb/cdc_ncm.h
+++ b/include/linux/usb/cdc_ncm.h
@@ -118,8 +118,8 @@ struct cdc_ncm_ctx {
 
 	u32 timer_interval;
 	u32 max_ndp_size;
-	u8 is_ndp16;
-	u8 filtering_supported;
+	bool is_ndp16;
+	bool filtering_supported;
 	union {
 		struct usb_cdc_ncm_ndp16 *delayed_ndp16;
 		struct usb_cdc_ncm_ndp32 *delayed_ndp32;
-- 
2.53.0

