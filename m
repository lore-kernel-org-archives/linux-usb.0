Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00653CB8EF
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677330; cv=none; b=PXFPGi6AYN6yX4VQhJaRFTI+p5JYspECQFHBEZU9xKTw465ig2X9g/4jv9WGXq4127pM+uU/yMupKq0cml5tjZ10hBoLo39aKktNj16BZcOvb/fCroq78GB5bkU3JfybQEJwmjyUJ49iFVUxc3GWSXcg0LWA+8UfhHrNa68Ge+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677330; c=relaxed/simple;
	bh=t3DvoOiFLswlmQhGmBNLEk2I729CELCnxFe7egVnegg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hltcuDRMg+eT5sPaFK1r0c4QFaZQjdwMvbzcsKfWKU8naXsE3zXh+WoznHtyX9k+Ijy6wLnFb8MEq0D/7P8p8yzT0PbvEW5P0rvgOXDjam3KE+pp1LJL1Ox5Ij8bf0tpWA0BzlcJ11cIrH4GprA9M62RgmPCmu+IKkVM68y1nls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Jkg1t4wm; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=hniTDYY7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Jkg1t4wm";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hniTDYY7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9C1376424;
	Fri, 10 Jul 2026 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783677327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z2/YnuZbO//JohG77p+TharyK61fyTNOq+dNVzjGg6I=;
	b=Jkg1t4wm4w+KU9xlVGnnl8CFXzkGHkgrLmk8sW/9cMaYOxeSh0Y+OzOGODaDmfLfYW82It
	lifsgYcT+qEZmvOPbLgClhmKE5zPKmDOEV+3aod9q9PwpaMPEDbzrXfY9mA5m7dxwBCYrs
	WX9q7y/mETs1oNIV2X4324s7ix88yFA=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783677326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Z2/YnuZbO//JohG77p+TharyK61fyTNOq+dNVzjGg6I=;
	b=hniTDYY7NEIWDVihhJwSi0YY0NOdcl5FhlMTEYp1+Rcx2uZsJPyPPeKq1J6fWO1EyGFuML
	5jQN9xXEs+r4iQ8jPnPjLTTUpTlJ0rlQLpY3CMOytp742NgD5GRVg/mADtcRxIdp7zYAKd
	jE2h0LHLIRkCXiEAa8+e5nwwlpr286c=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC0C8779BD;
	Fri, 10 Jul 2026 09:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WIfXLI7BUGqLNwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Fri, 10 Jul 2026 09:55:26 +0000
From: Oliver Neukum <oneukum@suse.com>
To: iganschel@gmail.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	johan@kernel.org,
	kees@kernel.org,
	o.bock@fh-wolfenbuettel.de
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: misc: cypress_cy7c63: check result of IO
Date: Fri, 10 Jul 2026 11:55:18 +0200
Message-ID: <20260710095523.1646308-1-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org,kernel.org,fh-wolfenbuettel.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -2.80

If the device returns a bogus short read, treat it as EIO.
Actually check for IO errors.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/cypress_cy7c63.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/cypress_cy7c63.c b/drivers/usb/misc/cypress_cy7c63.c
index 4a7f955ba85b..ecc81c93c6ce 100644
--- a/drivers/usb/misc/cypress_cy7c63.c
+++ b/drivers/usb/misc/cypress_cy7c63.c
@@ -89,8 +89,11 @@ static int vendor_command(struct cypress *dev, unsigned char request,
 				 address, data, iobuf, CYPRESS_MAX_REQSIZE,
 				 USB_CTRL_GET_TIMEOUT);
 	/* we must not process garbage */
-	if (retval < 2)
+	if (retval < 2) {
+		if (retval >= 0)
+			retval = -EIO;
 		goto err_buf;
+	}
 
 	/* store returned data (more READs to be added) */
 	switch (request) {
@@ -175,8 +178,9 @@ static ssize_t read_port(struct device *dev, struct device_attribute *attr,
 	dev_dbg(&cyp->udev->dev, "READ_PORT%d called\n", port_num);
 
 	result = vendor_command(cyp, CYPRESS_READ_PORT, read_id, 0);
-
 	dev_dbg(&cyp->udev->dev, "Result of vendor_command: %d\n\n", result);
+	if (result < 0)
+		return result;
 
 	return sprintf(buf, "%d", cyp->port[port_num]);
 }
-- 
2.54.0

