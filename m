Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3643D903E
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533844; cv=none; b=jwM+gZls8MDj4d6ECcO90vDvJTZHHk+ZH5Pz52pSy6QFkk334XUZyXfc78Qnq3hmIoNLwPsKDr2c75djHeBqDezHDtTOPs+PdyOZ9dke6oq4ha6IEuMhjo90qYxSWjr1XO9GoYuAtz3LJVugCZOYElUz3VuIadf1P71JwsDEH5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533844; c=relaxed/simple;
	bh=bnkmkb5PAUJog259T++QZOvqZjz6K1rymUK+0tpkoFg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JGU+dIOFQaPa9kz8dywxycd2xQcdAqIXzu3V2PkH29IJwvb36skkzBt43lYxxx7yIXv8PFWIaj4TSw2RuaEYwCbWnjME+WBGvq+KEnpPeznnpsD+9xIl33k47amLL/iRPg/prEdSlKTOkw7jD49avceSqkqk1SYGx+FVCcfdDNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXlt5tre; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXlt5tre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7D31F00893;
	Fri,  9 Oct 2026 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533843;
	bh=k258AyZgrntLsu1ThWxbVPLOTorZmMMpzOldZ848tiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OXlt5treVqB20ctKOlRCPWt99apCb9cocsbSJHD6pCOugiez8tkHdZ3apuYk6cWmS
	 7FHV09SkD641e00Y3LqLak8ewZ7PlCz1117QHed9ipyg02QokpcubfNBEXRpmH4m0F
	 0Hr3Dk6rn9oIjrpAhvSJ+VoPsPrroaa8qPV1pRIrAGxvOAH/co39vMn4niNGSpKSx9
	 GQBl2XftRIyXEDsG1JPFj+4rJNgNu4RFcx97OH6o/jWbp+sauk7Eu6IuMMDmEucJdq
	 nqQOSzCqyQeWErwPX346ay0/4Tv+KsXWcHSbwM04L8xiUiwbxr55537g36EiG8wGBD
	 HS1Ff9f0OfXPA==
Message-ID: <sashiko-outbox-165068@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 08/10] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-9-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-9-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:23 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: r8152: read_mii_word() propagates negative error codes to MII=
 library
- [Medium] net: usb: r8152: silent divergence of software and hardware stat=
es on MII_ADVERTISE write failure
--

commit 1a66cb27853181290552776e26318bd7353533ff
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>
Subject: r8152: add TGPHY register access for RTL8157 and RTL8159

This commit introduces TGPHY command channel access for RTL8157 and RTL8159
chips, adding busy timeouts to register accesses. It updates the PHY access=
ors
to return integer error codes and propagates these statuses in several plac=
es,
while deferring other callers to a follow-up series.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index b7c201ac6d160..023e7af4c5fa6 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -1664,16 +1675,33 @@ static void ocp_reg_write(struct r8152 *tp, u16 a=
ddr, u16 data)
[ ... ]
> -static inline int r8152_mdio_read(struct r8152 *tp, u32 reg_addr)
> +static int r8152_mdio_read(struct r8152 *tp, u32 reg_addr)
>  {
> -	return ocp_reg_read(tp, OCP_BASE_MII + reg_addr * 2);
> +	u16 data;
> +	int ret;
> +
> +	ret =3D ocp_reg_read(tp, OCP_BASE_MII + reg_addr * 2, &data);
> +
> +	return ret < 0 ? ret : data;
>  }

[Severity: High]
Does this introduce a regression by propagating negative error codes to the
MII library before the follow-up series is merged?

If a TGPHY access times out, this will return a negative error code
(like -ETIMEDOUT). This propagates back to read_mii_word(), which is used
as the MII library's mdio_read callback.

The MII library callbacks (e.g., mii_ethtool_get_link_ksettings, mii_link_o=
k)
expect a 16-bit register value and do not check for negative errors. They w=
ill
silently cast the negative integer to u16. A negative error code will have
spurious bits set, causing the MII library to misinterpret the link state
(e.g., falsely assuming BMCR_ANENABLE is set or BMSR_LSTATUS is cleared),
leading to silent link state corruption.

[ ... ]
> @@ -6601,7 +6779,11 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 =
autoneg, u32 speed, u8 duplex,
>  		if (!advertising)
>  			return -EINVAL;
> =20
> -		orig =3D r8152_mdio_read(tp, MII_ADVERTISE);
> +		ret =3D r8152_mdio_read(tp, MII_ADVERTISE);
> +		if (ret < 0)
> +			goto out;
> +
> +		orig =3D ret;
>  		new1 =3D orig & ~(ADVERTISE_10HALF | ADVERTISE_10FULL |
>  				ADVERTISE_100HALF | ADVERTISE_100FULL);

[ ... ]
> @@ -6628,7 +6810,11 @@ static int rtl8152_set_speed(struct r8152 *tp, u8 =
autoneg, u32 speed, u8 duplex,
>  		}
> =20
>  		if (tp->mii.supports_gmii) {
> -			orig =3D r8152_mdio_read(tp, MII_CTRL1000);
> +			ret =3D r8152_mdio_read(tp, MII_CTRL1000);
> +			if (ret < 0)
> +				goto out;
> +
> +			orig =3D ret;
>  			new1 =3D orig & ~(ADVERTISE_1000FULL |
>  					ADVERTISE_1000HALF);

[Severity: Medium]
Are we missing error checks for the subsequent writes after these reads?

Looking at rtl8152_set_speed(), the return values of intermediate writes to
MII_ADVERTISE, MII_CTRL1000, and OCP_10GBT_CTRL are ignored:

		if (orig !=3D new1) {
			r8152_mdio_write(tp, MII_ADVERTISE, new1);
			tp->mii.advertising =3D new1;
		}

If one of these writes fails due to a TGPHY timeout, the software state
variables (like tp->mii.advertising and tp->ups_info.speed_duplex) are still
unconditionally updated.=20

If the final write to MII_BMCR succeeds, the function returns 0 (success).
This causes the hardware to restart autonegotiation with old settings while
the driver falsely reports the new settings to userspace via ethtool. Could
this lead to a silent divergence between software and hardware states?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D8
