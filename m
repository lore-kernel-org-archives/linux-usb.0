Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2887C481648;
	Wed, 21 Jan 2026 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769004694; cv=none; b=As3/dl2R8FnH1ykrqoBt/Q5LuWblwiDA9GVYE1HvAZhYxeGe6RGwpCA4S4M7ej39koqAIaNUiVwJ4RH4sexdQPWVxO/2HoVQizem5FxQoxIkiaE83Bt80mI3s6XJOykcONf29QOndIg3Ss3KORs3pJ0X0ikIgoemXHoVnp/BTxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769004694; c=relaxed/simple;
	bh=bTMo10SlkojFeqNM7uZ/l/Lwpv6fap2MUX1NzsAplUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJZCV8Ch0CSHtXYDvMyUnOBqkuC6eubJi9CRl36q470vnxXLzCBPKvNuVaWNJiEI4uJ7I6qwZZRn7WmatQ9NdZGR8E1mxoQIGGXVvLNey/ycErHNt2S4rkOEMGrQ39n2d1d0BMmdvtZ/dIEFbM1aPF499xFRhYAtCMMnvvKiDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B05C116D0;
	Wed, 21 Jan 2026 14:11:31 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] usb: phy: generic: Always use dev in usb_phy_generic_probe()
Date: Wed, 21 Jan 2026 15:11:20 +0100
Message-ID: <df4ce4bac088f0a4703dd8a3d1255b9072c0b8c6.1769004444.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769004444.git.geert+renesas@glider.be>
References: <cover.1769004444.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_phy_generic_probe() already has a "dev" variable that serves as a
shorthand for "&pdev->dev".  Use it where appropriate, to shorten the
code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/phy/phy-generic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 8423be59ec0ffbe8..13bd16668932dc90 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -294,13 +294,13 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 	if (nop->gpiod_vbus) {
-		err = devm_request_threaded_irq(&pdev->dev,
+		err = devm_request_threaded_irq(dev,
 						gpiod_to_irq(nop->gpiod_vbus),
 						NULL, nop_gpio_vbus_thread,
 						VBUS_IRQ_FLAGS, "vbus_detect",
 						nop);
 		if (err) {
-			dev_err(&pdev->dev, "can't request irq %i, err: %d\n",
+			dev_err(dev, "can't request irq %i, err: %d\n",
 				gpiod_to_irq(nop->gpiod_vbus), err);
 			return err;
 		}
@@ -313,14 +313,13 @@ static int usb_phy_generic_probe(struct platform_device *pdev)
 
 	err = usb_add_phy_dev(&nop->phy);
 	if (err) {
-		dev_err(&pdev->dev, "can't register transceiver, err: %d\n",
-			err);
+		dev_err(dev, "can't register transceiver, err: %d\n", err);
 		return err;
 	}
 
 	platform_set_drvdata(pdev, nop);
 
-	device_set_wakeup_capable(&pdev->dev,
+	device_set_wakeup_capable(dev,
 				  of_property_read_bool(dn, "wakeup-source"));
 
 	return 0;
-- 
2.43.0

