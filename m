Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACCB379C56
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 02:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860156; cv=none; b=fwSxAddbtQ9zBMZ/EmwIPgGiJtxM9I3yGvkHeZLbRlb9cYOKmpPPQQzm1M3UXm0ExR/84ewtVPclNV6JTZjH2AWndliZwHOw6pbYKVAkk8WDLJeX0j9+ncXjKeechWUhy8FVypbwFAM1ZV77jOsJTohOSxiS9TuF28WRqad/Yek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860156; c=relaxed/simple;
	bh=TEC9RxqWL5ZvX/2g2f4/ytyr1XZMsj0b8TTkJVHK0gM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Db0Mskrb93ItI4gic6izvHRoMUk90rSH4IKPMMCYwlNPYGRJKKlniwBStOS3a7dTOgmyoPNlIsCK+pADy74E0FtQkWmLQNOfhDenCQnrgveeLSJZomFcBOV0DwEJqpD3aGv4lH1c5tcDrik0C3TomFgJRRCw6++z376x1ddo6AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa3g7Nrk; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa3g7Nrk"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so4805844eec.1
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 19:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791860154; x=1792464954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYkXOkbNNXGaV0h+0g9qXlZ8g0hBf5btV0g9hsE1Sag=;
        b=Fa3g7NrkOh0OSkR8RHK07BiT1xKxenE9NXdoUYEzQvXmDn9Y0m638i9Rjl5XcAnicq
         NgnuJtKPStlJcxVvwE/8h1N5iZ8ur1iCE09vaUv8WmAohp1s0x2kTO/ThyeJIiKF6hfa
         orE7KilGq4K8JzcqCSVIUdYBApFZ8BRBHHBjr35p6cKy6la57eglDpbjhKR4CpnAWz88
         Js+kn0HDaKX0bJKw+W6VeWqradOUDEPhZYRy4o93AvOpXgvZ6Zi7lTndnA1PFMYUzgon
         tz6dgDFzl86TOcABFi+ssopbnz7hkSH/0eK2pS/Zskr3oKauM7ZC01h3vfKlgC/8GRjW
         JZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860154; x=1792464954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYkXOkbNNXGaV0h+0g9qXlZ8g0hBf5btV0g9hsE1Sag=;
        b=RUqV9uYJSjjRaVrKUsbFhS3AW7+SfDwtNb0P2hujirSj5ONKltJKI3sSatyS5vZXlw
         M0Bhtd7BqCElDg0ZCH48dXS1nAg0vZmXRRgs3+bq8OF+yXProE1YbBwpW1bjjpb3SQ7G
         Dd4ZDJ6V/ViaHjjmZQJvYzcDw3QT5WNTONrhr0L+fuDeFfEGSvjh/Q0rxQjM4OpnNWwm
         4lDwBA6D32Hi7F6mXs6quHnvU5gApqDHV7i3dUGtcsv7sfH49a9XDJP+ZwYIeaX5h3BN
         ZKTTvaWIt/SyF8dbXgsgBkiO/NfppVOciSo2V+Beq1L1rXi5gHm0vrwHvzByvGyw852p
         xuoQ==
X-Gm-Message-State: AFq9FYIAa0K8D03oDhUwgcwbN6HB4eyVBncUdR+fqA9CqYv07LYxjKqm
	SxZ+Wy7F3otbFXvzu3vKvQ5sal0Ar/tcg+ZzNk+OwyHHoAJIGQYeCjLcTL2rhs5f
X-Gm-Gg: AYBFou0SguXmfckiZCw1LeflHdMUgUZIUQFjTXnJyEC7SEkv0sqLUN3AXdzVITWRSfu
	rwZrMuuwjb91oYVO0OtVTZ9FvvAAu/3N+GVos9ZlfTsJTfau1p8Jp/y5qSXCyeS+DxD86zt7Z47
	GKaueFAvdUL5r1F2uF3xjlfXnXw1lhoPgVKvnH/tcBc2rKLX5xv5BsBmHcEqQoO2u1ODGQn85Pz
	Ml7DDnDxF6Cg9g12SlmKU4A2i/vO5MisOV5Ktvr/ei8hlstsOUmJHJULZAbmMjKQmsHhlCBXUtg
	oDEHdBAERQndeiNubMBFugVeE2wIiTs+cCBYSfETRA9RWkb0Ht0CpdI4nP6exfz3Lu56nmNYA+2
	ucAEa4p7kAzELJVJ7MkYPJYeOUrt2cJdTj6A3hVLZjNW3OpJS6tLs3HZ/EmHUNruK5sTzKIqoaX
	MhXGCC7sgzEHAHs0DdFH1O7Mql63VZOnpgeuWODjlvt041I40GVZirVoN8AbgKCvMrZUf5N//56
	NnHz3/eZtc7
X-Received: by 2002:a05:7301:2a8:b0:358:cc1e:e23e with SMTP id 5a478bee46e88-358cc1ee683mr11380792eec.38.1791860154159;
        Mon, 12 Oct 2026 19:55:54 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:8056:897e:dae3:8e2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm50889219eec.9.2026.10.12.19.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:55:52 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Tue, 13 Oct 2026 08:25:37 +0530
Subject: [PATCH RESEND v2 1/3] usb: chipidea: Use %pe to print error
 pointers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-usb-ptr_err_patchset-v2-1-f83351b3fc3d@gmail.com>
References: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
In-Reply-To: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791860140; l=2766;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=TEC9RxqWL5ZvX/2g2f4/ytyr1XZMsj0b8TTkJVHK0gM=;
 b=QkczeSx4eka1kEzqETu5ME1HMWRf/Vg47Ckpa+SrLyRkubs+nCQL071XMlMAgJK/fBSL2YJWV
 64bApH1c2Y9D/wHzuuyEmUJDQR8Hle0oeyFEHPMIRCp4DspjmUPyiqW
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in imx_get_clks(), ci_hdrc_imx_probe(), and
ci_get_platdata(). This prints symbolic error names (e.g. -ENOMEM)
instead of errno numbers (e.g. -12), making error logs more readable.

Fix coccinelle reported warning:
WARNING: Consider using %pe to print PTR_ERR()

Compile-tested only.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 12 ++++++------
 drivers/usb/chipidea/core.c        |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..7bfe37ed68ae 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -218,8 +218,8 @@ static int imx_get_clks(struct device *dev)
 		if (IS_ERR(data->clk)) {
 			ret = PTR_ERR(data->clk);
 			dev_err(dev,
-				"Failed to get clks, err=%ld,%ld\n",
-				PTR_ERR(data->clk), PTR_ERR(data->clk_ipg));
+				"Failed to get clks, err=%pe,%pe\n",
+				data->clk, data->clk_ipg);
 			return ret;
 		}
 		/* Get wakeup clock. Not all of the platforms need to
@@ -448,8 +448,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		pinctrl_hsic_idle = pinctrl_lookup_state(data->pinctrl, "idle");
 		if (IS_ERR(pinctrl_hsic_idle)) {
 			dev_err(dev,
-				"pinctrl_hsic_idle lookup failed, err=%ld\n",
-					PTR_ERR(pinctrl_hsic_idle));
+				"pinctrl_hsic_idle lookup failed, err=%pe\n",
+					pinctrl_hsic_idle);
 			ret = PTR_ERR(pinctrl_hsic_idle);
 			goto err_put;
 		}
@@ -464,8 +464,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 								"active");
 		if (IS_ERR(data->pinctrl_hsic_active)) {
 			dev_err(dev,
-				"pinctrl_hsic_active lookup failed, err=%ld\n",
-					PTR_ERR(data->pinctrl_hsic_active));
+				"pinctrl_hsic_active lookup failed, err=%pe\n",
+					data->pinctrl_hsic_active);
 			ret = PTR_ERR(data->pinctrl_hsic_active);
 			goto err_put;
 		}
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 07563be0013f..09db8a4eace2 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -680,8 +680,8 @@ static int ci_get_platdata(struct device *dev,
 			/* no vbus regulator is needed */
 			platdata->reg_vbus = NULL;
 		} else if (IS_ERR(platdata->reg_vbus)) {
-			dev_err(dev, "Getting regulator error: %ld\n",
-				PTR_ERR(platdata->reg_vbus));
+			dev_err(dev, "Getting regulator error: %pe\n",
+				platdata->reg_vbus);
 			return PTR_ERR(platdata->reg_vbus);
 		}
 		/* Get TPL support */

-- 
2.43.0

