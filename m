Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862881;
	b=duaShmqm7utpSctY23tC73qEOoqHWzFZSzrxEITCtgGJ2HjGkvjXAaz2TlcPpazNtP0s
	 pemYS3oYFQHBwzlPPtyWZHMEjOCB06bh/BwKv+1ZVj2ch8fRQprnIHEaoHoASDHHIRCrU
	 pSK+v9XREYBcP0KD/2CBI428jjko3A8vxJJJLuQKy5QAeLrDj19Pj2sKcOOpJULDG8Nj2
	 XfTUpjOvUaRzteduO46XeDTyagf8tb09Zqp8lOQuMrTpaj93uF4FAejsxwpy35smtlNUC
	 OXrZtxtTxT3jLTyVMQMqIOGFoYN8IDNUIWS+aIFkEVToVjHD04zuOhb/7D93GYGqvkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862881;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q8u/Nr/gio6arwfjgojdzXFmE5JtpPv+DVS96BIEvWI=;
	b=aHykyQcvivh1+WnP2/n9s0uT8s/zeTBb7/6ipNvQvgSFwy4W9bBMVmBIzp3FwtaCwtXk
	 U2PLeOMxDmVd/RYSjytHMg5HvUkrErO/WSTMF4VfBLWzQh/5mygMThINXJiSM36AgSi8o
	 dk9j6OU9nfsF5YodM88jIE5qY83Qf9+VOXwBYlZBndHz4Ty8jCsDVkBg/nAjBGtrvX8k9
	 ncXDqerjw3Cikr4W7BApv5o/ILHJjQgpxXDNhGJapxGzzTWIw+z4nuXZKzMnzzaiucrFs
	 96EJF5C4q9hWGQbALCLIaQojCAwJeg/43Tz7b8a2PoXfw+5BokTzujKJ6f27qCUZKHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GoM/WR31";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1C1606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 07:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GoM/WR31
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35E81F000C1;
	Thu,  5 Nov 2026 07:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793862880;
	bh=q8u/Nr/gio6arwfjgojdzXFmE5JtpPv+DVS96BIEvWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GoM/WR31lTyPMbl3nCIxJkpKpAeYbjyu+HrnoHZ6qS4KlBwJGP5K36brdVcrUu3f6
	 ih1SW5tKYWPEWuYeSPCFyCQL9vxdfcvry1xkiCX4hhMXXwtkG6HvYx5DA+9qSZ5eJs
	 QLg4PC+XHNxkOmKRN1Sm/P7p4yloDq/6BEBZPxEjviR8mNjZ5EYucOMsRvlJPLSxeP
	 aOiKYe/d0+j6HohP/XcXJLB0YeE6jxvLTiOOvXaXEDdvQnohHPIO6APjnWFQHokynv
	 62kmpNMBijfRuwJESnYmKA80rZaqT0gJ2xW56e2eDKnTcBiavMSyQNBiQiHoN5yiKO
	 BgWCvFE6tQMfA==
Message-ID: <sashiko-outbox-198647@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: usbfs: Require claiming a hub interface for hub
 class requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
References: <20261105054333.7811-25031212351@stu.xidian.edu.cn>
 <20261105065627.5626-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 07:14:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] usb: usbfs: check_ctrlrecip() port ownership check allows hub unbi=
nd race
- [High] usb: usbfs: check_ctrlrecip() hub check bypasses interface and ep =
checks
- [High] usb: usbfs: unserialized hub control URB and port_owner bypass in =
check_ctrlrecip()
- [Medium] usb: usbfs: hub_interface_number() returns array index instead o=
f ifnum
--

commit 1f77616af0c7f5d12550f1a327a5a04f16360e0d
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

usb: usbfs: Require claiming a hub interface for hub class requests

This commit updates check_ctrlrecip() in usbfs to require the hub interface
to be claimed before sending non-GET control requests to a hub, while
allowing USB_RECIP_OTHER requests to ports claimed by the caller through
USBDEVFS_CLAIM_PORT.

> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb94254809..81085bfed4c10 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -878,10 +878,36 @@ static int findintfep(struct usb_device *dev, unsig=
ned int ep)
>  	return -ENOENT;
>  }
> =20
> +/*
> + * Return the interface number through which the hub driver drives this
> + * device, or -1 if it is not a hub.  Hubs match the driver by device cl=
ass
> + * or by interface class, and a hub embedded in a composite device uses =
the
> + * latter.
> + */
> +static int hub_interface_number(struct usb_device *dev)
> +{
> +	struct usb_host_config *config =3D dev->actconfig;
> +	int i;
> +
> +	if (dev->descriptor.bDeviceClass =3D=3D USB_CLASS_HUB)
> +		return 0;
> +	if (!config)
> +		return -1;
> +	for (i =3D 0; i < config->desc.bNumInterfaces; i++) {
> +		struct usb_interface *intf =3D config->interface[i];
> +
> +		if (intf && intf->cur_altsetting &&
> +		    intf->cur_altsetting->desc.bInterfaceClass =3D=3D USB_CLASS_HUB)
> +			return i;
> +	}
> +	return -1;
> +}

[Severity: Medium]
Should hub_interface_number() return
intf->cur_altsetting->desc.bInterfaceNumber instead of the loop index i?

In checkintf() and claimintf(), the ifnum parameter is a USB interface
descriptor's bInterfaceNumber: ps->ifclaimed is indexed by bInterfaceNumber,
and claimintf() resolves the interface via usb_ifnum_to_if(dev, ifnum):

drivers/usb/core/usb.c:usb_ifnum_to_if() {
	...
	for (i =3D 0; i < config->desc.bNumInterfaces; i++)
		if (config->interface[i]->altsetting[0]
				.desc.bInterfaceNumber =3D=3D ifnum)
			return config->interface[i];
	...
}

Because config->interface[] is stored in descriptor parse order rather than
indexed by bInterfaceNumber (which is why findintfep() right above returns
alts->desc.bInterfaceNumber), returning i or a hardcoded 0 when
bInterfaceNumber differs from the array index causes checkintf(ps, hub_ifnu=
m)
to test the wrong bit in ps->ifclaimed and call claimintf(ps, i) on an
unrelated interface or fail with -ENOENT.

Also, if dev->descriptor.bDeviceClass =3D=3D USB_CLASS_HUB while dev->actco=
nfig
is NULL (for example in USB_STATE_ADDRESS), returning 0 before checking
!config causes checkintf() to reject the transfer with -EHOSTUNREACH.

> +
>  static int check_ctrlrecip(struct usb_dev_state *ps, unsigned int reques=
ttype,
>  			   unsigned int request, unsigned int index)
>  {
>  	int ret =3D 0;
> +	int hub_ifnum;
>  	struct usb_host_interface *alt_setting;
> =20
>  	if (ps->dev->state !=3D USB_STATE_UNAUTHENTICATED
> @@ -891,6 +917,23 @@ static int check_ctrlrecip(struct usb_dev_state *ps,=
 unsigned int requesttype,
>  	if (USB_TYPE_VENDOR =3D=3D (USB_TYPE_MASK & requesttype))
>  		return 0;
> =20
> +	/*
> +	 * A hub driver owns the ports and the devices behind them.  Letting
> +	 * userspace change hub or port state behind its back, for example
> +	 * with a SET_FEATURE(PORT_SUSPEND) request while the hub interface is
> +	 * being released, is not safe: the request is passed down to the HCD,
> +	 * which may walk per-device state that is being torn down at the same
> +	 * time.  Port requests use USB_RECIP_OTHER, hub-wide ones use
> +	 * USB_RECIP_DEVICE.  A port claimed with USBDEVFS_CLAIM_PORT belongs to
> +	 * the caller though, and the hub driver leaves devices on such a port
> +	 * alone, so requests for it are allowed.
> +	 */
> +	hub_ifnum =3D hub_interface_number(ps->dev);
> +	if (hub_ifnum >=3D 0 && (requesttype & USB_DIR_IN) =3D=3D 0 &&
> +	    !((requesttype & USB_RECIP_MASK) =3D=3D USB_RECIP_OTHER &&
> +	      usb_hub_port_is_owned(ps->dev, index & 0xff, ps)))
> +		return checkintf(ps, hub_ifnum);

[Severity: High]
Does returning checkintf(ps, hub_ifnum) early here bypass the recipient
checks for USB_RECIP_INTERFACE and USB_RECIP_ENDPOINT below?

When hub_ifnum >=3D 0 and (requesttype & USB_DIR_IN) =3D=3D 0, check_ctrlre=
cip()
immediately returns checkintf(ps, hub_ifnum) for all recipients instead of
restricting the hub check to USB_RECIP_DEVICE and USB_RECIP_OTHER (or falli=
ng
through to the switch statement):

drivers/usb/core/devio.c:check_ctrlrecip() {
	...
	index &=3D 0xff;
	switch (requesttype & USB_RECIP_MASK) {
	case USB_RECIP_ENDPOINT:
		if ((index & ~USB_DIR_IN) =3D=3D 0)
			return 0;
		ret =3D findintfep(ps->dev, index);
		...
		if (ret >=3D 0)
			ret =3D checkintf(ps, ret);
		break;

	case USB_RECIP_INTERFACE:
		ret =3D checkintf(ps, index);
		break;
	}
	return ret;
}

Note also that hub_probe() in drivers/usb/core/hub.c rejects devices with
hdev->actconfig->desc.bNumInterfaces > 1. On a multi-interface composite
device containing a USB_CLASS_HUB interface alongside other interfaces:

1. A caller that claims only the (unbound) hub interface gets 0 from
checkintf(ps, hub_ifnum) and bypasses checkintf() for all other interfaces
and endpoints on the device, allowing OUT control requests to interfaces
bound to kernel drivers or disallowed by ps->interface_allowed_mask.

2. Conversely, a caller that claimed a non-hub interface cannot send
non-vendor USB_RECIP_INTERFACE or USB_RECIP_ENDPOINT OUT requests to its own
claimed interface or endpoint without also claiming hub_ifnum.

3. Even on a single-interface hub where hub_ifnum is claimed, OUT requests
with USB_RECIP_INTERFACE or USB_RECIP_ENDPOINT specifying a non-existent
interface or invalid endpoint in wIndex return 0 instead of failing with
-ENOENT or -EINVAL in checkintf(ps, index) or findintfep(ps->dev, index).

[Severity: High]
As reported by Sashiko on v2 [1], can a SetPortFeature(PORT_SUSPEND) control
request still race with USBDEVFS_DISCONNECT_CLAIM and trigger the
use-after-free of xhci_virt_device in xhci_stop_device()?

There appear to be two ways this race can still happen:

First, through the usb_hub_port_is_owned() exemption in check_ctrlrecip().
The comment and commit message state that the hub driver does not connect
devices to a port claimed with USBDEVFS_CLAIM_PORT, but in
drivers/usb/core/hub.c, usb_hub_claim_port() only works while the hub driver
is bound and does not check or disconnect an existing port_dev->child:

drivers/usb/core/hub.c:usb_hub_claim_port() {
	int rc;
	struct usb_dev_state **powner;

	rc =3D find_port_owner(hdev, port1, &powner);
	if (rc)
		return rc;
	if (*powner)
		return -EBUSY;
	*powner =3D owner;
	return rc;
}

Furthermore, if a device is connected to a claimed port later,
hub_port_connect() still allocates udev, calls hub_port_init() ->
xhci_alloc_dev() (which allocates xhci->devs[slot_id] and sets
port->slot_id), sets port_dev->child =3D udev, and calls usb_new_device(ude=
v);
port_owner only causes usb_device_is_owned() to skip configuration selection
and interface driver probing on the child device. When the caller sends
SetPortFeature(PORT_SUSPEND) on that claimed port via do_proc_control() or
proc_do_submiturb(), check_ctrlrecip() sees usb_hub_port_is_owned() =3D=3D =
true
and skips checkintf(ps, hub_ifnum). Once do_proc_control() drops
usb_lock_device(dev) before usbfs_start_wait_urb(), a concurrent
USBDEVFS_DISCONNECT_CLAIM on the hub interface unbinds the hub driver via
hub_disconnect() -> hub_quiesce():

drivers/usb/core/hub.c:hub_quiesce() {
	...
	if (type !=3D HUB_SUSPEND) {
		/* Disconnect all the children */
		for (i =3D 0; i < hdev->maxchild; ++i) {
			if (hub->ports[i]->child)
				usb_disconnect(&hub->ports[i]->child);
		}
	}
	...
}

which disconnects hub->ports[i]->child regardless of port_owner and frees
xhci_virt_device in xhci_free_dev() while xhci_hub_control() ->
xhci_stop_device() is running.

Second, even when checkintf(ps, hub_ifnum) is reached, do_proc_control()
verifies the claim under usb_lock_device(dev) and then drops the device lock
before submitting the URB:

drivers/usb/core/devio.c:do_proc_control() {
	...
	ret =3D check_ctrlrecip(ps, ctrl.bRequestType, ctrl.bRequest,
			      ctrl.wIndex);
	...
	usb_unlock_device(dev);
	i =3D usbfs_start_wait_urb(urb, tmo, &actlen);
	...
}

Similarly, in proc_do_submiturb(), endpoint 0 control URBs leave ifnum as -1
(stored in as->ifnum), so proc_releaseinterface() ->
destroy_async_on_interface() does not cancel in-flight control URBs when the
interface is released. After the device lock is dropped (and while
xhci_hub_control() sleeps in msleep(10)), can another thread release the hub
interface via USBDEVFS_RELEASEINTERFACE, rebind hub_driver via
USBDEVFS_CONNECT so a port is enumerated, and then unbind hub_driver via
USBDEVFS_DISCONNECT_CLAIM while the control URB is still executing?

[1] https://lore.kernel.org/r/20261105054333.7811-1-25031212351@stu.xidian.=
edu.cn

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105065627.5626=
-1-25031212351@stu.xidian.edu.cn?part=3D1
