Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311695;
	b=GwOIJHQen0z/IPN/rxUBjywPWqFhFkvK0KlOs56DAyxp9Sp9yZZyUFzU1N+8DvZW+iqx
	 SO4s3xohKmSFmbYQAKli6oMtJgB7KX8iuEBYFVx8cAPv5/xSa8NdX6b+5SVq1g3lgPBNK
	 QRHP4G/5/nAyB3sXB5AztvKLn/SVUfs7lMPc0uZ6GA2FtGeDImXthvlHga641ix79dFOT
	 MzaetuDoJ7c0SJEAkXcuwE4PUn6TVm6UCF+lrMxXxkJyCsvBOnb4wPSu+J/hWWvQS1UaH
	 QhYb/SNPQXQbTS1FdyNGyqHS3oMz6MtxpmBcat95J0ZNZ1G+QOITgmp00Pyp2fvfsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311695;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RcQG9o6Se7vLDgVc2XWQ27vsDQNiAvdTUuyxUHqhQn4=;
	b=AFRelwOhkI2LpfOyrfStzNKzNN0JZZ5EHnHAtNXv7C6/HaGosdiZSIdIEpnYF22aLO8k
	 v3IOlKvTF33IdHZ9NF8w4oH6w1m3ZDBnAELaCLmJRazSfz1Xdy4oZHOtfXyS4XbWt/Mb3
	 SFJhknIc8JSZI4un7JvYARRzDelh7QJxmfMuowCoQZH6y7cY4/aevJ63O0m+cddWQg4YQ
	 5MrUXs6+5CJycjRhUL9kikswG/WP+VJaLhZZ8FPvgSYUETdASP6IBb43D+4hgxU694mOM
	 qfSi5aOqE2D9sh5KhMNd0LcNS5oFhnoU1Yq37ULr1/F2xz820t1F2PjhcuPh+sKiinQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lzmn6iLK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9220606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 22:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lzmn6iLK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294C61F01816;
	Thu, 29 Oct 2026 22:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793311694;
	bh=RcQG9o6Se7vLDgVc2XWQ27vsDQNiAvdTUuyxUHqhQn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lzmn6iLKqblCAa2IgG1jFZNa/lUixwK5AzmUByYWAD3zycOpW2trwEXB9pjIxAoAC
	 AGYmsm8mKMonr935EI2c+oLYDxi7QQdFGY2gWDNcQXseaT9TMlEAuqrf2ra50x6Npz
	 8h/ESw4TMj3Q2lNnxEXgMHvthjh5EFv9hpxuSJ48/cXmNcAqRruGSCkK8yNFUcupdF
	 9v9rBAXzsktrEPVda60y/vA6FDSJw34tyfDCDkPABui8cr7aaPyYQjDhIeWinYFV2w
	 yQYbw31kTWg9J/UA0L5LAWSC5R4ZzxFNFgClBTjIM/1+rV5dEdlFriQReLiICsgusk
	 K5VL2I0auA/ZA==
Message-ID: <sashiko-outbox-190046@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after
 disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029204324.658845-2-mathias.nyman@linux.intel.com>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
 <20261029204324.658845-2-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 22:08:13 +0000
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
- [High] xhci: stale rhub_port state after reset sets EP_DROP_PENDING on ep0
--

commit 3214a21a67ec03e6fc45b610d6ba5543f36b65ab
Author: Yiyu Zhou <yiyu@yiyuzhou.io>

xhci: give back TDs and clean up ep0 after disconnect

This commit fixes a device enumeration regression where USB devices that
briefly disconnect during enumeration leave halted TDs on rings or leave ep0
uncleaned. It cancels and gives back TDs on halted endpoints behind
disconnected ports, hard-resets ep0 so it can continue working after a short
disconnect, and blocks new URB submissions via EP_DROP_PENDING until the
device is reset.

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index c23434001e9cb..a1fa188680f58 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
[ ... ]
> @@ -993,25 +1012,53 @@ static int xhci_handle_halted_endpoint(struct xhci=
_hcd *xhci,
>  {
>  	struct xhci_port *rhub_port =3D ep->vdev->rhub_port;
>  	unsigned int slot_id =3D ep->vdev->slot_id;
> +	bool disconnected =3D false;
> +	struct xhci_ring *ring;
>  	int err;
> =20
> -	/*
> -	 * Avoid resetting endpoint if link is inactive or device disconnected.
> -	 * Can cause host hang.
> -	 * Device will be reset to recover an inactive link, so don't do anythi=
ng
> -	 */
> +	/* link is inactive or device disconnected */
>  	if (rhub_port->link_inactive || !rhub_port->connected) {
>  		ep->ep_state |=3D EP_DROP_PENDING;
> -		return -ENODEV;
> +		disconnected =3D true;
[ ... ]
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 30ac1bc4559b7..b50a582be1fbf 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1665,12 +1665,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, s=
truct urb *urb, gfp_t mem_flag
>  		goto free_priv;
>  	}
> =20
> -	if (xhci->devs[slot_id]->rhub_port->link_inactive) {
> -		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
> -		ret =3D -ENODEV;
> -		goto free_priv;
> -	}
> -
>  	if (xhci->xhc_state & XHCI_STATE_DYING) {
>  		xhci_dbg(xhci, "Ep 0x%x: URB %p submitted for non-responsive xHCI host=
.\n",
>  			 urb->ep->desc.bEndpointAddress, urb);
> @@ -1680,6 +1674,13 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, s=
truct urb *urb, gfp_t mem_flag
> =20
>  	ep_state =3D &xhci->devs[slot_id]->eps[ep_index].ep_state;
> =20
> +	if (xhci->devs[slot_id]->rhub_port->link_inactive ||
> +	    *ep_state & EP_DROP_PENDING) {
> +		xhci_dbg(xhci, "Can't queue urb, port disconnect or link inactive\n");
> +		ret =3D -ENODEV;
> +		goto free_priv;
> +	}

[Severity: High]
Can rhub_port->connected or rhub_port->link_inactive remain stale after a
port reset, causing xhci_urb_enqueue() to permanently reject subsequent ep0
URBs with -ENODEV?

In drivers/usb/host/xhci-ring.c, handle_port_status() appears to be the only
place where port->connected and port->link_inactive are updated:

drivers/usb/host/xhci-ring.c:handle_port_status() {
	...
	if (!(portsc & PORT_RESET)) {
		port->link_inactive =3D (pls =3D=3D XDEV_INACTIVE);
		port->connected =3D !!(portsc & PORT_CONNECT);
	}
	...
}

When a device briefly disconnects during enumeration in hub_port_init() (or
enters XDEV_INACTIVE), PORT_CSC (or PORT_PLC) transitions from 0 to 1, the
xHC generates a Port Status Change Event (TRB_PORT_STATUS), and
handle_port_status() sets port->connected =3D 0 (or port->link_inactive =3D=
 1)
without clearing the PORTSC change bits.

When the device reconnects and hub_port_init() calls hub_port_reset(), a new
Port Status Change Event is only generated by the xHC when the logical OR of
all PORTSC status-change bits (CSC | PEC | WRC | OCC | RC | PLC | CEC)
transitions from 0 to 1. Because PORT_CSC (or PORT_PLC) is already 1 when
the device reconnects and when the reset completes (setting PORT_RC =3D 1),=
 no
TRB_PORT_STATUS event is generated:

- On USB2, hub_port_wait_reset() sees USB_PORT_STAT_C_CONNECTION, clears
  PORT_CSC while PORT_RC is still 1 (keeping the logical OR of change bits
  at 1), and returns -EAGAIN. hub_port_reset() then issues a second reset
  while PORT_RC is still 1 and clears PORT_RC upon completion, transitioning
  the logical OR of change bits from 1 to 0.

- On USB3, hub_port_reset() clears C_RESET, C_BH_PORT_RESET,
  C_PORT_LINK_STATE, and C_CONNECTION together after reset completion, also
  transitioning the logical OR of change bits from 1 to 0.

Neither xhci_get_port_status(), xhci_clear_port_change_bit(), nor
xhci_discover_or_reset_device() refreshes port->connected or
port->link_inactive:

drivers/usb/host/xhci.c:xhci_discover_or_reset_device() {
	...
command_cleanup:
	for (i =3D 0; i < EP_CTX_PER_DEV; i++)
		virt_dev->eps[i].ep_state &=3D ~EP_DROP_PENDING;
	...
}

After xhci_discover_or_reset_device() clears EP_DROP_PENDING, if
rhub_port->link_inactive remained 1, xhci_urb_enqueue() will immediately
reject all URBs with -ENODEV. If rhub_port->connected remained 0,
enumeration continues on the same udev, vdev, and ep0 until any normal
protocol stall (COMP_STALL_ERROR) occurs on ep0 (for example,
check_highspeed() requesting USB_DT_DEVICE_QUALIFIER on a full-speed USB 2.0
device, or hid_set_idle() during usbhid probe) or an URB is unlinked via
xhci_handle_cmd_stop_ep(). At that point, xhci_handle_halted_endpoint() (or
xhci_handle_cmd_stop_ep()) sees !rhub_port->connected and sets
EP_DROP_PENDING on ep0.

Because a protocol stall or URB unlink does not trigger a device reset,
wouldn't EP_DROP_PENDING remain set on ep0 and cause the new check in
xhci_urb_enqueue() to reject all subsequent ep0 URBs with -ENODEV?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029204324.6588=
45-2-mathias.nyman@linux.intel.com?part=3D1
