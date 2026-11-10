Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311049;
	b=PyrKrzxYvj+B/3qnUTOWEwnb4PkCiQ+VgG8bFGnKxerbxOmgfnhaIAG9u8fN+ghLL5F3
	 t16oE/W9ZOxRA1vcQg0/nV+W4NJfKrT+RGGMpqojRZh3lfiNACD3uqXasgJ1s3aucYm0B
	 uxUH4iIngtL2ucSkBEKaScowIrcRo0EwbsFjSWeWuDby2D4vV5g0VitAMRWu0xkXYLrOb
	 9DfJFT3cIf6qlEP0+4NkdFzMk4aM1z0vyy8DB3S2fcfWh6/Otx5IP0OFa3OEKTQdemMtw
	 SKzzThiNNYIGgTvnufkd+6/28EDx9nVlHny4TjeWh95dIbtCkVMAnSCBDLf5ZqVd5vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sTrsrtp/N3MsoFW0Udr/uhsvW3buCcp/9OPmY8EXS9s=;
	b=jenkAQpWy0EesryYZE4NRzzo0YXvp5LLdhIfuQKIJ4fs3+DEzXZocIvY+nnGsS+onrbz
	 Cvhdo4CwclvxSCV5tXcSSeUOoFgwa4+rs0E59oZh5Ugqu41tVVWrGROyiQH/I4S2xUmgP
	 hLQpN63cJySebU5JXhOQe0WleM55KnUHsDc0dbV4BYFTqKfdhlSfBYzl1DymZAjl4rvwG
	 kpBq5zRZyzCme5XrIzfsSMH7JBhMYcPhym4SwoWwrD5ufOARl8ElqwwUko7CgxE7GHt2y
	 HFyXaJgM9h+M+yxKY6dr0KGHRxdzImcq/vT5Qu5dAUnruaMHTYyLP7x4fHEI8M5Fk8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O6HMWVBV;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B26606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B26606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O6HMWVBV
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so3130584c88.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311048; x=1794915848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sTrsrtp/N3MsoFW0Udr/uhsvW3buCcp/9OPmY8EXS9s=;
        b=O6HMWVBVln5XP80c2bMEK8+zD7RjvqUj8izRi31qCuDgXZ4dYDMjCL+gRh4os4IzmA
         1nuQGss7B7ZgejBA+qzsIHKjGh3cxcTB8YsHbxCAIlBIoqIt2Wevjo2asv0YjOZqt+w8
         EcKbYVGSvRzodNPjM7fVMqfBsMwVx08e+XX1vYee1/0joE9wbdyvnyC4IPBK7ngcY2tN
         LkxmqpQZvLKJntF6zADGKa8xXba7omnUSlsdABiro03BZVe96JK5NPFwV6c0QN/yfl1r
         LpA9286AFWzQkEoK1qBW8jt0CwB5G5PVttu/ree8u/aXOU/odXxkkMfF+UFKnBM+2HYA
         KJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311048; x=1794915848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTrsrtp/N3MsoFW0Udr/uhsvW3buCcp/9OPmY8EXS9s=;
        b=0/RYL8vf7ovo315DHKWGVq02gbQBmUenhqHzTnoJNL89WSmV85uvOAo9RnzMVBNo1t
         7CaiB7fECB2FqmALS1IvnFHuiut9+o3m7+F4BLfpTBbXtbet//SYM/PIQDzcHw3R6oLI
         iIkxzanKUV9ZWlSnr/iMYzpOS9WxJmf5ubZIRj//WqEGR/czJdEUFdS9zGT3KQR2g6Ah
         FhWt+Sh/nbMAVOlxF2QOq4ix+qKCoxnYbRQH3JeLe6nRIhDcUt6Vk9gTSbhQLB0+MUW6
         cWGYNDTeNzDxfmDUVnnp7Y65DopiHXhNvMBlIXImDUR/xcQElzTfEy1mPam83NTCuofy
         ZukQ==
X-Forwarded-Encrypted: i=1; AL+hErFdjUr2MNXuNyFPL3uas8DbXdjb9yeg7tuL4KWESTJfI1ZgbfG8UySG6/DURnU2bb+feO8nlf0tC0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4FBBID6/3JaCmV1uD3wGdOkg13qGoMnrN1U6l11omGSyXBghn
	cPcfxQ8PD/xK6yfdnpm+C2X+bIpUSsB6tyqovQLbqvk/2J59omOFhOC1
X-Gm-Gg: AYBFou3m+L8l4QwgOfTrbyl/7pcJW8f7HCZB/S33gLlB2S2pqiGM+NQvts810iF8OS7
	Ub9WlqcgZDExnWgRkayY4WfJl6WiU4WKK/iyWFoOyKCIrJJj1mn+hO3lGjTPxILPER0NKAHtCBc
	WxAqes4bketaI+TWEITUhonNJ910ZcFSLPhIldTyKxRPv4eangisZhsS6q8Vf7t3DpjHm+Wfo78
	mWpoAbO/pjK1WFp/yC3hPZ8cYWekZkGp/E9Kfx9jLH0rmgj+oM33mipLxpoywJT0AN2LpEIL3om
	OriFTS9UNC/3AdAD8P4jUh/O/2n69KabXB7WwOMP2L6ClmsfhAzoEzD1ty+3tN8Z2iNNbcrvp1r
	tgEwdEsR5P9Ad4xY76Gdsv0vdX/RcUoGyYxxzfycEFMbsnW9J3SpvTVl/CeDtd+fC75bbtlzGEt
	Du2pSBmqSHruX7TaYt4OGzknKcpydCEBxz+czmBT3QRcZX1JU3DFtUvUKPB8cmSG6YJb9/lmkRD
	zPaTy5KFRG8tXA6W9/Z92asrH4ObcblCLCa395o5KZANHYinkyp4e2ZThxEGlgwceZnqg7YvLki
	128gMLonPzXxNxg4NRacvwHJapOimVocyguUG7qvfUDTdFDv
X-Received: by 2002:a05:7022:3a86:b0:1b3:a881:4d9f with SMTP id a92af1059eb24-1b3b60249b4mr3330257c88.20.1794311046423;
        Tue, 10 Nov 2026 03:44:06 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b1003fsm6648791c88.6.2026.11.10.03.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:44:05 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] usb: gadget: lpc32xx_udc: drain the pullup work on removal
Date: Tue, 10 Nov 2026 20:43:51 +0900
Message-ID: <20261110114351.2524921-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

isp1301_pullup_enable() schedules udc->pullup_job to perform the slow
isp1301 i2c pull-up access from process context. The work handler
(pullup_work) dereferences udc and touches the isp1301 i2c client.

udc is allocated with devm_kmemdup(), so devres frees it after
lpc32xx_udc_remove() returns. remove() calls pullup(udc, 0) -- which can
schedule pullup_job -- and also puts the isp1301 i2c client, but it never
drains the work. A pullup_job still pending can then run after udc has
been freed (and the isp1301 client put), dereferencing freed memory -- a
use-after-free.

Cancel pullup_job in lpc32xx_udc_remove(), after the final pullup(udc, 0)
and before the udc and its isp1301 client are released.

Found by static analysis; not runtime-reproduced (needs LPC32xx USB
gadget hardware with the isp1301 transceiver).

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 94355d3..210fa1f 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3186,6 +3186,13 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 	udc_clk_set(udc, 1);
 	udc_disable(udc);
 	pullup(udc, 0);

+	/*
+	 * pullup() schedules pullup_job to do the slow isp1301 i2c access; the
+	 * work dereferences udc, so drain it before the devm-allocated udc (and
+	 * the isp1301 i2c client it uses) are released.
+	 */
+	cancel_work_sync(&udc->pullup_job);
+
 	device_init_wakeup(&pdev->dev, 0);
 	remove_debug_file(udc);

--
2.43.0
