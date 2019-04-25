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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431EDC43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:04:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49CA02081C
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPQT1kGM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfDYPEq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:04:46 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36604 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfDYPEq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 11:04:46 -0400
Received: by mail-wr1-f65.google.com with SMTP id b1so19457554wru.3;
        Thu, 25 Apr 2019 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C+lwsCVu+DIwtqC6D3ekXtdyx+lahsIgIxcrm+aJ01A=;
        b=kPQT1kGMhXbt9iWriZmmDwfJp8SCfaHNaRgs+7Is+dX80zkkLFURKxIYms7BiKdZNz
         z1SDWikrWk6nfeiddExn0bgEdMuK9ps51pEQYCUmFhMvMgfQVopvf/IYMgVF+TFxDfMk
         Sa3NrDYZVPQf6RU3hdTVnUAzyZVSvWOM/rW3vnXTY7p/Qn421cSNAztkw7UIEK7fep6N
         qZZCHhZ+Hy1jP9VMw2cbBON0/sunUUHkzGVfkqpnvxJkDprZARZ/XgYWhSmaoybUm4ZH
         h6UxN4bmT7hTHK2w1iQ+peb0Ya/oYWNWgFpRLNxxLbYEpYcoyccv9oA++o/SBkjL1kHe
         4nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C+lwsCVu+DIwtqC6D3ekXtdyx+lahsIgIxcrm+aJ01A=;
        b=A2c3RdN6XIlwRMtHbnEBlwj1acNCeag+8JRlPqvSToElYVQ2lpo0ajShdBHgXfVb1N
         7IrLpbprNiZ41G+W83b7g3UsUiYnXPtpnJTeBuiafF4i/PjyTHO0X64q5/wlWtxIa7Y1
         8hPb3HZB17ExffpLOtlg4mvs/VVi+RW+6oriL0wSbrVDj3INde/E4y1TnCw0qtiugbaJ
         MzRhak0HXcopXJLQhyUjcfAZDYg5QUbuWCaTPF2xnB3IoSpVnWTmYCxLp2NsAnfOP85C
         FGIaON3uTjAq5yEJosXW7BtX2uzzkw1eYQoT+JW5ky+zvVfhrpMxcKnAXdnTu45fMaqw
         cCuw==
X-Gm-Message-State: APjAAAV+c56fgg9kzgox2CVF4k9yzhdwQfR/FjLpNBcDBAeX+PyMN9to
        hEMbvYLbfMVeEUaJ6Q+jITA=
X-Google-Smtp-Source: APXvYqxJZgRZin7kHxMmvIz1+LRobdA9vEN666UXkkkmhaj6eMll1qJMCBlSb8OXW7njEDOIaA9GAw==
X-Received: by 2002:a5d:66c9:: with SMTP id k9mr10560108wrw.101.1556204682924;
        Thu, 25 Apr 2019 08:04:42 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id v1sm23409149wrd.47.2019.04.25.08.04.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2019 08:04:41 -0700 (PDT)
Date:   Thu, 25 Apr 2019 17:04:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 3/8] phy: tegra: xusb: t210: add vbus override support
Message-ID: <20190425150440.GE24213@ulmo>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-4-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kA1LkgxZ0NN7Mz3A"
Content-Disposition: inline
In-Reply-To: <1552302716-18554-4-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425150440.FfA4y7wgK0tewuW2x3K2861eSG19c2RtDFtBYkoE_mE@z>


--kA1LkgxZ0NN7Mz3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 04:41:51PM +0530, Nagarjuna Kristam wrote:
> Tegra XUSB device control driver needs to control vbus override
> during its operations, add API for the support
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 61 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.c          | 28 ++++++++++++++++--
>  drivers/phy/tegra/xusb.h          |  2 ++
>  include/linux/phy/tegra/xusb.h    |  6 ++--
>  4 files changed, 92 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index 48478bc4..be1a870 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -73,6 +73,10 @@
>  #define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + (x)))
>  #define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (8 + (x)))
> =20
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) (0x080 + (x) * 0x4=
0)
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP (1 << 18)
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN (1 << 22)
> +
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x4=
0)
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
> @@ -235,6 +239,12 @@
>  #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(x) (0xa74 + (x) * 0x40)
>  #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL 0xfcf01368
> =20
> +#define XUSB_PADCTL_USB2_VBUS_ID 0xc60
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON (1 << 14)
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT 18
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK 0xf
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
> +
>  struct tegra210_xusb_fuse_calibration {
>  	u32 hs_curr_level[4];
>  	u32 hs_term_range_adj;
> @@ -2009,6 +2019,55 @@ static const struct tegra_xusb_port_ops tegra210_u=
sb3_port_ops =3D {
>  	.map =3D tegra210_usb3_port_map,
>  };
> =20
> +static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *=
padctl,
> +					      bool set)

I think "status" would perhaps be somewhat more meaningful.

> +{
> +	u32 reg;

The rest of the driver uses "u32 value". It'd be good to be consistent.

> +
> +	dev_dbg(padctl->dev, "%s vbus override\n", set ? "set" : "clear");
> +
> +	reg =3D padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
> +	if (set) {
> +		reg |=3D XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
> +		reg &=3D ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
> +			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
> +		reg |=3D XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
> +			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
> +	} else
> +		reg &=3D ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;

This could use some blank lines to separate blocks and make it more
readable.

> +	padctl_writel(padctl, reg, XUSB_PADCTL_USB2_VBUS_ID);
> +
> +	return 0;
> +}
> +
> +static int tegra210_utmi_port_reset(struct phy *phy)
> +{
> +	struct tegra_xusb_padctl *padctl;
> +	struct tegra_xusb_lane *lane;
> +	struct device *dev;
> +	u32 reg;

u32 value

> +
> +	if (!phy)
> +		return -ENODEV;

When would this happen?

> +
> +	lane =3D phy_get_drvdata(phy);
> +	padctl =3D lane->pad->padctl;
> +	dev =3D padctl->dev;
> +
> +	reg =3D padctl_readl(padctl,
> +				XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(0));

Usually subsequent lines are indented so that they align with the first
argument of the first line.

> +	dev_dbg(dev, "BATTERY_CHRG_OTGPADX_CTL0(0): 0x%x\n", reg);

You can use %#x to avoid having to explicitly provide the 0x prefix.
Also, is this really useful for debugging? We could add trace support to
this driver (to padctl_readl() and padctl_writel() for example) to allow
for more flexible tracing of register programming sequences.

> +
> +	if ((reg & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP) ||
> +	    (reg & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN)) {
> +		dev_dbg(dev, "Toggle vbus\n");

This one is pretty redundant because the function calls below each
already output something to that effect.

> +		tegra210_xusb_padctl_vbus_override(padctl, false);
> +		tegra210_xusb_padctl_vbus_override(padctl, true);
> +		return 1;
> +	}
> +	return 0;
> +}
> +
>  static int
>  tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibratio=
n *fuse)
>  {
> @@ -2071,6 +2130,8 @@ static const struct tegra_xusb_padctl_ops tegra210_=
xusb_padctl_ops =3D {
>  	.remove =3D tegra210_xusb_padctl_remove,
>  	.usb3_set_lfps_detect =3D tegra210_usb3_set_lfps_detect,
>  	.hsic_set_idle =3D tegra210_hsic_set_idle,
> +	.vbus_override =3D tegra210_xusb_padctl_vbus_override,
> +	.utmi_port_reset =3D tegra210_utmi_port_reset,
>  };
> =20
>  const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc =3D {
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index e89746d..bbb839b 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1027,7 +1027,7 @@ int tegra_xusb_padctl_usb3_save_context(struct tegr=
a_xusb_padctl *padctl,
>  	if (padctl->soc->ops->usb3_save_context)
>  		return padctl->soc->ops->usb3_save_context(padctl, port);
> =20
> -	return -ENOSYS;
> +	return -ENOTSUPP;
>  }
>  EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_save_context);
> =20
> @@ -1037,7 +1037,7 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xu=
sb_padctl *padctl,
>  	if (padctl->soc->ops->hsic_set_idle)
>  		return padctl->soc->ops->hsic_set_idle(padctl, port, idle);
> =20
> -	return -ENOSYS;
> +	return -ENOTSUPP;
>  }
>  EXPORT_SYMBOL_GPL(tegra_xusb_padctl_hsic_set_idle);
> =20
> @@ -1048,10 +1048,32 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct=
 tegra_xusb_padctl *padctl,
>  		return padctl->soc->ops->usb3_set_lfps_detect(padctl, port,
>  							      enable);
> =20
> -	return -ENOSYS;
> +	return -ENOTSUPP;
>  }
>  EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_set_lfps_detect);

I think these changes should be a separate patch.

Thierry

> =20
> +int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
> +							bool val)
> +{
> +	if (padctl->soc->ops->vbus_override)
> +		return padctl->soc->ops->vbus_override(padctl, val);
> +
> +	return -ENOTSUPP;
> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_set_vbus_override);
> +
> +int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +
> +	if (padctl->soc->ops->utmi_port_reset)
> +		return padctl->soc->ops->utmi_port_reset(phy);
> +
> +	return -ENOTSUPP;
> +}
> +EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
> +
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>  MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index b263165..9a39b05 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -356,6 +356,8 @@ struct tegra_xusb_padctl_ops {
>  			     unsigned int index, bool idle);
>  	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
>  				    unsigned int index, bool enable);
> +	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
> +	int (*utmi_port_reset)(struct phy *phy);
>  };
> =20
>  struct tegra_xusb_padctl_soc {
> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xus=
b.h
> index 8e1a57a..9b8351c 100644
> --- a/include/linux/phy/tegra/xusb.h
> +++ b/include/linux/phy/tegra/xusb.h
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2016-2019, NVIDIA CORPORATION.  All rights reserved.
>   *
>   * This program is free software; you can redistribute it and/or modify =
it
>   * under the terms and conditions of the GNU General Public License,
> @@ -26,5 +26,7 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_p=
adctl *padctl,
>  				    unsigned int port, bool idle);
>  int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *pad=
ctl,
>  					   unsigned int port, bool enable);
> -
> +int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
> +					bool val);
> +int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
>  #endif /* PHY_TEGRA_XUSB_H */
> --=20
> 2.7.4
>=20

--kA1LkgxZ0NN7Mz3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzBzIgACgkQ3SOs138+
s6Hggg//UfEp9so/X6m6llw8EFNPqlzfyO7CrBAZWzng2vkSePz0neUXzrLTwhcT
OD6rKr3uTJQK5cTcBMshuEOfRTq9xu8ygQAtS7Dq/2c3d/1y1iB7i+1g8pSxQH7U
LpUPDtuGRio2YaJfw6f7BswFX7U8PYss2EuehSmgUci+HDaUdGi1+k6PNworHLgd
lHIa1Bsc9HPCc7xVxCRC7Mp4DkQHkjLalyU3uPGI5s7IVtKdCGXsqngRTUY5btOl
hlg2ng0moPvAYKtmCfDS7fQ8Fny8OqR3rtixip+jVJuYfVwvbPTjwSbjKrPHqoYq
2tiA49mo5c9WQXLg7iryp4NpEsNoq4jmwloMaJE4NPTIgztCmjuZCD/dLpKXY+a5
X1BNB3ySL9Vrz67hqM1gHxOf9UPtK+LAlu9+b6TrMqju8UB/BTUIgAvYuIFQHJ/L
GVyqQn9MHh9fY7fbGOZUu+8gKOQO3i8u4jr0UmQLYVFBKPGDa/fFigsvTBp3sJEP
46C8JS+7wz0qU5rac52ynZTg+XT3d8ScBQtYOL1glA3OXfL5m3oDr7CRq6lmLsns
fCupc6Cl050geuv5pMcngP/XNKjnXqaD2d554bAxcLMfPtaKv0+a/Z5mWhOWnt8o
Cr175qCaPIG/LpO4tBo1ZmrSgN4LEYE4zLewk8ha4KmeCS1+vM4=
=k5bM
-----END PGP SIGNATURE-----

--kA1LkgxZ0NN7Mz3A--
