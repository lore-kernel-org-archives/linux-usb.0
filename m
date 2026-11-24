Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510943;
	b=n0VAdPbUskuJCj7vrhDxxmUyxKIfGZblrLY86TyzBeYsKSymcR5W02IKIsMLiiCinti8
	 e4f8mS9omDHuF4TyVj4KDRjnalK4DZ+ZY8DFFo0KvHmSZOLrrzr3EvXLowi+5MKHshoZE
	 lHTfHQNS3IW6ItBebNHhxiFWlEhxkwO1DBKuH9DE6XkyNk4/4psv/437CKLcL2Gann+kK
	 qfe8N/466SNNB+8fFs1xW0w0l175N+Jg5+C5VZC03XCqPRZ/NiwAC4mQCjCXe/4ez0iyN
	 NmRk+FWNiSn5GWLe8pd8ZX98qD7V4v9VfYdaT9NMk6nWcSsZPlEElyQPbd3LejsIkKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510943;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J1CkvupvY5Rh2hUSr75gjKe6yzmnp7wN+xOQtuZUjK0=;
	b=XtkS7F8kpJs131Ia1QMNR3ctCSrNKpuYqbxXfDGTMX5o2V+7NkyXnAWgTdBzdRXJlyqD
	 rQWxTd5A86RLiwyg7eLroNkQXjqT+cYXRSZiMYUoCifFn83/6prHScMNbqQHcEgKkjLzE
	 aTK9zdjPekOm8LpUTWjRLqjMfyDP2/99s9IFAqm0SWTAIOPZ3qhrmh898xZeL/j7yt935
	 BHRjDGypr3o1uLEjQb/eJihMJLXFm43+pKhM1WqlJ/+uhsSq6TH65zAjv1tKk5bHzsEpj
	 OomziWkn8+UfSoeb8ZyWOBluNzoAYSEHQC9ME1fyfUZlIBLJnL7KhLeLiZt9PwUHYrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e3UdJ/Cf";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626FC606A31E;
	Tue, 24 Nov 2026 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3UdJ/Cf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F5A1F000CA;
	Tue, 24 Nov 2026 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795510942;
	bh=J1CkvupvY5Rh2hUSr75gjKe6yzmnp7wN+xOQtuZUjK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e3UdJ/CfqaqmOAkuHsmIG6YUNFMmXOZqWr4TnBE54S9kPXVeErYTBixMNDRzR5ITx
	 ArULVlmRrzFmyrSTzjfgSkOP031/DDAw92/PR9opD4HIks52OVtwyFLXeNESCP6pUK
	 gMqm/gKkHAHMcf01IW02J6HBiWeaLhjLpdW5R7pS5T5dTZbCUCtCkVeF4mxNcgdGi6
	 E7bgM7+w+yif3DPNuq60aDcats0sIwDBmA0QZgIZNijCFwLN0s/Ry/jTU1wivWVcqX
	 j+F9pDSquNW0raR55TtmRC4Ygj1LPm0I0y+5Iy9aNk42Hp4fLk6Sw5FksooQrZdLOW
	 qqh1wmW8GgjVw==
Message-ID: <sashiko-outbox-230776@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: cypress,cypd4226: Add
 cypd6129/cypd6229 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-1-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
 <20261124-ucsi-ccg-cc-orientation-v3-1-73cd114e5393@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:02:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] dt-bindings: usb: cypress,cypd4226: forbidding pinctrl breaks
  dtbs_check
--

commit 11119299ad04fdbd9d099cb405886c5e195a210d
Author: Akash Kumar <akakum@qti.qualcomm.com>

dt-bindings: usb: cypress,cypd4226: Add cypd6129/cypd6229 support

This commit extends the cypress,cypd4226 device tree binding to support
the cypd6129 and cypd6229 dual Type-C PD controllers, adds pinctrl and
wakeup-source properties, and relaxes reg and interrupts constraints.

> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml =
b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> index 0620d82508c17..d923ef82ecfaa 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

[ ... ]

> @@ -40,6 +46,19 @@ properties:
>        - "nvidia,gpu" for the NVIDIA RTX product series
>        - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
> =20
> +  pinctrl-0: true
> +  pinctrl-1: true
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  wakeup-source:
> +    description: enable IRQ remote wakeup, see power/wakeup-source.txt
> +    type: boolean
> +
>  patternProperties:
>    '^connector@[01]$':
>      $ref: /schemas/connector/usb-connector.yaml#
> @@ -57,6 +76,24 @@ anyOf:
>    - required:
>        - connector@1
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cypress,cypd4226
> +    then:
> +      properties:
> +        reg:
> +          const: 0x08
> +        pinctrl-0: false
> +        pinctrl-1: false
> +        pinctrl-names: false
> +        wakeup-source: false

[Severity: Medium]
Does setting pinctrl-0, pinctrl-1, pinctrl-names, and wakeup-source to
false for cypress,cypd4226 cause a dtbs_check regression on existing
boards?

pinctrl-0 through pinctrl-8 and pinctrl-names are standard pin-controller
consumer properties already allowed on all device nodes by the dtschema
core without needing to be declared in individual bindings, and
wakeup-source is a board-level host interrupt property applicable to any
of these controllers.  In particular, an existing in-tree cypress,cypd4226
node uses pinctrl-0 and pinctrl-names for its host interrupt GPIO and will
now fail schema validation:

arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts {
    ...
	typec@8 {
		compatible =3D "cypress,cypd4226";
		reg =3D <0x08>;
		pinctrl-0 =3D <&typec_default_state>;
		pinctrl-names =3D "default";
		interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
    ...
}

Dropping the top-level pinctrl-* declarations and removing pinctrl-0,
pinctrl-1, pinctrl-names, and wakeup-source from the cypress,cypd4226
if/then block would avoid this failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-ucsi-ccg-c=
c-orientation-v3-0-73cd114e5393@oss.qualcomm.com?part=3D1
