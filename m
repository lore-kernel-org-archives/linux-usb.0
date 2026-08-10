Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7863AFCF3
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 09:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354308; cv=none; b=CES4Ao4+sfI99HpIEh6n+lGIUCsvRy4qNrmNm8+BjUuLweNLIijzAloj2sh3I6orCRhjM4Qobfdsk6VbJC9JZFiNNL8+KUlwsYYjgL3N8kCYDAyhWU8xWwHUJKbdJrX6t2JrGpMvaWvnQfXZZqyHpBS3/BImyepmya+htwKumVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354308; c=relaxed/simple;
	bh=2M2xeAgdsVXI/pfTvlb2yIeWwS0e9oCjUL8hkbV4lvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EI/O5B/MrIL2TNepDPGu6faqn6vhF55ctkDtHLuwJRHvqpk+3EckJ2gSPv0S2IH32Ny2wD8l0qwtG4FqJGzdHNm5p4AxAPGR49ZArtnuMQl7AA8VyaJuoETT4o1rTA+1ySm+o2M0f0/Wq3FlcPn8h21CRh/AVZ2x/yX1lgh54mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxzzOma8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxzzOma8"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84874b52eabso2105929b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 02:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786354306; x=1786959106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgq4ngVWmvwH/7fZSBUdZHTs+zKxzmXCAvxr+GPkjcI=;
        b=MxzzOma8iIMiccF03ORdokrS0HqdSLg2ketlyV+zsgBQMiYYCECMMyocd+S3uSW0pG
         fgIVFHn03CJcceVFI4t8gnvU2+Jy8PLztaGwDyZzSOXeHofJcoNDfopLdmcJtw+NImQJ
         DzOXap5jRA5UlHZNY89hZ/XZIBBpMZSMqoi9q9zxb+q/7UM1jmr5rp77MgmnEV3Sfv4P
         qlJ9zXQgg8W3mc9bjziFlSb+eTZjzNjv/wElnkDD7Cd0kf6MfB5VDnzlheWpmR5vaJNH
         A1PRsAxBw/UukY+Oufb0lgJtvGPeYSpHdhVnuOpFmaHyoCCnyeI/GP7kaPW1kfDrTUfa
         XAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354306; x=1786959106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cgq4ngVWmvwH/7fZSBUdZHTs+zKxzmXCAvxr+GPkjcI=;
        b=JWAM8aTD3Jq0TgEGLRui2tUdyjtFDbvFXNT/1yVY4R4UofXaTMCmLVyv7n4855l9jf
         viMvHy6TnJ+qb8lhC/tXX0C2UQOs/uakSJlENFzcP3wf9cqqSLgY+hEtUoHJ5kb27Ilq
         wBAeI9CYnxVGQ3jHZBGO7eS5dcGj6WYKdoLsEXYL8anSRqGjgzEKHkKVdcWpPACqj8Iu
         2XZKDEYQpYOqlmxCmYxdANe5pQVO/JGC6xuLZXdi+XPiRfeAKQAGAi4QGImU4t69eRTP
         yhdDDOcAzcVt7PaHZxbJprSGGnkOC105wOScCk/ZIBAd53qyWZRjmxf+fipsHdzsaSNN
         845Q==
X-Forwarded-Encrypted: i=1; AHgh+RpLrgfiIOiTSwsYi6oRefizW+zpQcUzDHejcSQXr5wjLwTeBBJBjUBBfRftiFafDhmlflKafIZM1uE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQIe/atssFcMHW8gZESqYIIMoAHe9ywjpmtBpGIiCEGHTohixY
	rh9SmUdVkONVbmM56IdA9x8T9Muqy/YJVW9QwARea1pBG4B/EZSZOQMV
X-Gm-Gg: AR+sD13ky+/ZdfFifs+vO5BXcWHKePVZavnmTCnAo5lioTMtVh+y/WgsXLdN9iXW5Mx
	+LfpzOMIj+C71VeUTzx7N+3+LLe9BS3a4Q6KdpuiWjZz++Od+ZZnWKqvWMGyXjIkjp0u3hGTyL8
	e2ubTSpEziTAtMuHXj4dUv7KH/8faRaURRcn3N3ciNRBvCi8RC8WAo75ZPVb3k4UWwNCviWn5Z3
	605NQ/JjTHOKAGHKrD0HNOSdM8aafH91cab5rqCE7zG8Fs/s/7EUlj8+2CmJ1VgQoft241rY5Hi
	6/JFU1NEWgV0jCF2rA6/7kbvmtmHp9pzBIDLMQ62t09sRtiQpTd2DhsT5uEfWKfFP9oeal4u2Yy
	a4ESJ/54ARECRlaEpJn9/MrdfOp52UGBuVA1vTeaE+5DL/L5/BTz4DuREjcBG6WAmPtOmhTRmcU
	+Xksx4wgoSe0K1gX3m2KDH0m0n/dFMMe87Zqy4v35hR70aOaOF4cH63ycBofXlPlby1PdjXiN0q
	o/GQ3FGbfmZQfZviT5xy+TbxmDKrqxsqYBBPGSlktnucTTkWWLNA54aoMY9OMpKN4/7QtgaiqLO
	8nYR
X-Received: by 2002:a05:6a00:3c81:b0:848:50a5:a70b with SMTP id d2e1a72fcca58-84f5e068579mr22565587b3a.21.1786354306343;
        Mon, 10 Aug 2026 02:31:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3fe7d6sm3592046b3a.26.2026.08.10.02.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:31:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Mon, 10 Aug 2026 16:31:12 +0700
Message-ID: <20260810093112.47807-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810093112.47807-1-phucduc.bui@gmail.com>
References: <20260810093112.47807-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
was logged with dev_err_probe(), but its return value was ignored and
probe could continue with a successful return value.

Store the error returned by dev_err_probe() in ret and jump to the error
path to propagate the failure.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2: 
https://lore.kernel.org/all/20260807065619.30604-2-phucduc.bui@gmail.com/
Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by 
   Sashiko's review. 
 - Add Peter Chen's Acked-by tag.
 - Add Frank Li's Reviewed-by tag.

 drivers/usb/chipidea/ci_hdrc_imx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 9e529398c607..edbf9df9b8f2 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -532,8 +532,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
-			goto err_clk;
+			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+			goto phy_shutdown;
 		}
 
 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
@@ -541,7 +541,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 						IRQF_ONESHOT | IRQF_NO_AUTOEN,
 						irq_name, data);
 		if (ret)
-			goto err_clk;
+			goto phy_shutdown;
 	}
 
 	ret = imx_usbmisc_init(data->usbmisc_data);
-- 
2.43.0

