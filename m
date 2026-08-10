Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B5B3DAAC6;
	Mon, 10 Aug 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367123; cv=none; b=YQZXb9lnaTwAAtMtcTaxx7orpF04l7kbJkRrIIAp/1XYTjUPGQL2s8wlYVRiZTvU4S5dJcMtfX83Z+/TOC6oolPEWRtWb2N+TXsCtC38LnjCc4YC2U9YNZsG1zp1+C94VAvP0Biw5JFPqBw0vhm1Zb2kt5pIniN9xrGgeRwETMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367123; c=relaxed/simple;
	bh=EXKIYQlayJMKHwn/Ak9utux91cyeA/0QBVKDonf0lKk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jEkiYW4Q7PKiOx03j0/SnHvAajp6eh1h04Jpf1+RQRzpxvlgRIabxkQjFfR0SDs+qeGuKcvxC7DY5mdAneWxo8Ijonwt5vSToGD/WNKEh+ttIU8QWHhhn0hfqVgLwm5QOTpXRANFWxxrTY6+MeFqW60kHjOhFjZ4RYxzhxUhkm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d5r6usI/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5r6usI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4441F000E9;
	Mon, 10 Aug 2026 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786367121;
	bh=WdMXfO+4J5HY3QJYR60bAsdnMR+oU8E8qjW7lfZO6qY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=d5r6usI/VOGYLpu84JHB8q8uE/zmQgCQACBfhS6BERqNWeBe4ljXncxdgLVjcy19t
	 lpPf+QZcAzsFSXAIuY0JE7gNwqTS6jzHclRAyCBr2qXWl4W+ITxUEhUZC/hmsFej6O
	 WO/FV7Sqw6ldYMc4AZ2F24rkg3SHUDEpuw5i20OV85WP59ENzr0/ZCVaMpxRu+GMIT
	 p/+laVnKJWSO1UUJATXusILJrhvbeQxhwEAFVgjxQAZEzktSzufVT7hPNLaf7orxsg
	 cxKZ3p3lonuYKgFHpT4HGJ7NKREjRtOZxmN6INRpepxfnwtquhgBwk6a0XAUGuOOWn
	 CYeUIEjm1pYgA==
Date: Mon, 10 Aug 2026 08:05:20 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Andy Gross <agross@codeaurora.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-phy@lists.infradead.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com>
Message-Id: <178636712034.1325078.17514969313752139000.robh@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: phy: qcom,ipq806x-usb-phy-ss: add
 MSM8974 SS PHY


On Mon, 10 Aug 2026 14:42:33 +0300, Dmitry Baryshkov wrote:
> The MSM8974 DWC3 wrapper contains the same QSCRATCH-controlled
> SuperSpeed PHY as IPQ806x (SS_PHY_CTRL at qscratch + 0x30 with an
> identical bit layout, CR protocol port for the lane registers). The
> SoC-specific params differ from those specified for IPQ806x, so add new
> compatible for the PHY on MSM8974.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml: properties:compatible:oneOf: [{'const': 'qcom,ipq806x-usb-phy-ss'}, {'const': 'qcom,msm8974-usb-phy-ss'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260810-msm8974-usb3-v1-3-1a47e1185524@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

