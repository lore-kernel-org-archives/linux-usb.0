Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793927815;
	b=te68ZVMDQwHu25Z/eUBxHZFvB/H6AU5xRlmY0bEx0cUAKBPG7BsCy6/Gq3z5Y2nGnIZL
	 uxNnRj4zf+tAF8tNNpdLula6xW4ZvGYQgidFQsUYoDd/q22FLRetAsvptoMgHNNIrlKbs
	 AfGAz5G4FW438pTLeFLSWzYg7o5yD8hX4DR/B2nVF4BbFGOlZPnoNrqwwlOIiOsx+acoW
	 NPNwDb5fsf1YzG1uQxg3FsE+0mZ5qMxHo2w93wsA+qOB7eGTAgvvB+5KjW68Ov0tmK4Xa
	 l3b22yX8yHpLQj3dZKZKenq33Bk3ZDXDOaeOVrOzIX9M8Bc6iIcRKtwxy61hPYyx0/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YOv+CJ4ODBOeaz8mbjoHLIxOl6OLVvC283CBSMIj7LY=;
	b=lzQNqiwmvb14Qwx53R26ktKxHCyQrt6hMBtaSx9lUWcGZ7Xkhc+uqflZ5zflY1D3q2Ze
	 b+m2y0dJYLI3W/UF90BfLStc0x6rpks6RMLuoEhwxFo1aZWtCHPjITkPT8ee7HqvC+9q4
	 RdhmOWfIxU2m8yNmzwH+o6NRtHjRzBURsC5uU9mFBuhVctzgv0pbrZh+HPTyIbvqY+y+C
	 iQXN85DeetAM0wNFZmTcYE8Dr85uRjPle4ptiRx7BsZeBReQ/eRLPSZk8FyQ0uOHvQ0zP
	 THL+vrd/o/Ni1xN44SbzNNBSVFg5o7NFyfwAZAbFzZAphXKVGLlxjpdVN/lzB3ivslQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nJ580VF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B5606A31B
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 01:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 846B5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nJ580VF
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so76684e87.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 17:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793927813; cv=none;
        d=google.com; s=arc-20260327;
        b=NJzP+MfTYVVG9PwIaepWirTDTxgtHiuyCMlaWMLH6oaU1R62YwjwPBzE+2j91yB01h
         GlIZlmVv8LigV4krIN9gtcFl9e8qVY2ki2qJTWtLl+loX5RtQp/+SW/Gh+pv1lWN/NEp
         EDPk+x/vCLuscZp7IrZv40doThZj9gtr9Eam1HpmItcx/A9c+GmtPWK/BVOziy4jSgj9
         AxXw2zP0rRBOt33N2nF6znfB09eaOY5bGJCLCqRjSJtrqdZJrd9mSkB7SnFYeRWWLU6v
         hc+yJ1PqXvWFFLns2vOmtrJUp1viCj+Ji9krD6SzGT/RoAO7L+W/6ATNycnwfmHjJ0hi
         tkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOv+CJ4ODBOeaz8mbjoHLIxOl6OLVvC283CBSMIj7LY=;
        fh=h+mQpHenWE41tH02vPAs/yhC1tl8Gdxyciiw7mFlopw=;
        b=TMJZ03mVOcAeJDb3VFYAFWDsfeYkkg5BXurd66oS86rcEtZtZ+RrnnXYl7YB5omf41
         Pks+qN3LhjNd5KjLroL0KIONDaiyM3CJItadcc8bPJXjwk7g9oxuqcPSrRhWPko1Iad2
         7/C82vQj7jWXJf2JUOdaAOjFEy98IAPsFfJQgR1TkkP0nYkq/DGEawF8U1dNVr18JGir
         GQ03wb4wHwrSVXzo1RNRIZKRGiXa456EukLUTxnWsFDPy4aEogyT4e+ucYmqQWHxs8r5
         vMtYqQ8JOPTn2OLfOUmfMvTvYa+CfGcOGpCndJDQNRM1i9qpAkxiC/dgaYkIhHUNsL78
         dTGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927813; x=1794532613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOv+CJ4ODBOeaz8mbjoHLIxOl6OLVvC283CBSMIj7LY=;
        b=0nJ580VFUJ0WToayAnzXs2gbZ4rmp6d/1Fz42RO7ef1leazRXcK3dag/2IqWHEercb
         k1c8snUTkR9Guw7Uocu+FaD4pNWeipPXpbbGMybvhQ31vS8SLNvvHBMr942EzA8lQYEh
         nSJHN0+v8sK54f7w3X+bFVgmXEGE/lzSwWFvob1n9Z3V0kY5AHXleODyQ1xUOfpGo1kg
         mkktpJHCqkdSGo70aZCMyQ5FPEBOIG5d92j1mux83ixMwFHOGwf/wv9HfUQKRa2ywIKP
         2w5abB1IeiBMBHjFMSqXkLA3oE4rj9c9HTvO/0cdOy55fLQXAPMciv75iZFh6iyGDewa
         ikjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927813; x=1794532613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOv+CJ4ODBOeaz8mbjoHLIxOl6OLVvC283CBSMIj7LY=;
        b=T4KlExmP4vRlXC4aN6VTP5zNJnCsWc4fw6fz/a95vm5dT6Qk4v4DfJLoRZd6l48kzR
         ZuHNqKXPAYp8diRa3RhzSg4TqZJL647bPwIY46GkghXtm2G9isSfbCVA/gG+nvbQx3t6
         ZfdtxJMwp0OWd12AJ125r3v87NSU9LOhqOdVDpBvOp6l6CpXvmIljy4330I0LOHVBehL
         eiIYf7+1vl/q6vfQpHmAgKpB9PfM/8q+14cCPC4Bqcm2KrJmY68XYLd+PZ7uEnfKU9N8
         eq5l++SNS2Fc7Bwzct/nw7VxlRKegEvaXXf9Ncl5PfSOaynObd/TG9GlPkt1sTW8DnEl
         OxLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4jSqdxVnIr+J7veHiaNHyLy96eHULMkMWTe+ejDjD2HN9c1y3hGW1ra7xYbnWuzt2Rkqxo7B+RP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rtUg1D/z0ABN/aC7CVNDXexH6ud980Bp10Xgpyet3oObFBghO
	pi5Eiwh1AzyTm8EhWjNd2SkVrc0f6UwUL8hNHQSeZ/NtqFe302bPxMGYoQCxWetqOEAQGPSuO5x
	ieoE1XNAg02kluslsoHklJ+umm/9Hml4=
X-Gm-Gg: AYBFou2Z4bnLhbxEyPSvxWC76Fdwoqlnz4+Ztl1Nevsyn3CXbJ5fUvSdLjCZ04QFcdV
	ocfoQpYT9j5JZYE3j4I0SykJfHNH24/N/kZjAAIhdoAClUdE5qeIj6MKdDpukOySkKVGPALtLSd
	zU33m/KiDjOcEV4NhFI87w+UXxAUVtNcAvVVXqyRO0jjZUFAG5X1LyUhbVr62OrsyB2UH8g/MOY
	udar4NvoJPmkxQ2ECM1ha5BX8l2O22ZlmEF4/vDCn22u4rLY7QbDwENOoOCPIAq1q4hHej/2uxQ
	FzinRuxa9jKjUTHL81k9LN0UuT1LexQJ+DJVo7pgnAtJfjQHsqXJVj5iORtTvBejL7yxQet77UW
	V/H8OVDaINoUmEtVm64ylI+mAFmJXOJhdWpZR713GSfz1xA9vBFewO7CskJf4j1vbOmYGm25B4W
	TBbRN15qNt4f1LHzSg
X-Received: by 2002:a05:6512:32d3:b0:5b6:4ae:5b7c with SMTP id
 2adb3069b0e04-5c003ae038cmr231798e87.26.1793927812513; Thu, 05 Nov 2026
 17:16:52 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024183727.42339-1-igorpetindev@gmail.com> <20261024190758.2526-1-igorpetindev@gmail.com>
In-Reply-To: <20261024190758.2526-1-igorpetindev@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 6 Nov 2026 02:16:40 +0100
X-Gm-Features: AclHuK_n_guQRphuA-wSEpJbT2qllDa-fjtEwFRlUhJ0P-awQ2oQVZEVC8osNvI
Message-ID: <CA+fCnZdOtx2TPN9jsAoMOkq-UXEpQ-tS8QYoPbjdmkgDjHgQKw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: raw-gadget: fix double-free race during UDC
 unbind and rebind
To: Igor Putko <igorpetindev@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 9:08=E2=80=AFPM Igor Putko <igorpetindev@gmail.com>=
 wrote:
>
> raw-gadget defers endpoint disabling, request freeing, and descriptor
> cleanup to dev_free(). However, dev_free() is only called after
> dev->count drops to zero in raw_release(), which happens after
> usb_gadget_unregister_driver() has already returned.
>
> Once usb_gadget_unregister_driver() finishes, the UDC can be immediately
> rebound by another raw_gadget instance. If that new instance enables an
> endpoint, it assigns its newly allocated descriptor to ep->ep->desc on
> the shared UDC endpoint. When dev_free() from the old instance runs
> concurrently, it calls usb_ep_disable() and frees dev->eps[i].ep->desc,
> which now belongs to the new instance. The new instance's usb_ep_enable()
> subsequently fails with -ESHUTDOWN, and its error path frees the descript=
or
> again, causing a KASAN double-free.
>
> Tear down active endpoints and requests synchronously in gadget_unbind()
> before the UDC can be bound again. Keep the descriptor pointer inside
> struct raw_ep and clear ep->ep->desc on error and disable paths so no
> dangling pointers are left on the UDC endpoints.
>
> Reported-by: syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Db7534c9b380f81a3b4be

Please also ask syzbot to test your patch - it has a reproducer for this is=
sue.

> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
> v1 -> v2:
> - Keep ep0 request handling in dev_free() to avoid any lock recursion.
> - Synchronously disable and clean up active endpoints in gadget_unbind()
>   to prevent use after UDC unbind.
> - Update endpoint cleanup in dev_free() to free raw_ep->desc.
> ---
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 30 ++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac7ca..a6b42679acc7 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -141,6 +141,7 @@ struct raw_ep {
>         enum ep_state           state;
>         struct usb_ep           *ep;
>         u8                      addr;
> +       struct usb_endpoint_descriptor *desc;

Why do we need this extra field? Why is ep->desc not enough?

>         struct usb_request      *req;
>         bool                    urb_queued;
>         bool                    disabling;
> @@ -223,7 +224,9 @@ static void dev_free(struct kref *kref)
>                         continue;
>                 usb_ep_disable(dev->eps[i].ep);
>                 usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
> -               kfree(dev->eps[i].ep->desc);
> +               kfree(dev->eps[i].desc);
> +               dev->eps[i].desc =3D NULL;
> +               dev->eps[i].ep->desc =3D NULL;
>                 dev->eps[i].state =3D STATE_EP_DISABLED;
>         }
>         kfree(dev);
> @@ -328,6 +331,20 @@ static int gadget_bind(struct usb_gadget *gadget,
>  static void gadget_unbind(struct usb_gadget *gadget)
>  {
>         struct raw_dev *dev =3D get_gadget_data(gadget);
> +       int i;
> +
> +       if (dev) {
> +               for (i =3D 0; i < dev->eps_num; i++) {
> +                       if (dev->eps[i].state =3D=3D STATE_EP_DISABLED)
> +                               continue;
> +                       usb_ep_disable(dev->eps[i].ep);
> +                       usb_ep_free_request(dev->eps[i].ep, dev->eps[i].r=
eq);
> +                       kfree(dev->eps[i].desc);
> +                       dev->eps[i].desc =3D NULL;
> +                       dev->eps[i].ep->desc =3D NULL;
> +                       dev->eps[i].state =3D STATE_EP_DISABLED;
> +               }
> +       }

Any of the other things dev_free() does need to be repeated here too?

Also, if we release/free all these things here during unbind, do we
still need to do the same during dev_free()?

>
>         set_gadget_data(gadget, NULL);
>         /* Matches kref_get() in gadget_bind(). */
> @@ -886,6 +903,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, u=
nsigned long value)
>                 if (ret < 0) {
>                         dev_err(&dev->gadget->dev,
>                                 "fail, usb_ep_enable returned %d\n", ret)=
;
> +                       ep->ep->desc =3D NULL;
>                         goto out_free;
>                 }
>                 ep->req =3D usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> @@ -893,10 +911,12 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev,=
 unsigned long value)
>                         dev_err(&dev->gadget->dev,
>                                 "fail, usb_ep_alloc_request failed\n");
>                         usb_ep_disable(ep->ep);
> +                       ep->ep->desc =3D NULL;

usb_ep_disable() should already do this for UDC drivers that care
about value of ep->desc for disabled endpoints.

>                         ret =3D -ENOMEM;
>                         goto out_free;
>                 }
>                 ep->state =3D STATE_EP_ENABLED;
> +               ep->desc =3D desc;
>                 ep->ep->driver_data =3D ep;
>                 ret =3D i;
>                 goto out_unlock;
> @@ -962,7 +982,9 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, =
unsigned long value)
>
>         spin_lock_irqsave(&dev->lock, flags);
>         usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
> -       kfree(dev->eps[i].ep->desc);
> +       kfree(dev->eps[i].desc);
> +       dev->eps[i].desc =3D NULL;
> +       dev->eps[i].ep->desc =3D NULL;
>         dev->eps[i].state =3D STATE_EP_DISABLED;
>         dev->eps[i].disabling =3D false;
>
> @@ -1010,7 +1032,7 @@ static int raw_ioctl_ep_set_clear_halt_wedge(struct=
 raw_dev *dev,
>                 ret =3D -EINVAL;
>                 goto out_unlock;
>         }
> -       if (usb_endpoint_xfer_isoc(dev->eps[i].ep->desc)) {
> +       if (usb_endpoint_xfer_isoc(dev->eps[i].desc)) {
>                 dev_dbg(&dev->gadget->dev,
>                                 "fail, can't halt/wedge ISO endpoint\n");
>                 ret =3D -EINVAL;
> @@ -1096,7 +1118,7 @@ static int raw_process_ep_io(struct raw_dev *dev, s=
truct usb_raw_ep_io *io,
>                 ret =3D -EBUSY;
>                 goto out_unlock;
>         }
> -       if (in !=3D usb_endpoint_dir_in(ep->ep->desc)) {
> +       if (in !=3D usb_endpoint_dir_in(ep->desc)) {
>                 dev_dbg(&dev->gadget->dev, "fail, wrong direction\n");
>                 ret =3D -EINVAL;
>                 goto out_unlock;
> --
> 2.47.3
>
