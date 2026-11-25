Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795615851;
	b=f9IRk3alF01SkurgBXcwFy8u4SOyg9RuM14JcVBPjI0RScwwTve/hvCA5s6kMMPn1o7H
	 ndNpmBNRHxvB+/PI0x30xr5zIJWRdaSO9J8H4H3z8UyiobkIwWxsgzYWhMDWMmH1FnNcO
	 rSLCpY4vbsPWSs2DJ6uJcN1p/jIA4x8IGTEAACGDdPidBUlkQqbLGbkTWMiTSgMypbd36
	 7Qk6OPHA6MoyJr+qnEaImsd8GJezsBSmg1j6mXIXTPIvfPjfUDKlbmu3wT/CnyCrKLG2J
	 VtZYaTSNBjMeyR4KBJAE15WqSBZAKkIwL9GgHNJ3ItXuyCwR4fgs7NIDPMNEZYapc1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615851;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=PChndsEgzTuc6MollblncHW1zocUXGHFMHqegRmGWl4=;
	b=CwKkaTm97NpkDz+o6wPiBt28WUtcOGMgiGa+hEcMdaEQWsNYdM1FHS1t5a+9nWzxfEWm
	 f5dH9U2c4NShzXngIFFb4qA1dpxULuMc1kVBx6OuRO/MVvchs2AHxE+/eBQ5ODAPgmMRq
	 DGlnQ1LBGorNhupeZAk1oQxdTLvYvdQjk3OQCtgNirFPDVP2qB0k54eZGTFtzcvb1m/tA
	 eKpdCyaamlpwxRfgrmwwRxURSqzktr+EC4Kxr9ABPzvxWP398mqvH50kMtqfgjrvQBzLV
	 W3QTvPUiRYdhwqYgQMdnDD0yZLuMXHL+wYId8bBTJa875siqrF8QNf6nDJjRd95Y+5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3d4HhJ4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D98606A31E;
	Wed, 25 Nov 2026 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k3d4HhJ4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795615850;
	b=CCmQ8MiIAJTeMz2oHqizfWykRSyaLOWLBhwcHx1YldisvTkh9PkFoFTDOgL0gFGlAWE/
	 7oY+F6TFh1dWgTwG0Y4zG+L/ZhbTWa4A5VCJ4dU/sBHfBFquxSft72vu9W14xHVif15dc
	 G5hYV5XToaWRYa/MQ6eGu0Gi0TxUf7++5gHLUv2rjMWWdsCIzMk/v/ud+cAuqtrOyfeCD
	 HwFB23fh+cXPtrl4WVIJiMX1fgMKUaWnRK7adns4MsqkxqNpkBtT5J+uTJ9HX+9tEY+YY
	 I9Yk/mjvYVJC6nGa5Zy17h6EYzUQm/dte2uIJtXZ6+xtLXyOwsyO/EOmjHW1B0aMXLw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795615850;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=PChndsEgzTuc6MollblncHW1zocUXGHFMHqegRmGWl4=;
	b=tG6UgztIf6jvO/6+Ry/Xdyesjxkr26KB6BCXvPiXNXlrfyKXD1G4woMcFt9TFzpzwG+4
	 JPuAcEI/B+/WSaKAtU0yn4QtrAFtTAKEcDNt8rTNLcV3yL7yDdBNnIuoYX1Aq91SJpkle
	 +672i/YOTponz15IaqK7RBvyud24dMNy0UE5VxCkUymyiET+rShK7JaXSJmXL6/alclG4
	 V97wo4rEWh+bV66FIAzqCa+188Y2tVT2V+WnxYB/YT7SgdVnleZ/uBhxIAgUWjh7MUhDq
	 hgmVqPlfJqe62uBBsxfZUQhyOYNo2ueY5Me2IalR/XJR//Hrar/dbrKMNkjQCDcWmiQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 663191F000D1;
	Wed, 25 Nov 2026 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615850;
	bh=PChndsEgzTuc6MollblncHW1zocUXGHFMHqegRmGWl4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=k3d4HhJ4Pof91Os5YP6vJQ1C2MuFZZYct3OuNSzivnv9s63MfQgOFQ1iq7PRrOVrI
	 hriPh1j0jfP8AJq6+efuWvdMXh7l4slAwvP/5tBXIpntC767VlexgX9kJtwKVUBzQw
	 fyWikPHVqyzpRuR2RlJwg1m8OfE1MuQra0cF5FfNCrGtsZaKXIAn554Bk+Ms9IPGNU
	 fJlMz1ClTA0A53Jv06Zz6Dp8gZfMUugMS+PV8tWq3PrMEnEpwjcF0cKqIMnB4k2YAc
	 BcKwZRT+Dh0U7BhvM7X4IglZNzPEyojgdXghqXQOBwe78XaS88un7x2JJ3OKTEcAS8
	 gFX6Fi3v3djvw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B73CC4CEEE;
	Wed, 25 Nov 2026 14:10:38 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Subject: [PATCH v3 0/3] usb/phy: sunxi: Assert reset before deasserting on
 init
Date: Wed, 25 Nov 2026 14:11:15 +0000
Message-Id: <20261125-usb-sunxi-reset-fix-v3-0-855c43694f78@roadbobek.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ7CIBAGX8VwFsNSpNaT72E88LNaNBYDLalp+
 u5CvRhjPM7m25mJRAwOI9mvJhIwueh8l6Far4hpVXdB6mxmwhmXAFDTIWoah250NGDEnp7dSC0
 oxhgIwVRD8ucjYD4v1uPpzXHQVzR9UZVF62Lvw3PJJii7/4UElFHDdS2R4U4gHIJXVnuNt43xd
 1IqiX94ePXbw7NH4BZspaRopPj2zPP8Ajai8LQUAQAA
X-Change-ID: 20261117-usb-sunxi-reset-fix-d1a0001440a9
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795615875; l=3498;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=+B8CLcwaE8CfSA+NkGkpTmSXXtzNtTtQgGGXSeGISc8=;
 b=PVQl9NNhVlYgrt+BFNS0PQjwG3tLirodfZuRu7QGB/C+s4Xn2tBpeTy4G1/C/3Q+BnG3vXN5S
 Bn0icsaIpxzD7TVWdLGZUgePtf4KY2oyLplJbgROK28EJ4Oo0EtN0HB
X-Developer-Key: i=admin@roadbobek.com; a=ed25519;
 pk=TcWSTwITMylwCZLYbw80sv2LQx1zButqiT90TFVvhas=
X-Endpoint-Received: by B4 Relay for admin@roadbobek.com/20261117 with
 auth_id=1548
X-Original-From: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
Reply-To: admin@roadbobek.com

When a bootloader such as U-Boot (for example with
CONFIG_USB_MUSB_HOST=y) initializes USB host mode and boots Linux
without stopping USB first, both the MUSB controller and USB PHY
reset lines are already deasserted when Linux probes them.

Because reset_control_deassert() alone is a no-op on an already
deasserted reset line, stale hardware register state persists across
boot. On Allwinner A33, MUSB stays wedged in a_wait_bcon with
DevCtl=0x99, Power=0xf0, and a frozen Frame counter even across
hot-unplug and replug.

This series ensures both the MUSB controller and USB PHYs are reset
cleanly regardless of prior bootloader state, and fixes a related
PHY2 clock reference imbalance spotted during review:

- Patch 1 uses devm_reset_control_get_exclusive() and briefly asserts
  glue->rst in sunxi_musb_init().
- Patch 2 uses devm_reset_control_get_exclusive() and asserts all PHY
  resets in sun4i_usb_phy_probe() before registering the PHY provider,
  avoiding disrupting shared PHY2 on SoCs with needs_phy2_siddq.
- Patch 3 fixes a pre-existing phy2->clk2 reference imbalance in
  sun4i_usb_phy_init() on SoCs with needs_phy2_siddq.

Tested on an Allwinner A33 Q8 tablet (Laser MID-786).

Signed-off-by: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
---
Changes in v3:
- Check the return value of reset_control_assert(glue->rst) in
  sunxi_musb_init() and jump to error_clk_disable on failure
  (Philipp Zabel).
- Link to v2: https://patch.msgid.link/20261123-usb-sunxi-reset-fix-v2-0-4e51d3a64964@roadbobek.com

Changes in v2:
- Use devm_reset_control_get_exclusive() in both sunxi_musb_probe() and
  sun4i_usb_phy_probe() (Philipp Zabel).
- Move the USB PHY reset assertion from sun4i_usb_phy_init() to
  sun4i_usb_phy_probe() so initializing PHY2 on SoCs with
  needs_phy2_siddq does not reset an already active shared PHY2.
- Add Fixes tags to both reset patches.
- Add Patch 3 fixing the pre-existing phy2->clk2 clock reference
  imbalance in sun4i_usb_phy_init().
- Link to v1: https://patch.msgid.link/20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com

To: Bin Liu <b-liu@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Felipe Balbi <balbi@ti.com>
To: Hans de Goede <hansg@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org

---
Bobek Brzeczyszczykiewicz (3):
      usb: musb: sunxi: Assert reset before deasserting on init
      phy: sun4i-usb: Assert PHY resets in sun4i_usb_phy_probe()
      phy: sun4i-usb: Fix phy2->clk2 reference imbalance in sun4i_usb_phy_init()

 drivers/phy/allwinner/phy-sun4i-usb.c | 23 +++++++++++++++++++++--
 drivers/usb/musb/sunxi.c              |  7 ++++++-
 2 files changed, 27 insertions(+), 3 deletions(-)
---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261117-usb-sunxi-reset-fix-d1a0001440a9

Best regards,
--  
Bobek Brzeczyszczykiewicz <admin@roadbobek.com>


