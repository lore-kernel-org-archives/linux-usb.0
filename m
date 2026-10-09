Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32B31E85E
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527939; cv=none; b=jSlWOn6VGloO3vHOjs9BracJlC9VLZR3NGpUtVRX9y224+jw1YrcO6ajGt5lQPHB7YY92/SbzXVTa9hI9x+oSptukW3dd1PGrWYnNbxFDnIxtA0QnkMecEbwS0+guP0mgBwYforKfFDn2+WTIVOGxU11r2I22jh06k4bjRBuFbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527939; c=relaxed/simple;
	bh=vMGPGjHW+PYAShzvSUFNBi1doGx0Y8yNIjoUIdZiygE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kZkSeBtuCdUObnogyVgizD6qC2pYPT7Comyrf2B6N6Cl8tcVZWayqdQF3Ayrw9WuDJ+HfywNvsLn9HVHJE27F0SoNk9+DvPsAdqd6T1cTab9UH5PgBcesCpxSCbLzDS6S24PvtMn7tiNc66b+vDt2BjH7Xuv3BnYfMZdnsSdb4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxfo8nZO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxfo8nZO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38871F000FF;
	Fri,  9 Oct 2026 06:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791527938;
	bh=EF2bPqMv7DlOtEo0WMG7GjYGuQ4gFT9AWV6ao+8BTfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mxfo8nZOMe9MhR42YnyL7x75bOumNozm2lGWN8qjNdGOtmfNcCXoQvA+t3DkpvEC0
	 nx9QfxQwpCyhlMYDdsFW5Vt4FN8nDr12naOaR/nfEXTL5ZgElvi21dnkOeoXS3RwWK
	 RI2jaubd1QF6ZrIcWYzT3oFZHqpvvVfzlV+uyxMJqZKBS0+3MuEXxT6Cx7OyhhTTWy
	 manRZSTJRUZu8Nv+o7+TtOgHMM9xiNfgd+B3AsDnSbRHvGjyvbc753bMYWZB3tgdRa
	 uE5uqEsxqoOhl1HEr6VI9AXfETK/r+JXr6otEwZy7hmoWt0/FBNq7p8qAZ7y4MBt6X
	 I1yBMAc4++OtA==
Message-ID: <sashiko-outbox-164954@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] usb: xhci: Add support for eUSB2v2 1024-byte
 bulk packet size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak" <pawell@cadence.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009-eusb2v2-packet-size-v4-1-a505ee17b460@cadence.com>
References: <20261009-eusb2v2-packet-size-v4-0-a505ee17b460@cadence.com>
 <20261009-eusb2v2-packet-size-v4-1-a505ee17b460@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 06:38:57 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: xhci: eUSB2v2 1KB mode erroneously enabled for Full-Speed dev=
ices
- [High] usb: class drivers under-allocate RX buffers due to unmodified wMa=
xPacketSize
- [Medium] usb: xhci: incorrect URB_ZERO_PACKET evaluation for 1KB bulk OUT=
 endpoints
--

commit 54ae7d8065840029212e7f3efbe68ad6defca543
Author: Pawel Laszczak <pawell@cadence.com>
Subject: usb: xhci: Add support for eUSB2v2 1024-byte bulk packet size

This commit introduces support for 1024-byte maximum packet sizes for Bulk
endpoints in High-Speed mode on eUSB2v2 capable hosts. It introduces an
is_eusb2v2 flag and issues a SET_FEATURE request to switch compatible
peripherals to 1024-byte packet mode.

> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 0cd6dd2b6334b..311b8fd3bf44f 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
[ ... ]
> @@ -2013,6 +2013,69 @@ int usb_set_wireless_status(struct usb_interface *=
iface,
>  }
>  EXPORT_SYMBOL_GPL(usb_set_wireless_status);
> =20
> +/*
> + * eusb_update_max_packet - enable 1024-byte bulk mode for eUSB2v2 device
> + * @udev: target device
> + * @cp: configuration to be checked and enabled
> + *
> + * Per eUSB2v2 spec section 5.2, an eUSB2v2 peripheral will revert the
> + * maximum packet size to 512 for bulk endpoints after bus reset, discon=
nect,
> + * or deconfiguration.
> + * This function sends the BULK_MAX_PACKET_UPDATE request to restore the
> + * 1024-byte mode. It is valid only if the configuration has bulk endpoi=
nts.
> + */
> +int eusb_update_max_packet(struct usb_device *udev, struct usb_host_conf=
ig *cp)
> +{
> +	struct usb_host_config *config =3D cp ? cp : udev->actconfig;
> +	struct usb_hcd *hcd =3D bus_to_hcd(udev->bus);
> +	struct usb_interface_cache *intfc;
> +	struct usb_host_interface *alt;
> +	struct usb_host_endpoint *ep;
> +	int i, j, a;
> +	int ret;
> +
> +	udev->eusb2v2_mps_active =3D 0;
> +
> +	if (le16_to_cpu(udev->descriptor.bcdUSB) !=3D 0x0230 ||
> +	    !hcd->self.is_eusb2v2)
> +		return -EOPNOTSUPP;

[Severity: High]
Does this need to check udev->speed =3D=3D USB_SPEED_HIGH? If an eUSB2v2-co=
mpliant
device is connected but enumerates at Full-Speed, eusb_update_max_packet()
could send the feature request and set udev->eusb2v2_mps_active to 1.

If this happens, xhci_usb_endpoint_maxp() will unconditionally return 1024 =
for
the Full-Speed bulk endpoint, leading to a conflict in xhci_endpoint_init()
where the hardware endpoint context is clamped to 64 bytes:

drivers/usb/host/xhci-mem.c:xhci_endpoint_init() {
		if (udev->speed =3D=3D USB_SPEED_FULL) {
			max_packet =3D rounddown_pow_of_two(max_packet);
			max_packet =3D clamp_val(max_packet, 8, 64);
		}
}

Can this discrepancy between the 64-byte hardware context and the 1024-byte
TRBs generated by software lead to malformed TRBs and transfer failures?

> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a9e47e178c280..8e630d323c6fb 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
[ ... ]
> @@ -2949,6 +2949,11 @@ int xhci_usb_endpoint_maxp(struct usb_device *udev,
>  {
>  	if (usb_endpoint_is_hs_isoc_double(udev, host_ep))
>  		return le16_to_cpu(host_ep->eusb2_isoc_ep_comp.wMaxPacketSize);
> +
> +	if (udev->eusb2v2_mps_active &&
> +	    usb_endpoint_xfer_bulk(&host_ep->desc))
> +		return 1024;
> +
>  	return usb_endpoint_maxp(&host_ep->desc);
>  }

[Severity: High]
By dynamically overriding the packet size to 1024 bytes here for xHCI, while
leaving ep->desc.wMaxPacketSize as 512 bytes, could this cause higher-level
USB class drivers to under-allocate their transfer buffers?

Class drivers (like CDC NCM) rely entirely on usb_endpoint_maxp(&ep->desc) =
to
determine the size of incoming packets and pre-allocate their buffers. If t=
hey
allocate 512 bytes based on the unmodified descriptor, an incoming 1024-byte
packet could overflow the buffer and abort the transfer.

[Severity: Medium]
Additionally, does leaving the descriptor at 512 bytes cause an incorrect
URB_ZERO_PACKET evaluation for Bulk OUT transfers?

In xhci_urb_enqueue(), the need for a Zero-Length Packet is evaluated as:

    !(urb->transfer_buffer_length % usb_endpoint_maxp(&urb->ep->desc))

Since usb_endpoint_maxp() reads the unadjusted descriptor value of 512, an =
OUT
transfer length that is a multiple of 512 but not 1024 (e.g., 1536 bytes)
might incorrectly satisfy this condition and append an unnecessary Zero-Len=
gth
Packet, violating the bulk protocol.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-eusb2v2-pa=
cket-size-v4-0-a505ee17b460@cadence.com?part=3D1
