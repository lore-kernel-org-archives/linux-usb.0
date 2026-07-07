Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE0D36492C
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 05:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401616; cv=pass; b=grm8CHMgaWp61IUp9qYAw2xSihy3Dl8J/q6atOkOKU5WTNKwToTBtHydKRAxRgDMCY3b8yPpDyWgJ0xauGWdFsLS7Eyd7rDvElwD3u3H2AW3KONQF4JWgyiqjwx60JobJAe/T3JoAzFDiGiKduAVm0Ch0GaBRGnL/EQdE1l3X1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401616; c=relaxed/simple;
	bh=xThja/YOLrs73p1GwKH8+OsxAlTGp4FlomletDBuHOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jK4x0WQeuDVrEzlQr6MrxrU0n1mZHPnz6TuMiSRA9kDc2o5nTC+IWoE5iKg0kDU+W/1vFkczyvt+2ELBSZLAgJe1xluT4uKoe7y0YWsEeE9g+VSKnwTIRq7SJNG8UbVaKpLU2tqqaJu1z/bmBErEliicf+OsmtAjhsxv1JPTZzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5y59PCX; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5y59PCX"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-666275a685eso5124359d50.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 22:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783401614; cv=none;
        d=google.com; s=arc-20260327;
        b=OXK8+nzQmkEZJRg1U6Cs5om/VZ5ll/bM3dL57v6FJaweJaRUKUmGtWHXyw35qiNROc
         KkDWfICYgT6T3GqgCJX4tWgNO8fDaizvH1LpoIx2bMv06gA+IasT4eaj8w6IXI/N/jTp
         +BiffoZxU6cQSaNjGDqAemafJTRaTefJRjlvroAx29AfKRh+rbnseeR6IAbAjEwjjLZF
         NRFCzCIS6gAuxfZVobVmwSQ2odAdISzsC0kCefehWpRliITZ6Zmtre1YsykV8UDxZ/0o
         2FcVC0Jb/LQqO5uHvnme2L9w0GlnnuHSMAdZSc/AdzD1ehd4SNtjLJ2G9KfTNPOaIcBc
         wN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ceiIrxAr70b69uYIUvEAod9HzClr5zoqxLtdkcPctn0=;
        fh=NdhwOaV9ljGGUFawEMLS0WmEsaPfCBuROE4P7aZNjFo=;
        b=rGDVaCAC/5AUa8t0gh17r/qLbHv4srcCA+E/TeDdVxTOptVfQ/DQDKf8H+IH89IyQw
         8ebmDLE9kQYQtyU0vsRt1vt1pL+XU4pEm9o4rHxx6xThvdI58ndwobIjt8UTrXZk/WTy
         q5Cz09lC/8Iodkm092riVyec+MiZP4a2nwcuviPxdNkbFJId6HdYPmfztbIjccrksqM+
         5EVPTRhmHCIldF/Ea/c89rX2QezpfR43+atUX/BM47Cn2+c0sRQV2djBFXXlYwdrYdI3
         7G/KLLo35fr0/eOcrbiWgtTal9WP7BO1YZTdzVJ1i9IYVI33wWE4HrgWGMOJGavZ6hNr
         y13Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401614; x=1784006414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceiIrxAr70b69uYIUvEAod9HzClr5zoqxLtdkcPctn0=;
        b=M5y59PCXa4RsNoaB5qeBqU0Lipbs2GMsMBZ4/W7Nbo1S2Iv8PFLUo0zS4Dv4aFBqVD
         M/nh2l/CO6DM8hAidjx0xcMYe2XL1gJQvPCaQBHtfYGkxWeuzm8U32RyjslaaIy0sPU/
         m67cKjjPAUCfpg85UoDeMah9QO0Bh5WXdNxQDCTfaXXXJqvk1jK2hKVZHW46WlwDxnLU
         sU+dEl2NyT9JnlLiutslOK/0yZ8k4BVH5M4gOVyHfO71xLgRUmbXF32zabWuBBDmmLjO
         sIwwFpBVRZh4zQB/WqxKDCDCWQ7KZmOZlOOozyFd5+sGz72rlAUd7MlMMG+2Lgg8xEJh
         HehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401614; x=1784006414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ceiIrxAr70b69uYIUvEAod9HzClr5zoqxLtdkcPctn0=;
        b=VcATUzTQgp6hVKgLhVsmNnANDibvhK2SYIXT12rd9EDdu0/fpxptSDuJVGkALbANqx
         HDUyAeroujFliRLh863YAPBYgu7dpS+7Di5bc/CQ6ekBWucMHQ9v6auwcIA2XUMK/woG
         vNblgKjZXIzfpQMHNZPopsHmfBgun2GlBwy4heDvDdi2+WCbZSGttsCtzE4BWdWQI+HZ
         /uLYiak+Q1qVhzZnXNzSpX6SuqLMXQnLhJx7Drtc8K21NVydGqKGkzRFhH+0ejwaDB31
         9W6ssLAzgSdyOvMgoP7rw4d6BjnSjgreCp+K7P5jkfqKY2SzUjgOoRnDutE2F04M7MaL
         uPwg==
X-Forwarded-Encrypted: i=1; AHgh+Roio6VZp2wlqNWfp3kK9h0miB/m07t2Ly3u/4cJ2A+uRNmL6ZMEC8w+ZvcfF9WJzpWfQU5ZIxVbihI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdZBO8TMjSpnpFk3rarOcNUPTbHWyqSSNL0MklXGLohFBBo6G3
	q0rOSnkuANsidz1J+w/RpFwHMUapK6EbslpsA1aA4mBKnhKjHek9I2tWVdi5rmgxRttp5voYT/T
	c1bAL63HS9TSmHdbwjLneRwYYZfRc/Rg=
X-Gm-Gg: AfdE7cnvvZifTdxR6FvEUvxvUbiXa9q7C08JiD60ySXS5jhvUDp61j35EVxvpV4HYSc
	SC5UDh1EWk5O2kJ4KiO0tmEOipiq2wA/PCMExvXQIs+LQZw6VL82K1N/+3fUH3hcwq6u1Fs0Gdn
	lGoSPGhwBeHN8Yc7hzAU9b2OuLmDHdiq1tkkgDh68hPnlQ6EDIGMBpZtGDrP1iskVX3Sv+GFzRV
	4QbEZQmNv7VHINe4+0pWMt4OIukCRNFMlNcbBTg2P6U1oDrXuWSToatnxm9kOdih85N6xJ5DDM1
	/kpfI55luU+kDeToV+HbuEXW
X-Received: by 2002:a53:c087:0:b0:664:db84:ed31 with SMTP id
 956f58d0204a3-6677fa39c3amr2066648d50.2.1783401614068; Mon, 06 Jul 2026
 22:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706151049.63470-1-mhun512@gmail.com>
In-Reply-To: <20260706151049.63470-1-mhun512@gmail.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Mon, 6 Jul 2026 23:19:00 -0600
X-Gm-Features: AVVi8Ceo1EWUz0X_LXzRXiGMHgFBV5_Dl7Ao-MwwAd5Q8AhFO_m3J-vqHF7_ihU
Message-ID: <CAMMLpeTdjtQQv2HuKMe+3WjaLKZZxPo5QywBA8_xd0c1Ta3KFQ@mail.gmail.com>
Subject: Re: [PATCH v2] USB: misc: uss720: unregister parport on probe failure
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 9:11=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> wr=
ote:
>
> uss720_probe() registers a parport before reading the 1284 register used
> to detect unsupported Belkin F5U002 adapters. If get_1284_register()
> fails, the error path drops the driver private data and the USB device
> reference, but leaves the parport device registered.
>
> Leaving the port registered is more than a private allocation leak:
> parport_register_port() has already reserved a parport number and
> registered the parport bus device, while pp->private_data still points at
> the private data that the common error path is about to release.
>
> Undo the pre-announce registration in the get_1284_register() failure
> branch before jumping to the common private-data cleanup path. Clear
> priv->pp first, matching the disconnect path and avoiding a stale pointer
> in the private data.
>
> This issue was identified during our ongoing static-analysis research whi=
le
> reviewing kernel code.
>
> Fixes: 3295f1b866bf ("usb: misc: uss720: check for incompatible versions =
of the Belkin F5U002")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v2:
> - Move the parport cleanup to the get_1284_register() failure branch,
>   as suggested by Alex.
> - Clarify the visible stale registered-port effect.
>
>  drivers/usb/misc/uss720.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
> index a8af7615b1..bd099cd8c5 100644
> --- a/drivers/usb/misc/uss720.c
> +++ b/drivers/usb/misc/uss720.c
> @@ -735,8 +735,11 @@ static int uss720_probe(struct usb_interface *intf,
>          * here. */
>         ret =3D get_1284_register(pp, 0, &reg, GFP_KERNEL);
>         dev_dbg(&intf->dev, "reg: %7ph\n", priv->reg);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               priv->pp =3D NULL;
> +               parport_del_port(pp);
>                 goto probe_abort;
> +       }
>
>         ret =3D usb_find_last_int_in_endpoint(interface, &epd);
>         if (!ret) {
> --
> 2.47.1

Reviewed-by: Alex Henrie <alexhenrie24@gmail.com>
