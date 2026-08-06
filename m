Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0992E397929;
	Thu,  6 Aug 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033565; cv=none; b=sEkrcr8hVNxCpHV4pb6+nh+wn+Ekrl7uo+8lqaRg/sMJqvkOPCicJxrfARJ6snX2MrWMJY26K4VoVxhjxDxAKbDQbQIjpaDVd+pkFA25NXXb/ZJWfeYgn8fwVOZVg5ZP/0fvCuU3hE1411px31lky4DMi5TyoRpk7lVVo4No3JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033565; c=relaxed/simple;
	bh=a+QA8uMXk/GibnlBeo/mGe3QdZdLWGlNEWWvA5H+x5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mj4rV1pBNBQvuOLPKQOUrnUZCXy/a7m1Pv9ZoQ8k6bxhKulLOYOwXAw2prwVruyvblof9/p/nNpjNCEOuFSYKR4zC608IBYngc8kSKLwqgcJ5ZkWqCn2O2+3w6RZC3NzNN+/k11UDlvd6sBecjeNe0dF3l9ogPwtTPYm2EPJhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tfgh0c2W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tfgh0c2W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE37C1F000E9;
	Thu,  6 Aug 2026 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786033563;
	bh=gFuUAEckyNvDJ0fEQvHD3+b6qWv1iFIarxVPBhzqSCE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Tfgh0c2WiszIuv30Akrz8pEvDWJNDBISX6S3g8hW97aWFl/+ICZ47hiMnQXNP6GHK
	 h+RADBVV3vbYJqZoKzlZv8nP629GBMoO4Vp+n1dn6u5VYO1OYs+PFcx8J3Piv2nyox
	 gM3wmKOa6M0B2YQL9QU1Nbq1t21oVh8dPCinW2dTNuZtKa4rSsJmCvo/OF2g3tRfMX
	 28rVmr9Y08aV6Z08XtXC3jD0v7sp5qUIXR8/vwre/OmSsdps9BjnSNu5r892L4qFuL
	 0AHIlxuzPRhWjJ5m2E0InyFtjfYDvUWK3sl1qjJ7Ydr4SdkUQwYKj/Hok5ePi8F4cn
	 nP9kx8uUtHIHg==
From: Vinod Koul <vkoul@kernel.org>
To: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, 
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org, 
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, 
 abel.vesa@oss.qualcomm.com, Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] phy: qcom: Introduce USB support for Hawi
Message-Id: <178603355854.674490.5425466040463047845.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 21:55:58 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 08 May 2026 14:32:30 -0700, Ronak Raheja wrote:
> This series adds USB PHY support for the Hawi SoC. It documents the
> QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
> compatible to the DWC3 USB binding, and adds the PHY initialization
> sequences to the qmp-combo driver.
> 

Applied, thanks!

[1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
      commit: 19d8eca1be11bc5782f9d292d88f96ebf0cdbe7f
[2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
      commit: 7abc2c575d5b5d67349caf73509f069e6bf7445a
[3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
      (no commit info)
[4/4] phy: qualcomm: qmp-combo: Add support for Hawi SoC
      commit: eca0e717aab1cc90eb0b7d8c3e8aa63ca89962a5

Best regards,
-- 
~Vinod


