Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71EF37FF5D
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 03:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134296; cv=pass; b=gICbtLjzs5AJKq9bvPqYoxKUy5CgHYQ7ly2vg8WEJFWFa6Fob4evF4BkqYu80NzTc2J9/jXVpLGZI8pWikMT+KnsLMw8iFmY8ZOVT0EjuDGsvRe3BiAL/vgDAB0+E2N0vQEdormgC8NTBXiEsfeJJXqDY8BhMNS6EsIgk91qgn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134296; c=relaxed/simple;
	bh=kLqjJwxQBMRaJcZV6HUdDnhO8moqJR/ZPOOSCIQmbMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADmInkqC45KsF1iDv32/dOhSBH+amcAFT5zvQEuUUajpxsMSEFFRFIkCAIsYaRk7kAphHtLc35oCTjbh7T2Hcsm5tFWJWmFnI67re6vnPmKhCbsg6AyV4US4VtKzoY0GFx4Tb8XRM4YTnKLuiRDREj8wQjyml1dhboIetLL2NrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjuoPCPr; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjuoPCPr"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20a33so572248d50.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 20:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134294; cv=none;
        d=google.com; s=arc-20260327;
        b=p/V9mKIsg3ogrAr4blwpyPpkEIXF0M4Vda3ns5aPRqg7jD9nbCT0IsWaYiNDMYmKfl
         G1MF1HnsYbNjGT6j/+z8UXxeWsBkklqGggvPyTsEVtsQJ1Y31Nweh49k6VPDvSPJA95a
         21l4xu4cI2gXwz+b+bAer4Tjytv4tyYyFVnTspPRMwhVMgx0CsUUYx93WF1vTwksoIoT
         PUVb127+PGC4gy7VUSE5MWoBOZ8ChiYNrjezLsFejaz0amv/Rkr5n1uvXn/RVLxTlOSf
         /9BGiRhr91hGa8DwOmvldbGVO6xtjEe/1NInqfczWS7GEIqOLmuydV2VwooM5t/Vf53r
         Z0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GGwyAjv+0/JlwYUUu6lXLzy7ZN4zWkdGhNND/q2LGC0=;
        fh=nJcimixT1mJGHtK3cFhSq7hDiYT++667ZMtPqyEPFfQ=;
        b=DJofLipqZfeYxdj2aVJQ3dYhohJ4au6uO1GiOW4eh+B96/A3DrptLSAJgAq/P5hWbU
         n53UHa8bqtp2GIn3z21HHaoTwvw3i3fpGXOngj3EHCOIv7KHlHeNoMPyg6tpcGhiKpqV
         zpMfRgft0vaAG9e8MjtViQ4XF/MnzsKW8HPWSuWr3ZhXQV25kXHZM+t78sk4QjTbm5TU
         kBKTxT/ZYcKl3cdBr9LMw87iVnrQgBvn64qWGJPcejq8whLUBhW1u2lc/W6c0gnIxuIr
         gVUaswSKplFuVL6vmoTPw3nqATN9i6D7gwnYjD3tXZVgS8bTSeBmQNJx5XMOfTPwaVUR
         JzWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134294; x=1790739094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGwyAjv+0/JlwYUUu6lXLzy7ZN4zWkdGhNND/q2LGC0=;
        b=hjuoPCPr9P7SEA4vAkI9s1Vn3z5GmNr44tNL1ClBWIpgHP+P3fSMKH/AdbjTWGTGpd
         5q8pk+ZFUhxrMutik5xhzeHpE2ZszNks1yBVxNZEJmMcdGe/+zw8f17qK8NL+Cvb5vIs
         iaylpIznygFeVG9kF1fh1yFovLJJAWXcAWMJqy864w3B+IoM+ihUmV2Zi7QqjacdDjmY
         Bvg25d2Veb33I1X50OKiAA1tyyIgBXnwYX69v8iHm4uCUdQRZ/RP0KtkvzNImFgaCGCS
         vA7opxCrCy9QYd9u04DO7iw+Pb6a0RDCFvVugvILB91TzKzhv8okBWLeDgnjsa46G6lf
         2TEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134294; x=1790739094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGwyAjv+0/JlwYUUu6lXLzy7ZN4zWkdGhNND/q2LGC0=;
        b=VuuxeO7A/biohjMvXmZ3CbE1/kgAn3kATP+D0KWNNmd7ndgm7KNVfmgJIoZmRGL0ep
         shWE+NG5tIepZvtqFq40BCmqH8loI78CrmZceWHwx1CNao8NJGvvDd1C7N2Av3Ge/GXQ
         X7Sv5e3B0ylJDvCy07+s4wIDnPkwqueYzh7F0N1DTb1JWAXhSKWTdkJKK4mSiSG88k6S
         RHut07rkJ1t3g5XfAu1gQmSO5PtctE7I3F3sa3uwQ6HbA64/fRauW0iWbHsqTXqQSnVS
         l5SoZ0EbifZWBhwSixP+zKiWVW4pgrn+stIBca541h1t6wc9uvno5MXkroVYiC5w3DwC
         Epeg==
X-Forwarded-Encrypted: i=1; AKwUvByBx5FiWOoNzh5Pkai2xO1ZKuKjNH5dvkzCpLLB9nTaLHccbHugaKP8pNh99LtbdBC2W3QS1+QJ+OU=@vger.kernel.org
X-Gm-Message-State: AFuF++kGZohtg9BbgiKEwMDGghevufSSNoag8yjOBnH8593nrhHN45AG
	3BL/AXfhzpumyCbm6NoX19FML0poakNumPV2qspNAoFWJ27i3faAsJ+eLLP2diobMVC4vgasn27
	2EYNQ0+4NyWX68vFMhgzG3kD5wR18uHcv+q9t
X-Gm-Gg: AYBFou0dpiaKUIqyusTZ708Nf26KnSO/5sAMsTGfekEb8B5TfoRapSdpljDM/7Bc7W1
	Hd7+VzzUBjC7CXgQ66f7BnkzeE2OrKZm4z4eAy9Tuj9RiyOhrs2j+6/oOe8QH+Kx6w6sRv6GNAL
	iyBa3CFJ7TvUL6VF4xsuHeClaqHJXh1zSh72wIiwfhTbjwG9p+TFcUiQKYV21mQtTbds1O81Btg
	zObBxwS4Tkz1Kc0xq1yJyVcre1I6azT8CLLS/Jlnp9mBA6CPznusSwD9c0bN20Gzorjl+Sej/5Q
	pFKPS7+aT4xDnTYUzxjvijKLylVRdaUsUBZsWN6/6vrQBtv582jgQ2PnmpD4LpnMSDOtm5tlCj5
	mbM7sgNSwmtNSLfKcv+8xhVOABWFCIYvIKDwFBovPvco=
X-Received: by 2002:a53:b089:0:b0:671:499a:26fd with SMTP id
 956f58d0204a3-672d577b164mr476926d50.43.1790134293543; Tue, 22 Sep 2026
 20:31:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com>
In-Reply-To: <20260821114854.12218-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 09:01:22 +0530
X-Gm-Features: AcwNN1V6mUe9WdT8j-R4ug1gRy07h_eAxdnOll35Iy1koOgQkSFlHP8sS39EPFU
Message-ID: <CADhLXY7fD6jo+xzPPLTh28n9Rw-yhhKYb6ymcyT8iMUjri_GsQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: gregkh@linuxfoundation.org
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 5:19=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> u_audio_get_playback_srate() unconditionally locks and reads
> uac->p_prm.lock/srate, but g_audio_setup() only initializes
> p_prm.lock when p_chmask is set. On a UAC2 instance configured
> without a playback direction, this results in acquiring a
> never spin_lock_init()'d lock when a GET_CUR sample rate
> request targets playback, triggering a lockdep "trying to
> register non-static key" warning.
>
> Reject the request with -EOPNOTSUPP when p_chmask is not set,
> before touching prm->lock.
>
> Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate ge=
tter")
> Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badecc32d45eb
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/usb/gadget/function/u_audio.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index e53f2927b539..ff811ea1e25a 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -575,6 +575,9 @@ int u_audio_get_playback_srate(struct g_audio *audio_=
dev, u32 *val)
>         struct uac_rtd_params *prm;
>         unsigned long flags;
>
> +       if (!audio_dev->params.p_chmask)
> +               return -EOPNOTSUPP;
> +
>         prm =3D &uac->p_prm;
>         spin_lock_irqsave(&prm->lock, flags);
>         *val =3D prm->srate;
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
