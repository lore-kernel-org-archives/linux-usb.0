Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195727;
	b=WUtnqdMK6540Y4EuUXiFboI6ff80gg4xioylA38FftpRJb0V1dWimnW136cZlMcH3TOZ
	 j0j5kQWK/Eqv+lJdVs8+i9Or9D9og/+tlgHVPXWKxG4Ok1T5KC5r5ePqVSro7v/E+TvI3
	 XTa7bEyBd5Wdek53xayaDz2iSKco6DEy1GB5VLsp8LBawbKFtW9vwbrizqtKjlHkY2M8R
	 SylTsS17A7r+9qpZJj6pegsBYP8LlVw6PZ6NxJwz5q9dRj5VoLs5OQ8++H7cWesA7qBhm
	 7K+lPQYmptRrvqSjrdWBhL0l4ypW8NhFYwVbe1Sgp0FwBxd8IalvkAwhx6WNJdeqcRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xxYJksBoX0oLarGiBWELphq92MylUpFS9PsbMM1zZeE=;
	b=CIjElX//D3gTtmIkLsZ/36rGFP6veEGmGvHf/TZELoD2tr7u85Se3PAtTnZGomYGzQ2b
	 WFyyQ5ddupULsp36SAFUhluWJfWGS7LO48jswORpbJgu194opRnHyBWItLjSWM1cYamuc
	 HtsTQ2Mn6QJ5kkZKJA5E8SMnL7mDDSQApaKglqch9k5lD32zgMooRevIO2r6HEUVRdO7P
	 I705cXteSQk0ygaMX9PUWcI9s/OZqXAjR+U8y4gANsDmwiYde/YnWcM8GP882jEobqbiO
	 sMfmh4r2cFgsWI3hqPiF4R47fMqYlmvMZdZycxtdsQshmnvcSn1xUt5jdj1LC/OIhtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Z5jqe+ct;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950C8606A331
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 17:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950C8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Z5jqe+ct
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so672477b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795195727; x=1795800527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxYJksBoX0oLarGiBWELphq92MylUpFS9PsbMM1zZeE=;
        b=Z5jqe+ct7rqVEZunLyzcRBFtUcB1PaPmFayXQj80bxlnQ7nuLHz1OnJcJ9g/Aure4R
         FaAwLsrx8PBE2Jxv/2G945qIWvKjujkadkVip6lw+QDi59Tv8zklpOtm88hYJewmggn4
         glxT42F3oomoyu4zhx9fkoHRhUPmEBYE/szYJYz6ByUHqvjn0PlRLKy3GespQy1Nbubd
         3+Bgq3kKEMg+2r+KY//L27oak23aliNCMY80QJs4T4YvGguFKweFrQzs4/iMdvCxvhjJ
         RG8VZqk7+IIFZUQMsw9uCaDhmB+Z1F1NeYsgHfy9erJMOPOlgALht/KD9sluBxjeFXE8
         iLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195727; x=1795800527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxYJksBoX0oLarGiBWELphq92MylUpFS9PsbMM1zZeE=;
        b=qnxcvx1fszIrfykj5Wy9gNEYkZ2Ciel6x0toUgd5EVFw5X608N6etlnTthIrfpNryZ
         3NcmqFBwk897giN/8M5XUu6CoCx6IepkFsOY3F5onefUZNXFOqr7hVDJnXjOIzLVqD6s
         R8GNTXYtiDy5Wez9sfBvRI+yE/GwhDdNH9pyVa8LMap/vSftWdf5bLC4yjDrmhHbrzzR
         asYyyVfYsLJA9zybi6dc9QQ67lAKtrTJTtEem0/Mjn80LgeEyacCHGMHa5Fk1lUiv2PB
         PjEqu6vFFo1u7v4qjESA9jVG+I1vhlP7fIfazQ+2UxAdUxUvttriDTS420ORpEzLiTjw
         gJWg==
X-Forwarded-Encrypted: i=1; AL+hErFRUW+3nwQxE9hQHl2qLMrAc8wD10T+wbdsDfCmiTCykxlkaWGB7WgjR0UaDcA3p/9gi24z485fiXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lkKwcXc4eA4gcR/H1Y8KUjiMXn6tIyJyOUGNqoxjqAchzJQBK
	44O4ugogUvAsHRvVCPg0NYzeuYrTxz6RsklAhwi5smrrcQTPZ6R28V5KscItjVvNTaM=
X-Gm-Gg: AYBFou1s7xo+lOAMporlj+3Uj+NHeIzaLe04pOI5a8MHlVA7MUy8LjJlSULG+SP23OT
	mGksZHlv2vCpQXpmg1Cn7ffX2FSRcssLnvGdIroUiqexb23V4roHWXJEsXtpWnkzV+U/Uazt3Cj
	YHwW89DxYX18RuRFCmHZyRbOo+rMLROq0nxd6Pk4hcojCTR4oJYhcl1oXIp/e52iuoSMvP4jTMI
	NpSK3G6BVhvAd2wK4Gvh9W67GsI2F7M9pFJjFjw+kVzg03yrTGSHlj4xIYBSBaEjZn8JzqYAcJO
	Dd7eU4j7jwgccMPZUB17Oi4iPldl8gB0s5oScviCv3lf7pP7ZjAIHLR8CCpRxwB4GWAZ6lEc/+v
	52WyY5D5TfCKah43c+LHtCnDQYMeOdHaIg9AFARdYWBrIxaJ7jpxxCbIM7+kwzmlfAij/MGwYAK
	k2spEUjFMh34U8UJD67QRSuakYxTuCRiovjk5snB0jLDjS0r70wF7w94RwYkhjcmPYdVTnajCgW
	qESl/bskWIMQ1UMnxNK8cNjjbJDId3Idnv3Jb7xcNCFxoeJKOZoK8I7gGII5LUzaQgbEoJzkE97
	2a+eF7WGLrmW3ottJt2aeLQb1/cvQZeTnHv3R1VdFDJpsEKRyEOG89xOXOc/Ioq/03CVkE6YCzx
	V/eJPS/LZaV7dbM+Pg6T3eLGnhG/pNGRJuwc79g==
X-Received: by 2002:a05:6a00:1989:b0:8b5:a9e0:3050 with SMTP id d2e1a72fcca58-8c8792c35e6mr4133537b3a.2.1795195726843;
        Fri, 20 Nov 2026 09:28:46 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87334890csm1867911b3a.33.2026.11.20.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:28:46 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v9 1/3] usb: gadget: f_tcm: zero the CBW buffer the status path sends
Date: Sat, 21 Nov 2026 02:28:27 +0900
Message-ID: <20261120172829.3286180-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
References: <20261120172829.3286180-1-yhlee@isslab.korea.ac.kr>
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

bot_prepare_reqs() allocates fu->cmd[0].buf with kmalloc(), one endpoint
maxpacket in size, and the only thing ever written into it is the 31-byte
CBW the host sends.  The rest is never initialised.

When a command is rejected before its data stage, bot_send_bad_status()
points the status request at that same buffer and queues it to the IN
endpoint for a read, and bot_err_compl() re-queues it until the length the
host declared in the CBW is satisfied.  So the host gets the buffer's
contents back, a maxpacket at a time, for as long a transfer as it asked
for, and whatever lies past the CBW it never wrote.

Allocate it with kzalloc().

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v9: move the credit line and the Link out of the changelog (Greg).

The same change was part of Hui Peng's multi-driver patch of 2026-09-19,
which was asked to be split per driver and was not applied:

  https://lore.kernel.org/all/20260919223521.3890508-1-benquike@gmail.com/

On a dummy_hcd gadget with a 512-byte bulk maxpacket, a rejected IN
command declaring 4096 bytes returns 4096 bytes to the host, of which 72
are non-zero and begin with the previous CBW's "USBC" signature.  The part
no CBW ever writes read back as zero there, both before and after this
patch, so what that buffer held beforehand was not observed; what the test
does show is that the host is handed a buffer it only ever wrote 31 bytes
of.

 drivers/usb/gadget/function/f_tcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 3af28419a8bca9..22e57f14e938e7 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -330,7 +330,7 @@ static int bot_prepare_reqs(struct f_uas *fu)
 	fu->bot_status.req->complete = bot_status_complete;
 	fu->bot_status.csw.Signature = cpu_to_le32(US_BULK_CS_SIGN);
 
-	fu->cmd[0].buf = kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
+	fu->cmd[0].buf = kzalloc(fu->ep_out->maxpacket, GFP_KERNEL);
 	if (!fu->cmd[0].buf)
 		goto err_buf;
 
-- 
2.43.0

