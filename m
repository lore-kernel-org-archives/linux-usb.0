Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CD9C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1786320717
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtENIAil"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfDYONS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:13:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39020 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfDYONS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 10:13:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id n25so10828612wmk.4;
        Thu, 25 Apr 2019 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yhaiCJs5gI4fR+0MWZwHIg/rlwebu3hkKJjIFxIXCoc=;
        b=NtENIAilU2HmFVT909pIfLMON1ho+pt9hYM32v9uRTY2gwupOeP5wnYIv5U89+FcLZ
         /7spTRhAPJa0tJ1723h8tt0u8tdu0UvBsXas2xGQaeHkOeO3Gcp7pYyvpDMpqoAuRQMs
         TJUt4KUIzFBQKoZjICVH4T24ZXQdoBmC3EUh9xzUB95/jl1njB5swDK4cdSNFxcga2yN
         /YyRyz1awG7U1CVW6FznBLOa3QRuhH9Vs3k0TP4aQ7sprXeXMbu9B2PZTX2Q4tdCJ4b9
         ekeiKDK5qT9XDDDqUuAW+8jCJK96U6bDehTpdbMjvyhdGCXTqx4j9R52lHe/34Y2GUp3
         9drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yhaiCJs5gI4fR+0MWZwHIg/rlwebu3hkKJjIFxIXCoc=;
        b=O8iOz+MhK5XBXB95eEl+sslhTqiaUAfaTzDwTEL5qX3NoZy117kTkrFOmFw2RSqLxk
         5K8Z17YGnMQtTohl74RFMqS1RnzD/eYD44MM1e/ny6+3SH75+o0TLwtVTfZp51+DnEtE
         8T+e+MEP0Sfsg3Uqj0DkcfAbNQCYajDmsZeQyMUJB4BxjFjHR9Xi8GzUaNFUBgx/coD/
         4/+dkMUM2qRpuAXiOsToMF4R/kRA8PEP/Veaw9O7fjQsucOmque1n9HZiiyZXlMlHr/v
         y/QAN7Pi7MM1iRd0jjvAXxIF54w5X5e5Pcfra7RX1oPUk8OJld39qa7OXsHsr11UC2N9
         7ciw==
X-Gm-Message-State: APjAAAX/iV4Qr+UepO2hFAsiMdiaIRLIwI1/yK9M4V1mpROorwxNJ9hI
        OABHZec73SFkr0r/7/HxEC0=
X-Google-Smtp-Source: APXvYqzycSa82HWrRCs7Kmthab93zN4hJbPokJsr7hkWJqtHs6xhN+QT9QuIRmhhUfxPBFytvdfxsQ==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr3543877wmg.132.1556201595667;
        Thu, 25 Apr 2019 07:13:15 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id x25sm3421085wmj.5.2019.04.25.07.13.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2019 07:13:14 -0700 (PDT)
Date:   Thu, 25 Apr 2019 16:13:12 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 1/8] phy: tegra: xusb: t210: add XUSB dual mode support
Message-ID: <20190425141312.GC24213@ulmo>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-2-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline
In-Reply-To: <1552302716-18554-2-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425141312.jJBMbTSo4UIKEvqapDaBe-CQEjllRU6lBvMq62rFf_Y@z>


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 04:41:49PM +0530, Nagarjuna Kristam wrote:
> The device tree bindings document the "mode" property of "ports"
> subnodes, but the driver was not parsing the property. In preparation
> for adding role switching, parse the property at probe time and
> confgiure the port capabilities accordingly
>=20
> Based on work by JC Kuo <jckuo@nvidia.com>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 22 +++++++++++++++++++---
>  drivers/phy/tegra/xusb.c          | 24 +++++++++++++++++++++++-
>  drivers/phy/tegra/xusb.h          |  4 +++-
>  3 files changed, 45 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index 05bee32..4beebcc 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
>   * Copyright (C) 2015 Google, Inc.
>   *
>   * This program is free software; you can redistribute it and/or modify =
it
> @@ -47,7 +47,10 @@
>  #define XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_XUSB 0x1
> =20
>  #define XUSB_PADCTL_USB2_PORT_CAP 0x008
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DISABLED(x) (0x0 << ((x) * 4=
))
>  #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(x) (0x1 << ((x) * 4))
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DEVICE(x) (0x2 << ((x) * 4))
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_OTG(x) (0x3 << ((x) * 4))
>  #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_MASK(x) (0x3 << ((x) * 4))
> =20
>  #define XUSB_PADCTL_SS_PORT_MAP 0x014
> @@ -72,6 +75,7 @@
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x4=
0)
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL 0x1
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18 (1 << 6)
> =20
>  #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x) (0x088 + (x) * 0x40)
> @@ -965,7 +969,14 @@ static int tegra210_usb2_phy_power_on(struct phy *ph=
y)
> =20
>  	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_PORT_CAP);
>  	value &=3D ~XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_MASK(index);
> -	value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(index);
> +	if (port->mode =3D=3D USB_DR_MODE_UNKNOWN)
> +		value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DISABLED(index);
> +	else if (port->mode =3D=3D USB_DR_MODE_PERIPHERAL)
> +		value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DEVICE(index);
> +	else if (port->mode =3D=3D USB_DR_MODE_HOST)
> +		value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(index);
> +	else if (port->mode =3D=3D USB_DR_MODE_OTG)
> +		value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_OTG(index);
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PORT_CAP);
> =20
>  	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> @@ -997,7 +1008,12 @@ static int tegra210_usb2_phy_power_on(struct phy *p=
hy)
>  			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
>  	value &=3D ~(XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK <<
>  		   XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT);
> -	value |=3D XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
> +	if (port->mode =3D=3D USB_DR_MODE_HOST)
> +		value |=3D XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
> +	else
> +		value |=3D
> +		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL <<
> +		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT;
>  	padctl_writel(padctl, value,
>  		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
> =20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 5b3b886..c6178a0 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2014-2015, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
>   *
>   * This program is free software; you can redistribute it and/or modify =
it
>   * under the terms and conditions of the GNU General Public License,
> @@ -542,13 +542,35 @@ static void tegra_xusb_port_unregister(struct tegra=
_xusb_port *port)
>  	device_unregister(&port->dev);
>  }
> =20
> +static const char *const modes[] =3D {
> +	[USB_DR_MODE_UNKNOWN] =3D "",
> +	[USB_DR_MODE_HOST] =3D "host",
> +	[USB_DR_MODE_PERIPHERAL] =3D "peripheral",
> +	[USB_DR_MODE_OTG] =3D "otg",
> +};
> +
>  static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *us=
b2)
>  {
>  	struct tegra_xusb_port *port =3D &usb2->base;
>  	struct device_node *np =3D port->dev.of_node;
> +	const char *mode;
> =20
>  	usb2->internal =3D of_property_read_bool(np, "nvidia,internal");
> =20
> +	if (!of_property_read_string(np, "mode", &mode)) {
> +		int err =3D match_string(modes, ARRAY_SIZE(modes), mode);
> +
> +		if (err < 0) {
> +			dev_err(&port->dev, "invalid value %s for \"mode\"\n",
> +				mode);
> +			usb2->mode =3D USB_DR_MODE_UNKNOWN;
> +		} else {
> +			usb2->mode =3D err;
> +		}
> +	} else {
> +		usb2->mode =3D USB_DR_MODE_HOST;
> +	}
> +
>  	usb2->supply =3D devm_regulator_get(&port->dev, "vbus");
>  	return PTR_ERR_OR_ZERO(usb2->supply);
>  }

This hunk has now been merged as part of commit 5311a7b89502 ("phy:
tegra: xusb: Parse dual-role mode property"), which is now in linux-next
as of next-20190418. So you may want to rebase.

Thierry

> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index b49dbc3..17cc8dc 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2014-2015, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
>   * Copyright (c) 2015, Google Inc.
>   *
>   * This program is free software; you can redistribute it and/or modify =
it
> @@ -18,6 +18,7 @@
>  #include <linux/io.h>
>  #include <linux/mutex.h>
>  #include <linux/workqueue.h>
> +#include <linux/usb/otg.h>
> =20
>  /* legacy entry points for backwards-compatibility */
>  int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev);
> @@ -272,6 +273,7 @@ struct tegra_xusb_usb2_port {
> =20
>  	struct regulator *supply;
>  	bool internal;
> +	enum usb_dr_mode mode;
>  };
> =20
>  static inline struct tegra_xusb_usb2_port *
> --=20
> 2.7.4
>=20

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzBwHIACgkQ3SOs138+
s6HAtQ/8Cr8g50fJsOOOH6XNrerg/z7aNqXBeXAtMbPOR3016EHtkkKh54c/QMcc
VE3ToQ+a5Yoxcg+SLj1I9+LZxNFO+ge1xDQ8BoNIDHEyCDM4JKnLbeF21HaSioND
ZZuM6POmJxFyxM4J6uUYHgknQt16cktZm+6JEPCrHzzToq58NDJTBzWDqdZaJ27z
KWGVg2BvkXCS4zES5zHKewZuOLgdFWUbfSJAwBJ8dsa8HJbjQYkxc2uJf75w7ece
heEML9mg13pXFFtZttOVst3BPODABKUU2egnLK5s5Ff8HdUBmeIelU1GVxw0fmAn
3QWBtuOQDy097jVMi9nPcUpAJTy/PitpV7nwqGiWOvdxjxu51A01bSi++e9kq/o5
t2uqFliZyXbLO0vx/LJS9vBO+ySlbcKRfj+6D9u249mxP94s+HbQrKP0I2GA/Obf
AvZCFxepK422V/yngSIZW6iAP1E1MhckwvZpIFpAjoglyYJOxltfZ/D+SC8Rfgta
6BIbpOPeebd1E/LEnPsDYkBoK5TFY+cTVo2M6Y463dphK18xxzmFR0u6zjx5sJ9r
uoIYlEl+rm3nYf9spmwTJsTpGZSHPtzkCbQiBNLkkmw0P+WLlFV8GfWi5iqlafYw
6CecINa2dv2JmmYTCZKUg0g4fohuwsVUjaqB/3BEDfCu4mzD51g=
=DGfC
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
