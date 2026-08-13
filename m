Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986D843802D;
	Thu, 13 Aug 2026 20:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654320; cv=none; b=dLkF4sqjmlQgMX7KaL3C93YVwJYz9blnYZL4ljKhNJT09SBRZs9qM7TyxneFfR8Oqy+Yvb2qA/e24TustI5PPuzJu7585k+axUctZ+C5VK9WTPnkK7ZgsY0p+g6Slt8IoHtyBOnGvLPzskz6U4o8MYOtQ5rc01NFTAWpRX7Nliw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654320; c=relaxed/simple;
	bh=g26nTS99Bkf3/4W1dEJ9FwBrT4+6hNmRHmeJqiVG5jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgFzFx6fQ6zYtln/iUH1Dh0SG5LpcS8fn3vJoq6PowPxXL/Z04MsEau4dFPuIKoOl12qsB3Fb8koPmhLF9oebePDkHzGzJQUoftoePmUiyFdUuLoA1K337gWyOpGfRi/ap23pEwK53goG+BB3u8bUTKyVa938+270FxyWMYTiwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OnxbQzin; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OnxbQzin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=g26nTS99Bkf3/4W1dEJ9FwBrT4+6hNmRHmeJqiVG5jo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OnxbQzinnIZ4b90h8lwC4yAW6wY3cDHT4I+BhMLssRErDJA9gZtmynnTygKvE3zOk
	 70sjKZxq9JP007+3tp+DXvM84VIMza2+kbeh95IiW6y1gSi3b5xI/RBZpfvhPyVECD
	 5zh78r2vMF1d+NhMzTU95JRfRgpNvvkLoafgeaqOOLaG8xSVkejjK9sQg2GXRCGx4t
	 vJK1/lIfN/P28DVITz6PW69r6RwyHYCJ/TPFH+n3O2bH5c0a9gz79kyoDcd/oFyzkq
	 bJuLyK8GQuRau0MwrvX6hYNhKGivYaYVOaYFcIhfI1iBFCj5el+vznQO+FyyB1lWDL
	 2eLqIuroYoJmA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 516FB17E12A2;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A69D248004C; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:55 +0200
Subject: [PATCH v14 12/38] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-12-b5ad9c68fa11@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=g26nTS99Bkf3/4W1dEJ9FwBrT4+6hNmRHmeJqiVG5jo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmTsTucDFzDd7xJbSTHjI7szmPb8ccS3e
 2EHRy6YNp1v3IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qanqIP/3nCMl8Bh4mJJj8aSmlpW5IS2QxXJR4IVsDSjJ9CcOckPqJj8lh8kbGU3jhs1cSfZEi
 6Qd1CF0X0Gh71qknQ085KE9+KI2j9RCL8nG++7/uGlPRL6xfne01Pl5f3QWruLdRYu17QLyJZ3A
 9oHuFRneAmzbSvtItpCL9G7ijpTgUQ7T7I1suqzhq4d1FVxuTKMpK+FL0CaBe7Ql/nmVK8gduOF
 uO7irMuIYSUA9SZGLjZl303d94TyI9sEPm3Uh0JBTmfA1/fXmmC51viOBJv6TqWCg1kLIrmMCz1
 s+kJu404K0Hkxg1nPC7U8NkFNgBOzMH45sjAch+PyBKf3ELGbb1/8EK2PCm3gsdU+orIOXlp1wL
 Hl9K1KtNwc75PMfF5IrdzrI6MLMeKQH1bKANdJ3rDJn28mRAgC2MCg1r5fOrplvrqRiqxCxEHCr
 nYE7PBPD87DS0xpbWndJKZ0NAznjG/kbLOG81Thp8DDPhhdIpg1TOhsr9jBFEOHL/punTCqRFBV
 I9w6qYYekyr3S2tBm4uCiMCzmzuvAIm2qTAgWendBLIOtQ3nROIkuQ/ts8iyVy4PeQd+rUSm/AJ
 5Tw0izcBfE60HnSH7+hc3RlH1cREgMD9tMthaCw/jAA8AQYgoXFz0t0YNZbXIb47jDOBzplY8cR
 IFEzbTQ6xPEEBPXfjZ5QlYg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c4d62b234ea8..b172ce6a722e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1099,6 +1099,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0

