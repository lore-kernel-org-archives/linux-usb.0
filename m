Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BCB3C9456
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694501; cv=none; b=GApfT5ogftsm4Snqhek3DQIVHo4Y1fROeIUeIWuDPg/wzx24DGMZuhWRu+StF3KDBlIaTkBv307yh26jydtR2CC6Op2P5f/qiZdemoMiuYoye1yc3PTVsIQEK2c3r6l3GQ28AAbN/5KvQ1f74RqpxdmWUDRrs+rhbMMaiHUi1sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694501; c=relaxed/simple;
	bh=p/sEa0mVxDFB3A/RxMUgwM7CKr0xSC+SCov5g/yoZcs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qS9V31Y+eMeTp+KLiX5Q6PDHWooNji55Tc9C98PZjMFRruDce7kZSoMgczQnOxsGbmX5LiaRpdv833U8TlXhX1BwsmrB4VaSomhcuGjlMLZ5ipq8yhcYz434EdkO93zMb0Qxf/Uxg4xnrbXkBzBkm6toCPZhaW0YpG3fLfd7WPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxWCmu0r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxWCmu0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051B31F0089C;
	Sun, 11 Oct 2026 04:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694500;
	bh=BcWO9Le3Wdz5/Z06KPZ9c16ZN8Jj8DTSAsYjnJ57czo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LxWCmu0rJ30c5dhsKq5WWzBZghtWADIx8myGw74+ACVV9mWTKpQXd6u4HD2e2hcpA
	 iGrK/wlZMdWKD/UqvhU2pZgPLzaoYZEtHIGbGjAMDcMG4puuukRtzLFymPKq0/8uhd
	 A0sRwrmSoHJoGPK7sPeQOoVz90NSJyOqFDnjB9YDvnvYYn4x+9LDl33tr0yLm6KPNo
	 X8+uD9MbopAA/f/zqgZovDoaFIzI+q++L/PphBoImbE+SJeXcLDWkih2duyfeB7SAA
	 FTzc7tYBOLboMSPnGn7dbWtTnD630GB6kpgtj0WKx1A6XcF4kbL/M65pSkZFJbqTWj
	 M5nxDk+UIFQdQ==
Message-ID: <sashiko-outbox-167018@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 03/13] ax88179_178a: Split driver into
 library and device specific code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-3-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-3-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:59 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] net: incomplete locking of AX_MEDIUM_STATUS_MODE via medium_stat=
us_mutex
- [Medium] net: state inconsistency in ax88179_change_mtu() on hardware err=
or
--

commit 8bce779356427c710a868a77c78e34ccdbc5fe82
Author: Birger Koblitz <mail@birger-koblitz.de>
ax88179_178a: Split driver into library and device specific code

This commit splits the ax88179_178a module code into common library
code and device-specific code. It also introduces medium_status_mutex
to protect concurrent access to hardware registers in ax88179_change_mtu().

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> new file mode 100644
> index 0000000000000..063427ff55e42
> --- /dev/null
> +++ b/drivers/net/usb/ax88179_lib.c
[ ... ]
> +int ax88179_change_mtu(struct net_device *net, int new_mtu)
> +{
> +	struct usbnet *dev =3D netdev_priv(net);
> +	struct ax88179_data *data;
> +	u16 tmp16;
> +	int err;
> +
> +	data =3D dev->driver_priv;
> +	mutex_lock(&data->medium_status_mutex);

[Severity: Medium]
While this mutex protects AX_MEDIUM_STATUS_MODE here, are there other
functions that modify this register concurrently without acquiring the mute=
x?

For example, it appears ax88179_link_reset() in ax88179_178a.c modifies
AX_MEDIUM_STATUS_MODE asynchronously without acquiring medium_status_mutex =
or
rtnl_lock:

	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
			  2, 2, &mode);

Can this lead to data races and hardware state corruption when a PHY link
event triggers asynchronously?

> +	WRITE_ONCE(net->mtu, new_mtu);
> +	dev->hard_mtu =3D net->mtu + net->hard_header_len;
> +	if (net->mtu > 1500) {
> +		err =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				       2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;

[Severity: Medium]
If the hardware command fails, we jump to err_out, but the software state
(net->mtu and dev->hard_mtu) has already been updated. Will this leave the
networking stack out of sync with the hardware MTU?

Would it be safer to store the old MTU values and restore them on the error
path, or defer updating the software state until the hardware commands
succeed?

> +		tmp16 |=3D AX_MEDIUM_JUMBO_EN;
> +		err =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +					2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +	} else {
> +		err =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				       2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +		tmp16 &=3D ~AX_MEDIUM_JUMBO_EN;
> +		err =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +					2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +	}
> +	mutex_unlock(&data->medium_status_mutex);
> +
> +	/* max qlen depend on hard_mtu and rx_urb_size */
> +	usbnet_update_max_qlen(dev);
> +
> +	return 0;
> +
> +err_out:
> +	mutex_unlock(&data->medium_status_mutex);
> +	return err;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D3
