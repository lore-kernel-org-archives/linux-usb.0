Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005625;
	b=wraIwNVSBoNTwFlcjbc8+asWVvhkuiDZnpK48fx0yAwVxgq/Th4N00LptKggJKoHvlHi
	 VKAqrL6OP3Zd7+k+e7NKGz4J8VSZ7/+IGBdO873WUyKqhOyFC42v6vBDMhUnSMVGZvs81
	 B/4K1ByaJwP/Qk4D38GKvZIRt3QIOMlczSB8gT3pWbetmDFTCLVPO40zp3VXCMCMPhonF
	 JDMBcHQZQRj7StFkNhZDj36fJRf+tUC+fQkxglKOqlgC/7Js4DkZ3Yu8egR3Ijaavi6/B
	 j8ZFeZ152OXXMJuDEspsVYKmXN1S323WUfO8YWnCaSj31vKZx3dDX8KAwZcsEmwkjYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7pJ96I8CCGvOS56AX9pgEAEbaQ1usEuN94BGKUJKVPo=;
	b=OXZ+3LKD1trDE0d2h3ZuBkcsYcUHYIkJ2d6o70vCehVU1xTXhi32EUPw5V9hWbKZR5bl
	 rvD58ZBvgBae4nLSOnps1PDXghqboviXvY+20l4WOmjbxToZVjOttrhbePYIHZ34267Qm
	 aPZiFSOgJVshZtpB26SxLbvT1Mfv7u7B/V62GFqyhDDKqoO3lE/0TpKK706KFKAWEdK1U
	 f+USYDEDfg6BIbQcudYtV84FX+yXg81kVu0/jp7ucU5j2tmH/vQfzh+LJz8oS/U0aYvU4
	 utqHXVqHBpY2TFAMfFQrwqG432UZia354SKiPHNUZjimO6/dOxTvKUsuTm7rZYNyrRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QYuCHNu8;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FF0606A332
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9FF0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QYuCHNu8
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9d7791b00so8918745ad.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 04:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005624; x=1795610424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7pJ96I8CCGvOS56AX9pgEAEbaQ1usEuN94BGKUJKVPo=;
        b=QYuCHNu8QiyJp2MmNEq84pI0sM6uyoM03JyUTwEf3p9qB0jGDLOjhNGToBsEVByldX
         Mueu575ttpUYhaEDvPC2u2xhTahftneuoIh7ORw2GCegd4CVy/iGP0v1QPoW49WXCa/0
         BYRb/8pMzvEG1N3th1yKnxl/mVa7G9lF4IU6HqtVveX+bRwVxJVdW8Qa3f13KQ0N15ok
         n7N8BEGML5RYFPICQrFPESxVHejYefI7vPzxR+J7Ct3LszSIv0FwxIRPxqNMchLjLzgO
         wVAP6gUr6Wkyq+snL5d7+igxRnS/XIikZrwrwg7FEmqpU8RKemBOCFo2x4MlKX3McsVt
         g7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005624; x=1795610424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7pJ96I8CCGvOS56AX9pgEAEbaQ1usEuN94BGKUJKVPo=;
        b=W9Az76LIHLH2GqzoBj/PagIGmZbDl1xCmY9r9OjPJIT8h/pPMFFtSaTJwHxjCOpVYb
         C0UmQrG3GWbOVppXYy3bdkmV//viZsQLjgYtA5jh14K84egM4G9LjN9wl/5EhXS4QAY4
         6gPkQs8aYy3kNRYVJEMQ57b+KovjEsTMI8irNO7GEOhJPKyC3Z8OF0lhd0kyaY+4gTZn
         Dt5juFBwQ+hswVH8bp0yJuq1EVruAsAgmAtpWrPdOj/B5qdvIgjzdGSCVV2wiCxceeOs
         WcRqcwhevBMyedoi9AlZMP0SFcYGEzRlK80m4G9GCSJsXqssTVP426xePMVg+KThvJFB
         yAvA==
X-Forwarded-Encrypted: i=1; AL+hErHOl7Y47n/ugb2pULpD1JGAqCyIbVpaVjF0Z00II4OM2rGQUB3zteMQawkg30/i/VTWn6/hpG8AJCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZUsp8sqMK05+AKs9SBtDFgeZGHtSlcnPT1PI/WpxqMXnbuT4C
	Kj45bQIFvhFQIR2orrYtiNYAqG8NIok7K+l6Wx86/DMt0OiIQmlkc1p3Nk8r3gNuaV4=
X-Gm-Gg: AZFdTZeM9Fo2r1yCS9c8oy67TVYxMLlGMh3KkxLjFV7Vtq7k2wPshE6vO+F+c57y+8+
	HUD1nWEse11EPlk1mAP9tTSp4qfz+l+IOGcrerzqJ63V/uJF9UxhR8kLyxBgylVkNFXrRap48qn
	YTXRU88N5gdv9/Xxq7i3Nxw9EBQXH25++smvCszA5MPDZ/CQw8mTsYdA1Rqb9ByRibIoP3CoDAD
	8Dnl0cpmGHnI3WFgew94L3f6KD0LPHEj60CyX77lhyiOgB11bO8NXGIeGukn7eLba6A80l9Ox84
	XBRlrh2vawYur7sIATb9Y12FnoMG33ocAwlSFVL4z/L0Cf/i6BOLesZONczgwtuCpwFTJyjJT4c
	aGs871n1Ka4fckOnQPyu5ORojQvun5HmAmODRnL5fEFIQOrl7dMQJcahpInmxfjOJUUtT8vzKKb
	W05vbtPLVULxvxn4/1anr2YpbzRL2Q6bcEhr+7uLYXpLm+iPy2r/ZYNDu2tkC2ltvPwY5lavNbK
	Ik0YmxJwClOigNPn+k2lQnLB6frhz9JqQWvz5wj8VKaCy5vqJoOaBZlRJXtNChmX7HZmEB6JWxr
	vpqTI7crOw5UllUcKnbTG/GrZuoYMgcYr18PdTkA98WQU75ZtEA26VHsUrkgutNA4ZazxuH8EK7
	IrDxHshjbZxaeh49N7En772Ih3hhg66+xCi38/g==
X-Received: by 2002:a17:90b:4c8a:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b3d07d80admr2483888a91.44.1795005624070;
        Wed, 18 Nov 2026 04:40:24 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm4257980a91.10.2026.11.18.04.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:23 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v8 2/4] usb: gadget: f_tcm: zero the CBW buffer the status path sends
Date: Wed, 18 Nov 2026 21:40:03 +0900
Message-ID: <20261118124005.2428068-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
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

On a dummy_hcd gadget with a 512-byte bulk maxpacket, a rejected IN
command declaring 4096 bytes returns 4096 bytes to the host, of which 72
are non-zero and begin with the previous CBW's "USBC" signature.  The
part no CBW ever writes read back as zero there, both before and after
this patch, so what that buffer held beforehand was not observed; what
the test does show is that the host is handed a buffer it only ever
wrote 31 bytes of.

Hui Peng's multi-driver fix of 2026-09-19 zeroed this buffer too; the
reviewer asked for it to be split per driver and it was not applied.

Link: https://lore.kernel.org/all/20260919223521.3890508-1-benquike@gmail.com/
Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 12e2b20e33b921..f2e7a9ad77809a 100644
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

