Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423537;
	b=Faiv8rm6lGGNQyZcfOy/+DlGpZWDnqm2v4LLBSyfRIzR3czrBbeNaBilgK/ZvuIyOCxA
	 4oP3EhFgzPJHObXc9VQkxN1NGKoUhvkfOtsSVK2zMnV4F3G3vhUkH/uQdUbXFaSXjIatf
	 2TjeNjUqzCBE0lKb0OLjdxP85YLJb2f/Ej5+jP0qAiofXEwnXz3Bya5pl88MAAWIG+Ipy
	 qbCIx3o+Vx9Xpww9O2udgs/9f9mnhJfKHfgUrSyhTfkuMA7c+tsAjNZ5Yd9DWjGTJPZFf
	 0ykYrfcAAv6DxGoVk+aAf0DvoTSv+14xjRnjBm5yH5Gd0Z1hf/lKGhidQXfk/OJUt9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1B4ygqLWWJbXodrP5givHLKv/6Rw4gjBhefcHaBVAns=;
	b=j9sW9mcZl/iwErFpUoJmyzcm/HvQzCfJGySYqaUVIELtxXJ/0YDi0K3AFLoMtsKbg5K1
	 EFh291zAom+4DloxIFA8BlS8l+3ETYzpv5HeQCjhn8NA/tHlys+YLEzwOpGH60ftetGoj
	 kGxN79sqIl7DL5vu0vy1Ehey4ypX5N3ibWHmllkUFer21x367LJnNNmICbnzzyC4blcWi
	 Z4JIFxCFoaGsiC5E+dWgOf+pSDpLVNGpf6sB/cQyuT9ovweg+OMUoIbHWkf7FNS10vZbg
	 Dq33+dG2dEc5H5g3+sptWiIQf7NRceMq4mg/Bd7IdjcDnH1kQwahdCH79ZznenMUPCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDOrzuTV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2DF60B0990
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDOrzuTV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DA81F000C4;
	Mon, 19 Oct 2026 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792423537;
	bh=1B4ygqLWWJbXodrP5givHLKv/6Rw4gjBhefcHaBVAns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDOrzuTVFwDtLMkPjFutpCO7GNyLo79honv8VLNnXJf1eFna9zDQj9Lj0/uoKp9WG
	 IoM39tMN0asTUSDOOLIytj+AVKYQLeKMx/sJlyppawdciniuO2dsqYx5bovVVpxiNr
	 rv/bMA5j/3tFx33OV0Lv1ibKqS8Xw8KPkqod+sJYVGxI3d8MLwPZfZOytMmXTDPWGf
	 Rws/QpEchGIH9kyf0Ds6hBrtfBeJsA1lepZyOHz4HPl22GqzO+D7xEOO6tHpmGWN5o
	 A8MRsT9xcIgx+2nZJMOYmmG7cWN8Oe3J7DCqlRtQ2ENjSDwCDtgSoQi/n42VU5B01M
	 mg21MgD2OaQ8w==
Message-ID: <sashiko-outbox-177720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] xhci: include all root port children in
 recovery prevention on link error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-362-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-362-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:25:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] xhci: stale port->link_inactive flag after port reset blocks URBs
- [High] xhci: null pointer dereference of rhub_port in xhci_urb_enqueue()
- [Medium] xhci: data race on xhci_port bitfields in handle_port_status()
--

commit 4f9e83e35ad88ce35eba19f2dbcc0cb418ac035b
Author: Mathias Nyman <mathias.nyman@linux.intel.com>

xhci: include all root port children in recovery prevention on link error

This commit moves the link error flag from struct xhci_virt_device to
struct xhci_port so that child devices behind hubs also avoid useless
transfer retries and endpoint recovery when a root port has a link error.

Link: https://patch.msgid.link/20260806142113.2436238-4-mathias.nyman@linux=
.intel.com

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 6ce5874fc4b3d..dc18da8385a21 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c

[ ... ]

> @@ -2061,12 +2064,12 @@ static void handle_port_status(struct xhci_hcd *x=
hci, union xhci_trb *event)
>  		usb_hcd_resume_root_hub(hcd);
>  	}
> =20
> -	if (vdev && (portsc & PORT_PLS_MASK) =3D=3D XDEV_INACTIVE) {
> -		if (!(portsc & PORT_RESET))
> -			vdev->flags |=3D VDEV_PORT_ERROR;
> -	} else if (vdev && portsc & PORT_RC) {
> -		vdev->flags &=3D ~VDEV_PORT_ERROR;
> -	}
> +	/*
> +	 * Tag broken links to avoid retries while hub driver sorts it out.
> +	 * Link status is not relible while port is in reset.
> +	 */
> +	if (!(portsc & PORT_RESET))
> +		port->link_inactive =3D (pls =3D=3D XDEV_INACTIVE);

[Severity: High]
Can port->link_inactive remain stuck at 1 after a port reset if reset
completion does not generate a new Port Status Change Event TRB?

Commit b69dfcab6894b1 ("xhci: fix stale flag preventig URBs after link state
error is cleared") previously addressed a scenario where a USB3 link enters
XDEV_INACTIVE between two resets in hub_port_init() by clearing
VDEV_PORT_ERROR in xhci_discover_or_reset_device().

When the port enters XDEV_INACTIVE, hardware sets PORT_PLC in PORTSC and
generates a TRB_PORT_STATUS event, which runs handle_port_status() and sets
port->link_inactive =3D 1 while leaving PORT_PLC set in PORTSC for USB3 por=
ts.

Because the resetting thread holds port_dev->status_lock, port_event()
cannot run to clear PORT_PLC before the subsequent hub_port_reset() issues
USB_PORT_FEAT_BH_PORT_RESET or USB_PORT_FEAT_RESET:

drivers/usb/core/hub.c:hub_port_reset() {
	for (i =3D 0; i < PORT_RESET_TRIES; i++) {
		status =3D set_port_feature(hub->hdev, port1, (warm ?
					USB_PORT_FEAT_BH_PORT_RESET :
					USB_PORT_FEAT_RESET));
		...
}

As noted in the comment at the end of handle_port_status(), the xHC only
generates a Port Status Change Event TRB when the logical OR of all PORTSC
status-change bits transitions from 0 to 1:

drivers/usb/host/xhci-ring.c:handle_port_status() {
	/*
	 * xHCI port-status-change events occur when the "or" of all the
	 * status-change bits in the portsc register changes from 0 to 1.
	 * New status changes won't cause an event if any other change
	 * bits are still set.  When an event occurs, switch over to
	 * polling to avoid losing status changes.
	 */
}

Since PORT_PLC is already 1 during the reset, reset completion (setting
PORT_RC or PORT_WRC and transitioning PLS to XDEV_U0) will not generate a
new Port Status Change Event TRB. With the flag clearing removed from
xhci_discover_or_reset_device() and nothing in xhci_hub_control() updating
port->link_inactive, won't port->link_inactive stay 1 and cause
xhci_urb_enqueue() to reject all subsequent URBs for the port's devices
with -ENODEV?

> =20
>  	if ((portsc & PORT_PLC) && (portsc & PORT_PLS_MASK) =3D=3D XDEV_RESUME)=
 {
>  		xhci_dbg(xhci, "port resume event for port %d\n", port_id);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 14eeb16f668b2..a4fab82da76b6 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1674,7 +1674,7 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, st=
ruct urb *urb, gfp_t mem_flag
>  		goto free_priv;
>  	}
> =20
> -	if (xhci->devs[slot_id]->flags & VDEV_PORT_ERROR) {
> +	if (xhci->devs[slot_id]->rhub_port->link_inactive) {

[Severity: High]
Could xhci->devs[slot_id]->rhub_port be NULL here, leading to a NULL pointer
dereference?

In xhci_check_args(), the check succeeds as soon as udev->slot_id and
xhci->devs[slot_id] are set with virt_dev->udev =3D=3D udev:

drivers/usb/host/xhci.c:xhci_check_args() {
	if (check_virt_dev) {
		if (!udev->slot_id || !xhci->devs[udev->slot_id]) {
			...
			return -EINVAL;
		}

		virt_dev =3D xhci->devs[udev->slot_id];
		if (virt_dev->udev !=3D udev) {
			...
			return -EINVAL;
		}
	}
}

However, xhci_alloc_dev() -> xhci_alloc_virt_device() allocates
xhci->devs[slot_id] and sets udev->slot_id while leaving dev->rhub_port as
NULL until xhci_setup_device() -> xhci_setup_addressable_virt_dev() runs:

drivers/usb/host/xhci-mem.c:xhci_setup_addressable_virt_dev() {
	/* Find the root hub port this device is under */
	dev->rhub_port =3D xhci_find_rhub_port(xhci, udev);
	if (!dev->rhub_port)
		return -EINVAL;
}

For an already-enumerated device (where udev->state >=3D USB_STATE_DEFAULT),
xhci_discover_or_reset_device() and xhci_setup_device() (on
COMP_USB_TRANSACTION_ERROR) can call xhci_alloc_dev() before
xhci_setup_addressable_virt_dev() is reached:

drivers/usb/host/xhci.c:xhci_discover_or_reset_device() {
	virt_dev =3D xhci->devs[slot_id];
	if (!virt_dev) {
		...
		ret =3D xhci_alloc_dev(hcd, udev);
		if (ret =3D=3D 1)
			return 0;
		else
			return -EINVAL;
	}
}

For example, during system resume after xHCI power loss (where
xhci_mem_cleanup() freed all virt_devices and zeroed udev->slot_id),
resuming an external hub calls
usb_reset_and_verify_device() -> hub_hc_release_resources(), which
recursively invokes xhci_discover_or_reset_device() -> xhci_alloc_dev() on
all child devices behind the hub before those children are reset or
addressed:

drivers/usb/core/hub.c:hub_hc_release_resources() {
	/* Release up resources for all children before this device */
	for (i =3D 0; i < udev->maxchild; i++)
		if (hub->ports[i]->child)
			hub_hc_release_resources(hub->ports[i]->child);

	if (hcd->driver->reset_device)
		hcd->driver->reset_device(hcd, udev);
}

If an URB is submitted to a child device before its
xhci_setup_addressable_virt_dev() runs (for instance via
usb_offload_check() in usb_resume_both(), via finish_port_resume() ->
usb_get_std_status() if hub_activate() hit an earlier port status error, or
from a concurrent driver workqueue/usbfs thread during slot reallocation),
previously prepare_ring() rejected the URB with -ENOENT because the endpoint
context was still in EP_STATE_DISABLED. Now xhci_urb_enqueue() dereferences
xhci->devs[slot_id]->rhub_port before prepare_ring() is reached.

>  		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
>  		ret =3D -ENODEV;
>  		goto free_priv;
> @@ -4038,7 +4038,6 @@ static int xhci_discover_or_reset_device(struct usb=
_hcd *hcd,
>  				xhci_get_slot_state(xhci, virt_dev->out_ctx));
>  		xhci_dbg(xhci, "Not freeing device rings.\n");
>  		/* Don't treat this as an error.  May change my mind later. */
> -		virt_dev->flags =3D 0;
>  		ret =3D 0;
>  		goto command_cleanup;
>  	case COMP_SUCCESS:
> @@ -4090,7 +4089,6 @@ static int xhci_discover_or_reset_device(struct usb=
_hcd *hcd,
>  	}
>  	/* If necessary, update the number of active TTs on this root port */
>  	xhci_update_tt_active_eps(xhci, virt_dev, old_active_eps);
> -	virt_dev->flags =3D 0;
>  	ret =3D 0;
> =20
>  command_cleanup:
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index caa3fbee29f2c..87d43bc95bf33 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h

[ ... ]

> @@ -1469,6 +1461,7 @@ struct xhci_port {
>  	int			hcd_portnum;
>  	struct xhci_hub		*rhub;
>  	struct xhci_port_cap	*port_cap;
> +	unsigned int		link_inactive:1;
>  	unsigned int		lpm_incapable:1;
>  	unsigned long		resume_timestamp;
>  	bool			rexit_active;

[Severity: Medium]
Can placing the link_inactive bitfield next to lpm_incapable cause a data
race on the shared bitfield word?

In handle_port_status(), port->link_inactive is updated in interrupt context
under xhci->lock:

drivers/usb/host/xhci-ring.c:handle_port_status() {
	if (!(portsc & PORT_RESET))
		port->link_inactive =3D (pls =3D=3D XDEV_INACTIVE);
}

Meanwhile, during USB3 shared_hcd registration in usb_add_hcd() and system
resume after power loss in xhci_resume(), the controller and its interrupts
are started before register_root_hub() or hub_activate() calls
xhci_pci_update_hub_device() -> xhci_find_lpm_incapable_ports(), which
writes to lpm_incapable in process context without holding xhci->lock:

drivers/usb/host/xhci-pci.c:xhci_find_lpm_incapable_ports() {
		if (ret >=3D 0) {
			rhub->ports[i]->lpm_incapable =3D ret;
			continue;
		}
}

If a Port Status Change Event interrupt fires concurrently while
xhci_find_lpm_incapable_ports() is running, could the non-atomic
read-modify-write on the shared unsigned int clobber either link_inactive
or lpm_incapable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-362-sashal@kernel.org?part=3D1
