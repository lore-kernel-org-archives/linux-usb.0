Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60AF3E6DE7;
	Tue, 13 Oct 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888333; cv=none; b=sNOLqO0TUCbNF1OEWNAYvMcPTAdPw0f170UvVBSd1F/DXONMmjB6Ojz3A+G/0U6//1rO0dMTgXH4MP54GQOqX6Jw5RsNw9IekegDWMXROS4FEg5F3B+pFjM22tzKUaVWpgMHgyJdaw/9GFWtamzygciVftWNN8F+pzjD6sT8ynQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888333; c=relaxed/simple;
	bh=BCYFhvGTB/TF6LqB2vDYYTRaF+EoXhCpF/FIx/GkWPY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y6W0B97WIgh4MDGGLoFoPTJNiKp5zaDIP+KGuMGUo1mViVNRve1UrpsanAjJuAa6rv6go3vSxXbQ6EV63i9djoQpXA9S4uxKyvDUm4WwGygTZdQES1aCN0m+R/1ISTXJB7hAQDqMh1QQadN7n6PH/RvRUpxffxwjlkISH8r5sJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjgalMX0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjgalMX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7421F000FF;
	Tue, 13 Oct 2026 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791888331;
	bh=NjbnaFTmen60ochGpGy53wigjlORGzgYT294Ndw/lE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XjgalMX0F5oua45QaWNm1UncSR7MbySolylF4TZhJxp0vAgeeraEQOZ3o4kW83zCu
	 F360yom0yKD9dCJVAZlJZ2Ss7LeVUhA3JBwJSGnNkbDUpRSAC4krikvOjq2VsM02DY
	 h3Sl0VElPP2KdCVYRr/JvFsttf30ykNDdtjs8bE1LSC52AOBtj7qI6wO3RdAO4ke4E
	 n9rB6obbELnH2M5IoZ5TAKTieVDf5UZrYQfaP/Xl673U9sKOWKSTuxgY/BxBnZ/F+F
	 H55N8733wseKwZ1YAA5wbfdVWHPjLzvOHGrDtyMbXcg70jDb9T5iXOYpRoVdm1Ysc4
	 X3Vf1P7jxMSsQ==
Message-ID: <sashiko-outbox-169541@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: usb: snps,dwc3: describe the
 two-connector HS data path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013102927.1141696-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261013102927.1141696-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:45:30 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: usb: abstraction violation placing usb-role-switch =
in endpoint
--

commit 91efaa7a371d20cd91b98bff5337b76e3b332667
Author: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: describe the two-connector HS data path

Some designs wire the High Speed data lines of a single DWC3 controller to
two receptacles and select between them with a GPIO, while the Super Speed
lanes stay per connector. This commit describes the hardware in
snps,dwc3-common.yaml, adding port-select-gpios to select the connector
and placing mux-state and usb-role-switch inside each endpoint.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6609a709c1d7b..a18bb08afbae1 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -13,6 +13,28 @@ description:
>    Defines the properties of the DWC3 core as being embedded in either an
>    vendor-specific implementation or as a standalone component.
> =20
> +$defs:
> +  hs-port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +        unevaluatedProperties: false
> +        properties:
> +          usb-role-switch:
> +            type: boolean
> +            description: Separate role-switch input for this connector.
> +          mux-state:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1]
> +            description:
> +              Logical port-select GPIO level for this data path. State 0
> +              takes precedence when both connectors request USB data.

[Severity: Medium]
Does placing usb-role-switch and mux-state inside an OF graph endpoint node
violate Devicetree abstractions?

Endpoints are strictly meant to describe connection links (like
remote-endpoint), while functional device capabilities typically belong to =
the
device or port node. The generic USB role switch framework also expects this
property on the device node rather than the endpoint. Could this placement
create an ABI breakage risk for the device tree?

> +        dependentRequired:
> +          usb-role-switch: [mux-state]
> +          mux-state: [usb-role-switch]
> +

[ ... ]

>  properties:
> +  usb-psy-name:
> +    description:
> +      Name of the USB power supply accepting the input current limit
> +      requested by the gadget after USB configuration, and during bus
> +      suspend and resume.
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  port-select-gpios:
> +    maxItems: 1
> +    description:
> +      Selects between two external connectors sharing the controller's HS
> +      data bus. The port@0 and port@2 endpoints specify distinct mux-sta=
te
> +      values and provide independent role-switch inputs. The controller
> +      stops the previous role before changing the data path. With neither
> +      connector requesting data, the last selection is retained.
> +

[Severity: Medium]
Does embedding external board-level hardware mux control directly into the
DWC3 IP block binding bypass the standard generic mux subsystem?

By introducing port-select-gpios directly instead of using a standard mux
node (such as gpio-mux), this creates a non-standard DT ABI that doesn't
integrate natively with the mux framework. Would it be better to model this
using the standard mux bindings?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013102927.1141=
696-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
