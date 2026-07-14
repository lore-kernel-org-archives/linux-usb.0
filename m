Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5968373C12
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784028055; cv=none; b=Fi/SpppiQHFnbsDiHuwSiP5tNcdFoqutDb9oDUMTaKlTAZl6KPT9l5w8OnIFF1FtC5JjcDqWBshynftkCTio5I2DC6KXod5zWfc1QhO/rWAv/wZhSikbqjTZO0qxxgbMig8IAEirgxay75zub37UPtHN4swfk2d4qu9Bx52aEG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784028055; c=relaxed/simple;
	bh=5U8Xt+5FII5bnnfNrELICp5w/0y/KFXkF6lLjw5vPX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bfPrtVYwQsR1yLsHQ2PwF7/bgZKXiOvroNbE7j47mZq2FaIxNONi/yYrflszJHgkKgPdBBs6q5WubkhHTZUSutagH1FJ2bi1LHJl/do/CiUSRhwSYnnMpNgqMT7nyPFyYj/KlBwkpwU8NEpTRhAdiCdr+gtrJou2uzwoWskXHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJRhPpC/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJRhPpC/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so29694395e9.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 04:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784028052; x=1784632852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3OMzo2xKVZ4mg1KtmSh/Is84yo0PGktqHQ2pNf/fQs=;
        b=XJRhPpC/0ddcaI6JKuNFFsN4Zt6Q9T8FljCJrrPLQN8akSTmKTvq0m53Ivz65Vlid6
         hgrrYb6ojYGhsMcCnRxN2y39Iq6BFOD6lVHELzbLOd0xy+OEcj1soi/WKy540EvZAUR1
         bQeJHARnxFG7WLmwYEz4OuJE0TCeWrUEsyZ3lXnNt3t2OS9ivqXIwGdJfKKOjLZxBH6/
         X3GKQaqDkPk69C9dra28p0MpekWZGNYblZWpxEZaPMfTeogmVEeOPOA56hEFt4JvSyfM
         2tWg1NxfC0m652yHJU/J9Ilk6I7ToOdNkJi6Ql+L0RKdBgNbH/GRDc3iZMX24EpAWgr9
         hHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784028052; x=1784632852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3OMzo2xKVZ4mg1KtmSh/Is84yo0PGktqHQ2pNf/fQs=;
        b=Mnpu24U/YiqTpjs5qO03w10/h4mrqUl1VaUPpK7uXFrLUq4ohUNCvVT1S9o/CdcCzH
         GFaFE0BptjqipLHmD3Y2TfwmEQpMva60Cq8dR3PA5Yx9bRgbdfRy0Ob8eCAzo8ZDN9YP
         zJsxoE7DT80wORL3OwNCInFnyqDjzSjP/ak+ZBAsDsfm6+V5p24bqbBcPoAgy/mz3Io9
         1GpshbWcsveuC0n234OKfFHaKwpuzkU0dgRQoEuzaQ3ZFw6el+tbU71OwpAhN4kcIO48
         l5vFjE0xkq/M7Cy63MwKhfef6OmOWHBiAocYjP4dwd6expn4eH09s+pfq99itcSJbJup
         6kZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqW8+GAZcu7JC07yC48F6YPx91p24eGdWFw5R8kKgTIy4P1JgupfWWuYFWsooR1lpuqskva44tUsVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXfPT74UWdAejtjPNKHsHv9aK0heEbrZO34xwecU728SbRol7d
	5seyZUKLDbTddOBXPg0MgurZYOmAfkS4OMCrHHjjxx1izAAZiPQYQ83e
X-Gm-Gg: AfdE7cnu18c3MkaCKB38f3nBqADPn9WUhc6lUFlF/qegPuIqtfHMeHIbP1FV0dmNdbJ
	l/+t+lrCvZS779sJEbZv/7j5VZAIc3ujwJgIBWJsqPKBr4q/EagINB3HbfOR4y5/YgnModeJYce
	suDHB2fdP3sxzLFysKfeCJIqa3YTeGlFE82ttPZFpU9Dbq1ch09GZsmLbDrtvnH0kyOMDu6KFj7
	G2dtbo/Lw6xAAgCpL2JNGej6YicS1o44YkaikY7X6KGe6zSIbSZMxOS0cS+XNRszi469U9nhWPb
	zLiQqVLDIjEXFKNwj/ny4j69cJ9EE2iOjjPNtPqYKrVf3j9VMISGkgi/4VVa1izZdW2s9yXVmcH
	luwLtphVxOVcPMQBqvSBG2s0sQJI0MISZ/YX+6jXRAp7BWpykBgmENT6dufHycssWFo2VdJQpY7
	MrOTiBEItwv1cAr4IlNFIsJRwAsLnVBwvqqySkQU5ehVgUF++YAKbrVyRRbOvnk8C35/I1P9roH
	IG+
X-Received: by 2002:a05:600d:644d:20b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-49538992cfbmr15904745e9.5.1784028051709;
        Tue, 14 Jul 2026 04:20:51 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49508739c99sm65552465e9.9.2026.07.14.04.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:20:51 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: b-liu@ti.com,
	gregkh@linuxfoundation.org
Cc: conor@kernel.org,
	arnd@arndb.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daire.mcnamara@microchip.com,
	valentina.fernandezalanis@microchip.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	claudiu.beznea@microchip.com,
	jassisinghbrar@gmail.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	wsa@kernel.org,
	ben.dooks@codethink.co.uk,
	heinrich.schuchardt@canonical.com,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] usb: musb: remove dead select of USB_MUSB_DUAL_ROLE
Date: Tue, 14 Jul 2026 12:20:46 +0100
Message-ID: <20260714112047.2304856-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'select' does not work on config options in a 'choice', so currently it is
possible to enable USB_MUSB_POLARFIRE_SOC without USB_MUSB_DUAL_ROLE.

Remove the dead select, as it is unnecessary, from this conversation:
https://lore.kernel.org/all/20260712-parole-stoning-d7e66a0961a8@spud/

This dead select was found by kconfirm, a static analysis tool for Kconfig.

Suggested-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1: remove 'select' instead of changing to dependency  
Link: https://lore.kernel.org/all/20260711130349.592545-1-julianbraha@gmail.com/

 drivers/usb/musb/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index f56929267eaa..1b0d27d8e02f 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -116,7 +116,6 @@ config USB_MUSB_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC platforms"
 	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
 	depends on NOP_USB_XCEIV
-	select USB_MUSB_DUAL_ROLE
 	help
 	  Say Y here to enable support for USB on Microchip's PolarFire SoC.
 
-- 
2.54.0

