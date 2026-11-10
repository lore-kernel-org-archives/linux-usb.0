Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794289495;
	b=GaCysUpKGl3BU52sGYgKq3TK61jWdcVpC00gFiQz77zy3XISnt6gNESiAxugNEKbFiCW
	 isKHX1vrApwChxeVuOmBQCCtFVVIAS2VvUEdlur6IFPCEoKbvhGdYE64hiiK29LiaNQEW
	 k/fbO5nBHgflaROvFpYry7PuczH61Eu60VR84+eLhJQYfDkrBy57QmGiLCw0NJZUcrmlz
	 qAqpUyMwZhsP2aAOtUo5B+jPGKl++E4ghS2tCuIAP8fjXu/KggOIOqOvrFDTj8ilmdKeZ
	 LugEdvWLu5ixIeQfCXjABntVjUwqhejFpulauK/vbNRoPnbiq4300mym4t//Pt99zxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=g39QjZX8zY3AOOtpXk7OF2YWb6Q3Y2gF3RAt0e8I4Pk=;
	b=j4l4JQE4qaNbjsasM3qDcXt188UNzlfvYw8wP6DN7wtX1sd6TA+fikh0B7FsJ3eHdh2t
	 AFKbnGrZj84jyjvX+0PfAJ9gXpT2tXZn9DTYUv20GEzZPsqrB5dj33gN0RmD5rOJVjo75
	 QTCeUnnD37HGhNepqbFoLy4/2hK2Oe/e0kOP2GS14wxWNpOgLJoWLgNhiu/VjKxZquVW1
	 N3ghSjt5CSCUuCjd2oc4htYhXmGqS9g1xm6dl7YHl6relhqrdmfCPyeGsEWuO2/LgEL8V
	 zDnm0iFYQAotuSwqoI/qnXMtKZwfQBB18FZIHOG4y8bzOZGInvAm2txuOV1oXrMLtZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PabbqmSG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE56606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 05:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE56606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PabbqmSG
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2114740eec.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 21:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794289494; cv=none;
        d=google.com; s=arc-20260327;
        b=HmVNCN537TpI2AnhEnEdxLgf4kfGhzfQVsi4zqajiW1k2z1/gvfphGLEVaMGqhO/aW
         CVbUUHYAZpfsfMvVEW7jqSWnS3izylvhv4K0Hv2FSEXT4s49cVxF+rx5sGixKIs4KmGT
         XjxHTuRmOfIj0Rr69DYy6ZL0UbYIdEtN/W7N3GtmUOvodgruveiDY7r6eJLCKMAJz03A
         N+x4UE0nCLshCeg56/Sx2wJVUwsPVb048ex6nCSzHCIn1NHJKXk3inuEiTtaEOsqSiS3
         3Atq4CBRb+lQcjzEJ/SxNQQIatb6s69gVjb++Ze866XsvAqRe2lgZKHm2hZ3P9JBdjHZ
         KuDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g39QjZX8zY3AOOtpXk7OF2YWb6Q3Y2gF3RAt0e8I4Pk=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=I/CIlhzKTkFR9/J68GGBkcJr1cB1Sah2cHwxdPfVawVFNtluKl9OoVbjnQRe0SuWeU
         wAw7WMniCPlYIYuHtSi5B3cN8ySDykpZv1APtH1bGKiA01Ckcd8S4JAKyRG5ISuC0WuM
         Lt4VHpK6/XWhylO8F4VezXkS4tjo38Z2KsY6Ty4/maaS/hM+goEYer9hp/JWQeSsjAUC
         XJbxT/ez3rOJQ1pHFRC3IVIbF6KmoDBO5TY8nCRqVFt50cFS772oVthQEJxxQ4i2H0cM
         Z641HPhoa7Gm6v2+sjIbOetxbojYXqeBKqKCBwUzP5jxGHlEc4J3TMCMsIBBbe4TJJ3w
         sqaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794289494; x=1794894294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g39QjZX8zY3AOOtpXk7OF2YWb6Q3Y2gF3RAt0e8I4Pk=;
        b=PabbqmSGaz7sCxlTPHEOJHotFOy+Jt2UOMkCjtmXh3k9HmMD2XHpd4TfQmsbhDT2Gp
         JQjsxGjzVgD9P9VhZlytoTI5OB5zWS+QvDRhFB5+FlV6Ny9A4SzPHkSHht2uE9B67tR/
         liM0DaRKg2trJiyJkE6uo3+CN8QxOrRNlXSrDsWpCPpWu/2/ulNbeC748CBDb7P0uSw0
         /Ld/OnqsSpQixZ86jHGCZ4GNWSfyR9XxrUyMD821OASe4sWvoRlXlcIWxIDldiuwc5QR
         FO5vc15c3lOSkKuZAQdKyeuEwCEpi47d/GAq94Mgk/i3QasggueFM3Douttc+3dmmUgC
         KPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289494; x=1794894294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g39QjZX8zY3AOOtpXk7OF2YWb6Q3Y2gF3RAt0e8I4Pk=;
        b=a+SQDaR9kplVrW11frPtOx689PsDSnWYnrKMe2BS0OtjynXQ9Yr5CQGIE5Vs5RU+zx
         BTmcW7ncN6EYxN9aawgRjFcfL3iPqxrcoOlKX4t0R80kea64cuGsUDc9UrBvmKtyq2ag
         m6TEeEOwitmtAseGpA1+ULxR2swdCl9MwEZiDuVfACBLnr/GH8D7FVliBu6+L0v06Y51
         diAqd4Eldp/J6cArNnMGsKn9u9s4NF3UN2SYm3+/9USVRcm3sd+xohkK3HT9QktLWhTb
         /L8UQqVduQVOn3MON50AecF4I4tCV2B65zfV44proQMTtLVT8KhyPLoxJYg6Z3VSe78P
         OEOg==
X-Gm-Message-State: APuU4Z8QfhBTqItD70pK1pSfF/cJtTbps2DbrSYHrskPHnd9Zk0Qz+gX
	wf1SffBYKr/TM/kqeIExUkLaISUB94n3AAX58W0nKcnC9JTbB2dIlRMdVeCgWxi/Bc46wtiu98R
	SGiNutbGIA/c5M4mdGvisVaimqths7/3XSBQ4wu0=
X-Gm-Gg: AYBFou1KWsjV5Q66w69iBsG1oMXP14Tz5gE7d2VVKlXHKD0l3pwsSuPlrhZlMeWaquY
	6JGobCTL2Dm+vfrnkIFPLShHhOtoZdkjrD+4oTsp38ANw7859rkZLv/V3jC9UNeySA6mu7s7KLs
	X2s7OxfRwpyZn5U62iGVqecXKSLEcPiksRti5YacKLaVs+HbJ3DJbR2T9e41nGQVYf4Gq49s43G
	G9Hua3F8PIEVLV09b7qKp+jNTgQaswJ5/JF0lHRacqx970y87yzPlzYv1hRkeBrGl69sOPEJvTa
	ab8CcDPnsQ5dCbcC284cGxn295XD8IzZXsQTEtxnn1aaEnKq93pYsl2kThtUm5HuDC7O1zXD19h
	pIBUxdTA6ly8je2jd84mPg081M2f1ah4Z7ReH33WxoS0vwc4+opi6qFBxuF26h9dx4otr
X-Received: by 2002:a05:693c:6384:10b0:369:f05d:6c5c with SMTP id
 5a478bee46e88-3751f467bcamr2356563eec.28.1794289493975; Mon, 09 Nov 2026
 21:44:53 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108134001.536207-1-hj351016@gmail.com> <sashiko-outbox-203786@kernel.org>
In-Reply-To: <sashiko-outbox-203786@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 14:44:42 +0900
X-Gm-Features: AclHuK83zmSBicAkhGXR_nnbiD7uLYv-Y5HwVWYFh-U9eG4xV_6xhYX0d6KFHCc
Message-ID: <CAGr5VtOWtjDFraii2qMu20=_mePfjFUwMU_dhnGm7aiw6QTwUQ@mail.gmail.com>
Subject: Re: [PATCH] usb: phy: cancel charger work in usb_remove_phy() to
 avoid use-after-free
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, both are valid.

You're right that cancel_work_sync() alone doesn't fully close this: the
extcon type_nb notifier reaches the usb_phy via container_of() (not the
phy_list), so an extcon event can re-queue chg_work after the cancel, and
for providers that free the containing struct in .remove() the devm extcon
notifiers are torn down only later (at the provider's devres), after the
struct is already gone.

This patch is a partial mitigation of the chg_work window; the complete
fix is an architectural one for the usb_phy framework lifetime -- the
notifiers would need to be unregistered symmetrically before the work is
drained in usb_remove_phy(), and more fundamentally struct usb_phy is
devm-allocated yet handed to consumers via usb_get_phy()/get_device(), so
a consumer holding a reference can still use it after the provider's devres
frees it (the Critical you point to). That wants proper get/put refcounting
of the usb_phy rather than devm, which affects every USB PHY provider.

I'd rather not fold a core-framework lifetime rework into this one-line
teardown fix and risk regressing every PHY driver. Happy to take this
either way you prefer: keep this as the incremental chg_work fix and do the
notifier-unregister + refcount rework as a separate series, or drop this in
favour of that series. What would you like?

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 10:50, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: phy: chg_work re-queued after cancel_work_sync() in
>   usb_remove_phy()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] usb: phy: use-after-free in usb_get_phy() [1]
> --
>
> commit 4a4ffa5316b9cec2015871ada70b2fe24ed654b1
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> usb: phy: cancel charger work in usb_remove_phy() to avoid use-after-free
>
> This commit calls cancel_work_sync(&x->chg_work) in usb_remove_phy() afte=
r
> removing the PHY from phy_list so pending charger notification work finis=
hes
> before the usb_phy is freed.
>
> > diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> > index 5a9b9353f343d..caae74988fd95 100644
> > --- a/drivers/usb/phy/phy.c
> > +++ b/drivers/usb/phy/phy.c
> > @@ -731,6 +731,15 @@ void usb_remove_phy(struct usb_phy *x)
> >       if (x)
> >               list_del(&x->head);
> >       spin_unlock_irqrestore(&phy_lock, flags);
> > +
> > +     /*
> > +      * The charger-notify work, scheduled from usb_phy_set_charger_*(=
)
> > +      * and the charger-type detection, dereferences the usb_phy. The =
PHY
> > +      * is now off the lookup list, so no new work can be queued; drai=
n any
> > +      * work still pending before the caller frees the usb_phy.
> > +      */
> > +     if (x)
> > +             cancel_work_sync(&x->chg_work);
> >  }
>
> [Severity: Medium]
> Can x->chg_work still be re-queued after cancel_work_sync(&x->chg_work)
> returns?
>
> Removing x from phy_list does not stop extcon charger notifications,
> because usb_add_extcon() registers x->type_nb on x->edev via
> devm_extcon_register_notifier(), and usb_phy_get_charger_type() obtains
> the struct usb_phy with container_of(nb, struct usb_phy, type_nb) rather
> than looking it up in phy_list:
>
> drivers/usb/phy/phy.c:usb_phy_get_charger_type() {
>         struct usb_phy *usb_phy =3D container_of(nb, struct usb_phy, type=
_nb);
>
>         __usb_phy_get_charger_type(usb_phy);
>         return NOTIFY_OK;
> }
>
> PHY drivers call usb_remove_phy() from their .remove() callback before
> devres_release_all() unregisters x->type_nb (and fsl_otg_remove() calls
> kfree(fsl_otg_dev) immediately after usb_remove_phy()):
>
> CPU0                              CPU1
> fsl_otg_remove()
>   usb_remove_phy(&fsl_otg_dev->phy)
>     list_del(&x->head)
>     cancel_work_sync(&x->chg_work)
>                                   usb_phy_get_charger_type()
>                                     __usb_phy_get_charger_type()
>                                       schedule_work(&usb_phy->chg_work)
>   kfree(fsl_otg_dev)
>                                   usb_phy_notify_charger_work()
>                                     usb_phy->chg_state ... <-- use-after-=
free
>
> Unregistering the extcon notifiers in usb_remove_phy() before calling
> cancel_work_sync(&x->chg_work) would prevent extcon events from
> re-scheduling the work.
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can a consumer holding =
a
> reference from usb_get_phy() [1] still trigger a use-after-free on
> struct usb_phy when the PHY provider unbinds?
>
> usb_get_phy() pins phy->dev with get_device(phy->dev) under phy_lock:
>
> drivers/usb/phy/phy.c:usb_get_phy() {
>         ...
>         phy =3D __usb_find_phy(&phy_list, type);
>         if (IS_ERR(phy) || !try_module_get(phy->dev->driver->owner)) {
>                 ...
>                 goto err0;
>         }
>
>         get_device(phy->dev);
> }
>
> However, most PHY drivers allocate the structure embedding struct usb_phy
> with devm_kzalloc() during probe.  When the provider driver unbinds,
> usb_remove_phy() removes the PHY from phy_list and devres_release_all()
> frees the devm-allocated struct usb_phy even though the consumer still
> holds get_device(phy->dev).  Any later call by that consumer (such as
> usb_phy_set_charger_current(), PHY callbacks, or usb_put_phy()) then
> dereferences freed memory.
>
> [1] https://sashiko.dev/#/bug/linux-7f476623-2458-498a-85ca-75ee73ec5f0c
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108134001.53=
6207-1-hj351016@gmail.com?part=3D1
