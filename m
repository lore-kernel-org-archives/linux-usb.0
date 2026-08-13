Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F7432E8E;
	Thu, 13 Aug 2026 20:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654322; cv=none; b=kCL2Z4qMjJbsdDXr/wfErhMtasRQXHbOxl/s5M+UC98hoZefZgdDJzQqJmO7lWUYDPEdAvWVFyl4Vyza1JhtSF5Cz0e1VXjg4uzouFL359POd2PR/bncBgijwBu1I/q4umMXCNd2OIX8h52K+ieyLhvhXd0suSqWTxk7KLCqg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654322; c=relaxed/simple;
	bh=F5HBTNrUTZP99GdpFwb2DnCb/PErZaXCXmFP4cHspV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1IUJ7MHnQwV6YQX4bIpJjXNPmB4f8PqIgnthz1lV7mk6Q/cx/FUvZ7xiMEr5gcbGV/60/nzCDHt3LiQMcHOgrTyLyw6sSa2CsGtRbyjJhAQwMi9DXe5LVBnNRTtmPh6zHQz7r/LGbA9eA9KhZTM52xBgUrXbtywVoCW5Jp9VBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=km31wucK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="km31wucK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=F5HBTNrUTZP99GdpFwb2DnCb/PErZaXCXmFP4cHspV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=km31wucKwNzGWmXbd4rLhdZOO/tYFvQiclee77qWAlTk6UlATX9acYpz/0PGm3L7l
	 UnE8xn6l8IsYh5ZA/HBctPr5Rq9BaSABFIxExuZvY1QCKfD+5GOaNdOKUL2fhO7y0o
	 8Mts/EkBjhY/rzgcJOEPqCgqXjniYlS+kAwjgtrpKJaSSFh/BNAmJUkFB2zWv0XtTe
	 d376C//7xlaXY/JeGKYevxZTnNAYLZbvC5JfIh9rmg2KLvc6E/py7Ab3KYBHo+NnSS
	 XvN2/2u61GPtML2OLj7B2FKem2aZKzLEdF+YMnRBYohhrRglsy+s1371+hOipGtS4P
	 mBPgTiYXVZ3Zw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C4A117E12AE;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A9D6B480052; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:57 +0200
Subject: [PATCH v14 14/38] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-14-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=F5HBTNrUTZP99GdpFwb2DnCb/PErZaXCXmFP4cHspV8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQN09nLHbgrdeTMQF4daw6ph71ZGKvvv
 4JCKUpL2YdD8YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qazvEQAKiRurpxY+fQU6pK4O/XrbXbdZNWSdWL1Xy8qH11SSgVdx2BqnkMvKcIJZtOtNYMY6x
 JhX/jeRDZGFzMm3k1V8z/FgWyANsoXJPek0kzCL72kF1KUdBXd2VA1P0zRuq4ig6skwE1jWUjEv
 l/8tj7A62/SUtL5ctfbLhWKn4bOLE4OMABxcRQEFg/hdpj/aVRPAOCPUvbYqaRQx9ybYXBsDDYH
 FrRDke8x+LqNJjjy/hIrp7mtbDDHWkLnnZNf6cSn26g75scjNNpqY5YUqtkaQ/xrXetO+g59zBL
 AaASTGuMHipeUYDm7WYPBHTaPtJue1Nz8/1Z7DCjGYtr2Q/QNZyaMuZehU3dW3YuxdRU6uV8ZXs
 sDidZwJLga9vilIf6rd6BKsLRThlbl6y6nObQ9D/bDDgqmgeEz2wjQyGnzaCgTw5HfLf0Qq++LF
 rMpvZHtdKHoqH9p7LNLPuzls5x6qA8SPwWFc9a2EyBI13OvuSGOCWSnX7fHbx2RFIB1jpQmzSBZ
 gQGD3+umH18uDoUaa6Q/hbj0BEq14SqYzYCKn68Ykk6VejcLHe2p1nrjfrd5FmV/NofovBHSC8C
 Q4uYQ3wIvCIfe0F3+oszQxIUkh/O1qGdv4+NVUvftUzB/fpWMNFAzovQL2lR6moQsxzCJTt4yv0
 PRU/JlxRXfHIer5dWwg4toQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7fb864a1486c..05593e98c16d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0

