Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794311320;
	b=JSyoGJOnO6d3mW7t1+arKRwMtO65DcPUWzBqNMHmiqQG5FUCUp2Qa0iYx8bV4z/eQRF+
	 6IcfEUTl0CEbdZn9Hl3VgkF3h2aZAp4ymBWNaKsr1nAm2xnFPSdQH0tbK8VoDKdwtuF56
	 ExCJ24OiPgNnb0dTDySyzIzLrX8JNxGYvWI9q3fM02nqea0Bc9wQQqdFbHzTvl+w8tuGr
	 vRgIaqbdEdyE1gzqNon1JjGShHLpcgMrkjYG2sqIAjMKfcF7TQzSk+8hYgf7EEhTEz/l8
	 KCGVPFeykAEPb6tW1MeGTX7MrfiWnI2/Vh80GIllQZuKE8PqeG0agmVJlEQLd+syN1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=TCGSXQkkp9CYRjtPCbFI0n0SwhiyqiBh4xY4kDY/tRc=;
	b=XZ31JfYZsEnEqfGLjzUD8NXjbjrBavbDdJNDyq+bJiwBIVQxgZU6axAaAbR5Lc5csorI
	 1SH1yJXqK2/fCPVhdrjBPePm/1pel/T09CFLIh19OiefSx80ugMQ62OgKUO9HRmLYFxZZ
	 dXH83q5IEe6lSdwRfgkNN1LIXA/yHKJXbmzHsm8WuJTSEPq7o3BR8jIGtz4WqpsXaAVhU
	 ZE4BuA/DTmzP23RkiayGmIf2DKb8/NOw5TIkFAY/ofxiU7+3y/OMxbsOvygokEjB3KdnQ
	 pFCgA/CMdTMHPMNKTkHhfUegPHJNIuKndtgNKnZl9BWibAesRYUZWaWFEs1gIt5HFkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbpO7pmJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4A606A336
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AF4A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbpO7pmJ
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91ebec7d5dcso15122036d6.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:48:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794311318; cv=none;
        d=google.com; s=arc-20260327;
        b=MM/XK+JTzO+REjXIxX6a55arRpI2fOPtA2cGRLWyY10USZTy5plLgKOISt0WiorcPR
         jvYpruyQKbSM8SI4izfdZg8SlbmiZ74IUZpEgIokLTYiOVurspegd5uOK020UXEZl1F1
         2kjdgTJzvVuSeGQ/XhwWCRcLNpGYJy28HogribEhGQBaDXA7oTryaSVTmvat/VCtq/P0
         Ow1REdHmxEygut5KR/9bk0QK6YXSaQeCR9FP/f9zGJWXH7YZIzND7Gytoz5HYgWy+2fy
         UtuAZBDCzzMivs53nqdEb0xZ3SpA2NNRMcU9k2MXVVxi00sW8DzfqGJdaV3zcFWFMx81
         hdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCGSXQkkp9CYRjtPCbFI0n0SwhiyqiBh4xY4kDY/tRc=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=AzYnvLlJaVnw8jmRSODogJyz1gHfJK7GN3ACPYuO5mJQHRv24frfq6/FWptnajA6IE
         8FX0rqAMh8AMikIO8q6YRGFVIh/aTi8rIb8INTq2BD4vzHE8hV1ZFnm29RZmKev6XzTg
         +Gg9gwW+PstQ83ddkEEjzJljngL8xosDgagiBeTRuUEWAMD/1OMVBa0nPZlrX/qkaUkI
         xlPoRkrKJshcXBqYhSDl2Z5zsr4wG4rC7m/v0b2QoVSQRxZRrUtkn7qgIvHh6LoFab/D
         021KwZU+yyt/4Lj27gGAktIk/hKOf1ttsTGmT5BfScISqrHVToEwJjuE4E6MGc/CQs4o
         IArA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311318; x=1794916118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCGSXQkkp9CYRjtPCbFI0n0SwhiyqiBh4xY4kDY/tRc=;
        b=CbpO7pmJDcvsexNCmDtpmtSl++6kvPetaro2TmZj6r7PlQdD/MjMAYQykKyx4WvAP+
         n9+4LoCZX9JPuxQRZVXhsCQtS7bLzVT9ewQEH79FwIcemzZ8lzhfOUVRcgA5U9LpBHHr
         EG2j8eJRDjnShtsNiXWvYlaT8bFgc8KXaw1TSmJrQJGuUQLc0MNpQXx6ADqGPjkjvgWX
         ekO5COsQnb17UNKRvuTOuKWBT6G8hfNEAsRThN0z6CpFczdvpm6WEiHtJ8eUwUYHVabn
         DKRam6FDsPJaTqwflGMfE12KbcvWCa6Yzy25VnykIAgzaLNztqmys7lg4AgcecON/fdI
         4jrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311318; x=1794916118;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCGSXQkkp9CYRjtPCbFI0n0SwhiyqiBh4xY4kDY/tRc=;
        b=brx283OEhROx/t0Zp21Jvm4eA9ytK8Upa01B1DtqcymPETEKDqqtPmLm5sR4QjyQ11
         QbulBderrQRl3m9aFHmxgfxE2FmDfX89oVIS0hHEnDJWzO3yc7ropTSidjQxU+WJrZnS
         LlGuRgUFPUx4DWGwRwtWoZyDp2Pi3HHdnk2N3t8MZvMCM0SjDn0g7h7NQlbxzCgrFT5D
         RWkuQXVy7DL8EO1xErP3y62CdEq/O+dFvRvP23Vq0R7Mw7cyIxCcyM8hIMnmIQqC6qT3
         4TrP0s1Ip4cvzqrQ75ptBLh4CS8vejyLKgoWgIY7MEx4ZIl/FfvJSrMmKAf0n5sh7hLN
         uJ+w==
X-Gm-Message-State: APuU4Z+SMOjTW/rPXdjeXIglGDvX4zxvJP4fGYFLP3fEimZWl9TWKHvJ
	+eceEeWElAMr+c/HEPRalw0n2RSsYGdTxemKXqnxPWiVQYth2HVw1J+qcChNIeaqpjNAuJPEJE7
	eTZU6QUnnsrqEjLeovw0WxAvstBGnu9hMmEIHKE4=
X-Gm-Gg: AYBFou10lrYvEI9x/D9eS2PmWPNalrItosauVZynI4Nm2BW5ItFseiyKm8NChvKLVOX
	Q//UXXSQG6heMxgf9RoK02jbvnpfU/GnIbw3hxOvizoTm2kyJzbTc34speBdBAN09dMMJ+pYaK1
	qujkW+xxw6nYABuGxmaXdaAIsFEVArZt60LdcPf7xJPgZwhe6+MjxSpxTg5tRXphLbbv+aSWbe+
	1PF+1pWt210cB2OatWswynyvQaWscWYi8ox+HusY6w1xJZwvbA8L202d+0bWRFj7SjGhbZcILMb
	tP9NyytefwPzzL7QWIoS6w93/kKM9Qc5F1wiRhUPwmp/dH/Q0MC42kt9XgHe3H2WCUDXPmccI1Q
	Oa972afIwKo/huF0ChiN0WDXSdyDTWnN1jklgxwomTooNMB56zV/LI12Iqb2eO6KrNH3A
X-Received: by 2002:a05:6214:411d:b0:917:a278:ce0c with SMTP id
 6a1803df08f44-91eef953c89mr38462386d6.43.1794311318387; Tue, 10 Nov 2026
 03:48:38 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110113523.2517891-1-hj351016@gmail.com> <sashiko-outbox-206950@kernel.org>
In-Reply-To: <sashiko-outbox-206950@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 20:48:26 +0900
X-Gm-Features: AclHuK-hlRCBmE0NXc2HkIod5l2gSiVzm8_S6uudo7AfNbetvFYsjZ296z-4DPI
Message-ID: <CAGr5VtP3FAJLYDRfMumwJR4ALceYA9i-N11Ff_GkUik3SqBjYw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: cancel wake work on device removal
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks -- you're right, please disregard this patch.

udc->wakeup_en is never set to true in aspeed_udc: there is no
.set_remote_wakeup op, and ast_udc_ep0_handle_setup() forwards
SET/CLEAR_FEATURE to the gadget driver without handling
USB_DEVICE_REMOTE_WAKEUP. So ast_udc_wakeup() always returns -EINVAL before
ast_udc_wakeup_all(), wake_work is never scheduled, and the use-after-free =
I
described cannot occur. The cancel is harmless but unnecessary; drop it.

(The dead wake_work plumbing could be removed instead, but that's a separat=
e
cleanup, not a fix.)

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 8:43, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: gadget: aspeed_udc: wake_work is unreachable in
>   ast_udc_wakeup()
> --
>
> commit 59e63d484d3cece4c9053b24c7e169339b0f2919
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> usb: gadget: aspeed_udc: cancel wake work on device removal
>
> This commit cancels udc->wake_work in ast_udc_remove() after unregisterin=
g
> the gadget.
>
> > diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/u=
dc/aspeed_udc.c
> > index 10214232c08fa..2acf84c489909 100644
> > --- a/drivers/usb/gadget/udc/aspeed_udc.c
> > +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> > @@ -1460,6 +1460,14 @@ static void ast_udc_remove(struct platform_devic=
e *pdev)
> >       struct ast_udc_dev *udc =3D platform_get_drvdata(pdev);
> >
> >       usb_del_gadget_udc(&udc->gadget);
> > +
> > +     /*
> > +      * ast_udc_wakeup() schedules wake_work, whose handler dereferenc=
es udc.
> > +      * The gadget is unregistered above, so no new work is queued; dr=
ain a
> > +      * pending one before the devm-allocated udc is freed.
> > +      */
> > +     cancel_work_sync(&udc->wake_work);
>
> [Severity: Medium]
> Can udc->wake_work ever be scheduled in this driver?
>
> ast_udc_wakeup_all() is only called from ast_udc_wakeup() after checking
> udc->wakeup_en:
>
> drivers/usb/gadget/udc/aspeed_udc.c:ast_udc_wakeup() {
>         ...
>         if (!udc->wakeup_en) {
>                 UDC_DBG(udc, "Remote Wakeup is disabled\n");
>                 rc =3D -EINVAL;
>                 goto err;
>         }
>
>         UDC_DBG(udc, "Device initiated wakeup\n");
>         ast_udc_wakeup_all(udc);
>         ...
> }
>
> Nothing in drivers/usb/gadget/udc/aspeed_udc.c ever sets udc->wakeup_en t=
o
> true: ast_udc_ep0_handle_setup() forwards USB_REQ_SET_FEATURE and
> USB_REQ_CLEAR_FEATURE directly to req_driver without handling
> USB_DEVICE_REMOTE_WAKEUP, and ast_udc_ops does not implement
> .set_remote_wakeup.  As a result, ast_udc_wakeup() always returns -EINVAL=
,
> udc->wake_work is unreachable dead code, and the use-after-free described
> in the commit message cannot happen.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110113523.25=
17891-1-hj351016@gmail.com?part=3D1
