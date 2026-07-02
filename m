Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B221A6835
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 00:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782953246; cv=pass; b=ic2WE/zhndQz7dpCjc2c1C7FpmhGHZCQ5GMTJr0jZ4vw8mCmjY6Rlk2xMsQUwBbP9XJzV8YmR7HUa+GMbl6jl+DS+jhymvu4kMdObUt4JjVnRo45OoB1gwZWyAWwSMdvTv+VVfEUwYkJk2XWuu/jelIZqKdjdopndYjgZvqTJ14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782953246; c=relaxed/simple;
	bh=el5EsMRYWMvqhrLthyzhD5MTMKT3hUlrX8yq7m0op5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q75xnH1WmLALwSn6mIRMKzqy9ss3G8kYctYiX+jOd7U1fnhxHvDsnka6URi5a+293CADy+GgMlqG9KfVINrpvF9ZypJKKEdd6DDwZblXVnwWVShH48G9Ee85lLc3chjNPvwdQRM6ZfknjG6LrdELMK1ukeCvzSxmRpaHL2w/oAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBpZpMnr; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBpZpMnr"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664db84f074so1384169d50.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2026 17:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782953245; cv=none;
        d=google.com; s=arc-20260327;
        b=GnrSaMXIg1p7QysxDhfNetvDwgvzyUGHAfVcYAGZBXQjEZZgM1M2+1p0evxsUl7XZM
         jutIU82IyFaWiaFnppZs+6edYDgpuohIRVtjazixhjC00oWuhe6LQzWvcu59txIOyfpv
         Zy6iBn2Ss5M28IsFwpV2qKtDoXOOg0V3h4N8HovTs31xKFJWzw+10QpDP0YC5vak+vam
         AsbPepD+Jx9wnepx/OGS9DxUqkSCQbB+4oCawJiYvsvM4rDNYlKr1ORC485ykEKwzvwY
         PYFVKs3csTL+Fh7L6JX2ZSNPPvO4PB4/Hd4FNnFXwrD3XBAVqNFVJfanC3HPTLXv0T2M
         0Kuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vCPFPx+PcZzcNHSg9tBDkwND2L6CeBxw+Ct/uPJnB/0=;
        fh=d4s7xHiH/FxhbreN3S4P1orZGh/5p7TAxvhBi9vZYYQ=;
        b=GikDQc3VwAhWQZrSxEWsV9mixXoMZEZhjTk8/I/0gf0b2zss/U3fOlk8v0jwgN3cRb
         lJfAmntn6Qui+ZWTZgfp8pcQxOaZvMpfnZ/iEpuxXFRES8p8ba85r273HlYEGDOJpLwb
         hki2cboYkGl7ZYhMgHATxL1ficSzyCjIZBDlzrtgRIJPChQKF02zqApaf5M6d8MXwAnb
         Ck/tGwt2yOh/V8LWtdOlH5xzKFCZw/6cQbOHjTZcGqT7HdsAOKd2Ee+uuOWXpcepS4jS
         2dTP2AbDDDf7rY3KGwCzzMGOZ1c8MEVlvoCt7NTVjH15PQeChBd3Qz7zYeaqJKFVqH4n
         G7Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782953245; x=1783558045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCPFPx+PcZzcNHSg9tBDkwND2L6CeBxw+Ct/uPJnB/0=;
        b=lBpZpMnr2Me2D7FRHCm2EGLx4h/AQfGnPdff+m/hei2R3O+F4Aamrb3zDw73cX+Ej7
         nloimyD3XFR0YoUozpdyAhKyMreTP0BsjNk4Bc+wDhGblMJiXunRseIm1/9+CiLHvc/t
         ajGhrmd+EA7WLRkLRjo9sR/sdUgpdx4MoDDVMIIWs7PlBmRPbGFUqCt5cZ11j3yvdfp7
         bnIc3BpJOEhZSTi7fFvl8caZdF9EgTrZ2zdcxe9NknmzQZJAM5fnAI26BusqVlaXy7kI
         OiscJog3CBPmkYY6jSQ7I54RMnq1AIVpWYFcz+W9AZMhhsFrQUiiKzQonqUMbsmchc2F
         PTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782953245; x=1783558045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vCPFPx+PcZzcNHSg9tBDkwND2L6CeBxw+Ct/uPJnB/0=;
        b=DR5KUgKUZTlCapqr6wShxtNTL0zJ3XxQ8gvtHVMz4RF+GJa3li65AX3PSfJ3ek8XnP
         tCK/OcZZsWse9fr1mhoWRjARGo1P1SIpfqMopKN1zFYEd16K8cUGrepjOVGUeVd8zQrO
         TET1XXSGcpkL7P3BrGd91xIkKUWe5uKzwBj07UTI94UqGF9nQ5ge7PM4Uf1jucE8KT/D
         OFHt8CoDIm9BN+6FWljVU0T8J/gBGsh1R/tz3YRc40zQoBqlFGv/7kZqimRWo/rkhQ0/
         spFq4ERMEIwI8w9yUYncj6Ks92IiMA0T17RIQ5LgJS23Gj+rH9ZrdeaQJ1f7BvuV8AXN
         +rmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr7kr3CwZL48pB70YMeC5NbWUT52WSi1LYJas25TatPMvG1nTkIIVojfEuA5bGn0en8Arxmm6A78MM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1+PuGDvH9pgU+8yD92NsmAO0S2bse7cubxaT/iws1WgpXfuN
	s7FcLde2MIqcyhOkSW+GGNUK3uAuuZVe4eFlfFUw/9OGwtQqsDh5RfYHdhj5zGQPgIwenUy9yLN
	DWMVAz2WuZn3USdKcm81Dg7R/JB7S6+0=
X-Gm-Gg: AfdE7cmXIIkHbFDq+V+tz4mLL1BEWBNeX80SAVwF5WSgkCWqzUNq8n1ZoWnG9O5t1ZY
	AVXUMS8oclMDT3h+uFnWvCg00jPDu7wcYYZsMDoeju3MRKuxNz4APPOKnorKqvKAy8397IqSz6y
	LOdkinCJF0WjNeaq/7IKsHz6E8N09L5MFqcfGDihd1NFEbog5M8OUac2gfeMV/qJt5BAKgz9soz
	Vc+9w+ousddaOK2mvg0DwE3vmIfGAln2ZwSSGX3HzQ6COhz6ia+pfpxVOxvX20eC91k79iJdPGb
	aMvSS4HBKlAXb/r/p5lCLJY6Yx3pVwpTd8SHLDlF7AO6ixd01zpE3uPr5Eo=
X-Received: by 2002:a05:690e:1685:b0:664:e8ac:21cd with SMTP id
 956f58d0204a3-66521a9939fmr3721690d50.25.1782953244651; Wed, 01 Jul 2026
 17:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701122246.2451-1-mhun512@gmail.com>
In-Reply-To: <20260701122246.2451-1-mhun512@gmail.com>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Wed, 1 Jul 2026 18:46:00 -0600
X-Gm-Features: AVVi8CdfCP7TKSk1Ku8iKCpyX5RUTT9yUb-rTvsI1071-8rips69S_lX9CQHxt4
Message-ID: <CAMMLpeRLti0iD+sT3WDd8VG7-Na132ZdfzVEAeM0LcbBbNmD4g@mail.gmail.com>
Subject: Re: [PATCH] USB: misc: uss720: unregister parport on probe failure
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 6:23=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> wr=
ote:
>
> uss720_probe() registers a parport before reading the 1284 register used
> to detect unsupported Belkin F5U002 adapters. If get_1284_register()
> fails, the error path drops the driver private data and the USB device
> reference, but leaves the parport device registered.

>  probe_abort:
> +       if (pp) {
> +               priv->pp =3D NULL;
> +               parport_del_port(pp);
> +       }
>         kill_all_async_requests_priv(priv);
>         kref_put(&priv->ref_count, destroy_priv);
>         return -ENODEV;

I think it would make more sense to set priv->pp to NULL and call
parport_del_port(pp) right before the second `goto probe_abort`
instead of calling parport_del_port in probe_abort. That would avoid
the need for checking whether pp is null before cleaning it up.

Is this just a memory leak, or is there some visible negative
consequence to not cleaning up the struct parport on failure?

-Alex
