Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732592;
	b=dJyqeni9AVnRbYluBDCUjS5DcQGv9BSFNJj7500qxTJCut2SrubdLsRMloHcS656Sl60
	 rq7Wc+P+jueN/nLGUtz5HVqkCYSI1elHChgsrQF6B7iiav4vyrqO6OyZMYAp4zyJMq6aV
	 74Chr384Tm8KaIn7wTR9kyjjDWD/TFxnMLVRC8Oxplq1C+Hq0nFujbMPhXfu+dJednL3p
	 EGTsaW+Ey2/e7opNJlYeGNomKczyCaDumg9D8HkxaTfMgwODpTQ8GAm84ut8ihoTIyT6j
	 NdbSquI6KN87be2e0sBe626zewZ762wkAoXx5yVyZMwy0Ok7C4dnax0IFDxIGULQt1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xvEXD0A13TlEkJSjJvxPTvrIHXODTzRlnVR3jcsajDA=;
	b=XOOkM/M+2ogSYaOT/UJw0xXaPoD8yHmk+EwQsdYF56tCuggMYQW82CCwxjg2GgCGGUF/
	 Fv/lMN9GgIk1gDpr/31D7ab37C6F7ktycqHJa3f8QCq9grTNKb6ydcBI1iSrTJwns1mo/
	 +67uMfnv/hHIPs4xUO6nLqsJnX7/l+OnDjjwRBc2nw6S8sKdTypSvkDRKvbJpW6Sh3FHB
	 nsGSb1YBDlIab6r6PBA9UdZ8Iyu5pCbF1tM/hBoILK9XQvq+GeO+i21bq6begAi3++PyY
	 rVtTkDz9xPoIaZAx1ZKjXT0u7WatRUWfU6/UDf+iJUm5g9hbWPG4zHGjhBarX9RICOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XlW37u8u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A9C606A328;
	Tue,  3 Nov 2026 19:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XlW37u8u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0EA1F000C1;
	Tue,  3 Nov 2026 19:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793732591;
	bh=xvEXD0A13TlEkJSjJvxPTvrIHXODTzRlnVR3jcsajDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XlW37u8uobYgOg/xeAwypZCFonefwEbObwyYNMDAfMwHvFMeG97UK8RZr2VMv04ej
	 k/Xf9RnBvvs3f42R3op/Hf09zPyI0hcl1VxYAaSuR4zgGk68jUT+rF3DiTzK9n7+V0
	 7pQer3ztCfLD03skANfSM8dPl1rxGLr6dw7XzzrawcmC6gklRLeRP6g7//rluIij2J
	 SUDEFcR92MicTFV1nkCkHfRuGNkJiRc58iAC+OAt874U2KsS4FEaBWBoMQNE+MGAij
	 kyWBf6OoDvNkMpbhsBo3Bgjp3wiP46iolir753Vvk5ovQjd/PBCaVoJwzIkffWVsRX
	 zY9UsfrL6a8tw==
Message-ID: <sashiko-outbox-195874@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: misc: usb251xb: configure battery charging
 from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jhon Wilker Rodrigues Aquino" <jhonwilker0112@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103185514.72144-3-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103185514.72144-3-jhonwilker0112@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 19:03:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: misc: usb251xb: missing bat_support check in usb251xb_get_o=
fdata()
--

commit 7116fd963729fc92bbd453fc4d055b0129eabda3
Author: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

usb: misc: usb251xb: configure battery charging from DT

This commit parses the battery-charging-enable port list from the device tr=
ee
to configure the battery charging enable register on USB251xB hubs.

> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index fb0693742f018..166eb541ef161 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -577,6 +577,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  			      (wchar_t *)hub->serial,
>  			      USB251XB_STRING_BUFSIZE);
> =20
> +	hub->bat_charge_en =3D USB251XB_DEF_BATTERY_CHARGING_ENABLE;
> +	usb251xb_get_ports_field(hub, "battery-charging-enable", data->port_cnt,
> +				 true, &hub->bat_charge_en);

[Severity: Medium]
Should parsing "battery-charging-enable" in usb251xb_get_ofdata() be gated =
on
data->bat_support?

Commit dd99d106de25 ("usb: misc: usb251xb: Add structure for holding chip
specific values") introduced bat_support in struct usb251xb_data, setting it
to false for usb2517_data and usb2517i_data because the USB2517/USB2517i
variants do not support battery charging:

	static const struct usb251xb_data usb2517_data =3D {
		.product_id =3D 0x2517,
		.port_cnt =3D 7,
		.led_support =3D true,
		.bat_support =3D false,
		.product_str =3D "USB2517",
	};

Earlier in usb251xb_get_ofdata(), the variant-specific LED property checks
data->led_support before applying the configuration:

	if (data->led_support && of_get_property(np, "led-usb-mode", NULL))
		hub->conf_data3 &=3D ~BIT(1);

Without a similar check on data->bat_support here, bat_support remains unus=
ed
and probing a USB2517 or USB2517i node with "battery-charging-enable" prese=
nt
in the device tree will populate hub->bat_charge_en and write non-zero valu=
es
to the reserved register 0xD0 (USB251XB_ADDR_BATTERY_CHARGING_ENABLE) during
usb251xb_connect().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103185514.7214=
4-1-jhonwilker0112@gmail.com?part=3D2
