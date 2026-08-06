Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C93B19B7
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999192; cv=none; b=J7gruP6okwaBVhJ9/3EJoLftLSU5JMd+gy9BBmTSgEtQfCoVNtnDDEctM5G6c+QMB5YJMQnksy9/7dxwSgA4USmyKv6AA89FbXizAa0Tcod2Po3ApubC0YaT44QenTN2KOObvqB5tTejhQXLRlVqkRJ4PN2la3T721nJg/+aznc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999192; c=relaxed/simple;
	bh=jKzHN686d3QXF0JLp4kLIZ+bA4V44p4VT6AlQvKbjM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RKrQnzJbBn2tSBfA8SCST5G8uORjoXfJxnEKgOPSDScWxy3TwoDFy0BzVFh9o7oLruqD+Ucke02Cz1wAah/qTJN3benMx7oyTpbcrp2vtA+DY5wHSTUSeMLPdRZSidQGuVfno0eWYBty+r6Ed0s7Odg22l97bjD6/AXfaOxhb+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE6s1/ux; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE6s1/ux"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84830c774a0so1944326b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 23:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785999191; x=1786603991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=331DRkSFWDCKr7dCFic+xle6jZcQv2JhNVnEK+JljZE=;
        b=YE6s1/ux7oU2xSP6DYMt/Ri31p5ZAWozSLO2OGF3QYioyHCX/NdLpK9mMxWbNxA1WI
         otQibjNUFJX/QpBBdT9iDYYj0JB9l/OTMGP1JaxhHOF9k1YJgqBbRqSfbcX9BYAJ1Cua
         /o25MusPvK1p0vpH1Bngw5w5iT+2uZmCAvlel6zylCqwEH6wj0taLuk5LgLno5EsuLW2
         QuFwGONJvW0wBL4V+O3Lvw74R3Swe/qJCndduvbqVCt/DCXQCBTZDPIU3nAzZRWjTUOw
         FdpCiWQBp0mWMd/7HSBiuk4/ii4vt1bSaK2xolixml54jDcrE9wuqdYpZm7UOuI4U6rc
         2eMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999191; x=1786603991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331DRkSFWDCKr7dCFic+xle6jZcQv2JhNVnEK+JljZE=;
        b=sGjp2K0m2LKAS7bw9HMbKSnlZj7Gdam3bz64ejWJCih0iYyx6CwIlooDZFwXtlCfXe
         34o7cep0BN2qz/ZsSw3u3pAb6QBY/3UtP8n6RNgqvJMzz8IAJj4/WxJCmkcKmNL3ZH03
         VwtWgsXWYYT1goSuENEba1bB10gWlaBRUOupB/XxdIuPzo5L1xbdZSvQlBodwCYMzHGw
         c8EFTSIGKQYEDSMIn5CSjK4qc4yotMNQCGIo4Fode4JhLPLYELpUE63tA46zOux4JCVV
         TAQH+mExwb7lJ7IGrssZb/SrIevsdbZrYCaw8SXm3BrCBv5pJEIGWeZqw8UeAkNN9XmU
         o0Sw==
X-Forwarded-Encrypted: i=1; AHgh+RoM0zkciVFIxHbmsCIuiGQeH3IrUrf9GF7dEOPBPevcZyCfhmcR1Px+2BuRnXM6L9apPH6HARH7u0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf/UZcg6rVMNnRW6RCTemojlO0gEeM3VRtJklaSCqkh+Sp7nlb
	OLPg/5xOSiwkRYsEo3Di2ByItxIeeYdfSqrJwUu+rgORdtisPM/2r2xH
X-Gm-Gg: AR+sD11yYBFZKmCoorC50gVRKfF96qvHnl2qIddT+TJsQZFfb8/R1H6zMOvAqBRXixa
	IDNbnnvGqdLQcMbmH2VWh4H14Jg8DP9jWVGBSMWKW5E17lVdsKHwvh53ZVn9/WVO4mBf1VsxR6c
	U5zy781dvGoNPQZZjFIj2AC/S/AbFBopuG9AhyTY7TxLk7g0NDsYbKgPBPIvZY1+Z7y3U7Tgq29
	ps//I/PlcerUyitFpTHruVusYmurkOMgGTWNjBGZz+Z6m4PRlI4ihq+XHCRLBW9xq4dieg4hf1j
	r+cyQq2bjTCf0b4SAtiwj8r10I0duM3YEJC26iSb7151JSwEVgvXABlQxqbgsnb36HDZxQjvHgz
	92Irdg1kqB9GAYRPnuZDUT/HUD8H1M3knwUeh08Vfd5/nYc+ZMhGgLe5CpMUS9LHmwfDOoEN5PN
	i7hVIuINdFgyYxivOPI71v/9NZf/yx0/ZSaf4cTFN9JbquXNM7dwpIlykBLPKyLocCiIjKPxEsR
	UrqV5vF6p87cqgTB0Sc1H3G24gqZNcJZYCvpDmx8ygpY3rYXZT1l2ftvtOhg0D64Vw/lXwBNTOk
	XQXl
X-Received: by 2002:aa7:8884:0:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84f2e031490mr13109342b3a.6.1785999190781;
        Wed, 05 Aug 2026 23:53:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459ba2b9sm714920b3a.48.2026.08.05.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:53:09 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 13:52:54 +0700
Message-ID: <20260806065254.28204-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..f53d09e90010 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -525,6 +525,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->supports_runtime_pm = true;
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-- 
2.43.0

