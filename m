Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794568763;
	b=pguqLp039YPnDDFC9UgMXUl7/mJ1/k0OMkbv5g1LiT6j5jTakmsJhGjqpX4i/iTtdiig
	 cdkGMGlikrdKVctn+cXERy4wSIXuey1LKYMSvTfCC+QUFvIsw6RwLdYeRZzvNQfuV9iVO
	 VjRDFKLU8PhfTMeVhKtzTHLzr8OoD4nkl8bIrCZZs/5/tgcEhh6xa+9gxajxExIXbTUme
	 Gxthej7c2oI19TgAA0oWS+ymTfKhLc0mm3HvApJxcusLnreBF1myxtXOafV7xM1rTvCpU
	 hXLkpUJrRc3qxEUd+L4iX294Mjej6OVm5OuH8hFoHS63XQ05KF8hBbi6CE4JdzBUOHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+zGxPdvMhrc9IRSomhZ6SC6Dr+mt0l9nYB2IDRDUv2M=;
	b=3mhpNDrTCThy+mAWjjasJCCVeHZU5byzQ1hGELt8xVtm8msrHpHvgXA50TLk7aLwtSI5
	 /zZpYodt1jTUb4C5PB8uXQtRvurEYdMuGXtWX6Tks9GtePLO4Q7T8j4WxUTMfqadP2vr1
	 15mJCOOEAXaYLGYTpjfV+F/hyERiK4WRvyn1qtnXm9SYtkz19N3RJU50MMvDo9OIiirRr
	 ICNcGBmTscOaJdGL2FQfjoI6UfGke+JnspX9Ez37WRDQbC6Sy/ZXeqWtoyJSwL3y+JkSf
	 ldUey2rXh0oSscqEYKpWL2IxAJE0sqks0+UufENomtHOb0Rh2UiC4eUhDy+VEVYgOZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=EE45JKxb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33AE606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 11:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A33AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=EE45JKxb
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so198803366b.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 03:19:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794568761; cv=none;
        d=google.com; s=arc-20260327;
        b=s650Qx9Q56VlLEtXzHXOZ275q1NgSF0ZMfVsUhkzB124/lX4FK967RrkP3YyQCWOPs
         7ffr7NjQdCrQ9NrrTtM7vHxwfehQvVYO1kjwebrPDyy4v1gz/+c2/Fe1WMsHY5bKcGng
         OJ/ydCxKW9Pk4OHLIpBNzxwZPc16tqd3ko/XfjArf7YHY5R++iHqHQN7rhsYgFDZ9eQe
         rZXi3vsPpaC4sP5DYXH36XywY6VKkRuo/Cz+I4Kvcc0MyGUEArdNeAddYrcn09NE3lXV
         v+U0qGEn4t72QPHcvGIUxD9gsN3N2cevkn/+hrss8p3zuqz8xBYsXHDuwm7m3N8LjrcU
         eIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+zGxPdvMhrc9IRSomhZ6SC6Dr+mt0l9nYB2IDRDUv2M=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=LZriM83CE61bDC/zViLB7NZkIai3dr0m+H4DeAf6PofSEZ3LU4qk2S0zmsGEX9YQeq
         tRHFDiwEoUITeVsu7KCdDyidYZZEWeeKBFgEMOp+/zcYrOzcdAoihLvJ88nvcplr4lud
         HJZf5lrrO4FcT1CcKwjyH6kLlbGQcArmNvEMScqpiQyevrxzyTeqsYuqR8NcRDxN0LoA
         lHDAChY6Gd9yjqgD7LzgNzebzj6nsp7S3KA5KvHqPRtDhlLyO9eJgveMCoPP8HwUPavo
         Cm1Cxoy8BgHALu9NBySoKM9Q1GYXyUNX5LLgW8ObaH0Yp6v0Kuz+/2USt37AEfYYzZzi
         2dNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794568761; x=1795173561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+zGxPdvMhrc9IRSomhZ6SC6Dr+mt0l9nYB2IDRDUv2M=;
        b=EE45JKxbGXGhSQaUnzYmPzCj9Iajy5H2MpRyzy4px7WqHJJxehHvaEQh9d1y5ioQbM
         eYTL5780tb0twmprN3rRJP0vrfALVR/WsvnWEfCBHXkktrCmhQqcfGflTnHlPwe9XBLD
         3B34PdGyZunR7qEnp+grrfs9myGYIBUFI07C5eTvg3PStbQ9FsRtzTUt7kDEFX9nzycO
         KU7abRizKLZu7gFYEqJsDH2mZqf7kGvnieV5LyMUWX3gEvV+v+/KouK9e87LAxT0UDyh
         12Fu06wqv+0YMAR7ihgX/0K8eRTe+1cJHLUBYfL/8Hk94+4OaH53FPPq+B/oWaFxJL8P
         xn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568761; x=1795173561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+zGxPdvMhrc9IRSomhZ6SC6Dr+mt0l9nYB2IDRDUv2M=;
        b=EBsOliQtzMrBa5jwaWQwaCt3iglA0rldncgtLqKhm7EbV0IQITK0aUB9JyDHoGwFhg
         BkRELVPgKfoKPOLulLM/N82Y2yImdj4mePPZmTrdEzaQj5cUC4UfZG1KWUyROCBjcfYu
         c92NRzmCM/sFbbX0Dz5vIA8n0xZBZzCw6pZ06gJXYdZyJEOlyfW8jcwiiU5Do5jsXk0X
         8zpnC3a4N4rUQvqkdhpSH89864OFkhdbf1KjcFcpUSfsWruGml4oeSSe4nKjrHeW4GnB
         WwbC73GaiAY3rNnubSsMmAP9WBlbSYfTC3bqBsr30FezAzakCX3i2OuptcpcdV+vSpk9
         N1Pg==
X-Gm-Message-State: APuU4Z9r31KtUBzeDMQHHmQ5FikOErgKsbl+Ba13gqKBhVTOUwi8+7Zo
	+qZHQXC6yun0DLpjw3VQ6yLF1eePht4XtplO+K9QZeZhG/ICJITqOZExdjvhsOEJVgcunKYb9AA
	2dDxqn2rnVllNLHqKJpgiFtFDjh20oYajUuqhBCO/XWxJSt2AGNNieIgxBQ==
X-Gm-Gg: AYBFou1voCqVbEwchCMg3gwE4REHdXrbrCD4H4R025sQjrN3TPMbCpJqC08+xC0wh09
	65AK8NW40Irs6uaz3Bjp72mHOwfu5hekGxrGTXPPVgAbY1JNAh8a5uDDsnjhMDIV9mDeCZRT3+p
	Q1cs6UQMEKX0zdT7gCLIyhiotza3FT/YwpsMycMYUc56Jsigc4QuAhbKRLlCQAfIKwsU7B44Dru
	kv6tn4JcUV7VIPDJZ5q5kRcIwksI0K2DL4bqVes1AwoOdXpDq4dGQuWXVZQZyX0lw4aLUFQ3nHY
	c03qM9kCKMq/IID2apaUvqOjR7pMi+pOar55UsB5HtJdO+KobRBoEvK6M+p5bow3DJh/MutqXsu
	ufQpVzzHAQtd9njhTlaS5gwf473QSiVvUfVuMhfKgKnFZRpYaYpyn58u+AmxhPJe6TYP6
X-Received: by 2002:a17:907:d29:b0:c4d:31ad:9de9 with SMTP id
 a640c23a62f3a-c50963b430dmr206562766b.42.1794568761017; Fri, 13 Nov 2026
 03:19:21 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-4-f51b11f07eb8@flipper.net> <sashiko-outbox-212565@kernel.org>
In-Reply-To: <sashiko-outbox-212565@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 15:19:08 +0400
X-Gm-Features: AclHuK-FqQN5oUw9MnQi77vdHOak_yOmchgkwngpVp-7ydgu0G-GT1QAHVlaw28
Message-ID: <CAKTNdwFwHZ8cUNXhNJ0qRHECMV6Ab4CSXBsXiDFtP7=BR6tZVw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] usb: gadget: udc: Decide on connecting in one place
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 1:46=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: gadget: udc: stale gadget->connected if pullup disable
>   fails on unbind
> --
>
> commit 8198ac49b976bc4f15b1f15c4abb55ae61ceb982
> Author: Alexey Charkov <alchark@flipper.net>
>
> usb: gadget: udc: Decide on connecting in one place
>
> This commit centralizes the UDC connection rules in
> usb_udc_update_connection_locked() so that gadget->connected only tracks
> whether the pullup is enabled.
>
> > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/cor=
e.c
> > index 84dc0820c2cb9..e592705de55e4 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> [ ... ]
> > @@ -1236,16 +1238,8 @@ static inline int usb_gadget_udc_start_locked(st=
ruct usb_udc *udc)
> >       }
> >
> >       ret =3D udc->gadget->ops->udc_start(udc->gadget, udc->driver);
> > -     if (!ret) {
> > +     if (!ret)
> >               udc->started =3D true;
> > -             /*
> > -              * The pullup is never enabled while the UDC is stopped, =
so any
> > -              * connection recorded meanwhile was only a request. Forg=
et it,
> > -              * so that the next usb_gadget_connect_locked() enables t=
he
> > -              * pullup rather than returning early.
> > -              */
> > -             udc->gadget->connected =3D false;
> > -     }
> >
> >       return ret;
> >  }
> [ ... ]
> > @@ -1733,15 +1729,17 @@ static void gadget_unbind_driver(struct device =
*dev)
> >
> >       dev_dbg(&udc->dev, "unbinding gadget driver [%s]\n", driver->func=
tion);
> >
> > -     udc->allow_connect =3D false;
> > -     cancel_work_sync(&udc->vbus_work);
> >       mutex_lock(&udc->connect_lock);
> > -     usb_gadget_disconnect_locked(gadget);
> > +     udc->bound =3D false;
> > +     usb_udc_update_connection_locked(udc);
> >       usb_gadget_disable_async_callbacks(udc);
> >       if (gadget->irq)
> >               synchronize_irq(gadget->irq);
> >       mutex_unlock(&udc->connect_lock);
> >
> > +     /* A VBUS event can no longer connect the gadget, so just wait it=
 out */
> > +     cancel_work_sync(&udc->vbus_work);
>
> [Severity: Medium]
> Can gadget->connected stay set across unbind and prevent the next bound
> gadget driver from enabling the pullup?
>
> In usb_gadget_disconnect_locked(), gadget->connected is only cleared when
> gadget->ops->pullup(gadget, 0) returns 0, and some UDC drivers fail that
> call when VBUS is already inactive:
>
> drivers/usb/gadget/udc/fsl_udc_core.c:fsl_pullup() {
>         ...
>         if (!udc->vbus_active)
>                 return -EOPNOTSUPP;
>         ...
> }
>
> When that happens during gadget_unbind_driver(), neither
> usb_gadget_udc_stop_locked() nor usb_udc_forget_driver_locked() clears
> gadget->connected, and usb_gadget_udc_start_locked() no longer resets it
> either.  On the next gadget_bind_driver(), usb_gadget_connect_locked() se=
es
> gadget->connected =3D=3D 1 and returns early without calling
> gadget->ops->pullup(gadget, 1).
>
> Also, if vbus_work is pending when cancel_work_sync() runs after
> usb_gadget_disable_async_callbacks(), a lingering gadget->connected =3D=
=3D 1
> causes vbus_event_work() -> usb_gadget_disconnect_locked() to invoke
> driver->disconnect() after async callbacks have been disabled.

Looks valid. Will fix in the next version.

Best regards,
Alexey
