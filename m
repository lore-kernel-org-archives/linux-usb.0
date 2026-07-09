Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49124421886
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598495; cv=none; b=YtTDZFPq3FgrJ57QZTO++LkqfEWo8MIwSoKO6LEM4LGHIlF7OHkCpvIy0NJBOepf/d97XI82ZlJdGK0a0w/4rO9J9Vk6roGukUk09PG/mqghDgBa+hgI8rRWkjTTPoevCQQ9ldWFPZqOm5dIKJ1LNaHcIduiroMllc9Xa9nnu0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598495; c=relaxed/simple;
	bh=2FtproTtAMCk7FLeRakcPncvPMXzomNH62w+lywarWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obbNmYYNgHoAb8On1+wVK3+qHbL9eCyo3SCrgxu3cL8R5G3blqnH06wLYKqTKxQ9qrWxF5nBiIl/MqcHPoAgYzM8II1Kj8u3iXRFOGM7lOm4H7tA7I6ut2Bfuno9UAb16m7X8UXxKts96GCL9qlbOxbOtvpzJ5EcWotOKqkeXNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UKIOs+7Z; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UKIOs+7Z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UKIOs+7Z";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UKIOs+7Z"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C4B8D761BC;
	Thu,  9 Jul 2026 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783598480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YX+mTlt1U2ALz4CQqRTDtmC4lDOD9OO2v4ERzF5/6OE=;
	b=UKIOs+7ZGTxMa9bGKv7A+idX0HT80dXCsKF/WGa1y6GXiIQjKnIA0VzGAMRwGVAyTrMszF
	zYu9DxQ5ocMhqNo0vfSpDeauflu0H5Qjex/WByR87WQwp7czOfATkxhg6M+X4A1b/e+A0z
	4dBl+uOXvLmwe0TOv4FmWeA7WKWoldc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783598480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YX+mTlt1U2ALz4CQqRTDtmC4lDOD9OO2v4ERzF5/6OE=;
	b=UKIOs+7ZGTxMa9bGKv7A+idX0HT80dXCsKF/WGa1y6GXiIQjKnIA0VzGAMRwGVAyTrMszF
	zYu9DxQ5ocMhqNo0vfSpDeauflu0H5Qjex/WByR87WQwp7czOfATkxhg6M+X4A1b/e+A0z
	4dBl+uOXvLmwe0TOv4FmWeA7WKWoldc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B030779B4;
	Thu,  9 Jul 2026 12:01:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EGAEHZCNT2pEWQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 09 Jul 2026 12:01:20 +0000
From: Oliver Neukum <oneukum@suse.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	manuelebner@mailbox.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 net-next 4/7] net: usb: int51x1: drop dependency on cdc_ether
Date: Thu,  9 Jul 2026 14:01:13 +0200
Message-ID: <20260709120116.1423033-4-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709120116.1423033-1-oneukum@suse.com>
References: <20260709120116.1423033-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLp6hgsbiwipf7smy58x9iwpej)];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

The driver depended on cdc_ether only for usbnet_cdc_update_filter().
This has been shifted to usbnet. Drop the dependency.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---

v2:
- added as missed opportunity

 drivers/net/usb/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 52a5c0922c79..da0f6a138f4f 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -563,7 +563,6 @@ config USB_HSO
 config USB_NET_INT51X1
 	tristate "Intellon PLC based usb adapter"
 	depends on USB_USBNET
-	select USB_NET_CDCETHER
 	help
 	  Choose this option if you're using a 14Mb USB-based PLC
 	  (Powerline Communications) solution with an Intellon
-- 
2.54.0

