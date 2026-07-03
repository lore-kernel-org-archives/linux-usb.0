Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908F4342173;
	Fri,  3 Jul 2026 18:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102426; cv=none; b=p66P6KO4v76pyuL3GvBX6teru6UQwfHcmhVUplPr802aZWwWmrJwESG5XodT9BPu+zNb0Nth2x8B0kcJWp9/l3+GnQNUmPhJRRD6jziS1D9Im3OVlFASDawrNgjeOtPKSBkeAVWotF0HiwpPByOoD7zQ0EazXf8Fe7NkGiMDc1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102426; c=relaxed/simple;
	bh=nNabXb7+d3HWQH9yCa5mK5jaajPWOTcbAFCNHhwwXnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GrQfWox+J7nXor/TOA/8jSiAv8Uddht5BHekkY8+HD+P+sFqRwZG6s70u673jW7OK0wYQyk2NbL0U6UKpDqaMEW7e72ELxfgLzat4khx0U1Wp1TQkUUs/yhrDFfRgzFqSfcwFqnsLprMr79OYOqlCLE41QUo1i7rWRMrjY1Le7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=L/DUEvDz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="L/DUEvDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102414;
	bh=nNabXb7+d3HWQH9yCa5mK5jaajPWOTcbAFCNHhwwXnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L/DUEvDzWUfGUfj0V3k4Io1iDWHYC9ZeBdd5liYK/6S/9PVseZXc/n0RbAsmf2wu/
	 VG9/izPQkmyUjOqaHMktIPSsscUOo3JbflhB0R9S6AQ7zOD5k02sGrJBv1jgjCRrV4
	 nhT43uu4opTs6JotagJMrxPazQKLjpFSKOfXcDwErZ1YklGBcfl24o9K4Htecl3NKg
	 I49T/n3WIBEddIK6xy8FS5pPq3XAfQC6BCRtfOvnY6XYXruJfe+epgF1b4RxHY+ayv
	 NBhNFt/DyJQCz+b8t4p3a/3g/+ZodyWkWeymwbJO+gt/1lVRqfrKF9in7aXRmqtqwF
	 4KX1VoqaPjhXQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A6D417E15D4;
	Fri,  3 Jul 2026 20:13:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AE43048007A; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:51 +0200
Subject: [PATCH v10 35/36] phy: rockchip: usbdp: Re-init PHY on mux change
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-35-a392711ca8a9@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=nNabXb7+d3HWQH9yCa5mK5jaajPWOTcbAFCNHhwwXnE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8yAeElFFDwQw0yVAlA1R7n8/82dTN1XL
 HunMKF9fZQUSYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qa2tkP/07PvK2HiW9DgQ8X+O+pHl0Uxpsd7mmXJO4UFhqa6Vp63SlzowkYawd/zZNz1t+J0dy
 KgFEgDkVxl6ambfH+m9v9pRPp+vLdo2QKWf3HSakHLoHd4Zwi3SSkOAjYIS5XLUS46aBLjdHpIM
 ggqmnsloGsFxN6WwpfipjD+eXT/vDKPCfz0WOfb9epcN3kpLCaTS4st8wY6OMWkAIqj9MxgutgS
 PguquDfQ9WyrgM99g78ec1wOlphatUuacQkGcJV4w1WIuqfSqjh63YtEn0lhpgpic8uGzzP8ZCJ
 kexSKSAh9WAKsbdycZLLhJmbh3zrkaD8mElxEY2ZgJDO0W8ksUokHSvmCLiDLlfvZXYRpEoSRhY
 WMv1SQG0TD9EMihqo92fb2mKuodD3LFb0ckAeqw2mIvv77mg0T8iE1Jv4bfWoYFyMl7c8w9/IDW
 oPbH3GdftK3R42KJdivlZ0rU6CAldf10+zR4M3uNmURiGThnue2sAS4U17FQKLFhpSKLVmTCe7o
 lEXu2qf9pibjoqb2OSVFr8nnI7tVGE4BA59ShegkeQ9jWqQW3o92j049gPowO2/8wRSNBAEat+3
 APaJYH27SAPTgvU0MFZS69BfDmGmMu/P1QTEnexq7FVP5XqYWl67lFyFzOvaDP42Xkb1BZHIqAS
 V5FqI+4k/QwXBWjk/wlYv2Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index ca9418fab8f3..6eacbea6839a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1379,7 +1379,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0

