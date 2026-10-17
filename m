Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F69D480DCF
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792236056; cv=none; b=FxaUfwgD36ips28OH9hRvIxUsSEdoh9qaiiMNuyGIIeRPGQzendAPt5WCDm7MFAPYo+rtE4BTV61s7q3qSiAjIngXfQoJ8ltDUSXyZx9ahQoBeGT4NQa1sSnS0h4i9pUVR63BQb9z30hdeLK1+2ymcPxEr9ilJWijP6Q41lp7VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792236056; c=relaxed/simple;
	bh=zQUcllT5Dc4YSh73hd2aQR7N69i+uZ5txRmOC9Nxc1U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bav062l5rw+O+DRtS0ibelcnmp8hJ3QAIII9EUISAE4KPvnvRgQjvKXOI3p7ArwaZ92rUKc9VEZqyTEYaocf4WDGfXaOzf3/HjF9zcDxVd6ayfEySd9QK/DBXRJcfugbx4L97NQrDKLuTM3r/x7G2gCH2JQV4QcaUEkEcDzAomI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLwoLcKw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLwoLcKw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7161F000C5;
	Sat, 17 Oct 2026 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792236055;
	bh=HpQctfAKngWIvSTwzTbp8gJvXG5npcJFa5dKiWHn83w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gLwoLcKwqC9ZwlCtQHcAArf4EnE+B/YW88FUK3C6vRhyBRzmcGjpgiMgEAeIisvB2
	 4vtpjVo3MUh2rrGBpLV7EiuP6TRHMSqhDXLrVxbxo1m6W8EDfawgZw1b8iW4XMzyUd
	 nTAygoZYBVV0JiPJaKUVJ6RvmPDQpC/+V2aDkMr2mufD7dapB4ImZND842dpXRPh/R
	 YkAXBOzq6erfqiFgFnlzJXVMPydALREmX4pQ6JBWwf5th3m0aVv1uDQcFMY+f563ZH
	 VvK+FDtlTuA9IW5CBl0lw67m2dZ33xTJ6OUqbqNeMSCpz9LQsOHb4SBYCqVRfGVtdo
	 ha7L9eBchyi3Q==
Message-ID: <sashiko-outbox-175494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci: fix EP0 context leak on virt device
 allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anfernee Cao" <anferneemelokc5@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261017111114.1135-1-anferneemelokc5@gmail.com>
References: <20261017111114.1135-1-anferneemelokc5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 11:20:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: xhci: wrong slot ID passed on error in xhci_alloc_dev()
--

commit 19636b8ccf2f4295bbc8eb2a4bffefe6e79d41d3
Author: Anfernee Cao <anferneemelokc5@gmail.com>

usb: xhci: fix EP0 context leak on virt device allocation failure

This commit decrements xhci->num_active_eps when xhci_alloc_virt_device()
fails in xhci_alloc_dev() and XHCI_EP_LIMIT_QUIRK is set, since no virt
device is installed for the Disable Slot completion handler to clean up.

> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 30ac1bc4559b7..ea6f5c413d152 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4278,6 +4278,15 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb=
_device *udev)
>  	 */
>  	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
>  		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n"=
);
> +		/*
> +		 * The virt device was not installed, so the Disable Slot
> +		 * completion handler cannot drop the EP0 context reservation.
> +		 */
> +		if (xhci->quirks & XHCI_EP_LIMIT_QUIRK) {
> +			spin_lock_irqsave(&xhci->lock, flags);
> +			xhci->num_active_eps--;
> +			spin_unlock_irqrestore(&xhci->lock, flags);
> +		}
>  		goto disable_slot;
>  	}
>  	vdev =3D xhci->devs[slot_id];

[Severity: High]
Does jumping to disable_slot here actually disable the newly enabled
slot_id?

In drivers/usb/host/xhci.c:xhci_alloc_dev(), the newly enabled hardware
slot is stored in the local variable slot_id, while udev->slot_id is only
updated after xhci_alloc_virt_device() succeeds:

	slot_id =3D command->slot_id;
	...
	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
		...
		goto disable_slot;
	}
	vdev =3D xhci->devs[slot_id];
	slot_ctx =3D xhci_get_slot_ctx(xhci, vdev->out_ctx);
	trace_xhci_alloc_dev(slot_ctx);

	udev->slot_id =3D slot_id;
	...
disable_slot:
	xhci_disable_and_free_slot(xhci, udev->slot_id);

When either xhci_reserve_host_control_ep_resources() or
xhci_alloc_virt_device() fails and jumps to disable_slot, udev->slot_id has
not been set to slot_id yet.

During normal enumeration, udev->slot_id is 0, so
xhci_disable_and_free_slot(xhci, udev->slot_id) queues TRB_DISABLE_SLOT for
slot 0 and leaks the newly enabled hardware slot in slot_id.

Even worse, if xhci_alloc_dev() is called from
xhci_discover_or_reset_device() when virt_dev->udev !=3D udev:

	if (virt_dev->udev !=3D udev) {
		xhci_dbg(xhci, "The device to be reset with slot ID %u does "
				"not match the udev. Re-allocate the device\n",
				slot_id);
		ret =3D xhci_alloc_dev(hcd, udev);

udev->slot_id still holds an active slot ID belonging to another usb_device.
Jumping to disable_slot will disable and free that other device's active
slot and xhci_virt_device (and xhci_handle_cmd_disable_slot() will also
call xhci_free_device_endpoint_resources() on that other device's non-NULL
virt_dev, decrementing xhci->num_active_eps for its endpoints in addition
to the decrement added here), while still leaking the newly enabled
slot_id.

Should the disable_slot label pass slot_id instead of udev->slot_id to
xhci_disable_and_free_slot()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017111114.1135=
-1-anferneemelokc5@gmail.com?part=3D1
