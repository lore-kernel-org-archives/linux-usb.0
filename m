Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80723E5598;
	Tue, 13 Oct 2026 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887717; cv=none; b=kb9WBkLWu8KEzKMX1h4g/UxbMPy4ST93TR+xFQBWaCvZ/5lm3+phkSh3d1i/J5jXsJ8OB7VKNrunnElSOS7UhD3Jzx/JYIZqz0G5xABpkV0YP5Q1/HP1SLNOQdAqGekwbLKrmgq10hDwsLKnjm7oXqhsGO1z7gLWRo/bZffEGlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887717; c=relaxed/simple;
	bh=WJw1l5C7dWOsl3t3BSS+VSSSIGILXuXga4yd98q6jkE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SNczge3NXXNs8jivbjDjW+2AYebpciINFXNE4a35/KJgGjDl7jW45WhkGYX96+tewdtQLISeO2UPCVpbOR36Nnd+dHYSzxp910KgtwyI30VGFkmtTRI89N9X7uIL7Ht1acqsH14QxNfkjp3uUJklDk9or7iZ70YblVolHl+ZxF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crh3mbX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crh3mbX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2921F000FF;
	Tue, 13 Oct 2026 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791887716;
	bh=acFml3hEL8YkzifhRvpBu0Q25U1QuvZ8zu9cqe3oLYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crh3mbX6IlPd4+y6x3S9mLk2Wgl2WZL3ekdnILtnW4IW2HDmIxJXNrjM2Sjc3/LN0
	 xE5F1aBRqz/+RWjMrBTdJa1ARXmtplSfxYTkNY2xL/3DI4IqaZ/aLQlYX/9eecTFWL
	 2ptDRut8XSceqF7ml/jnQnRTsf0KdtlGnOftAcZsyWwveE8JA3wdYaxBemyOOMNfbs
	 UcoQ5EI/NOb4NyEhvWI7G6qtNmgraP4sMAiRd010kEBBjarUQ5lIaRIM912oQaOnuR
	 irP4yKVliJM1/S9c5WPiPauDJlN/SuhOWQLsPMvmy1qai3avATurh+wq1+CoY78+M0
	 Xg9iV1W4U24mQ==
Message-ID: <sashiko-outbox-169518@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: snps,dwc3: document usb-psy-name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013102927.1141696-2-xiaqinghuan@mail.ustc.edu.cn>
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261013102927.1141696-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:35:15 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: formalizing OS-specific string property instead of =
hardware phandle
--

commit 9d9ee3558a17b54512300202ecbcaedb7bd4d866
Author: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

dt-bindings: usb: snps,dwc3: document usb-psy-name

This commit adds the usb-psy-name property to the snps,dwc3-common.yaml
binding schema. It aims to resolve dtbs_check failures by documenting a
property currently read by the driver to find the power supply.

> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml =
b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246..6609a709c1d7b 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
[ ... ]
> @@ -51,6 +51,13 @@ properties:
>        - items:
>            pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
> =20
> +  usb-psy-name:
> +    description:
> +      Name of the USB power supply accepting the input current limit
> +      requested by the gadget after USB configuration, and during bus
> +      suspend and resume.
> +    $ref: /schemas/types.yaml#/definitions/string

[Severity: Medium]
Does formalizing this OS-specific string property instead of using a
hardware phandle violate Device Tree UABI guidelines?

Adding usb-psy-name to the official schema codifies an OS-specific internal
identifier into the Device Tree UABI. Hardware relationships are typically
expected to be described using standard phandle references, such as:
power-supplies =3D <&phandle>;

Could the driver be updated to support standard phandle properties and
treat the string-based lookup as a deprecated legacy fallback, rather than
promoting it to the official UABI schema?

> +
>    snps,usb2-lpm-disable:
>      description: Indicate if we don't want to enable USB2 HW LPM for host
>        mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013102927.1141=
696-1-xiaqinghuan@mail.ustc.edu.cn?part=3D1
