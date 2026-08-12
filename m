Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC621D591;
	Wed, 12 Aug 2026 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529739; cv=none; b=WMu1wS+bpTgV3D5gguKGLfejXaE/0aolpty1vIANnEbvj/nSBSk4ulthP+KgnDfPDFUFYQvocyNnb4BCSN2IZIUwXARkIwqqJVA6xUD/oLK2hq6LilWH1fMcb7RfvuZqPMB5XXK5A0TcoVZhC2KpOUkJ9x4yNkZX86JOUNdlc0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529739; c=relaxed/simple;
	bh=fMoXgEgyPXST7SlP5a3BYWuVLWhvTgX6y1P8TB3eDFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ1e4qh6kHHFAt6nFBXj34UBIOm2hYg9pLjqZkJVQriiCgQohQR/WQ8i/HVogbp7RmCjg6ET6KZYQ6Yx/ww5bDlFrLiICqRbhJlbaTgOPgn49k6v8KL2hCws33Yy5gLeAU3apuBKUd1Z0s6ZZqHpz69oQ11xPhUkhc08DkNLgOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBANmAl+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBANmAl+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95B31F000E9;
	Wed, 12 Aug 2026 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786529737;
	bh=km+FWImsIUFl8aBPViX6Zfp+UQcG2kTKxjWPuJ893Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jBANmAl+tkrKwU6nUQz+XEl8WMrZu06odcl5Ygsah2atea2o3pSK5M0u2+Cb5dtxf
	 CszY8HrUw5NMtAls7C3C22W0YPyC1CA0nJKdZUcpz7FAA5jPVo/Q0m+DtWULMhObmk
	 l+U3I5N2ktZz5sC97a6ZDW5tkJ4nC1cvwezLr8g8hsFUxrhmlZiDmiD/TuiPL6gETq
	 29lyz01++9kQ8c8J0lKgi5dg3FD9nUdJp1fGXHTswa5W49MzHFx1LoMu8dAjoNQeyU
	 rf7AgbttoHEku/UruTDEAVbWBJDu1EDPe2V7WWiqzqV5orD6YUJnnC/hIm0+i5Dhnb
	 OSUpU2Op6AKIw==
Date: Wed, 12 Aug 2026 12:15:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
Message-ID: <20260812-silky-omniscient-dalmatian-b268cb@quoll>
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260812010157.1772849-2-marex@nabladev.com>

On Wed, Aug 12, 2026 at 02:55:41AM +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
>=20
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string

What is slightly different? This should be either here, or better, in
"description" part.

> to discern them.
>=20
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>

Incomplete/incorrect DCO chain. Who sends it? Rahul?


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
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2ph=
y.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml =
b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> new file mode 100644
> index 0000000000000..ca9fc3b87383c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/st,stm32-usb2phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 MPU High-Speed USB PHY
> +
> +description:
> +  USB2 PHY block in STM32 is attached to USB 2.0 Host controller and
> +  USB 2.0 side of DWC3 DRD controller, and provides the USB LS/FS/HS
> +  connectivity.
> +
> +maintainers:
> +  - Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> +  - Marek Vasut <marex@nabladev.com>
> +  - Pankaj Dev <pankaj.dev@st.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-usb2phy1
> +      - st,stm32mp25-usb2phy2
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  vdd33-supply:
> +    description: Phandle to regulator providing 3V3 power supply to the =
USB2 HS PHY
> +
> +  st,syscfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: Phandle to system configuration controller.
> +    items:
> +      - items:
> +          - description: phandle to syscfg
> +          - description: USB2PHY control offset within syscfg
> +
> +  "#clock-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - clocks
> +  - resets
> +  - st,syscfg
> +  - vdd33-supply
> +
> +unevaluatedProperties: false

additionalProperties.

Best regards,
Krzysztof

