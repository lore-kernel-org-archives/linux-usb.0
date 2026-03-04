Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F6E2770A
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629286; cv=none; b=SJ71aW3Eu8SBTvUW3EhJMWu4RxEEregQG8uILs+o8GiCGTI355tS28HcNQaHlggjzzdz1aYW3C4Ro4JEQ0yKvFlAE92Mx0/H6hhBQ/jeQ7tVHjQ7LvoqKxP64eHS2JaGFOx1o8kluuMq9lO/l3faLDAQUQxknWDcVZpOLW1TNFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629286; c=relaxed/simple;
	bh=BZv7ILoMCXJFVmXyyIKtKnyYdUx9E7rfsUnqQhIUAgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M8+eDySKtBTnqjPBVqKETROxrc5zwjt4MHg6qigWmQCYJjJMPzVqBIs17YSBVevDgOxPuHE0gJ5MeyfVsa6Z5QqhtdJf8Jh31ZQFjDNFBfCAQmfnxWsZRohgm+rKlbTY/+wEQFsUVKmcDK2DvcAx55fYpZteMxdm1wRo3h0UNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=HgR9yB8C; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=W8ksIm6B; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="HgR9yB8C";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="W8ksIm6B"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E322D5BDF8;
	Wed,  4 Mar 2026 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772629284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oGOkTHaSgOa9ugBo5iPxNi8kiCOMYGNGRbge7rwkmrE=;
	b=HgR9yB8CykJH5ytxtF2RfcP17N4/oD/e4yj1dsQhuwvlX7LjsBJfYxaqR8TQVGGEWMG/q8
	0tUZViWaxdyUwRtJt1E53o/MQQ2xjoJFTwYQCVY/C1lQbiIRDZN0Gb+fY2NYDvTgYCVBgQ
	B5tHSB+tKMjvTiYxH2Ihbb7NlUb8Dw8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772629283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=oGOkTHaSgOa9ugBo5iPxNi8kiCOMYGNGRbge7rwkmrE=;
	b=W8ksIm6BEdzcmfM6bbQKbClKg8ZGS48H+hIyLTAFYOg1td/WfTFQBwtXT2swPwKrmZvz6Q
	PHK4WGxY/3tnbRDxmC3sYHuVI+UqHCz7HYmksQALvlhtvdKz7muH74iAtt2ilrFMJF2Rg4
	wbDSglNHBd6k6REm7DZo8rkM3fX1vJo=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2B443EA69;
	Wed,  4 Mar 2026 13:01:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f1JqLiMtqGkSNAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 04 Mar 2026 13:01:23 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	hanguidong02@gmail.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: class: cdc-wdm: fix reordering issue in read code path
Date: Wed,  4 Mar 2026 14:01:12 +0100
Message-ID: <20260304130116.1721682-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

Quoting the bug report:

Due to compiler optimization or CPU out-of-order execution, the
desc->length update can be reordered before the memmove. If this
happens, wdm_read() can see the new length and call copy_to_user() on
uninitialized memory. This also violates LKMM data race rules [1].

Fix it by using WRITE_ONCE and memory barriers.

Fixes: afba937e540c9 ("USB: CDC WDM driver")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index f2d94cfc70af..7556c0dac908 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -225,7 +225,8 @@ static void wdm_in_callback(struct urb *urb)
 		/* we may already be in overflow */
 		if (!test_bit(WDM_OVERFLOW, &desc->flags)) {
 			memmove(desc->ubuf + desc->length, desc->inbuf, length);
-			desc->length += length;
+			smp_wmb(); /* against wdm_read() */
+			WRITE_ONCE(desc->length, desc->length + length);
 		}
 	}
 skip_error:
@@ -533,6 +534,7 @@ static ssize_t wdm_read
 		return -ERESTARTSYS;
 
 	cntr = READ_ONCE(desc->length);
+	smp_rmb(); /* against wdm_in_callback() */
 	if (cntr == 0) {
 		desc->read = 0;
 retry:
-- 
2.53.0

