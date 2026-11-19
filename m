Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089289;
	b=QR5PQYU5HPYJkmZCRSRsKTNG8Gjv8Sejs3mxFkoyQj2Jjx948teVFzOC4eMiYBa+nHTJ
	 5gvpzZ0kxTYsbd5VzIWPWjUvqhvNkmjRxcz0ULeBkqLrUdxBQArjujxDLZ+P8vQ7vjdQ/
	 hMtrFW2QwN+yp9zbCnK0N494mVm83hapdeSeRndckqcQENfb6oFl/GCgNmzi3kZYGIotP
	 S/OFn9ORISt21XJn2VBd1b7/mkWOwiFwSsjWmYZJMJLxG6nzD2kBK992M/xVjspzuAws0
	 9Bf/VPr8HpBU4TWa2gOI670S7OR7GEDWCm3FDiFyEtocRM+Ap5C1M16n0ujd+BFLYIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089289;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5nqCaQKHydCiCBvvtBqGFGNAImhuCB5oRGCfAmr7x+M=;
	b=ZeWo5sLBy74QeIxiScV0hCDYX2Ll/uOiK7M2B6c8rudMKKDlupvFdpSTE8v7PpUGeu0N
	 soJ4m3+wQzcQwGsm1pN93cgmQunjoOlcZUWpaWQreYffN+ZIXExQvRVqNdsfnI6J1bvUS
	 HUTI5NKO6Of2BDwVPAhAM4UY0NH4Xa9C65lhSnG7uJL5FYk4UtRKUIc3Xd0aVVLZ3yxG0
	 ArO24xqu9alydx+L+9ekicp4WcaEC1hhNwbMFpVxEtIK8A9V3AEbB14zxOBig1aYg7u+b
	 j3HcLAT/VJ4aE85etuJ4Mjnvj1Cf3EfUrYurltlMI97sMVRVghZj7zEdZgSt+22kFkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iRWCv8JA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417E606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iRWCv8JA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E861F000C4;
	Thu, 19 Nov 2026 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089289;
	bh=5nqCaQKHydCiCBvvtBqGFGNAImhuCB5oRGCfAmr7x+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iRWCv8JAnAeOXJia5wXnnXUOYUtitlJfQwVN/uQnaSIUTAl7ltfGwKFjN5DNMI09L
	 BW3BNNKsFwZucEI0IacTaPNTVMPvKKNpeByEv5nrXka8uwC0EWqO09ozZ5FSfn4CDv
	 fYGaLryxiHPHrN339vA24lcwAsoTii0+ADO/pnTp3Z1WT6vmS3s+Ubca1IIERcPgjn
	 5yDU7ZztLdhYN+56tA3d7umF3XMn7Z+Pblq1Y0LfkZZ1j5ROLxtqeEq9vaY2i1yDRR
	 NevhH7sGrgatrzpOJae1csrMa+Bu6kSYu5U+k8iHXztWPX6I416BWMWS12NxWzaFU5
	 cEIvbeQx4bKhA==
Message-ID: <sashiko-outbox-223067@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS
 ASM2142
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yasunobu Sakashita" <hi@yasunobu.dev>
Cc: linux-usb@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
References: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 11:54:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: uvcvideo: uvc_streamcam_batch_unlink() skips suspend
  and over-scopes IDs
--

commit f1a098ca74da80c22f81d063591bc26d9db211f8
Author: Yasunobu Sakashita <hi@yasunobu.dev>

media: uvcvideo: Batch StreamCam unlinks on ASUS ASM2142

This commit batches URB unlinks before waiting in uvc_video_stop_transfer()
when stopping a Logitech StreamCam attached to an ASMedia ASM2142 xHCI
controller on an ASUS PRIME Z270-A motherboard.

> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index a92a986ab714b..0ee5a7d175032 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
[ ... ]
> @@ -1885,6 +1886,26 @@ static int uvc_alloc_urb_buffers(struct uvc_stream=
ing *stream,
>  	return 0;
>  }
> =20
> +static bool uvc_streamcam_batch_unlink(const struct uvc_streaming *strea=
m)
> +{
> +	const struct usb_device *udev =3D stream->dev->udev;
> +	struct device *controller =3D udev->bus->controller;
> +	const struct pci_dev *pdev;
> +
> +	if (stream->frozen || udev->state !=3D USB_STATE_CONFIGURED ||
> +	    udev->speed !=3D USB_SPEED_SUPER ||
> +	    le16_to_cpu(udev->descriptor.idVendor) !=3D 0x046d ||
> +	    le16_to_cpu(udev->descriptor.idProduct) !=3D 0x0893 ||
> +	    !controller || !dev_is_pci(controller))
> +		return false;
> +
> +	pdev =3D to_pci_dev(controller);
> +	return pdev->vendor =3D=3D PCI_VENDOR_ID_ASMEDIA &&
> +	       pdev->device =3D=3D 0x2142 &&
> +	       pdev->subsystem_vendor =3D=3D PCI_VENDOR_ID_ASUSTEK &&
> +	       pdev->subsystem_device =3D=3D 0x8732 && pdev->revision =3D=3D 0;
> +}
> +
>  /*
>   * Uninitialize isochronous/bulk URBs and free transfer buffers.
>   */
> @@ -1896,12 +1917,24 @@ static void uvc_video_stop_transfer(struct uvc_st=
reaming *stream,
>  	uvc_video_stats_stop(stream);
> =20
>  	/*
> -	 * We must poison the URBs rather than kill them to ensure that even
> -	 * after the completion handler returns, any asynchronous workqueues
> -	 * will be prevented from resubmitting the URBs.
> +	 * URBs must stay blocked until the workqueue has been flushed.
> +	 * A completion handler can leave work that tries to resubmit an URB.
>  	 */
> -	for_each_uvc_urb(uvc_urb, stream)
> -		usb_poison_urb(uvc_urb->urb);
> +	if (uvc_streamcam_batch_unlink(stream)) {
> +		/*
> +		 * usb_block_urb() keeps URBs blocked after usb_kill_urb().
> +		 * Queue unlinks together so xHCI can coalesce them.
> +		 */
> +		for_each_uvc_urb(uvc_urb, stream)
> +			usb_block_urb(uvc_urb->urb);
> +		for_each_uvc_urb(uvc_urb, stream)
> +			usb_unlink_urb(uvc_urb->urb);
> +		for_each_uvc_urb(uvc_urb, stream)
> +			usb_kill_urb(uvc_urb->urb);
> +	} else {
> +		for_each_uvc_urb(uvc_urb, stream)
> +			usb_poison_urb(uvc_urb->urb);
> +	}

[Severity: Medium]
Does checking stream->frozen in uvc_streamcam_batch_unlink() leave the
suspend path exposed to the same xHCI halt?

uvc_video_suspend() sets stream->frozen =3D 1 immediately before calling
uvc_video_stop_transfer(), so suspending while streaming falls back to the
unbatched usb_poison_urb() loop.  Also, restricting this to a single USB
device ID and motherboard PCI subsystem ID leaves the ASM2142 host
controller exposed on other boards and cameras.

In uvc_video_complete(), stream->frozen is currently checked only for
-ENOENT before falling through to -ECONNRESET:

drivers/media/usb/uvc/uvc_video.c:uvc_video_complete() {
	...
	case -ENOENT:		/* usb_poison_urb() called. */
		if (stream->frozen)
			return;
		fallthrough;
	case -ECONNRESET:	/* usb_unlink_urb() called. */
	...
}

If uvc_video_complete() checks stream->frozen for both -ENOENT and
-ECONNRESET, uvc_video_stop_transfer() can block, unlink, and poison all
URBs unconditionally without PCI or USB ID checks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-streamcam-=
batched-unlink-v1-1-076bc02866c1@yasunobu.dev?part=3D1
