Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E0031B80E
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 23:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760372; cv=none; b=aAjkEhjniYIRFzBQpEGCpxwltPZSd+pvt0lykkXmkAp1ic3p21zjdoISgwHKvhY7QDPiynCSdUPJ7QUl4HKbZJY6XkGKdx5dPKRS5wdd+PkRPwGxyfqBR7DVjaucmE6Zfu/YRllkFhCUjeVepRROD+SX755zVlSDKT6fHujuV6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760372; c=relaxed/simple;
	bh=oiqejljpC0r+WZwUgtEHk+QEL0SEdtKyU3/JxT4QOkI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iz9TuqKtKT9OIx3wojiK5PQS4RAMNpCqtl9QkCzklWQOBJzZ8mBmqeSFCfAw9H+RWZeYQqJtgxdObSWLZV5ab/UbKW9bN1o9thqrk6TOewMyJlv9yCw6ANBwKpwnPEfstCiQsYewt2wWCdjMCf7WUVk21LkPxkBalU+wAT+DeIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7hmyJHK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mina86.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7hmyJHK"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c315869241fso191292266b.0
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 16:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791760369; x=1792365169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RgqrNqMtaQsL974qKMls+lDoPZ135EhOvjmIHmRaXDw=;
        b=Q7hmyJHKehtGfBlhefSATHmpyQhzqdUAYJ0fy5StXPhjC8SbJWrFbKx7uQ8RSxm2DX
         tYuXG6xqMLmeco43kId2hkMjBzFgnnNdP1xLlbgO3Gk/Jo9is2ek8RiAG9IEYUb5W/aX
         meS6ZltAbdRVZcjUAde9sev5NnbkksXrLHWktgT5zfa/OQJFw/VTq0iVLaGd7mYznygs
         ewG8iytyHd6gEJeJOCLedePLTupGR716JmlUSZUAfVNTyl/H6XOy5zRdI3yFt2CCaEka
         kbBlcZYeqklBI6bVXD1ppb3/BLmDoeKXyBXb8MY4IBXjGQNHb+MKEzbIcetMuz3jmXJ0
         qD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760369; x=1792365169;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgqrNqMtaQsL974qKMls+lDoPZ135EhOvjmIHmRaXDw=;
        b=hoi0ZmlG/Z4DtJ+m2h9Nt/47vHImRboKcTJ4Gc2hXahcM19fVlwlm6Bd+e4mpPYHAf
         fYXdaoL3MvqbrVE5M11Yic126aLVl9Cc3zNU5ZwK/RRrjIh1xYHUgkOEL7mvPTxdT4lU
         dU0Gc+Ve9DE/Y7o6L/2TFlA8OnK6vMVtJicHscmnzHqrYZrRMMnWBJCk8Xqnv39AVT/h
         Q6edggRs7zIH7s2N1rC7lDazX/iPsbK75v7mUgBmSMnJlcf91zVPQO1+qmqrLo/9bSmK
         BjMPCUPRCc+tWJs06zc0KBDVGQGyC1zj1NqKFcQ/NGRhqWme7MoJ0/WuFjjAifqWyCrB
         /81A==
X-Gm-Message-State: AFq9FYIZ0Lvc40yppX+BhaihACPmU+hkKkNZCLt6TnHqu3dFCeEblGru
	+urYvONKuLaP2j0WLQIIxZTS2bhtS2JVpmja31UaOF0eYvBaO1QVRWFI
X-Gm-Gg: AYBFou1Tpl+QtV9HUUO/juo6e8EsUbaQGEmBhdP+KHoYZnv1rPKzBRmBdfPPbyqBShq
	Nck5sWMd25NyWu+1rd6/kSFWzL49XKF1fxRTxs1OqAf7dNB9n+avn4xH6myCCOPeHqRSSem24G1
	W34H9hX8Srm3nxrfTHtvhA9VjdY0UZpDJ1zcz2nXlg02D35wNdAMCOpAYBFWpDvEOI8mE0OnKsY
	ohetU1KKN/7bKtRcbSF7rndjCT7NzlhSmURRxsR3yD/eZPHJ79+Ht6AfI8TbTysXUpJWv4lhkre
	92Rs7cEB9TwokGxbSm/L+kc1QG3n8S2XGZF00/fsxN9hEEiTvClY+4bywLx1pRmgNaJ5fmOWnVO
	o3Kz9T4CUwSQIuWI795zpog2ykQMXTsDgEQ0/7KFkOEFholTS1YWWN4xnnzKipzPa9jMaSQvh3M
	MuYAhor04p61oYXCUQNRE3pL4En/OP0k2XtWTca0liSvnrv/sJX6n1tjKTmZFZkXcQbQNCP3mrQ
	tS6lPWTKbnIBLk9N6vID5B3
X-Received: by 2002:a17:907:9620:b0:c29:5172:6151 with SMTP id a640c23a62f3a-c31aa02998amr786006666b.45.1791760369272;
        Sun, 11 Oct 2026 16:12:49 -0700 (PDT)
Received: from erwin (109241130011.warszawa.vectranet.pl. [109.241.130.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3596566d8bsm4873366b.16.2026.10.11.16.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:12:48 -0700 (PDT)
Sender: =?UTF-8?Q?Micha=C5=82_Nazarewicz?= <mnazarewicz@gmail.com>
From: =?utf-8?Q?Micha=C5=82?= Nazarewicz <mina86@mina86.com>
To: Palla Raghunath <raghunathpalla.0209@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Neill Kapron <nkapron@google.com>, Shuah Khan
 <shuah@kernel.org>, Brigham Campbell <me@brighamcampbell.com>,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 raghunathpalla.0209@gmail.com, stable@vger.kernel.org,
 syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free of ffs_dev in
 ffs_free_inst()
In-Reply-To: <20261006204202.59604-1-raghunathpalla.0209@gmail.com>
References: <20261006204202.59604-1-raghunathpalla.0209@gmail.com>
Date: Mon, 12 Oct 2026 01:12:48 +0200
Message-ID: <ebgvv59g1ly3pyekh2c8vg5v@mina86.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06 2026, Palla Raghunath wrote:
> When a function instance is removed through configfs, ffs_free_inst()
> first calls ffs_release_dev(), which takes ffs_dev_lock, detaches the
> dev from its mount and drops the lock again. Only then does it retake
> the lock and free the dev with _ffs_free_dev().

> Fixes: ecfbd7b9054b ("usb: gadget: f_fs: Fix setting of device and driver=
 data cross-references")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+6227549bd2c8a1ec8ba0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D6227549bd2c8a1ec8ba0
> Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>

Acked-by: Micha=C5=82 Nazarewicz <mina86@mina86.com>

> ---
>  drivers/usb/gadget/function/f_fs.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index c64a268e98a4..f8ea9a980605 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -288,6 +288,7 @@ static struct ffs_dev *_ffs_find_dev(const char *name=
);
>  static struct ffs_dev *_ffs_alloc_dev(void);
>  static void _ffs_free_dev(struct ffs_dev *dev);
>  static int ffs_acquire_dev(const char *dev_name, struct ffs_data *ffs_da=
ta);
> +static void _ffs_release_dev(struct ffs_dev *ffs_dev);
>  static void ffs_release_dev(struct ffs_dev *ffs_dev);
>  static int ffs_ready(struct ffs_data *ffs);
>  static void ffs_closed(struct ffs_data *ffs);
> @@ -4147,8 +4148,8 @@ static void ffs_free_inst(struct usb_function_insta=
nce *f)
>  	struct f_fs_opts *opts;
>=20=20
>  	opts =3D to_f_fs_opts(f);
> -	ffs_release_dev(opts->dev);
>  	ffs_dev_lock();
> +	_ffs_release_dev(opts->dev);
>  	_ffs_free_dev(opts->dev);
>  	ffs_dev_unlock();
>  	kfree(opts);
> @@ -4363,10 +4364,11 @@ static int ffs_acquire_dev(const char *dev_name, =
struct ffs_data *ffs_data)
>  	return ret;
>  }
>=20=20
> -static void ffs_release_dev(struct ffs_dev *ffs_dev)
> +/*
> + * Same as ffs_release_dev(), for callers that already hold ffs_dev_lock.
> + */
> +static void _ffs_release_dev(struct ffs_dev *ffs_dev)
>  {
> -	ffs_dev_lock();
> -
>  	if (ffs_dev && ffs_dev->mounted) {
>  		ffs_dev->mounted =3D false;
>  		if (ffs_dev->ffs_data) {
> @@ -4377,7 +4379,12 @@ static void ffs_release_dev(struct ffs_dev *ffs_de=
v)
>  		if (ffs_dev->ffs_release_dev_callback)
>  			ffs_dev->ffs_release_dev_callback(ffs_dev);
>  	}
> +}
>=20=20
> +static void ffs_release_dev(struct ffs_dev *ffs_dev)
> +{
> +	ffs_dev_lock();
> +	_ffs_release_dev(ffs_dev);
>  	ffs_dev_unlock();
>  }

--=20
Best regards
=E3=83=9F=E3=83=8F=E3=82=A6 =E2=80=9C=F0=9D=93=B6=F0=9D=93=B2=F0=9D=93=B7=
=F0=9D=93=AA86=E2=80=9D =E3=83=8A=E3=82=B6=E3=83=AC=E3=83=B4=E3=82=A3=E3=83=
=84
=C2=ABIf at first you don=E2=80=99t succeed, give up skydiving=C2=BB
