Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700764B8DEE
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650075; cv=none; b=Enf6+WKskZst7nvObxL5xdTjSSkr4Mm2eFvuRbZfFo2EYmw7Hr7YG6TA5ekzUUAXAiPcwkhk3LOyqn/cJkzQbtVSTqPiNkMyKtffz4YkJClQ2nat1oUvVbvNRQzj6tyS+QoRBLj396cWKWflvZzSRXV0e4ju+bJr5jx2U3knCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650075; c=relaxed/simple;
	bh=PMjP8pKeOMfkDhJpNvhSfvKHy48i4lPCNeBr7/H6DDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IeqbyU87PPLfPqveEKf0nwkumQHUaZsBvcUXyygyu0kwS9PgGUwch5SstFspVI0GwpHph6+YeKB8ASBF/Sc5gedA0mfD5vm0xT9IbpMqr3dMnFCF+Yfg1Wb2Z05KSZEQjWV11OPk/fLfFQ1UrVSTcv74wSucihVyPBgnQCrqmZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=GPImtj1U; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=GPImtj1U; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="GPImtj1U";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="GPImtj1U"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B9B7C75879;
	Fri,  5 Jun 2026 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1780650072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BT2rV33x4W9DPlLl5dZMQ+QmishwfrZZdlUQi72T5Yk=;
	b=GPImtj1Uzj/QQjVgte5/dbrrkgJdPIQo7JimuVceVxpOQqDNCiPC3B4xciVoZPWntPUFs2
	XZgbDlYCaBTA8N4rX9PORVfxc03TNmv07KPttTkmbE9tp86tPL+NgXQ9sC4Bm0fZtMstm6
	YoCGC+ZsrlIEA7FIEpUPR4KSb4VUbEQ=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1780650072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BT2rV33x4W9DPlLl5dZMQ+QmishwfrZZdlUQi72T5Yk=;
	b=GPImtj1Uzj/QQjVgte5/dbrrkgJdPIQo7JimuVceVxpOQqDNCiPC3B4xciVoZPWntPUFs2
	XZgbDlYCaBTA8N4rX9PORVfxc03TNmv07KPttTkmbE9tp86tPL+NgXQ9sC4Bm0fZtMstm6
	YoCGC+ZsrlIEA7FIEpUPR4KSb4VUbEQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92FE7779A8;
	Fri,  5 Jun 2026 09:01:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Czy7IliQImq0DAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Fri, 05 Jun 2026 09:01:12 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] core: usb: ratelimit cabling message
Date: Fri,  5 Jun 2026 11:00:58 +0200
Message-ID: <20260605090110.1514785-1-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

If a cable is bad, it stays bad. There is no need to flood
the log with messages about it. So go for a ratelimited
version.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 24960ba9caa9..5262e11c12cd 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3148,7 +3148,7 @@ static int hub_port_reset(struct usb_hub *hub, int port1,
 		delay = HUB_LONG_RESET_TIME;
 	}
 
-	dev_err(&port_dev->dev, "Cannot enable. Maybe the USB cable is bad?\n");
+	dev_err_ratelimited(&port_dev->dev, "Cannot enable. Maybe the USB cable is bad?\n");
 
 done:
 	if (status == 0) {
-- 
2.54.0

