Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA60736654F
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 21:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286263; cv=pass; b=ro9YxbQwgjA7CQbjVF1vwKK6DJnZWxEp/NDclh3acTNpiYS9ocdPNLl/xVgl7s9NK9WUD6/1Tu3A7RKtewviHBu67LADggC/ZDtBK4+PkeGbRq4BLbTb/3FjDhPiaAOvCmPv8OU+dAvwR3DOSbvS154rcpVnGwyvI0m/On7abz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286263; c=relaxed/simple;
	bh=Wgru4OjuVg3jCDnGRQ58mHB/1Zm4b8OJkeS6vEJYfo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pex6TeYWkQ2YtJ851eFQ7WuX9srmgGKjx5OSBliwVlqubujW0TX6G30gdk9Ze89jJ4w4ocjRc4szsB5GOmllrcm1B9uesTUXUx7iibskgHWDkv4wYbw/FHJI40MnCNcaawVopZTy0lh0QL2NPk+fQiMqE78Uk2dQ7Bjx6lN8R2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAFivdSO; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAFivdSO"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso488449a12.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 14:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286260; cv=none;
        d=google.com; s=arc-20260327;
        b=nR2MCLR4UjXYo11E6zzLU0E4qY7Kq3ENGVjBn7rbEbsqEAfXNUP1jBuk2pai1DEj/C
         CzXQqvwhD+X5dQiZ/5yXg+/kaS9lmhvlZOWsNOy1M/qJvCdL+PZ0bH/njTX7iwENsB96
         TCxi5Mt7FLEiU3iGuJq2uJrprNFXdB13Xw9Gf0Y/3TWXmBMKJoBvzAPMRSx5SFOe9JQD
         a2siXny1vNFQHBwtajkJtAHzhhPQytef4XZ4e+NGb8uNDTDRusquFcvbn4aoDtgy7w1a
         BUuCNDrEw5aUktj6tDp70DeNuIulWbYWCs5k4+rirs09iWe/+tCUFXnUBywO6wtrlp8K
         qKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Hd9E5QifhtpgtcPM7YVUZkrW6k2XVu/g81y+pYANv8=;
        fh=YVHOa+bcyoWbkQ20IE3qouCDtJAHpi6lDjUJRWpdTT8=;
        b=HQgpEjhV04Jj+WDsxHDliFkdqqqZlHeVm7yEGSPtsW7KiRZw/8EncR5uGIPZ1fQbps
         6vsU5VW1fSjEVnuICWZNtx/m7w/scokwZgFcIS6US+05Lm9i/LVbTSBCG4rb4+/jiI8v
         nwAdFjkNOG8aavBK7t0v/oD/GiMqHxTKfeLIHzM34VDzWs7li71JtzoFrnRwbC/MtUjv
         qWsQp1K1CH98xO7/57K/0FpGu/IcPxpeARbWXXjIXqr8laIXVAUO+o26RM0LURv8kNZj
         YyUdbk2/V48TCkyccqykotosmTCoJ5jDNM+4cYGYyrI1dEXybDHxlZt+0juoIhhT2sdf
         gCqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286260; x=1790891060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Hd9E5QifhtpgtcPM7YVUZkrW6k2XVu/g81y+pYANv8=;
        b=XAFivdSOKjXL+7nAPoMuFVquY8Lou20uQBDrDdNDuHjmU2iiqFjzpWFRBatDFk6a+x
         W8U56MV6xHSTrf1mrh0MfvY8nFkZ8g2yoRPlyrPKaaGeYJhma7IEgfN6jaoWOqjDdaIF
         COoNTOSmZjTZXMcHKvHHOTM+VXX+Hqowhs6eO7TLnT3DentisECxHP69pCTVUhB2Cpau
         3JgXyPyGHAFff/4k2/4WlFRO1KBI34R9NiuSTBesLdalq/7Or1aOE3+e5dzkWWabROxT
         ud77JoG9543uA/xpm65kVcrz6pJq2zwF7E/FjKzbEl6hdLaZ3ifGEZ/T8jLxI2H4Maap
         Y29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286260; x=1790891060;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Hd9E5QifhtpgtcPM7YVUZkrW6k2XVu/g81y+pYANv8=;
        b=Ak2jAOxgHo16Q8mb5fp4U2y7xJP6vel6/geBvn/Zm2aXIEa7mKYAL0wgTJ0IVgCyZf
         u3axNjztvi8bMPLL/DQi0DEGa5hd97auzLljSTROmnm9Tw1FETzmHjsnf3gzI+ApXbYk
         dty3t0vXUWg+Oi8ME4m77BaZ38IprJ646r5z0xh1nRhArgPSVWH7xkslRvSDljDXtcV2
         zGLpTkGu3yiaOyi7BgWqmo7chUHQMbxnun2v0QV8o+dxeLHYFb4LDxNTRjA6itCkI0Kr
         zOv6og4rf3FyBlRFDq4epRQyODa82G+VbUUXpsdgLWIxyy/MtdxxuvfaKGk4W8xcCBtU
         3u1g==
X-Forwarded-Encrypted: i=1; AKwUvBxyxkMzMd01pqm/+NvlZAzZx2AE7cR1SSPA9ZqFQbUOp96jxfDeQR+PYWivsfxrOe5Mo+oS46iZsDo=@vger.kernel.org
X-Gm-Message-State: AFuF++nEiic4YNWGPc92+hVzFemMcDg/GN/qVKncd4mcc9Su0SAl1vUe
	hGWZsRBUC1k2kWdQujbUWEIDhwncQ6ezGC0njaBDY5e2eIDXhbcFHlNHYJUkNrVTUpT7xx8IWP+
	69M1wa+2yTMjjZR+Ga8nqp72If/zs9w==
X-Gm-Gg: AYBFou1stUXlULfeSiHQi0uZm5PLxl580KcIWd+rQM/5Xt0P2stk+vEKtj93sjqVbeQ
	KJoBhoM30Zo7JIk3A1yT/t/T3JGKYY53jTB0Ra8SrD1AV+iGIL/FbF518UHKoGEf21QLhzpG7J0
	EAklKR9EyKMnso3A68YoTG8JAxNN4IUd+NwBG3fx+og8+AvUSyHDDY0aYDUQg4V+xEd2jxNrfxe
	3CVdSwhbW8uyCarlG8msLJH9jeHkf12D4c3hSHLXSBAdZNNbEtGK/cfF/fFneuHJ9w7ZKj+q1IU
	+kECpy6Dw7jT1jcX3uwvFYIKvtecmIrg5vnm+i6SqevQuLgdUhUGD59yj67y+lD5bZTMadUlQ34
	Q3bn6FXnEf/1YzTNuCY5pwNXiR7PqpA3Oy7KAUusYyUxfoJCmYTv2s8WJYwinJ4V2mcAO
X-Received: by 2002:a17:907:d789:b0:c29:5172:6151 with SMTP id
 a640c23a62f3a-c2ac263bc06mr316219466b.45.1790286259718; Thu, 24 Sep 2026
 14:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923022033.957777-1-mhun512@gmail.com> <f1c55b79-4487-40db-b2fc-342b2dc33c1f@linuxfoundation.org>
In-Reply-To: <f1c55b79-4487-40db-b2fc-342b2dc33c1f@linuxfoundation.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 24 Sep 2026 17:44:07 -0400
X-Gm-Features: AclHuK82jDvsEJh3-yxSL0CblB52txRSE9rfFHLJvMufpWcIZEhKrFhkUYovzkw
Message-ID: <CAGEsz8E7TT0SqSPxpJS7QbAvAwXF8n6_ra4VPvN=q0SHdavm0A@mail.gmail.com>
Subject: Re: [PATCH v2] usbip: vudc: Prevent transfer timer rearm during teardown
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ijae Kim <ae878000@gmail.com>, Michael Bommarito <michael.bommarito@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

__must_hold records the existing locking requirement for
v_start_timer() and v_kick_timer(). The old comment was inaccurate
because v_stop_timer() runs without the lock. timer_shutdown_sync() is
the actual fix.

The QEMU harness sends CMD_SUBMIT packets while repeatedly unbinding
and rebinding vudc. It reproduced the bug before the fix and ran 4,000
iterations without a report afterward. I=E2=80=99ll add this to the v3 comm=
it
message.

I have not tested with physical devices and a remote client.

Thanks,
Myeonghun

2026=EB=85=84 9=EC=9B=94 23=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 5:11, S=
huah Khan <skhan@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 9/22/26 20:20, Myeonghun Pak wrote:
> > Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
> > vudc_remove due to race condition") deletes the transfer timer before
> > vudc_remove() frees the vudc, but the receive thread keeps running
> > until usb_del_gadget_udc().  v_kick_timer() calls mod_timer() for
> > CMD_SUBMIT and CMD_UNLINK even in VUDC_TR_STOPPED, so a packet after
> > timer_delete_sync() rearms the timer and v_timer() uses the freed
> > vudc.
> >
> > Use timer_shutdown_sync(), which ignores later arming.  The transfer
> > state is freed with the timer.  Annotate v_start_timer() and
> > v_kick_timer() with __must_hold(&udc->lock).
>
> Can you explain why __must_hold(&udc->lock) necessary?
>
> >
> > A KASAN and DEBUG_OBJECTS x86_64 QEMU guest reproduced the free-active
> > timer warning and the use-after-free in v_timer().  The same harness
> > completed 4000 iterations with this change.__must_hold(&udc->lock)
>
> What does the harness do? You mentioned it in a response, but I would
> like to see this in the change log.
>
> >
> > Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in vudc_remov=
e due to race condition")
> > Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@16=
3.com/
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Changes in v2:
> > - Drop the lock-held comment and mark v_start_timer() and
> >    v_kick_timer() with __must_hold(&udc->lock), on the prototypes and
> >    the definitions (Greg Kroah-Hartman).
> >
> >   drivers/usb/usbip/vudc.h          | 6 ++++--
> >   drivers/usb/usbip/vudc_transfer.c | 8 +++-----
> >   2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
> > index 5ef0e7d9b23a..c129f4c56e8a 100644
> > --- a/drivers/usb/usbip/vudc.h
> > +++ b/drivers/usb/usbip/vudc.h
> > @@ -157,8 +157,10 @@ int v_rx_loop(void *data);
> >   /* vudc_transfer.c */
> >
> >   void v_init_timer(struct vudc *udc);
> > -void v_start_timer(struct vudc *udc);
> > -void v_kick_timer(struct vudc *udc, unsigned long time);
> > +void v_start_timer(struct vudc *udc)
> > +     __must_hold(&udc->lock);
> > +void v_kick_timer(struct vudc *udc, unsigned long time)
> > +     __must_hold(&udc->lock);
> >   void v_stop_timer(struct vudc *udc);
> >
> >   /* vudc_dev.c */
> > diff --git a/drivers/usb/usbip/vudc_transfer.c b/drivers/usb/usbip/vudc=
_transfer.c
> > index d4ce85c4c6a2..ba625622975e 100644
> > --- a/drivers/usb/usbip/vudc_transfer.c
> > +++ b/drivers/usb/usbip/vudc_transfer.c
> > @@ -441,8 +441,6 @@ static void v_timer(struct timer_list *t)
> >       spin_unlock_irqrestore(&udc->lock, flags);
> >   }
> >
> > -/* All timer functions are run with udc->lock held */
> > -
> >   void v_init_timer(struct vudc *udc)
> >   {
> >       struct transfer_timer *t =3D &udc->tr_timer;
> > @@ -452,6 +450,7 @@ void v_init_timer(struct vudc *udc)
> >   }
> >
> >   void v_start_timer(struct vudc *udc)
> > +     __must_hold(&udc->lock)
> >   {
> >       struct transfer_timer *t =3D &udc->tr_timer;
> >
> > @@ -470,6 +469,7 @@ void v_start_timer(struct vudc *udc)
> >   }
> >
> >   void v_kick_timer(struct vudc *udc, unsigned long time)
> > +     __must_hold(&udc->lock)
> >   {
> >       struct transfer_timer *t =3D &udc->tr_timer;
> >
> > @@ -490,8 +490,6 @@ void v_stop_timer(struct vudc *udc)
> >   {
> >       struct transfer_timer *t =3D &udc->tr_timer;
> >
> > -     /* Delete the timer synchronously before teardown frees udc. */
> >       dev_dbg(&udc->pdev->dev, "timer stop");
> > -     timer_delete_sync(&t->timer);
> > -     t->state =3D VUDC_TR_STOPPED;
> > +     timer_shutdown_sync(&t->timer);
> >   }
> >
> > base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
>
> Have you tested this with real devices bound to a host and exported
> to a client?
>
> thanks,
> -- Shuah
>
