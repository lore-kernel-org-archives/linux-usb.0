Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912037;
	b=mYnWReuC3jfufpci4AWtyygND2k3+nkGQZfh7dO1fQdfMDZkMQqPgOmH+vBGPpI8CMcP
	 0yP1oZ8u3H3/0AeL541MhgU+pLS1eic6JDEUYMgqYZQR8NSfOjXLs7o3GSAjz2yYjWGmQ
	 aJziT/PO0r+VP4ETVURyG9z6InqEI/QxCESwIwM5PJgUFAQENpOxQ5cTemTTnZUqoxbkO
	 j3L4weBJy6H5liW9HUP3sIkEGDeU5YmY+ZJTL0xh/+b/OSn93EwIi85OjinpsmJ5hXkTw
	 4+cI4WxnmjLZMF4UoeGC+RY72mFmAoiaIfJGlrjK3cj+Cectf2QOwsRiuIgybu91euw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3P4RqLHTtI+N7NRPxx7L4oSk93jGkzaKCLskeDcODf0=;
	b=aLFqo83ggkRvumHmm3837VO4mQm2Jfg2fAoU2tLddhvUNT3nMg445nbDFb4RvQrPMkxK
	 R+n+OiX4AbcWA/p6tKYe3zAAhYPR+zgAUhR64o6QHgJJ3o2VpKENm+HZdgb1mjXEBzRyC
	 wssxf5fqv+w2sEylb39GKdCUvCuzcI7JqWwcglGeqrhqyN6aoFfc52RvBcaHDiDnvhdTh
	 jZ9Z8morl63P3yyHg3CQr9sDKKh5QIKVJGbW64uTA6hkmHZXjHl2iuDhK/3jvklCeoRNL
	 0ftAuEIEMM720XWzA0N7Y4opPxtWE71p50mGnHyBMnSyAcpnmlGgKi0bWd9GTMf9ZVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHdTtPif;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A08606A328
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 20:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A08606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHdTtPif
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3037358a12.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 12:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912035; x=1794516835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3P4RqLHTtI+N7NRPxx7L4oSk93jGkzaKCLskeDcODf0=;
        b=qHdTtPifee92YBs+xGczv0eUkMFQNiElk3a24/TjhVIvKLVqcFt1ZGpKB1cbwOv80/
         29QCAbCOnuLECnzWrJuH5bPR6aETjOjycy2w8fkCJfb3UPgzpQxkY3MTyhhkQOHyMUqT
         CRMBKQdWCg15NsaAtunMKU7qWhPOXwnzhHH7pA+iNlWvEDOGBEOQblo5Sol0NX1SPF0X
         0Mn6KP6DfMXXQapDJdkAWde1eAbEDu4lNxg0UOip32wWW47reIGHHJCwQWmLWFjmD5QG
         5T4S6Cke37ugLxCBHY+ekNImr0bxPmu1AtBHiHHZv6JFg7OKIThcTDDiiXn25bWAeRXJ
         P8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912035; x=1794516835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3P4RqLHTtI+N7NRPxx7L4oSk93jGkzaKCLskeDcODf0=;
        b=m5YWiLb8s/v1g4ixMgxuqw/sPnZT/+2NCSrhT2YeXCMq8ET0LZfMzPZ3JEEM9CHXk8
         S6qgtlNNAuoSB+Gjm1eithpkmeQUoeum4/Y2NowSdNBYk7AcwSmw7Fbnp55T2BF4qVP1
         tm8VgCTwpQA/zas6Epxy4V6A6dRpXLghCWhBSTc0a0SdvFnvA1qXwFbpCZ8Z6vkvijzq
         pWkxMVc+mxNkeILPfzv0rQkYshpjtQJZR9PwktwQvGuMl4ozg+TxSProE+WugAV4BXv/
         6QJPduhn/jgJtFH3eFE2yC2gEjV4XcmmIv+/mW0TTDheENwML0NHybVyx5NW2DoWpgMw
         DX5g==
X-Forwarded-Encrypted: i=1; AKwUvBwab5cdiQOYPD5wfEYyE6XgpS37byc1pM1lJaXB6H4jh/7BRAcvWrKClim1swS09SOwuSuBVRtkGe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HExQ1vF36B4EMeeb2PW4ctHTDPov3wVa6i4jCb50bPOhJgcZt
	SDBki4ttdeHi3hb4RfNAhJJvWRuXU/YxffikbfVm4xMJGIiBKPunHkKD
X-Gm-Gg: AYBFou1dn0xMaeUsCb4fYkMGdd2WPcWvvpnaYH+nFzWDTXSfINeHx2Onjre3YFcF1Xg
	RSuI2pElgT07ENqC9HGwo1fpVHThkt9iOR5Qrt5aF5BvH7CwgXMAQhSH6bkmwQeDMLBrtjIIexP
	/Yix4OLsoFzw0N/3egih8RNY7vSKZX0ILC0uvyhUeXOvWaio0wETPKGsvxEjaXU7F35FUXMsfBS
	0XTPO0Ud4IB1hUdoEHHASabiBz3FJrggcBFMrJfwE+dHhDEbSBD+cjkoAeM4nd1g+f/4/lv2RPb
	9E6bON215xPvOrAODYiYgJDnRc9134YAvEfx8YoE1sqYNOsRRd61POED1fKqkEq6PXZnMOndSD8
	eJ1BH+raG1wN8pu1MF5zOZJrQiAvaqWIiQtaV0FPKdWu9oYPjRuuxR1vrbZ1ejGqbHQsdEFU3cw
	k5MirmnGuCJyNb8zyl9Rbwxuc509LmGR593Bj57usY+vHgdjpK7JndFof9ez0VY8Gkwdgqt6oJ/
	Pa9JaknfI61pMzZgkG18XOV3Uon28nE4i6GQfDGKjEdFzEfmX/OPLiqRqHogTivbiXOrcoxMj8N
	RGLoXRryfpClnUB2OAQawJtP9Pw8IhiuabzOQCH6zbMEYSdU2rWjw2ZwTjAKcGmeHy3QpULTUsu
	//XrotYsF8438s3wwyLCeC4UnWiNq5toAqhPg9Qfehv/YtjYyirMcShrwltAOeotppg4McFCZr+
	Xd7Hs4fHEVzvTI78m6Fjcxna/Cy+b9Klz4471u96S43WAux+JFQgSi2ILagFkN1u9K2sUCryqZm
	LhwFAk3nxss7ik=
X-Received: by 2002:a05:6402:449b:b0:6b5:e088:eb79 with SMTP id 4fb4d7f45d1cf-6b5e088edd8mr40510a12.14.1793912035306;
        Thu, 05 Nov 2026 12:53:55 -0800 (PST)
Received: from mb-HP-ZBook-Power-16-inch-G11-Mobile-Workstation-PC.dynamic.ziggo.nl (2001-1c00-1106-0900-938c-4ed8-a3bb-093f.cable.dynamic.v6.ziggo.nl. [2001:1c00:1106:900:938c:4ed8:a3bb:93f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b576406e13sm1234072a12.19.2026.11.05.12.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:53:54 -0800 (PST)
From: Mario Behn <mario.behn@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Mario Behn <mario.behn@gmail.com>
Subject: [PATCH] usb: chipidea: udc: give up when the endpoint halt bit is not taken
Date: Thu,  5 Nov 2026 21:53:42 +0100
Message-ID: <20261105205343.982465-1-mario.behn@gmail.com>
X-Mailer: git-send-email 2.53.0
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

hw_ep_set_halt() writes the stall bit of an endpoint and loops until it
reads back. On endpoint 0 the controller clears the stall bit itself when
a SETUP packet arrives, so when one arrives while the driver stalls the
endpoint the loop never ends. It runs in the UDC interrupt thread with the
controller lock held, and the SETUP packet it is waiting out can only be
consumed by that same thread.

Seen on a Zynq-7000 (an ADALM-PLUTO class board, PREEMPT_RT) during the
host RNDIS initialisation: the gadget stalls the GET_ENCAPSULATED_RESPONSE
poll that has no answer yet, the stall is refused, the interrupt thread
spins for a minute, RCU stalls and every other USB operation blocks on the
lock. With a bounded loop the condition shows on 1 to 3 percent of boots
and is harmless: the pending SETUP packet is handled next and the host
repeats its poll.

Retry for about a millisecond, then warn with the endpoint control and
setup status registers and return -EBUSY. The callers already report a
failed stall.

A loop timeout for the same hang was proposed in 2021 (usb: chipidea: add
loop timeout for hw_ep_set_halt(), Jeaho Hwang) and not applied.

Signed-off-by: Mario Behn <mario.behn@gmail.com>
---
 drivers/usb/chipidea/udc.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index d52f89489893..4f4e6d296de5 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -224,20 +224,28 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
  */
 static int hw_ep_set_halt(struct ci_hdrc *ci, int num, int dir, int value)
 {
+	enum ci_hw_regs reg = OP_ENDPTCTRL + num;
+	u32 mask_xs = (dir == TX) ? ENDPTCTRL_TXS : ENDPTCTRL_RXS;
+	u32 mask_xr = (dir == TX) ? ENDPTCTRL_TXR : ENDPTCTRL_RXR;
+	int retries = 1000;
+
 	if (value != 0 && value != 1)
 		return -EINVAL;
 
 	do {
-		enum ci_hw_regs reg = OP_ENDPTCTRL + num;
-		u32 mask_xs = (dir == TX) ? ENDPTCTRL_TXS : ENDPTCTRL_RXS;
-		u32 mask_xr = (dir == TX) ? ENDPTCTRL_TXR : ENDPTCTRL_RXR;
-
 		/* data toggle - reserved for EP0 but it's in ESS */
 		hw_write(ci, reg, mask_xs|mask_xr,
 			  value ? mask_xs : mask_xr);
-	} while (value != hw_ep_get_halt(ci, num, dir));
-
-	return 0;
+		if (value == hw_ep_get_halt(ci, num, dir))
+			return 0;
+		udelay(1);
+	} while (--retries);
+
+	dev_warn_ratelimited(ci->dev,
+			     "ep%d%s: halt=%d not taken, ENDPTCTRL 0x%08x ENDPTSETUPSTAT 0x%08x\n",
+			     num, dir == TX ? "in" : "out", value, hw_read(ci, reg, ~0),
+			     hw_read(ci, OP_ENDPTSETUPSTAT, ~0));
+	return -EBUSY;
 }
 
 /**
-- 
2.53.0

