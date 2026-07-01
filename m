Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98371420E7D;
	Wed,  1 Jul 2026 23:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948956; cv=none; b=kfQDnKTkmIDzHfXdWhJyWSUCjCHIZoNpfCC2+RacheX83Yuz0iy9wDnOyQtemLegn3EWBo0EExtU1h1oL6U2kJy3+Q9PC6OeEVEGTV8iUDWyNqi62Iyt8NJ+hMHVAfSXlMdeoRxS6PcbuaiP05LJE6/9P/FOQttrImOj02XbnKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948956; c=relaxed/simple;
	bh=0FtTX79xt0EBYjvLtHUyDjYzFQpbVZRekVbSWXeCyyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQHZr4Tdxu7jVrZ4lIpwtuTqFRhAJac0c52vqpV4km/DLrMMYVk0/K3qeWWXxCc9PJiJ7m9jgIurNqFAxgdIZkqZrJ/k8MwSlcs0hVYvi9Lsfik/3qCTPIut8wMuKAxHUkUK0hOxEFckvo/fsQklarwcAqtBqFLczVfRH7Ask5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NuRFT/cn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NuRFT/cn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=0FtTX79xt0EBYjvLtHUyDjYzFQpbVZRekVbSWXeCyyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NuRFT/cn1yQQEJ/vkhStNIJbt+EU162wv8oSq7gC1LSBZWm0B6CeOX0K6mcfSue4F
	 otiNlvgLB4MTshk07r7H558UUCmOx7eLIkkbHR8VGFkAo6r/jj2ru3jL4f6my9d/Vp
	 HKpnk2+5nEunpr7UGnSMK4WNVtqhnOQ/5R2i+jBdi//9Y1/Lu/uSfy6BKKbISkam8s
	 M6XnsVjdaohV5Lsj7YA/arH2HpYkkTqtTNOsrFgpBaXLXWPCqpU+bXMrOO0TUXgjVC
	 cKUvvvKiYKfy9eJpvUDbMEvWKp08LW42nYWt7EQX/0qUgWM45yQOTPg+IJrfsfPATK
	 Jj1NPVrYCI8dw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 522CD17E1411;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B5194480035; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:44 +0200
Subject: [PATCH v9 06/38] phy: rockchip: usbdp: Drop seamless DP takeover
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-6-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2751;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=0FtTX79xt0EBYjvLtHUyDjYzFQpbVZRekVbSWXeCyyk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFN+QMIggPCzG/vFrBVmVQiKdnvHQdrhj
 HVN6CKTRwCDWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qagrEQAIL8vbIJuCTOKLgIxMmY0B7WFlfonb7pTMWGhlMl/MGeaeAJt9v3eUvLNKWUEz4sp7B
 tG6TGPMnMJklQHxn1nEJ+KOfL+e3xnp1KVwkO33O4eCwglBkMovykDZpUKUQzx3RKcw380Fh+zb
 GPDIfu+5DTMhf8BEYVclgUgttEhQsW22IfKFrZzK+k/J1YKjYBF1pcGLkkmEzuvmfTr/sKljlxJ
 Jv72P26HRy17aJTjY50SLtpzstI0yccu2dEUuVmEZ7X7U9/IbO6itNdwLW78VxY8nfdrxO4aT8t
 uBISw/ULpCfd5lWsq4GY6gNs6zNr4yYAtvQy/MhJHU1oucxz3zrp7XTrbVr5c6z1eMULPd1Rm9L
 tOLf5VxreD50Yh2kqZr48ICwbBZLM8q3xVEJr6uJyDAGRdAAPx0KYqvGjEg/S8kwM2Wa/Z/LKAM
 eEcyATTWh99alt4n+Jb/APSJYBNXZq+WsnK1wVcQMcFpdHQJWdPfCCIgv1bwGrxUF7lQyg0DA2P
 D1SL13dOhYBgkB1GsAIUmxHDXo1Jq6GRzPTEfTFjcgSHfUXdeFwxxOvWM4xplTN21Rs/fysqiPC
 /ppyWUKMbjZWF2p2KN6rPwTDTT3aswI7NnqsKjQvkWEFqJHSWXfVOnxvXk2W4wLLqWzOs2/COrV
 KaWRuSVSPu8HF+0j2RLMmuQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Right now the DRM drivers do not support seamless DP takeover and I'm
I'm not aware of any bootloader implementing this feature either.

In any case this feature would be limited to boards using the USBDP PHY
for a DP or eDP connection instead of the more commonly USB-C connector.
With USB-C's DP AltMode a seamless DP takeover requires handing over the
state of the TCPM state machine from the bootloader to the kernel. This
in turn requires a huge amount of work to keep the state machine
implementations synchronized. It's very unlikely we will see somebody
implementing that in the foreseeable future.

As the current code is obviously buggy and untested, let's simply drop
support for seamless DP takeover. It can be re-implemented cleanly once
somebody adds all missing bits.

Technically the VOP side should be disabled first to avoid data being
send to an unpowered PHY from the running pipeline. As a workaround this
force disables HPD. I'm not sure if this would be good enough, but cannot
test as there is no support in the bootloaders known to me and my test
boards route USBDP to USB-C connectors.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 3fc8222fcaec..d73455370113 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -926,6 +926,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 
 static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 {
+	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 	u32 value;
 
@@ -938,10 +939,14 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 	rk_udphy_reset_deassert_all(udphy);
 
 	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
-	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value))
-		udphy->status = UDPHY_MODE_DP;
-	else
-		rk_udphy_disable(udphy);
+	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_ALL, value)) {
+		dev_info(udphy->dev, "Started with DP PHY pre-enabled; seamless takeover unsupported\n");
+		rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, false);
+		/* Wait for VOP side to shut up */
+		msleep(100);
+	}
+
+	rk_udphy_disable(udphy);
 
 	return 0;
 }

-- 
2.53.0

