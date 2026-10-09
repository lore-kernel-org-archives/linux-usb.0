Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3FE442FB6
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550022; cv=none; b=ocCgabt4pc5aFT5Jv9BlCqjXzKXpqmhXdtC/cG8JNc7xTR15gQxxbvdrvYa4b5On2S7qJHPeZDhtSXunRY0LTICjWgDAXsNkL4ye+zkKILqYAqVqjql70VfMxcgGNWxlGgkjg0PHCt3JT4cln8x/Y5nUWuAui8++Bzz5pNJYilI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550022; c=relaxed/simple;
	bh=0aIe3lTfe3+Im0ae7uGsZyjead0ysU/CuWPipcl+hGo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ESV7KapdPhNHsYfMNVOLkVRom8iOgY4TOihWji+Oqt6WScaVHPReNpRJz3iOz4NX1PIZlDjXfnRVayHmoYMXXqxW8dXoX6aaZWHez8AI9n+gP1Mj5aS1ptdb8xuH6yPmyDuIWbgQX/f4WNA0um/Z6ZLgbTh1oTK+hGMtl4MBGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+ya0RGO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+ya0RGO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA23F1F000FF;
	Fri,  9 Oct 2026 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791550015;
	bh=FcPR8omWDjhEWlFPSIwejW2r4c3P/527HTZ3XLPntM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C+ya0RGOQogL2J6ycCBWfxwiHaGFEQ0tVvKtbNLegkTuuMBx3MURGzkgU/uHzKH9s
	 7YqDM8g2XKBkDluarvaI1fn8oksLuYUF/TKIMOoHafE4UVXc4OyKgObJf99qvzr8FX
	 raLWGu8yfvIUoTqANjJrEaRE0zxpUmAZk+uT9PBMtZRrjbTNtFZdcxuqTxYleliaDp
	 L9zWVNcPhOONl9oIWoBiwQDY5egTZ058uU2JiFAOw08huQrayY8Qz77XgBFY43qtE5
	 kcoAkI2rUoFbjLcsH4rUvnasvW3bxocAhGjI8L9GazY7BCX+K2ATyg7CAat/tLak4f
	 5hX0lsKeJMbtA==
Message-ID: <sashiko-outbox-165560@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: clear actual length after receive failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sung Byeongchan" <tjdqudcks0424@naver.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009122636.642575-1-tjdqudcks0424@naver.com>
References: <20261009122636.642575-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:46:55 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usbip: incomplete fix for OOB read due to signedness bug in usbip_=
recv_xbuff
--

commit ba9987eb570270d32daa1e8937dfdcfa997cbe46
Author: Sung Byeongchan <tjdqudcks0424@naver.com>

usbip: clear actual length after receive failure

Clear actual_length when receiving the transfer buffer fails. No payload
is valid on this error path, and zero prevents downstream consumers from
reusing the rejected extent.

> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c898375..741107a964660 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -79,6 +79,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vd=
ev,
>  	/* recv transfer buffer */
>  	if (usbip_recv_xbuff(ud, urb) < 0) {
>  		urb->status =3D -EPROTO;
> +		urb->actual_length =3D 0;

[Severity: High]
Does this completely prevent the out-of-bounds read if a malicious USB/IP
server provides a high-bit length like 0x80000000?

Looking at usbip_recv_xbuff() in drivers/usb/usbip/usbip_common.c,
urb->actual_length (which is a u32) is assigned to a signed int:

	int size;
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

Because size is a signed int, a high-bit value becomes negative, making the
(!(size > 0)) check evaluate to true. This causes usbip_recv_xbuff() to
return 0 (success) early, completely bypassing the bounds check against
urb->transfer_buffer_length.

Since usbip_recv_xbuff() falsely reports success for these high-bit values,
it appears this new mitigation will be skipped entirely. This would allow
the URB to complete with the massive actual_length intact, still triggering
the KASAN out-of-bounds read in usbfs.

>  		goto error;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009122636.6425=
75-1-tjdqudcks0424@naver.com?part=3D1
