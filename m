Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793927288;
	b=4a1HzlJ3dXBHzmTSGS+PSbma00vrOBd0GtvGVLC3SSc59IXdcTM+66hD/xo6alPbTx9/
	 7c5C5aGIW5dI1AkTE346HhgORqjwkihX55ctc59xlJNzIbBCXyz0Pne7vs2cRHWykKjqt
	 mwnUv0HJYwJjqgkHBlTiiRHD7dU6hJ9e6hJPIj23i4mdFpoygSRJWbfg3CrJ+jqk1DbVJ
	 Zaw73MF8LnIFzGz2K0YHPey7157qLbBCNp7xvpMArL+ZSxkwRdVSl7+PRmOF0i7trLKxp
	 rBrWTOeLQWWK3ev3BQzka4qOko47v0mKvXsadPqsc+8vnO/9aMzANdh1gvFnEVNWN7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fJkGz5CpoFWJRGd5AF5Qs6l5/HtOobvMGiH1ORmFADg=;
	b=WGJY2huJWV0pI+wQwDI/MHtmtubCTwEpu66E1O6G7FRas3Cc2R9IpJqfosWNPjDHow9B
	 fEg5MjwyuPatrGKnQeSkTUgxIlW2divpPabPGsg32fNr2Hj2gDwrFEUQUPTWTwA5zb/Dr
	 12E/1ev5kqHr6SLDKPcOYjdW2HZ1ZnzfcK1olWOn4XHcd4UNDnzQ1RTOnx1ThfDxf2ikW
	 4rFMtMQay9kQzwyGcFKbExoYZ9ptU3faYDBTjNIaHotd1RWHmovhlxzZy2e5dreQSOxJl
	 RuyzDCuKkj8g56DSwhFjyDkmIR3j8mgVzSNTytmD51hDe4eNlhzbxXmWrDEk66BtVzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mxfw4T5t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2270B606A328
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 01:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2270B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mxfw4T5t
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso98144e87.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 17:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793927286; cv=none;
        d=google.com; s=arc-20260327;
        b=h4/MnT7xvW1sMak1RRvGSFLRfGckkr+VSfNZdB7f0pmJHd5MB0rIRyxBBbw6uRgGOS
         IkxhsANhGZ680YKC0aN0/c8+kwPlV4BEEGc95zgR0nXO+kF2boUypoNpkAvl8S3Fyp0Q
         OZitYn9YQz47hALtmhT3saAKaGUJyntwq4Gf6iHliAdrMvRxZtb7yb++nfGh5ddJCupq
         gKJSATcJY2KUki2L8Z41f945RFThtwpYpjzA7FJg9W7AO60LTY2mpjHPDP7lFHh0/nFx
         NqjTeV86NauLl5Udq3lLA0sisyaQIecK9qXSF2R7IJrIfXq4c8x2vOhbq+VzJOOYRLcX
         SdKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fJkGz5CpoFWJRGd5AF5Qs6l5/HtOobvMGiH1ORmFADg=;
        fh=JpyY1Jixzmhehttnh73vkwrjR/3JfyJQHhtvZB36qbA=;
        b=RbzjWrqed5JvhqxTELuqmsFgUsIxrMgvpgZnIOJ4cjWKSfXtdyI2mYp3jAn6fy3VMU
         ZfSzTW6WoDRawjJRGH8JnxUf40jLbNnDjdZ8gjd9pNNocGaAUVjCqaIJ1Y0Hxux8M33D
         4h1pZJSSZYp29C3vSmse0Lge9GxUqkEL68iYKCxkO6CvqHU46YA0YAvTEhHgdfEn4+2I
         xF1PeSNRhCzHZ8Ve+rXkBz6MANZiduWM1vASdaZL2mEHokqxWqCbqsH0DLI+lJ9k8stO
         AiO5l5FhDAlg9l/4ENOO6IdWajGRb4t35o+FLm/8zKIYHcIH/pnaQSm5GIz53DQ6I4qZ
         qn8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927286; x=1794532086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fJkGz5CpoFWJRGd5AF5Qs6l5/HtOobvMGiH1ORmFADg=;
        b=Mxfw4T5tUufe87vDam0XgzvAbn83pyWk6QvSJE5ic30mOrJRb0aQ/mUuC6oqPJiSty
         VZNyOvDCv6JqTvqXqKkMd0alCaqvsVd1HyPioR11hT5VRtb6oN7spV/F+OXFEruEM9h9
         4yzlD2DUbJkCwioK/FDxF2oQF/hM2518Dyd+if4nji/cGPcQhizWGSBB/8kluO502+bL
         0jX3tTT2LpRM8NnL2S0Fxk9st+vGpAoFzfvo5sLYVqa04XndUaUhvbFEDWWwHVI9z0EP
         9Wp50CG6j5LWcFLucKB3/tTjk5W83Rwnz9JEModvplA9A35Aiz5ERAVclQ1FNnZI3S7z
         evOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927286; x=1794532086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fJkGz5CpoFWJRGd5AF5Qs6l5/HtOobvMGiH1ORmFADg=;
        b=l6iAxF4O86FGGyJUfBWttV7u8bGWb2RRJkdgc1MMChR0ShAhkqfGu1rd7sUsIkHqHu
         /L66c6PuchoySjCS8VGe7EgYelNAS1pGy/er55J3Gx6GA1LEEL0mbDqUAn0QcyUwi/cX
         SsWjKkVfP2PbKbxtM65PjHl5unI5OCg7driBfoqZ3CP4YkVs1n0hCM9nGI1HRWpwmhzj
         2gvGLAiKCcMpjQRWnJ095KZ4FF1imvHFpXRXH+DRDNwkHoHUwxLa79rXG1BKKpWck4M4
         DPbJQNtgtKZYlq0tvmiH6nO82rXUqMYhk6wgckoKHcnR9DedjDVpbt97sNmQJHEWYmI0
         Ivvw==
X-Forwarded-Encrypted: i=1; AKwUvBwXGIAUCJ5Bdm4i3anTD5EHc+U3z8RbbtRAMSgRJ5vmHIUawlHtPdjW32ZL0bxyN+bN4dtdsYjubb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v9WfXE1MxJTKwN2m4wMnr1yS48FXLSZJ1Tqdg43rJOyKzW/4j
	ntMIQ2bbK2v/2dL/8K15g3RKA0ROUU5qv60HBFbaAl0VUErHW8t6G4q3+ZlEBGMraSX/cLMlPjq
	mO16ao8JhPrpw9JDNDObgYNqNJkiYXPs=
X-Gm-Gg: AYBFou3LTL3cagK9HZcIVlSyXsljudwuFtRPzTuOtMUsFE97y3h/PPqOZnaAUGl5qYG
	Wrse3XNOHSmV7Mo9111fP3u+0g8AUx4kaowGjmU4TZGJikFU0XKh2YaM3jZMPM4DJCQGsjCeWNC
	eWNeO1Qc0ty/6NGrYxLL3Sgsa1o5i7fuI3vgpJRqSop31SVFRKHCvTtS0w3vKtosSfsii1COgge
	tkO4/MvVoPoCllVRaOfqYuh3KZKSHEgy3UPyk2KG1WN+uaMlO6SLgvNVLM+6LzMc+r4VBs8N9B8
	f2aKgj9IwrYJ4TZomYFuct3xIV7PhpGApOeJZFcwW0EMKBYiWxmUwrK9fkk0N60ji1uxXEq8s8F
	mhZ5QEHtG7fS9TetAxLB8gpvPTTsxFWQ5eCWGjYZ5xUKQvYlqi3jd/mCX6CRy0TanHtx2jTM=
X-Received: by 2002:a05:6512:6d3:b0:5bf:b249:375c with SMTP id
 2adb3069b0e04-5c003ac2cd3mr230843e87.13.1793927286155; Thu, 05 Nov 2026
 17:08:06 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027032332.1945140-1-liuc63@xiaopeng.com> <CA+fCnZfgi_UUsMg4p2iRePACOAR8StQRYhgC9fHETE8Q5n0z5w@mail.gmail.com>
In-Reply-To: <CA+fCnZfgi_UUsMg4p2iRePACOAR8StQRYhgC9fHETE8Q5n0z5w@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 6 Nov 2026 02:07:52 +0100
X-Gm-Features: AclHuK_GOq5XW9qGIOfiza9qDe3tNSjEThoOLcatbbltrIx8xUgFUsgaRXZuPqI
Message-ID: <CA+fCnZcH1dZ3=Raeh3GkQt7vfqdhKtTq+VcyhJ7Ks2ZRcV_dgw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: raw_gadget: fix dangling ep->desc on enable failure
To: Liu Chao <liuc63@xiaopeng.com>
Cc: gregkh@linuxfoundation.org, krishnagopi487@gmail.com, kees@kernel.org, 
	balbi@kernel.org, zhugl3@xiaopeng.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 1:43=E2=80=AFAM Andrey Konovalov <andreyknvl@gmail.c=
om> wrote:
>
> On Tue, Oct 27, 2026 at 4:23=E2=80=AFAM Liu Chao <liuc63@xiaopeng.com> wr=
ote:
> >
> > raw_ioctl_ep_enable() assigns the user-supplied endpoint descriptor
> > to ep->ep->desc before calling usb_ep_enable(). If usb_ep_enable()
> > fails, or if the subsequent usb_ep_alloc_request() fails, the error
> > path frees desc via out_free but leaves ep->ep->desc pointing at the
> > freed memory.
> >
> > The UDC driver may have captured the stale descriptor pointer during
> > the partial enable sequence and may dereference it in subsequent
> > operations, resulting in a use-after-free.
> >
> > Clear ep->ep->desc before jumping to out_free on both failure paths
> > so the pointer never outlives the descriptor it references.
> >
> > Fixes: 97df5e5758f7 ("usb: raw-gadget: fix gadget endpoint selection")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> > Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> > ---
> >  drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadge=
t/legacy/raw_gadget.c
> > index 46f343ba4..b52ab3ce7 100644
> > --- a/drivers/usb/gadget/legacy/raw_gadget.c
> > +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> > @@ -886,6 +886,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev,=
 unsigned long value)
> >                 if (ret < 0) {
> >                         dev_err(&dev->gadget->dev,
> >                                 "fail, usb_ep_enable returned %d\n", re=
t);
> > +                       ep->ep->desc =3D NULL;
> >                         goto out_free;
> >                 }
> >                 ep->req =3D usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> > @@ -893,6 +894,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev,=
 unsigned long value)
> >                         dev_err(&dev->gadget->dev,
> >                                 "fail, usb_ep_alloc_request failed\n");
> >                         usb_ep_disable(ep->ep);
> > +                       ep->ep->desc =3D NULL;
> >                         ret =3D -ENOMEM;
> >                         goto out_free;
> >                 }
> > --
> > 2.50.1
> >
>
> Commit message should ideally mention that the use-after-free is not
> actually reachable.
>
> But the clean-up makes sense:
>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Hm, looking at this more, it seems that the UDC drivers that care
about the value of ep->desc for disabled endpoints, NULL it out during
usb_ep_disable() themselves. And other gadget drivers also don't seem
to be NULLing out ep->desc explicitly. So I'm not sure if this
clean-up makes sense anymore. At least, until we get an actual
reproducer for a crash.
