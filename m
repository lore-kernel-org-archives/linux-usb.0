Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D1F44D6BB
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085821; cv=none; b=qZk+t+ZA3oT7zTksCwescuA9txO8BnUF8b+kRgeDIqTEj8/kPp0Vlw2cQSaBBbEguANOUKuaARrJDN49dYqbHT+KobWAm1QwfvDPcrBRKSK2Ury9UddLy5szVFsX/oddvSpSCrian8+sk7aPgUngB+1NLTA6fdarXqaNhrKgujg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085821; c=relaxed/simple;
	bh=tx2vu6tRfNOWOpgF2CyJw75B/ayEkTsq8oTxALj8YAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u91PX7wyMlbd0Rbeiz5ybM/+wWuwqyfJGzka7dBu8yiBVOFJT+0w16oLJ17cRuurUEVLLzHF7ZrNJZPZcy+OVV/Lw1yzxQjndUq4PsRZNXgrNX+l/UVt3qhnX3+lA9QGu4Tkuh64Hak1la+Sh1L2kx9+XkIOtYtqZI1V4E3g6HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZw+05iw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZw+05iw"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caea3f742bso41858035ad.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 23:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786085820; x=1786690620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEsRntJMT9GLMPPJGd/kwW2aUYHVVekfdk/685HavFM=;
        b=dZw+05iwbkSxRfRPbdR808n5m9bfwySSXl6O2G51qwzxv0AMk3Tm+j5Lq4BEN5kzGF
         hRDd/BkQptYWBcPSKQvXZYBbmbIXLKaBajpQwtwRdKCHVJ5gaJGr998keCk6fNYxP4yX
         AWBeqAcUHTSwRAM0pFqzwCeleW62dqrEGz7Jy58ZvvPhyBU2I06HqGxpkFtD2geoqJWk
         UBVAeDLQvHSgF/T7xDWW4rxXocmdP2Yp7lYEIah9TR/8oiisSLbxuhv6cM3yeKbBidkp
         aSx2jSmmEsHY2a/lgsDNput5I6hFWrnAMwPDZiWZQCVgLX5rVJ3pbfpRyXLtrY6Pbbv+
         NyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085820; x=1786690620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEsRntJMT9GLMPPJGd/kwW2aUYHVVekfdk/685HavFM=;
        b=JqnUuylgPRRiKyflk/89XULXOcrGafNI6UpZ8YjZnR71Iz1bdwTIFgMZ4F0Kx1nOSY
         BawAZVDO0EM1BnZmfQjC9dAHReAV/KoSri7JgHMsn2Bw8FIvaSLRMIEYetj/Rbn8cmBp
         xLFn01fCEyBFpRrd/LH9Nr+ii4/56urt2A0LJwKJF0h3m653tJqke6tM1ouib+gdVWl5
         xkRLhKQpAmvNeVGqDR5So0n1NMtlJInSRJnZLOrCaMkisx3OlOQHJdKGB6ZwAQeBgop3
         5ADZrVk6faW4ct2FTowpSgdpCz3lMprzjKSj8F2T6aGFvM7nle9FjSIIjv1AihuVup/c
         /soA==
X-Forwarded-Encrypted: i=1; AHgh+RqxEb4yVvgU0HmrPETxum4k5C9A2XClE84jQAqGpIOjFZYvZbCNt3Ja5HsUlMZQNmr3O60Guen7fkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzanBD2UmnQ7k1/+eDugkpWK6FCfTniKUZOJ4sxzRGm4naxeilN
	Un0XQF8roWp6tyTI7Dy57gPSKdxsioKO/hXm4MnpE1IoLjlKktcZ65ibx7GzkA==
X-Gm-Gg: AR+sD13oRJGs46VvLwRaECqNg+aQ43etKZaoQ2nviMb4Kb0KmMqbk7IPxSqttNHupn2
	2lOBUrEgyN/A+Q2e1JFom5xjATaJx6f7KSl68idxZD4HDi/xk/h+SLyg0bn/xnMM3sJS9vqt38k
	8vt5ULOfMnh43acL+bw8USeTGHxSneZ93z6J/ggXjTApkCvVy4zCxeq+f3uM7oAvnjI4thV4wyi
	F4GCgVjCuZ3kij4Kk6VzT0Ad3FpTzNLvzMajvm9LCuqW9DAVCIc5fXD9eD+5d49vMczHh6qrvyI
	0UE+802mgyQm7/5MIp8N3nxNdcFpvjSjxr5DS7aBix8dk9gxVCjVswz2/QrPSK7gdmtw3AKMR9f
	0qst+xDi+EcfJN/+SHZSHjh07Tj4GhkQwe6LJ9cMdXM9/6zz06I4O/0UUSJp6hcvhJbwc8NXSEr
	3czPqUj0zvfxmKdzJ21h2/eRrvdBwbfUOs3IjPGqqNr6OnknE0UQLz89++VPjByUVOR57QLF8zV
	Vz7nM8PQIceK4hXP2hpeoTC6vYvR8NHNg2S+46WNMpcHLRqmetVACWN6vKyrbesI9RQIYHuTeYH
	j04UO25FLC6un/U=
X-Received: by 2002:a17:902:e84b:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d0ca76a3bamr221579765ad.12.1786085819613;
        Thu, 06 Aug 2026 23:56:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccb0b2dsm4420185ad.3.2026.08.06.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:56:59 -0700 (PDT)
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
Subject: [PATCH v2 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Fri,  7 Aug 2026 13:56:19 +0700
Message-ID: <20260807065619.30604-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807065619.30604-1-phucduc.bui@gmail.com>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
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

Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

 drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 7387c9903e80..ec2280ae82dc 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -532,7 +532,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
 			goto err_clk;
 		}
 
-- 
2.43.0

