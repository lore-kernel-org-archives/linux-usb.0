Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4931E34D91C
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706562; cv=none; b=nycG9ahZXX8cbdY8hoaf0gSIljUmO7lmcITBtLpAZ73bFyi51myL5uASJ+pTuDm/XXWmlzdGlC9TRmVD5yJF66TLC9/d3WpwIWWq9n0UMX3t4A66Q3vac5W+kHH26guUT7w51yhP7Rc0eSiVSvActc4P3jh0XfgLuFp3RBDVPEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706562; c=relaxed/simple;
	bh=w/YhZJ7LQdEcttgzVj9SBchdznwvn3+Vm4xjfNwhqFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/30I6KSepyTuXmFF4AHYpbu/Pa1MfCnqgXys2ni9jZs+fbYxmcM16cBTbgZiVL5SQSEewxL3EO2pluK8/M+rZQx6IITXkIXbEx03fbf9vorBFTddwB3m2BD0HrQ7/W91FSBxLd51X1pA5+dhaqx/v1m12WSLc3eZbWx8ohfh5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=rXbfDyaF; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=rXbfDyaF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="rXbfDyaF";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="rXbfDyaF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFAD25BD18;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mlk/bMYx+koUq5SCQnFWKYuV4O3bBBfQVGTyjRbTyjY=;
	b=rXbfDyaFslJIotfbY2OglxavChkRNAo49vAjSODZTuFxV4xhbFcZ8Y8p/g3jbnQ/TmFywA
	PgYR4g/xL6LOY+gMU+5exDiMNZXa0poZvxb00e1XWWhs/67BD4t/TMNZvnV2kdgSuU1nyj
	Kmt3M48bDN8hU0bUDD6l8Cta2gPXNQs=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=rXbfDyaF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mlk/bMYx+koUq5SCQnFWKYuV4O3bBBfQVGTyjRbTyjY=;
	b=rXbfDyaFslJIotfbY2OglxavChkRNAo49vAjSODZTuFxV4xhbFcZ8Y8p/g3jbnQ/TmFywA
	PgYR4g/xL6LOY+gMU+5exDiMNZXa0poZvxb00e1XWWhs/67BD4t/TMNZvnV2kdgSuU1nyj
	Kmt3M48bDN8hU0bUDD6l8Cta2gPXNQs=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A77A63EA68;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qNa4J/laqWkubwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 05 Mar 2026 10:29:13 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 4/5] usb: image: microtek: remove unused macro
Date: Thu,  5 Mar 2026 11:28:34 +0100
Message-ID: <20260305102905.2392512-4-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305102905.2392512-1-oneukum@suse.com>
References: <20260305102905.2392512-1-oneukum@suse.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Queue-Id: CFAD25BD18
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

No users left. Remove it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/image/microtek.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index 4de1de31681a..cd68aa27639e 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -175,8 +175,6 @@ static struct usb_driver mts_usb_driver = {
 	printk( KERN_ERR MTS_NAME x )
 #define MTS_INT_ERROR(x...) \
 	MTS_ERROR(x)
-#define MTS_MESSAGE(x...) \
-	printk( KERN_INFO MTS_NAME x )
 
 #if defined MTS_DO_DEBUG
 
-- 
2.53.0

