Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795416930;
	b=HUEFje0Y6+qKckpB8DFUUIau4UspihwDOi2FLrNYjduzfaDj0QYz4NAuWgZ1pK7FerOC
	 YQb8CDIuAGWvv7/B0Yh2q7vdfqN7LSIsRIXyh1gVmW7hQq7NUJVwGQeY/GTgSS37a2k2E
	 rjFYDf5jL+PxwqEid9mZi/xNJDV8GyEp5ymQ+yKopoGmHJWPav8hI9Sls68qvn0qAB848
	 GCfkK7HNbbYaO/1gwqc+vCsO9LzQxgYin162qju01tHe5R5ng7WrIXGdmdTOSzGUI1EMy
	 Dkq2pF2Aaaj1KX14pYcJ8zrrkh6yYpEIuSjzRoVWxOI1/Oh9RNJF/aUtTr+CVpEHk7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416930;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=7ehb2ffeeQuJE9D3QIhTk8CC01gvV6R9A9P0MLypKbQ=;
	b=oOvWb+icYlAt1xsX4uJEq0gHPmzcdNI/I5NFUI2izfa/E+YVuxyCf0OHCwCxDamM4Tq1
	 UgYzDRH9eciPBzSXe4gKENUWKJZPLnGS/oUxb0swm4o0JB/iVUbCWguKC4uvBbx3N3bMB
	 HMythU/Sl9a1YPmgU+IwrUgWjkLyW3zrdt1aoH2ZENieghqKAknjucxJT/aAHUwRt9Jcp
	 yNfwU8fxWMpUSBqdXfa74swFM9e5vbtE4e8RhkYxYBAUPcwvpCMgZ3idxuz+jqLXVQzF5
	 DgazKbjfk3k5P3Q8B0Leno5iVNsSUlkxy4QsGy6ZcFrApLTs84TL2LRsRVAU46o0FJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkPZbkYj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7F2606A33B;
	Mon, 23 Nov 2026 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZkPZbkYj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795416930;
	b=V5+6gKaEZDZDVP8JG94YBpdWZJydHQFwdJZljA9bdm3h6ABVQF1+ziKcsnkU3224I/YE
	 RRJ9o3bCerWLXLhrvYJwokByHTdDhTirh7OgOvSf6wNB6ZSI6Oe5z0Lr56W8uTbqPJ94L
	 8yb8BUnonTDL1sDXeowm7kXwVjN5YjUDm3VkdkHeQ2kee8Gd3D0/Av25fUNliAoIJomBp
	 OCgaZrpEJksO84IG/6vQMnJlxbtLoj9MEASOkM64vBkbnCp8GF3sr4P7ph6AyENOj75ZT
	 5GHM6nzbgWWZfWZxZbrvsN6sHblUe1aiKc/SSuZ/eqP8DED4ga+CCOd6y+XokVUe7/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795416930;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=7ehb2ffeeQuJE9D3QIhTk8CC01gvV6R9A9P0MLypKbQ=;
	b=TSBCN+IefpJaM8oqt+eb1ZgQZmhyrGde9RdRWtVajrLRy1lZe5YHk+ukO15JT1XjgYDs
	 miW09SOU4eoWNTaKG2UgUk3/HOZ+NKAHGDDNyHF+mjjiQ7SvqhegsEDIH2FYcAXwA1HaU
	 ePSsNXn7ICrnZwA3s9uW9vB70TyEq5FJyLF2n1zODY2K+QwPbj8yl8AYJvnga9Zh+tUni
	 640ALazk9nS+7+KJyW2MrW5HdQSqaRNt42Mu82TwSCB9XZJEfH/8YSlDnSHISt0I5PgXo
	 Zh8uWE1ZFAlAzzt2Lvp+aupkpQOy1g22f8luzJNW34ba7+8xqb/8oJT4k8fg3lMnBcA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DBA41F000C4;
	Mon, 23 Nov 2026 06:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795416930;
	bh=7ehb2ffeeQuJE9D3QIhTk8CC01gvV6R9A9P0MLypKbQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ZkPZbkYjykDMUIIDoFAasg97TNp0CLL9M3X+r6h0UXTje6hNJ656/1gct2epic9Ic
	 4nrSQbjgyS9akZ34MT2CKpxWagerTTB7iknSCyUrOHlU3HPQ/E3jfMCtkQXp7dLk4Q
	 VMHJiGbSAa6bZTXBLN8mG2m+bPaIkLb1bk9CS3vka892K7FarlsaaotQImNtS7RrH7
	 V2K6RNsp1JAQyWimFTgH2jLSJLn2VRDoCnPKg9ui90rf8eqNrip+aMx/U2qi7OzRvr
	 eQWQPxER/1tChK5Ok/OEtNMBrNpp0I+mxw6EM+vm/MOpoAdKyvU9Zg/OEdf/TFhDev
	 YM43L3ilaoBmA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CE84F4C3A2;
	Mon, 23 Nov 2026 06:55:15 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Subject: [PATCH v2 0/3] usb/phy: sunxi: Assert reset before deasserting on
 init
Date: Mon, 23 Nov 2026 06:54:06 +0000
Message-Id: <20261123-usb-sunxi-reset-fix-v2-0-4e51d3a64964@roadbobek.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf8Xs2TXdhoB68j8Mh7asshqp6QLBE
 P7dgnePbzIzbwblJKxw3s2QeBSV2GWw+x2E1nV3RmkygzW2JKIKB/WoQzcJJlbu8SYTNuSMMVQ
 Uxp0gL9+Jc7y9Xusf6+AfHPr1am20on1Mn0070tr7bxgJDQbrq5INHwumS4qu8dHz8xDiC+plW
 b4tySluzAAAAA==
X-Change-ID: 20261117-usb-sunxi-reset-fix-d1a0001440a9
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795416949; l=3231;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=o4DGixHbPlv/wmE6A4a2ry81udTO6L0xxBAxUf67t/Q=;
 b=MiwFtyzfknvO4YOvokSa0ZFcN0x5K4it0EctWcPSiBPfa05z7gGm/THCuR94ANntFQeEDF4do
 4F1EaYz6N7HCooIce+oMzx7c1k4KZo9IJKtQuYxIHB8iltqyWlqIm33
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
To: Hans de Goede <hansg@kernel.org>
To: Felipe Balbi <balbi@ti.com>
To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
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
 drivers/usb/musb/sunxi.c              |  5 ++++-
 2 files changed, 25 insertions(+), 3 deletions(-)
---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261117-usb-sunxi-reset-fix-d1a0001440a9

Best regards,
--  
Bobek Brzeczyszczykiewicz <admin@roadbobek.com>


