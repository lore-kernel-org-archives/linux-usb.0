Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D452C15AB
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466038; cv=none; b=tMjH3yE4lKP4xzhTFS72+X4iQY+d3HIkTAhcKI5ntVKCiYwn3tLdvHPSO+jf40SRmV2tX4gxSqwX+VdyRFYC3cbeJVKpqoseIHILolAqRLjUQkXGQG0ob2eB9OdwzWbEZ81pG6hpzYSg68elun6jyHzeB6+Qj5PKQOQwxuAtNBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466038; c=relaxed/simple;
	bh=LtvS1Awep2GA9vYnEwFmrqWsDQEexm4kGjwpZltCeoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aaNHZsstKMXkygvvUoo1LBPZRWtrvHzc7rzq3TMsqCBNgT/EgJv6GtWVoaA3wEc31RrrGyaiE6o23aPq+2Dedd2U3QxUjZHSFN9h01ZlR5fyFjSNHQUrVrii3qrYo2aJEkf2h9DW7jhg1Q/SbticYJG+akAV864P+QSzrEAZtyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 69D3A219A6;
	Thu,  8 Oct 2026 13:27:15 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29C2413354;
	Thu,  8 Oct 2026 13:27:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3N9dADOax2opBQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 08 Oct 2026 13:27:15 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	luca.cecchi.info@gmail.com
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: uas: do not leak error codes from usb_alloc_streams()
Date: Thu,  8 Oct 2026 15:27:11 +0200
Message-ID: <20261008132711.211908-1-oneukum@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spam-Flag: NO
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 69D3A219A6
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [0.00 / 50.00];
	TAGGED_RCPT(0.00)[]
X-Spam-Score: 0.00

While a UAS device is undergoing a reset not triggered by
the SCSI layer there is a short window in the error case
of reallocating streams during which internal error codes
of the USB layer are exported as nonsensical queue depths.

The error has been noticed by Sashiko in a different
context, but it is a general issue.

Fixes: 4de7a3735bdc4 ("uas: Fix reset handling for externally triggered reset")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/uas.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 265162981269..3f69e9de9b61 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -983,10 +983,12 @@ static int uas_configure_endpoints(struct uas_dev_info *devinfo)
 		devinfo->qdepth = 32;
 		devinfo->use_streams = 0;
 	} else {
-		devinfo->qdepth = usb_alloc_streams(devinfo->intf, eps + 1,
+		r = usb_alloc_streams(devinfo->intf, eps + 1,
 						    3, MAX_CMNDS, GFP_NOIO);
-		if (devinfo->qdepth < 0)
-			return devinfo->qdepth;
+		if (r < 0)
+			return r;
+
+		devinfo->qdepth = r;
 		devinfo->use_streams = 1;
 	}
 
-- 
2.55.0

