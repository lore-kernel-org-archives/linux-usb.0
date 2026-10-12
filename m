Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6CB157A5A
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 03:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791777377; cv=none; b=Wak38rJUTad5PW17d3jM/XQ53cNX1uDwUdirAcaq2oyXckjvRWWQ2kA7KCVF91f2JzstKpd6LGbyEZkrbe8djqJzqtRAHsyHR9d7iRs5x8Ayo+mt5j4d/T7RhwXbb2RgOy7zUZv5nkjmr+dJNSFkZ+qX/DeWN9byY1xIYmbq0r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791777377; c=relaxed/simple;
	bh=vTLgdwwuKTu7cKCTDTkyEwrHOZx44RsnvdBWtlgIS7I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=rZuz8hm+BZC/Dcg8AxpOpXAwF1i5YdSOzjnoSuMgIbb3LBOD6RJgfnmCPn0WTJrrbpUo9x7uG1j9/ASiaz7u9RRSianxLQvV6md58YHspDM3wJ9DwUb3JtzFbcLTWNkkUsjKvcQ4qEsiYRe9MkUk7DnAb2d2x93H3XMLwD8Lw7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aA9Y/AK4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aA9Y/AK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1681F0089B;
	Mon, 12 Oct 2026 03:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791777376;
	bh=7yxo/aEyHI98m4uNEJGMU4i/qRNvfiUIx4hTFoIhdXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aA9Y/AK4AMFMLGsGeAyrHDJpr+smS8x2bqJHdxE7ZKtbfO0T8tmBrAhQJGoOf2yvE
	 G0v4xBNG+KJxSR6ucasuREwaIoUXBqxdtzbxS2b9tTS4l93qD2X5wkeXZQPxVvzgKx
	 Ids1pFb8oGFO2hGdC5M6D4WSbhYxrH33IcXHKmSNOSYUbSCvBNsUj7yOhKe4MaIRGJ
	 CzvCcJmZrmBcviWsaCDnyo+lAeou09UV1zLBCphw9IihGZTCk81cO16nHCGq8eEOud
	 o9gYlcLiP09VQMP6WNM4AHhR/DOK+7xBigctxpLteMKjCzlXxs9Na13uBMCzW/nS7Y
	 eDaPPJYs8nICw==
Message-ID: <sashiko-outbox-167587@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: reserve frame interval headroom for
 the zero length backlog
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daehwan Jung" <dh10.jung@samsung.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012034018.3193146-1-dh10.jung@samsung.com>
References: <CGME20261012034422epcas2p486b38818b542d2fff5b5fed58863ec6e@epcas2p4.samsung.com>
 <20261012034018.3193146-1-dh10.jung@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 03:56:15 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: gadget: uvc: Divide by zero in uvc_video_prep_requests()
- [High] usb: gadget: uvc: NULL pointer dereference if sg_alloc_table fails
--

commit 405aa67c114665f2574cee699b4f2eabe9b5de64
Author: Daehwan Jung <dh10.jung@samsung.com>

usb: gadget: uvc: reserve frame interval headroom for the zero length backl=
og

This commit modifies uvc_video_prep_requests() to reserve frame interval
headroom for zero length backlog requests. It achieves this by subtracting
headroom from nreq to ensure the processing budget can be met.

> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget=
/function/uvc_video.c
> index 9ba09118bb74a..90882c88ddc6a 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -521,6 +521,20 @@ uvc_video_prep_requests(struct uvc_video *video)
> =20
>  	nreq =3D DIV_ROUND_UP(video->interval, interval_duration);
> =20
> +	/*
> +	 * Not all of those intervals can carry payload: the zero length
> +	 * requests uvcg_video_hw_submit() queues while it waits for a buffer
> +	 * have to drain first, and uvc_buffer_prepare() splits a buffer into
> +	 * exactly reqs_per_frame requests regardless. Reserve them, unless
> +	 * that would claim more than half of the frame interval - a frame
> +	 * interval that short cannot absorb the backlog either way, and
> +	 * nreq - headroom would underflow.
> +	 */
> +	headroom =3D max_t(unsigned int, nreq / UVCG_REQ_HEADROOM_FRACT,
> +			 UVCG_REQ_HEADROOM_COUNT);
> +	if (nreq > 2 * headroom)
> +		nreq -=3D headroom;
> +
>  	header_size =3D nreq * UVCG_REQUEST_HEADER_LEN;
> =20
>  	req_size =3D DIV_ROUND_UP(video->imagesize + header_size, nreq);

[Severity: High]
Does this code trigger a divide by zero if video->interval is 0?

Userspace can set a timeperframe numerator of 0 via VIDIOC_S_PARM, which
uvc_v4l2_s_parm() converts without bounds checking:

drivers/usb/gadget/function/uvc_v4l2.c:uvc_v4l2_s_parm() {
    ...
    video->interval =3D v4l2_fraction_to_interval(timeperframe.numerator,
                                                timeperframe.denominator);
    ...
}

If video->interval is 0, nreq will evaluate to 0 in uvc_video_prep_requests=
().
Since 0 > 2 * headroom evaluates to false, nreq remains 0. The subsequent
DIV_ROUND_UP() calculation will then attempt to divide by zero, causing a
kernel panic.

[Severity: High]
Can uvc_video_encode_isoc_sg() oops if sg_alloc_table() fails?

In uvc_video_alloc_requests(), the return value of sg_alloc_table() is
unchecked:

drivers/usb/gadget/function/uvc_video.c:uvc_video_alloc_requests() {
    ...
    sg_alloc_table(&ureq->sgt,
                   DIV_ROUND_UP(video->req_size - UVCG_REQUEST_HEADER_LEN,
                                PAGE_SIZE) + 2, GFP_KERNEL);
    ...
}

If the allocation fails, ureq->sgt.sgl remains NULL and nents is 0, but the
request is incorrectly considered valid and placed on the free list.

When queuing video buffers with video->queue.use_sg active, this request
will be used by uvc_video_encode_isoc_sg():

drivers/usb/gadget/function/uvc_video.c:uvc_video_encode_isoc_sg() {
    ...
    sg =3D ureq->sgt.sgl;
    sg_init_table(sg, ureq->sgt.nents);
    ...
}

This calls sg_init_table(NULL, 0), which eventually invokes
sg_mark_end(&sgl[nents - 1]). With nents =3D 0, this results in an
out-of-bounds dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012034018.3193=
146-1-dh10.jung@samsung.com?part=3D1
