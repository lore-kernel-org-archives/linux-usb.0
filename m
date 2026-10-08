Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4752D8DC4
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467495; cv=none; b=L0PSvblNsCfDTSKDbDpIm84mjKH1NQCJg1MYxF1SsQAU8O8Jqw9d99euowvXl8ZKMyOTzaZ1Ppurw87XFLq/CgLXnN8sJE9aqthMUnAl+XQYb2yMmn4J/NYF3MEqGCzNpkWyGVOY2xnZQOf+ekBTyU06MbLnx7IwFQm6vZPVUKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467495; c=relaxed/simple;
	bh=iLOQeqqbCpKEVM8DbNE6Z7yj34Z+KCrM6Jjn86wDDK0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hgKd4g1oCvK/y9dh0NxE+fYSF1Wpfa2ENg9ZNQv7GGbyusm2cwl1sS18ibWkrEwqbBub393sUXygIrz5Pbu+yW6jrVqxOLHBnfOwLaozgbtMVcUZnQTmVNw1E0Wmm/cOos9x02lCXTluhUa/5gycZ+++B8NxD4MALPCr1COXVKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPoIDAFp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPoIDAFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643C51F000FF;
	Thu,  8 Oct 2026 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791467492;
	bh=KUGFHZMAFQKPmVJRGj9y+MK1Xwjxb/BSlN9SoDZZ/dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LPoIDAFpPUvtBpnNdtvi2+8K1UH6a2fsBRB7ss8fuiQStvkJOc8WPbsoeDnUJy0Rq
	 5WAb2xOSNCAILZpIWBqwFg0qFm8bt1b2AFS126TV0mVjPwi/nO1BQVJXhzdAHD00LJ
	 233+DpDPYRsmXwdrrjCvIkcrM+AK5wkYfn2jYQnRwAwtI6Oy2DNBdB3QXL6YPs6bR3
	 KLDyVUzyD+c4zAk4WdbKSuKfwBOj4XlFcGOfugRXUy6LlGDwy5wouE4pa0iMvTmBDX
	 P9j3R/KdrEdILsf5GRkj3FyA9yjBANHxF5OAPA+VDcaciumr56HRKCFWGQL+jXoU0M
	 Sak4u8NfxeOow==
Message-ID: <sashiko-outbox-164251@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: avoid dereferencing a missing device in receive
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sung Byeongchan" <tjdqudcks0424@naver.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008134107.265827-1-tjdqudcks0424@naver.com>
References: <20261008134107.265827-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 13:51:32 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usbip: integer signedness in usbip_recv_xbuff() allows OOB read
--

commit 02833e7622ef2723c4209138f2286c80d50e18e5
Author: Sung Byeongchan <tjdqudcks0424@naver.com>

usbip: avoid dereferencing a missing device in receive errors

This commit adds NULL checks for urb->dev across several shared receive and
ISO diagnostic paths in USB/IP. This prevents kernel crashes when a missing
device dereference occurs, such as when processing synthetic URBs built by
VUDC.

> diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_c=
ommon.c
> index 100f8920624bb..8d379a9437efa 100644
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c

[ ... ]

> @@ -891,7 +897,9 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct =
urb *urb)
>  	return ret;
> =20
>  error:
> -	dev_err(&urb->dev->dev, "recv xbuf, %d\n", ret);
> +	/* VUDC creates synthetic URBs without a struct usb_device. */
> +	if (urb->dev)
> +		dev_err(&urb->dev->dev, "recv xbuf, %d\n", ret);

[Severity: High]
Does the signedness of the size variable earlier in usbip_recv_xbuff() allow
an out-of-bounds read?

When handling the actual length, urb->actual_length (which is a u32) is
implicitly converted to a signed int:

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

If a malicious USB/IP server sends a USBIP_RET_SUBMIT packet with an
actual_length greater than 0x7FFFFFFF, size will become negative.

The check !(size > 0) will then evaluate to true, causing the function to
immediately return 0 and bypass the bounds check against
urb->transfer_buffer_length that normally jumps to this error path.

Could this allow the client driver to process the buffer using the forged
actual_length, resulting in an out-of-bounds read beyond its allocated
transfer_buffer?

>  	if (ud->side =3D=3D USBIP_STUB || ud->side =3D=3D USBIP_VUDC)
>  		usbip_event_add(ud, SDEV_EVENT_ERROR_TCP);
>  	else

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008134107.2658=
27-1-tjdqudcks0424@naver.com?part=3D1
