Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EA5447818;
	Tue, 25 Aug 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661456; cv=none; b=qJ2j+/SRlWg4LQjkqVg9SEV3EKeBKaEX0zF6tsvCuM5vUxU5Jh0mC4OCezzcrvJh4gBHyOErMk1ShW9a3ztwJddEUbtoRXlITRTf7bCWz7ygqxt1SMVi1DzCWy9snJHdIbMJMdcu8q/EJkDDZTg7l98DOYo0dTDMimnjZ0gOW4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661456; c=relaxed/simple;
	bh=DXJ3FaUBZP/5e281lLY7Fr6FjXmIpllf4hkwp9n1ICY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUgq7FWatFmyfIWBkwdmk3NEz0iGpjc+TazpBkU4xvshtd3Q3c4nCrKWm7bp7sv6EAQhrH57QqZlJc+61Fri0jQgL2DZnBfn44HNOVlFSuiy4wppSfE2PukY7Inh8RhBXf+jOugcS2ADS1g4d81yTJbb17HkeBbr9TlUJMAeaaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDiaVbM0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDiaVbM0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A951C4AF19;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787661453;
	bh=DXJ3FaUBZP/5e281lLY7Fr6FjXmIpllf4hkwp9n1ICY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GDiaVbM0guP4+2OqWViFDhpWgV4oBf+rIDY1g/68d6sDLPeJB0m9bbct/NcvstwkK
	 wQOh2GZWUDU4cHNifB1Y3+Ta1uAE9tdz6mFvYvGQ4MIXhJzQ344hfyDu7jOyTVh26o
	 epfOPhtbINdFxfE3bg8RHWfPwAVkxQKgUNeft7DX2hX69kVurZCZvLjJd9DYYsB2o6
	 /x1v5t+nLHZ4hu9EIwUe1X3QvcmdplR3amJSbR3XmfL57tuW0+GutE7J9D7KaGY2Vd
	 CfnQQRmHhq+LqxNTlP+3HC2CCRkfdRwJvje903gtFMMsIcIr3QWd3KLaevRX4UwcmR
	 ccd0lJ9COTimA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FD0C61DC7;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 16:37:23 +0400
Subject: [PATCH v3 06/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Improve error handling in power_on
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <praveenkumar.i@oss.qualcomm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787661450; l=2016;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=7wBK4ADEhWBDqDww6gxmOEnN2/BlTdDKW1nGKMr0m+o=;
 b=C/MYQL7TG7DA7JcFLXibus27QkTlcnmxhzu7Vca3khVoAlzNRyJCTtlSZizM71/jTyiIZbUpo
 j5fKhLDbh4cDHNCctklnY94gRgK3ukpF3JbMkogPcOlKt+EED1pT4yo
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

When the PHY fails the enable clocks, it leaves the PHY out of reset.
Fix this by asserting the reset before returning the error.

In addition, language correct the error messages.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
index 671bb805057f..d25ae9d8b9e7 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-usb3-28lp.c
@@ -144,7 +144,7 @@ static int qcom_uniphy_pcie_usb3_power_on(struct phy *x)
 
 	ret = reset_control_bulk_assert(phy->num_resets, phy->resets);
 	if (ret) {
-		dev_err(phy->dev, "reset assert failed (%d)\n", ret);
+		dev_err(phy->dev, "failed to assert reset: %d\n", ret);
 		return ret;
 	}
 
@@ -152,7 +152,7 @@ static int qcom_uniphy_pcie_usb3_power_on(struct phy *x)
 
 	ret = reset_control_bulk_deassert(phy->num_resets, phy->resets);
 	if (ret) {
-		dev_err(phy->dev, "reset deassert failed (%d)\n", ret);
+		dev_err(phy->dev, "failed to deassert reset: %d\n", ret);
 		return ret;
 	}
 
@@ -160,8 +160,8 @@ static int qcom_uniphy_pcie_usb3_power_on(struct phy *x)
 
 	ret = clk_bulk_prepare_enable(phy->num_clks, phy->clks);
 	if (ret) {
-		dev_err(phy->dev, "clk prepare and enable failed %d\n", ret);
-		return ret;
+		dev_err(phy->dev, "failed to enable clocks: %d\n", ret);
+		goto err_assert_resets;
 	}
 
 	usleep_range(CLK_EN_DELAY_MIN_US, CLK_EN_DELAY_MAX_US);
@@ -169,6 +169,11 @@ static int qcom_uniphy_pcie_usb3_power_on(struct phy *x)
 	qcom_uniphy_pcie_usb3_init(phy);
 
 	return 0;
+
+err_assert_resets:
+	reset_control_bulk_assert(phy->num_resets, phy->resets);
+
+	return ret;
 }
 
 static inline int qcom_uniphy_pcie_usb3_get_resources(struct platform_device *pdev,

-- 
2.53.0


