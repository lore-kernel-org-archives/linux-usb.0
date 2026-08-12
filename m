Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B862129B228;
	Wed, 12 Aug 2026 02:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502738; cv=none; b=tdPRt4JrMlRl81aJ0euNM3mEYUtmixXQAet2TBBM14bKJtk2aEu0EojauLIp+AGKmcLliV1iEMTy6eQU0lakevFAM5vY2a4jVFhykEVfmdnpCVecYz/3plLtltyJDfmDE/h2yDg5oBdOnwDfkrUpecb7vd+fW7C2BPcRfNnudRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502738; c=relaxed/simple;
	bh=yzwP0FnecAJepm+1mNy9gxvGabG89sflOfYAHeqyjNA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ZShiWzhy1uXpuMdXqxT+HGj2/Etyc5ajPCIvIbyJGvcl+ejMnig/MvyPMaRMYNA/bzrNmwOrcYIOpjdPQVt0xkU02RnjxwMvErczpQNJmuwWupHSI4pbM1fI0zI1D0+yzX0LHEyo5PIbHYBXZsh80UmjV7chDwvqMHzUxRv8VrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9i06sar; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9i06sar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390571F00A3A;
	Wed, 12 Aug 2026 02:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786502736;
	bh=QrWXHne5Rj+iz81loEoN0QV2AkdqZPV2Q62rTm5Hl+c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=d9i06sarZ94uIQdp7MKoSNrl4Zi1gfnsx/7SATNaKg8rLb2cGQQHF/DOOvO227WwI
	 KgCU5Vpf8o12idpU92K8HESmvxc0Tn63pcis9ysQkNGcXp4i8PBc0tUaxHehRA/bd9
	 zPLxnn/7BPuoPMTN1cWycrMK3S10qiNB4/+ZZcpqGLqy2N6mKSaUKUl4wtNhbMT56n
	 Lp4Qebrkx9d39paQL+ByQfMr7I8L4wVbMcN84PhqGwgZdgFoqbSUd8GmBf4RfiSwgP
	 uD5T3Fm1xoejTAqevj9KzgpzkiE3J/16QLmV56PNPeeBOlUdckccik8TwZhvC8KahK
	 /ZtRfbR0VTQWQ==
Date: Tue, 11 Aug 2026 21:45:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-usb@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Rahul Kumar <rahul.kumar05@st.com>, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>, 
 Christian Bruel <christian.bruel@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260812010157.1772849-2-marex@nabladev.com>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
Message-Id: <178650273552.610181.6902482576352266703.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY


On Wed, 12 Aug 2026 02:55:41 +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
>  .../bindings/phy/st,stm32-usb2phy.yaml        | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/st,stm32-usb2phy.example.dtb: /example-0/usb-phy: failed to match any schema with compatible: ['st,stm32mp25-usb2phy']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260812010157.1772849-2-marex@nabladev.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

