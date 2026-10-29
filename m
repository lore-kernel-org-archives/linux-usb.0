Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258686;
	b=xsZ1MRwNebpo9vilOjONYp00b9x0nis2le1mDf2OeJ3kvRpRjkSipTUjyxAk1/dtYMl8
	 EUun004zLRakQYJ8gpYeTrxeMPacvEp9UePXzqInNp+t2YKC4C6ycOEK0s8KSL5LtBetk
	 pem02IwWYy+kIHNFfOYr99SGFmX35J4p0uBS+yXclquGuhx2jxB+fIMj8Gbs91gUxwGk8
	 cV4L6y4bbCvtah1qTl7uEfMLc0l7FCmeubAb1AlemA/bWDClCi2fA6qPUol63sT4F047B
	 sKog7XpGwzKk3g/aStJCtx7jonH1jtburjFVyku2ktDvoB5PBc2Dy3S/1mkq3ZUJPeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258686;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=H66I6gwnknAbyxbJvdR81Z5vw6+RwCoDzGVq9Nn/doM=;
	b=vSE0mOp2IN1A8kB7TacAE5c7pbHaMOi0YwlhCEnOWnIvQdXUaU/GvrDA6d5G8hxe3sHw
	 g6fz+Z7PlbsopufwngzxX+MLlu5ONuIP2+4HLWdRDfbjtoAp1GamehkdF0Oi3CAE4Q3Yb
	 lhEKEZDXLofyHdM+dnmNax5W3ELFL4yPxs1cOKKXnd81UJ+jfcZYGA7Xz6Rmj947+cexN
	 nhu3wPS/JMGoK/0s2HsMW5JtVuTGPEdmWZf56W0w96bRuW/p5jApCWyuyHHJxAbDn36pq
	 JJZ41PR516h1Dm5XHv9Hev0ME4ZiM6RFx428TNY9Zq6SekQ2nV6Uy60BHxZsfcd4eyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XeLtjzmR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72F606A31C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XeLtjzmR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DDE1F01825;
	Thu, 29 Oct 2026 07:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793258686;
	bh=H66I6gwnknAbyxbJvdR81Z5vw6+RwCoDzGVq9Nn/doM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XeLtjzmR7bmXa0f1xbk2156qBMMGnCLMIw19qj6snZ0fPn+th8VTusEPdPy7BUaJb
	 LQDy2UzHSQEqw0HsZXfOJ6q091qJDDuWAm9mmkh8Bq/3UGGRadbWhoYGkgvEf9w7Qh
	 LzaL9UiepQxi7e6ZSP1ebRd2psHRDASo402FCBIspSOkwRhwPcCbLunvIMeJYuzM6A
	 c0n1Wz13miJn7OFFUeFPHduMmrYgPkVv4++gJDawIqTr+cw4dnsPLiXdZhmrv7+m0x
	 r5JOJ57baMytvUHQs2ksDkR5JpM2C16WD7TzPH0YaI8hqjT7aRakYVSeSVF2bVQ5Qu
	 A8A7vVPYT53gg==
Message-ID: <sashiko-outbox-188861@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] usb: xhci: Reject URBs to disconnected devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Pecio" <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029075706.69aaa77f.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
 <20261027192128.386082-1-mathias.nyman@linux.intel.com>
 <20261028080734.173da0e4.michal.pecio@gmail.com>
 <20261029075409.4b203658.michal.pecio@gmail.com>
 <20261029075706.69aaa77f.michal.pecio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 07:24:45 +0000
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
- [High] usb: xhci: stale rhub_port state in xhci_urb_enqueue() rejects val=
id URBs
--

commit 3e6930cee6e8275b8d271ab4827ba5004d45037f
Author: Michal Pecio <michal.pecio@gmail.com>

usb: xhci: Reject URBs to disconnected devices

This commit extends the port link error check in xhci_urb_enqueue() to also
reject URBs with -ENODEV when the root hub port is marked disconnected or t=
he
endpoint has EP_DROP_PENDING set.

> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a9e47e178c280..4a893a8438c3a 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1665,12 +1665,6 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, s=
truct urb *urb, gfp_t mem_flag
>  		goto free_priv;
>  	}
> =20
> -	if (xhci->devs[slot_id]->rhub_port->link_inactive) {
> -		xhci_dbg(xhci, "Can't queue urb, port error, link inactive\n");
> -		ret =3D -ENODEV;
> -		goto free_priv;
> -	}
> -
>  	if (xhci->xhc_state & XHCI_STATE_DYING) {
>  		xhci_dbg(xhci, "Ep 0x%x: URB %p submitted for non-responsive xHCI host=
.\n",
>  			 urb->ep->desc.bEndpointAddress, urb);
> @@ -1680,6 +1674,13 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, s=
truct urb *urb, gfp_t mem_flag
> =20
>  	ep_state =3D &xhci->devs[slot_id]->eps[ep_index].ep_state;
> =20
> +	if (xhci->devs[slot_id]->rhub_port->link_inactive ||
> +	    !xhci->devs[slot_id]->rhub_port->connected || *ep_state & EP_DROP_P=
ENDING) {
> +		xhci_dbg(xhci, "Can't queue urb, link error or disconnected\n");
> +		ret =3D -ENODEV;
> +		goto free_priv;
> +	}

[Severity: High]
Can rhub_port->connected, rhub_port->link_inactive, or EP_DROP_PENDING rema=
in
stale here and cause xhci_urb_enqueue() to reject valid URBs (including EP0
control transfers) during device reset, resuscitation, resume, or enumerati=
on?

Across the xHCI driver, port->connected and port->link_inactive are only
updated in drivers/usb/host/xhci-ring.c:handle_port_status() when a hardware
TRB_PORT_STATUS event is received while PORT_RESET is not set:

drivers/usb/host/xhci-ring.c:handle_port_status() {
	...
	if (!(portsc & PORT_RESET)) {
		port->link_inactive =3D (pls =3D=3D XDEV_INACTIVE);
		port->connected =3D !!(portsc & PORT_CONNECT);
	}
	...
	/*
	 * xHCI port-status-change events occur when the "or" of all the
	 * status-change bits in the portsc register changes from 0 to 1.
	 * New status changes won't cause an event if any other change
	 * bits are still set.  When an event occurs, switch over to
	 * polling to avoid losing status changes.
	 */
}

Neither xhci_get_port_status(), xhci_clear_port_change_bit(), nor
xhci_discover_or_reset_device() updates port->connected or
port->link_inactive:

drivers/usb/host/xhci-hub.c:xhci_get_port_status() {
	...
	/* common wPortStatus bits */
	if (portsc & PORT_CONNECT) {
		status |=3D USB_PORT_STAT_CONNECTION;
		status |=3D xhci_port_speed(portsc);
	}
}

drivers/usb/host/xhci.c:xhci_discover_or_reset_device() {
	...
command_cleanup:
	for (i =3D 0; i < EP_CTX_PER_DEV; i++)
		virt_dev->eps[i].ep_state &=3D ~EP_DROP_PENDING;
}

When a disconnect (PORT_CSC =3D 1, PORT_CONNECT =3D 0) or link error (PORT_=
PLC =3D 1,
pls =3D XDEV_INACTIVE) occurs, handle_port_status() sets port->connected =
=3D 0 or
port->link_inactive =3D 1, leaves the status-change bits set in PORTSC, and
switches the roothub to polling. Because the xHC only generates a
TRB_PORT_STATUS event when the logical OR of all PORTSC status-change bits
transitions from 0 to 1, subsequent transitions back to PORT_CONNECT =3D 1 =
or
XDEV_U0 will not generate a new TRB_PORT_STATUS event while any change bit
remains set in PORTSC.

This appears to leave rhub_port state (or EP_DROP_PENDING) stale in several
paths:

1. Device reset or resuscitation across a disconnect or link error via
usb_reset_device() -> usb_reset_and_verify_device() -> hub_port_init() ->
hub_port_reset(), where port_dev->status_lock is held so port_event() cannot
clear PORT_CSC or PORT_PLC. On USB3 root ports, PORT_CSC or PORT_PLC stays =
set
throughout the reset, suppressing TRB_PORT_STATUS when the device reconnects
and reset completes. On USB2 root ports, if the first reset completes while
PORT_CSC is set, hub_port_wait_reset() clears only C_CONNECTION and returns
-EAGAIN without clearing C_RESET (PORT_RC), so PORT_RC stays set throughout
the retry reset and suppresses TRB_PORT_STATUS when the retry completes.
Although xhci_discover_or_reset_device() clears EP_DROP_PENDING,
rhub_port->connected remains 0 (or link_inactive remains 1), causing
get_bMaxPacketSize0() or usb_get_device_descriptor() in hub_port_init() to
fail with -ENODEV.

2. Delayed connection after reset completion in
drivers/usb/core/hub.c:hub_port_wait_reset():

drivers/usb/core/hub.c:hub_port_wait_reset() {
	...
		if (!(portstatus & USB_PORT_STAT_RESET) &&
		    (portstatus & USB_PORT_STAT_CONNECTION))
			break;
}

If PORT_RESET clears (setting PORT_RC =3D 1) before PORT_CONNECT is asserte=
d,
handle_port_status() runs on the PORT_RC event while PORT_CONNECT is 0 and
sets port->connected =3D 0. When PORT_CONNECT subsequently becomes 1 while
PORT_RC is still set, no new TRB_PORT_STATUS event fires.

3. Connect bounce during hub_port_debounce(): a bounce disconnect sets
PORT_CSC =3D 1 (and/or PORT_PLC =3D 1) and port->connected =3D 0. If the po=
rt
reconnects during the debounce sleep while PORT_CSC is still 1, no
TRB_PORT_STATUS event fires on reconnect, and hub_port_debounce() clears
C_CONNECTION while leaving port->connected =3D=3D 0.

4. Status change during active reset: if PORT_CSC or PORT_PLC becomes 1 whi=
le
PORT_RESET is active, TRB_PORT_STATUS fires while (portsc & PORT_RESET) is
true, so handle_port_status() skips updating port->connected and
port->link_inactive, and the uncleared change bit suppresses the event when
PORT_RESET clears.

5. USB3 resuscitation without a port reset in
drivers/usb/core/hub.c:hub_port_connect_change(), or transient disconnect
during wait_for_connected() in usb_port_resume():

drivers/usb/core/hub.c:hub_port_connect_change() {
	...
		if (portstatus & USB_PORT_STAT_ENABLE) {
			/*
			 * USB-3 connections are initialized automatically by
			 * the hostcontroller hardware. Therefore check for
			 * changed device descriptors before resuscitating the
			 * device.
			 */
			descr =3D usb_get_device_descriptor(udev);
}

If a USB3 device briefly disconnects (setting PORT_CSC =3D 1,
port->connected =3D 0, and EP_DROP_PENDING on halted/stopped endpoints) and
reconnects to U0 while PORT_CSC is still 1, no second TRB_PORT_STATUS event
fires. When hub_port_connect_change() or finish_port_resume() then submits =
EP0
control URBs without calling xhci_discover_or_reset_device(), won't
xhci_urb_enqueue() reject them with -ENODEV due to stale
rhub_port->connected =3D=3D 0 or stale EP_DROP_PENDING on EP0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029075409.4b20=
3658.michal.pecio@gmail.com?part=3D4
