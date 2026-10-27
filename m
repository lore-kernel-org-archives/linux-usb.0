Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114538;
	b=PFqDtGgMbqSdjVNfH/BSMb20T6X1bGeer+hQU0mp5Gm3dRPauAg3CtYuGR7BP6qk5eZw
	 ckQBCJ2nz5QM8OZ45rZOf0pd6Y9lcNTlCZ/sTtiofe0xemhAvkCJ/mD1TBep6deEwphoy
	 4PS7F9DJbbXLXMg4lyiEqEEdB3lCbjZ/9Vac24az0gYxcJGebw++cFJjAKmmZCtM6dJr9
	 U8/BZ+M9snSJkCFFAo91O4vY5/0lt82fHOvHlyah4ejnS2iYlju8dFpCxKZH0bK/ep6AP
	 CKfyta1FFPVX1EICTTgeHkV+Z1X7IVtGGm9H1SxrPjpQ3wOF53kQc3SfAo1nnZBiYyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114538;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KqHmrjDb1P29EDBgr+jWsNegi4uo5r5f+4x0zqmiKgA=;
	b=vE1tGLaZnOqSmvgOck+nDSkl1XGh9zqz45D08hbyVd/qomtL8S+f+7by9+A7DPj31uJm
	 s434XuEpZYeb1h9+SEf2+Wpzgtm3ho0b9NA2kAL6gv5gLerywpyNnVL9Juf1R15Jrh+Kx
	 SUSbNoLGxzi1MwtPJS8Qf2R1OiYdTzeygO8IGgD50aH+qxfBqb4h0KERuIteAbNqn4cXM
	 wypHtHZczSBf+NZCMLudS4uLiKhqL9o0tnd419F6FQl+5ZC9MX6CZ5j9kqpW82PuMpQsw
	 JWCCDFuS55ZLd4Cb3WbvOyb9u3wHpB2kVxQhtsXh6Lj//t/gmhOImJxhMPsa9MAleiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6wUUFEl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D8C606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6wUUFEl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622971F01825;
	Tue, 27 Oct 2026 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114537;
	bh=KqHmrjDb1P29EDBgr+jWsNegi4uo5r5f+4x0zqmiKgA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=d6wUUFElLEO1LTly4V6u+NdrZyDxHOBEecQe6uHCoZLE5k1lO8fi0BuNtA0iI6hpq
	 dNc9axwcfw326bbVn7s3PnTwQqEnOFRHiedDh4U+MyGW9F0W2KreoK8dSR9fUgAGgf
	 ghU77hdG3GBGO/33oNFjFB0j5DtjyREDHSnlZujqAA2J47u0oEPIEe5Rb2jEidqypa
	 Zmqp5T3uJPLnXZTYs0btyA68U9GHcYkBZNltRNjp03by67y1o29I1NbV5yydtwdmXn
	 kbENrJlclKHYIq8EoZzt58o0bZ9VAtFi1tXOVXHf/tJ2PJyxENUg5d0WWrfpi6BH+/
	 GJVLXcixjoBig==
Message-ID: <sashiko-outbox-186826@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/19] usb: gadget: uvc: fix oops on a premature
 STREAMON
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-8-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-8-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:22:16 +0000
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
- [High] usb: gadget: uvc: racy and incomplete ep->desc check in uvcg_video=
_enable()
--

commit c0162971ecaec9497fd415372ef37c6e328eefc7
Author: Josef Bacik <josef@toxicpanda.com>

usb: gadget: uvc: fix oops on a premature STREAMON

This commit adds a NULL check on video->ep->desc in uvcg_video_enable() to
return -ENODEV if userspace issues VIDIOC_STREAMON before the host has
selected the streaming alternate setting.

> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget=
/function/uvc_video.c
> index 9ba09118bb74a..2a56536c34817 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -770,6 +770,10 @@ int uvcg_video_enable(struct uvc_video *video)
>  		return -ENODEV;
>  	}
> =20
> +	/* Set while the host has selected the streaming alternate setting. */
> +	if (!video->ep->desc)
> +		return -ENODEV;

[Severity: High]
Is checking video->ep->desc without synchronization sufficient here to prev=
ent
races and ensure the endpoint is ready for streaming?

uvc_v4l2_streamon() -> uvcg_video_enable() runs in process context holding
only video->mutex, whereas uvc_function_set_alt() and uvc_function_disable()
in drivers/usb/gadget/function/f_uvc.c run under cdev->lock without
video->mutex:

drivers/usb/gadget/function/f_uvc.c:uvc_function_disable() {
	...
	uvc->state =3D UVC_STATE_DISCONNECTED;

	usb_ep_disable(uvc->video.ep);
	...
}

drivers/usb/gadget/function/f_uvc.c:uvc_function_set_alt() {
	...
		usb_ep_disable(uvc->video.ep);

		ret =3D config_ep_by_speed(f->config->cdev->gadget,
				&(uvc->func), uvc->video.ep);
		if (ret)
			return ret;
		usb_ep_enable(uvc->video.ep);

		uvc->video.max_req_size =3D uvc->video.ep->maxpacket
			* max_t(unsigned int, uvc->video.ep->maxburst, 1)
			* (uvc->video.ep->mult);
	...
}

After uvcg_video_enable() checks video->ep->desc and calls
uvcg_queue_enable(), uvc_video_alloc_requests() -> uvc_video_prep_requests()
in drivers/usb/gadget/function/uvc_video.c reloads and dereferences
video->ep->desc again:

drivers/usb/gadget/function/uvc_video.c:uvc_video_prep_requests() {
	...
	max_req_size =3D video->max_req_size;

	if (!usb_endpoint_xfer_isoc(video->ep->desc)) {
		video->req_size =3D max_req_size;
		video->reqs_per_frame =3D video->uvc_num_requests =3D
			DIV_ROUND_UP(video->imagesize, max_req_size);

		return;
	}

	interval_duration =3D 1 << (video->ep->desc->bInterval - 1);
	...
}

Could this leave several issues open:

1. If uvc_function_disable() or uvc_function_set_alt() calls
   usb_ep_disable(uvc->video.ep) between the check in uvcg_video_enable() a=
nd
   uvc_video_prep_requests(), can a UDC driver that clears ep->desc on disa=
ble
   (such as dwc3) still trigger a NULL pointer dereference in
   uvc_video_prep_requests()?

2. In uvc_function_set_alt(), config_ep_by_speed() sets uvc->video.ep->desc
   before usb_ep_enable() and before uvc->video.max_req_size is calculated
   (and config_ep_by_speed_and_alt() can also fail after assigning _ep->des=
c).
   If a premature streamon runs in that window while video->max_req_size is
   still 0, can uvc_video_prep_requests() divide by zero on bulk endpoints =
or
   leave video->req_size as 0 (underflowing video->req_size -
   UVCG_REQUEST_HEADER_LEN in uvc_video_alloc_requests()) on isochronous
   endpoints?

3. Since usb_ep_disable() in drivers/usb/gadget/udc/core.c only clears
   ep->enabled and several UDC drivers (such as dwc2 and cdnsp) do not clear
   ep->desc in their disable callback, won't video->ep->desc remain non-NULL
   after streamoff or disconnect on those controllers, allowing a subsequent
   premature streamon to bypass this check and set uvc->state to
   UVC_STATE_STREAMING while the endpoint is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D8
