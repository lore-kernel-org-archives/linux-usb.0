Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA30339281D;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654583; cv=none; b=Q3HA+gr/WXrN7d+oCGQE4aJc9YJnm2/U7g056w4uDsAdzVp4h19YVzV0d3OMlkZ17/qPTknaPX5jaB3cDI5r3A8zHI+3Otk6WrBSvn0Up5c0t8FEXpmYL9BA6fSgNXsDOAsR9xquiNQSqqlJ0KfoUlobGUHA0dljFiyASPYbF2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654583; c=relaxed/simple;
	bh=urk0+Er5ux8uZwdpteslcND66gV+vT/aS5AwzhbtppI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KZ07jM6iP6FNOkh1MXlEaw8lCcqPUZFYJyA+0MDa72MY7T24EONp3XreSdxY9Enn/sTZo9rSiC4CZeROBHdgqVi9xwcUeU6BgEQ22zTMQ+aX/6DFwcaBxRYvON6Dfe8ZM0G0ziZDWNN5bxTCbfceMabB1qP+NfLosOknBlRERbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTlYL7sy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTlYL7sy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E96DC2BCB8;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787654583;
	bh=urk0+Er5ux8uZwdpteslcND66gV+vT/aS5AwzhbtppI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gTlYL7syGgUi6OXyj7PutwwPu3Z0qfYXWvoW8gNfLwZcFRQewALrhB7G/GImVdenp
	 aBPp2LsX95qlpqFSbUxfs4YMei+Uj2z6j7VKg/ktuYB5Y1T23Nq9E25pXyA5otlsPN
	 mpo9LjNAd5izQ73sIY5rYsT0wenfggdpXCrIeed2fBwmqQRgBjXvRzFBb19h0V2F0/
	 /pex8RZVtyyAfwWXe7g33W9s8dKjyc3lF7D7HzT7eWZCCN4GVDT/cotlYOhkYM8fzl
	 sz7gqmjP7yfw/ELqpED78T0dY2D8aQa8wEsSs/bLcvGvFtk2y0b39Lc3o/IFS1ikZx
	 EdaKG0RI7uUog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DB5C5DF94;
	Tue, 25 Aug 2026 10:43:03 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH 0/9] Flatten USB Controller Nodes on IPQ SoCs
Date: Tue, 25 Aug 2026 14:42:25 +0400
Message-Id: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNT3cyCQt20nMSSktQ83dLiJN1k8xTzNEPTNGNLMzMloK6CotS0zAq
 widGxtbUA43iwHmEAAAA=
X-Change-ID: 20260825-ipq-flatten-usb-c7d7f15f3966
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787654580; l=2592;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=urk0+Er5ux8uZwdpteslcND66gV+vT/aS5AwzhbtppI=;
 b=5MUNm4XTglR3MnPNMCiGyPVCu3gYeBKDunI6KDhxtgjdz9hLea2nEfjxrD2ySHsP1OUN4R7Ys
 mG2EXgCETBSDKMsLmr3FvtbSXtrvuOfgtpfCruJrJ6JGerATzxrp+77
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

Add property to select UTMI as reference clock for the DWC3 core to
calculate the right values for the period and frame length adjustment.

Flatten usb controller node and update to using latest bindings and
flattened driver approach.

In addition, set the right UTMI clock rate and override any clock
rate inherited from the bootloader.

I've split these patches from a larger patch set to add USB3 support on
IPQ5018 and IPQ5332 SoCs where these patches are required to ensure new
functionality is added to the new flattened driver and binding model.

link: https://lore.kernel.org/all/20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com/

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
George Moussalem (9):
      dt-bindings: usb: qcom,snps-dwc3: Add ability to select UTMI as reference clock
      usb: dwc3: core: Allow glue layer to pass reference clock
      usb: dwc3: qcom: Add support for selecting UTMI as reference clock
      arm64: dts: qcom: ipq5018: Flatten usb controller node
      arm64: dts: qcom: ipq5332: Flatten usb controller node
      arm64: dts: qcom: ipq5424: Flatten usb controller nodes
      arm64: dts: qcom: ipq6018: Flatten usb controller nodes
      arm64: dts: qcom: ipq8074: Flatten usb controller nodes
      arm64: dts: qcom: ipq9574: Flatten usb controller node

 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |   9 ++
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |   6 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  52 +++++-----
 arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts        |   6 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  58 +++++------
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |  12 +--
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  89 ++++++++--------
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  99 +++++++++---------
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 112 ++++++++++-----------
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   6 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  42 ++++----
 drivers/usb/dwc3/core.c                            |  12 +++
 drivers/usb/dwc3/core.h                            |   2 +
 drivers/usb/dwc3/dwc3-qcom.c                       |  14 +++
 drivers/usb/dwc3/glue.h                            |   2 +
 15 files changed, 257 insertions(+), 264 deletions(-)
---
base-commit: 4b18edbd8e70f7e6860d56370f13244896d0f95c
change-id: 20260825-ipq-flatten-usb-c7d7f15f3966

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>


