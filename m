Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C3296BCF
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791559831; cv=none; b=Anw8fi5xlAFmRFMUVP+pZSxjsITQHV/AXIu/nYmLKyxIIeq3KkfFdirNdBPQVAsfvvbnLEmw7jxWbF5mhQX0mWYYGJnC+yxAsuiDL/PpLmsAfDP1j928V4SmOnwbkyDbw838obyY08N0yP2AimBDzvRb5M5VpKBj+bDDw5O4ZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791559831; c=relaxed/simple;
	bh=V3fX2EVGyzO6DlhKgNlLNKaijzGwHeLF5VVLtHdAw+M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gePhznjijcW2zUui9EysKuN3NJXulOgXsZqiDtKnYVAxYedRK0We2oYRFNTUPW59ygoYeYZCnr27qsAMR1AYP6JGvzys9AlS+XmfmovQkui5YzZ2urJKM9b7uv1VtL1Z2dlQpeVutNXus2qZYU6z+svzvlFjQKZyGEVkSZaQtvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=leCFq6ib; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="leCFq6ib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4801F000FF;
	Fri,  9 Oct 2026 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791559829;
	bh=cjMwO/7JNTT0xeSFmAj9x+1AZQAC2mUWGTWa/TkEpbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=leCFq6ibc5mkvkSxJk4RPW5BnFRG876cqGGDMWlTgNv/3N/giRB8yDsf30z9rnraw
	 lnyBq8Wvv3hkPkv+zxa8GGiA1i3M+TQMWXK/y5pbiKB7zwAxEzOvcjUnwuzxm5J8f3
	 ulkATrMqWRbEqHvkY42/xQZdKuWexKF5+rembiU1zwdblOJE2wsA6A/Y9sfUYBGMsF
	 +EMT28jiBnmzBUTKIhoV1tmY7TEJd8n+lbez7J+pgZ38wX+h5/wpFI9MmzLjjl8fW2
	 9GgaoKFbNjYFHGeg8L++cC/rRh6s+eR3hEcc+liMJGKlSrZNZLiWw8oIy5LSMYplQA
	 M9LReZWyNniZg==
Message-ID: <sashiko-outbox-165777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/11] xhci: Prevent invalid vdev dereference during
 sideband unregister
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009151624.618967-12-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
 <20261009151624.618967-12-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 15:30:29 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] xhci: TOCTOU race and Use-After-Free in sideband registration
--

commit 7085c7c59881c747b14aeec07262203621aaa8b5
Author: Mathias Nyman <mathias.nyman@linux.intel.com>
xhci: Prevent invalid vdev dereference during sideband unregister

This commit prevents the reallocation of the xhci virtual device in the set=
up
device error path if a sideband is registered. It aims to fix a kernel oops
caused by dereferencing a stale vdev pointer during USB audio disconnect.

Closes: https://lore.kernel.org/linux-usb/TYUPR06MB6217000B59003EDF233D7246=
D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com/

> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4435,10 +4435,13 @@ static int xhci_setup_device(struct usb_hcd *hcd,=
 struct usb_device *udev,
>  		dev_warn(&udev->dev, "Device not responding to setup %s.\n", act);
> =20
>  		mutex_unlock(&xhci->mutex);
> -		ret =3D xhci_disable_and_free_slot(xhci, udev->slot_id);
> -		if (!ret) {
> -			if (xhci_alloc_dev(hcd, udev) =3D=3D 1)
> -				xhci_setup_addressable_virt_dev(xhci, udev);
> +
> +		if (!virt_dev->sideband) {
> +			ret =3D xhci_disable_and_free_slot(xhci, udev->slot_id);

[Severity: High]
Can this lockless check introduce a Time-Of-Check to Time-Of-Use (TOCTOU)
race condition leading to a use-after-free?

If an asynchronous caller like snd_usb_rediscover_devices() calls
xhci_sideband_register() concurrently, it acquires xhci->lock, reads
xhci->devs[slot_id], and attaches the sideband.

If this lockless check evaluates to true just before the sideband is
attached, we proceed to xhci_disable_and_free_slot() without the lock:

xhci_setup_device()
    if (!virt_dev->sideband) {
        xhci_disable_and_free_slot()
            xhci_free_virt_device()
                xhci->devs[slot_id] =3D NULL;
                kfree(dev);

Because xhci_free_virt_device() does not hold xhci->lock, it can free the
device immediately after xhci_sideband_register() attaches the sideband,
leaving the sideband with a dangling pointer to a freed vdev.

> +			if (!ret) {
> +				if (xhci_alloc_dev(hcd, udev) =3D=3D 1)
> +					xhci_setup_addressable_virt_dev(xhci, udev);
> +			}
>  		}
>  		kfree(command->completion);
>  		kfree(command);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009151624.6189=
67-1-mathias.nyman@linux.intel.com?part=3D11
