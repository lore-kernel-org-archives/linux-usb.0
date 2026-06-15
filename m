Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055CE411664
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545158; cv=none; b=oB6SUnb0cD0XosBIhSNu4gCkOcSAAruHbwmSmiu8pYX8g/hORdZ8A/4+DmRbpX7ME5PH9yB8PRLEKzW6EaTAPx5yo8DRkkuFx/uh4KquTbYnxIYbP6SIWxU4arvjbiKjyGkO0t7MKgqc9isvPmohxk9Mcl1VK+QFqbyPVsJsR2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545158; c=relaxed/simple;
	bh=b1KQtTshbtili0wyZAgkxDnKPTtj3bS+cOTRQEQ2T4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nBN1+9gdZT5kwy9kb8KSoYwQg8erZQxACg8oynMVhJEGPjsMhTYgHQjOKVOXD2XqXAylFqFoaayWy8buWU/qpjr/WfuhIMEn5ZQnmf5upikw8F0tYW7EwtkDmhvdEUDMcywuFinE/Hbv0FjtVRIxsjw1sMxaN0cxJ8jYXyNkTvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJCtHaUq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJCtHaUq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso32597185e9.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781545155; x=1782149955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUS4w+g3WwlW2RArtbPlHwbcMKiF74iqmdmNoauqTDo=;
        b=XJCtHaUqk1fhdWGM5IIT4iTKEjCQf48ZN6kmr9rx3MYMduetlH43oZTHVx84icba2Y
         66jGICMBt14tjCHl1l2UcDEWAWDIAPsmxL6HdKkhJmdt8ww7lvGgOEYauhWOvoD+piYz
         1c4HOGnLHcjexP4vZjH43e2yN8PlIEkziFQ8FiBOPoPknCyUPhT+dMLYGXnW3ov6QJ9E
         lCre6zuy5zX12Eal4xp9/HURT/qhQWXtnffcmZ9xZnMeZ+uYqVe7nYJrF/1mcgKmgoJS
         WmVVLXIVGCB8ZNZK4kexVO7wapNE2e6Y1JWymnue7pcQ1mHCv9Dmeti3iM6DaQUzA3OH
         hdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545155; x=1782149955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUS4w+g3WwlW2RArtbPlHwbcMKiF74iqmdmNoauqTDo=;
        b=tWjYd+unKrH+t6Mae7q1Rk+CdfhiXUmioQcSfiLk6DWjiK/pA4HY+qmfzM7UI/3mjX
         u4CK+ZeW6CO2lp+SOS+w0Mf3EN1C4BRCcS/fifbpZOZNW022oNLLEAVBD/v0t8/m2BsF
         eGLH9swMaRDV/riRbfONdA0FnhBhos6KgLiFDlbEXviF8OSbtRq8vRmFpRwY3t1rjz64
         6+vTnbwnsZZpH70dDqV6B0J+A9lz822IMv+fN46tCASFRA/iwHvPRTCTYQTJCQoYXHR5
         fCmN7/m9nTLeXbOsE8Gk3DB/fVFcS7pg3Mj19zv9TS+jmbG12DLRorw9pQCoYlAR2RAO
         by0w==
X-Forwarded-Encrypted: i=1; AFNElJ8rDEu66T9gQBLRiDOce+UCeYtni8xf7FRBnS+9fC349E9C3aW5Hcm7UhaMvTo/1wcArbUWpU98/ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsAHXHjnuTPPUIi7R12G3TNVLqYzlr8MVZQUouD77zMl25fKS/
	/hPr5jtLh/hPL9HdA6n/ZP984stc1Cw5lhK3OHOfkkLUjQCA+SMbTQ7+
X-Gm-Gg: Acq92OETUNH2COqCITA4bu9CmYYLSC0LanflTbtjJ3miRYXAeo+kM1MO61Vldi+JiQZ
	D2Ib8xvccxRt232ZF4p+bzNCy6ZhNV+yuvk581pb9vEnfmvSfzF7lCrUuZCEushdNWQA4k4vtvM
	OzZu6cB9i/vF1tmLI3BAfuEYOCNIugi8lxK2IZziNDzjG+RtOJC5oKwYAYd1soD6dzg632njq6h
	yG6wzD8swZqZURowPG4D8yvCYEaNE7aSrQ1dWH8ahu5gahtv+0bZWlnCD9Tmz1ONdzIw6xpttAA
	DY5UIQ/byWA6U7/+wan92HrOKpBLaMXxD5qXIOvFzpARgSI5fSE3sHWcZ5U7O6cL4ERfpY3j1RQ
	5EBsDcdFbLurv48SKbQGLZ/u4qv2vOwsmJyoYMfFY98ed+o9aWb69BoXluR66qtB1zppDmKMy2S
	FEzBYkYh6XHKsdt3dt+xQQWhXGM5FiKLMrkIE1SuCDSFcsehM=
X-Received: by 2002:a05:600c:6542:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-4922006283cmr105801505e9.14.1781545155201;
        Mon, 15 Jun 2026 10:39:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:eeb:53f9:7d71:64c4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d4fsm39399894f8f.24.2026.06.15.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:39:14 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] usb: renesas_usbhs: Fix power-off ordering on unbind
Date: Mon, 15 Jun 2026 18:39:10 +0100
Message-ID: <20260615173912.336408-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the usbhsc_power_ctrl() call to before usbhs_*_hardware_exit(), so
that usbhs_*_hardware_exit() sets priv->phy to NULL only after
usbhsc_power_ctrl() has executed, which controls the PHY power.

Fixes: eb9ac779830b ("usb: renesas_usbhs: Fix synchronous external abort on unbind")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8c93bde4b816..614b724a0e52 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -813,6 +813,10 @@ static void usbhs_remove(struct platform_device *pdev)
 
 	flush_delayed_work(&priv->notify_hotplug_work);
 
+	/* power off */
+	if (!usbhs_get_dparam(priv, runtime_pwctrl))
+		usbhsc_power_ctrl(priv, 0);
+
 	usbhs_platform_call(priv, hardware_exit, pdev);
 	reset_control_assert(priv->rsts);
 
@@ -828,10 +832,6 @@ static void usbhs_remove(struct platform_device *pdev)
 	usbhs_fifo_remove(priv);
 	usbhs_pipe_remove(priv);
 
-	/* power off */
-	if (!usbhs_get_dparam(priv, runtime_pwctrl))
-		usbhsc_power_ctrl(priv, 0);
-
 	usbhsc_clk_put(priv);
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.43.0

