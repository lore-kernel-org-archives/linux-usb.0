Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7723B71A7
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342344; cv=none; b=XhavCbxkgnaKAYeDFKNHx04REbEe1Cy0GZ98QsB1kkhAI96j3vGeQVwd5lLAvgAfNl7fe4OKflD1Paqp0kDOuDzh034GZZvLdbN+ORWDuoMIe5x7wAXuQGPPlds0ZQBOXvWbc1qArm5C2PUrBLQvgYn1jZjw0ZsI05QBhHv46Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342344; c=relaxed/simple;
	bh=3xKpujszPJ9AMP8bYxX3MfP0NWEBTLhU+KJj6kcWxAk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=moV4PpoWjf+KcVBm1hNqoXGCOmgoktzw39boeyWIlZiCA8wxMewM5gpbaImxeqQbRS1+4aYhbGHiSzFCHPqthXNg7PrjWAiC8CmOeQ7QGwcxT438Tjhd3qWUU0/zhVUAutcBDbQHDFPP8ALFBpFx2U6Yy73h+STfHRXxYqlz6QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOPbN9BV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOPbN9BV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553C01F0089D;
	Wed,  7 Oct 2026 03:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342343;
	bh=CmgVrU3Gy41GkarDAK7KIH2Jsq0YYetjROBwAYJbcZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aOPbN9BV6Fs8ES6+m3Lo/cegT21Qj8KjqX7VLDfWCsNJw77vAq82ERyS0IXTmYeYi
	 qP/MUac7KfUN86O4VZ6uiUObnQ2qzWicdCcLsgqdQVE3hKCHtHceE75B/w68kj5maH
	 cWrItn14ststYiFY6o4GQPbLZ/JBnZILezFWrG0a/Rn+gBU9tX3eTyW2tFc+YZWXsT
	 3/IR0lUFlpchmHn6sADU51Ah6+qBWC+wQZHxoHrcVCXuWXacftWGJxRCMVK2+TwQ1Y
	 x9v81fyrejjVOT64ne+yGidGYL11ZllLd+dk60aNy4pYjo62L6B0o0/DA/pnR2c4gz
	 R8+cli/2d+wmg==
Message-ID: <sashiko-outbox-162606@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 09/13] ax88179_178a: Add Suspend/resume
 support for AX88179A/772D/279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-9-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-9-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] pm: pm_runtime_get_noresume usage count leak on unbind
- [High] net: ax88179a: in_pm state leak prevents PHY recovery on suspend e=
rror
- [Medium] net: ax88179a: unbalanced phylink_resume on suspend error path
- [Medium] net: ax88179a: missing usbnet_resume on resume error path
--

commit a41c6d9493f6bfa6db95add83f5f79963fe546ba
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add Suspend/resume support for AX88179A/772D/279

This commit adds suspend and resume functionality for the AX88179A, AX88772=
D,
and AX88279 architectures. It implements wrapper functions in the shared
library to call the specific suspend and resume implementations.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index e592382692c74..aa5f2d6e42e76 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
[ ... ]
> @@ -126,6 +128,62 @@ static void ax88179a_status(struct usbnet *dev, stru=
ct urb *urb)
>  	phylink_mac_interrupt(data->phylink);
>  }
> =20
> +static int ax88179a_suspend(struct usb_interface *intf, pm_message_t mes=
sage)
> +{
> +	struct usbnet *dev =3D usb_get_intfdata(intf);
> +	struct ax88179_data *priv;
> +	u8 tmp8 =3D 0;
> +	u16 tmp16;
> +	int ret;
> +
> +	priv =3D dev->driver_priv;
> +	ax88179_set_pm_mode(dev, true);
> +
> +	if (netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_suspend(priv->phylink, !!priv->wolopts);
> +		rtnl_unlock();
> +	}
> +
> +	ret =3D usbnet_suspend(intf, message);
> +	if (ret) {
> +		rtnl_lock();
> +		phylink_resume(priv->phylink);

[Severity: Medium]
Could this unconditionally start the phylink state machine on an interface
that is administratively down?

In ax88179a_suspend(), phylink_suspend() is only called if netif_running()
is true, but if usbnet_suspend() subsequently fails, the error recovery path
here calls phylink_resume() regardless.

[Severity: High]
Does this error path leak the in_pm state?

During ax88179a_suspend(), in_pm is set to true. If usbnet_suspend() returns
an error, the function returns early without resetting in_pm to false via
ax88179_set_pm_mode(). If an autosuspend or system suspend is aborted due to
this error, subsequent calls to ax88179a_reset() will permanently skip
phylink_start() because in_pm is incorrectly left as true.

> +		rtnl_unlock();
> +		return ret;
> +	}
> +
> +	/* Enable WoL */
[ ... ]
> +static int ax88179a_resume(struct usb_interface *intf)
> +{
> +	struct usbnet *dev =3D usb_get_intfdata(intf);
> +	struct ax88179_data *ax179_data;
> +	u8 reg8 =3D 0;
> +	int ret;
> +
> +	ax179_data =3D dev->driver_priv;
> +	ax88179_set_pm_mode(dev, true);
> +
> +	ret =3D ax88179_read_cmd(dev, AX88179A_PHY_POWER, 0, 0, 1, &reg8);
> +	if (ret < 0) {
> +		ax88179_set_pm_mode(dev, false);
> +		return ret;

[Severity: Medium]
If ax88179_read_cmd() fails, does returning early here leave the
dev->suspend_count permanently unbalanced?

The usbnet_suspend() function increments dev->suspend_count and stops the
queues. Because this error path bypasses usbnet_resume(), the count is never
decremented.

> +	}
> +	if (!(reg8 & AX_PHY_POWER)) {
[ ... ]
> @@ -784,6 +886,13 @@ static int ax88179a_bind(struct usbnet *dev, struct =
usb_interface *intf)
>  	if (ret)
>  		goto initphy_err;
> =20
> +	/* Keep this interface runtime-PM active by taking a usage ref.
> +	 * Prevents runtime suspend while bound and avoids resume paths
> +	 * that could deadlock (autoresume under RTNL while USB PM lock
> +	 * is held, phylink/MDIO wants RTNL).
> +	 */
> +	pm_runtime_get_noresume(&intf->dev);

[Severity: High]
Does this leak the PM usage counter?

The usage reference is acquired here to prevent runtime autosuspend, but the
unbind path (ax88179a_unbind()) does not seem to drop this reference via
pm_runtime_put_noidle(). Rebinding the driver or initiating a software
unbind/bind cycle could repeatedly leak the PM reference, permanently
preventing the device and its parent USB hubs from entering runtime suspend.

> +
>  	return 0;
> =20
>  initphy_err:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D9
