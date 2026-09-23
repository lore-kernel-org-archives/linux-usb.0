Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D324611E1
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150939; cv=pass; b=C6K/tU+XBPS5p90KQIET1oaCASLcos7BHPN+Egi7ALT0HwgMQiQsFHzKBpxihSSobOj1q5Md8wTvfbm3ZJyXflFY/LAQ61vpa04vbap5OQugZPOL+oudXarAkdvvA0WxuxlsZaPG6B7eoFEc4tuuWJg14A4KpLqJFQZf8kHH5bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150939; c=relaxed/simple;
	bh=HO+eJ+xYnJ3aapBaasYQmTQ20IXQrrv44FRinMc3r5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqE/gUxHe0016ir9fYpOnywuwTj1WAoIFEfNIHs+fnQbEQjwY/cgwhaawdYM0bfrqV2U/FuK2Gss1U/d2RReCWNRtCXkxCUFAwc4qXTuF9vmU5CfOhBgpynWGJI9n/YwP8tvqhXQr5yjZsZV/GgtRqMqC2k+1BVzrrRVMJfVBCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VeTQV+CF; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VeTQV+CF"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52faa58bff5so136391cf.0
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 01:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790150936; cv=none;
        d=google.com; s=arc-20260327;
        b=NjNLsnoDa7xdsJcd5Bb2h0oPRm/uubKWxhcwn7AV2KlQ1m6imy28L3dwsw6/lHA50w
         RVYOwoGYGEJhbeXyjrOmNVbs26Hw46DtNqfuOvo/sj9cU6hozuw0nU4q3QzNNEtyjLlE
         /0e5qFoJIff1+QORMNRemTCrtXFZEoJGag8TXs63C+i0UEahvk7f2nEvKwMKOMUGuzhF
         zXvOvNYaxHKNOFXZGOAw+shMNI5eTTcbnQY4Uh5UX8kCNKNd2y/v4DG0eyD1rATwWsYq
         m4MTU14dol9M9Q1GhOUMZHJUFr0g4SPC2kWDYEC7TtLH9hYkjIU7Mf3FVA7IesMhfUh2
         fl+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WI1eM2ZtTpVfUjFiAayfQ/0JAeRrdkd3ShivwFg80pU=;
        fh=XCVmMEHgYrvtG8LVv2Hq6iXIh0ypJmrnvrptv6v8lZM=;
        b=KHmYS/3+OEeF5fxLxdYyoaONFZTX1tYRQ4SqrnqEFoSHX6u3jHORDeSIq7hcJCT8AC
         ij0DuQ8GOB7iQ1eIoTYIMpvMWhmfnymM2A0/4FaT8XIdPXOn+YGLlI/YNvx07i1XZVbC
         72uvMNxSOUU7edQNF0Nd4IvX2OCa0tr418uMz90j9UUhrxtNBgVEprr7H8XzpjfZnNqK
         fZxDCc2otj7vlYE+5jR6KR6nOWazL80B25LeyCqpyNNlGvkk9q58eI+zKmS7f0pYux54
         E8s7hoDlGhMPt7mrNiHcocOiI7Aal6l1RKABxT0XHJ4Ms9XSjJf5at1y2uUiF2l5QsHa
         tF6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790150936; x=1790755736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WI1eM2ZtTpVfUjFiAayfQ/0JAeRrdkd3ShivwFg80pU=;
        b=VeTQV+CFQyaddKGIaQ7juKXyF/bEj/XorySEp+XUpvaCsSvg3JTXIbowJAIgeYwiTd
         yZJGpNWW7YZgLuQ+vjzU8+NKx/bvVoAOkkGL0d1vOOfaurxd76ZpVn3KOcQQMiW4EHGf
         faCsqFKOV188mCScomRmFjxa11pWZUHmTL8hbRc69TdZpsrJph7bDxHrUlZh5hd5i+lr
         7FK8IJ43lQTX8xHKpL30pfEy8NpWp2Sxb79rjfU2wvbfi+qLlREEmOJCQtZqs+ChdhXT
         KNV0BSi3RePrb7B0eQhCaNDvzirudtg7HweeVOgIRSfm98iM6Bp0A4pAEOPBD9QYsTHQ
         M7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150936; x=1790755736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WI1eM2ZtTpVfUjFiAayfQ/0JAeRrdkd3ShivwFg80pU=;
        b=y5aBhit9Iyzq4e9ggPYBDVMjW5IT+PNhvv6/TwcCmFeeUHQbSdyCh8IvN1vgV95DAs
         tYylgb0n2/rZqggZUkN/v5lSxL0rl+7AzJlzjO7xhIfyvzTjvlLVGZdDmbDXDyQ2Uzmo
         b1BFKrLR07NjK5h9HRPAd+kq3qbcOX+CudIDTc8+ARihVgvpZ68PkbsTzF3hyJsr736d
         qfdHdUo4mDVfFjwNuTxC8feENDUatWwMd1l4oqeVS/U7RPlOBKC0X+7J8WwKOIW14P8M
         C4k7q2XJhHka/HboC5GX42sQnR+/CXPHH1jJTUkqnWk8qn8wESRe4gqG33BynZgMVCGf
         GdkQ==
X-Forwarded-Encrypted: i=1; AKwUvByKfIsFQ+cuuZttnPi2y3Ju33YgtdODPPHSPI+FGSK7Y9P1ExuRE15Pl6h/IFWDpdO23mzo0hyRTj0=@vger.kernel.org
X-Gm-Message-State: AFuF++lIXYHzCRV77f0qayB6VHY3OJHB3BwaKi8ArdSKtmSo/0mdPZ3l
	G4XwCzDtv77sl6cAPesS56sRGnOy8ILPw+8F7gRg6vnGVLb+WNYOIKS/HgPZHxKlZASaYRWjDX0
	d0L505DEKUdkYqyxZBGXq2ad+bPAo0o8MxFORJAps
X-Gm-Gg: AYBFou1wYvhWqWqUd1cj2Qk1uvXEszW4oMoz/IeHy/2+i3jglW1jMXxWyTjAOoWKnXg
	IN8JBDqV7ku8mDp+/9jWx3LSI19AL0HGjQW7lko59EF1eBflldzj2sW4nHIBRc1OdusexLEsnFn
	DjfvZkwAGO2vs6suAldA94qk80nQUaJkCYzsQxnUo3AlB99GHeOwhZ+l0+zun9Qah9/Ysa1Asl9
	XNKia3oNV/Q4r7EoA0OIQdKpigUSraJpe5NFHakEi39EisfTLWCvi38ED+FpJ8NinbSNcf4b2ad
	xwWxGHSSx1lIn/jyWG64I+fyfFx12ryca+cFokLgs0yoL2mKJ5BICcPYMe7vYnMFP167HKKW5gQ
	ui5FsD5RQIA==
X-Received: by 2002:a05:622a:e08d:20b0:532:eff9:ca08 with SMTP id
 d75a77b69052e-532eff9cd9bmr5404151cf.12.1790150935912; Wed, 23 Sep 2026
 01:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <89e19e6e-7ee7-4bb0-abd6-60971b7fd601@gmail.com>
 <2026052726-vagrancy-lilac-bf72@gregkh> <f44f2c8e-accd-4ea8-8184-7da610340a9f@gmail.com>
In-Reply-To: <f44f2c8e-accd-4ea8-8184-7da610340a9f@gmail.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 23 Sep 2026 16:08:29 +0800
X-Gm-Features: AclHuK_ZrrediHZyNhUWFIDzwVB9TSB6qhwI5PWg5pLUBEU_Y0vbwhKsVjyUbuA
Message-ID: <CAKzKK0ogStj1un5Vqdzw7+Hq=UyZiav9q++r2-NkMLFiYOHbWg@mail.gmail.com>
Subject: Re: [REGRESSION] usb: gadget: u_ether NULL deref in eth_stop after gether_detach_gadget
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sashal@kernel.org, 
	Merlijn Wajer <merlijn@wizzup.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ivaylo,

Sorry for the late reply - I was on parental leave since May and just
returned this week.

On Wed, May 27, 2026 at 4:37=E2=80=AFPM Ivaylo Dimitrov
<ivo.g.dimitrov.75@gmail.com> wrote:
>
>
>
> On 27.05.26 =D0=B3. 11:03 =D1=87., Greg Kroah-Hartman wrote:
> > On Tue, May 26, 2026 at 08:56:15AM +0300, Ivaylo Dimitrov wrote:
> >> on linux 6.18.31 I am seeing a NULL pointer dereference during RNDIS g=
adget
> >> teardown.
> >
> > Does this also happen on the latest 7.1-rc release?
> >
>
> I didn't test this on current -rc (this is a mobile phone and not
> particularly easy to run latest Linux on), however this looks more like
> an object lifetime contract issue than something specific to 6.18.y.
>
> Also, the suspected patch was backported to 6.18.y together with
> e002e92e88e12457373ed096b18716d97e7bbb20 ("usb: gadget: u_ether: Fix
> NULL pointer deref in eth_get_drvinfo"), which fixes a similar issue, so
> I strongly suspect the issue exists in current -rc as well.

Thank you for the detailed report and bisection. The crash happens
because gether_detach_gadget() clears dev->gadget during unbind while
the DBG()/VDBG()/ERROR()/INFO() macros in u_ether.c still dereference
&dev->gadget->dev when eth_stop() runs during function instance
teardown.

>
> >> I suspect the reason is commit:
> >>
> >>    usb: gadget: f_ncm: Fix net_device lifecycle with device_move
> >
> > Do you have a proposed fix for this issue?
> >
>
> Not really, as checking whether dev->gadget is NULL before calling DBG()
> looks more like a workaround than a proper fix to me. I also don't know
> the subsystem well enough to judge whether switching to netdev_dbg()
> instead of DBG() would be appropriate here, or whether that would defeat
> the purpose of the existing debug messages (or cause confusion by mixing
> gadget and netdev based logging).
>
> I could use some maintainer advice on what they think the proper fix
> should look like, and then I'll try to put together a fix.

I have just sent a fix series to convert u_ether.c to netdev_*()
logging helpers (which safely handle unparented net_devices) and to
serialize dev->gadget accesses with dev->lock:
https://lore.kernel.org/r/20260923-u-ether-gadget-npe-v1-0-ff466c55ecc0@goo=
gle.com
If you have a chance to test the series, a Tested-by would be much apprecia=
ted.

Regards,
Kuen-Han
