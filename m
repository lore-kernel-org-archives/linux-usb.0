Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C7232B121
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342342; cv=none; b=YKNavyhQnR8yMiyEwrHk1yVPNZ7VXQY+ao2K0GyC0VFLVrrFZ2AsebP+QSF2wZnzH9e1pPr2Zf5hx11UxPSIJ6f9csn9/IgHLahH+U3YSK5XUx9wWd26dWEaquZA44fBZDqOfmaEZvV1De74Fq2nM2JkE2FWDZt74R5+2Oz4qt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342342; c=relaxed/simple;
	bh=e50mgZmFf9cAFfD7wAo9PYprycp5MzRO9hvzKkOaASY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=X91P4gBhXf1CbJ3w52xJvGTop7v9BB66wxKjuVbA7hxmQT2oG/XpZ1If9ceQ1cH42RShZnM8PIbx7nowena5IwldK/yjs/FTWuDnbWJ48NnryXR+P1Z0KbtRuVHXP8CSrFP9cOUnARz8S5x5TAG7giNhZVMPfpMPl2nF2yKQsno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irgTqb8W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irgTqb8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EBE1F0089C;
	Wed,  7 Oct 2026 03:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342340;
	bh=SCTNNSNEq/yn0sSdGH5AvW1nEXaHksO2k+KJD322zQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=irgTqb8WoNCPS8xjxdY4R6ld4q4jH0ecXaQCj3OBk5ti/9qrwc/pMXgVIHYLBNBgj
	 DpFkEt4r7mrnvj8OiADnQnrgm8eMJJwlWKSklLedBKgi30ZlFCvYW1VKy6HMMJnCK5
	 rnG4rSydHMTLdpHJu00BoBKZWAw65y/pXSNErr2jMoG2XkGNOcee/2y/5ke8pUmUjQ
	 76sWkxYcnhH53x+UZ3jSbwiS/m1TNPMJeJiwUyHJ9KP9pGZ7LlqH4Ybym7CH0MFJD3
	 RH7NALr6Ry1vbTSqTI8d3QTwpS16pE/eO5nL5VuQoXebiECQ0Bwr8qbPFzdsziDLyN
	 8nwZFeVIhtOKg==
Message-ID: <sashiko-outbox-162602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 07/13] ax88179_178a: Add VLAN offload
 support for AX88179A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-7-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-7-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: missing disable logic and brittle XOR toggling in VLAN state =
machine
- [High] net: VLAN filter initialization clobbers AX88179A_VLAN_ID_CONTROL =
register
--

commit a9c0fbb36ee5fddc570645020a27d1096396251d
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add VLAN offload support for AX88179A

This commit adds VLAN offload configuration support in netdev_ops for
AX88179A-based chips. The supported features include NETIF_F_HW_VLAN_CTAG_T=
X,
NETIF_F_HW_VLAN_CTAG_RX, and NETIF_F_HW_VLAN_CTAG_FILTER.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c

[ ... ]

> @@ -517,6 +599,58 @@ static int ax88179a_mii_ioctl(struct net_device *net=
, struct ifreq *rq, int cmd)
>  	return phylink_mii_ioctl(data->phylink, rq, cmd);
>  }
> =20
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

[Severity: High]
Is there a missing else block here for disabling the filter?

Without an else branch, it appears that disabling NETIF_F_HW_VLAN_CTAG_FILT=
ER
via ethtool will have no effect on the hardware since the disable path is
completely skipped.

> +			for (int i =3D 0; i < 256; i++) {
> +				/* Address */
> +				tmp =3D i;
> +				ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
> +						  1, 1, &tmp);
> +				/* Data */
> +				ax88179_write_u16(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
> +						  2, 0);
> +				ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
> +						 1, AX_VLAN_CONTROL_WE);

[Severity: High]
Does writing AX_VLAN_CONTROL_WE directly clobber the rest of the control
register?

Inside this loop, ax88179_write_u8() blindly overwrites the entire control
register with 0x01 instead of using a read-modify-write. This seems to clear
other active configuration bits in the register, such as AX_VLAN_CONTROL_VS=
O,
which could silently break RX VLAN hardware acceleration if it is enabled.

> +			}
> +			ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC,
> +					       AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
> +			if (ret < 0)
> +				return ret;
> +			tmp ^=3D AX_VLAN_CONTROL_VFE;

[Severity: High]
Does this XOR operation lead to an inverted state if the hardware and OS st=
ates
desynchronize?

Using XOR to toggle AX_VLAN_CONTROL_VFE instead of explicitly setting or
clearing the bit based on the features flag means a subsequent state change
could invert the configuration, leading to incorrectly filtered packets.

> +			ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC,
> +						AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	if (changed & NETIF_F_HW_VLAN_CTAG_RX) {
> +		ret =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
> +				       1, 1, &tmp);
> +		if (ret < 0)
> +			return ret;
> +		tmp ^=3D AX_VLAN_CONTROL_VSO;

[Severity: High]
Similarly, does this XOR logic for the RX VLAN offload risk state inversion?

If the OS state and hardware state desynchronize, the bit will be flipped
the wrong way, potentially causing packets to be incorrectly untagged or
causing dropped network traffic.

> +		ret =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
> +					1, 1, &tmp);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D7
