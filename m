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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E20C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A2B1E2067D
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 15:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzCd0NDD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfDYPOH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 11:14:07 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54248 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfDYPOG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 11:14:06 -0400
Received: by mail-wm1-f68.google.com with SMTP id 26so3960107wmj.3;
        Thu, 25 Apr 2019 08:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jrJwzhGEDvB3/MxlGjfQ6T+ySarRIkvQmQgASSzpO9I=;
        b=YzCd0NDDNDdZJT6nQ342aoLuDMAsgJ6D10kGgod2yV0NuYwbl5YlBrciVxpsy2x4PD
         1cGyBzSOQ25eyIwHffg7idqDFinbYgQ50/deGvLxWHi+dwjyXLucfp2jOh1myHJ2P7xr
         hcWCpDRqdDyZiYU0aAcZLEUlybMLwa+tiEwCPMKXDNLd9rVt/o2SvAApRtzSB+CAhXLt
         ov38lIAK4jOgEzjhO6riStcSjlffoRGtDkmZHHA5MFMe8eIJn7ovFAUOsaSlvcLuI4bK
         m1dNJJS8oDE0cXSDLkxY1OlUZhazDycPdNvnToKw0zPkEGKA/r+jGmWHIh1ojekmBYPS
         slNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jrJwzhGEDvB3/MxlGjfQ6T+ySarRIkvQmQgASSzpO9I=;
        b=NuKHMmaQC8OBEWzxU3ONM6eq4Kd8vQr+N0FGO6Ilw4Aorm7ENJSiz7tzDCPQgihipk
         lGMlf8IelifKamVEKYtzrp3pJ8Pm9fCk7v0akK5M7TKPvW2Gu2xW+/RfwDc6pqa1/hA9
         I40dn+k1RUYxFk0mrsGFAjnOBbQbgLF6yRlGDfq74t+Z1JilmsjxcLrvnediqgvK16Qh
         aXhy7LIXN44svxiUoq22XLEC0G948HPSbAFr2tPcIbrPBoxAtX/drAEj0MjjG4SOq114
         GfTZfXM2jAsPXKstZnIZs9nzf93aF4byk3aDt7cuJaAAOBRScVlw/E4FNguCc1SnARq0
         eM8w==
X-Gm-Message-State: APjAAAXDXbD2mG74MeyRvuw5GDfmke/Wek22MOkVMsJFTepg7i5fqw7T
        BvWMM7BrHy1d4uYN5McobHQ=
X-Google-Smtp-Source: APXvYqwTqex1nxUhKNPvbIlUqwlwy4qpfV3vlfz5SHaypecFswgHCp8JiqhKpcu7LwRHim4aDitVnw==
X-Received: by 2002:a1c:6587:: with SMTP id z129mr3842280wmb.84.1556205243570;
        Thu, 25 Apr 2019 08:14:03 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 6sm13830185wra.85.2019.04.25.08.14.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2019 08:14:02 -0700 (PDT)
Date:   Thu, 25 Apr 2019 17:14:01 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 4/8] dt-bindings: usb: Add  NVIDIA Tegra XUSB device
 mode controller binding
Message-ID: <20190425151401.GF24213@ulmo>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-5-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Content-Disposition: inline
In-Reply-To: <1552302716-18554-5-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425151401.AjIKoLPU9V_F3Xsin41ETtKLvgT0TVslbi-4lSwzJME@z>


--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 04:41:52PM +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on tegra210 SoC. This controller supports USB 3.0 specification

Tegra210, please. "... supports the USB 3.0 ...". Also end sentences
with a fullstop.

>=20
> Based on work by Andrew Bresticker <abrestic@chromium.org>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 105 +++++++++++++++=
++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xu=
dc.txt
>=20
> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt =
b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> new file mode 100644
> index 0000000..990655d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> @@ -0,0 +1,105 @@
> +Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
> +USB 3.0 SuperSpeed protocols.
> +
> +Required properties:
> +--------------------
> +- compatible: For Tegra210, must contain "nvidia,tegra210-xudc".
> +- reg: Must contain the base and length of the XUSB device registers, XU=
SB device
> +  PCI Config registers and XUSB device controller registers.
> +- interrupts: Must contain the XUSB device interrupt
> +- clocks: Must contain an entry for ell clocks used.

s/ell/all/

> +  See ../clock/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +   - xusb_device
> +   - xusb_ss
> +   - xusb_ss_src
> +   - xusb_hs_src
> +   - xusb_fs_src

It'd be good to explain what each of these are.

> +- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
> +  configure the USB pads used by the XUDC controller
> +- power-domains: A list of PM domain specifiers that reference each powe=
r-domain
> +  used by the XUSB device mode controller. This list must comprise of a =
specifier
> +  for the XUSBA and XUSBB power-domains. See ../power/power_domain.txt a=
nd
> +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
> +- power-domain-names: A list of names that represent each of the specifi=
ers in
> +  the 'power-domains' property. Must include 'xusb_ss' and 'xusb_device'
> +
> +For Tegra210:
> +- avddio-usb-supply: PCIe/USB3 analog logic power supply. Must supply 1.=
05 V.
> +- hvdd-usb-supply: USB controller power supply. Must supply 3.3 V.
> +- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.

My understanding is that this last supply is really needed for the XUSB
pad controller to bring up the PLL. In fact, I've just moved the same
supply to the XUSB pad controller from the XUSB controller for all of
the supported boards because having this in the XUSB controller would
fail under some circumstances.

> +
> +- phys: Must contain an entry for each entry in phy-names.
> +  See ../phy/phy-bindings.txt for details.
> +- extcon-usb: Must contains an extcon-usb entry which detects

In the example below, this is simply "extcon".

> +  USB VBUS pin. See ../extcon/extcon-usb-gpio.txt for details.
> +
> +Optional properties:
> +--------------------
> +- phy-names: Should include an entry for each PHY used by the controller.
> +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
> +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines
> +  - "usb2" phy, USB 2.0 (D+/D-) data lines

Why are these optional? phys is required and references phy-names
explicitly, so I think that effectively makes these phy-names required
as well.

> +
> +Example:
> +--------
> +	pmc: pmc@7000e400 {
> +		compatible =3D "nvidia,tegra210-pmc";
> +		reg =3D <0x0 0x7000e400 0x0 0x400>;
> +		clocks =3D <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
> +		clock-names =3D "pclk", "clk32k_in";
> +
> +		powergates {
> +			pd_xusbss: xusba {
> +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;
> +				resets =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;
> +				#power-domain-cells =3D <0>;
> +			};
> +
> +			pd_xusbdev: xusbb {
> +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_DEV>;
> +				resets =3D <&tegra_car 95>;
> +				#power-domain-cells =3D <0>;
> +			};
> +		};
> +	};
> +
> +	xudc@700d0000 {
> +		compatible =3D "nvidia,tegra210-xudc";
> +		reg =3D <0x0 0x700d0000 0x0 0x8000>,
> +			<0x0 0x700d8000 0x0 0x1000>,
> +			<0x0 0x700d9000 0x0 0x1000>;
> +
> +		interrupts =3D <0 44 0x4>;

This should use symbolic names defined in the following includes:

	dt-bindings/interrupt-controller/irq.h
	dt-bindings/interrupt-controller/arm-gic.h

Thierry

> +
> +		clocks =3D <&tegra_car TEGRA210_CLK_XUSB_DEV>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
> +		clock-names =3D "xusb_device", "xusb_ss", "xusb_ss_src",
> +			      "xusb_hs_src", "xusb_fs_src";
> +
> +		power-domains =3D <&pd_xusbdev>, <&pd_xusbss>;
> +		power-domain-names =3D "xusb_device", "xusb_ss";
> +
> +		nvidia,xusb-padctl =3D <&padctl>;
> +
> +		phys =3D <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
> +		phy-names =3D "usb2;
> +
> +		avddio-usb-supply =3D <&vdd_pex_1v05>;
> +		hvdd-usb-supply =3D <&vdd_3v3_sys>;
> +		avdd-pll-utmip-supply =3D <&vdd_1v8>;
> +
> +		extcon =3D <&extcon_usb>;
> +	};
> +
> +	extcon_usb: extcon_vbus {
> +		compatible =3D "linux,extcon-usb-gpio";
> +		vbus-gpio =3D <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +	};
> +
> --=20
> 2.7.4
>=20

--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzBzrkACgkQ3SOs138+
s6F9NQ//by0qk4cXtY8kaCI1psQdcEXNtWyKRldVuAkJdLCsnSoxR0wsvsQUGUVy
k3JhMfNmAZ2vr3FFW+W+VxrVro2Tedx2BGtpCw5OrzOAPo5GEhxIPu4XpWeVJo24
Qp9LlpuubpzRz6DhqwRFUBAFn9Q6h3OaEKwJ2wB8sCisnSoX595q85FIfeH7Wh1K
iYPQOSgs6CC5eSflsTHvRlx06Ikc2bRVxvganVfDRFFMH1oPTjP6KF1GJgaV6C+h
fN3HE8ukODx89m6KGhbEUqYx2/KQafdINFRSmRjQ7/j6N5B8bAldYwJsyW8GY+ij
zqvYBaCrVe418UX+72HpHg4BGIe1FCxgriwoEyQixdeFN/kFKbkTrdbdukudmTBD
TsQ0Znax23aKs08NgSzOrythAPn53TDjo633buZ+7aVlgG/dgzn4oeQzweA35dI9
lbGIngXdPxtNBwZQG03qn8vEGvaLfQteOwQb/pmh1ZawZ2b66v2eb9/8oiZa9UJW
tuGiBUijgWz+XYcLROIbThyjjQRsMpsUuv0MFcUme7nmAZC8khQ2PkCGKW+woDMP
hitsNmLuLwXXIrr4pISx6i4gvLRycAoxUlZBG01LhAJfzl+jNfiG9ryK5jwfr2x3
TK/7k8VEUpPbVUbwWvKq4DwYFA82sG8cPcOUZ1iSmk9lQWEVuEE=
=E8SY
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--
