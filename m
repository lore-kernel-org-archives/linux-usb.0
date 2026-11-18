Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008956;
	b=aQUJgPeqDprbyQdnHsqhCZLqroDo1HdvHrSLgxpd0WJELkPBfZrhW1e48K+DhZby2T9M
	 jmaBxRZfASsQe27FTArXz/c3BKPMoE/Bj0gGy074qFQPklMhRYP2DqBHi/4fC/coNtUU8
	 Y+49pAIUEO9rzNDdHHvnDlIrxfJhovff55vDY4iGP2YphuNjFMu2tFUavleMetHJUZfJX
	 NN7JHN8kgL7svHjZ+yWnQFVcF3EX5Z3Km3vG1wyL/0KJ9KeIsOYF/hlpa8SC4xV4jQSZG
	 EtNt4L97sugndhwOiuhugmv0kHGYGGdUqT5qiDIZ65tCoQfSsBDMXzMmOxQP6yPRp+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008956;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=CFfLwQbVv+NaXz3sWiSr9p1yf+/6NKu2yXi9LEgYtX0=;
	b=PzfPKnpYTs26brhuWpy9kZfLA0wcmmIfLkXkoLj24kkZfxHumvJaYRl8aq//Hx6h1LAN
	 JoYlFnpU66oZQCQOiYnlh7617CfLgDpHFEvdSvr58OCi9TI0Bpou9F01wz/AqlJFLNKTD
	 xHzhZ+7oi1kK06h2A4FykQdTgO0fKssOf8YKPBtNCkj3nO0cE6IMj1+NA4RmqH/cSRdIy
	 zqERD/afZPFUHwCgAKSDRHSMspnmRxdu8yqAZJs85lxJyiaTJcFYFl2l2UyzA+tTrYOyD
	 MevquLdZ00vpDDfTvYT3+lxm7NL0VBlJqy1sCO0tmyEELwfPZWOJTcwjK09EGY4JG8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="pr2Ts/kB";
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="pr2Ts/kB";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E73606A31C;
	Wed, 18 Nov 2026 13:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86E73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=pr2Ts/kB;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=pr2Ts/kB
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9EA4422326;
	Wed, 18 Nov 2026 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795008953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CFfLwQbVv+NaXz3sWiSr9p1yf+/6NKu2yXi9LEgYtX0=;
	b=pr2Ts/kBOVnRhnkgGAdVrIIzbWGbh7itZNKTgE3HVG534jQaXJZqidTwYOyIpP+v0cdsiZ
	MweVxu/WKRcChPrJZw6f98tfHah86BsNgh8u0qDCFjqQRGsOFuUeeJOAayoRPOVK57D5er
	1cOIOxePbkc2XA1zv9KZN/v0YjcN8iA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="pr2Ts/kB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1795008953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CFfLwQbVv+NaXz3sWiSr9p1yf+/6NKu2yXi9LEgYtX0=;
	b=pr2Ts/kBOVnRhnkgGAdVrIIzbWGbh7itZNKTgE3HVG534jQaXJZqidTwYOyIpP+v0cdsiZ
	MweVxu/WKRcChPrJZw6f98tfHah86BsNgh8u0qDCFjqQRGsOFuUeeJOAayoRPOVK57D5er
	1cOIOxePbkc2XA1zv9KZN/v0YjcN8iA=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 420C51334C;
	Wed, 18 Nov 2026 13:35:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6RChBrmp/WriBgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 18 Nov 2026 13:35:53 +0000
From: Oliver Neukum <oneukum@suse.com>
To: petkan@nucleusys.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2 net-next 1/1] net: usb: rtl8150: break cycle between tasklet and URB
Date: Wed, 18 Nov 2026 14:35:41 +0100
Message-ID: <20261118133550.955312-1-oneukum@suse.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-10.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -10.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 9EA4422326

The tasklet can resubmit the URB, which in turn can
resubmit the tasklet. The cycle needs to be broken.
The simplest way to do so is to prevent the resubmission
of the URBs by poisoning them.

This has been detected by automatic code analysis.

Fixes: eff674a514bd3 ("USB: rtl8150_disconnect() needs tasklet_kill()")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/rtl8150.c | 10 +++++++++-

V2: Sashiko pointed out errors which conceptually arose from handling
close() and disconnect() in the same way. Treating disconnect()
separatly makes them go away

 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index d51e43170e03..6d20f52d52ef 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -353,6 +353,13 @@ static void free_all_urbs(rtl8150_t * dev)
 	usb_free_urb(dev->intr_urb);
 }
 
+static void terminate_all_urbs(rtl8150_t *dev)
+{
+	usb_poison_urb(dev->rx_urb);
+	usb_poison_urb(dev->tx_urb);
+	usb_poison_urb(dev->intr_urb);
+}
+
 static void unlink_all_urbs(rtl8150_t * dev)
 {
 	usb_kill_urb(dev->rx_urb);
@@ -970,7 +977,8 @@ static void rtl8150_disconnect(struct usb_interface *intf)
 		set_bit(RTL8150_UNPLUG, &dev->flags);
 		tasklet_kill(&dev->tl);
 		unregister_netdev(dev->netdev);
-		unlink_all_urbs(dev);
+		terminate_all_urbs(dev);
+		tasklet_kill(&dev->tl);
 		free_all_urbs(dev);
 		free_skb_pool(dev);
 		dev_kfree_skb(dev->rx_skb);
-- 
2.56.0

