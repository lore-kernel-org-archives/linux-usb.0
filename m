Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E4F447813;
	Tue, 25 Aug 2026 12:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661456; cv=none; b=fCkiIgwNgyW4AmySoPw22D3Pkuos7wd6RoCZF42S9BFP6Tegup+3bpShFn2DBKrUuKEt+w0mgDbwghr7tP64MMxnd6lbGTKKJ1zOH9l1CSjKh3MV8SK0RRVf/6hOjX+XPTZk2zCXfu3LjJIDJVouMVYsVS7dnf0Ge2nXD8q/p34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661456; c=relaxed/simple;
	bh=7HqpnMgNEy9bMnvjfM6izpGfqJmx0bsSpY59UO9CNhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdpB0+G1+ZyAIJUh+F0+jHqj3+ZoO3cFiwJ5CdqYSQGpAaXcpzOObCCt84XhN/K1n9NACAO4tSaF0C+V9V3n9or6r5JEaC3gfCR208L6vqoqz1jYlIbYWK2XM9cCorJhPdNDyipJ64sKckoQD339XNDsk5R+52MxOPbRpwuVR8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXGwJyLk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXGwJyLk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 898BFC4AF17;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787661453;
	bh=7HqpnMgNEy9bMnvjfM6izpGfqJmx0bsSpY59UO9CNhE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IXGwJyLk/FZSzk0r5fnyUQvCX+FdjQ5TTlTHVDKRWaXROBYQCxUoHgICY2VTQbqTj
	 Us9RVE1S6MsmhIweRD6IHWNDGudw3Q15PtBoWUy3i0RsWA3KRZY90DNu4k39ANCSTE
	 1pkfGJK3im+fI+Gjb138YXIJHtgp2p8mJ1zM/bnZan6DVx2SR5/B3iqGsPUfFS6yTD
	 vAATFJ+Xyn6bDxKDq0TfouVXH3nYCrZhG03HUkWtejMuYgpN7DTnrIoST2zvKYykPR
	 crGV7MlHMhA/ZhVjruSFez16IfwyAJFD0f4EdERe3zFR1WGAWqxP5BA8oQbZM++B0h
	 tzOydQmnTpzoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73977C61DC2;
	Tue, 25 Aug 2026 12:37:33 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Tue, 25 Aug 2026 16:37:28 +0400
Subject: [PATCH v3 11/12] arm64: dts: qcom: ipq5018: Add Super-Speed UNIPHY
 to USB node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ipq5018-usb3-v3-11-39be0955a6aa@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787661450; l=880;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=nVztOgvUA+UCMXgiAA8vKe6nVwfiycloNnuAVugC3Ac=;
 b=A85eEy0Q45TkeWiv8ekcGDPCXTButmyt7zaT2ZC2ASmwKckXMF16vG15NA5Lzn5L0Jbw/TfDs
 J0jBuxfN5JeDlJV9e5Bn2LeEzR8Mvrg4QbSrXL50YMl/r4119B7sv3K
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Add the USB3 UNIPHY to the USB controller node for USB3 support.
In addition, switch to the pipe clock supplied by the USB3 UNIPHY
instead of the UTMI clock.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 7f730c2ab763..1f55b0ba5c9d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -627,10 +627,9 @@ usb: usb@8a00000 {
 
 			resets = <&gcc GCC_USB0_BCR>;
 
-			phys = <&usbphy0>;
-			phy-names = "usb2-phy";
+			phys = <&usbphy0>, <&usbphy1>;
+			phy-names = "usb2-phy", "usb3-phy";
 
-			qcom,select-utmi-as-pipe-clk;
 			qcom,select-utmi-as-ref-clk;
 
 			tx-fifo-resize;

-- 
2.53.0


