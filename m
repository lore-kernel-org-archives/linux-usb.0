Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858516;
	b=v2qxTcdsMBY1Arxa0tUJArF4in08UJFzbnWI55IapLUbeF7WZEHljZU6I5ejHFlzabSI
	 wPPHwytmPv/V1SKnq2VkShhEcuaPIeK4TCtfHxGW85psykLMlEo2LDRLAMilpDVPqPtKn
	 ok+m71eFIS9fnhTK4avfe/WBqfGLLszCFOmBt+gTV9Cch26gY0G83jgYjxkZRLSzDZDNi
	 FRY465uQYPnrlMgtBu80q7tEUcbKHgskaKzoWsBpSInaAoHMhPrYCYpm5XdiVwjw67Me3
	 /wFE8A3uGUu+jBsvHkKEy/yR4fqS9w4ZuiniyKUqUpBa3GqyJGDlGUe+ruhLQNMUWMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858516;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lUwQymnHl5rH3P+EezN1qZ/NT2lUHH8q7BrUijOWs0w=;
	b=N4dlEE5/refQxp2jKN9mOcsNMGBYbxwSerpUkwBjX4X7bUUtqEvfpVa78ULGRvN3rIKf
	 rdt7Sqis8Pb2k1ZNc+diicjDelW5qxgJeYRnwt5nY+BN/gGgmYgnm0pyZkx8reGF6E4fZ
	 XBPmvtyKLpn8P0tsFmhEfzt0rMeD1nJG8VwrtijcstEJB5z2+15lBmNJZOuiiQ8GNaLuN
	 CVrJpGudqhtYeGQ/xyOWqj5kaWE+AEuy4rjryDugz1PWS1Efs1OsnG5orF8AZOtv51PQ2
	 gz7TcEvV7maXx+q5cOmUdb5Q2kZXmH+f3QuIR7+g37+bkA4K0JR1VuLWq4T1VymwUxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ro3468C+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2632E606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 06:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ro3468C+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850271F000C1;
	Thu,  5 Nov 2026 06:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793858515;
	bh=lUwQymnHl5rH3P+EezN1qZ/NT2lUHH8q7BrUijOWs0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ro3468C+KaGvalA9pp1nrEXTiSjckKqx92iNnQELzl/0Mz7oCOqdP93OAxjoDIV+d
	 8rSqosn3aY0KqMBnOF9ImXzK47wOGnJP4xx6tNVEPWyVUF7zwsJxGxkqwUucb8xNom
	 3jHW1xQBzDmblhGV8GmSCLXioZ5iza2fikKHN2Z0+kd0XoHF4PDRqQek875QCbeoCl
	 CKE2YI1Jipzhw/RMjtBvKX/Ty+5jLqkSkitFkUYwvy4IDl5E+OoQ/NJC95D9QC5Ex/
	 xNm2EMLt38B09lTUzsQCIRQUPRzny2ZFCeBmC7Sc+70cuu1G1MJ4FexKgwS+xAJQBQ
	 RTMRIpMaz1H4Q==
Message-ID: <sashiko-outbox-198606@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: usbfs: Require claiming a hub interface for hub
 class requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105054333.7811-1-25031212351@stu.xidian.edu.cn>
References: <82a746b7-4e87-4d46-88c3-bb881f11b8de@rowland.harvard.edu>
 <20261105054333.7811-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 06:01:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: usbfs: TOCTOU race and interface-class bypass in check_ctrlre=
cip()
- [Medium] usb: usbfs: check_ctrlrecip() breaks per-port power control and =
claim_port
--

commit 51d2fbbb1c57db88bf72934105ae279adb788ebd
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

usb: usbfs: Require claiming a hub interface for hub class requests

This commit updates check_ctrlrecip() in drivers/usb/core/devio.c to require
interface 0 to be claimed for all non-IN control requests sent to a USB hub
device. This is intended to prevent userspace from sending hub class and po=
rt
requests while the kernel hub driver owns or is unbinding from the hub.

> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb94254809..0c6beccb9e766 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -891,6 +891,19 @@ static int check_ctrlrecip(struct usb_dev_state *ps,=
 unsigned int requesttype,
>  	if (USB_TYPE_VENDOR =3D=3D (USB_TYPE_MASK & requesttype))
>  		return 0;
> =20
> +	/*
> +	 * A hub driver owns the ports and the devices behind them.  Letting
> +	 * userspace change port state behind its back, for example with a
> +	 * SET_FEATURE(PORT_SUSPEND) request while the hub interface is being
> +	 * released, is not safe: the request is passed down to the HCD, which
> +	 * may walk per-device state that is being torn down at the same time.
> +	 * Port requests use USB_RECIP_OTHER and hub-wide ones USB_RECIP_DEVICE,
> +	 * and a hub has a single interface, so check interface 0 for both.
> +	 */
> +	if (ps->dev->descriptor.bDeviceClass =3D=3D USB_CLASS_HUB &&
> +	    (requesttype & USB_DIR_IN) =3D=3D 0)
> +		return checkintf(ps, 0);

[Severity: High]
Can the xhci_virt_device use-after-free in xhci_stop_device() still happen
despite this check in check_ctrlrecip()?

First, in usbdev_do_ioctl() -> proc_control() -> do_proc_control(),
check_ctrlrecip() checks checkintf(ps, 0) while holding usb_lock_device(dev=
),
but do_proc_control() then drops the device lock before submitting the URB:

drivers/usb/core/devio.c:do_proc_control() {
    ...
    usb_unlock_device(dev);
    i =3D usbfs_start_wait_urb(urb, tmo, &actlen);
    ...
}

Synchronous control URBs in do_proc_control() are not on ps->async_pending,
and asynchronous control URBs on endpoint 0 in proc_do_submiturb() record
ifnum as -1:

drivers/usb/core/devio.c:proc_do_submiturb() {
    ...
    as->ifnum =3D ifnum;
    ...
}

Because of that, proc_releaseinterface() -> releaseintf(ps, 0) ->
destroy_async_on_interface(ps, 0) will not cancel or wait for an in-flight
SetPortFeature(USB_PORT_FEAT_SUSPEND) control URB. Once do_proc_control()
unlocks the device (or while xhci_hub_control() in
drivers/usb/host/xhci-hub.c drops xhci->lock across msleep(10) before
calling xhci_stop_device()), another thread can release interface 0 via
USBDEVFS_RELEASEINTERFACE, rebind hub_driver via USBDEVFS_CONNECT to
enumerate a child device, and then unbind it via USBDEVFS_DISCONNECT_CLAIM
or USBDEVFS_DISCONNECT:

drivers/usb/host/xhci-hub.c:xhci_hub_control() {
    ...
    spin_unlock_irqrestore(&xhci->lock, flags);
    xhci_stop_device(xhci, port->slot_id, 1);
    spin_lock_irqsave(&xhci->lock, flags);
    ...
}

This allows xhci_free_dev() to free xhci->devs[slot_id] concurrently with
xhci_stop_device().

Second, hub_id_table in drivers/usb/core/hub.c matches hubs by either
device class or interface class:

drivers/usb/core/hub.c:hub_id_table[] =3D {
    { .match_flags =3D USB_DEVICE_ID_MATCH_DEV_CLASS,
      .bDeviceClass =3D USB_CLASS_HUB},
    { .match_flags =3D USB_DEVICE_ID_MATCH_INT_CLASS,
      .bInterfaceClass =3D USB_CLASS_HUB},
    ...
};

If a hub is part of a composite device where bDeviceClass is
USB_CLASS_PER_INTERFACE or USB_CLASS_MISC and the hub is matched via
bInterfaceClass =3D=3D USB_CLASS_HUB, wouldn't checking only
ps->dev->descriptor.bDeviceClass =3D=3D USB_CLASS_HUB in check_ctrlrecip() =
miss
it altogether?

[Severity: Medium]
Does requiring checkintf(ps, 0) for all non-IN hub requests break per-port
power control and the USBDEVFS_CLAIM_PORT workflow?

When hub_driver is bound to interface 0, checkintf(ps, 0) -> claimintf(ps, =
0)
fails with -EBUSY unless userspace first unbinds hub_driver, which calls
hub_disconnect() and disconnects every child device across all ports on the
hub while setting hdev->maxchild =3D 0.

In drivers/usb/core/hub.c, usb_hub_claim_port() (used by
USBDEVFS_CLAIM_PORT) and hub_port_connect() are designed to let userspace
claim an individual port and power it off via USBDEVFS while hub_driver
remains bound to manage the rest of the hub:

drivers/usb/core/hub.c:find_port_owner() {
    ...
    if (port1 =3D=3D 0 || port1 > hdev->maxchild)
        return -EINVAL;

    /* Devices not managed by the hub driver
     * will always have maxchild equal to 0.
     */
    *ppowner =3D &(hub->ports[port1 - 1]->port_owner);
    ...
}

drivers/usb/core/hub.c:hub_port_connect() {
    ...
    if (hub_is_port_power_switchable(hub)
            && !usb_port_is_power_on(hub, portstatus)
            && !port_dev->port_owner)
        set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
    ...
}

Since USBDEVFS_CLAIM_PORT requires hub_driver to be bound (hdev->maxchild >=
 0)
while check_ctrlrecip() now requires interface 0 to be claimed by usbfs
(which requires hub_driver to be unbound) before sending
ClearPortFeature(USB_PORT_FEAT_POWER) or SetPortFeature(USB_PORT_FEAT_POWER=
),
doesn't this make per-port power control via USBDEVFS_CLAIM_PORT and tools
like uhubctl unusable without disconnecting the entire hub?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105054333.7811=
-1-25031212351@stu.xidian.edu.cn?part=3D1
