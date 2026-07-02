Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698103D9548;
	Thu,  2 Jul 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783004049; cv=none; b=fq8JR2KNmrzXSQfdKqy+EcYnWpgbPoeARFHsK6KYalPGBZCq2CWTdAgZd/+90Mrr08UO0xLFi4yPjkEK9eZgBl1g3HIO9a19/Xv2xD5MHCqnxdI0j7NIqpXkFWObfmFLvgPvj2l0n0AnWqCqUXoiygFiKiMoHxDkruR4KXWzjyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783004049; c=relaxed/simple;
	bh=AlDnnrSumvQ0JUayuwWhX4lgLQINoDGTcc0ugi/Lfas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKAv2wQFAgQXQ1PBOaEStaG/qjry6yLRsXSbgFf7Z9pAEJEZgPlO9B9c3a2mote7ogMUQv6IWBB119Xesr5Rn+e5iW7dfGIFPT6/B6Nn1plV+B9do+Nx//uUQ4sUlfVOXYJBgcL+jS8OsOC0OcA91Uch/tlI8SKmF0SKZ6hWjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=np3DLADc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="np3DLADc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2F81F000E9;
	Thu,  2 Jul 2026 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783004048;
	bh=4D5Pfza9ye25/7h+SlhjH9CFxEdzdfjUrz/QKfasyh0=;
	h=From:To:Cc:Subject:Date;
	b=np3DLADcUNID+B/3g9XO+CYdxV5YDyZN61vqId4JgZfV9eWMNpNCVOK+RGaxa82o8
	 fePwahT6+PlJGhylFY5ec/VBaMSKZ9psjO/7yzUoATYkor4bIpC9R0w5HDOpVfuoAH
	 nlUfuHPQsPbPkbOzfqb6fXAQ8P9vURPUAdgJaFCR5EVqu3QXkdK+ZAEkFC6QP6uX+d
	 HZuvENtVsCQuMrQCINywbyauqBgV5SyRS1xS31ByWcFmY0jo7wuMlt2Qn3FAOh9Pu7
	 ToOgajzsM7aq8b2g7lIgbIKQxTVz5r0jR2nuKFfNmKwwi/ABe9YEE+Td5HBYz3xKm1
	 SU5PcuS5fjcTQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wfInl-00000000SUi-2my5;
	Thu, 02 Jul 2026 16:54:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: gadget: stop propagating controller OF nodes
Date: Thu,  2 Jul 2026 16:53:50 +0200
Message-ID: <20260702145350.109509-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some UDC drivers propagate the controller OF node to the gadget device
but there are no (and has never been any) users of this as the
devicetree binding and composite driver support was never merged. [1]

Drop the unused and incomplete support for OF node propagation which if
ever needed should be handled by UDC core.

Note that this also avoids probe failures when reusing an OF node that
describe resources like pinctrl that are managed by driver core (cf.
commit 48ed32482c41 ("usb: gadget: aspeed: Fix probe regression")).

Link: https://lore.kernel.org/all/1340720833-781-1-git-send-email-aletes.xgr@gmail.com/ [1]
Signed-off-by: Johan Hovold <johan@kernel.org>
---

This was something I stumbled over when fixing a couple of gadget device
name leaks. This one applies on top of those fixes:

	https://lore.kernel.org/all/20260702141536.90887-1-johan@kernel.org/

Johan


 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 2 --
 drivers/usb/gadget/udc/aspeed_udc.c      | 1 -
 drivers/usb/gadget/udc/at91_udc.c        | 1 -
 drivers/usb/gadget/udc/bcm63xx_udc.c     | 1 -
 drivers/usb/gadget/udc/fsl_udc_core.c    | 3 ---
 drivers/usb/gadget/udc/lpc32xx_udc.c     | 1 -
 6 files changed, 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 8b9449d16324..0dccdbfd6aef 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -592,8 +592,6 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 	else
 		d->gadget.max_speed = USB_SPEED_HIGH;
 	d->gadget.speed = USB_SPEED_UNKNOWN;
-	d->gadget.dev.of_node = vhub->pdev->dev.of_node;
-	dev_set_of_node_reused(&d->gadget.dev);
 
 	rc = usb_add_gadget_udc(d->port_dev, &d->gadget);
 	if (rc != 0)
diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 75f9c831b21a..09776a5e224f 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -1299,7 +1299,6 @@ static int ast_udc_start(struct usb_gadget *gadget,
 
 	UDC_DBG(udc, "\n");
 	udc->driver = driver;
-	udc->gadget.dev.of_node = udc->pdev->dev.of_node;
 
 	for (i = 0; i < AST_UDC_NUM_ENDPOINTS; i++) {
 		ep = &udc->ep[i];
diff --git a/drivers/usb/gadget/udc/at91_udc.c b/drivers/usb/gadget/udc/at91_udc.c
index 5aa360ba4f03..de8083986942 100644
--- a/drivers/usb/gadget/udc/at91_udc.c
+++ b/drivers/usb/gadget/udc/at91_udc.c
@@ -1558,7 +1558,6 @@ static int at91_start(struct usb_gadget *gadget,
 
 	udc = container_of(gadget, struct at91_udc, gadget);
 	udc->driver = driver;
-	udc->gadget.dev.of_node = udc->pdev->dev.of_node;
 	udc->enabled = 1;
 	udc->gadget.is_selfpowered = 1;
 
diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index c4f9ea45bdbb..ba91b1ebbf57 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -1830,7 +1830,6 @@ static int bcm63xx_udc_start(struct usb_gadget *gadget,
 	bcm63xx_select_phy_mode(udc, true);
 
 	udc->driver = driver;
-	udc->gadget.dev.of_node = udc->dev->of_node;
 
 	spin_unlock_irqrestore(&udc->lock, flags);
 
diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 20392409afb1..878d70b55530 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2465,9 +2465,6 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	udc_controller->gadget.speed = USB_SPEED_UNKNOWN;
 	udc_controller->gadget.name = driver_name;
 
-	/* Setup gadget.dev and register with kernel */
-	udc_controller->gadget.dev.of_node = pdev->dev.of_node;
-
 	if (!IS_ERR_OR_NULL(udc_controller->transceiver))
 		udc_controller->gadget.is_otg = 1;
 
diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 044c31869cfb..35cf44025559 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -2889,7 +2889,6 @@ static int lpc32xx_start(struct usb_gadget *gadget,
 	}
 
 	udc->driver = driver;
-	udc->gadget.dev.of_node = udc->dev->of_node;
 	udc->enabled = 1;
 	udc->gadget.is_selfpowered = 1;
 	udc->vbus = 0;
-- 
2.53.0

