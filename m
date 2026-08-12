Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A461141168C;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527285; cv=none; b=UV8ymBeVUBfPHF1bb89cI2cupAoFMeUD68TIxIJqJRbtYLdsjTj1lMdakrtZ4dLFOaY+I1nuqK5uGtUA6aDFxzjVm+WhnVOEJIJX5KE0s9HBUxdjcI1sr5x8u0I09EZ/ugbCQ64D5zrSqHJvZOXRax4fEjvaVmH3ixmuxzpni/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527285; c=relaxed/simple;
	bh=3BaE5P2Yt8vo4lMA9XvS6KLHXerUNkBfKwoyVyjmA2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pxzRyiQrBhncUTH9uehf+fzAz3Uo4vsZewwq9LLf7qhcvXntNPDYtvmNKUFTDS3WoJd4LPPbZd1VTSNYWxAjZRJjoNZwz7eR4HCb1ixZuigCDiaX3QRZzgX6Ywl+UJ7+RAH44h7iirg43K/gpl5x/V+hV1jsaXFqX+EQqlgFEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOgtpdKB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOgtpdKB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56E19C2BCFA;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786527285;
	bh=3BaE5P2Yt8vo4lMA9XvS6KLHXerUNkBfKwoyVyjmA2M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QOgtpdKBhUVwrobCMyHPpRFKKiJ8O/LvuV3+ZCE445xSr+8Uxw+0VBlOHmUP6ikef
	 heWXkFmdnR4s2c0AfNm2DIE/8ZOH6IAQLD15u1q4JE8fqiAqKqkEQSbZAqYkJWDYBC
	 C1oSjExbS/ks6cG0vyJqQ3Ri+l2m7RcC4P1GzbHc2j4nlIG+/BAcsdKM+R0yZ/UUSb
	 DVH1m9RPVCtFzWV6i/bJCfvOtrIr6WrWsUeBeeE66hJG4gNEA5ZlQ3HCTDCR4Vyo2S
	 GK3kiZ4vilPPZMX+q1KuQquLUo1E+Vfh+FKeQXphFbQ134bCciH9nVm0S2n/Kw5Uxo
	 HAOTbTv/CLbYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C24C5DF61;
	Wed, 12 Aug 2026 09:34:45 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 12 Aug 2026 13:34:49 +0400
Subject: [PATCH v2 14/14] arm64: defconfig: Enable qcom USB UNIPHY driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-ipq5018-usb3-v2-14-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Praveenkumar I <quic_ipkumar@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527282; l=798;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=zrQ8Wh0YrykyPakfOtquLxPzDH9GvGWTD/vsNafpQc8=;
 b=e9MkbPrNY2YklKgVhYOaKoJ5dXbJojlUCPnLDcEhKBulG4jA8t21WWO1+DnxQQtgv0YiS6qxj
 ZDo7mraPW5aD8eNg1pBlWWiYj75/iR1D+A+LEhMhM5dMQQqD+3aVBv0
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Praveenkumar I <quic_ipkumar@quicinc.com>

Enable USB UNIPHY driver present in Qualcomm IPQ5332.

Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..301cc21200bb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1782,6 +1782,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
 CONFIG_PHY_QCOM_M31_EUSB=m
+CONFIG_PHY_QCOM_UNIPHY_USB_22ULL=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.53.0


