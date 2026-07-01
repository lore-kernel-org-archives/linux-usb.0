Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1771421EFB;
	Wed,  1 Jul 2026 23:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782948956; cv=none; b=dYlg3Tpmx7humRQ79qYcK4jXF0azqH7Ok9AlA4PgKw/0m76gI3yMS8tO3kz3YvmVHaHJYou/MB6urmCbYPzFpGb4z5kcjsfFfUBXJogLK/hjIda5hb084KbAbFPoh4MmQP3lqYylwqZdX0zmr6jkCBCJSgbUCR3LKEnk/DXBHF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782948956; c=relaxed/simple;
	bh=+YRPJyI1V8oNPkbxLLhcwim5gCsEu0UcFX5g+tdQNU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXuKyihl0XgcylAxRQrwXOCLebQJbe1ME/MHj+9zn6n1rVJFQm5af+W8+IKQmpgC9XMmVZ0Qeh4/JxwJONlkPIVAMkSF1beaeGMlTIXmBzwbUlcMn6I567nTxAAL6lfk3svNWAy7W3+PDgByeExYpXhsXjCv/lhmZLNAfqeFjtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QDh2xTKb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QDh2xTKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=+YRPJyI1V8oNPkbxLLhcwim5gCsEu0UcFX5g+tdQNU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QDh2xTKbPq/rwzI4ArqPloCgjYsrSvdcAJThPpyAfQLHAd9R3Y8jv9+1gLjYoq7us
	 l+we5j9dUTx26du/MS+7Rjqah8FCw8YEMNgAkbXeu0EY9+gZ/IUUSiFvz0+npu/Yzt
	 aCxiMnGLt6MpFD3HeXxsYEEbQKao4DvtVDhTlDZWOgHOW8dkEVY/qjVpkGtwX+TdOS
	 dw19hmNL3ZZsuJBK+C+v0NbJBcpMQyBhdkVDlJn9wFAFFGg1DDENi53mydJXJztwgq
	 DxDRhGtE1TRPWS928xpOq1tvIraZgehjeAzOCVbnh+JPwg7PloFQpBuQZc7FVEQaHb
	 hyDJ6lgj6kXyw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B55417E15A5;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B9A3A48003D; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:47 +0200
Subject: [PATCH v9 09/38] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-9-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hEuJtDizS20fyTE+j+LEHbrRcnH32J1MUDI597yISUc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFOfqEVg3dFDtpeVCKDLjpfuZWiJ9ZEiW
 SH0E15gBWfF44kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qa4Z0P/jAOopK3jHpNLZwR6v954tyqH0evvyHHdyCjZbKq6lzYEukQUexNux120mXZ3EpWCwP
 DDbKZCgJmfvtMgazW1VPo3PunKo3PfuivbDGPrQG7bnnY3JC9GFvfX1xdlNU/YllFJWNxtiVPs6
 ei9ZqkQI7Gqyqazm8Es3fm/ptDQtkRomFhQ+/lQtfdc3FVlX3HhCmezL1Vjx0nP1lyHnurfToe9
 Y02hyunPII3TTciS7fFXDMWhavnPmKS676kQmxs0D9G5XRbTjubGx0SeBGTVl5U96N0f+yijknp
 hDILpdQO/NHZyVe/oa9CRfdXjTPU+SwvXJsYP7BrrvBvK4tT4rC7h1M7AKWYhsEy2M12GD2b+PK
 tbHo8cnv5/yrvxj1HtLmzUgkt54OZIEilDuHtMijO2G+NDxKE23q8+QhxZ+AwExTQ8jPhNqHT7F
 6NVfCs8nm5s0JiBsAb4uKRqx+G4KnxqfG8TVh74Jz64RNsRtk5UyvO+A6T74RJRW7wu1Z7VCvGK
 BO2OXUWVMsdj3Sj5kP2HJOjqlFkHd13wOHhqEf6G5ij/4dSx70Sqr0ee3B4JcKkmbHXr2+6Uibg
 h72OPnFGdj91Y7skXGlB8xmO3r7EydZ7koENWV8uRX5jHqCu6ETR6BfpoFDKp7r7iJSy6JsrlIu
 5v/v44tCd51/XF0l6sFU5yA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2b27fd1c15d8..923279ed7d77 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.53.0

