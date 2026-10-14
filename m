Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BF6377A8E;
	Wed, 14 Oct 2026 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966675; cv=none; b=fqR7cRVggOspHE1SGUNQ6JxRKvGKmA567sxBsHE3C9xfZZ6RuEPNb/7UpZXivlW1qesCxJLDBnn99SiQjVQnHEVopSbMNDRjSr/QGAEkTNDZkGdl1cHjc++Kws1Vq7rSPyN3t80IytL5YoCaHiUq1Exh2bu4SNHiQPBy+APhRlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966675; c=relaxed/simple;
	bh=UMQISortcJCYleelx2lG4HWT8wfyJfCiExCYLZjm27g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Hm3HCyq8roRgwvREKQcZXoAHdpryRK21GGjTuG6aZWDeVLgj6wKFtbAQi/i8qHeW5cQ3eSgGWjSFNtwbYudHwS2oByFjuWfdFsn48K7Tc4KwcDneXE8nwILuMR0bRuRSjn3TQT3qR09AfShiAV5NaAxf257JPKdEpPBejRr860M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUC3UBLd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUC3UBLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5A61F000FF;
	Wed, 14 Oct 2026 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791966673;
	bh=tXNn+deNPznIegy6+MGWsYc7dphJ8Z6B9PltX1beX6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kUC3UBLduKkIA6FI0FDksAQyUNMmigJFcL2ar3weSDljHGbNLK0x04RsGgqL6NAgv
	 Xl7YF2oKLYpFKhj5zJo07ZWeReEnn8js4dH7165vr9kMNA7KNM2Mo4ZKTjCmU1YDZV
	 lW7HkYg9E8nYLyHlTcwfiRWGQQrwzGcpw+jnjLHCY8mMZ6IwZYeIoTfelSM5zQKI14
	 Ssn+nr6QeTh8D9EFQyh68Iy47pdswfwxzhITwfQZtG95pALjpjfSpebfLg5PaOnHeL
	 Y0mHT86NXBIBzcsnCrZ2LmAPI6PUd9cGc+JFyHQIdBZsA39WpvmYz67JVnf2N/yZgl
	 E4P4MTefKk0PQ==
Message-ID: <sashiko-outbox-171010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261014082037.1774672-2-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 08:31:12 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: usb: port@0 schema constraint bypassed
--

commit aaa6107663f4d524c266c3a18264c416a86a4bb4
Author: Chen-Yu Tsai <wenst@chromium.org>

dt-bindings: usb: hcd: Add downstream USB ports

This commit adds a "ports" child node to the USB HCD binding to support
connecting downstream USB connector nodes via OF graph. It attempts to enfo=
rce
that USB downstream port numbers start at 1, and updates the address matchi=
ng
for hard-wired downstream devices.

> diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documen=
tation/devicetree/bindings/usb/usb-hcd.yaml
> index 45a19d4928afa..24df99dfb243c 100644
> --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> @@ -29,8 +29,16 @@ properties:
>    "#size-cells":
>      const: 0
> =20
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description: The downstream facing USB ports
> +
> +    patternProperties:
> +      "^port@[1-9a-f][0-9a-f]?$":
> +        $ref: /schemas/graph.yaml#/properties/port

[Severity: Medium]
Does this local constraint actually prevent port@0 from passing validation?

Since JSON schema patternProperties only restrict matching nodes, a
non-matching node like port@0 will fall back to the generic graph.yaml
reference.

Because graph.yaml evaluates anything matching ^port(@.*)?$, wouldn't
port@0 be evaluated as valid and silently pass, completely bypassing the
intent that downstream port numbers start at 1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014082037.1774=
672-1-wenst@chromium.org?part=3D1
