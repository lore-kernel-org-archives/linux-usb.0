Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797032;
	b=o6HkrZBH7yb2k6S/YcO7746nVgbnUh9+LQgMWwGPVNsMyIWCXYJVaVAI5HnU170lXSt3
	 1nDrdEz5rEbaykPOUs5rkZ7Z8/pdatiucQOnP2ALll4UCKAK02ciu/r43QTbIcf1R6aiU
	 /BeSiMCS2h+L6RmxqpGq8wmKi1KmlLrSWpPGdI4m7Ek81h0rlBEdLmA7nj6+gd7UvQiea
	 tU5D21iYD45Od7A/mM6T2kf45jpKL1wGOJuAtwngbqN/UPIVXbH9qxDtTW4xHaUBbCpte
	 Ow7BQL90YSogSjigxKpE/bC82ElmrN8TZ8/vJTIOJ2tkly0lgNq1t9IuKpEsfAwyPgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797032;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3pMnamRZhzB2eTMPKM1vfeWTze2T+/AhLRJl8ymp5oI=;
	b=VdpF9cPzpDSPjX+Mz8unYqe5F9RaLfU7gvZ685YfkxYl3FaX635Vswr3BPeXgBEVnJfQ
	 NCB8WENRDtbVcl/i1FYoJ3r62VcGlEe2yWWbZM3UBhHQT+p8jUz1j8mxzmEY/nhWmH4Ls
	 j5RKxbb3toYh0KirzW7i/U4L+gVfX+UKkYfOY5Ivw0IJOhkHDxbANo2OVCS6xQcrZo3CO
	 i70VLXgzpj3aWMnMo9dPb2oj+Pj+W58qLyXEzi1Rl4psadJzFZG/UfGJh15siMxh3fmdf
	 BFvRA5WdrVT24uCbxAepgOFnAAJp3EHR+I2urJMtzoZDMPoApHirdSS53WXpZxXefhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aC2Re26d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC69606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aC2Re26d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865A21F000C1;
	Wed,  4 Nov 2026 12:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797031;
	bh=3pMnamRZhzB2eTMPKM1vfeWTze2T+/AhLRJl8ymp5oI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aC2Re26dvzixzD/XM5wi/fbRhBGN/NMJaaA08aRz7rP3wUvC96vNfHtgAoD6P50lj
	 p8VuW/qHXkxn1fehwn35SI/EslVClE3zIra4tcMVltQUwKDOjFD4yz7ETJznLjbknP
	 QvEplbK7bQWPP8lgltpMAU4jucsOBq2vlEfpcIpeZ4k3yEVLw5osD/YRwPQIqVjWGN
	 AofmolULyYk5Todwf9OUNqQAUOBxWT8wywJsVfKUQsRI+Nqqc6ZPMiygVHbz2H188U
	 f5fgboViJPml6cTN8Jbp8sI6eUDrRgcX63kpNnXw4535BXpRUhN/rGxI8tXrIstWt6
	 uzwjFmPaFuj9A==
Message-ID: <sashiko-outbox-197312@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: hub: Re-guess ep0 maxpacket size on reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengfei Lv" <lvpengfei20@huawei.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104124402.1269650-1-lvpengfei20@huawei.com>
References: <20261104124402.1269650-1-lvpengfei20@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:57:11 +0000
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
- [High] usb: core: hub: missing usb_ep0_reinit() in hub_port_init() after =
ep0 guess
--

commit 8488ba17cb81d9272c99646f158ad82af5c82843
Author: Pengfei Lv <lvpengfei20@huawei.com>

usb: core: hub: Re-guess ep0 maxpacket size on reset

This commit removes the if (initial) guard around the ep0 maxpacket size
initialization in hub_port_init() so that udev->ep0.desc.wMaxPacketSize is
re-guessed from udev->speed during port resets as well as initial
enumeration.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 199d3f535a891..51f66b24b3538 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4969,31 +4969,29 @@ hub_port_init(struct usb_hub *hub, struct usb_dev=
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

[Severity: High]
Does hub_port_init() also need to call usb_ep0_reinit(udev) after resetting
udev->ep0.desc.wMaxPacketSize to 64 when !initial?

The commit message notes that re-establishing the 64-byte guess makes
xhci_check_maxpacket() issue an Evaluate Context command before the
GET_DESCRIPTOR data stage. However, commit e34900f46cd6 ("xhci: Reconfigure
endpoint 0 max packet size only during endpoint reset") removed that check
from xhci_urb_enqueue() and replaced it with xhci_check_ep0_maxpacket(),
which is only invoked from xhci_endpoint_reset() via usb_ep0_reinit():

drivers/usb/host/xhci.c:xhci_endpoint_reset() {
	if (usb_endpoint_xfer_control(&host_ep->desc) && ep_index =3D=3D 0) {
		...
		xhci_check_ep0_maxpacket(xhci, vdev);

		/* Nothing else should be done here for ep0 during ep reset */
		return;
	}
}

During a port reset in usb_reset_and_verify_device(), usb_ep0_reinit(udev)
is called before hub_port_init():

drivers/usb/core/hub.c:usb_reset_and_verify_device() {
	for (i =3D 0; i < SET_CONFIG_TRIES; ++i) {

		/* ep0 maxpacket size may change; let the HCD know about it.
		 * Other endpoints will be handled by re-enumeration. */
		usb_ep0_reinit(udev);
		ret =3D hub_port_init(parent_hub, udev, port1, i, &descriptor);
}

On the first attempt (i =3D=3D 0), udev->ep0.desc.wMaxPacketSize still hold=
s the
pre-reset value (e.g. 8) when usb_ep0_reinit(udev) runs, matching the xHC
output EP0 context, so xhci_check_ep0_maxpacket() does nothing.

Then hub_port_init() resets the port (leaving the slot in SLOT_STATE_DEFAULT
with max_packet =3D 8) and sets udev->ep0.desc.wMaxPacketSize =3D cpu_to_le=
16(64)
in software without calling usb_ep0_reinit(udev). When do_new_scheme is tru=
e,
hub_enable_device() -> xhci_enable_device() -> xhci_setup_device() sees the
slot is already in SLOT_STATE_DEFAULT and returns early without updating the
EP0 context:

drivers/usb/host/xhci.c:xhci_setup_device() {
	if (setup =3D=3D SETUP_CONTEXT_ONLY) {
		if (GET_SLOT_STATE(le32_to_cpu(slot_ctx->dev_state)) =3D=3D
		    SLOT_STATE_DEFAULT) {
			xhci_dbg(xhci, "Slot already in default state\n");
			goto out;
		}
	}
}

As a result, when get_bMaxPacketSize0() submits the 64-byte GET_DESCRIPTOR
URB on i =3D=3D 0, the xHC hardware EP0 context still has max_packet =3D 8,=
 so the
first hub_port_init() call still times out across all GET_DESCRIPTOR_TRIES *
GET_MAXPACKET0_TRIES attempts before usb_reset_and_verify_device() retries
with i =3D=3D 1.

In addition, for standard full-speed devices with bMaxPacketSize0 =3D 8 who=
se
18-byte descriptor read succeeds on i =3D=3D 0 in do_new_scheme,
hub_set_address() calls usb_ep0_reinit(udev) while
udev->ep0.desc.wMaxPacketSize is still 64, issuing an Evaluate Context
command to change max_packet from 8 to 64 right before hub_port_init() sets
wMaxPacketSize back to 8 and calls usb_ep0_reinit(udev) a second time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104124402.1269=
650-1-lvpengfei20@huawei.com?part=3D1
