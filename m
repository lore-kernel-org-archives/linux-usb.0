Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53C43DE452
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 06:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785998392; cv=none; b=ouoqvdmy7VCIVQ8PrPJSjmYJCYn62nCQAYlj6ODcb5lLTaT7+fi8SilIkTAKamZTx3VuL+uKq2l6NFdouGbSmV9vctTjHCPx58OP0ZPklOScHCAuNUYnBOjGTOaY+0GcI2itl9FdpF9OeeKWXSsT3z+jtH/3v8f4o1Nou0AmAzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785998392; c=relaxed/simple;
	bh=QTj5s8syfOr8zEiUjYG+W9zKmue9E5IoJGDTfWHVDSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Za54Q+TeiH/o/yV+8IzUZWO2ZYxTrPntjZq9YEP+4yK3bZKjsKlsjwnAxU/4xA1sqL/T+M5kHz4aAOzj5+yPTepvxiLlFzcUfejW6UuQqaFZSZkufvMptBzKQC4i34ZBHlqBS3J++fE2tKPteiOu1466UvpmrLhBnIfUytAgsD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/HsTnAE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/HsTnAE"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so455331a91.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785998390; x=1786603190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JgssGURzd2pW4+70djq6KMjSjssKWvjAqwyJJjHL/Y=;
        b=G/HsTnAEYNarg5T1KM04scV3AlZ5fdTn8t/UlyHMMi5QI5rch+E6NwuAAK/JgfgMdi
         c9b/oa/+rqGGh5PUGlbpJUA5klvXlbuiHAsgkhDS9FE/erWH0yWAqMBCo1JrPA63Bdzs
         sPHrJkCGKA1WpKk4oBD+lNZtP0lA6846zcI298dfJPrzSxBx93zebp3OL0YvYYMdmWGv
         14oB/5EcRmDubteJPdd7w6aHpu4kVbnduIEQ7qMtT9Dsz5YngEstji46aiWxX28Ea4X8
         IizZFzWQ7BcHpT44pnvBGOOONKGLArBuwqNu9M/mNXbzaqW1BLpycfF8dXUy96ZcGMoC
         PZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785998390; x=1786603190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JgssGURzd2pW4+70djq6KMjSjssKWvjAqwyJJjHL/Y=;
        b=Sc5V5vhzOaly5U1UNyvUe2ipCJ+9ooDZPcJ22DktifTZ+tdWGDTPAxVW0yT5vJhN1b
         94L78XtBUTzIziVT0BPqtpIWRSQVMA+H4s6rFjMMSDuLpGoTKX/S8l3WNaV/XFZAISYE
         C3KgbEEep/xQkQb93bz/wIjYI1T9C1kmJOa4GY6zhwX+qpfaLTs9jAe8LTELYpfrZkrz
         5WSP2zkvp9h3+9BFjr8mOBbqr/9BMj48kuTGYmvX3KoQAlD5qFt/9OfCanISWnjbmoZN
         w6J+GxdSOcA/BtW+/vMyq0pN136koxss4sQ95XV05OQwmoxRcdWKH638IhfNlrTE3Vxf
         udKg==
X-Forwarded-Encrypted: i=1; AHgh+RrkCRoojquXJFuL0g71hJY+4jZ4zHgyQIYKr6eXohung2jI/zx8FBZs78SvVJBq0E0rQ7MABEAbxKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxLK0/chH7FSkbCGMMq+ropsfMP66K+5cxRpN8LMyNsx7fplT
	L9NBxxF55MSaWg2fwLsd7D34PNXtduRnvnMGHJzBcyBsAdGm9RUP9xeo44MMmA==
X-Gm-Gg: AR+sD103EKaX2T1ju6T3kMtwGpHfPqlf1YejbGdIofVkFZ8YFaBmuXsgiRyaPiv9eT6
	WNZHt5bOw5RgVfrkxEGH6rQCGirX0iibbYaEWG8WCiAwLOZ8kCOGjODHPJCyXYYEV3+QQMKDO/X
	0H0X1HbKkeZuRVz6K5mlaE4H+0VBYQBc1OPkTWYYs5Ce/YcQn0hGQkN6aybWYXhjQmvnHlr3PV4
	YqnPFpPCITJLyJWdtL4XFFL0+5cr+s/dmwMwh2NJ98VCCDzbhQ87LlpL/pQbIM2Ira637dl47By
	5kCSnaJARrH21tyKJeW+OP6J57OhfxEQUNloR/eD3MAXQqQ95re+YXTjw9rz7XxBdXnmpoQpQ3w
	AHPOCDChsthhsiOynrgsHileXNbi7xf2vQnOQpAnS5+nRJ5GaAfncX6k3feTh4Qh4JJ2BrJggIS
	Yxq0l9A+8ou4i0oUVbC7hTYnKYTGHBnAvzMKvKEzBA5cRSqrNvuSxVxB90s8JYSGc/z8tw0OZom
	us1vJc5CEfmuRF7vV24jddYinJWqH8puz5+hR6FlmHorhCjFAF3++V6qPdYNOq5AnmzxsPjFAuR
	mRQo
X-Received: by 2002:a17:90b:4ccc:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-3908982a10emr1041143a91.19.1785998390140;
        Wed, 05 Aug 2026 23:39:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085ddd4b8sm875983a91.6.2026.08.05.23.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:39:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] usb: xhci: tegra: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 13:39:33 +0700
Message-ID: <20260806063933.27331-1-phucduc.bui@gmail.com>
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
 drivers/usb/host/xhci-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index e7e6d569f1db..cb946eb7a65d 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1571,6 +1571,8 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
 		struct irq_data *data;
 
 		tegra->wake_irqs[i] = platform_get_irq_optional(pdev, i + WAKE_IRQ_START_INDEX);
+		if (tegra->wake_irqs[i] == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		if (tegra->wake_irqs[i] < 0)
 			break;
 
-- 
2.43.0

