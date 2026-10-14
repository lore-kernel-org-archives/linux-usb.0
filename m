Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A670337106E
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000066; cv=none; b=ewNT0gILbRdtCwgtp+L46CfnpoI6lJLKkEvOydjg3MYdIkorkdPzLYrOQZv0qhBaI5qKksH5na7W6qNkMHYYG1x/zJGQdRxe9KdK55VAA9kwB1ZD9iHgLKeqTG6hnyDddRULAjr89H4fA1iQbxKwBdeLhIMDaq9BqYOvQTvw0eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000066; c=relaxed/simple;
	bh=IUPDwUL0BaNCf4DV5Ybn+DP1Rz/VR/mXDkTWYRMeRb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QVLfh1mV0ipeedMpcLodwI/A8YNp+355L4T/tvt8DRc9jJa85v+GqvHTSKUokd+TKlCPG88S6OmjbMDvJR1M/alxDEbUFzPeUIzM0oacW0gzjoMrEscGm/z4ZRW9UmQ0m0WQJun6WdHuxv1e3bMY2BU2t2uV3TbOT3dRph1nq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a2qw7B+3; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a2qw7B+3"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso4212948f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792000063; x=1792604863; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XVQ4KwgLvEhsk9ZR/bxOmORzJTQYU0FLwNCJ2bt4pQU=;
        b=a2qw7B+3pnwoS2p4dRcduKHNzMaKgl+j+lbGGOA0kCnq+oEAYxCYsqnf+WyUuVAQsy
         tvvAvu140KgI0nvMVnrgPhBzL4KVQBOvOyb81H/MgxoFy/HST8BWbMi0v9qdCTqjd/xE
         i1pk8DJ3FiW8N+R9sYk/BTqsrRlDei6KpnwUipFqD94zM9ZQzTuq4io1Hrn23xWuN15f
         76cgX8eLNDp+E+tjQrBVYFkzRAp1arwD1+tHjjD8/hH1R2tqF5VAPoPkY7D/TFMxxwdv
         GCKtO0mj70m5nOKDyrGteP66/Q6MnsuF7lD+YtR6kzJgYs9+46PWdYLrHYD3XsgZUtYo
         FeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000063; x=1792604863;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XVQ4KwgLvEhsk9ZR/bxOmORzJTQYU0FLwNCJ2bt4pQU=;
        b=ofBdSI+IdqrxJ5RNdkIJPyQkTeQByb7sPslNbCOTFtoMpxH/j+zF52rfnCT/6MRuzm
         ZpTccdLwkwtIbkR0Lyc0REkjK3i/YXiCCu3ctdmFHj//zl1Tyyg2f4ZqbAYgzB39Yh+z
         sJkaHAL8XUuu4CCFWew8XVLKncuLS/KMBOpx62lnvUwJgxsesEch5LeZ3L0/P3aSFsBL
         Gl4XlDj5pvH/gIfgxfcXbhpUAw7Me5BgWnCOS1lY5i66XtxFChwce7a/9oejzbE7l8oo
         Zm7W/0ctHl+hqZhXuELY+bkcZo8GGOBeJWgdLpHhp+4djV/TcBzdEdlnQB3a5G4z5Yow
         UdUg==
X-Gm-Message-State: AFq9FYIPA3aeYjhfq2HazJRFS1zBBBuRsO2PRAnhb2hsrY+6Vue1oAe/
	HxVjetVcDDFFMLzOMuGD+C35rM4GMwj3X8TcnvkbsNSONWpl7bKeJB8sTGA25dq7cnU=
X-Gm-Gg: AYBFou3UF31+79DyacC3vMlQq3T25FUnTS9w50pygORIJBoxIbS6lIeOmolzkqr0e9e
	/GIQe6Mi05NWuiyk9jVPbJhMhrX+6foVIzFkOoc8frWABoUHn78oAnmLlPL8pNmNlxIYwhiLZmh
	Bk/HMp+0ThOsSy46QFjgUL2hLmBTAeYM/KMJquu8dTvk11OAu2DYV8EMBd2D36D6hPzwXQc4nEN
	GiYr34I4gBvFtMI2/K06CcIYEWBL02VYJYUDzbe/pi18mTIjw6Gz0uAmLeWUZ02G+vtp9deGwKC
	M1CQos9v9gLG7ChQiuQ1EwG8otgZR2B3t5biFezsyS9IH9C1keV6hTBBFRaamK5kVVkTshPRZTp
	9W1qinMmtvZg0UzHRuvY/kx3DBbFCGXoIA485i7FQV2GBbXpMrQKA2HcOVL0dsx1NbzbW7ORPrp
	POSu6dvDlUuG0n+W5i/Ds0pmXHMwC6ULDhlTOiHY2ReS18uHnBHMo4uuuASONfCjzzoGRAc7e1b
	/fPOEt2gbYV6uhUOEJ3CcwXCi2Jg4rd+RDe3jSS/eQ7M0MTOcgPhQ6dXoccEiGGfGtm9Q==
X-Received: by 2002:adf:e983:0:b0:48c:7f94:8755 with SMTP id ffacd0b85a97d-48dbaced42bmr27950392f8f.20.1792000062772;
        Wed, 14 Oct 2026 10:47:42 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac3ac5sm13337683f8f.38.2026.10.14.10.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:47:42 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 14 Oct 2026 19:47:23 +0200
Subject: [PATCH] usb: musb: musb_dsps: Wait for controller reset
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-patch-ektor5-dm8168-usb-v1-1-9670414271d6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDvghBpSryJdxGTUaalKJpaCe
 PemdfkW/++gnIQV2mqHxG9RWeYCulQQJj+PjBKLwdTGUk1XXH0OE/IzL6nB+HJkHW7aY7TBG9+
 Quw0WSr0mHuTzP3f307r1Dw75t4Pj+AIfDLdXewAAAA==
X-Change-ID: 20261014-patch-ektor5-dm8168-usb-d6ca2a5189f6
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@ti.com>, Ravi Babu <ravibabu@ti.com>, 
 Ajay Kumar Gupta <ajay.gupta@ti.com>, andrew.goodbody@linaro.org, 
 rouven.czerwinski@linaro.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792000060; l=1954;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=FNhYi3zdirabUGuJUuxxNcXj3ChSUs+IDNUC/BSjvn8=;
 b=ZWCYtYZ+3hvJTQEiKqMs8W58/P+0C6v6vSjz+RIX5UvfNkLUZ0cviSEFQgklOhCT0KBxPhaXj
 NUhZsCow/tVBadS2w8BnIPQVjPzV/qeVyzef05ugC92Ls62DNhlBSw+
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

After soft resetting the USB controller wait for it to complete and then
set the mode of the controller. This ensures that the controller is in a
sane state. The timeout value used is just large as the board is likely
broken if it is ever reached so no need to optimise. It was tested with
a timeout of 500us which worked so gave it a 10x safety margin and used
5000us as the timeout value.

Fixes: 9ecb887522a0 ("usb: musb: Add support for ti81xx platform")
Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/usb/musb/musb_dsps.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
index e3935f18dd56..d909c45c253d 100644
--- a/drivers/usb/musb/musb_dsps.c
+++ b/drivers/usb/musb/musb_dsps.c
@@ -15,6 +15,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/irq.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
@@ -35,6 +36,7 @@
 #include "musb_core.h"
 
 static const struct of_device_id musb_dsps_of_match[];
+static int dsps_musb_set_mode(struct musb *musb, u8 mode);
 
 /*
  * DSPS musb wrapper register offset.
@@ -466,7 +468,13 @@ static int dsps_musb_init(struct musb *musb)
 	timer_setup(&musb->dev_timer, otg_timer, 0);
 
 	/* Reset the musb */
-	musb_writel(reg_base, wrp->control, (1 << wrp->reset));
+	musb_writel(reg_base, wrp->control, BIT(wrp->reset));
+	read_poll_timeout(musb_readl, val, !(val & BIT(wrp->reset)), 2, 5000,
+			  false, reg_base, wrp->control);
+	if (val & BIT(wrp->reset))
+		return -ENODEV;
+
+	dsps_musb_set_mode(musb, musb->port_mode);
 
 	musb->isr = dsps_interrupt;
 

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-patch-ektor5-dm8168-usb-d6ca2a5189f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

