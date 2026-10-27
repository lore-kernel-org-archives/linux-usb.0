Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114842;
	b=bRktJB7wWzyaGWElYTTIJ01Ow8oXyJjmUnAzZMLWLKms6+l+QcuEHMz7oMqey1cejXD5
	 dCx6iT0ZQfcPTvE1iSfE/RUgpwMXCBJOnBk051VKqvJ/ZsbnAdOWCrt6MG6uBsbaBTijU
	 76dhoyvgQLdVpOBVUjMvBpTT2A/upE94PHhLP9rE22vwWxPXaEpobIL+RDa/UMsS7zYjL
	 9564aFlCVrZTr98+KzzgiXBLOHQbXoQJlQv8yet/zGsb3d2UegUzidzaiB43VYRv+X1ya
	 hblANYZVzGpTqoiFj9jhjLaH186VjQqd8EniOMDmwOFNyi0whc26LvEdpZuRzkzBDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114842;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bbNNuzAdEmh86wGrEbXvDLHEPA2wtejM0HNSF583Glo=;
	b=1rqPl5btN1vvxouwkYq2UPUag9UiCAhZMyUeM2MHtu/Ginvgr5vhz7CGsSf2jYarrjwJ
	 OW1O5nZgzDk6Hi6+O2GezeR0rTJAn2HGbBpPY3TtabZf986IYh/IuTxHcb7wQkLrK2NQF
	 4sQKZCw+RiVyZsJPxewcFp0TIO4zw3W1Biq06MEV1sC3atSrCnezbYa3bJlbW/9Idn8Ry
	 BDgM+z5AErmsxA3JMjgUrtLdzApJhxC7xEkDbJXqr4CQZG4zOUz1c9/33Hdsspk2BsBDk
	 vniQZJjm7K/Cf+Yu1Kzl5xhS+oosimuvQbsFPMbX9rK2LqxPfPLanvjiTHkOrrD3aSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T0AeXPan;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236A606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T0AeXPan
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E141F01825;
	Tue, 27 Oct 2026 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114841;
	bh=bbNNuzAdEmh86wGrEbXvDLHEPA2wtejM0HNSF583Glo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=T0AeXPanKAky1TlCq2lTqcVQ4q31lZlvCv/JXWY1syH0ePlVvg7oQoOWFq8Z9MgBt
	 mSqUNLrmmOqqD3AOR5JbduLF3CYkgWKsxJ2709l5RtOUGj0JrevP4XhqF3twuGu4rz
	 vPQ/k0Vf7VgvL2Zz8HKNiGuEykzMV7BJ5vz/1QP8ESJnR4coH6WbOhsTP3weJqge2A
	 7b+TbVIGC0uKV52T2K9qmTZwqhOz3KQqFkYU7aCYwBG1rUo+aJaZ5eDm+sRiZcBPJZ
	 5gyJd4iTC4+eCQczIH96uVrRw5OhaJXGAVTqoV+dbytBOWtr82fmih7BuFRdM8hmYZ
	 dDaQIGhh8syGw==
Message-ID: <sashiko-outbox-186834@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/19] usb: renesas_usbhs: unlink the URB if it is not
 queued
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-17-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-17-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:27:21 +0000
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
- [High] usb: renesas_usbhs: new_udev leak in usbhsh_urb_enqueue() on queue=
 push error
--

commit 3025db27a621582451ab2718c744f405f863e1c5
Author: Josef Bacik <josef@toxicpanda.com>

usb: renesas_usbhs: unlink the URB if it is not queued

This commit fixes usbhsh_urb_enqueue() to unlink the URB from its endpoint
and detach the pipe when queueing fails, preventing list corruption and pipe
use count leaks on enqueue errors.

> diff --git a/drivers/usb/renesas_usbhs/mod_host.c b/drivers/usb/renesas_u=
sbhs/mod_host.c
> index 0652525d06fec..bdec4eaf34027 100644
> --- a/drivers/usb/renesas_usbhs/mod_host.c
> +++ b/drivers/usb/renesas_usbhs/mod_host.c
> @@ -987,7 +987,7 @@ static int usbhsh_urb_enqueue(struct usb_hcd *hcd,
>  		if (!new_udev) {
>  			ret =3D -EIO;
>  			dev_err(dev, "device attach failed\n");
> -			goto usbhsh_urb_enqueue_error_not_linked;
> +			goto usbhsh_urb_enqueue_error_unlink;
>  		}
>  	}
> =20
> @@ -1020,14 +1020,22 @@ static int usbhsh_urb_enqueue(struct usb_hcd *hcd,
>  		ret =3D usbhsh_dcp_queue_push(hcd, urb, mem_flags);
>  	else
>  		ret =3D usbhsh_queue_push(hcd, urb, mem_flags);
> +	if (ret < 0) {
> +		usbhsh_pipe_detach(hpriv, usbhsh_ep_to_uep(ep));
> +		goto usbhsh_urb_enqueue_error_unlink;
> +	}
> =20
> -	return ret;
> +	return 0;
> =20
>  usbhsh_urb_enqueue_error_free_endpoint:
>  	usbhsh_endpoint_detach(hpriv, ep);
>  usbhsh_urb_enqueue_error_free_device:
>  	if (new_udev)
>  		usbhsh_device_detach(hpriv, new_udev);
> +usbhsh_urb_enqueue_error_unlink:

[Severity: High]
Can jumping directly to usbhsh_urb_enqueue_error_unlink when
usbhsh_dcp_queue_push() or usbhsh_queue_push() fails leak the newly attached
new_udev slot in hpriv->udev[] and leave a dangling pointer in
new_udev->usbv?

When the first URB is submitted to a newly connected device at address 0,
usbhsh_urb_enqueue() allocates new_udev via usbhsh_device_attach(), which
claims a slot in hpriv->udev[] and sets new_udev->usbv =3D usbv.

Next, usbhsh_endpoint_attach() attaches ep0's struct usbhsh_ep to the device
returned by usbhsh_device_get():

drivers/usb/renesas_usbhs/mod_host.c:usbhsh_device_get() {
	...
	/* if it is device0, return it */
	if (0 =3D=3D usb_pipedevice(urb->pipe))
		return usbhsh_device0(hpriv);
	...
}

Because the device is still at address 0, ep0's endpoint is linked onto
udev0 rather than new_udev.

If usbhsh_dcp_queue_push() or usbhsh_queue_push() then fails, jumping to
usbhsh_urb_enqueue_error_unlink skips usbhsh_urb_enqueue_error_free_endpoint
and usbhsh_urb_enqueue_error_free_device. When enumeration later aborts and
usbhsh_endpoint_disable() runs for ep0, it only sees udev0 and calls
usbhsh_device_detach(hpriv, udev0), which returns early without detaching
new_udev:

drivers/usb/renesas_usbhs/mod_host.c:usbhsh_device_detach() {
	...
	if (0 =3D=3D usbhsh_device_number(hpriv, udev))
		return;
	...
}

Should this error path jump to usbhsh_urb_enqueue_error_free_endpoint (which
also calls usbhsh_pipe_detach() if a pipe is attached) or otherwise ensure
new_udev is detached?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D17
