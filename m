Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792606396;
	b=CjFDWK3IUHq5CGtesW2OfbEysxfpDEBERW2hQB156e56TZXomYeEQgIM3gA2vRmX0BGL
	 KGNnJmeVf1OhrpAzNGh3RYKpTshn/e4BZY2EeYO2ZBOBIAg+ArTZDp8fFXquQgW/GwNYH
	 1GvjhBl8G2zHmx03J2hBKvV+MZPdkBDMwAbfPD4+8LGwoQlpBs/MYISIlmQh3zXS3Fk6k
	 lewXOH0Ck/btmRh9azuygj3hBDNvlYpxTE0NyyPc3rk3KjaCYKSB85AZWF8U/sGyxXKSG
	 g8W9v5ICBRUREBmger8zJi9U4p0eRn03VGCq0slSim5QibdgurjM4TcYEcslX7b9eXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792606396;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EJnT7WdFL40q8IUZ0Y2GrThgSmsqC0vhFrdNEXR+vzI=;
	b=pTnPMidtIKnlxRoZToYhKSgK8VeqGHUdpYdDO83r6FH4zxJxVSMiW9QqMhChUNKIgSWs
	 Aj/j7BTTTJi4SyMjCnB6nruT8XkBld7gJOPyw6CRnq8EDUCKVCJiMqYfVJuJxqTncPa5v
	 V4tRyAlGHGtuWy3W2JE1E0SxbGhbNJ61X0xLwZbgrKtKxQJ9v348DF7W2hGMFfPGr5+d8
	 dnkyoudIHiKlqJmOInqEXpYfdeDDMfWLbi1VeIevYsQjJLtQVUPdWe1G4ZUX/RkPZXWAL
	 Y+Tu9c12xlNfBbSMrnoFCJdiPtfOhSbOZBv8uMX6TTJIpUCUDOZgDTMHq40dkhJNIDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCk0YuUK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194A1606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NCk0YuUK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B461F000C1;
	Wed, 21 Oct 2026 18:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792606395;
	bh=EJnT7WdFL40q8IUZ0Y2GrThgSmsqC0vhFrdNEXR+vzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NCk0YuUKB4ucb48DbzwmnJQk2oihXr/9sOyUcJ84widd3y2oj5QeeNCSpjJfEGaaC
	 WCHCfxG9XcPJg5Ta8XAeNzrC5yI17FjiuYdgMsrFEmo+MjhZ8ZQRvWNXpfYtmADyZ2
	 2e7LuqCfjCWxDgxOC2fK8QwIFMXpw9rxrv/zdperLsNmshD0gUFVOyNEontmaTR+Zy
	 mS9DSuVfg4RsdeEJJkXk8v92Al81ieRbz+9hGsiDaTZFdquC19g7oLU8T7IQWyYkFv
	 CqjU7I0kNMG4Rw1wqcFDzhmFsfOJOcFjDh9CjmFzszTxAYdi+H4704Vw65zF7HXqwr
	 ysMk/8/cElG3w==
Message-ID: <sashiko-outbox-180546@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3] net: usb: lan78xx: avoid NULL PHY dereference in
 WoL setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashant Sengar" <prashantsengar25031@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020181237.2374075-1-prashantsengar25031@gmail.com>
References: <20261020181237.2374075-1-prashantsengar25031@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 18:13:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: usb: lan78xx: WoL left enabled in probe when no PHY is atta=
ched
--

commit 875dd87fe0cdd58a79d308dc9e623386e8a76113
Author: Prashant Sengar <prashantsengar25031@gmail.com>

net: usb: lan78xx: avoid NULL PHY dereference in WoL setup

This commit avoids a NULL pointer dereference in lan78xx_set_wol() on
PHY-less configurations by reporting no Wake-on-LAN support in
lan78xx_get_wol() and returning -EOPNOTSUPP from lan78xx_set_wol() when
netdev->phydev is NULL.

> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index 5655941f14783..612e1e46de6dd 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -1763,7 +1763,11 @@ static void lan78xx_get_wol(struct net_device *net=
dev,
>  	int ret;
>  	u32 buf;
>  	struct lan78xx_priv *pdata =3D (struct lan78xx_priv *)(dev->data[0]);
> -
> +	if (!netdev->phydev) {
> +		wol->supported =3D 0;
> +		wol->wolopts =3D 0;
> +		return;
> +	}
>  	if (usb_autopm_get_interface(dev->intf) < 0)
>  		return;
> =20
> @@ -1795,6 +1799,9 @@ static int lan78xx_set_wol(struct net_device *netde=
v,
>  	if (wol->wolopts & ~WAKE_ALL)
>  		return -EINVAL;
> =20
> +	if (!netdev->phydev)
> +		return -EOPNOTSUPP;

[Severity: Medium]
When netdev->phydev is NULL (for example, on LAN7801 in fixed-link mode),
lan78xx_get_wol() now reports that Wake-on-LAN is unsupported and disabled,
and lan78xx_set_wol() rejects attempts to change it.

However, during probe, lan78xx_probe() -> lan78xx_bind() unconditionally
initializes pdata->wol before lan78xx_phy_init() checks whether a PHY is
present:

drivers/net/usb/lan78xx.c:lan78xx_bind() {
	...
	dev->net->flags |=3D IFF_MULTICAST;

	pdata->wol =3D WAKE_MAGIC;
	...
}

And lan78xx_probe() then unconditionally enables wakeup on the USB device:

drivers/net/usb/lan78xx.c:lan78xx_probe() {
	...
	ret =3D lan78xx_phy_init(dev);
	if (ret < 0)
		goto free_urbs;
	...
	ret =3D device_set_wakeup_enable(&udev->dev, true);
	...
}

When the system suspends while the interface is open, lan78xx_suspend() uses
pdata->wol to configure the MAC for Magic Packet wakeup (enabling WUCSR_MPE=
N_
and PMT_CTL_WOL_EN_ in lan78xx_set_suspend()):

drivers/net/usb/lan78xx.c:lan78xx_suspend() {
	...
		} else {
			struct lan78xx_priv *pdata;

			pdata =3D (struct lan78xx_priv *)(dev->data[0]);
			netif_carrier_off(dev->net);
			ret =3D lan78xx_set_suspend(dev, pdata->wol);
			if (ret < 0)
				goto out;
		}
	...
}

Does this leave Wake-on-LAN active in hardware and driver state on PHY-less
configurations while ethtool reports it as disabled and prevents userspace
from turning it off?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020181237.2374=
075-1-prashantsengar25031@gmail.com?part=3D1
