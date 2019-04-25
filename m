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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207C5C43218
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 13:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E76FC206BA
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 13:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDwArx5S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbfDYN5c (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 09:57:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52589 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfDYN5c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 09:57:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id j13so9501550wmh.2;
        Thu, 25 Apr 2019 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gfYBwarks+11TupOJQIFNRjin9WgbSTiBC4cK195aKQ=;
        b=CDwArx5SOYB5/DNvlfOMhHpbq0huZ9jIP7l+r+a1BS4Mqzatu2RU0hFGnLESPYiNlg
         g7w3zhPaZK45/BMiz+5YLFxnWSBPsCmYH+kiYvSU8Aw9M+3skgSwZtv7pkrmcuJvVvGU
         xM96R/ujnps3IksASrIY0SSRE7Y8JeijPhBZ94xqClsjh/qHiQGPwhD+uGlZjiPWWsY8
         EBXsw3FR2nqmeB5HVEkdKLDskalVhEJbfAY5rSwS2H7APn7YzBDmxS45qLcXq82OvYNz
         fHkq9yZfR8I2tKk4GwznYHZP3w66Sr6tT7nrSKV+6bFJoxMtL67CGHC0D8z1torzZPQo
         bq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gfYBwarks+11TupOJQIFNRjin9WgbSTiBC4cK195aKQ=;
        b=fJ5G9SY98kLbrDWOxgGfE1a6/tQgTyMUSyY9Ex5+68LPsLzZYk0QTxHH5PX7jka8Tw
         TUeWX7ylwBpUTCqM+CoBsPqix72D9MjdKf65xxyVJNEThcLY6PDunqxSxSx816aYiC5E
         dA90Kx9HzXjoKaIOOwrb1OXXcAjt3WK3bnWUlZNR51pMoT1AOjr3Pd9nfh+8GIxYsa6v
         I9Tkij0pVu37dhP8TWAdBXhFXQxcgh0fLVeCgjRRQE42WZERX1Z9je1RKO7D651mXSRl
         w/V+XR1aGcuCUpbLLuHeSk3RWTOHVa5G3fGwgN4Rnk5jZh5IqudSHQSUycjh1P2+rxhF
         5vbQ==
X-Gm-Message-State: APjAAAUeGcMb5lYULSF37LawgIJCZrhcOnAhNQl6a7hHeDGqbAH/7+GK
        vnWqt/fomxLSI3J8cuj/LnQ=
X-Google-Smtp-Source: APXvYqzxlwEXM7VY/JR/MGD5mfzBSfKFVijeNB1df25A/vN6skEA4hKhXWks7Nx8lR0gy78aXLuYRQ==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr3595502wma.120.1556200649592;
        Thu, 25 Apr 2019 06:57:29 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id d10sm5124454wmb.15.2019.04.25.06.57.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2019 06:57:28 -0700 (PDT)
Date:   Thu, 25 Apr 2019 15:57:26 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 4/8] dt-bindings: usb: Add  NVIDIA Tegra XUSB device
 mode controller binding
Message-ID: <20190425135726.GB24213@ulmo>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-5-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
In-Reply-To: <1552302716-18554-5-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425135726.nGMX0GCEMeGWAvT61h6FvxGskBPRV6ocq7dhICHI6uc@z>


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 04:41:52PM +0530, Nagarjuna Kristam wrote:
> Add device-tree binding documentation for the XUSB device mode controller
> present on tegra210 SoC. This controller supports USB 3.0 specification
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

Hi Nagarjuna,

when you resend this, make sure to Cc devicetree@vger.kernel.org on this
patch. We need review from one of the device tree bindings maintainers
before this can be applied, and they won't review if they don't receive
the patch. =3D)

Thierry

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
> +  See ../clock/clock-bindings.txt for details.
> +- clock-names: Must include the following entries:
> +   - xusb_device
> +   - xusb_ss
> +   - xusb_ss_src
> +   - xusb_hs_src
> +   - xusb_fs_src
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
> +
> +- phys: Must contain an entry for each entry in phy-names.
> +  See ../phy/phy-bindings.txt for details.
> +- extcon-usb: Must contains an extcon-usb entry which detects
> +  USB VBUS pin. See ../extcon/extcon-usb-gpio.txt for details.
> +
> +Optional properties:
> +--------------------
> +- phy-names: Should include an entry for each PHY used by the controller.
> +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
> +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines
> +  - "usb2" phy, USB 2.0 (D+/D-) data lines
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

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzBvMYACgkQ3SOs138+
s6H9VA/+PNz0M20JK0uHeUWb2dGMAClmagdzP6QDEi6/br2sf8EqV5yTzG+MXWxQ
9zEl3nwoZ4/6x91Gg/iEqLekPhphCObffekVYH0UA5Ss701ibOQ9/wYub9Q7R3B4
8aALsoZGOEX0m5AeFU00HgF52kLi+C+shqHrBbq8kIgGRY7wtSsDDLBbUuQ1TwiZ
7qsSq82mXCwGw/jZWxmHY0zDuTzGBJwRSqWc1jkLTQHql0noUtj1b3B/KU7St4iX
6e+a0Hdo+NpJF1W0vDrJiyj8Sem3Uc78g07cx+hc40WiHBFA/15afvf91lE0y9vU
nyVwVKxDeS+Ehu1kuTIG/R/n7czlcDNzbmUZgLCaz041FpR7h8EX+4aSSr8RIRyR
xFWbbPHSciVFwBV8Mp1YZeDSl8UhG6CMR+JAMpW4rdXyGjYbu4vmnaHHa2Y9jxFQ
Ppw4hS3Yh7O3wAsDs9thOdVb65rDbyWmd9U1TGToPDxV4XB6bV/USsKFVn/xokJZ
UMks/bRGsT7r9xGX4Nsnt1cdpVrDgEAkzwTxReTbQB7Hgbv/ef+16A13tAP772yn
wb6c5E94sg/CSIy9rfsxAqOFdp7/UICpSzXZYdyU+xLx+jAY98xxgbVRQ+VnFFiN
/RJQbtsCNpoSSvlker1ZOWSg9wic9+6WQPEdDiEjdn2C18eji/8=
=/Pdm
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
