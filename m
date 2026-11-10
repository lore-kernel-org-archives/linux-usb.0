Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330175;
	b=1EH1XRZCsyF7tfPKK9c3COZUDSSStc4xXdu37JlnzKTJWuDZ+APhAhwqAMfjyUEopcN3
	 JA6RwkJOj/H7s3xjLe+3bar4w16HJJ7QwTeEhAT1UfR8hjxngIV59npX3JahztkorN3TP
	 Qw6AZDZCvlo5QfK6WFyULKjB9HOaossd8Re02VKpVaZAZHbtrxhRFZnC1t5/cxsCRceI8
	 ARl/VpjeRHSGg6dGNumelRc/T/fGIN7uhhOUkUIzrw1N3r3NWyy8XCJWJmY+l20RcKS01
	 tuoJ2ZZK7Z4mrEBJec+LbRq4XZzroUpg4R5EjnvLMkqJWy5Y1/Zq3+7DZywSwDOs56Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330175;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PZooZTegmia+/CXyAFMYe45djfCuOxizt8wtz2PxZ60=;
	b=XPvl2MvXBaOKrqIx54upbmamc68vBLIx0+tvOEuFD67OLrG+jhkXB8DiqgBPW+2x6Qdj
	 gNflpF7XGTgZ7cFuYyiOwqD1JEO/P7MHjBH4aJ9dlidL14BoVzOXeXSYNbVaVLoevLLRp
	 t7AZeE4mJMzHJYEqyWb/tkZ8hw/eP5s1oKmvUX5BZLxxFsYbZL4Xny6w3QY+hWqNuB+ei
	 oG3ALFtVxAsAGgty6LkBVwS9N0ou0lr37TtHr+LWhPmxq+c3hl2P5Pf3u0/dwpuiahxdB
	 ziwy+K9SNV2R1dt4a6a+VX+40l/zywhe26tMlq7ye7Zwkp/NcFPsPFuZXIvIA0+522w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUHg8PXn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA06606A330
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FUHg8PXn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7DF1F008A3;
	Tue, 10 Nov 2026 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794330174;
	bh=PZooZTegmia+/CXyAFMYe45djfCuOxizt8wtz2PxZ60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FUHg8PXnStgpX5K5Itx8MV/6WRrb2JxpbGkKB/JW0Ob9a9am0/xlzGBFoHDUUQc6w
	 xju1UX9tcmRS+y4lqqQLyoIjHA9dSCmWOGYDoU5WE9iwMvF0EAaG+8225fe/9KGg12
	 NitgwMe1SUqKnEX59xSgafb50wWQLsqzERTB2r/XyDjm4hmYbFU1VHBB/VJlzTy1z7
	 7HksJirKxxsHkvV7PQrIfG7PtmcL+s+C17spIzIuZMlkibtDeMSbIFFKLuhPhg050e
	 omiuJBzuImi+zAjqw6CZLaTrA5PRcKClZksBvOhvc8Zll01M634uGkmcYfDOKQCyy9
	 vyNliulO9QeBg==
Message-ID: <sashiko-outbox-207439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next] net: usb: name usb ethernet mdio buses
 reliably
Reply-To: sashiko-reviews@lists.linux.dev
To: "Blake Alexander" <blake.alexander@airbus.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-net-usb-mdio-naming-v1-1-f4cca6737784@airbus.com>
References: <20261109-net-usb-mdio-naming-v1-1-f4cca6737784@airbus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:02:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] net: usb: MDIO bus name collision via usb_make_path() on
  shared bus_name
- [Low] net: usb: missing usb_make_path() MDIO bus naming in
  smsc95xx_bind()
--

commit 29b6f41fcf0619fc5074a9aed4a761b5bff3fdf8
Author: Blake Alexander <blake.alexander@airbus.com>

net: usb: name usb ethernet mdio buses reliably

This commit replaces the "usb-%03d:%03d" MDIO bus naming in asix_devices,
ax88172a, and lan78xx with usb_make_path() so that USB Ethernet devices at
fixed topology positions receive deterministic MDIO bus names.

> diff --git a/drivers/net/usb/asix_devices.c b/drivers/net/usb/asix_device=
s.c
> index 293ef80c4e302..c752fa3868b81 100644
> --- a/drivers/net/usb/asix_devices.c
> +++ b/drivers/net/usb/asix_devices.c
> @@ -680,9 +680,8 @@ static int ax88772_init_mdio(struct usbnet *dev)
>  	priv->mdio->write =3D &asix_mdio_bus_write;
>  	priv->mdio->name =3D "Asix MDIO Bus";
>  	priv->mdio->phy_mask =3D ~(BIT(priv->phy_addr & 0x1f) | BIT(AX_EMBD_PHY=
_ADDR));
> -	/* mii bus name is usb-<usb bus number>-<usb device number> */
> -	snprintf(priv->mdio->id, MII_BUS_ID_SIZE, "usb-%03d:%03d",
> -		 dev->udev->bus->busnum, dev->udev->devnum);
> +
> +	usb_make_path(dev->udev, priv->mdio->id, MII_BUS_ID_SIZE);
> =20
>  	ret =3D mdiobus_register(priv->mdio);
>  	if (ret) {
> diff --git a/drivers/net/usb/ax88172a.c b/drivers/net/usb/ax88172a.c
> index f5036451f0869..9f050de0cddbd 100644
> --- a/drivers/net/usb/ax88172a.c
> +++ b/drivers/net/usb/ax88172a.c
> @@ -73,9 +73,8 @@ static int ax88172a_init_mdio(struct usbnet *dev)
>  	priv->mdio->read =3D &asix_mdio_bus_read;
>  	priv->mdio->write =3D &asix_mdio_bus_write;
>  	priv->mdio->name =3D "Asix MDIO Bus";
> -	/* mii bus name is usb-<usb bus number>-<usb device number> */
> -	snprintf(priv->mdio->id, MII_BUS_ID_SIZE, "usb-%03d:%03d",
> -		 dev->udev->bus->busnum, dev->udev->devnum);
> +
> +	usb_make_path(dev->udev, priv->mdio->id, MII_BUS_ID_SIZE);
> =20
>  	ret =3D mdiobus_register(priv->mdio);
>  	if (ret) {
> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index d73002b2c21ac..153aa56b8e681 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -2117,8 +2117,7 @@ static int lan78xx_mdio_init(struct lan78xx_net *de=
v)
>  	dev->mdiobus->name =3D "lan78xx-mdiobus";
>  	dev->mdiobus->parent =3D &dev->udev->dev;
> =20
> -	snprintf(dev->mdiobus->id, MII_BUS_ID_SIZE, "usb-%03d:%03d",
> -		 dev->udev->bus->busnum, dev->udev->devnum);
> +	usb_make_path(dev->udev, dev->mdiobus->id, MII_BUS_ID_SIZE);
> =20
>  	switch (dev->chipid) {
>  	case ID_REV_CHIP_ID_7800_:

[Severity: Medium]
Can usb_make_path() produce duplicate mii_bus->id strings across the USB
2.0 and USB 3.0 buses of an xHCI controller?

usb_make_path() formats "usb-%s-%s" from udev->bus->bus_name and
udev->devpath, omitting udev->bus->busnum.  Dual-roothub xHCI drivers
(such as xhci-pci and xhci-plat) register both the USB 2.0 main_hcd and
the USB 3.0 shared_hcd with the same controller device name as bus_name,
and number their roothub ports independently starting at 1:

drivers/usb/host/xhci-pci.c:xhci_pci_common_probe() {
	...
	xhci->shared_hcd =3D usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
						 pci_name(dev), hcd);
}

When a USB 2.0 adapter on main_hcd and a SuperSpeed adapter (such as a
LAN7800) on shared_hcd sit at the same relative devpath (for example,
when USB 2.0 port N and USB 3.0 port N map to different physical
connectors or match behind downstream hubs), both receive the same
mii_bus->id.  __mdiobus_register() then fails with -EEXIST in
device_register(&bus->dev), causing probe or bind of the second network
interface to fail.

[Severity: Low]
Should smsc95xx_bind() also be updated to match the other USB Ethernet
MDIO bus drivers?

drivers/net/usb/smsc95xx.c:smsc95xx_bind() still formats
pdata->mdiobus->id using busnum and devnum, even though it already uses
usb_make_path() earlier in the same function for its IRQ domain fwnode:

drivers/net/usb/smsc95xx.c:smsc95xx_bind() {
	...
	snprintf(pdata->mdiobus->id, ARRAY_SIZE(pdata->mdiobus->id),
		 "usb-%03d:%03d", dev->udev->bus->busnum, dev->udev->devnum);
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-net-usb-md=
io-naming-v1-1-f4cca6737784@airbus.com?part=3D1
