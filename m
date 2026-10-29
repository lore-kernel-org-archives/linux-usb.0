Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311903;
	b=QUs+USn0QF+4HhFIl5Lt1zQhGw6Z5OaNcHxSngvf7z/Bjv2Wo9y92ELS/yVJyNg88YLc
	 qiZNzQcqAFvQj9vpKW9McNNYjqsdi0DGSYkFU5/QEQgqbfFshpD/vG1AYDEzTZBqX7Yw9
	 SnsgZ29rX/5leKChVPTbQhL0qjZ0TAUYoCwE/SAIz4/ByyJJNaOo7oLDrhfRiSmdDuy9j
	 dJDFELo3Ao6kiJaO1+9D2LRlVnScoE5ivqyMR79oW9TPquCd2ZH6CO7U8JF4984FnrBTc
	 JjnYPmXspPfLK9GUmKeyNnZSSl3o7HQm4hww8zx+fUiqZDHws7CNCTkEsQElBkWUYmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311903;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+vWisJSvkjIVS8hqgaOKIFJgf1ZxzHMQZ2jRRD6yEDs=;
	b=bUOM3YwGuOduMzHlaSBl9IXM9k0Yj4DxuAL9FF8q3e+1bYAyJATGmhmwSoc2ZJhtWO1a
	 57lVbqbPpl6kh0Mnc4PmoIhg1PGG5CrrSABMKuchCf+oMA5Tkg7hp/nFtXdIFBx9dbS/3
	 uUW/DrKSxcRmauOrYgPIAGmDysvQYcm8AaoYKavfxMqiRtIUHj5BxUnlBIjoB4yEG0q9v
	 LQA10sqc46wzizcEz0bYXeCNU7F4H1+T85VREy6ZH6qF8edbEQZah+coCh5HzrfEgqWsf
	 rn3JWQ/vdmQOfiaGHmZGvfrGFlRYFwchkOkIyByKrWDBzHSiMmnhdRCGGJXjStqWg4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zp+c8SWX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E444606A320
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zp+c8SWX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E371F01829;
	Thu, 29 Oct 2026 22:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793311902;
	bh=+vWisJSvkjIVS8hqgaOKIFJgf1ZxzHMQZ2jRRD6yEDs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zp+c8SWX55ijnO1s0Z54wWEYDS2ksuBGbXK6/I0unDq9qMOVMq+2h6MkeH9Upe/ZP
	 Hdy+rCThX0EqVPqQpJVhExOGsYdL5wAY04g4PZrNLQlP/OcGPRSP8QOEPKMgsuYMc+
	 z2gMvOoxNk2dyT8v4wgab3Mo1z9g8Us7LepgbHxHtCBR5NmDeaYReNwaU74yj3tX3K
	 yTgJv9t54IhdCyqzHl2BQCsCURFJTELVSiScMU0mOJcVgPgw/X4oTZMJuMPnyjM8iw
	 eVIJDcRFgddZhg06pRMBwGRNuSNmKxwLddOdPax6efndN5UHmOH7xIhVJqVfi+/dE2
	 ZyPeSODd14+mw==
Message-ID: <sashiko-outbox-190053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after
 disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 22:11:41 +0000
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
- [High] xhci: stale rhub_port status across reset re-triggers EP_DROP_PEND=
ING
--

commit 28b1e3f2ba757ac7bec832f907ed7d9693752c9e
Author: Yiyu Zhou <yiyu@yiyuzhou.io>

xhci: give back TDs and clean up ep0 after disconnect

This commit cancels and gives back TDs on halted endpoints behind
disconnected or link-inactive ports, hard-resets and cleans up ep0 so it
can survive brief disconnects during enumeration, and blocks new URB
submissions in xhci_urb_enqueue() while EP_DROP_PENDING is set.

Closes: https://lore.kernel.org/all/20261010071811.20483-1-yiyu@yiyuzhou.io/
Closes: https://lore.kernel.org/linux-usb/4MjB9K-2SoiA85WbI9iEig@dsine.de/

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
> +		if (!td && ep->ep_index !=3D 0) {
> +			xhci_kill_endpoint_urbs(xhci, slot_id, ep->ep_index);
> +			return -ENODEV;
> +		}
>  	}

[ ... ]

> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 30ac1bc4559b7..b50a582be1fbf 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1665,12 +1665,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, s=
truct urb *urb, gfp_t mem_flag

[ ... ]

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
Can a stale rhub_port->connected or rhub_port->link_inactive state across a
port reset cause xhci_urb_enqueue() to permanently reject ep0 URBs with
-ENODEV after a brief disconnect?

In drivers/usb/host/xhci-ring.c, port->connected and port->link_inactive are
only updated in handle_port_status() when a Port Status Change Event TRB is
received:

	if (!(portsc & PORT_RESET)) {
		port->link_inactive =3D (pls =3D=3D XDEV_INACTIVE);
		port->connected =3D !!(portsc & PORT_CONNECT);
	}

Per xHCI specification section 4.19.2, the xHC only generates a Port Status
Change Event TRB when the logical OR of all PORTSC status-change bits
(CSC | PEC | OCC | PRC | WRC | PLC | CEC) transitions from 0 to 1.

When a device briefly disconnects during enumeration in hub_port_init() (or
enters XDEV_INACTIVE), PORT_CSC (or PORT_PLC) transitions from 0 to 1 and
handle_port_status() sets rhub_port->connected =3D 0 (or
rhub_port->link_inactive =3D 1). Because hub_wq is busy in hub_port_init(),
port_event() does not run to clear PORT_CSC.

When the device reconnects and hub_port_reset() resets the port to recover
it, PORT_CSC (or PORT_PLC) is already 1 when reconnect and PORT_RC occur:

1. On USB 2.0 ports, the first reset attempt sets PORT_RC =3D 1 while PORT_=
CSC
   is still 1 (no 0-to-1 transition of the change-bit OR).
   hub_port_wait_reset() sees USB_PORT_STAT_C_CONNECTION, clears PORT_CSC
   while PORT_RC remains 1, and returns -EAGAIN before hub_port_reset()
   clears PORT_RC. The second reset attempt then completes while PORT_RC is
   already 1 and clears PORT_RC to 0, so no Port Status Change Event TRB is
   generated after the reconnect.

2. On USB 3.0 ports, hub_port_wait_reset() ignores
   USB_PORT_STAT_C_CONNECTION, so the reset completes while PORT_CSC or
   PORT_PLC is still 1 (no 0-to-1 transition) and hub_port_reset() then
   clears PORT_RC, PORT_WRC, PORT_PLC, and PORT_CSC.

At the end of the reset, xhci_discover_or_reset_device() clears
EP_DROP_PENDING without refreshing rhub_port->connected or
rhub_port->link_inactive:

command_cleanup:
	for (i =3D 0; i < EP_CTX_PER_DEV; i++)
		virt_dev->eps[i].ep_state &=3D ~EP_DROP_PENDING;

If rhub_port->link_inactive is still 1, xhci_urb_enqueue() will immediately
reject all URBs with -ENODEV.

If rhub_port->connected is still 0, then as soon as ep0 hits any normal
protocol stall (COMP_STALL_ERROR, such as fetching USB_DT_DEVICE_QUALIFIER,
USB_DT_BOS, or HID_REQ_SET_IDLE) or an URB unlink via
xhci_handle_cmd_stop_ep(), xhci_handle_halted_endpoint() sees
!rhub_port->connected, overwrites td->status from -EPIPE to -EPROTO, and
sets ep->ep_state |=3D EP_DROP_PENDING on ep0. Because EP_DROP_PENDING is
never cleared by xhci_handle_cmd_reset_ep() or xhci_handle_cmd_set_deq(),
wouldn't xhci_urb_enqueue() then reject all subsequent ep0 control transfers
with -ENODEV?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029204324.6588=
45-1-mathias.nyman@linux.intel.com?part=3D1
