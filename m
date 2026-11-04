Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772975;
	b=2KdbPl9tQBgMExbbmXSo5JNqqVmaN96bCkbksOvKSFfq+JFgIZ/1gOiUNv6LThdTCwGs
	 XATqo5OAL5L6CM8xbOrTDVTCNqlQp9lF6ipci+715wGSUqlBY6UfPSek3/dfJnkzw/Gjt
	 yP6rJEUR3Z6PXGYYEKqkb2h1hEgL5vJvDsvTRv+142mLMVgSaWcssL5BHU/gDgWbBKPgk
	 dGGw2RLibmipn7oa3g0U5/ZyVPN+fgsj2UGRhawy/GsWHdJ0Xr2pSQOreGZeukO6tsCk/
	 kSGKyM3fwZKb4RPPc9dicjlkkdVygr+CX155XDqUKf20d5mgPen6q8uf27LTB35XwmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772975;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Eb8riLo3fILEPVAKveaMUcZdRHxj91z9KBw8e/W2DK0=;
	b=mVIsSR/7Ip8gV4EZB5jmWVNdoUYmDKYJJBloTMnyY2JMnhWcI4g4Vq2rmu5NHUmNYRIE
	 6rvdb2JPZWBAj+4IfMZF3TkLpK7fz4eMsRfXUpNszfDe2xAEbTRNAmC9uB/MlcYX1L+s1
	 vVYqzBrAeaC086n3jOXN7kHMiDOkQLXax2x88UfN+/3Ac/2dScDncvWg8RcRfWfWRsmhe
	 GZrR7GBCmjGFjVeh+gQ+mVidEV4BfbMV6bgDlcnAm6pFvf/7Fp2B8QyfOZKFZYqeTTqrH
	 qIVVvZubd/qUOLQnPUHVCydz1VCgzwwnelg5q9mLsAPUPoCVQnoYOx2JQa/K/nBd4fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hDHw8brB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D8606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 06:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hDHw8brB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C76E1F000C1;
	Wed,  4 Nov 2026 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793772975;
	bh=Eb8riLo3fILEPVAKveaMUcZdRHxj91z9KBw8e/W2DK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDHw8brB6CI2zrBssgqWdXoISaY+bRy/hWlk3EMTCVmNWmNhcIkOyafqHVz9lxZuC
	 qvtTqfIC+mo3V9i6fEHjdOg9BecGMUAKsEa81YBmln6EzzK2lMcuaf0krfgNhkP5Xz
	 NymNC2DGBorOy27xpjY+kEc+DovGgB9ik7JMEwCcEwh1RVCCC5dwwx+fA7hwyQePt9
	 Tc3nbSJihPCv6TvQ7yZfxlzhQatgtllZPGDjleyZuGbamdxPOICKoPLT4dB1pPfJSR
	 RCPs3dbHr0DlRwDzJXgSgwLvW+DRSJR2UQ2fcd3BdZnXXUzaYqTKPJr4oP1JUVHpHp
	 Ih6zHDR+WMNnw==
Message-ID: <sashiko-outbox-196735@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: vhci: do not give back URBs with an unchecked
 actual_length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vlatko Kosturjak" <kost@linux.hr>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <aurLXADfuLjs-dm-@griffin.linux.hr>
References: <aurLXADfuLjs-dm-@griffin.linux.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 06:16:14 +0000
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
- [Critical] usbip: vhci: negative wire actual_length bypasses usbip_recv_x=
buff() check
--

commit e0d5d4fc3a36398ed4d68d108185b0a82c1a635b
Author: Vlatko Kosturjak <kost@linux.hr>

usbip: vhci: do not give back URBs with an unchecked actual_length

This commit zeroes urb->actual_length in vhci_recv_ret_submit() when
usbip_recv_xbuff() fails so completion handlers such as usbfs do not read p=
ast
urb->transfer_buffer.

> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c898375..720dafa72f7e1 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -78,6 +78,14 @@ static void vhci_recv_ret_submit(struct vhci_device *v=
dev,
> =20
>  	/* recv transfer buffer */
>  	if (usbip_recv_xbuff(ud, urb) < 0) {
> +		/*
> +		 * The transfer buffer was not filled: either a short read or
> +		 * an actual_length larger than transfer_buffer_length, which
> +		 * usbip_recv_xbuff() rejects. Do not give the URB back with
> +		 * that actual_length: completion handlers trust it, e.g.
> +		 * usbfs copies actual_length bytes out of transfer_buffer.
> +		 */
> +		urb->actual_length =3D 0;
>  		urb->status =3D -EPROTO;
>  		goto error;
>  	}

[Severity: Critical]
Does relying on usbip_recv_xbuff() < 0 here still allow a server to pass an
out-of-bounds urb->actual_length to usb_hcd_giveback_urb() when the wire
actual_length is negative (0x80000000..0xffffffff) or when the URB is an OUT
transfer?

Before calling usbip_recv_xbuff(), vhci_recv_ret_submit() calls
usbip_pack_pdu() -> usbip_pack_ret_submit(), which copies the signed __s32
rpdu->actual_length directly into the unsigned u32 urb->actual_length:

drivers/usb/usbip/usbip_common.c:usbip_pack_ret_submit() {
	...
	if (pack) {
		...
	} else {
		urb->status		=3D rpdu->status;
		urb->actual_length	=3D rpdu->actual_length;
		urb->start_frame	=3D rpdu->start_frame;
		urb->number_of_packets	=3D rpdu->number_of_packets;
		urb->error_count	=3D rpdu->error_count;
	}
}

Then usbip_recv_xbuff() assigns urb->actual_length into a signed int size a=
nd
returns 0 before the bounds check if usb_pipeout(urb->pipe) is true or if
!(size > 0):

drivers/usb/usbip/usbip_common.c:usbip_recv_xbuff() {
	...
	} else {
		/* the direction of urb must be IN. */
		if (usb_pipeout(urb->pipe))
			return 0;

		size =3D urb->actual_length;
	}

	/* no need to recv xbuff */
	if (!(size > 0))
		return 0;

	if (size > urb->transfer_buffer_length)
		/* should not happen, probably malicious packet */
		goto error;
	...
}

If a server replies to an IN URB with a negative rpdu->actual_length (for
example -22, which becomes 0xffffffea in u32 urb->actual_length), size is
negative in usbip_recv_xbuff(), so !(size > 0) is true and usbip_recv_xbuff=
()
returns 0 without reading from the socket or signalling an error.

vhci_recv_ret_submit() then gives the URB back with urb->actual_length >=3D
0x80000000, and processcompl() -> copy_urb_data_to_user() treats
urb->actual_length as an unsigned byte count:

drivers/usb/core/devio.c:copy_urb_data_to_user() {
	...
	if (urb->number_of_packets > 0)		/* Isochronous */
		len =3D urb->transfer_buffer_length;
	else					/* Non-Isoc */
		len =3D urb->actual_length;

	if (urb->num_sgs =3D=3D 0) {
		if (copy_to_user(userbuffer, urb->transfer_buffer, len))
			return -EFAULT;
		return 0;
	}
	...
}

That still reads past urb->transfer_buffer (or copies uninitialized
scatterlist buffers when urb->num_sgs > 0) and triggers the same usercopy
check. Similarly, for an OUT URB, usbip_recv_xbuff() returns 0 immediately =
on
usb_pipeout(urb->pipe), leaving an oversized or negative rpdu->actual_length
unchecked in urb->actual_length.

Should vhci_recv_ret_submit() (or usbip_recv_xbuff()) validate that
rpdu->actual_length >=3D 0 and urb->actual_length <=3D urb->transfer_buffer=
_length
for both IN and OUT URBs before giving the URB back?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/aurLXADfuLjs-dm-@gr=
iffin.linux.hr?part=3D1
