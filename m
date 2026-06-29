Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DCC3BBFCC
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782752138; cv=none; b=Y2C9jB2UMmpjLwXlzLqYCKSRoi9FAxcnkgXCmqYt5zqUcEX4YiH3QOWXtUTpPlhOWbDMAcg/tJsq5xiqotupyqaRRTW50LdpXD2HthpWcX0+cQNw/U2Gz/AQyxTwn2ZpwgRNcEoN+CAhM99foKPf7d0V2hoOjefz0H+SgSwZ6v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782752138; c=relaxed/simple;
	bh=kbPAf7YpLlZc5bzQbQF1PRE1ySCgi10wVxvekKvTY/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrZMaWRHcsu/r6JVdM8sA1swM27U2iTES+CaITbU25pr2DCneeRwUXKLF6txrQ4er6AcFzzEONQP2iErj3bE3E1oEIWTSwjXMS1xbe4w/NeOb8ur4/F1f04NpyRKOW9lWvdnpgB4s03w1vq1AcBUz2zx253tx8P2z0g95FeiIGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fCzB1CeB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fCzB1CeB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697bd41a4ecso4413053a12.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782752136; x=1783356936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdDvT+dlGC0xvYRdpBwl1fNLEwC7/L1F2NnN+5tRd2g=;
        b=fCzB1CeBqQ/YyWuonC0oM6zVvHBeXif5KAXzjZD257QtrC20QInL55Gvn4uTHWviug
         sTQu8LzZ0LXPZLfJMs4leNwuX110KMYB7B2c0TbKOs3+MHUR2i5tMEGbTJBcMuBHPsdR
         t3BEuXPGGnUQx45JpMsrPkWlJRbqvcZCMphjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782752136; x=1783356936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VdDvT+dlGC0xvYRdpBwl1fNLEwC7/L1F2NnN+5tRd2g=;
        b=BVLPE6hK+35EK466Rodzz9NXMr5sEE1AKIHnkBA5aKWbCU2EPcw8lKgT0BX4AFCXjZ
         ptSt4rHWx5sY8Piri43PWU781K5fYsG9g0rC/LlCknk2wtTC/heaMSAsME0YCfZzpVUe
         JcPpGEBK7aNbQgu5G3ceHEPkiapvCQ/lFi2IYM9/t5/H68S+kz4mUmmc82jqBBtqf+uP
         rLMm6hAIrIKAIAqiQB+JI7156d5W89J9WjfXW3Z/lpNIhZmkTqAGrDuFkxoZQgk1LRRP
         UT9wuNus60pUpezo1K0u6W/w04zH/x/mzS8fWJd9nLKGt/Tgty65kcGLVNeos2zAgUuQ
         ha2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqHLdZpe3Yo4rO1yv6fF8E12UaSOa4EFjAEnRqFFooRn84vIeuS+cdgw6eBXkpbl9YqtE3tDKRmYA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQvtgyGh08BZJ2HO3JpqRvXwSnZBTHozjy6ipxwFFfdUoaites
	AWRG0OdN6jplzaZP5xtB36iFgY15DzkhesqHZ8ocDyPMZySyK32f25bM733D4rGpeHk4XjPAHaS
	F/jPllH61
X-Gm-Gg: AfdE7ckdgYvljw7+OPXjnPl+GIuByAeUzrJsj4wMZcnH4HKE1F85YUxH6D4yQxUqLMS
	15IGA6QJOmQm5TJABQEswWjAF3g7LtBnyodmNoQbQVi1ws871iLlDLLx8WXFTNubdO1z0ai5m43
	RPHlwX2P/9FiK3vsWp2f/7qF7dMEYvdXvTsbkFSrFyTn/pDrGwAOtx61y7xffLV87gSE5xMhhY5
	pwdhpVHwyBDla4QggzwzAR92cSzIyfdkFXsU18EJikzYVo+nERReb+d1abmMjyg19UH6KmIxT9Y
	H8WhU33jvuROZCx4O7eWClp67UPJ/BB+pO7yCc3OJD+uTV7DNw563Yw8eStXrDuljzof1OxEiPY
	nz2xPjOxLErEst6GEz1f+1Gxefac9IbSLHfORWHQtPC4TvwGFN9xwo1GSca84UXcbkcouW2w6z/
	wdCkUMR6LVHocNIoh5FF4l79Oiw2c3H8nhRpMri2itJJWvS+yPVA==
X-Received: by 2002:a17:907:db03:b0:c12:58ac:9869 with SMTP id a640c23a62f3a-c128715981bmr3919366b.9.1782752135917;
        Mon, 29 Jun 2026 09:55:35 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12269f3a01sm556343066b.1.2026.06.29.09.55.35
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:55:35 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1269e4721aso171912066b.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 09:55:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RotNgNG+dwTtzQYyl01MvOpglK904fas1h94BUNhnUzvaThyzZXwDkVO4/yGBwhRzqu9WTDz9lrgak=@vger.kernel.org
X-Received: by 2002:a17:907:6d0f:b0:c12:34ed:e102 with SMTP id
 a640c23a62f3a-c12873f3660mr1656266b.64.1782752134042; Mon, 29 Jun 2026
 09:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
In-Reply-To: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 18:55:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCviTcv6mYmE9Ha8xh7r+kEuwGUoT18sdb2J=HzTFVhLoQ@mail.gmail.com>
X-Gm-Features: AVVi8Ce_rnwLjH5DwCHFT9VtntUrxzTNKFdFGZajXWnLuw9BcGgpRG8aoTwZeVU
Message-ID: <CANiDSCviTcv6mYmE9Ha8xh7r+kEuwGUoT18sdb2J=HzTFVhLoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uvcvideo: add quirks for per-device stream
 error handling
To: =?UTF-8?Q?Pol_Fern=C3=A1ndez_Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pol

What application are you using to fetch frames? It should not process
frames with the error flag.

If you cannot fix your application, why don't you set the parameter no_prod=
 to 0

Something like:
rmmod uvcvideo
modprobe uvcvideo nodrop=3D0

Regards!

On Mon, 29 Jun 2026 at 18:38, Pol Fern=C3=A1ndez Fern=C3=A1ndez
<fernandezfernandezpol@gmail.com> wrote:
>
> The UVC_STREAM_ERR bit in the payload header signals that the device
> could not deliver a frame correctly. By default, uvcvideo delivers
> these frames to userspace with V4L2_BUF_FLAG_ERROR when uvc_no_drop_param
> is set (the default). Applications that rely on strict JPEG decoders
> (e.g. libjpeg) will display gray bands for the incomplete portion of
> the image, since libjpeg fills undecodable MCU rows with a neutral gray
> when the EOI marker is missing.
>
> Add UVC_QUIRK_DROP_STREAM_ERR to force-drop frames flagged with
> UVC_STREAM_ERR for specific devices, regardless of the uvc_no_drop_param
> module parameter. This ensures applications never receive truncated frame=
s
> from devices known to set UVC_STREAM_ERR on genuine encoding errors.
> The existing uvc_queue_to_stream() helper is used to reach the device
> quirks from within uvc_queue_buffer_complete().
>
> Additionally, uvcvideo unconditionally overrides the camera's probed
> wCompQuality with the maximum value returned by GET_MAX. For devices
> whose firmware treats wCompQuality=3D0 as an adaptive encoding mode (wher=
e
> the encoder adjusts quality dynamically to fit within the available USB
> bandwidth), this override increases encoding pressure and can contribute
> to UVC_STREAM_ERR events. Add UVC_QUIRK_NO_FORCE_QUALITY to preserve
> the camera's default quality value during probe negotiation.
>
> Signed-off-by: Pol Fern=C3=A1ndez Fern=C3=A1ndez <fernandezfernandezpol@g=
mail.com>
> ---
>  drivers/media/usb/uvc/uvc_queue.c | 3 ++-
>  drivers/media/usb/uvc/uvc_video.c | 3 ++-
>  drivers/media/usb/uvc/uvcvideo.h  | 2 ++
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvc=
video.h
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -81,6 +81,8 @@
>  #define UVC_QUIRK_INVALID_DEVICE_SOF   0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF         0x00020000
>  #define UVC_QUIRK_MSXU_META            0x00040000
> +#define UVC_QUIRK_DROP_STREAM_ERR      0x00080000
> +#define UVC_QUIRK_NO_FORCE_QUALITY     0x00100000
>
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED                0x00000001
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uv=
c_video.c
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -451,7 +451,8 @@ int uvc_probe_video(struct uvc_streaming *stream,
>                 if (ret < 0)
>                         goto done;
>
> -               probe->wCompQuality =3D probe_max.wCompQuality;
> +               if (!(stream->dev->quirks & UVC_QUIRK_NO_FORCE_QUALITY))
> +                       probe->wCompQuality =3D probe_max.wCompQuality;
>         }
>
>         for (i =3D 0; i < 2; ++i) {
> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uv=
c_queue.c
> index XXXXXXX..XXXXXXX 100644
> --- a/drivers/media/usb/uvc/uvc_queue.c
> +++ b/drivers/media/usb/uvc/uvc_queue.c
> @@ -357,7 +357,8 @@ static void uvc_queue_buffer_complete(struct kref *re=
f)
>         struct vb2_buffer *vb =3D &buf->buf.vb2_buf;
>         struct uvc_video_queue *queue =3D vb2_get_drv_priv(vb->vb2_queue)=
;
>
> -       if (buf->error && !uvc_no_drop_param) {
> +       if (buf->error && (!uvc_no_drop_param ||
> +           (uvc_queue_to_stream(queue)->dev->quirks & UVC_QUIRK_DROP_STR=
EAM_ERR))) {
>                 uvc_queue_buffer_requeue(queue, buf);
>                 return;
>         }
> --
> 2.43.0
>


--=20
Ricardo Ribalda
