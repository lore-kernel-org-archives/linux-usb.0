Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795615851;
	b=MKkLxmG7HqzoXC1CmdTe15cNuiC2epHtzbyuSnB0oc9hKVVimM+WPpGcN+OOLOsXntLq
	 IWsWxtHcDGDH3Jsfy7MmgVakAlOT9YBsZUj/H4BfWAXPrU4W6O+1S1v5+P5R0P9e5lMQY
	 HXNGkdBmwFkmX7bV/sLbkuwEu8149tVObMAWCjgeSc1ncsTZ/OwIkCCQSnk6QfciVFPdg
	 CuRDzhjkGPi8v7TvvZkpNJipHaaJcmETQClhGPU/1QGyK8v5xZV2Gj0gn4YX8ISESQ1Aj
	 AcpcQGx7wPoL/BXo4gF/JnIpFe0eMoCz42pH+QlMzfPecFrntmk9pCk5KwR/i1HHcOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615851;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IE+F6bD6mEvp/w/Bo7pX00NCaf7s/Wh5lrQJSh4d3F0=;
	b=fQks6TSJM8DQSo7t55g8sUTfHOssSyXpN98C2s1/Z3PFf94uIuZbUfaXixrPYrK0st5X
	 uZmqtJRjhy9kwUh2tfuRjcZ6LcYIHSVBNx9FMv5ZjN5mT2AoDjQugFPTN6FRbvMrYzhZw
	 rCNMigMB2XmzVLvbXMP6Y4NazpIS1bdf4C+JwJ/exz8mCHEghUB+GZfI7KbepTNbDPOuZ
	 KLlU974bhO4iydrOBRX9gt8rSHsz9duHCrUoMMH9wi0XOTJ91zyH6zefC/LUxcCEC2/5S
	 Cl0mffJL15MYzMRMpkJxPUBVGxCkMXgWJl6v1f66/DaDHfF2lj123pd1hLEmxndg4bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e/HeVJrV";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E3A606A32C;
	Wed, 25 Nov 2026 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/HeVJrV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795615850;
	b=z06EhIYggADBFDHRgBqJESL1s92/XyezL2C3Fus5rb9M/M3vQGveM6/Zq/gcIip3NJiE
	 aXX4j05PxCAuGWPTFSFBkBgE8gVsTtUE0VUUIKOhXn2pjAUiBD853TjaCuHAJlk9DS6yV
	 rF6j72ZSYcJ8Hh1Y2LZUtV/N6cOrP/tiM3a2NRtn/tMUbN+NYj9YP+DmkthTU0ZUZYkpM
	 7CHA5rdkqYjUcAyUbTvZ681KaRCkE08DSpwKc/2PHHOwMczWOHyvecEBooaaWmPJwjnD7
	 2Db9qD+Jxom4tFUNrwL/0TLm2s4HOyvdovTMoAJ+0QjWcSNMfev/bEdq7SuDmknqTCQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795615850;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IE+F6bD6mEvp/w/Bo7pX00NCaf7s/Wh5lrQJSh4d3F0=;
	b=05r/q+jnCLvpBXfwTeaxvqGWbafQvWSg5R+Wivde6Sxm6rRPGtHP8o302TMdrmJ7jjSt
	 xHoue/b3NfJYpeETxDWTxYJ+Yeer/5LYdmgLyPYTUs6qC07api+n5lgeNLCgcZzhQBMSb
	 uhIfKx27pDWTIntSr7H1TUAmlrw1izLG9jcXoQ0noHjbUAmglbuZXPpoGcoD4pbiGk3x8
	 TufPEsvvg1R5mxhuFGKT5EuQH513JDbC3D1fC7GfA+UEL5JCBkPr6xa6lBbNKQw7zbw34
	 l1VVX0WN8dj6IdYWT5qvkgxYHbkPeJc8jwDjaIs198ofbdzR3x6TtkMGOACQ4+zylTQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FFF11F000D2;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615850;
	bh=IE+F6bD6mEvp/w/Bo7pX00NCaf7s/Wh5lrQJSh4d3F0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=e/HeVJrVbGYOa8GXSL2oElmRUvH2EGgbODlGAjkZPQHvaY/shUS/z8v61L9z3u4Kb
	 I+DrR9FiBB7AIqnbS1VWYRlswmPv1Vx4C69uhnW/AwMA9nUEtHpGYe1djLJe3TBNr5
	 NCMJF5avLWbiuzePJWtjFrvDChoSfUAoCkKPgl/C/X8Y2PhU2dC4VEvi6vrSVviUjd
	 WANRmIK8cwYfmYJFz8AkK8LDUSGvUwK11oDsoL2h2NeAhSKBfleM4w4xGDg61FhW+x
	 +AtsMIMlS56n0nfZ5KCDwP/9H6PbrM3cw/+T7H8jwMKZczegNN9TXXtEkAjIEx4wR4
	 h9d2/n0WgFY4Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 09A024CEF2;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Wed, 25 Nov 2026 14:11:17 +0000
Subject: [PATCH v3 2/3] phy: sun4i-usb: Assert PHY resets in
 sun4i_usb_phy_probe()
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-usb-sunxi-reset-fix-v3-2-855c43694f78@roadbobek.com>
References: <20261125-usb-sunxi-reset-fix-v3-0-855c43694f78@roadbobek.com>
In-Reply-To: <20261125-usb-sunxi-reset-fix-v3-0-855c43694f78@roadbobek.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Felipe Balbi <balbi@ti.com>, 
 Hans de Goede <hansg@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795615875; l=2483;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=LiuKo9Ttgw8d9A6ryR0X7JCOtqPXd1JaEy/qalojwDQ=;
 b=gdEBaetcH0wgmM9Sf/Iy0fQmkG9aFmKrFH8hzHGPJvYstHT9vdotV/WmZmDZXHsPQyO+VUjLs
 /aOifbZsNShA5xRtDXcjfQurRB898fS4x7u45ic1jEpBfylzmN36f7A
X-Developer-Key: i=admin@roadbobek.com; a=ed25519;
 pk=TcWSTwITMylwCZLYbw80sv2LQx1zButqiT90TFVvhas=
X-Endpoint-Received: by B4 Relay for admin@roadbobek.com/20261117 with
 auth_id=1548
X-Original-From: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
Reply-To: admin@roadbobek.com
Content-Transfer-Encoding: 7bit

From: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>

When a bootloader initializes USB before booting Linux without first
tearing down the controller, phy->reset may already be deasserted when
Linux probes the USB PHY driver.

Because reset_control_deassert() alone is a no-op on an already
deasserted reset line, stale USB PHY state can persist across the
bootloader-to-kernel handoff. Asserting phy->reset inside
sun4i_usb_phy_init(), however, could disrupt active PHYs on SoCs with
needs_phy2_siddq (such as the Allwinner H616), where PHY0, PHY1, and
PHY3 depend on PHY2 remaining out of reset once enabled.

Request exclusive reset controls via devm_reset_control_get_exclusive()
and assert all PHY resets in sun4i_usb_phy_probe() before registering
the PHY provider so every PHY starts from a clean reset state before
any consumer calls sun4i_usb_phy_init().

Tested on an Allwinner A33 Q8 tablet (Laser MID-786).

Fixes: ba4bdc9e1dc0 ("PHY: sunxi: Add driver for sunxi usb phy")
Signed-off-by: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index f26eed0db17e..a62558124d2d 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -787,7 +787,7 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 			continue;
 
 		snprintf(name, sizeof(name), "usb%d_reset", i);
-		phy->reset = devm_reset_control_get(dev, name);
+		phy->reset = devm_reset_control_get_exclusive(dev, name);
 		if (IS_ERR(phy->reset)) {
 			if (PTR_ERR(phy->reset) == -ENOENT)
 				break;
@@ -855,6 +855,25 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 	}
 	data->num_phys = i;
 
+	/*
+	 * Assert reset on each PHY before they get deasserted in
+	 * sun4i_usb_phy_init(), in case the bootloader left them active.
+	 */
+	for (i = 0; i < data->num_phys; i++) {
+		struct sun4i_usb_phy *phy = data->phys + i;
+
+		if (data->cfg->missing_phys & BIT(i))
+			continue;
+
+		ret = reset_control_assert(phy->reset);
+		if (ret) {
+			dev_err(dev, "Err asserting reset on PHY: %d\n", ret);
+			return ret;
+		}
+	}
+
+	usleep_range(10, 20); /* hold PHY in reset briefly */
+
 	data->id_det_irq = gpiod_to_irq(data->id_det_gpio);
 	if (data->id_det_irq > 0) {
 		ret = devm_request_irq(dev, data->id_det_irq,

-- 
2.53.0


