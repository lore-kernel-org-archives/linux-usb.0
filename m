Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4D39D6CC
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 07:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977918; cv=none; b=Yc/khnZ+iCvKyMp9uzAsKroQm8K5H3rQ2LWeP6zfilupMKVebJfnhsAeI/tEvC28vs+HW0W7GbAa7pgevRxUe7kY3lFsyMkUx5qoRpIagZlnz2r22Ff50kKu4l0r164p3aspajQV2fTFsIiEwT5b3aG+QfBj8uXCOTIkzL8z6hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977918; c=relaxed/simple;
	bh=DdLjUC1ksuo+PVzG3yADpMg7xDZKtpZfVtK9cx+fcI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Em/pYFr+CkeHuo5xd/Njni8dUqX6/7vwP4zh2jZrlCBe4rw4tspto5L4CfOkxZ/1iIlaUZeuNIeoG7PdjvPNCR0vhsug/6tA+GqNsIrtHHIsMBSjYahh0inwAkpSG5H5GMqbdHYYaH1PccqUKtyuHRnp3eQb89tVcpBiJd4pjrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BV018Qxe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BV018Qxe"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4745492ed3aso908889f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 00:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782977915; x=1783582715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k+eqRtwOb4f8aCqe1mEHXBn99q8o4sBYVGzbWmzuP10=;
        b=BV018QxeEXIfBas2KL/xdTtJqXoWWriDanZZ4iJX997qalMvcQiqzP1vRBTbmzJ6M1
         A2AoDO+ze0OX5y0Jix4VuVGnpsUXakv6MgT/GQ5BOobpuzHBTV39ovrniCk8U+8xBJ3y
         D8XMiaDUCMJdsiXEmZSQQaKUmdbCjAWmKdwgRzTwiPZ0TMh92IzRLwnsqQvTRFTZYPdt
         BghKH7W7WvCpIMt2xZ7stfr67IV7TcnJCmwizWGumZQ7lxZnjLTymyeW7Gj+rd0BVTli
         HZb1F1UCjPZbOt30UldGwXrO2MLa0e6/yLHjj0I8YjgHI76eHAHK/LulyX8s0gyL7/oZ
         CFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977915; x=1783582715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+eqRtwOb4f8aCqe1mEHXBn99q8o4sBYVGzbWmzuP10=;
        b=OLBOORC7as5aWHio5kzXBTV754m0/v1Nrnlw7wkpj2Jpk5NQ6gidgjhyank4xTDIax
         BynRqWh/PFh0d9XJiWEr4kY3dG9yR2Rc+juY1Qvb3WIrsklz+O8aBx2OgbUSFixkCRlu
         hbUeqBaY1tDC48Of3mX2kWPBZQR+z8fUFuu5EJQZ6KM8ZpAkYbSTqd3rF1ZQuUmPSE5/
         WhU5HGk5zt+nAQ4dCKcc8uhFjrgnmLS6MV6WvqIIWQvcoqAw3JN768dmX5CJatU//Cm3
         up4L30BjUMewCZfAzs3WckuihYy8QUUEbIpdESw/Xf5JgToLJbVIoPgNlRzqw3bHf7od
         tKrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoePyEQyJ8vPMcBJ5yFd9S+YTlYq+8y6DDjz0W6KALEwTftqi1nGofDiERYUCsy5MzadolEOIdvu4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCedQH4jKGHka7HFELeaeN+E7woorb2l7Ipdhh40CkMND0DfCU
	PPIowZKHt3HATxtDnSZ90UtvOYyaMCeCUJrnL7UwcboD7PB5tA6zY1A3
X-Gm-Gg: AfdE7cmyv306wLnviiwOpE4HGIoYVpTNG8Lb9ER/PuRonPT9OpttTl0c1TM1vu2J7g1
	H5TvMeSl/OZ8MNsmIr4iEd/6pFe/H0j/IVmaMGMGoOCMeu3E5QQ3vgWXH9Ur5SrnQtAn839rDWC
	cjwvw+VHFlwEMvVd3Zk1lx8jV/Hcaqlly+xqObeAecQ9DUjxmj1Sr4GwbBX/wkzeU5fT+mv4gts
	RZAxApHclDIS0ejEME/qUy7UHEpj0ggkuoQr1b0oTy2mgV1ToC2V+2Gl5+F8uLx1nEL0Ssg+2vX
	dF8Rsr53kXLulkalJpQ21+PZ6gz1BT6pp6WSskLssnl7WbWQYZ0CHYn4AXj9rFTe14VCim68s5G
	WJ0xlvIX6VcehtdyKvDfR0/9XiPtjDus2biUCH4QM5aRVvM9gPoHVLGysNl9nGnLn44C6uoqODh
	9cF5xY4SCIKphkK2Qabn9ZZl74+ayLBYy9VlzBhw==
X-Received: by 2002:a05:6000:607:b0:461:9950:da50 with SMTP id ffacd0b85a97d-477574b0300mr7823320f8f.11.1782977914687;
        Thu, 02 Jul 2026 00:38:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:8d97:896e:a65c:20e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd0b1sm6331170f8f.35.2026.07.02.00.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:38:34 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fan Wu <fanwu01@zju.edu.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] usb: renesas_usbhs: Fix power-off ordering on unbind
Date: Thu,  2 Jul 2026 08:38:29 +0100
Message-ID: <20260702073832.175047-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the usbhsc_power_ctrl() call to before hardware_exit() and
reset_control_assert() in usbhs_remove(), so the PHY is powered off
while priv->phy is still valid, rather than after hardware_exit()
has already cleared it.

Fixes: eb9ac779830b ("usb: renesas_usbhs: Fix synchronous external abort on unbind")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Moved reset_control_assert() to avoid synchronous abort
   during unbind.
 * Updated commit description
---
 drivers/usb/renesas_usbhs/common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8c93bde4b816..51d3035f82be 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -813,9 +813,6 @@ static void usbhs_remove(struct platform_device *pdev)
 
 	flush_delayed_work(&priv->notify_hotplug_work);
 
-	usbhs_platform_call(priv, hardware_exit, pdev);
-	reset_control_assert(priv->rsts);
-
 	/*
 	 * Explicitly free the IRQ to ensure the interrupt handler is
 	 * disabled and synchronized before freeing resources.
@@ -832,6 +829,9 @@ static void usbhs_remove(struct platform_device *pdev)
 	if (!usbhs_get_dparam(priv, runtime_pwctrl))
 		usbhsc_power_ctrl(priv, 0);
 
+	usbhs_platform_call(priv, hardware_exit, pdev);
+	reset_control_assert(priv->rsts);
+
 	usbhsc_clk_put(priv);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.43.0

