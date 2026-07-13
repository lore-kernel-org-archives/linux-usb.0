Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B889385D6C;
	Mon, 13 Jul 2026 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941160; cv=none; b=STlZUBb58HnHNL4Owd7H5I8+r0TsJ3wptJra2WsWSgEWBuDvoEd9ADZ2mDNp9n2R2mLL2EhNrsW6FBzGllQdKmXEt0z1ga3DAkaYM3BdbzO/4SYdYZzY48wdZ1mHnvdMs6lebqPRLcbU2ANzycLwmOmpzyzCOCgATNuRQTueL+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941160; c=relaxed/simple;
	bh=zzMt6c4IrEDxrQ0gOf5Jyjlrkqcm2LRwTZccZACl8R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdaZaCYWqSLvUP1PC8P4jXdeov2nqZ2acs3gzg98nzwf5LggMRzcGXhdefF6UpyBpjwZRWYu9w2QehE0NGZ3qkVG/cVaPO6QgNAat8gZqKLc+kGqyahsyx0gWhhwVc5572n6PbH3Lc0j79/2xiKijIlmeOSKU7MakZGY2MvEOCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMDpN4mj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMDpN4mj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8F41F000E9;
	Mon, 13 Jul 2026 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783941157;
	bh=+itPATlxhTbhN7l81/OGgYUotwlHoDMlh3YsBI1rLuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LMDpN4mjsABMx6a9b/8YHkgELyGWi8x5/IMBb/CpNiZVulzJzrRippKl5PEtGhVKB
	 L4qC2SKg4U6zbAcGfQ60SWArIjNtPvq09E9h00HVQdmEaG9H3lfq0C0tdP82ZlSy8V
	 Y6H2SkWIwhgSCcMAP4xH9Fq/Nu5R3qxPvxNKZ7VSAwE+S38laXRoF79GGhQHkdVYzr
	 pM826rvmwjDDLl6/+a63D12osQUmRy+kOH6FBkFhe+h6H40shlEywP/AjuMfXmf4lC
	 6+CkOSb+zUPiGBXo2sv4wfK+E1jmFaHOnCfO9iMh6Mh0bjIkad2JIyOWfCRPZL84C5
	 U4/RNS9v3sF7g==
Date: Mon, 13 Jul 2026 13:12:28 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: vkoul@kernel.org, Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	neil.armstrong@linaro.org, gregkh@linuxfoundation.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com, 
	krzysztof.kozlowski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] phy: qcom: Introduce USB support for Hawi
Message-ID: <chf57j2dkhhjzigpguldadfld5utepa4sxwbo7fjxk5nq37bhp@yci5agzh46ly>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>

On Fri, May 08, 2026 at 02:32:30PM -0700, Ronak Raheja wrote:
> This series adds USB PHY support for the Hawi SoC. It documents the
> QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
> compatible to the DWC3 USB binding, and adds the PHY initialization
> sequences to the qmp-combo driver.
> 

Vinod, does this series look good to you?

- Mani

> ---
> Changes in v3:
> - Fix missing version tag in individual patch subjects
> - Link to v2: https://lore.kernel.org/all/20260427214217.2735240-1-ronak.raheja@oss.qualcomm.com
> 
> Changes in v2:
> - Clarify in the QMP PHY binding commit message why Hawi needs a
>   dedicated compatible string vs previous targets
> - Remove stray blank line in hawi_usb3_rx_tbl
> - Link to v1: https://lore.kernel.org/all/20260425070002.348733-1-ronak.raheja@oss.qualcomm.com/
> 
> Ronak Raheja (4):
>   dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
>   dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
>   dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
>   phy: qualcomm: qmp-combo: Add support for Hawi SoC
> 
>  .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
>  .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
>  .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 231 +++++++++++++++++-
>  .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
>  .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
>  .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
>  .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
>  12 files changed, 512 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
