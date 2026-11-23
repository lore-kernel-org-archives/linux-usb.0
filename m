Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460197;
	b=LjJI6jwsrUa0pwt/hCPJ+ShwuvmkD/Lya/FHQ1WAF5dRi0a4kWY9wrU2GaCXcilyD+De
	 8ZZKu6g3x3WXvhVWkTZVVIVzC7kAs5rOfJr9RmdgSmg18R1IK8fsTyg9EsVGPprKdkoay
	 HqCQbfcPsa4GqGYCferTFO7OyF9zsZ1tR3CV5SY3D4XRJJwgtDfmDQY6pvPJGUZRtbJC5
	 l1dFoRFsYncJYrlklarFLyq8bJSVPsybDlSrKBg+TXcH7pDtwd33ragDGWnIqOyY1BR2u
	 o50mY2RyhcW4qoOb++7vLwdxh99T1sT01pnSg5GH65IXrrq+KNIWzTpU8/9cokfH0TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460197;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZIuet0Vvwx04HqR+BS8vY8yTwHqWSF39oooQmKv0ERI=;
	b=3W13ULtu5qlS9jhjo0ze37kpymxxMRsoA7Zld3XfNJh2MUhTnwVlXnvHkeXY1IyNE9bE
	 ruCUheo63yJcMHo2lTvmbk6AhmKdhliZoKA37nbQMpl/Oi0+drgPNAG04EHw/eSDXFgsn
	 xzdWAmc+HvSszH4S2jqexc6wXLIAAN1JJogpo5o7ZfokcFAKP79uoIwS04yhY7F371W9f
	 xYadqci0Mz7rZT//8cpLjrWU3DgTPbQ1byVScAKvURBkFL5mBJRY940J12r+ICEmZc36n
	 J+tyCNPGZZWZlmrDgGONDIaJD+ubAI8bYHq17oHxankkpovWfA0dLXe9X0ZRYKETUeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ci0AUH2f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52903606A31A;
	Mon, 23 Nov 2026 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ci0AUH2f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31051F000D8;
	Mon, 23 Nov 2026 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460197;
	bh=ZIuet0Vvwx04HqR+BS8vY8yTwHqWSF39oooQmKv0ERI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ci0AUH2fMCdeFeYVUQYgJB76f3NGi0C+F206hz38HHXqaWG+VBdzVnrYHtorjEoGR
	 76dQcLyd8qyUy+4HQnYLJELcTsa+z3+xkR+h0t0YrLEOg7vEED1PQfOGXeXwwjjzAc
	 l3523vCenEvEGvvCJbo0PL9H8iiMNb7QseN97QNOAw+TkRsgog8dgTD7hMbtHSfTBb
	 PEKf3Z/vmJDBdxsS7LTMztn42/I8P5v2V1DO/8tGitjv47dtMTvlZ7qAVVB2jbDQBV
	 RGHtuIl0mu2u+edCG2apj06ipa3bz1JHEojCZJl+sSFOe8ZZa8reuQFIXjd1+4nFWd
	 KP+hMG1RWgcVg==
Message-ID: <sashiko-outbox-229887@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/7] usb: misc: qcom_eud: add per-path role switch
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123182847.143892-5-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
 <20261123182847.143892-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:56:36 +0000
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
- [High] usb: misc: qcom_eud: infinite probe deferral and wrong fwnode
  in eud_init_path()
--

commit 9854aac37e71428a22eccd3000ca7589c021cc4d
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add per-path role switch support

This commit replaces the chip-level USB role switch with per-path role
switches that relay role changes from each USB connector to its
corresponding USB controller.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index a3afa3bb93481..48e474bdf818c 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
[ ... ]
> @@ -328,14 +359,61 @@ static int eud_init_path(struct eud_chip *chip, str=
uct device_node *np)
>  				     "failed to get controller node for path %u\n", path_num);
> =20
>  	path->phy =3D devm_of_phy_get_by_index(chip->dev, controller_node, 0);
> -	of_node_put(controller_node);
> -
> -	if (IS_ERR(path->phy))
> +	if (IS_ERR(path->phy)) {
> +		of_node_put(controller_node);
>  		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
>  				     "failed to get PHY for path %d\n", path_num);
> +	}
> =20
>  	chip->paths[path_num] =3D path;
> =20
> +	of_property_read_string(controller_node, "dr_mode", &dr_mode);
> +
> +	/* No role switch needed for fixed role controllers */
> +	if (!strcmp(dr_mode, "host")) {
> +		path->curr_role =3D USB_ROLE_HOST;
> +		of_node_put(controller_node);
> +		return 0;
> +	}
> +
> +	if (!strcmp(dr_mode, "peripheral")) {
> +		path->curr_role =3D USB_ROLE_DEVICE;
> +		of_node_put(controller_node);
> +		return 0;
> +	}
> +
> +	path->curr_role =3D USB_ROLE_NONE;
> +
> +	sw =3D usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node)=
);
> +	if (!sw) {
> +		of_node_put(controller_node);
> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
> +				     "Failed to get controller role switch for path %d\n",
> +				     path_num);
> +	}
> +	path->controller_sw =3D sw;
> +
> +	of_node_put(controller_node);
> +
> +	path->np =3D of_node_get(np);
> +	role_sw_desc.fwnode =3D of_fwnode_handle(path->np);
> +	role_sw_desc.set =3D eud_role_switch_set;
> +	role_sw_desc.driver_data =3D path;
> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
> +	role_sw_desc.name =3D path->name;
> +
> +	path->eud_sw =3D usb_role_switch_register(chip->dev, &role_sw_desc);

[Severity: High]
As reported by Konrad Dybcio on v9 [1], will eud_init_path() defer probe
forever when a controller omits dr_mode (or sets it to "otg") without a
usb-role-switch property?

When a DWC3 node omits both dr_mode and usb-role-switch (such as
usb_2_dwc3 on SM8350), dwc3_get_dr_mode() falls back to
USB_DR_MODE_PERIPHERAL at runtime and dwc3_drd_init() never registers a
usb_role_switch:

drivers/usb/dwc3/core.c:dwc3_get_dr_mode() {
    ...
		if (mode =3D=3D USB_DR_MODE_OTG && !dwc->edev &&
		    (!IS_ENABLED(CONFIG_USB_ROLE_SWITCH) ||
		     !device_property_read_bool(dwc->dev, "usb-role-switch")) &&
		    !DWC3_VER_IS_PRIOR(DWC3, 330A))
			mode =3D USB_DR_MODE_PERIPHERAL;
    ...
}

Because eud_init_path() only checks for explicit "host" and "peripheral"
strings before calling usb_role_switch_find_by_fwnode(), eud_probe() will
fail permanently with -EPROBE_DEFER on any board with such a path.

Also, when np is the legacy "ports" child node (handled earlier in
eud_init_path()), setting role_sw_desc.fwnode to
of_fwnode_handle(path->np) registers path->eud_sw on the "ports" node,
which of_fwnode_graph_get_port_parent() skips in favor of the parent EUD
device node during usb_role_switch_get() lookup, so the connector can
never resolve path->eud_sw.

[1] https://lore.kernel.org/r/d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123182847.1438=
92-1-elson.serrao@oss.qualcomm.com?part=3D4
