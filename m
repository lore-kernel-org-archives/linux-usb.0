Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D425939B944
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517905; cv=none; b=QO0IZuzqlutnC2qsAVMbsrZ3fITacz9WoE6vvDpLBAJBHGysfowPl0cGM+X+kubuqy8xP414okY7/IvBlS5lSs/Ys3NoyTSzV3+dHsIGQk2hDCuKeS+rE37UkswBC826JWTtUIuvrm2tZBn8Ex7auheKbPGLtpURN6AyibOTU+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517905; c=relaxed/simple;
	bh=MtqTngQqVr91DzZkcNwevLZvmFlRPfHgmhd2L3K7SNc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LXyLc/m812abeFACotZRJ/UROJZfjBKsyWb6Ng3FJyqujaMKb3AH0khr25K/9okjUdO5XaoddmlVhqfRmc9rPGL9ap3n3HAcn748rWBQSdBy1d/ySR0dphDnHsjLlQ5/4E8xRxJOoeIj4brYR8KHVVWmDZcSIL1dwFAD9ZJAYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ga+d2oWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ga+d2oWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCB21F00898;
	Fri,  9 Oct 2026 03:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517901;
	bh=9Ixy8ZRqBUj1GngaI3Pys2VnvKQT1PgiAw+NC/l1qT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ga+d2oWl7sYONF4mH9ssS74WUCN5p0wBkAXvo34UTWtIYPAa6fvjCaYIUZuuK4Uj8
	 u3rX1Lf28NJUgEtxQzQknvl49GHdIL3/BQhK0u52Ah34HuIwGNwmOPZ8Wazk5RP8D+
	 6Qk72gXNjeK/ihxZepCSmk88SQ6/WFBF+hbXFzcf75yVI6eVwMES3tmHoZuq7wFuTR
	 bEMO/Ha+1Rrx5Injq/Zjf5n/8V6PJSAthUxJB+SbLApy2d+1EbDZRqmVstCEkH9c3H
	 KdJqYbbmKPdYd31NNGkrWXb7npqrg6k1R3CkfLOMv8DptZ1KaKxHm0BNXe4hhuxFit
	 cw13bPNdO1Mzg==
Message-ID: <sashiko-outbox-164793@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 07/13] ax88179_178a: Add VLAN offload
 support for AX88179A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-7-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-7-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: usb: ax88179a: missing WE command in VLAN filter table init l=
oop
- [Medium] net: usb: ax88179a: ignored USB write errors in VLAN filter init
- [Medium] net: usb: ax88179a: uninitialized stack memory use on short USB =
read
--

commit 86960e6590c9a326bcedbb3ba8fde9f53c488e20
Author: Birger Koblitz <mail@birger-koblitz.de>

    ax88179_178a: Add VLAN offload support for AX88179A
   =20
    The AX88179A-based chips support VLAN offload. Add configuration
    support in netdev_ops. Features supported are:
    NETIF_F_HW_VLAN_CTAG_TX, NETIF_F_HW_VLAN_CTAG_RX
    and NETIF_F_HW_VLAN_CTAG_FILTER.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index c41d9c2dc737a..bdc67cbc17287 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -258,6 +258,88 @@ static const struct ethtool_ops ax88179a_ethtool_ops=
 =3D {
>  	.get_ts_info		=3D ethtool_op_get_ts_info,
>  };
> =20
> +static int ax88179a_vlan_rx_kill_vid(struct net_device *net, __be16 prot=
o, u16 vid)
> +{
> +	struct usbnet *dev =3D netdev_priv(net);
> +	u8 vlan_ctrl;
> +	int ret =3D 0;
> +	u16 reg16;
> +	u8 reg8;
> +
> +	ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, =
1, 1, &reg8);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
If a malicious or buggy USB device responds to the read request with a
zero-length packet, ax88179_read_cmd() will return 0 and skip copying data,
leaving reg8 uninitialized.

Since the error check only verifies if ret < 0, does this allow uninitializ=
ed
stack memory to be used for hardware control and eventually written back to
the MAC? This also applies to the reads in ax88179a_vlan_rx_add_vid() and
ax88179a_set_features().

[ ... ]
> +static int ax88179a_set_features(struct net_device *net, netdev_features=
_t features)
> +{
> +	struct usbnet *dev =3D netdev_priv(net);
> +	netdev_features_t changed;
> +	int ret;
> +	u8 tmp;
> +
> +	changed =3D net->features ^ features;
> +
> +	ret =3D ax88179_set_features(net, features);
> +	if (ret)
> +		return ret;
> +
> +	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
> +		if (features & NETIF_F_HW_VLAN_CTAG_FILTER) {
> +			for (int i =3D 0; i < 256; i++) {
> +				/* Address */
> +				tmp =3D i;
> +				ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
> +						  1, 1, &tmp);
> +				/* Data */
> +				ax88179_write_u16(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
> +						  2, 0);
> +			}

[Severity: Medium]
These ax88179_write_cmd() and ax88179_write_u16() calls lack error checking.
Could this prevent an early abort on device disconnect or hardware failure,
resulting in the thread blocking through 512 failing USB control transfers?

[Severity: High]
Does this loop fail to actually initialize the hardware filter table for the
first 255 entries?

The write enable command (AX_VLAN_CONTROL_WE) is only sent once after the
loop finishes, which suggests that only the last address (255) is written
to the SRAM while the first 255 entries are ignored. Should the WE trigger =
be
included inside the loop?

> +			ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC,
> +					       AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
> +			if (ret < 0)
> +				return ret;
> +			tmp |=3D AX_VLAN_CONTROL_VFE | AX_VLAN_CONTROL_WE;
> +			ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC,
> +						AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
> +			if (ret < 0)
> +				return ret;
> +		} else {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D7
