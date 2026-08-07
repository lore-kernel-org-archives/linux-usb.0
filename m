Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E9F442372
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108634; cv=none; b=MwiA4vKbRL8r0KHmTQNY98ThajVK5TUp8Cw4WWLdq0kaZyUPRvSoLYKV9ZhXnzOrsmVNebgLBMwi+4JQfu2dppwu71zQzzxZPXl9PpHZL8snOlmgErFcyOv9XrIrCyAX+pwq10hrOF9MnsKNz2KrdfGuVtimL4GMRDgMLtWpnrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108634; c=relaxed/simple;
	bh=xPOjbbNpgv8zBNu5HQrbZZTFhpVmNKz9dXE/JT36uuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V5ziCRXaJKyqtSIadrWOuGgrAFG0nR1LbpsM0F/k1f9u2X1rlTc34wb0Qlxz9R3k8xHAO9TXW4izlRsMK9JwBgVlTfwODoQKY3VXtVj0lR3ATcbHD+Lr2D51L7PzMc0F0ApY3OFHlTsCjpJISZTPmiYVcgxm85+HENGuAcHwieo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXBKW5hd; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXBKW5hd"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1864760a91.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108625; x=1786713425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5DNBHQ8kwvALaaQk9FZvB6Fx6Gz1mPuyoHY596D1IA=;
        b=BXBKW5hd1H2y0QYW1jwAX10r9ckSRWoLPSRURgzQcDrZEuj4hjxIFVleauApu//ILR
         yGE1ip0unHLzXcD8902n7yH6RkZGhGaOyEgqlOPRm/6yZMdyh7LGDiG3l6QvpogM1ROr
         k8aG0MNWKnVv58MwCpwPcPQN4vqfO7AI3QTYyfGNs+dsxjLyHkplqYlYztmZMIHUr5y7
         u+ZrwJElEXb3ir8fpUuz7EsUUlOpws9f7IdPmrIVORPtsXzBKeHkDsO7K+VXSe39WSkI
         oxLOafdj74vIlX9wTSA+8wzEgveltyGZ6lWwmdR62yK1It+m/O8MJDkqx3fxcXMqV+QB
         Oi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108625; x=1786713425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5DNBHQ8kwvALaaQk9FZvB6Fx6Gz1mPuyoHY596D1IA=;
        b=WcNnlfcUwh04phzM3yyxGzsZh6ULzaRPGDyJXhW+PZaz72u5W8VIe+vPcndGdOJc52
         4B7lGx2ZCW7Mf7Wf4eqCwF8NjZ2YX5SS2lTNggd+SP6+8lGZOIAH3JplFY8fRHei4w9y
         MR3Kdx72Uf7nS7g4UON/SIvtaSQXksuGZIu0DBk3H613Pg7ydVcYNVnAAZ8o+MQh4Km8
         INe2OXtQBPiXgGhhK3XL/7UILXl2XXqCnlExbFMsiAVFlI1rSvaMt7XUZn93R1n0sv9i
         rV5t7C0y2DU7TLqFnuN4evHZAiO2wuUwmZd7QrlMNEoYv6iId4Qft8+KmdGdbymejrQl
         R0vQ==
X-Gm-Message-State: AOJu0YwKYXFL6t0294D7x8Z13Ao9HRTiN9oi4KCAvR51IBQTC5yKqZpu
	vxoWukeA7FcPkuWw8sJeRVD0f9MrEiCSsD3FBN6A7n1FOwLIfdtGpb/z
X-Gm-Gg: AR+sD13Yx5K4pyW/uz7/LgSHLLOgfDdGUcICJ7lUne6HKcCOMaA4M7vyAPq5ncGQHhw
	RmzXUlKFgxSRDnx5eXaywDek8UCMh14aOuFwhcGVXWlmkhG805Ne3ZTX34KnESaXtjHND3FWkM1
	QOnfdbZ3pX8blywd5k5ZdU+CXQfgmUX/qc0kdESDzu6rVYfonrFfMxAoOYVuwjHkcuPKjGJq78i
	NVROExeA8Uy1NnJ6r2NgD3ICv1GmEZLBw6HjQcFiY/mcvtnCIGLy9BUX6nlDL9ArmeKeVRee4eS
	gvK6/QWu7DUKO/QL7S4uOhuOAivvqfmP8Gl15K+CtEvOG1d9ru3gtIVnlzafC9eyZHVY3maN0m/
	pGcsq0rZZVIAMdHGgXTOJQIyD6S66huQLOqdS6RTzklrcIHP1hWx9NVdK3j7MnZOCupzV6mtg0A
	5Vve4YjbKstNy9K+w8mCX7BmvnomkDjV9XkS1kt9q8zbLaNSxfAUUJ6217SaZYQu6ny8Exy+tih
	CPxUOKGbAU8j0szTWSxi6VBX75A/Ojc+PTWHihQSbfroDmLQgoERcS8
X-Received: by 2002:a17:90b:3ec3:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-390897b18cbmr1926165a91.11.1786108625368;
        Fri, 07 Aug 2026 06:17:05 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b33225e0sm1300528a91.4.2026.08.07.06.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:17:05 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 07 Aug 2026 21:16:59 +0800
Subject: [PATCH v2 1/2] phy: sunplus: fix memory leak in update_disc_vol()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-sunplus-v2-1-d5379c664dfc@gmail.com>
References: <20260807-sunplus-v2-0-d5379c664dfc@gmail.com>
In-Reply-To: <20260807-sunplus-v2-0-d5379c664dfc@gmail.com>
To: Vincent Shih <vincent.sunplus@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786108621; l=1371;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=xPOjbbNpgv8zBNu5HQrbZZTFhpVmNKz9dXE/JT36uuQ=;
 b=JTW1v+NrEfG3ageF7YydDhzejNQjsmSQNOjuS9Rl9sKfpRSZRI8b0wJEZGfP37nq1LPK5ARM9
 aoTNAAX+FkvC2CM/DiiP5GLGGoaQ75sakF1XkYrhKmXJf6IifiqgIvK
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

nvmem_cell_read() returns a kmalloc'd buffer that update_disc_vol()
never freed. Free it after extracting the disconnect-voltage value.

Fixes: 99d9ccd97385 ("phy: usb: Add USB2.0 phy driver for Sunplus SP7021")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/phy/sunplus/phy-sunplus-usb2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/sunplus/phy-sunplus-usb2.c b/drivers/phy/sunplus/phy-sunplus-usb2.c
index 637a5fbae6d9..842087bdfba5 100644
--- a/drivers/phy/sunplus/phy-sunplus-usb2.c
+++ b/drivers/phy/sunplus/phy-sunplus-usb2.c
@@ -81,7 +81,7 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 	char *disc_name = "disc_vol";
 	ssize_t otp_l = 0;
 	char *otp_v;
-	u32 val, set;
+	u32 val, set = OTP_DISC_LEVEL_DEFAULT;
 
 	cell = nvmem_cell_get(usbphy->dev, disc_name);
 	if (IS_ERR_OR_NULL(cell)) {
@@ -96,11 +96,11 @@ static int update_disc_vol(struct sp_usbphy *usbphy)
 		set = *(otp_v + 1);
 		set = (set << (sizeof(char) * 8)) | *otp_v;
 		set = (set >> usbphy->disc_vol_addr_off) & J_DISC;
+		if (set == 0)
+			set = OTP_DISC_LEVEL_DEFAULT;
+		kfree(otp_v);
 	}
 
-	if (IS_ERR(otp_v) || set == 0)
-		set = OTP_DISC_LEVEL_DEFAULT;
-
 	val = readl(usbphy->phy_regs + CONFIG7);
 	val = (val & ~J_DISC) | set;
 	writel(val, usbphy->phy_regs + CONFIG7);

-- 
2.43.0

