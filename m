Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72403442B13
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840729; cv=none; b=pQSyy8Xr2CCBcYhRwBOwPuctzJNsicC5RbKwLUZP9O9l4mtcqydJVf64AsnTZJ58si07P61FS+BeIL+uaEP4nXgnPGMT6pTy4IEXeI4FQCdDBzmye4MyzFwxjVRvFYL6hjkUWxsW8Veu7g1KZ70PQEyRXIljlXdzlMrYZbC0K1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840729; c=relaxed/simple;
	bh=RfvuIqLUPysJ5feCi//upHyde04+bAgsDog+cp6yJBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQREcEO6E/Lz1V4lqG4P/Le7AYfJMN0yZAZDAn/1hdd689AK/t7YdO09wJDkZ+dTJ4/QfrFVmEfGPmQZFDrMnTgrLrM9NbHQ6/aYjWLmiLMID9v6TFrKV8v98WR9POK3+JpcDKxi8GviM2EfY2DEtdMq2CCcjC3ujLX/rJJsBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=OKlpMiku; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=eMmXBAwL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="OKlpMiku";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="eMmXBAwL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EA38D3F7F;
	Tue,  4 Aug 2026 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785840717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3bKZUAt5qVdlMJZJAg65u58Q60YHQ2XMiSkyJyaecmM=;
	b=OKlpMikujk+ZcBetWBXdyajvZArfqKsAceea6USZcsfWE/BAeXLTs+Pcl68eo3xLzLqsBW
	sPW28UBazKWMSc2VKJs4bRbxxW4/mVBwkGPIZoIZrhE0rjLmjJc65KPh1vBzSI3ozGJrYl
	utN4aFrKehruyNSKglyuwm+JXDVEIBg=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=eMmXBAwL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785840713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3bKZUAt5qVdlMJZJAg65u58Q60YHQ2XMiSkyJyaecmM=;
	b=eMmXBAwL4iFeQfzxA2JV92vlqdLBGRpvYiA9QydM2pHvnyn8aV9P1mTWa5X6sEzhqeh6ca
	pEgAw6rIw/MEv9rkUTf8QlwxW+nCW9aUXEPIMi8PiUnJFn0UQd0LCzazNPiTlUriy/8aje
	K/6H7TpwAmApGg4+YCV4GCQdkWQgPcw=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAE53779BB;
	Tue,  4 Aug 2026 10:51:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id srSQL0jEcWreaQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 04 Aug 2026 10:51:52 +0000
From: Oliver Neukum <oneukum@suse.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: serial: digi_accelport: fix crash on SPARC
Date: Tue,  4 Aug 2026 12:51:50 +0200
Message-ID: <20260804105150.576159-1-oneukum@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: EA38D3F7F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

The helper function cond_wait_interruptible_timeout_irqrestore()
reenables interrupts. It does so by means of the flags saved
by spin_lock_irqsave() in the caller.
On SPARC these flags can be used only inside the same stack
frame. Details can be found in

https://www.kernel.org/pub/linux/kernel/people/rusty/kernel-locking/x467.html

If the compiler decides to not inline the helper function,
the kernel will crash on SPARC if the helper is executed. Hence the
compiler needs to be forced to always inline the function.
The bug was inadvertedly introduced by an adaption to modern
coding standards.

Fixes: c6d61269f530e ("digi_acceleport: Drag the driver kicking and screaming into coding style")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/serial/digi_acceleport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index a687217eadd7..50b89316ba1c 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -336,7 +336,7 @@ static struct usb_serial_driver * const serial_drivers[] = {
  *  with the equivalent code.
  */
 
-static long cond_wait_interruptible_timeout_irqrestore(
+static __always_inline long cond_wait_interruptible_timeout_irqrestore(
 	wait_queue_head_t *q, long timeout,
 	spinlock_t *lock, unsigned long flags)
 __releases(lock)
-- 
2.55.0

