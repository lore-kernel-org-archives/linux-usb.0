Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7579647FB0D
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108637; cv=none; b=cDZtT3zcN9Um+5YZBMhkcp6VS+HcjMK0rf5x4eZismh4Gf9bXvT/9OS7bcuV4GXzu7KvTgSFdhi+Bl67Ydun1yBd9UoLXUTpA2Sl1tIM5+Ud+EWWwoLM6Vu37FHDSS5qpnKNZIcEfuceBBhTQH72tA9L4s4cyGAEuruIC0U5If4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108637; c=relaxed/simple;
	bh=dKOgLjoQDXNhftfcH1BbDNU8KjD8R9UfFEPr4W0zOdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fePE2jsgdizVEtHR9LEcRFeSiK/iCGLarHitNAtWso1HDQjvtKRg11j4eymdIpoI3JG8/ntTUJVlx19i7QMr5X9ANYfAC396zJNVfe755pJVINLtyXH6+1QrfEeEsNRpL+niQDVujX78sjv/62l+QvdHnbQNGAwYVth3g3kWEG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aouCJ8yk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aouCJ8yk"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2568664a91.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 06:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108628; x=1786713428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfAP8cKuZR4B3rvqlJpAg0XbUtRyqZDyaASjiD5GIjI=;
        b=aouCJ8ykZ/pjfPyDbmqtlBIOTUIl4F+Kq4NpZe4l0EUoRof/ygI+2i6SQYSPnTy6C7
         hI7BP9fEEhf6rX4wyoo+fppUjKA0t1QMoH0lQiTn5kLRbEhGWszGYr9Fu6iTZlzDz1iz
         FRWytEQjX5Ru0NBB4/4UDNsf3zlKt4YOq+XS2bRFj2tHlDUE+H5kDfxlnDt786S7CqOp
         xhpgOeZDAvOpmVWRDLdWp3oEJ9LFSpw9TXN/vzeUaU8GlRlFSZcnHVjzOmRJtJPMSSNK
         Xpg4QuJ/x1zDJu/it6qSXz/bvDBWG455SZU3hOEFEcip8qE7AWX1G4zwRk5zXVWn1ozx
         +3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108628; x=1786713428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfAP8cKuZR4B3rvqlJpAg0XbUtRyqZDyaASjiD5GIjI=;
        b=sisIVPQOYMmog5tgBRgautpYzRkI0P4FcVQpstMYWV3/S2uYTWKzFzH9fBsQimGOi1
         P3W+UxnrMImEckmZOxG2+pI0PtH62AM0K9ivX7QRLujvTjkeYWTEkMeZZvY7w+ZRptuR
         gsrkEr+VZSGYyWZawhfxWu4Yq7SpkjyuknloJ7Bbrs3b8CdfEh3n8XYxwHpj5B8Sc4xT
         g25h0vSFlojBqzvMqYCEf1E0bwDQJWdhWbEH1k/dXrPWN4aoLtc6rzjBOWDi2X0RwHG7
         Q2e/qVEeUaqcYS6pvqno4FGNppZB5Z///INdft9AVha70XMif5TgpOxTd0z+mD/avWhq
         nyWQ==
X-Gm-Message-State: AOJu0YwoUv5PukGkZDNU5lNrAKf3HSeYfFePKXsQDWRv+yvsDEVD/BrV
	joch6Q303hoCC1Y78ky9TDLFQQbBQpn7zK5VlcbyPeK0HUR+yfXSxNsD
X-Gm-Gg: AR+sD13fWQNxkAuKvPreoQcHmH2dcYlG89/jYNsKh9MlTbU0nVjxZRCznDdKhEJ1Qes
	uOwDym7wcRMxd5wLp4RMmSA7y+p0E74E1sskZ6ijlxwj2XFuXmd/mUSCV5oXWYrlY4dF7lSXrrm
	jUMwUsRSgIOZ5AOKPSq+SleaqbCfa3FS7BThjZ/owD32mG3tto0A8m6lKdaZQQBQYiMZbGZ23ms
	KZhh5RK4+N7Z51v3K6brJSR+V6Meoa554kt7iaKNXd0mf0owGooC95jyt7CQhdMpL6BrnCh5TLc
	QZLL3O8US4aFKEpKj3vzXAGt3fUHaXvj4D2tI77WsINqE6b1sTgwmxqA9UYKTVUqXYuWIffTaZf
	eBkOtVPNQTICrVb/t7vteRRiwWPYwHcz3b+T9gOVt/Shrf5q2BhAd752UsucKLslSFdbQ/5HSky
	uMk0n/i+17Ht4b8diqcSyKFjDAe+QA7bmH3U5ed7YW7jFO1GBXXvTFkGD/2NZQF3VRXphdXWpwr
	GMTPz0SE2z5KiBZvCiI5yRG7xJu5T1XB2WE9zRIZeor+LG3P3VncVpRvARDhC426FA=
X-Received: by 2002:a17:90b:448b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-3909d8c3b9cmr7639183a91.13.1786108627692;
        Fri, 07 Aug 2026 06:17:07 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b33225e0sm1300528a91.4.2026.08.07.06.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:17:07 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 07 Aug 2026 21:17:00 +0800
Subject: [PATCH v2 2/2] phy: sunplus: fix ERR_PTR deref in
 update_disc_vol()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-sunplus-v2-2-d5379c664dfc@gmail.com>
References: <20260807-sunplus-v2-0-d5379c664dfc@gmail.com>
In-Reply-To: <20260807-sunplus-v2-0-d5379c664dfc@gmail.com>
To: Vincent Shih <vincent.sunplus@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786108621; l=1342;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=dKOgLjoQDXNhftfcH1BbDNU8KjD8R9UfFEPr4W0zOdM=;
 b=XBMnxzzMFA7SxO0AkVbnFqri4xCE1jOMRHEQdUYqX6RZqQU+oFWuyefKAeVSfc9S3M4rbY/nm
 wkUvtimBuQVBDj4COof942kze7rLaEyomEOFGHbiBNVszcYb4FlAZOZ
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

nvmem_cell_get() returns ERR_PTR on failure. For any error other
than -EPROBE_DEFER the code fell through and passed the invalid
pointer to nvmem_cell_read(), which dereferences it.

Skip the read and write the default disconnect voltage when the
lookup fails.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 842087bdfba5..eb834788ea2f 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -84,9 +84,10 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 	u32 val, set = OTP_DISC_LEVEL_DEFAULT;
 
 	cell = nvmem_cell_get(usbphy->dev, disc_name);
-	if (IS_ERR_OR_NULL(cell)) {
+	if (IS_ERR(cell)) {
 		if (PTR_ERR(cell) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
+		goto skip_nvmem_read;
 	}
 
 	otp_v = nvmem_cell_read(cell, &otp_l);
@@ -101,6 +102,7 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 		kfree(otp_v);
 	}
 
+skip_nvmem_read:
 	val = readl(usbphy->phy_regs + CONFIG7);
 	val = (val & ~J_DISC) | set;
 	writel(val, usbphy->phy_regs + CONFIG7);

-- 
2.43.0

