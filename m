Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C302DF6E9
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 13:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783775036; cv=none; b=jRUTAPvXHGJruOJYudXJ4AO/p7VO6icx+GezV2sP+yyGZ3jaYsXgElOvpSqaaY8JvNUlRlbgDrvkfGhLkgzd+HwW0UTjOXO1JdSEwh4h2dOIRCDUvfyhXsRyHdXDzwz6maRSJ3KDpE2iQtqF5nVhc3FVaVvGnDTIXqTUxnzvQUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783775036; c=relaxed/simple;
	bh=OLzgpu1tZ9PtLVYftNagb8/uH/C3WWzEvjLtfdmx5iE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YazW0A3UNBsmFjajoVy1/is5t86NYeBKpIqsC/PngAqwltOlyX0HFvS9O4RYh5QqOptYe78S4l65JkM1QuAIRixst3JI6uIFr5vHixeT1Nuo8AGlIUA++238dZL291C4vLRrMmoIryJCsuDhwRW4yEDfsJ4k2yuHWJVXeNjDguU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHdpR0sG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHdpR0sG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so6696015e9.2
        for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 06:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783775033; x=1784379833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l1tQiLCOsNZmwMbEn9d8godlFevlQ5fjRrw82uOwbdQ=;
        b=jHdpR0sG365ss98GVkA768/G+xiC68j8p0G3aSQB3UPIxg4wypbIdC5JjCf4R2vbtb
         pA2C1nHTFGBmj2GBlyYYqGWyLXNl6D//HvpHlqniIY8IyQgsfhZTSUVMEwQsQiAK/UV0
         5hfvaYNQBowLfKO4YYRvnSnuQ+oEmT27l7nly0A5Ul9aB6YaiBGIqpPTU1IR5uCzUTPW
         O2R2vIhBt89B3JPAMdVTZxbbRO16ZXKqdZ9MDPjIMl7Yva7pUioJNIKcgfDpvsY7Plo0
         qAJaTkhq6vapInENyRqxId/2+NQaEZ4dM6QdIKUJlMIhUl58bJe8jlY4wPAoqbG2bhHH
         8+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783775033; x=1784379833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1tQiLCOsNZmwMbEn9d8godlFevlQ5fjRrw82uOwbdQ=;
        b=Wlkbx7sPcuY2DH4mMfA8yFnBqTgRgD9A/H5TPk5zmyxFJNls2VTI/jLdEamYGHvdZc
         +sFSpeVJs/FAlu9iajJeAQLHgH97W+xIABKWKDK1hLx/5Hqd8ISC6aRJ3GO6B2ch4cxp
         9nC+ZuTuG9WhH+NgmDG2EMlCn8WiPWDuiHItDwehY4DT8MuPNftZzjGOGiCdVAsdKavk
         LeQay3s4N2N6LtvuJNbnbi+AVhBxF7DqY7jGpprezzpppN35a08ixZBrd5QY81huIyHN
         b1dczeIsQZwtGv+qtUcX6Yj5h1M9wOgS4ZXY35cUOoeLqMLpnbua+1gy95uMncx8nzG/
         qV7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFQb9Btx3NAleVbd7E0H62ZJUU0uiFs8pkRJslOCb7FrYN28O87ZQgeYC6YgJFj27aGrShJrj15Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnDTMUZZtCJLTtSEQOQfveWULOaXZsjM5HtB8pPtPI57kurcvN
	Sw101OIPq616WQfi3wryvd8/T78xWAhvW9SHaCdiecLy66m7KW72CiJb
X-Gm-Gg: AfdE7cm2O0n8sPnhXuQoFeid9wy0DwNR3IrkW8Gf8PT/Jqumb1R09by+uYRBrdVAUUS
	ubOnMUpBquO827ganS0q2V7234AHRpv4/7a+gnBgux/dJQ+5VooEpXJkqahG0QQx2EALzhokyOW
	M5GDsQsSkqItAbDs7E/zFU5rG11IoX5IBtgtrhByv7Q5IARcMTDflGo8F60bBcs9ispi5UUjlgh
	RSBwCd+BUNmBCmrajjwMP23nB4AI4O+zyzvOnSqvBMlwE7yCmlHEJCUygKZM46yzqv+fCNH1BDc
	ZGFU9/46XG67YmXmDsAVpgs1gX448zgX+nplA3UARQEvEM/0OF36MZzgJ0EebMeq+4Frx5MH8wf
	t8ZgbmrQ9Qa3Wt5iq0YAsa+UmHrdcqdoY0br30eu2j0R8dTnRuAQhcS6aX0rRJWOJI8nfFipAcH
	u8mvdHlxX3ZHk8WooBUn6K5d7511b2JUIiH+opo/n+AcdbLid056R01RurUeGRX38dsa3eL9KXK
	0duzeWAl25k6DM=
X-Received: by 2002:a05:600c:6592:b0:493:bc4a:fb55 with SMTP id 5b1f17b1804b1-493f883d859mr23928025e9.38.1783775032510;
        Sat, 11 Jul 2026 06:03:52 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccaf1sm375141585e9.2.2026.07.11.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 06:03:51 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: b-liu@ti.com,
	gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] usb: musb: fix dead select of USB_MUSB_DUAL_ROLE
Date: Sat, 11 Jul 2026 14:03:49 +0100
Message-ID: <20260711130349.592545-1-julianbraha@gmail.com>
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

Replace 'select' with 'depends on'.

This dead select was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/usb/musb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index f56929267eaa..f8ff2366f59f 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -116,7 +116,7 @@ config USB_MUSB_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC platforms"
 	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
 	depends on NOP_USB_XCEIV
-	select USB_MUSB_DUAL_ROLE
+	depends on USB_MUSB_DUAL_ROLE
 	help
 	  Say Y here to enable support for USB on Microchip's PolarFire SoC.
 
-- 
2.54.0

