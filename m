Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD06C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B3B3206BF
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 14:55:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObFei7KN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfDYOzK (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 10:55:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36365 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbfDYOzK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 10:55:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id h18so11034595wml.1;
        Thu, 25 Apr 2019 07:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o0hYzlJZ9De8C2EJk5bqyi6LB/AdqZZzFznD7thA8AA=;
        b=ObFei7KNBXVXqU5PFYo0IzNr+9bUTvz8GxtYobeIONh/xLI1ea9JPdDCe8mu0nWSzL
         uBLPtBAea+JyPqGcAT4ENRHxfUvS0Lpi94fW02//gwvfGAvF/SaJjuTlxgsyo+QvW2sR
         1qxDVXoL3HBcghVsys99/+MiIYrfE3hNZcrWxlveWSc5/cONq/spXNKPYrHuo8UNxZ6b
         emZNsnsrTrcvqA/6TVdoJrI+wyOQ8rzHRMWCwdOZGuxa7wCjRR/RbWCf1aZheLsEMRFe
         6sVdMzFp7NI6Df/u20E2jstze0YI1pTurBSDT40eB7YCxuNaF0Y5QHAIGSBjVjUn8XFn
         gUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o0hYzlJZ9De8C2EJk5bqyi6LB/AdqZZzFznD7thA8AA=;
        b=n+aeNcBTNILBg+wVtLu2g1SwrGWelcFVIndzHM6V8sAofbUe2YZCo1rUQAfr3arjc8
         Os7cdGeEGI8wq/uA0T+grn7EO/YDtzMPhoBtR2rbuX6vtpyUfotoR2gIsXVRU2uOuioX
         SFn2RbbbOpbE57KMlBn1OeVYWeqrh44ZB45m+nz5XvK5g9ZrpV3o2BNbU4PIFABb7vcH
         FgnGehLGc4KjM+BcEdNmfd/igLs8+3tsRxgaajSQ1HpqNez3I9HSd3hHUrt3Pc+9L3/y
         pZaN/HAU2x6sB+sZ0psJ+FAPZUaBBrDCXMJkJuLdtTKCAs8Eb/9+mw9dAUQho1JMS40s
         AqJA==
X-Gm-Message-State: APjAAAXZ84HHf/TTdTepldiC5tisW8l8fjDOWUHUK9x2J40Xi3KtW+Et
        xbJj+lW5X/zvxHBeS2JdMoA=
X-Google-Smtp-Source: APXvYqxyr1S+ArYrVjOdPmSYt8Uc8V4iSBC7xgBxjWiNWd/suPkwleBsnmy7diVAciHWaJ4C5wwxlg==
X-Received: by 2002:a1c:7f10:: with SMTP id a16mr3811781wmd.30.1556204107420;
        Thu, 25 Apr 2019 07:55:07 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id z4sm226941wrq.75.2019.04.25.07.55.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2019 07:55:06 -0700 (PDT)
Date:   Thu, 25 Apr 2019 16:55:05 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 2/8] phy: tegra: xusb: t210: add usb3 port fake support
Message-ID: <20190425145505.GD24213@ulmo>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-3-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="11Y7aswkeuHtSBEs"
Content-Disposition: inline
In-Reply-To: <1552302716-18554-3-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425145505._94GqUGcyIBd_SxHP_BZHdI0j_2d2KjEUB3TMsvjHQs@z>


--11Y7aswkeuHtSBEs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 04:41:50PM +0530, Nagarjuna Kristam wrote:
> On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
> They need an assosciated usb3 port to work in device mode. Identify
> an unused usb3 port and assign it as a fake USB3 port to USB2 only
> port whose mode is otg/peripheral
>=20
> Based on work by BH Hsieh <bhsieh@nvidia.com>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 40 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.c          | 29 ++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.h          |  6 ++++++
>  3 files changed, 75 insertions(+)

I think this looks a whole lot better than the initial version. One or
two minor comments below.

> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index 4beebcc..48478bc4 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -58,6 +58,7 @@
>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_SHIFT(x) ((x) * 5)
>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * 5))
>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 5=
))
> +#define XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED 0x7
> =20
>  #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
>  #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31)
> @@ -952,6 +953,15 @@ static int tegra210_usb2_phy_power_on(struct phy *ph=
y)
> =20
>  	priv =3D to_tegra210_xusb_padctl(padctl);
> =20
> +	if (port->usb3_port_fake !=3D -1) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +		value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
> +					port->usb3_port_fake);
> +		value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(
> +					port->usb3_port_fake, index);
> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +	}
> +
>  	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
>  	value &=3D ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
>  		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
> @@ -1086,6 +1096,15 @@ static int tegra210_usb2_phy_power_off(struct phy =
*phy)
> =20
>  	mutex_lock(&padctl->lock);
> =20
> +	if (port->usb3_port_fake !=3D -1) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +		value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
> +					port->usb3_port_fake);
> +		value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(port->usb3_port_fake,
> +					XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED);
> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +	}
> +
>  	if (WARN_ON(pad->enable =3D=3D 0))
>  		goto out;
> =20
> @@ -1784,6 +1803,27 @@ static const struct tegra_xusb_pad_soc * const teg=
ra210_pads[] =3D {
> =20
>  static int tegra210_usb2_port_enable(struct tegra_xusb_port *port)
>  {
> +	struct tegra_xusb_usb2_port *usb2 =3D to_usb2_port(port);
> +	struct tegra_xusb_padctl *padctl =3D port->padctl;
> +
> +	/* Disable usb3_port_fake usage by default and assign if needed */
> +	usb2->usb3_port_fake =3D -1;
> +	if (usb2 && (usb2->mode =3D=3D USB_DR_MODE_OTG ||
> +		    usb2->mode =3D=3D USB_DR_MODE_PERIPHERAL)) {
> +		if (!tegra_xusb_usb3_port_has_companion(padctl, port->index)) {
> +			int fake =3D tegra_xusb_find_unused_usb3_port(padctl);
> +
> +			if (fake >=3D 0) {
> +				dev_dbg(&port->dev, "Found unused usb3 port: %d\n",
> +					 fake);
> +				usb2->usb3_port_fake =3D fake;
> +			} else {
> +				dev_err(&port->dev, "usb2-%u has neither a companion nor an unused u=
sb3 port to fake it\n",
> +					port->index);
> +				return -ENODEV;
> +			}
> +		}
> +	}

Generally it's preferable to check for errors and deal with success in
the regular code path. So the above would be:

			if (fake < 0) {
				dev_err(...);
				return -ENODEV;
			}

			dev_dbg(...);
			...

Also, the error message is slightly redundant because &port->dev will
already output the usb2-%u part. Also, perhaps try to make that message
a little shorter. Something like:

	dev_err(&port->dev, "no unused USB3 ports available\n");

Also, I don't think this is the right place to do this. There's really
no way for the ->enable() callbacks to fail. Or at least failures will
be ignored, so there's no chance for the driver to do anything about the
failure. It also looks somewhat tacked on.

But how about if we do this as part of tegra_xusb_usb3_port_parse_dt()
or tegra_xusb_add_usb3_port() already? The former is where we read the
USB2 companion port index from DT so we know exactly which USB2 port to
associate with a given USB3 port. So in the latter we could iterate over
the USB2 ports (which have already been set up) and establish a backlink
to the USB3 companion.

Something like this, in tegra_xusb_add_usb3_port():

	struct tegra_xusb_usb2_port *companion;

	for (i =3D 0; i < padctl->soc->ports.usb2.count; i++) {
		companion =3D tegra_xusb_find_usb2_port(padctl, i);
		if (!companion)
			continue;

		if (companion->base.index =3D=3D usb3->port) {
			companion->port =3D index;
			break;
		}
	}

Then, as part of tegra_xusb_setup_ports() we could add functionality to
hook up a fake port if no companion is available, much like you're doing
above. Perhaps we should introduce a new ->setup() callback to the port
ops to encapsulate this, or perhaps add a flag to tegra_xusb_padctl_soc
that is set to true on SoC generations that need the fake USB3 port.

Thierry

>  	return 0;
>  }
> =20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index c6178a0..e89746d 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -799,6 +799,35 @@ static void __tegra_xusb_remove_ports(struct tegra_x=
usb_padctl *padctl)
>  	}
>  }
> =20
> +bool tegra_xusb_usb3_port_has_companion(struct tegra_xusb_padctl *padctl,
> +						       unsigned int index)
> +{
> +	unsigned int i;
> +	struct tegra_xusb_usb3_port *usb3;
> +
> +	for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
> +		usb3 =3D tegra_xusb_find_usb3_port(padctl, i);
> +		if (usb3 && usb3->port =3D=3D index)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_padctl *padctl)
> +{
> +	struct device_node *np;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
> +		np =3D tegra_xusb_find_port_node(padctl, "usb3", i);
> +		if (!np || !of_device_is_available(np))
> +			return i;
> +	}
> +
> +	return -ENODEV;
> +}
> +
>  static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
>  {
>  	struct tegra_xusb_port *port;
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index 17cc8dc..b263165 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -274,6 +274,7 @@ struct tegra_xusb_usb2_port {
>  	struct regulator *supply;
>  	bool internal;
>  	enum usb_dr_mode mode;
> +	int usb3_port_fake;
>  };
> =20
>  static inline struct tegra_xusb_usb2_port *
> @@ -413,6 +414,11 @@ struct tegra_xusb_lane *tegra_xusb_find_lane(struct =
tegra_xusb_padctl *padctl,
>  					     const char *name,
>  					     unsigned int index);
> =20
> +bool tegra_xusb_usb3_port_has_companion(struct tegra_xusb_padctl *padctl,
> +					unsigned int index);
> +
> +int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_padctl *padctl);
> +
>  #if defined(CONFIG_ARCH_TEGRA_124_SOC) || defined(CONFIG_ARCH_TEGRA_132_=
SOC)
>  extern const struct tegra_xusb_padctl_soc tegra124_xusb_padctl_soc;
>  #endif
> --=20
> 2.7.4
>=20

--11Y7aswkeuHtSBEs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzBykUACgkQ3SOs138+
s6EQZQ//cWF/8gxVfT6FjrMPgrUwnbJPVrgiHB5HYNsbKGzOJDk98W1IGDEBIUI/
JLUNfFVk2m12sluKZaYXsGq/tSTdOrLC4ySqqPA2z+lRbnEy+SqPs3DGk5CavjX5
6IvU5wijQSwlwMb8g8EKIcjT3XLrkbsmhKkGBU5qaYzlbXLGXGkreFGYuZvVrNl3
5KWXd5PvuMa/LcbPTaENYmhZoYrDewZ5qyophSP24SfJtAIEa/j2yG8XSdKWmYSP
lLZWLQEvvNl/qKPB5OuivYVxyOMV+osLheYap5ug8ip8VlVyzOMW8zyLoAecSIGK
ud2QH99MEdGNb3kgCvmxU6HZQ922xLeA4Ps7ClrcisgX922DVv3oM8RCFxca5TNU
RMVqOOfOZ0dSO49uvEAqjTxZZ17+aRM/vYS3b91T34/ATngo6GWcZutLrqPkkFod
pZbCOXRZM6kGgttY3OEErFMHkUZbDxMQVUz4xOF+0qUpINjhKtA6uKpSQvJggQhk
b27Or4/zTlx8EKccmwog8nTNXsTt9FhQ43gCibxrpnBXBDCiU4hexDne7z/rR/rD
yCrkypFx8Dl+yo2lXXF5KeZ8q83MO/5keuZtzz3iw+vWjo4LJonSlJjJLCNTm17m
ZxrISl6NEGdqAgxvLXu2IhafSFt5EDvppu1jRF4X2MBcYsIlOqs=
=Ju8O
-----END PGP SIGNATURE-----

--11Y7aswkeuHtSBEs--
