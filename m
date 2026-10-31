Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480151;
	b=pfCwUo8TTSCZ9O0nOGnCyoUoCUSyoPwKdw78Q82pRMe/gGtuofGn2FdZclXrEupMqhJQ
	 +RBo3f6LDfI3RgfEIhOD+DrZxmzZXIc+r07BznSa0TNTSG963Zb21GPB9e/OKcppfFnmL
	 lfqHuyXWD7twuLrCc883ySSLaIHOgZ3ftWinMVoSYiwr4FCAEbld1jDJIxCOTwSEOWS2J
	 dCnhvAwPen4pZwK0Yw0LHuXgeNT/co4iGh5Wk+0ojePa72x6A8DENuc2Whub8RUNyINAd
	 Xp57XcfJhWyArE+fBg9TJ+23c5W6PWlXYNnigrT5CLj36BchQBuazPW4ayZbF3J90sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480151;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l1X1+oflMusBgppCOj6F3zHEw/laxtYiL4wKctu5gqQ=;
	b=Wj4eLacDYSZKlRGMBBl0TKibk3XTssoa7gHWqIjd7gXEMYkwqqxgb0BTLWMKqlUdWB6q
	 3KuYW8+y1LRwKYwZzyKvxCHr1/VxAb8vaCtRrReOtGPI2XHL7bAwCprwcSPjR+BUzqWhl
	 ZYRN+YERpz2xDFf19rD0kt9fm/u9Sux8QGXSCSf/rvGsb/Ma8Ky0F4ny3z6s9jG0g2BhQ
	 iwwxDj2DWpY33r2tFSyoasSSLIlrGfPoE7S8sWnB0Is6X9GHC28Q3LyHFP4NlW/8kKPW9
	 TvKU4U6zrsWx9wrsbsXncnlLhOzvnQK+UPco2Tn0OCGiGW8r57dDh4iYCVKqYJlgQcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZIr/4HSF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2266E606A31A
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 20:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIr/4HSF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7268B1F000C1;
	Sat, 31 Oct 2026 20:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480150;
	bh=l1X1+oflMusBgppCOj6F3zHEw/laxtYiL4wKctu5gqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZIr/4HSFUdEJWsbdvBa0BG7AhNPibcs9MzyZuQlsnRgStekLLfxz3noRvCyCZIm3N
	 C7o0+plq6D8kkMZ2tcNS7iUd2S2mmhzpftBEX62TTxdkVDAoij0XBlYB5K4/nTdh9S
	 8tYYnQbpyUvybddXSxg50DeSnUSQ0Sx0Yq9KWJYb9Cyz58Pg1nrgGutS3IChrLndst
	 85fHp57yYzP4i+POEZYIm88ZM+gl2ma2CB6pgz2AK+7PvOClY3bc85nv0WHr1PDMye
	 wrIBCVQu0qiU/7/ucLD2RJEVmpT79JxEMGCp40OUrWDHhaAyalVKBpnHYcW6JmRN1W
	 wGXvwfymD0cUA==
Message-ID: <sashiko-outbox-192132@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: em28xx: fix v4l2 use-after-free after failed
 init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drif Abdelmalek Mohamed Said" <drifabdelmalekmohamedsaid@gmail.com>
Cc: linux-usb@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com>
References: <20261031204723.1415-1-drifabdelmalekmohamedsaid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 20:55:49 +0000
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
- [High] media: em28xx: missing mutex_unlock() in em28xx_v4l2_fini() when v=
4l2 is NULL
--

commit 5132f3a1057e95055bbcd81d79b2a705ab167335
Author: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>

media: em28xx: fix v4l2 use-after-free after failed init

This commit fixes a use-after-free when em28xx_v4l2_init() fails after
v4l2_device_register() by clearing dev->v4l2 under dev->lock on the error
path and reading dev->v4l2 under dev->lock in em28xx_v4l2_fini().

> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/=
em28xx/em28xx-video.c
> index 84424284d4869..572e6835b851f 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2414,7 +2414,7 @@ static int em28xx_v4l2_open(struct file *filp)
>   */
>  static int em28xx_v4l2_fini(struct em28xx *dev)
>  {
> -	struct em28xx_v4l2 *v4l2 =3D dev->v4l2;
> +	struct em28xx_v4l2 *v4l2;
> =20
>  	if (dev->is_audio_only) {
>  		/* Shouldn't initialize IR for this interface */
> @@ -2426,13 +2426,15 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
>  		return 0;
>  	}
> =20
> -	if (!v4l2)
> -		return 0;
> -
>  	dev_info(&dev->intf->dev, "Closing video extension\n");
> =20
>  	mutex_lock(&dev->lock);
> =20
> +	/* matches em28xx_v4l2_init error paths */
> +	v4l2 =3D dev->v4l2;
> +	if (!v4l2)
> +		return 0;

[Severity: High]
Does this early return in em28xx_v4l2_fini() leak dev->lock when dev->v4l2
is NULL?

When em28xx_v4l2_init() fails (including the unregister_dev error path where
this patch sets dev->v4l2 =3D NULL), dev->v4l2 is NULL when em28xx_v4l2_fin=
i()
runs later during USB disconnect or module unload. Returning 0 here without
calling mutex_unlock(&dev->lock) leaves dev->lock held.

During USB disconnect in drivers/media/usb/em28xx/em28xx-cards.c,
em28xx_usb_disconnect() calls em28xx_release_resources(dev) immediately
after em28xx_close_extension(dev):

em28xx_usb_disconnect()
  em28xx_close_extension(dev)
    ops->fini(dev) -> em28xx_v4l2_fini(dev)
      mutex_lock(&dev->lock);
      if (!v4l2)
          return 0;
  em28xx_release_resources(dev)
    mutex_lock(&dev->lock);

Wouldn't this immediately self-deadlock on dev->lock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031204723.1415=
-1-drifabdelmalekmohamedsaid@gmail.com?part=3D1
