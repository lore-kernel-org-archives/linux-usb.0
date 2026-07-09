Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5033C5845;
	Thu,  9 Jul 2026 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623761; cv=none; b=Wr9k14RLp3xdpHB7LNJoS87Curlg3+xc6tW5Xx+NBmYjgocCU2SggcpAEcmN0dlF9E06M5q3Y5U0H15z2GkV0d9sCuj1TnCkwDtoBU9lv9eAa0ZSxNFhggcnYYgIYfIjImL9Q7sfpnp/C70H0PxH/QoMO76gxP4YGbFlB+XFlgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623761; c=relaxed/simple;
	bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jr1NPLxANYbB/1jEkau1ind+/NRapqXm4k/qrd1qLdc8oonjoa9p41d/RZlv28FEbXKpTKSocSmKDdXNO9anuViEt/xT4ZFWWw33F2ng49ziZn5Dbrafgy/ll5EUcghWQgEZe1I3sqekGrH0brHkgOHBEVZ9d2SF82PUJyJE8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RVM1jgzw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RVM1jgzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623750;
	bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RVM1jgzwtqQtAXBiMDRV0pxyJYYDBL5K6vAS3yCpxVSFTTootyH2vgTCUBqor/cek
	 XL8dh+L3qHQn3dMZ883MkIDtEOoXc1nlxjzfqmx5RKajukK3+lGtlB1BDxYN4u6whY
	 PVrF7mxYNxed7q2quCUMwJWLQTBIaRCxePZvG7rOgqUqYcRU51O/+nSj8hJ5J9jxF3
	 j7ysuojWmi1ZNhu+nXR57O/DmAMyD1Oc0rVTP7bhwLu0wFN5Jtxm7K9WBf+HXE9RPT
	 dTwXpSC/1BE/FBRPSgiUX8n6BKi6mDXnwoF3EZzLgKyCcOAZs9bGu9lTlZCbVLcl2R
	 I+ZStwsl0pz1g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE33917E101E;
	Thu, 09 Jul 2026 21:02:30 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BE81E480065; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:42 +0200
Subject: [PATCH v11 19/36] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-19-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8ERrLE1cxL1f0vra7CZ0nbMrlvbHUe2Or
 FUyNz56HfWea4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BEAAoJENju1/PI
 O/qawUcP/2vg9O25p5cQ9+EwlLOvStbFON3dr6bfk5F7vo0sGvlVofg9BIsqbi16+37wvw5IoAR
 +xK8v3T5yt1aXgMrOMiFOxz+x6KhcmJ6jvX6mkMCPQyrzN1LJFSRSlkmkCLDlgMu+Mwn7SmgFy3
 1qcEPNlIEQGq+h6HCSGGDnc32FriIgc0ualnv2rKKaoBs3TStUuhxeH3OA+oc+tvUhOp07FbAo8
 FO5NPSTSCvqSfYp8plCmr7iBgvalg5PHNnCE84+Q7CdR68QboU+Rk/EoggRTep/9NNcHAEHImhH
 I8rj+7NcEduZdCT54FgfZv/lOYsJ1g9ht2JeL3BaeLhRY34mp0TPuEDR7Dr3la44TSAKA4NXpMR
 XQ0edRsBmpK77Ulvz3RVnzu5iognFb8WECvEZ5hyp0B1NJkw8tzcCJ4EKqq541Hn4jmjUcQLb76
 R8E8CoyDVy9fSm91Y0Ki9Ac38KUHQCCc0YyMzKkYapD3dlBNcBF1HnUJSoEGM9azx0tqbIBhliU
 vX6A85MhQeJNj2kyADNWHs/7JqlhpVQNtdgWSt17O7hUl+F1AtFPQ5aIwMSmgEygpBjkYBaq3Y7
 Q+iTjGjDMDUsL04qhlBN8itrDuy7DLd8FCm2gvzy6l8nO7vd2oeZ0ST4AryxTR0inrHvgDS1U/9
 HZ2tiYL4b9zY8I+CUW3Im4w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Changing the cable orientation reconfigures the lane muxing, which
requires re-initializing the PHY. Without this DP functionality
breaks, if the cable is re-plugged with swapped orientation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e44d19c9d119..4b454798c4ed 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -620,6 +620,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	bool flipped = orien == TYPEC_ORIENTATION_REVERSE;
 
 	mutex_lock(&udphy->mutex);
 
@@ -631,7 +632,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 		goto unlock_ret;
 	}
 
-	udphy->flip = orien == TYPEC_ORIENTATION_REVERSE;
+	if (udphy->flip != flipped)
+		udphy->phy_needs_reinit = true;
+
+	udphy->flip = flipped;
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 

-- 
2.53.0

