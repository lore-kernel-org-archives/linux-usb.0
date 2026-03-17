Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3323932EE
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736904; cv=none; b=VRIdv205sIvzdJ8jnPtYW9WLM925ZYLB/NagTOn4uUTPgZpjwdpUHtqikOssneX4J0vmlMbNZxmdyw3q+xl31cpgfMs8NnFUN2JjlUfi0ptCiVKJ+E40II5QIdPhOGQz1EJaqYia6h1yiTwk+tmW5JvnVv2IzY4dTlPrPJ+dqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736904; c=relaxed/simple;
	bh=a4Dk8oz1x4vZ51TSoY2BcVzyyvJ8+VyWWjG+4x8iKnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DPZnXDI8aq6GQ9Zx6KX8nCuvYwHF30AACkQiKnCmXt3KkdW8s5aMmy7ppnsJ2Gh9L3x6pvIGQ6dx6opp76fLneJsluTera4hYtq3PUcBQJjn6m3s6KQN2vDUTDIW71vYkp8BOb/3qwsCn3bR16FvoTsx9rA6gdDHpCGZn/ec//E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=h8uJA73A; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=h8uJA73A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="h8uJA73A";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="h8uJA73A"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B999A5BCFD;
	Tue, 17 Mar 2026 08:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773736901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=l+teSa/RQrk4lBY3vjIxDmneMRsZkuSllap3kHaBlz0=;
	b=h8uJA73Aj1DzGi99+Z5IkSKBiHI3Ih8ZwpEkg0FkONk4a3wNjLek0qySBpeBSM70kakO/8
	NDCMZlVXYNkgVq6BapwiNOCtgykEucYHQV3VGV0OmXrF145UOIZu/xZPOF5dlOEu6qBj5X
	6aV1fou+bAagOeyODci4STreGAUqvns=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=h8uJA73A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773736901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=l+teSa/RQrk4lBY3vjIxDmneMRsZkuSllap3kHaBlz0=;
	b=h8uJA73Aj1DzGi99+Z5IkSKBiHI3Ih8ZwpEkg0FkONk4a3wNjLek0qySBpeBSM70kakO/8
	NDCMZlVXYNkgVq6BapwiNOCtgykEucYHQV3VGV0OmXrF145UOIZu/xZPOF5dlOEu6qBj5X
	6aV1fou+bAagOeyODci4STreGAUqvns=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76C534273B;
	Tue, 17 Mar 2026 08:41:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uhh6GsUTuWncdAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 17 Mar 2026 08:41:41 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>,
	stable@vger.kernel.org
Subject: [PATCHv2] cdc-acm: new quirk for EPSON HMD
Date: Tue, 17 Mar 2026 09:41:10 +0100
Message-ID: <20260317084139.1461008-1-oneukum@suse.com>
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B999A5BCFD

This device has a union descriptor that is just garbage
and needs a custom descriptor.
In principle this could be done with a (conditionally
activated) heuristic. That would match more devices
without a need for defining a new quirk. However,
this always carries the risk that the heuristics
does the wrong thing and leads to more breakage.
Defining the quirk and telling it exactly what to do
is the safe and conservative approach.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
CC: stable@vger.kernel.org
---

V2: added motivation for the approach to the changelog

 drivers/usb/class/cdc-acm.c | 9 +++++++++
 drivers/usb/class/cdc-acm.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 7ede29d4c7c1..cf3c3eede1a5 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1225,6 +1225,12 @@ static int acm_probe(struct usb_interface *intf,
 		if (!data_interface || !control_interface)
 			return -ENODEV;
 		goto skip_normal_probe;
+	} else if (quirks == NO_UNION_12) {
+		data_interface = usb_ifnum_to_if(usb_dev, 2);
+		control_interface = usb_ifnum_to_if(usb_dev, 1);
+		if (!data_interface || !control_interface)
+			 return -ENODEV;
+		goto skip_normal_probe;
 	}
 
 	/* normal probing*/
@@ -1748,6 +1754,9 @@ static const struct usb_device_id acm_ids[] = {
 	{ USB_DEVICE(0x045b, 0x024D),	/* Renesas R-Car E3 USB Download mode */
 	.driver_info = DISABLE_ECHO,	/* Don't echo banner */
 	},
+	{ USB_DEVICE(0x04b8, 0x0d12),	/* EPSON HMD Com&Sens */
+	.driver_info = NO_UNION_12,	/* union descriptor is garbage */
+	},
 	{ USB_DEVICE(0x0e8d, 0x0003), /* FIREFLY, MediaTek Inc; andrey.arapov@gmail.com */
 	.driver_info = NO_UNION_NORMAL, /* has no union descriptor */
 	},
diff --git a/drivers/usb/class/cdc-acm.h b/drivers/usb/class/cdc-acm.h
index 76f73853a60b..25fd5329a878 100644
--- a/drivers/usb/class/cdc-acm.h
+++ b/drivers/usb/class/cdc-acm.h
@@ -114,3 +114,4 @@ struct acm {
 #define SEND_ZERO_PACKET		BIT(6)
 #define DISABLE_ECHO			BIT(7)
 #define MISSING_CAP_BRK			BIT(8)
+#define NO_UNION_12			BIT(9)
-- 
2.53.0

