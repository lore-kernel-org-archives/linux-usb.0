Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967050;
	b=1hTbqaw3BUpuHonh+TPNfK9eRHGz2h3/NHtr39RUjF7gDfJLKZ3PSc7x+IYMjp5wohEa
	 gRfgvnEPAud4dEaen1UbDRMq8QyG0SSMsn3n+Ee5RESxbqUXG/8Bo/jm+j16WDgqVJTjF
	 QXR0sKr9KuyVfC16TxqGF8sqqasiKNoY+aTxCnH9LEP1I/KxonkSnVDWhxlQmLhoZJcA/
	 0mai+UqLd2kRc76nJreUefo5xuWnwLylNMaC35fXKUg5QRM0mtg47KGSrjkPiq/aw5L+C
	 omjIeXKMkNBTR4r2BPcKE1Tvpbc/4ngZ6zsAX6SInumYjPgO0tqBp355+60GcgKvZqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967050;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W015he7B5bjTSU+uOSOp7L67FjWT6XL62CJ4heKKvGg=;
	b=SNzfBeYrs7ZXDsOtofnhp8zbVOa7TSe8rCfrspcLxhXqFWu7ni38NXknyusQ3pQzAbo1
	 VbYfZaytpkBz+Ouaknq8ojehuNNqmCRAK8p+FLgyj/0k+VibQDUTsGCpRNoq6bWk2CLLe
	 Pkwvp1of7wvuuFZPYCokJZtOoCZyD6B8UGABHd63knvs4cm3OWFVeQwHagGHX8I14CAkL
	 r6ry6aekdXWqqrZSdbNPZahB9RgSG8y8rb5rCptDPxGaxmP/aEubJvAEFaRRbmSEDNXCc
	 KKtwCJiaMmws5Bw0E9q7pB4LMKLwtBRQy2uf3KjRd6IoNhDrW2+XEJrz4ZogNF+P4AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVM4V+v6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE290606D81A;
	Fri,  6 Nov 2026 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dVM4V+v6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573251F008A6;
	Fri,  6 Nov 2026 12:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967049;
	bh=W015he7B5bjTSU+uOSOp7L67FjWT6XL62CJ4heKKvGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dVM4V+v6rh4mS4c6IksEBY07VkVF5NLj4kQmvteLEbfLT/MR3MIk0KNexgOzD4K4Z
	 L+l3GPVC+RfQy4Z2HDf8TzS43LiMkqlQ+GXnKe848YwDZnPmXnrElAjcozbQiULJ3s
	 RnsJvz4zP3miuSSAGKF7EYxHwkzKuibcltrJFyxnraVb+PKSbv+DVwg1LK4Grraqbo
	 3fCyrUoRYfNae8UZER2HHR1lMPlsb6imOLJYORwH7s4JLU0HqledVNID65hMIpHwdz
	 rAExhFGIzR+jBwETLioKJL8oaCFdUVPGIuPcw4onkWAIINqJjNLtDY3TXNFus6Q/r9
	 6EcHBpVWvZ0Hw==
Message-ID: <sashiko-outbox-201388@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: allow external charger detection to
 set USB_TYPE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Baluta" <daniel.baluta@nxp.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261106115742.730704-1-daniel.baluta@nxp.com>
References: <20261106115742.730704-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:10:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] usb: typec: tcpm: tcpm_psy_set_prop() rejects USB_TYPE on
  non-PD ports
- [Medium] usb: typec: tcpm: unlocked usb_type write in
  tcpm_psy_set_prop()
- [Low] usb: typec: tcpm: inaccurate psy_desc.usb_types claim in commit
  message
--

commit 5e903d3047946eea57f9c3fe92ba30e6462da7b9
Author: Li Jun <jun.li@nxp.com>

usb: typec: tcpm: allow external charger detection to set USB_TYPE

This commit teaches tcpm_psy_set_prop() to accept POWER_SUPPLY_PROP_USB_TYPE
and adds the BC1.2 USB types to psy_desc.usb_types.

>     Teach tcpm_psy_set_prop() to accept writes of
>     POWER_SUPPLY_PROP_USB_TYPE and store the value in port->usb_type, and
>     advertise the BC1.2 USB types (SDP/DCP/CDP/ACA) in
>     psy_desc.usb_types so power_supply_set_property() callers are not
>     rejected by power_supply_has_property().

[Severity: Low]
Is the commit message accurate about how psy_desc.usb_types is checked?

power_supply_set_property() calls psy->desc->set_property() directly, and
power_supply_has_property() only checks psy->desc->properties.  Instead,
psy_desc.usb_types is used by power_supply_format_property() and
power_supply_show_enum_with_available() when formatting
POWER_SUPPLY_PROP_USB_TYPE for sysfs reads and uevents.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d721baef52104..24f4e8854f37f 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -8766,6 +8766,10 @@ static int tcpm_psy_set_prop(struct power_supply *=
psy,
>  	case POWER_SUPPLY_PROP_CURRENT_NOW:
>  		ret =3D tcpm_aug_set_op_curr(port, val->intval / 1000);
>  		break;
> +	case POWER_SUPPLY_PROP_USB_TYPE:
> +		port->usb_type =3D val->intval;
> +		ret =3D 0;
> +		break;

[Severity: Medium]
Does tcpm_psy_set_prop() reject POWER_SUPPLY_PROP_USB_TYPE on non-PD ports?

At the start of tcpm_psy_set_prop(), the !port->pd_supported check still
runs unconditionally before the switch statement:

drivers/usb/typec/tcpm/tcpm.c:tcpm_psy_set_prop() {
	/*
	 * All the properties below are related to USB PD. The check needs to be
	 * property specific when a non-pd related property is added.
	 */
	if (!port->pd_supported)
		return -EOPNOTSUPP;
}

On a Type-C port with pd-disable set, power_supply_set_property() for
POWER_SUPPLY_PROP_USB_TYPE will always fail with -EOPNOTSUPP instead of
updating port->usb_type.

[Severity: Medium]
Can this unlocked write to port->usb_type race with the TCPM state machine
and overwrite a negotiated PD type or a disconnect reset?

All TCPM updates to port->usb_type in tcpm_pd_select_pdo() and
tcpm_reset_port() run under port->lock, while BC1.2 detection runs
asynchronously in PHY workqueues after tcpm_mux_set() sets USB_ROLE_DEVICE:

CPU0 (TCPM kthread)               CPU1 (PHY charger work)
tcpm_pd_select_pdo()
  mutex_lock(&port->lock)
  port->usb_type =3D
    POWER_SUPPLY_USB_TYPE_PD;
  mutex_unlock(&port->lock)
                                  power_supply_set_property()
                                    tcpm_psy_set_prop()
                                      port->usb_type =3D val->intval;
                                      <-- clobbers PD usb_type with BC1.2

If BC1.2 detection finishes after PD capability negotiation (or after a
Data Role Swap to device mode) or after unplugging the cable,
tcpm_psy_set_prop() overwrites POWER_SUPPLY_USB_TYPE_PD or
POWER_SUPPLY_USB_TYPE_C with a stale BC1.2 type because it neither holds
port->lock nor checks port->attached and port->pd_capable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106115742.7307=
04-1-daniel.baluta@nxp.com?part=3D1
