Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007622;
	b=cRzdS9jojhBV4iMzubFrNkFek+9Nf6jQ/zbgRAwHYrY5Fa7V+bZRVglwlC6nTb8EjWPT
	 rJKtEOEOaRTtq1kF+SNJzWFOqatf17lfmNGgUpJkirmx2TfXSZWf29oIzc7coHe2EQ3R5
	 +8eNCcQP/nAPwBgx1vtiaRJoBX2KCTtDvLiaCkZ5JYniakmNZ3cBG5Yzl018OSWgEIm+l
	 O6ylv6YVkvxlPsFqOc02jUIwoZ9Vq8UPQTbblTOCy8xvDTrpwx7vDCjtwNm2yORVe8nI3
	 VeCbo/6zURZk7IjL7zkjJhvwmw38y1nJy5A7ckwLbse79ktNtl5BPfA6BXCWlWB/iUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007622;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0x2m7waUTo0kKgfLx5LWPpTtcCsLhABKfKm6MDp8R64=;
	b=m6uZwQlQadh7jkSLAliR8diY1yIh9fEm3fUkR1smjZIc3uFBGphWNF4bSffi9hWIWVE9
	 zlKlb6kt5ElwGmD7mz0JFHNA+/pbwPDMociC6/ZYHgTPSYpjC2I5LjxkyTl5WbagjlpEr
	 Bq6lxkYpIrZQw+X3WpoaZVa4FaVdSquzIcHtqTVWc7WGqVlNH4Jz25d/vLh6JHt/AnXhm
	 m/kC5hK4wDcmfLmTrAY4ou9qRjMC8ELdgVTDkjitkZstegEllAFAODmrxsDludNNyH0A4
	 NFM8jlQDpAkPIyKt10U2DxbYz/VSEaEmaafWYtDckdTB6/vZ8qGNRBXmbXUukugD38g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QO42HQEL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93801606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 13:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QO42HQEL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA491F000C4;
	Wed, 18 Nov 2026 13:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007622;
	bh=0x2m7waUTo0kKgfLx5LWPpTtcCsLhABKfKm6MDp8R64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QO42HQELdf75WTo69JeLFjPK/QMtjfJ9Z/r2qxP7+MYyhYzLfq8HC6LbU+dw+RKb3
	 a/VNLtbtZD94TvkDsI14OKknltzTAQYSAu2lBlm+QBxLbeAdsd631KvJV53DDL0BHh
	 0AOLrw3P9JpOMMl2M+mvNC17dzZ8n0qGmNmsD9QZglUEQEsJzPpJB86Qal/VdOfjGi
	 L+q4ENxl4wB//oN/hSPEvHfAipJ0biIxWsqJ1KH1RryMt2AOtnKkHGf505yXlZylCF
	 wQTe5szk7oXfqSkiKjNUL8EJioImQCcrwLYTZIxfKo/gTWT56sHFv3qPqD1Jb0GVVi
	 uZbNEAckczgmA==
Message-ID: <sashiko-outbox-220988@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH 1/2] xhci: sideband: avoid use-after-free of stale
 virt device pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118125109.1429538-2-mathias.nyman@linux.intel.com>
References: <20261118125109.1429538-1-mathias.nyman@linux.intel.com>
 <20261118125109.1429538-2-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 13:13:41 +0000
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
- [High] xhci: sideband: unregister race in
  xhci_sideband_create_interrupter()
- [Low] xhci: sideband: missing Fixes trailer for sb->vdev
  use-after-free fix
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] xhci: use-after-free of sideband in
  xhci_discover_or_reset_device() [1]
--

commit 9c6f07fbe23d89be989882c6d8b9eb96113b85e0
Author: Mathias Nyman <mathias.nyman@linux.intel.com>

> xhci: sideband: avoid use-after-free of stale virt device pointer
>=20
> The sideband structure caches vdev, an xhci_virt_device pointer that
> the xhci driver may free and reallocate while the sideband is still
> registered, leaving the sideband with a dangling sb->vdev pointer.
>=20
> This can happen during resume, either when the xhci driver detects xHC
> power loss and resets the xHC, freeing all virt devices without
> informing class drivers, or during reset-resume when usb core
> re-enumerates the device and xhci frees and allocates a new virt device.
>=20
> Store the usb_device pointer (udev) instead. It stays valid across
> reset-resume and xHC reset.
> Look up the current virt device and ensure it still points to this
> sideband before using and dereferencing it in sideband API calls.
>=20
> Make sure xhci_sideband_unregister() works properly with an invalid
> vdev. Don't dereference it, or ask the xHC to stop non-existing
> endpoints, but make sure the sideband is properly freed.
> Fail other relevant sideband API calls that would access invalid
> vdev with -ENODEV.
>=20
> This solution isn't airtight. It's a huge improvement over the current
> situation, but there is still a window between verifying vdev and
> actually dereferencing it in many sideband API calls.
>=20
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

[Severity: Low]
This fixes a use-after-free of sb->vdev.  Should this include:

  Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secon=
dary interrupter entity")

> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sid=
eband.c
> index a5deeee4d5dce..ad4849903df3b 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
[ ... ]
> @@ -329,9 +348,6 @@ xhci_sideband_create_interrupter(struct xhci_sideband=
 *sb, int num_seg,
> =20
>  	guard(mutex)(&sb->mutex);
> =20
> -	if (!sb->vdev)
> -		return -ENODEV;
> -
>  	if (sb->ir)
>  		return -EBUSY;
> =20

[Severity: High]
Does removing the !sb->vdev check here without replacing it with
!sideband_to_vdev(sb) reintroduce the race fixed in 8c13a7323b84 ("xhci:
sideband: Fix race condition in sideband unregister")?

CPU0                              CPU1
xhci_sideband_unregister()
  mutex_lock(&sb->mutex)
                                  xhci_sideband_create_interrupter()
                                    if (!sb || !sb->xhci)
                                    mutex_lock(&sb->mutex)
  __xhci_sideband_remove_interrupter()
  sb->udev =3D NULL
  mutex_unlock(&sb->mutex)
  sb->xhci =3D NULL
  kfree(sb)
                                    xhci_create_secondary_interrupter(
                                      xhci_to_hcd(sb->xhci), ...)
                                      <-- NULL pointer dereference / UAF

Without checking sideband_to_vdev(sb) after acquiring sb->mutex, CPU1
proceeds after xhci_sideband_unregister() releases the mutex, dereferencing
a NULL sb->xhci or freed sb.  Even without a concurrent unregister,
xhci_sideband_create_interrupter() will allocate a secondary interrupter
when vdev has been invalidated instead of returning -ENODEV.

[ ... ]

> @@ -471,22 +487,21 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
>  	xhci =3D sb->xhci;
> =20
>  	scoped_guard(mutex, &sb->mutex) {
> -		vdev =3D sb->vdev;
> -		if (!vdev)
> -			return;
> +		vdev =3D sideband_to_vdev(sb);
> =20
>  		for (i =3D 0; i < EP_CTX_PER_DEV; i++)
> -			if (sb->eps[i])
> +			if (vdev && sb->eps[i])
>  				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);

[Severity: Critical]
This problem wasn't introduced by this patch, but nothing serializes
[1] xhci_sideband_unregister() against xhci_discover_or_reset_device()
reading ep->sideband and calling xhci_sideband_notify_ep_ring_free().

CPU0 (device reset)               CPU1 (sideband unregister)
xhci_discover_or_reset_device()
  if (ep->sideband)
    xhci_sideband_notify_ep_ring_free(
      ep->sideband, i)
                                  xhci_sideband_unregister()
                                    __xhci_sideband_remove_endpoint()
                                      ep->sideband =3D NULL
                                    kfree(sb)
      sb->notify_client(sb->intf, &evt)
        <-- use-after-free

xhci_discover_or_reset_device() holds only the USB device lock when it
reads ep->sideband and invokes xhci_sideband_notify_ep_ring_free() without
holding xhci->lock or sb->mutex:

drivers/usb/host/xhci.c:xhci_discover_or_reset_device() {
    ...
		if (ep->ring) {
			if (ep->sideband)
				xhci_sideband_notify_ep_ring_free(ep->sideband, i);
			xhci_debugfs_remove_endpoint(xhci, virt_dev, i);
			xhci_free_endpoint_ring(xhci, virt_dev, i);
		}
    ...
}

Meanwhile xhci_sideband_unregister() runs without the USB device lock,
clears ep->sideband under sb->mutex, and frees sb.  If CPU0 loads
ep->sideband before CPU1 clears it, CPU0 dereferences the freed sb.

[1] https://sashiko.dev/#/bug/linux-6cdffda2-7589-4947-aad7-6f07714b5916

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118125109.1429=
538-1-mathias.nyman@linux.intel.com?part=3D1
