Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671393;
	b=Wms/hntbcBQql0jG0bYrkn+W1KmNQ6KB3a2vCBqQRnIhgAFc/bPrMJ+U61CoX0OXHG8F
	 wLk+0PpBKqIt8J01xMljrBJtyEwjuLK6gszq7KadkFT6659OgEQB79liRw4FNs/1iw1wX
	 IrX9AJT6x9hd35W8JKymfiraLgzkEN6G+QUXa5L1Fnn7/XDFK1XlNM6VwtWMvqim07x/e
	 vA8KtOrm5p9dZtSTuDaGjPpc73x7i36GbKJ0gJskP9k/lg20jKiIWYU0/2I3Lm8PMMXdQ
	 8JamnPOhGjhJMWml5tnZXRolWc7OPrqXLKSahNY3AGq9NXwgzVrSTJ9Io1gPPbd7AyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671393;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=45JLha86NGmkcX751ovBYkD4pHH2dgPFf3eWFrWHcT0=;
	b=C98m3xXDNlOEjzhKB23ZOh9YAaQJ6Lat4F7HnzBl0Wu+3ie5Nqe6iznBXah/b1HmlzOT
	 zwkfkygkBn0dpp8RiZwGucTL/0aqcavQe6ZP6kc6ViTOoIQIqQ2wzJucdizodLruIvgGE
	 aYFM1egt/jbkqa0ZTTZc1clydN2EY0HEsLYLLxJSQqCUPmIRjNeR2EVqvQkPzHxU4Jb2p
	 qb2Ka0DO5a+k9M5qOUP13rIox6IUmkhhGTW/9hRt5Wgrj7SfhSAMWx6Ku0OMbf7sbD3Oo
	 R3ddJae5UYBaBK2dIFmxl3jo5g318gELFeaB1/BFQilJw68F+ou/vI6w9TsFsFGnn/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hLMaT7BY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7935C606A32E;
	Sat, 14 Nov 2026 15:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hLMaT7BY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73B61F000C4;
	Sat, 14 Nov 2026 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671393;
	bh=45JLha86NGmkcX751ovBYkD4pHH2dgPFf3eWFrWHcT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hLMaT7BYcy6SCzTU/NLlwTz1+zzh8SOtbXoYE1B8zOWMPaRGUgtvvSLfrYPJUkXHR
	 Kc6CHetgnnk49F/ZrVkdk37d9pCyC+OnbSZpK5i/j9UVQOC4Gs67PsKpg1H+kktVGv
	 GrHxgV+ucV5JzaeNClpP1ndtOSkYGknoesrtKhusyPsCnQ50qjtfa8cBw5wGh8CuSk
	 PUyI953Hvwf5Y0ixWotSB8BR3yUzD9mARChSJJJezG6OKTDKwLeDKI1Ita4OvyRoCJ
	 FqOQyDSRKu/LR3Zs2qOMXslN0FO7vo1dUu9l4d7Sxz5QpYsn/k23ALxlL+pGf2OyjQ
	 446cycWnW7bvw==
Message-ID: <sashiko-outbox-214731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Opaniuk" <igor.opaniuk@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
 <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:49:52 +0000
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
- [Medium] dt-bindings: soc: qcom: eud: TCSR register modeled as EUD reg
  entry
--

commit 37264f054b9e512075c1f86ca8168f643e3b2fd7
Author: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

dt-bindings: soc: qcom: eud: add the QCM2290 EUD

This commit adds the qcom,qcm2290-eud compatible string to the Qualcomm EUD
device tree binding schema and defines a third reg entry for the TCSR
register required on QCM2290.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/D=
ocumentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8d..14503527cdf2e 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -17,13 +17,17 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,qcm2290-eud
>            - qcom,sc7280-eud
>        - const: qcom,eud
> =20
>    reg:
> +    minItems: 2
>      items:
>        - description: EUD Base Register Region
>        - description: EUD Mode Manager Register
> +      - description: TCSR register that has to be set before the mode
> +          manager accepts the enable
> =20
>    interrupts:
>      description: EUD interrupt
> @@ -50,6 +54,21 @@ required:
>    - reg
>    - ports
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,qcm2290-eud
> +    then:
> +      properties:
> +        reg:
> +          minItems: 3
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 2

[Severity: Medium]
Should the TCSR register be referenced via a phandle and offset to the TCSR
syscon node rather than modeled as a third reg entry on the EUD node?

TCSR_APSS_SPARE_REG1 (0x003e5018) belongs to the separate TCSR hardware
block, which is already described on QCM2290 as a syscon node covering that
address range:

arch/arm64/boot/dts/qcom/agatti.dtsi {
    ...
		tcsr_regs: syscon@3c0000 {
			compatible =3D "qcom,qcm2290-tcsr", "syscon";
			reg =3D <0x0 0x003c0000 0x0 0x40000>;
		};
    ...
}

Putting this register into the EUD node's reg property represents a TCSR
register as part of the EUD address space and creates overlapping reg ranges
between sibling nodes on the SoC bus.  Other Qualcomm bindings that access
TCSR registers (including via qcom_scm_io_writel(), such as qcom,dload-mode
in Documentation/devicetree/bindings/firmware/qcom,scm.yaml) use a
phandle-and-offset property pointing to tcsr_regs instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-qcm2290-eu=
d-v1-0-b6157b817377@oss.qualcomm.com?part=3D1
