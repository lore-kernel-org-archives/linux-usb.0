Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530149;
	b=TrBi0OqNCR0NiaynMsU1iboLMBLJJggd9DwSD8zOeqyehupaZdgzKvPjQChEhkIPhI1J
	 LFMDnJgXGgVb4m0uF+vyGlUyoLkiPv1GqGteE8+HJcFW677BTr/4UnBJ8jC8gE4Whps2f
	 sY62wqPRrxVRZjeZZKpex8Cn8B8p2WMFZKqzHB0tb5NzOZSiFpfxqmBWt+3e+3WRVV8th
	 nks+3E2s3Ne0L8OzvU4v9N65j4j9ILQ8SF82NbzUEOi5tEOUPQy5JvM5W0nvYPKsPKkNm
	 om2GX9ftM0Wo5LhIkC4ja1eeHz86qKx5JMUtADDJzczGIGJ9MvNmRB2NhXTt2K4hNoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=AMPSZX4RQOthblKsm/D6C9UAaIomRft8CK14da6DgqI=;
	b=Y4BZ9SgZf0Ebz+1G6C7TblZDn46Um5YO9Z0lahWVV0Quu56114qHmofpX7Qbw8Ax+YSH
	 AiSY6Y8Xp/gz0wUWGhi7xkGoE6BSKUUj9nbdyPpHsOz9XTAIiiVv4tbjb5YgOBfo4OiCS
	 C+bI2RX6QOiNmG6YfCyoLjxpqthLu1f5yhk3gTbO6lMxMO6MlbBpei/BvC5iL/LEZxscu
	 vYsgzqOMIBkIl0xwE6pWDPLfUessz1TYz7LokHNCOuMoEJCe6buFzf4gJ2w/F7sBTiJAA
	 6ThvERQ6BJ8CxblYl779rxP5so1dBbhCHQEWXK/xaD227PhBbOgeRkLGgFanyWxatRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TSJ2tztd;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A90606C254
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 00:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A90606C254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TSJ2tztd
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so483136eec.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794530148; x=1795134948; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMPSZX4RQOthblKsm/D6C9UAaIomRft8CK14da6DgqI=;
        b=TSJ2tztd2DlsLnjU+jiCGBbzcvrErEUH5R1OBawcrL2udyDPd0d/bAB0cPJ3COtmvy
         iW7YGYV+9ex9Toc5dAnY7RJKoyFAxmp82UItc4nXxYUGGOGy73uepTEIJIYj2FYhcEsg
         25u2nGmjkyPJfmMVImfsUA3PQncrnroHfl4MZdWQAfxVY/boLGrzClg8JhJG8nBL+gEB
         iEHjhDm1EHKb/tQfh3ENPJWZFKP+78UmJqe2c1rlfKxzTmlqw+qBQ4Tnm7PptXYqySsx
         ac3jGA4KRUqw35qiMKGZ3e2ryvnCi8IlISDC5XFVJEio1JqYT6Lixbasz7uPPY3Mkagq
         CoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530148; x=1795134948;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMPSZX4RQOthblKsm/D6C9UAaIomRft8CK14da6DgqI=;
        b=yZBn6/Nsnc6x7nTOmsWK53Xzlid+w/GRfnnmxb6GSGs5WC59gRqf0ZrKlyJlCXPWsQ
         uDBSaCz1+Z8ekQjrSXtJLj8NRCFGvxMH+j+mN2eaTjD39sPY1WQOgdCcvuFymn0Bm+FD
         MGYV5ZjKMQt6DWj+ezMN4z9d/R1J4HXV1HwYPJSAKy03ZL0SOYUotIVC2DSFN9c4P682
         vJN8msuavFvTM8sp/5GgqkF5S6dJY4vdo1LgwL/XpNHX538FrawBhlRDTG7XkhRpHGr+
         SDbziAHD7DCsLaIURCDa1hbonFmnMjD1Fv9N7/Bh4/WAqWqqNLWglq5+eRoP+iAvh+kR
         48oQ==
X-Gm-Message-State: APuU4Z80AnqD0cmLCxQ52QmUV5s4eSj41Yn13t7ISysoc2xDGdTvhw80
	u7xCoe5HU+UxYdSZjE9Bg+k7FPbYKgcqKtD+aYzraQBIbAa3T/qGIkkEJ1ETB19D7cuNbk0BvPr
	Ax4Ma78Qy2bTxz+1l3/mCDJejDTsDU9MQ1PO1zA==
X-Received: from dybhh46.prod.google.com ([2002:a05:7301:292e:b0:376:93cf:d6ce])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:fd89:b0:369:fe81:a575 with SMTP id 5a478bee46e88-37967ae86famr662615eec.35.1794530147486;
 Thu, 12 Nov 2026 16:35:47 -0800 (PST)
Date: Thu, 12 Nov 2026 16:35:35 -0800
In-Reply-To: <20261113003536.3622755-1-sarthakkukreti@google.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113003536.3622755-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113003536.3622755-3-sarthakkukreti@google.com>
Subject: [PATCH 2/3] usb: uas: fail command submission on fatal USB errors
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

uas_queuecommand_lck() only treats -ENODEV from uas_submit_urbs() as a
fatal submission error. When a link drops or an endpoint is disabled
while hub_wq is frozen, usb_submit_urb() can also fail with -ESHUTDOWN,
-ENOENT, or -EHOSTUNREACH, causing uas_queuecommand_lck() to return
SCSI_MLQUEUE_DEVICE_BUSY or queue retry work. In addition, if status URB
submission succeeds before command URB submission fails with no inflight
URBs, calling scsi_done() directly leaks the unsubmitted cmd_urb.

Fail commands with DID_NO_CONNECT on -ESHUTDOWN, -ENOENT, and
-EHOSTUNREACH in uas_queuecommand_lck(), and free unsubmitted URBs
before calling scsi_done().

Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 drivers/usb/storage/uas.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 5aa369087295..6b573de89162 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -743,11 +743,13 @@ static enum scsi_qc_status uas_queuecommand_lck(struct scsi_cmnd *cmnd)
 	 * a command that has finished is a success for the purpose
 	 * of queueing, no matter how fatal the error
 	 */
-	if (err == -ENODEV) {
+	if (err == -ENODEV || err == -ESHUTDOWN || err == -ENOENT ||
+	    err == -EHOSTUNREACH) {
 		if (cmdinfo->state & (COMMAND_INFLIGHT | DATA_IN_URB_INFLIGHT |
 				DATA_OUT_URB_INFLIGHT))
 			goto out;
 
+		uas_free_unsubmitted_urbs(cmnd);
 		set_host_byte(cmnd, DID_NO_CONNECT);
 		scsi_done(cmnd);
 		goto zombie;
-- 
2.56.0.611.g1030f0b940-goog

