Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361340;
	b=l0bEsolV5+ZnQ6RpTfRfjiRmsdjANlDsI2RtEXHcLk4tWxCEq9mM0AbSna1VvgilZLlr
	 HTolDLFhW4RF5cU23gEXQ10lc0km+KIeYXiEeGrvlfNbX8pfdRireNAMO90ypiWpSsJEJ
	 cyMwimzU6UFo65THB8OGR9M93jx5h8V25yW3DKUcwXWArlzoaoTFgLXkBxMWf5iQh+wMe
	 UjacWmsBZPTPgVy9UlXFuCQOxcxftlhkuFNnTqbzQNsyyKHa9LDYd8eWjlpv+Um50v236
	 KLQiJApE8hs8mCEPL5mnyM91KF0Mk7gDAvnebYbyvb/LynZSzZC7sQz/w8kRNV9vm4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361340;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZF89tkqws706RTsLm88jnbpkVWFxEn2BIz922AiAkF4=;
	b=hwchPk+E+e9/2/vxHHTCoNEbqOpogeiWFS8jV+Q72RgrP3fkrQ7h61Talp8eSyFFWnZz
	 79vds4PB0Yxw6Hs7tb+ZxEGvz71Qoipo5ILTAU+HwR5SsnucK+2vRRzkPvHow2M1B8HjA
	 PdSqelBkMv7ic30QFpFCjgD/3+TtEA52cu9lqfuFGSsgf7zNbPKLa9QaEfzSnbfHhDp9K
	 2CMWd/wmrySn2cdmb9b0WgztcW/1AyDGuBWWyDHRHJDLux46teMGuM8HlthKGwrxA7EYm
	 fSfaqtY2HicskEg3FgU35/Xbqsq3MiCzX2MRPrg7p5R+yySAO4JRnaPWb7G14vXYCag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvffzmlB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480F7606A32C;
	Sun, 22 Nov 2026 15:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvffzmlB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27011F000E1;
	Sun, 22 Nov 2026 15:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795361339;
	bh=ZF89tkqws706RTsLm88jnbpkVWFxEn2BIz922AiAkF4=;
	h=From:To:Cc:Subject:Date;
	b=kvffzmlBM3UnFqMdU+V0YvxsvAAcjV+vNtBt4DlEb0BbLC0XXLOAyXXQhB6Nbg6Zm
	 52pwZ1PDRBHrjb665HPFeLgEqMfaBtaxnuwVvHY24+5y9oTLyYFT+uqkHsn7qihcxF
	 ndrYF59gcd+lSJhIQiR+7kIpDIl9rtFhBnRCrKOSE3t4wHFjB81vd/gG8QyTVkXvGj
	 KOpyq+C4nvObZtbmUW8SNPJHLBxdGsoKirb34zuZGPxbKGVvFo2chkq0/+WYO7MGjp
	 VjuXWZjHUscnT+2s4g0YlAz+x/dvyKEI5/JH4TCiv6G2KjqDZhE+5h/TIsWpkCFwBQ
	 KatUbQfk+c+5Q==
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom: uniphy-pcie-28lp: Rename the PHY type enum values
Date: Sun, 22 Nov 2026 10:28:57 -0500
Message-ID: <20261122152857.1113943-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b28eecc89399 ("include: linux: phy: Add phy attribute "type" and
associated helpers") makes <linux/phy/phy.h> include <dt-bindings/phy/phy.h>,
which defines PHY_TYPE_PCIE. That clashes with the driver's own enum, and the
build fails:

  include/dt-bindings/phy/phy.h:15:33: error: expected identifier before numeric constant
  drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27: error: 'PHY_TYPE_PCIE_GEN2' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
  drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27: error: 'PHY_TYPE_PCIE_GEN3' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?

Give the enum values a QCOM_UNIPHY_ prefix.

Fixes: b28eecc89399 ("include: linux: phy: Add phy attribute "type" and associated helpers")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Against usb-next. The driver needs ARCH_QCOM and is not in arm64
defconfig.

 drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
index ef8709ff0e16b..4243de46a1e07 100644
--- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
+++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
@@ -44,9 +44,9 @@
 #define PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME		0x3e8
 
 enum qcom_uniphy_pcie_type {
-	PHY_TYPE_PCIE = 1,
-	PHY_TYPE_PCIE_GEN2,
-	PHY_TYPE_PCIE_GEN3,
+	QCOM_UNIPHY_PCIE = 1,
+	QCOM_UNIPHY_PCIE_GEN2,
+	QCOM_UNIPHY_PCIE_GEN3,
 };
 
 struct qcom_uniphy_pcie_regs {
@@ -124,7 +124,7 @@ static const struct qcom_uniphy_pcie_regs ipq5332_regs[] = {
 
 static const struct qcom_uniphy_pcie_data ipq5018_data = {
 	.lane_offset	= 0x800,
-	.phy_type	= PHY_TYPE_PCIE_GEN2,
+	.phy_type	= QCOM_UNIPHY_PCIE_GEN2,
 	.init_seq	= ipq5018_regs,
 	.init_seq_num	= ARRAY_SIZE(ipq5018_regs),
 	.pipe_clk_rate	= 125 * MEGA,
@@ -132,7 +132,7 @@ static const struct qcom_uniphy_pcie_data ipq5018_data = {
 
 static const struct qcom_uniphy_pcie_data ipq5332_data = {
 	.lane_offset	= 0x800,
-	.phy_type	= PHY_TYPE_PCIE_GEN3,
+	.phy_type	= QCOM_UNIPHY_PCIE_GEN3,
 	.init_seq	= ipq5332_regs,
 	.init_seq_num	= ARRAY_SIZE(ipq5332_regs),
 	.pipe_clk_rate	= 250 * MEGA,

base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
-- 
2.53.0

