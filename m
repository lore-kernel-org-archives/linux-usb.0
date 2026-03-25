Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA43E274F
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450549; cv=none; b=C9RmjeFCyy12GmtsTZ6lioa3OeYkBuQj1Oo+/hLjgXu7FLkPt3LgNbmPjX8hbwpTVda1Us4Cd27GAkJRbggZUvqv17XUCbOGEd4FuoZUnUqH7WqN/HHo4gk9aj+vQXLxBBsN3qqTv1/YGwES44DUKoSyduLxCnHEmWJjM3YNZEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450549; c=relaxed/simple;
	bh=dlQPOIL4cGbd2u5L2hLlAd6JVu9MHOP8H3uMmojgQqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYyu5s+vf17dQ0594oyaaIuLtplqsU1GC5Ycn8V7EtIxQ1zVnE5iVqOYCkLgc3J3YMPHMhQosVNk9q+fzwtGQHwavX6KetFAgCbdg4j/u15K3/mOpnSbgqD4/6ih2TuaB12j9QJm23pVDTKlrxtnJc0gWS4+Rf1KWLD0X8ShFaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=iwg6TlWD; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=iwg6TlWD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="iwg6TlWD";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="iwg6TlWD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F3675BCE7;
	Wed, 25 Mar 2026 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774450546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SGm+2qQ5TtQOJ34e+7chpeTUsTsj02kcnUHB1Lq+wNw=;
	b=iwg6TlWDH/x0Fmg7NBaKtrOqmKLGN1JlpPg3ja1kb3wcMoPQdsgzjo/kFu7+YaguM16yMh
	tMjfFDXA1tyw7n3imJul2h9M85c3o2i42QcyTLFnYCC+I6Q6b28v1j3UJVR/nfCV/3nNKW
	BgRfjegHPB3hBzRFukTigIkfXQ5XUwU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=iwg6TlWD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774450546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=SGm+2qQ5TtQOJ34e+7chpeTUsTsj02kcnUHB1Lq+wNw=;
	b=iwg6TlWDH/x0Fmg7NBaKtrOqmKLGN1JlpPg3ja1kb3wcMoPQdsgzjo/kFu7+YaguM16yMh
	tMjfFDXA1tyw7n3imJul2h9M85c3o2i42QcyTLFnYCC+I6Q6b28v1j3UJVR/nfCV/3nNKW
	BgRfjegHPB3hBzRFukTigIkfXQ5XUwU=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A7B044463;
	Wed, 25 Mar 2026 14:55:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TaxqBXL3w2kzZAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 25 Mar 2026 14:55:46 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: translate ENOSPC for user space
Date: Wed, 25 Mar 2026 15:55:20 +0100
Message-ID: <20260325145537.372993-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid,suse.com:email]
X-Rspamd-Queue-Id: 3F3675BCE7
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

In case of insufficient bandwidth usb_submit_urb()
returns -ENOSPC. Translating this to -EIO is not
optimal. There are insufficient resources not
an error. EBUSY is a better fit.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 include/linux/usb.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 04277af4bb9d..815f2212936e 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -2075,6 +2075,8 @@ static inline int usb_translate_errors(int error_code)
 	case -ENODEV:
 	case -EOPNOTSUPP:
 		return error_code;
+	case -ENOSPC:
+		return -EBUSY;
 	default:
 		return -EIO;
 	}
-- 
2.53.0

