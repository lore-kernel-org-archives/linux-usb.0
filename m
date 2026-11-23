Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459716;
	b=3YGaGBarHojGB02TMfGlCHxwNFQM9kEnpSsNcmk9dE3266tykIghlwpDH9/PQNxQlC1F
	 g3b9YMCp7VtALEz7fMxulFyG1Kf2zZWX0K23haXMWz2ajQEyeSDQtRbAOvBeIr23Jnu6c
	 mm7WSjLTWhoRfq3LjwmOUs/kpQm5ZrwM/JHp2LksjIL4WUg9aL/0EBc776qJITl4jvex8
	 ptGED8kafTpfvIvkGGgpxWLDDeVMW+ttJmcbbhfMgssudUi4YKCLU1gsPs8sy3N2H0is+
	 Z7JtDM7MokraET/F5232A8YSSSdhDy+svvmVJB/NLWTLSJayKmGOlkBEAQ5B4ShSJKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459716;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xXNRP6N11HCJmcGvV43+RSr6DG3BdnYd3pIeleM93pY=;
	b=yaaXFMNmMk0C8HOegzVPK227KoMCVzRyRUH5jzyo2x1AkKB6p/TBw+mkRFxPSyTDpxrr
	 SpH2Ft/OcoHM/d9EhVhePg19md3EX4oQmHPOB5LzE4OD2qZZMyOKx0MLd5oyLOZ3b2TjC
	 GOeTmp01Qt4g2+8UI5uVkugeLbaZ17UcaKGYob1lj1zi/aLaJFXZassviCwMwIpfpuTzt
	 /YjOd21URPFKuT0pAzT4OC2rQGNtljMEbnK+ee6QxI6g4g9KbSLMjtLptyEqkETOTxaba
	 Vpsgzi+TxdtOb0/U4D6kAkwSrSMvLuUfHZ828j+KLhYcnF5/ww136wEp53fnuKMTspw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjcLTuAc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0939606A31A;
	Mon, 23 Nov 2026 18:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjcLTuAc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578691F000CF;
	Mon, 23 Nov 2026 18:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459716;
	bh=xXNRP6N11HCJmcGvV43+RSr6DG3BdnYd3pIeleM93pY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GjcLTuAc+s+/vhQS/0PUSAw2duT0R+FKUjhOKx3IGRdkTgi25ZO2DwQgj+hBjPTkj
	 zWGcDOpi3EW6y8YZrj2KQcoF4T9jnTCQTli6CTpLDYYP2JEvkVzYR/kK6+hy3vtUtw
	 +q+T5ckE2YByV/Ei7pWOcek2xOUo44wHIIBWrE3Gsj76BHlsLymLCQyCIVBog+S6aM
	 jEtL7Ia7oTlklOrKXjxCZqxNkJsKhHuSbysW+G1H/QKMzuzC2ZYPxG0enrUfSu/xgg
	 3wv4D6n2teeIIPq+OWC00RY0EcaE1Te8zRlnXv/F4c3Tm1F/sr89jralYN4U/q05nK
	 uJfzY0n/HSJhA==
Message-ID: <sashiko-outbox-229871@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/7] usb: misc: qcom_eud: add per-path High-Speed
 PHY control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123182847.143892-4-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
 <20261123182847.143892-4-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:48:35 +0000
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
- [Medium] usb: misc: qcom_eud: eud_probe() fails when secondary path is
  disabled in DT
--

commit e2fd91a7c0ed5f3452a494a0a91ef1ddd34b1c26
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path High-Speed PHY control

This commit adds per-path High-Speed PHY management to the Qualcomm EUD
driver so that the PHY associated with the selected UTMI path is
initialized and powered when EUD is enabled.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index fa640e88c88b5..a3afa3bb93481 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

> @@ -228,8 +294,54 @@ static void eud_role_switch_release(void *data)
>  	usb_role_switch_put(chip->role_sw);
>  }
> =20
> +static int eud_init_path(struct eud_chip *chip, struct device_node *np)
> +{
> +	struct device_node *controller_node;
> +	struct eud_path *path;
> +	u32 path_num;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(np, "reg", &path_num);
> +	if (ret) {
> +		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0=
 */
> +		if (of_node_name_eq(np, "ports"))
> +			path_num =3D 0;
> +		else
> +			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
> +					     np->name);
> +	}
> +
> +	if (path_num >=3D EUD_MAX_PORTS)
> +		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max=
 %d)\n",
> +				     path_num, EUD_MAX_PORTS - 1);
> +
> +	path =3D devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
> +	if (!path)
> +		return -ENOMEM;
> +
> +	path->chip =3D chip;
> +	path->num =3D path_num;
> +
> +	controller_node =3D of_graph_get_remote_node(np, 0, -1);
> +	if (!controller_node)
> +		return dev_err_probe(chip->dev, -ENODEV,
> +				     "failed to get controller node for path %u\n", path_num);
> +
> +	path->phy =3D devm_of_phy_get_by_index(chip->dev, controller_node, 0);
> +	of_node_put(controller_node);
> +
> +	if (IS_ERR(path->phy))
> +		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
> +				     "failed to get PHY for path %d\n", path_num);
> +
> +	chip->paths[path_num] =3D path;
> +
> +	return 0;
> +}
> +
>  static int eud_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np =3D pdev->dev.of_node;
>  	struct eud_chip *chip;
>  	struct resource *res;
>  	int ret;
> @@ -258,7 +370,22 @@ static int eud_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	chip->mode_mgr =3D res->start;
> =20
> +	for_each_child_of_node_scoped(np, child) {
> +		ret =3D eud_init_path(chip, child);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Primary path is mandatory. Secondary is optional */
> +	if (!chip->paths[0])
> +		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");

[Severity: Medium]
Does eud_probe() fail on dual-path SoCs when a board disables the secondary
path or its USB controller/PHY in Devicetree?

for_each_child_of_node_scoped() visits child nodes even when they are
marked status =3D "disabled" (unlike
for_each_available_child_of_node_scoped()).  In Addition, on dual-path SoCs
where the SoC dtsi defines both eud-path@0 and eud-path@1, if a board leaves
the secondary USB controller disabled then of_graph_get_remote_node()
returns NULL (failing probe with -ENODEV), and if the secondary High-Speed
PHY is disabled then devm_of_phy_get_by_index() returns -EPROBE_DEFER
indefinitely, preventing EUD from probing even for the primary port.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123182847.1438=
92-1-elson.serrao@oss.qualcomm.com?part=3D3
