Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2255F248867
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205137; cv=none; b=Ik6EN0nTJmJ0PxAC9Ug9IC4EJPTgfL406OL/DuubgoiyyKZRlTHokZNpwCWkRkIQMYhrStOHF0PJwDLHGzV5zQA8qshUCBzSbLu5ogi1GYzjmlbGtUUqcqfon3eqIIPuFFlX+Hh+rHWN9zZ6637/uq+0xy6KbxBK3IRmQmKbkG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205137; c=relaxed/simple;
	bh=Ha/cVwh0vvUmNi07rw7N5pEqeu9/bGSfKxMwM5scmOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T3l7kgSOM5ho0VE0SYncKeZjj+xfZuGhEEp/3++el4alk6KkxI4QgSrqop+r4psrEud52a4SrBXszNABfUhz0MYNCA6ZSCHgxrocz4Sdd3SXWpnEPFZUZOYmkrhsC/k7xFEjs52nw669MUE8CFLDsyaOsQ1Sb0zJfv/JEO7WVcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=tE0ZoJBl; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=WdKHgyFV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="tE0ZoJBl";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="WdKHgyFV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A2E251F7BA;
	Mon,  5 Oct 2026 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1791205129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pd3S0FpJw+tFjFFGMMktCKivCToK+D9d/PMpSAVN/8A=;
	b=tE0ZoJBlOc16euoHvkCSt6JHukGjUl4GO8y01O00+kR2YnowBF1WYGbLNoRrBVkWpSDgjY
	4unVFWX8GMspKeqBL6BJuwRb4dQ39skAmrq9azuqjSthlFkSh1TxySEOHvc0h6+h8Wajf2
	5MKQTO3RHfMEoTSDt3hi8eTlO0VV8u4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=WdKHgyFV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1791205125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pd3S0FpJw+tFjFFGMMktCKivCToK+D9d/PMpSAVN/8A=;
	b=WdKHgyFVmBY2gas11YWoTJMtT+aFWzbAWUgATs8hqzvXtOCk3zS6dyxj5brgD1OzquNsRz
	IsA1U/c8yqapZhmatyMz2HCh981YFgwe87Zn99DIezpAH3hJtCZMSdIwfoh+ssV6IBFTV7
	rYD4LHS9dJuJtZTKXFjLjnSqoGyEurE=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C7F913688;
	Mon,  5 Oct 2026 12:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rDNZCAWfw2puTgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Mon, 05 Oct 2026 12:58:45 +0000
From: Oliver Neukum <oneukum@suse.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: usbip: stub_rx: remove outdated comment
Date: Mon,  5 Oct 2026 14:58:42 +0200
Message-ID: <20261005125842.197848-1-oneukum@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,zenithal.me,linuxfoundation.org,vger.kernel.org];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A2E251F7BA
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

After removal of the BUG() statement the error exit can be reached
and logs a report. Remove a comment saying otherwise.

Fixes: 635f545a7e8be ("usbip: fix stub_rx: get_pipe() to validate endpoint number")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/usbip/stub_rx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 1e9ae578810d..0ccc05b76c5a 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -391,7 +391,6 @@ static int get_pipe(struct stub_device *sdev, struct usbip_header *pdu)
 	}
 
 err_ret:
-	/* NOT REACHED */
 	dev_err(&sdev->udev->dev, "CMD_SUBMIT: invalid epnum %d\n", epnum);
 	return -1;
 }
-- 
2.55.0

