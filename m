Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A014A0157
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612283; cv=none; b=jEUEfBRdyoadXTP0b8S2FnqKx8ebmBaeKlES1yrKswaun3cvZY3OI0NosGOtteDyW+5gVu5eFammGBhMqewVe+cEpjMSO/X5U7JpXNBKOjvrtJ+rRStKO9qxWkhFMNvrrpNuNNU5/iC1yGqddoGacZHRW/oa0LKBddNkBtrdWto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612283; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVHkC3BDCV9b1zlT8XCcJ+wMwMoV5Mh4Zcfoc7USwgdBB13IRNmwIKmBR2ynFOfUmCkc0Qr4sQELNKJsd6WzPizMNCuhcIbfMr95uLIy99NN9RUpcu5VBcg6ZD621Utdkmv90ZwjogEYyjz6bz4hqkzpkhVhy1YKtmxB98xj450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzBSFuhs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzBSFuhs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so20864785ad.2
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612280; x=1789217080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=jzBSFuhsbkrPCo505JQz3G+xdlugkLc+IBPvSy0XsIfFSJd/c8mRnEylKYpvF/ZV+K
         iQUQvk2s2tPlR5qay3SW81SyUF3LUWrPBD3BL+8kQzuMGyi+PCzUPb2ziwy44odAhWxJ
         KTAOHC2ufuge6vYiRCOS/R/oyBcXjCrVSqvelyemGLd9ZIkupmKYvwNzB5GYnZNZPujQ
         Hjn7VrXRaVdL0DKmXwRFpiet0mtZDoEHvKcaCOFkF1M4dpc5T65ijaEJtaFuAXazWNgX
         EnDpoQPToYSNlZENI5dBX7MQGfVkGX5FExIrLz0LfI9EpCnPlAHcMuO4m31CgfjJ6jSx
         hELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612280; x=1789217080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=GgoDrVZPQ4aLJTTR2u9RLodBPTRtjbCwfrouW2C8PDiTG3UqqOvBfog1xEXvThLfFS
         ZbTbzJ0/TIPv4ACmr1ufimtYENogGOzmJ3Ragf6yAYwQ1uuXx6biuJPnBNPeW7jGwdBk
         KjLufNqwlX6HZdFMcKLT16uHA9C2qejS+dwUdk7+zWa0zDlJ0qIQiAnX4GHjxrUvLFtb
         Bz3s+I4tbjnrqvOjphhbCWh9Zrsc3clTUpMMMPpk5J4gstyzcJhdGSjK4zw4aAb3moLi
         BdQ9iba5pX5LGyGuqTCGf3oOLLmK3ymxSa5QuU2J0Vwx7DEEdKPZVZZmdHHQu7wT+nSJ
         xuDQ==
X-Forwarded-Encrypted: i=1; AKwUvByYBOT6uDoCUd1yxDG8kbz/C1lqCkKvSWMCPFdbbBykHdMD7JIJdUU0UhKkaPyz6VlorWB/vxG0X9k=@vger.kernel.org
X-Gm-Message-State: AFuF++mIe/YFfK488WQM0VTeemBxl+pQhUTAa4JUvlv8RUqFBfLGMiP+
	yT3rJ2ahWj8zP8yIfJwseOYmXhMeALQjrD0wzz3zVJ+D5JYspngz0ybi
X-Gm-Gg: AYBFou2ouaoyEk+bZDsSQQZb4gg5lXpHAoZGA9a8TBAobCd+gM7pmo2hbnHu4zw66Mp
	5LZtxJe1jZARtl6wqcZ+6yQHQsS/WU2/VVHJF5+U0rn8/j3UUNq0MSNPodvUGT1McE32JamZSHm
	+9hvJubPWtYNCtgLXXyPiuaLZkg6NmjoXDhWJT4WBSunyuGL2aImlxm0Bcug7lEAS/CinYoBqZZ
	bsVuq39/2ycZqGG6wMJ3nemtBrajxY+eT7+1x/0wOQltgZgumm/qiqm/EsuFOLjvcgwUZ52IxS9
	xdu2Wpoxk/gBRlyPY+r+0oNhfm32dmz1MHJZUDIBylLTeUOXUZqT2d587LOJ5SfRANeXdEtqLLk
	4Qx6qSsbRp/Fci/1MxQsPwbGN5tdqS1o+r6b3RH2Me1Vcqq61T21dI+yCsFjYOeIc7tghogOhYB
	+7KlB2mUXhsh8gO+DY7Hf4j+RtQEjEYfQo7baTzl7A/WQ5rm61ZP1IIYWBUY2QZ+4qQAjdUYu0C
	Ga/0KkTx1NMefkEqrBRm5ucMEPSJs0W
X-Received: by 2002:a17:902:e805:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2db3b351c2emr5928535ad.5.1788612279984;
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v7 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:44:32 -0300
Message-ID: <20260905124434.6163-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

