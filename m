Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793936096;
	b=bzIG9kallYTMA9q66EnDSHouQp0T2AMYc8DhFtaAI82eVNVnW8g63m/Azk4C77g9Ekq7
	 8PxvVDKLRzhUOwWA/LaeSuHl2iJqZ28yBvJ2wsjI1lCYqluKMK1EUfFntwZFwGeRkLjqT
	 YHmw9MfW9ednsa62R/98jkK3k6GiQ4qJrcxSEzxceQG8oyBrqWBgh1SyoWv2AepPwmufP
	 1fm1/HtO59nnyKQjRGpjl3aoyTnnznC0cAVQGIl3rcicodzu5xv0mfY6rZhD1IUtq+O11
	 KITHEr/vpgnjoWLJ6hLsbugYlAcOFoSPt8PxBCL48nOk+xjvizjH5x2Uxz6iboUb/BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793936096;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CjfJddZ18P8I9AHdUbWexUBR0fmPOBKTFV/OlO6HIcc=;
	b=PxADaeQ9OuYwKALLCJhLd4XFeEGvAfvLGNvkkAwSccR5/kJSnq7q13bVnq7hRStULESK
	 SjPzu4nZ3sV6QTId1i4GdQfd0WPzx/AtVOFFJSklUYDVo0l+oGKq/3f50YZlthCqHUZcV
	 fdaocKzWyKpFVYdo6CXPYsaCKU92XVXO3lKkmhAXRMftzK9LOfWl1vAUd6L6rDeo6dYcy
	 OPPs0IllaiR/rDCodg3mSNtwpsH5NxVA/ZCvT+guDye5F4LXpmujGVoBzmP75JdZfJXTk
	 CRXEF6SZwW6JjBCCHk+lJaw8CFpilcOc2VpiibmKs4z63EEosFCvxbtp28DNC9yABwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+6XYqth;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95754606A31B
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 03:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T+6XYqth
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2021F0089F;
	Fri,  6 Nov 2026 03:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793936096;
	bh=CjfJddZ18P8I9AHdUbWexUBR0fmPOBKTFV/OlO6HIcc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T+6XYqthD4C+66k4jENPGYS7qxJPK18txoEQcfrMh/VZFg5v3d/ZVm/jMwj/mDdgi
	 /yps5HwjoCaYF83Zu1lGwcWWtfPtxXKyKesS/LdZnk6IM5Lsa7+L1XxVBdLsMyNIH1
	 4BHpGYmE0V0k/wiWu5muYsnPDaiXPft6otlYCwWdtkIYQsEbJGOJ/ZeKVHN1n4i3UQ
	 hwg/0jtMzrVckoZqtWWO8WBbdkYvh650fHuHEItOA0GdhR+sG8vcXkcZLqPhNIXEjg
	 Vy+F6dIHpTipD9FtcL44meKM/0le7dzN/XZZcHIQ2rQvTjMrlPbkvDjOn8B7Y9VWdi
	 xVuZ4nmEa/K7w==
Message-ID: <sashiko-outbox-200650@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: core: hub: Re-guess ep0 maxpacket size on reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengfei Lv" <lvpengfei20@huawei.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106031625.1824732-1-lvpengfei20@huawei.com>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
 <20261106031625.1824732-1-lvpengfei20@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 03:34:55 +0000
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
- [Medium] usb: core: hub: usb_ep0_reinit() on unaddressed xHCI slot in hub=
_port_init()
--

commit d0ddaa8105de736e42e89c86a81968c860e72871
Author: Pengfei Lv <lvpengfei20@huawei.com>

usb: core: hub: Re-guess ep0 maxpacket size on reset

This commit removes the initial guard around the ep0 maxpacket size guess in
hub_port_init() and calls usb_ep0_reinit() on reset so that full-speed devi=
ces
with bMaxPacketSize0 < 64 have their ep0 maxpacket reset to 64 in both USB
core and the xHCI ep0 context before re-enumeration issues a 64-byte
GET_DESCRIPTOR request.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 199d3f535a891..a6c260d390945 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4969,33 +4969,34 @@ hub_port_init(struct usb_hub *hub, struct usb_dev=
ice *udev, int port1,
>  	}
>  	oldspeed =3D udev->speed;
> =20
> -	if (initial) {
> -		/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> -		 * it's fixed size except for full speed devices.
> +	/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> +	 * it's fixed size except for full speed devices.
> +	 */
> +	switch (udev->speed) {
> +	case USB_SPEED_SUPER_PLUS:
> +	case USB_SPEED_SUPER:
> +		udev->ep0.desc.wMaxPacketSize =3D cpu_to_le16(512);
> +		break;
> +	case USB_SPEED_HIGH:		/* fixed at 64 */
> +		udev->ep0.desc.wMaxPacketSize =3D cpu_to_le16(64);
> +		break;
> +	case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> +		/* to determine the ep0 maxpacket size, try to read
> +		 * the device descriptor to get bMaxPacketSize0 and
> +		 * then correct our initial guess.
>  		 */
> -		switch (udev->speed) {
> -		case USB_SPEED_SUPER_PLUS:
> -		case USB_SPEED_SUPER:
> -			udev->ep0.desc.wMaxPacketSize =3D cpu_to_le16(512);
> -			break;
> -		case USB_SPEED_HIGH:		/* fixed at 64 */
> -			udev->ep0.desc.wMaxPacketSize =3D cpu_to_le16(64);
> -			break;
> -		case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> -			/* to determine the ep0 maxpacket size, try to read
> -			 * the device descriptor to get bMaxPacketSize0 and
> -			 * then correct our initial guess.
> -			 */
> -			udev->ep0.desc.wMaxPacketSize =3D cpu_to_le16(64);
> -			break;
> -		case USB_SPEED_LOW:		/* fixed at 8 */
> -			udev->ep0.desc.wMaxPacketSize =3D cpu_to_le16(8);
> -			break;
> -		default:
> -			goto fail;
> -		}
> +		udev->ep0.desc.wMaxPacketSize =3D cpu_to_le16(64);
> +		break;
> +	case USB_SPEED_LOW:		/* fixed at 8 */
> +		udev->ep0.desc.wMaxPacketSize =3D cpu_to_le16(8);
> +		break;
> +	default:
> +		goto fail;
>  	}
> =20
> +	if (!initial)
> +		usb_ep0_reinit(udev);

[Severity: Medium]
Can calling usb_ep0_reinit(udev) here before hub_enable_device() or
hub_set_address() trigger an invalid Evaluate Context command when the xHCI
slot has been newly allocated during reset?

Earlier in drivers/usb/core/hub.c:hub_port_init(), hub_port_reset() invokes
hcd->driver->reset_device(), which resolves to
drivers/usb/host/xhci.c:xhci_discover_or_reset_device(). When the xHCI slot
was freed and reallocated via xhci_alloc_dev() (for example on Etron hosts
with XHCI_ETRON_HOST, or after host controller power loss / reset on resume=
),
the newly allocated virt_dev has a zeroed out_ctx in SLOT_STATE_DISABLED
because Address Device (xhci_setup_device()) has not run yet:

drivers/usb/host/xhci.c:xhci_discover_or_reset_device() {
	...
	slot_ctx =3D xhci_get_slot_ctx(xhci, virt_dev->out_ctx);
	if (GET_SLOT_STATE(le32_to_cpu(slot_ctx->dev_state)) =3D=3D
						SLOT_STATE_DISABLED)
		return 0;

	if (xhci->quirks & XHCI_ETRON_HOST) {
		ret =3D xhci_disable_and_free_slot(xhci, udev->slot_id);
		if (!ret) {
			ret =3D xhci_alloc_dev(hcd, udev);
	...
}

When usb_ep0_reinit(udev) is then called for a full-speed device via
usb_enable_endpoint() -> usb_hcd_reset_endpoint() -> xhci_endpoint_reset() =
->
xhci_check_ep0_maxpacket(), neither xhci_endpoint_reset() nor
xhci_check_ep0_maxpacket() checks whether vdev->out_ctx is still in
SLOT_STATE_DISABLED:

drivers/usb/host/xhci.c:xhci_check_ep0_maxpacket() {
	...
	ep_ctx =3D xhci_get_ep_ctx(xhci, vdev->out_ctx, 0);
	hw_max_packet_size =3D MAX_PACKET_DECODED(le32_to_cpu(ep_ctx->ep_info2));
	max_packet_size =3D usb_endpoint_maxp(&vdev->udev->ep0.desc);

	if (hw_max_packet_size =3D=3D max_packet_size)
		return 0;
	...
}

Because vdev->out_ctx is still zeroed, hw_max_packet_size is 0 !=3D 64, so
xhci_check_ep0_maxpacket() copies the zeroed out_ctx ep0 into in_ctx ep0 and
issues an Evaluate Context command on an unaddressed slot in the Enabled
state, which the xHC rejects with COMP_CONTEXT_STATE_ERROR (logging a warni=
ng
in xhci_evaluate_context_result()).

Furthermore, if a previous attempt in xhci_setup_device() failed with
COMP_USB_TRANSACTION_ERROR, it reallocates the slot via xhci_alloc_dev() and
calls xhci_setup_addressable_virt_dev(xhci, udev), which populates
vdev->in_ctx (including setting slot_ctx->dev_info and initializing in_ctx
ep0) while vdev->out_ctx remains zeroed. If hub_port_init() retries and cal=
ls
usb_ep0_reinit(udev) before the next xhci_setup_device(),
xhci_check_ep0_maxpacket() overwrites vdev->in_ctx ep0 from the zeroed
vdev->out_ctx while leaving slot_ctx->dev_info non-zero:

drivers/usb/host/xhci.c:xhci_setup_device() {
	...
	if (!slot_ctx->dev_info)
		xhci_setup_addressable_virt_dev(xhci, udev);
	/* Otherwise, update the control endpoint ring enqueue pointer. */
	else
		xhci_copy_ep0_dequeue_into_input_ctx(xhci, udev);
	...
}

Wouldn't xhci_setup_device() then skip xhci_setup_addressable_virt_dev() and
submit Address Device with a zeroed ep0 context (EP_TYPE =3D=3D 0)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106031625.1824=
732-1-lvpengfei20@huawei.com?part=3D1
