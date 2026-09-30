Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103624534A9
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756310; cv=pass; b=aJUEBZEENnZdTX6A58e/g1bTI0Ds6+5c1rlq6P69e5MU418kvo+FBlzidPn6EHf4Zrbx6EPuF63Wh3hTNxjRKTrpgkcI2PW+w+62jPp1aKiacNiVg9BQVHzuTp2rN+oMm8eo//hwvohOJfvewyr/1X89LC0TsaouAQIBEO64Nmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756310; c=relaxed/simple;
	bh=n00yq2QVGi2lpHCc8VKCalisoOsxykR9j4BCiuuQxus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuB0k+1x3pDeY7SsRICIOnKAuhmNj4T2GhbJDwQ0LSuNI0329Gj5pREUM/MTFtBdoTU+toUJCZBuUEnFJkxly5qZPjuKiiDYAElQBNkHYw6wKfCx6j1RJXlfY0deDuxue1D1S0OWUp9+MqH1h4Ee3ySc6smwO3pg51WCd30TL7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aN3YWQBF; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN3YWQBF"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-67109935888so4797508d50.3
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 01:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790756308; cv=none;
        d=google.com; s=arc-20260327;
        b=AVGE55HxQ8x0H5kUbGmNVDy6I3+bHH4qA97atLkmhjSrCw3gyqyBREMgcw/NCoiBWh
         M/4wYpHX9IzxQtRR/UOBsV+ZIvaNccAcoopYnlNNd1bzgzgTZ1S/t2Jv+g3pxdPG4E07
         EU4S4CsK6+ctFJP1s9aY6yGgYtcDSMd+b6RDaIsaY8HSYbqCrVuNcTXO5YuOxlMtWwgF
         jjl1QSxSBn9+QsMY6z8q6QYpbgashTn8geIkMboP/FK3w4h1JNBHzq71VtxtnFarlUlz
         p0nS38KiEx+TbiZl8qRnENyvOwnA+iMIyLy22a3IpK6XMO1SSCGQTffww6xVBg/N12Vd
         koiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n00yq2QVGi2lpHCc8VKCalisoOsxykR9j4BCiuuQxus=;
        fh=17uvEUNOEX0qmeBcAMmsjfsDGxWRTEAdThXkduUkUtE=;
        b=N7q3pOsytsIa7Y5rCEo9YOMHSgdz38PgpO6YPTH4P6j5JJC2GWrIxVJEbysRrnWbk8
         ApWvWj1UbY9C0aauoPs8/kLwDNzEj6RrV5R6fV99TykR1zdFHxtL1WzZcKX1Sn7n62gQ
         4M8VPJ19/LbJg1mI3tDugb1fLB+6HlznmGvGsGVv7hayB55qY+0wjDYDbLUaisIMNBzd
         /Dx6u2B2i+vj1cx2Y0fS4TG7PZ12fAN9eiyqt3xJke1i5XBOQ4B/qYG6Y/0HfpQ4pxdw
         jIGULlXcQRTHPjSw3SbtD27r3EwuxL3txHYxkzv9ypUBECYg3Oy5DuqsaI3MA0jpSDIX
         xBDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756308; x=1791361108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n00yq2QVGi2lpHCc8VKCalisoOsxykR9j4BCiuuQxus=;
        b=aN3YWQBFFzSNAsj2eg0q4f5LCN1vV4dpYeeGoy1SLaPIt4oEGIuQUkAiL2UY6owLSW
         HP6nHC/HdouTBrIDQHQv4zry8n+5Y5NpqHBtLoJBT52DQoPA+5hAJ8rPyxI2VJW4EtZk
         jGAyoN72oGmoyfCSaHITqcqEQZ6Th1ksQ+J74Amkqzf9Ds3rEyofk1UVQjfFQaGLD/BN
         Vr4huwQOWmUGE/2HG1WaB58TBiuwG9cR1kYKOmqHhGpX79TOFo3Zr1wC/VlYOQpivnpq
         R8xKB0p/hAmZOzVMFleusjB3rZjbah13jrfiTpfMZcPbAzDcI4iZwO5Akx9RovfMt5cl
         vhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756308; x=1791361108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n00yq2QVGi2lpHCc8VKCalisoOsxykR9j4BCiuuQxus=;
        b=qiUddqXyYgZuiyvJvvslpc8kRKwQHxNZ4eABXkyP0xwhueLcPZwHFIMJ+31/cCaqkA
         oFaLQ7ndfJafiui4JNEkcrfLqvLGdb0+zUhjlWZpWFsode/cia8LshrZ2geEO+DtufJQ
         /4ZxlS8Y5/jdjzW/qQAsW90LU04MTzp6kejRYetKfs/wuXO3B0txU3UkHbNrW4zb3P1M
         Gjau3mIbiSDhveOrcbqQ+j7gLXlBMomGbSp3hqJ3bhjFO7+KzWR5ijlJvhLyep/M1A+P
         hWTH1dc11KY8bBOqbLXQaz7upb+VJ1ts7Mq4D0fgEpcMG5oHtHFA7hfstKOIW7/Yxhqv
         D59A==
X-Forwarded-Encrypted: i=1; AKwUvBzK3NCK2zC5UlGMOV4y3rvDYJCHisvEgfmGPXqQj1fy5MV+t+FwSrX9xsgrrOfVXC00L9stIXRnc34=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX8/xqbHLktSllrBZymhuEtHQ/xb7Eo4tbrGHE2izQfOG0EkpG
	gTthkm24tq7Zig5H+YP/fO+rm4wFRx/UmVkDWlJQhoeBuovZ/LaYM0wrTSw99OKJnf98ZDoOmk9
	S/6OCANQEcR1H44TBwaUKpKqOMi1K3hc=
X-Gm-Gg: AYBFou2UX2p/7M/ZdwUfqi9URVQ15E6IYG9fF2ZM76i3XRR6HwDBdPruRNOKBwAGRKC
	WCYeBOBTjOBrthwaFjsdfzsn8tNkHeh1hIA5qTS4ZYraBd+cukbcgC7HGoswpLxlvlnonm0cv8w
	U8UfVJxBDFRCi+OukgvPh76GgXDMl/2Ht4vtSLak6RpJUg7Tqosa8Qk0KTlxT66JqK7GOeJ6geN
	eEY8lrVALgst4o9V/UbL54yBEXz4/Zd6aLitciSFlSVPOixUEo+AD9gaNF2HDJMvm9iXN3YECo+
	CdKk1EnfZaYzDdqv41nd10/HMH+peGMWHVfXLjWRQKnBnjTXQluNFmKV+YCb8VrLpIOV3rodbYa
	A9rvSlBO8oXEaonLj1zHSkZJ67qCG4o29vepXdbXMwQ3t
X-Received: by 2002:a05:690e:13cf:b0:675:47ba:21a4 with SMTP id
 956f58d0204a3-6768349bfd4mr308769d50.47.1790756307994; Wed, 30 Sep 2026
 01:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com> <2026092925-licorice-strode-7905@gregkh>
In-Reply-To: <2026092925-licorice-strode-7905@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 30 Sep 2026 13:48:14 +0530
X-Gm-Features: AclHuK_fQ9URWr_ZY4d0cgR4NEkNAs130gJ-YJ8xBkGvtj5OC5gTvkpWKLx5ddY
Message-ID: <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 6:53=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wrote:
> > u_audio_get_playback_srate() unconditionally locks and reads
> > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > p_prm.lock when p_chmask is set. On a UAC2 instance configured
> > without a playback direction, this results in acquiring a
> > never spin_lock_init()'d lock when a GET_CUR sample rate
> > request targets playback, triggering a lockdep "trying to
> > register non-static key" warning.
> >
> > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > before touching prm->lock.
> >
> > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback srate =
getter")
> > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
> > Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badecc32d45eb
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
>
> How was this tested?

I have not been able to test this since there is no
repro present in syzbot.

I verified the fix by static analysis of the call path in the report
(afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and confirmed
in g_audio_setup() that uac->p_prm.lock is only passed through
spin_lock_init() inside the "if (p_chmask)" block, so it is left
uninitialized whenever p_chmask is 0. Leading to lock splat issue.

This patch is compile test only

> Did you forget a Assisted-by: tag?

Sure I will add assisted by tag

thanks

Deepanshu
