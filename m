Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9969633BBD9;
	Fri,  3 Jul 2026 18:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102423; cv=none; b=Nz5sfqyfrosDPgN0YZK+Tpq1xXSfAraXReceXDEaW6mHdZe6L0fepmeangv9FJK6C22VmQovBAik2rvC2M53f7dP87za9P4h9nVhcAS3ZE/BvT6l0LRzJ/J1RmKhSFZzmpBXpz1KVFH6KyrdM36HPfNBx14Q2g5qLflmpWa9gnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102423; c=relaxed/simple;
	bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9TnOv85dax5x/4FlbrGL0XDWYDnzwQhJRaT0QwtHTD29xA3cwumAxEobK0TKrxbBN+QFt1XLQTykIqHYVhVKW32v8RvvvpybRWRaPksPBL54Nir78AH6Kwhq1kUld1qMTpugVNqbhmJNAEwyp35hukYddwpDaxbIZTiExiLGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MgN6sIGK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MgN6sIGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=AyMiIrxEFIKqV6uGqRNRCgp/f+R94tkSUd/pjFfr5TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MgN6sIGK0tCVQ2xQ55FA6Cm7ivWrpIU+6ZkHJlBcNar65XK9R65EsZ6NGLgRw8Dk0
	 h4aq6iB05hHT0bVhAEdyQ5yr4UO4MR8BTK9+Q3Zdg1gmUjQi0HSWKEQXnN594t8ReZ
	 nqAMpDzzAA98apaGvs31Z8TUP+QYv1ynnCCaphfYof0Vfnyx2dSR96mhzqzKfHLxlP
	 0lXYJXHU8ZpWt6nhWl4bjXLKIySYsnvSWBi6qBl6bd3wTPiwf1RZ+iKq3vBAy6Z1NT
	 aQDHtDa0xRZZ34mnVIygGD5tOyF7sp6hd49FbJ0WUqyQIt3FuhVhDXHFDbBfBRypYx
	 yIQdF9oF3WZxw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A16117E1514;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 96009480065; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:35 +0200
Subject: [PATCH v10 19/36] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-19-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8vVkygv1HPeNfUXBZlYWA6Brj4EPAyH7
 jdjkZEhxhG57IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qaAOgQAJKyXa3chwi4agIMaDawFCzwr5vqOZkHs5N9Ah2svuUmPPei5hDwUbCjGib7KT9vw8l
 v2jUfvEg1ccM7EHdldp3OS820qo0Zcq1qGUXqOZfbvu41M0qmc2+DUI3FrAvUZerGeKFhBEGYV4
 NUx5VIfeO7BbbGKTUkGnjyMHi+7x2wdKOGzqBQ8oI7VRJ9SzBFI7f5k8smNt8V24qvrosCrBKUv
 H6BjYxhDgqn8cD2sQvzlwJHsVeh1XtWXOEqkLqZqUFNHOi9UW1v6GY94trX7vJbCWhSBsWIj911
 m2YcHA7DLAJL6B8z9vin47sMrN5QJ37p16IQTANkZw0BNMsul2uRbmOdRGVqjjthKZ6sxtLfKtU
 XCHw3UES67n3TvzZ5DSghQFSbEvck+S7QhY9q/o2t3ntk0DRgRdra0qVLhkoRhkpf42otvAdQiT
 d5xkKNDn0qr/SolLmNIWs9+L46A/lqzLBCAg+7uuinFR/QvCZvhS6hfjWIL0/AOtjTDtoI3F6ye
 bj17Yn15Kgumq9B1cEauNRcwXRo0uZWFtFbaFKzcw14++rgzuK9oL+SUYigaGI94RMD4iAVO9Tt
 qh4pl9zhl199U6U8izTYzQmniZfwLn5gRQIzKetUngwmeEijI/VSs4ipF4hHnUn8lc6CnGkL/eY
 o7qvqZ4/0p5lHzQbLP2Ar1w==
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

