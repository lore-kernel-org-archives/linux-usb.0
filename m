Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F583D7D80;
	Fri, 10 Apr 2026 14:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832728; cv=none; b=kwTpeR9V/jVNDdLFhA6GVl0lI5D7ibfAm94jTV7TURgZ49lsOlAAn3sPA9bfU0YROQzG1c5pvxQbYceh8tebwpSRfoiH4Fj33z5uK9ws8ST5sXhSV5ys4BypxLJAO5TXujzznyuZ9hAMHzV5P0jseofM4Jpt39UqSqEX2/oGO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832728; c=relaxed/simple;
	bh=8iacYD4Q9X98eAO3t1FmQlQJSOBjoGjOTKh5Fz9WYbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cADjnJU9cp4HTlgD6/t6MSygj/FuAxN0c3tEKKfNydtJ4vEUZJQne6ELFxQohKIb4AJwENIF/zSCYVL5MZBZTnzOf5T/DI3gi8a740/gl+WvZtoR7wU5jeNtkgplIw8Gpu0LEgGtK2lrSX4YlKf9H/+qZIUZ4cQTBcNqsOzmhVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfhD2nH8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfhD2nH8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4422AC19421;
	Fri, 10 Apr 2026 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775832727;
	bh=8iacYD4Q9X98eAO3t1FmQlQJSOBjoGjOTKh5Fz9WYbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bfhD2nH8ojSSFSzKyidMmGXnPXbqC8/vNwxzgYlvBMFniSY4zuMflUTbLUZ/YJ3Za
	 1SuLYpMLW1RU8a9JsXRjXfYZZrbQrl4fJtPTlup54GEDtJfS3zGYxzVjpRgdJENpt3
	 eTbSOK16DD9phgUC5Wy3QJrGrfmpJUB53zad5u5EvpRPPPCg2xmHzHAyVf8p/8qgJ1
	 /yVpU6CvtErO4+HwMQQkxcaEHA2WsozCwIx4LB25PdWYUqBLwFcfZCYmmkhSIl5WVS
	 AyVkMxAtg8LZALXcJSCXPilyRM8Rv0VrJh045FBX7DouhWWUkgA3Zd850blGzCEQ/C
	 3r7nbYnCarE/A==
Date: Fri, 10 Apr 2026 09:52:05 -0500
From: Rob Herring <robh@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: glymur: Add USB related nodes
Message-ID: <20260410145205.GA554754-robh@kernel.org>
References: <20260320-dts-qcom-glymur-add-usb-support-v7-0-ba367eda6010@oss.qualcomm.com>
 <20260320-dts-qcom-glymur-add-usb-support-v7-1-ba367eda6010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-dts-qcom-glymur-add-usb-support-v7-1-ba367eda6010@oss.qualcomm.com>

On Fri, Mar 20, 2026 at 12:56:52PM +0200, Abel Vesa wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB subsystem contains three USB 3.2 Gen 2 controllers,
> one USB 3.2 multi-port controller, and one USB 2.0-only controller.
> This includes five SS USB QMP PHYs (three combo and two UNI) and six M31
> eUSB2 PHYs.
> 
> All controllers are based on SNPS DWC3, so describe them as Qualcomm
> flattened DWC3 nodes.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 691 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 686 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index bde287f645ee..641707ba1e78 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -750,11 +750,11 @@ gcc: clock-controller@100000 {
>  				 <0>,				/* UFS PHY RX Symbol 0 */
>  				 <0>,				/* UFS PHY RX Symbol 1 */
>  				 <0>,				/* UFS PHY TX Symbol 0 */
> -				 <0>,				/* USB3 PHY 0 */
> -				 <0>,				/* USB3 PHY 1 */
> -				 <0>,				/* USB3 PHY 2 */
> -				 <0>,				/* USB3 UNI PHY pipe 0 */
> -				 <0>,				/* USB3 UNI PHY pipe 1 */
> +				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb_mp_qmpphy0 QMP_USB43DP_USB3_PIPE_CLK>,
> +				 <&usb_mp_qmpphy1 QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <0>,				/* USB4 PHY 0 pcie pipe */
>  				 <0>,				/* USB4 PHY 0 Max pipe */
>  				 <0>,				/* USB4 PHY 1 pcie pipe */
> @@ -2264,6 +2264,254 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  
> +		usb_hs_phy: phy@fa0000 {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +			reg = <0x0 0x00fa0000 0x0 0x154>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_USB20_HS_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp_hsphy0: phy@fa1000 {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0x0 0x00fa1000 0x0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp_hsphy1: phy@fa2000  {
> +			compatible = "qcom,glymur-m31-eusb2-phy",
> +				     "qcom,sm8750-m31-eusb2-phy";
> +
> +			reg = <0x0 0x00fa2000 0x0 0x29c>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
> +			clock-names = "ref";
> +
> +			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp_qmpphy0: phy@fa3000 {
> +			compatible = "qcom,glymur-qmp-usb3-uni-phy";
> +			reg = <0x0 0x00fa3000 0x0 0x2000>;
> +
> +			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
> +				 <&tcsr TCSR_USB3_0_CLKREF_EN>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
> +			clock-names = "aux",
> +				      "clkref",
> +				      "ref",
> +				      "com_aux",
> +				      "pipe";
> +
> +			power-domains = <&gcc GCC_USB3_MP_SS0_PHY_GDSC>;
> +
> +			resets = <&gcc GCC_USB3_MP_SS0_PHY_BCR>,
> +				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
> +			reset-names = "phy",
> +				      "phy_phy";
> +
> +			clock-output-names = "usb3_uni_phy_0_pipe_clk_src";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb_mp_qmpphy1: phy@fa5000 {
> +			compatible = "qcom,glymur-qmp-usb3-uni-phy";
> +			reg = <0x0 0x00fa5000 0x0 0x2000>;
> +
> +			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
> +				 <&tcsr TCSR_USB3_1_CLKREF_EN>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
> +			clock-names = "aux",
> +				      "clkref",
> +				      "ref",
> +				      "com_aux",
> +				      "pipe";

New warnings:

      4 (qcom,glymur-qmp-usb3-uni-phy): clock-names: ['aux', 'clkref', 'ref', 'com_aux', 'pipe'] is too long
      4 (qcom,glymur-qmp-usb3-uni-phy): clock-names:3: 'pipe' was expected
      4 (qcom,glymur-qmp-usb3-uni-phy): clock-names:2: 'com_aux' was expected
      4 (qcom,glymur-qmp-usb3-uni-phy): clock-names:1: 'ref' was expected
      1 (qcom,glymur-qmp-usb3-uni-phy): clocks: [[70, 329], [42, 9], [58, 0], [70, 331], [70, 332]] is too long
      1 (qcom,glymur-qmp-usb3-uni-phy): clocks: [[70, 329], [42, 10], [58, 0], [70, 331], [70, 334]] is too long
      1 (qcom,glymur-qmp-usb3-uni-phy): clocks: [[56, 329], [29, 9], [44, 0], [56, 331], [56, 332]] is too long
      1 (qcom,glymur-qmp-usb3-uni-phy): clocks: [[56, 329], [29, 10], [44, 0], [56, 331], [56, 334]] is too long


You did test this series for DT warnings before sending, right? Please 
fix and ensure they get into 7.1.

Rob
