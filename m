Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314236;
	b=KmGGPsJBG6VQP6vq3iNtKJpJ4YGCNRe2PaFOlFZrWo3zMmhTA9tFCYBkeUn1YPU60YAw
	 gFVDBuDnZxvnjOamz1HE0VBmxsSTfRHwagu0WXixU+BERQAgNjEGqMsvBNx62PpEqkoW1
	 KJ4FtlZtKrDhN1VgVrds00/83dTWSiFAw/zELCIX/J6vGTZqeBp2Pl2cAKNf1JVW2re5F
	 USZVi08O/rQXDEwBi8xrD/JkOIvj10JzNEMsaSS5/hs0FqK0W9eJkVDgczCpDr8UHi8HQ
	 Y9aZnkA4+sdwwUitKAUWO2UzA6Ty1h/cbSUE0GVnajui7c1mw4E7H7kVaE16ZSkRdfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
	b=nmOt7HjUNY8JBcWZ9ENpPfnoBZYSuTX+zT161Oeh8k5YG+mVQGHj/71Hmls9waegAAdq
	 lcfWC1qTs+6ZzTc/nvge4y92TKaOfjPyos1Nfee6qq0mbtV61AQyoPOAdNLNSh3QpJK90
	 +o/Zy1DQRhJTUXDbj9p1eIdKDe8XSQedqgmlpjcscJkGeDBclf8nQsMZSS/eFLZb2FM7d
	 z0Yp2sPgafMUUgq+Zg5Py7txbB0s2fq71zbr/nX39btNLh8EIffXwcnm6uiRyY5nyGXJ6
	 25aXQo2SArmKd8sXPPfu6BIgAcmnzgrA1wExhN8lqTRlo3KIpL1sX6fAx8gXxcSRjtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaxtLhML;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F3606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1F3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaxtLhML
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c411e139259so75971966b.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 04:37:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794314234; cv=none;
        d=google.com; s=arc-20260327;
        b=fVeJNoFKjjxTjx4r7ZN4GXfIsqpfY3ofj+aANinHIlSiHDNLPSTME1NAstJCswH1dL
         APHEqlYyyd8SAHSaY/vRi0xzGIQtR8PaUjzJS9DtzAWRlpay6KL1DfY2nxJcAn/dBDIq
         JYO0pZ40Q35bOmEQfWENnR6QBYTAOexe906CJDfidrbO5fgxxJVQthoc8qqSRb9/ruRG
         doiDh+AttDN6jFhPZiIqar4z3qLhQ81+Oi3LAmZNoD2kzKN9rSQ1IRI5QiOycHkmGeip
         NeHByWblbdmvbFHvIIH60oh5TvX7O0x6BAr0aKmIYDWm4wm/stqeX78uH3y1Vr/nXD40
         zaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
        fh=cT680Iii6OXuUbsuue0/SBaFwLw9CdV6q7RkEe/ek70=;
        b=bdurjvAaAvuLS6JsG+LZEFgTVDHXO/0rwDMVXxO8bncoDu4XXf9LYY8f3DAyKeHO4c
         LpxeLZDAQWGKPHCCmqrtRwAEQfMqgG/ok6usfZ9PRJ/ls5QWL4BvE0tWnJhA34yeM3bB
         Bcl2RXCMKjjfJQZC7VuCM2ux042/x/53K/4ozdn+vz7bC/glpHeApZD8b34WmkkYTKm4
         bbzjWrqkLQbICEAnX5A6mk99SfoGOO67XvFiRe/H/VOQWXE6P+5FUQddfW+VdfVI4Q69
         9O6ij4siXSYfi5IlSDXn/95vdhZdjS+eXKY5kwLmjxm0PJ3tUb/EgTLHbV2z7gzVWFrm
         EzNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314234; x=1794919034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
        b=QaxtLhMLzna2DqFnl8rF0kzUuQU4IXhwXr/jgqsxFsK029Wl0NXvyNa3kBQTnhNlew
         meP8pvjnlMfYi4qcE8fCHtuwCV33S83R56oo8Dz5kufwGjs/nfQkCkYD+W5vAjxXYWLH
         drlGFjUqr3CrE/ddqO3eZNxUKm9z+6r15U+DwhqkKgoJUucg5+hesGYXy3t373HHvxHI
         KWKqWfbo481m0UFJzbAeQqX806D/S/Sl9lLyqUMeXCsHONVEvI9ABrEU4p3Co0Jz7YbY
         ry/8kz88NHnyvl5G159qP4/d2DX0izhVLbcZckPIuTyC411wBprFPKPDpSTE99Tg7QaD
         w+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314234; x=1794919034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
        b=xhiHP2PHlhotzT5ij0FjLSqaKzPNikzSb+ZUMMLfN7GfOU7V68m38aoGene7h4TxBb
         vuqGm78BpKPy0IpYbsoBDftKvymZLcBFD6KvfZoUki+Q8ebn5RFQ2g41jnDwvzMcE7Vh
         YH7u9NAzujoeEJMZs4BFyayre9/6ys0yff7TmGk7kf4TdUIqUpygqVQ1abC3bvhs3LTU
         SjQDvD0NvPbW59fHs+yzIHRXUEM+i50b9WaATlFj5yst//b29GFY1E9GEUhZtnTFGhLe
         0wjq05xA2wO0yxXkfxkX/O9MeBGzFLqEUZp9wif+xOLP6mNvi/4e65GMKf5G9iGsHHWp
         CZCQ==
X-Gm-Message-State: APuU4Z8D2xPrBGMBTU9Vhx1Be5mnAtQ0KnUHGoRBxsuiC5l/CLy1aK0g
	Snsqhue+mdGTn+4Ee60WwZomnN5/QgOP02SSG3BtrIW2wahzrged4j1aHrkByrWeWP2OUetjJgk
	Rqy0VZ94RnBG0k2MAbtmMKzGkgdvEQQDyjjH0
X-Gm-Gg: AYBFou1+zyKoL9ZWGcOqn4rzju4dYtA2KPUxpKRq0zhSWG1iXarLZusvbsIFZumMAJv
	fBIWBb5NCIRYINwewO9jQWQGPKGO5OCpTrYus0geGKmO7XaYfoepncAayYP7PAzFsMudia7Gn+F
	dRBB/RlXlqzQDadAOCt1KLWM9/mQF3vb1aEea3Ya+jIXkukCRg1WZJwCvDJZSNtSsAIaJTU3ODI
	KR1usKcD40ntIrfewIkcM1YsE9o2I3rle5ajwSbMe20SraizapS1uWmpmN/KgHzeakrBabdQQCr
	KyROKur/oXLUjDHGrIheDlRtAwda/ljRJTa89OGBGOrYY4TbgfN6wXsH7sQMK9jvnsxOdeI/ovO
	chUgxLzbaGnSe5I7T4amG9Sr/3o9849OWn+Pyb9/KoUrMvHchJCafSb1lABrdLjN2rKZ00A8kWb
	MKFgUP+ytvJFIf8jU3BbM=
X-Received: by 2002:a17:907:843:b0:c46:645f:cedc with SMTP id
 a640c23a62f3a-c50496efa2fmr206469866b.46.1794314233766; Tue, 10 Nov 2026
 04:37:13 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
In-Reply-To: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Tue, 10 Nov 2026 13:37:02 +0100
X-Gm-Features: AclHuK-L9Xy9_jIPCQDlfmK_CNn6002vmZtvxWl3lyu2iMFsjY1T0_prMJR207g
Message-ID: <CA+xk8n_CwetRPVJtQRQLehqXFJstwb-hYPDyP2ZGyPiYOXFacA@mail.gmail.com>
Subject: Re: [PATCH v2] media: em28xx: fix v4l2 use-after-free after failed init
To: mchehab@kernel.org, hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org, 
	syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Just following up on this patch to see if anyone has had a chance to
review it or if any changes are needed.
Thanks,
Drif Abdelmalek Mohamed Said

On Sat, Oct 31, 2026 at 10:09=E2=80=AFPM Drif Abdelmalek Mohamed Said
<drifabdelmalekmohamedsaid@gmail.com> wrote:
>
> em28xx_v4l2_init() publishes the new object in dev->v4l2 before the
> video device is registered. If a later initialization step fails -past
> v4l2_device_register-,  the error path unregisters the device nodes and
> drops the initial v4l2_device reference, but previously left dev->v4l2
> pointing at the freed object.
>
> syzbot reported:
>
> BUG: KASAN: slab-use-after-free in v4l2_device_disconnect+0xa4/0xc0
>                 drivers/media/v4l2-core/v4l2-device.c:78
>
> em28xx_v4l2_fini() is called later from USB disconnect. It reads
> dev->v4l2 before taking dev->lock, and on the failed-init path it owns
> no reference. The last close of the video node can therefore drop the
> final v4l2_device reference and free the object between that read and
> its use in v4l2_device_disconnect(), causing a use-after-free.
>
> Fixing this by clearing dev->v4l2 under dev->lock in the init error path
> before dropping the initial reference, and read it under dev->lock in fin=
i.
> This makes fini see NULL after a failed init, while the successful path
> continues to hold the initial reference until fini is done.
>
> Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> Reported-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1e71765881a6fc43185f
> Cc: stable@vger.kernel.org
> Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gm=
ail.com>
> ---
> v2: added unlock in early return in em28xx_v4l2_fini
> v1:https://lore.kernel.org/all/20261031204723.1415-1-drifabdelmalekmohame=
dsaid@gmail.com/T/
>  drivers/media/usb/em28xx/em28xx-video.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/=
em28xx/em28xx-video.c
> index 84424284d486..924a3f7977c9 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2414,7 +2414,7 @@ static int em28xx_v4l2_open(struct file *filp)
>   */
>  static int em28xx_v4l2_fini(struct em28xx *dev)
>  {
> -       struct em28xx_v4l2 *v4l2 =3D dev->v4l2;
> +       struct em28xx_v4l2 *v4l2;
>
>         if (dev->is_audio_only) {
>                 /* Shouldn't initialize IR for this interface */
> @@ -2426,13 +2426,17 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
>                 return 0;
>         }
>
> -       if (!v4l2)
> -               return 0;
> -
>         dev_info(&dev->intf->dev, "Closing video extension\n");
>
>         mutex_lock(&dev->lock);
>
> +       /* matches em28xx_v4l2_init error paths */
> +       v4l2 =3D dev->v4l2;
> +       if (!v4l2){
> +               mutex_unlock(&dev->lock);
> +               return 0;
> +       }
> +
>         v4l2_device_disconnect(&v4l2->v4l2_dev);
>
>         em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
> @@ -3129,6 +3133,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>                 vb2_video_unregister_device(&v4l2->vdev);
>         }
>
> +       /* matches check in em28xx_v4l2_fini (under the same lock) */
> +       dev->v4l2 =3D NULL;
> +
>         mutex_unlock(&dev->lock);
>
>         /*
> --
> 2.43.0
>
