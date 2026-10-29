Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285217;
	b=CTLG0i7ILSbp2IqvNseKK2HkIx4nRzizzNP2ZXkhZ/AoQlw1xeEC0xuorOHgaR2kMvTW
	 D6q9WGwtSTCiqFEMvjAOR7Fn36LbFW5ywrsGgGEv4cgQCPULe2yswqF/0dVuAIqre0SBD
	 pfpbtWDp5XZL/VzyikBzqU9Bs5mmxzfIGkHgccKMLaEQC8FewBDZPr9YdNBOQ2HGncYLv
	 hLVWXVmXmBQ9IoCW2fvVXbz9UXZkad4Aaq0SPa0qUWDqFmrLWJIfMoV2LRObbWtBcKAoQ
	 qUsTtm0j7GSvFN4LM7oGxLn/sucHkpm3VdwPSciDDGgS818JoOSslgznuBWf5m/WYPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285217;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eOalXBmeY0Zd6CC+36oTcvrpoNKH1iYj7c6qtAJNytA=;
	b=wk7HPnCAvPi2x0Hwhxt17aSqyOGPdQEjQpC9KjEV8IsV4slMWvsRkH8KFrG6oqFFDC8t
	 Q632US6O93bfI7mXtKiN7kKBp93oIskdAqkrLJEjCbA4BSDh6SNVqzDIewTZLIivsSfR2
	 0XgBkNcHZnKDwmDHYl08aRiAagmOn9XcUnnAtWqwSNhqh4GYDecMy0QFaCpt9rIA9isxI
	 9/Fek21TJDTkZioaq2ID3piyHgS79xZGWmiNUMOlIWsExY8lSgjTJdx1y+0ovYdUce+95
	 K5NERaaE7ai83dENqt0jsTys9bGWYGK3n80WbJU57J18h2rnJRpMdVNy4LuPzcmuTog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBzpro4X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE7F606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBzpro4X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8801F01825;
	Thu, 29 Oct 2026 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793285216;
	bh=eOalXBmeY0Zd6CC+36oTcvrpoNKH1iYj7c6qtAJNytA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MBzpro4X/8ADxtdnj5aWePsJX4cf4ogRdrTqHEPe9JgAUPu2aXcsXfWQQy8hgNrpo
	 R48bUMiYonxSGLe3X33Q/UQpkOtxDx/FH45iDj3CKUJ/p/uxlhzGaJh3IinbrkLBjh
	 iaq8OyX47EvVpqHEuN4Fnx0mPXZWhsmLVvIjou6vb27yL6jp0jtb4c4wxxPLtNp7fv
	 y1LKXXbg+xmjqf4Fw627v0DGmhyoZ2eJqcDh15JdorXGTB/CCBJt4YkD5b/bSrY+J1
	 OW1STXLL2k87W3n0ofxL5PTRl+YG5NdPRjvYR03MB6NsUbJ54jFfG5mj2UywFQ7cgD
	 Iw6kVigXevJzQ==
Message-ID: <sashiko-outbox-189547@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: usbfs: clamp the copied length to
 transfer_buffer_length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cheng Yongkang" <teel4res@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179328314074.648427.8187049654053191605@gmail.com>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.8187049654053191605@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:46:56 +0000
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
- [Medium] usb: usbfs: unclamped urb->actual_length reported in processcomp=
l()
--

commit c0187fb6be71954b8fdc91f54fa38ce341728b34
Author: Cheng Yongkang <teel4res@gmail.com>

usb: usbfs: clamp the copied length to transfer_buffer_length

This commit clamps the local copy length in copy_urb_data_to_user() to
urb->transfer_buffer_length for non-isochronous URBs so that an HCD or
usbip peer reporting urb->actual_length larger than the transfer buffer
does not trigger an out-of-bounds read during copy_to_user().

> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb94254809..9554b6a87a1f6 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -557,10 +557,13 @@ static int copy_urb_data_to_user(u8 __user *userbuf=
fer, struct urb *urb)
>  {
>  	unsigned i, len, size;
> =20
> -	if (urb->number_of_packets > 0)		/* Isochronous */
> +	if (urb->number_of_packets > 0) {	/* Isochronous */
>  		len =3D urb->transfer_buffer_length;
> -	else					/* Non-Isoc */
> +	} else {				/* Non-Isoc */
>  		len =3D urb->actual_length;
> +		if (len > urb->transfer_buffer_length)
> +			len =3D urb->transfer_buffer_length;
> +	}

[Severity: Medium]
Should urb->actual_length itself be clamped (for example on completion in
async_completed()), rather than only clamping the local len variable in
copy_urb_data_to_user()?

When a non-isochronous URB submitted via USBDEVFS_SUBMITURB completes with
urb->actual_length > urb->transfer_buffer_length and is reaped via
USBDEVFS_REAPURB or USBDEVFS_REAPURBNDELAY, copy_urb_data_to_user() copies
at most urb->transfer_buffer_length bytes into the user buffer, but
processcompl() and processcompl_compat() then report the unclamped
urb->actual_length to userspace:

drivers/usb/core/devio.c:processcompl() {
	if (as->userbuffer && urb->actual_length) {
		if (copy_urb_data_to_user(as->userbuffer, urb))
			goto err_out;
	}
	if (put_user(as->status, &userurb->status))
		goto err_out;
	if (put_user(urb->actual_length, &userurb->actual_length))
		goto err_out;
}

drivers/usb/core/devio.c:processcompl_compat() {
	if (as->userbuffer && urb->actual_length) {
		if (copy_urb_data_to_user(as->userbuffer, urb))
			return -EFAULT;
	}
	if (put_user(as->status, &userurb->status))
		return -EFAULT;
	if (put_user(urb->actual_length, &userurb->actual_length))
		return -EFAULT;
}

This tells userspace that userurb->actual_length bytes were transferred
when only urb->transfer_buffer_length bytes were copied into userurb->buffe=
r,
which can cause userspace callers to read uninitialized or out-of-bounds
memory.

In addition, before the URB is reaped, async_completed() passes the
unclamped urb->actual_length to snoop_urb_data():

drivers/usb/core/devio.c:async_completed() {
	snoop_urb(urb->dev, as->userurb, urb->pipe, urb->actual_length,
			as->status, COMPLETE, NULL, 0);
	if (usb_urb_dir_in(urb))
		snoop_urb_data(urb, urb->actual_length);
}

When usbfs_snoop is enabled, can snoop_urb_data() still read past the end
of urb->transfer_buffer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179328314073.648427=
.8311262845412746237@gmail.com?part=3D2
