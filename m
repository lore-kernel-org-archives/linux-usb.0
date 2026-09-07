Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC2843B3EE
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774264; cv=pass; b=m+vKJAMKaqFO/AD/oEYnO/1YPd+f+vPkdpr/AOYju4+xFn6Er+NwpkZq4gXmNKt30eOqi4PseWNyJQ2Yvwawxyp56NMROnW2n1ep28ozPZtK9+izQuNhQyKvgo75MRWGUMNiwYDn8nUoHB5pQa4+0x3XS9NutQQGITYSngInB/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774264; c=relaxed/simple;
	bh=MI41XlQsowXvuVw3HoU1qvNe19RJs6EkCkyiQjsEXzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fxlZIVZ9c0jFNkCRvUKFIeOjEOgdnHYcNyrs2YLAbKyzQTUdBe1A3gQJ9ic2uznSD6RKOtF/UW0KUdvtAowH7sUE7skp7jy6GgxHJm31clfpVXY2KQ1brLAfh6ysPNwkL6StF0qZ58rLaUMqWz5lSjSynfY6kSkjgKi4dbDRxlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cqJB66Fv; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cqJB66Fv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso33258155ad.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 02:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788774262; cv=none;
        d=google.com; s=arc-20260327;
        b=QSdaXV2Unbq4rf5aOWuH90Iv0NV4bQ3USmPb3ZAlrJxHTflFDG13C6fcabBbGc0skB
         ApqFUyzpeE3gvIgYo0RXMd1ufxJguEPWc4mtitzQlo2nigL+HxK4AEWt4dZ9ypJwSHX0
         f229H6/NKDuoTWXxaWY7jaLqDQogeg4aqPcmeowXrnZiyoFTa1TeJtM1BtKBARj8ry/P
         Obf2z9F7sh+UN1MPnU212DZVmEfRZicKqlhr516RhkhqL7jTODUR8TDb0u/rjdZyDdt9
         uUZimSpvDUuUVCa1WQ65+spfUhVPAunTAd01clYyyHhvBfKx5sS2WEnnaaNKEPSZ4/XS
         3A+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/xnlyu8PQCnxo+4HJ8JoFUVnIyWkmOXZV+LXEWh1vw=;
        fh=XvKnNby2l35AdgBrg9pp07w90QobTj8GjGW/+KPR1Bg=;
        b=OQy8RMMD1AhBvKPUVmd0HkYEIm78M5hM3W9O2HmIeeOo/v+aXKPScxgJvwllBvEg2e
         pUoe0B2DzlL7v5ioT8NgBClctLEGAEyLwVY2MezQYn2+uuRnb0ExwG7Auwst2N7tOf4Y
         iDV0pVL53ncI5gis10BHLtuuHGvwWKrJ0nC40G9cSLDfdp2e3V47EaJty6luxktoMzDk
         UHU/pST4k1/WIjc0JhchYpGxlqQy1tqo7j8ulE/u7ptWm05UQawPfStuFaIIjKFQcc36
         NDlH7YplWLoUfRk8aPns9PHD1M97AFt9B0vI2g8EPF7leOBdbxzcnWSkJ20mQz9tcPDV
         ezWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788774262; x=1789379062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/xnlyu8PQCnxo+4HJ8JoFUVnIyWkmOXZV+LXEWh1vw=;
        b=cqJB66FvOXxHOV4BATJdzYvlzDrg54IgSkxINCUiQLk9IDg4jj7MtnAWmCWXt67bqI
         gT58QiPjN/RAOzb8j6sGTLkR3E83EilolDC1M+NnZOVFxqfoO2QDGk7SgU4A20NtD4Sg
         KWHWjPD42BgsGfzKESDXY+4/AEJG+TCztPaSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774262; x=1789379062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/xnlyu8PQCnxo+4HJ8JoFUVnIyWkmOXZV+LXEWh1vw=;
        b=WefcXy38JNuA6sP8rTDQryBg8F3PSjEjLGA122RZJk6BlAcD2fHxGAw8vED7o5UsxW
         Tzup25WAMT3ly121CKWOVNL4knQwVIMClxpnRZ/5G5bmftFcgDI9N89fuoDnxvf+NjWl
         UUNA7BfcxhrKeaLKM6wn00Kcjrtsf1UnjbrizvgNrYG00GpEHmjKi0osjMh3B1tMvMh7
         KdWenRr4WmS2wgsUexLIkiJKy7NBB5T3LtbAPK9IXYS5gQTiSw7N6SZWAQ0Uu33391KA
         QRcSMX+94qY684tk8kMTota5DeU2xl7WDscqe2XYFkCtDtZQu4YaYqosnGLYPx+7XNAj
         7jOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYsy1EMJKr2wnyQygimC+RxYWriWPwCZyhi8B9YlE34cP5+l28fOQh0PQ4y3VdbTdWyuOLyG3xsyY=@vger.kernel.org
X-Gm-Message-State: AFuF++k3rebYRnU5obAfsEvSWsyjKOCKD2g/rrJRdh8S6s4ERaaJCYTf
	5BiUFm5utxxF1zBcOP5rp8qmI2nmfgm2ydLk0RTmuwb5adU+m/iMINQmNwvmS6oYgD1IezpUsuL
	1k9jpogkr5y7yHxaBah85Shr9XKl/viAYdcB5Gpte
X-Gm-Gg: AYBFou1f8lfg0Br0lMdnv+1ZxH33fe6KXm4MDEPZZwvUpNuZl/ZeffIzkznGnd7f/KZ
	PKDEvahfiBgDJ/4j2yl9OVxj2ze1rYqFq6gsmS9hqQHu525lcZscJafiTopdyw1f3aVMUjpMB8l
	pSkv6eX9QFenNNHbh8e4dXZz6j6cy7bKTWA8gOAMrqk2P77aJn2FCfQH194wwq/ZNqFHI69sIbs
	/st0XEAV3xQmvbqofojRaOt1H4HmlcNUQ0+EY3PW1hwpmqP2YK/Ow72gmaW9GlbzP8Zz7JciL/f
	Zi1Wjs9TZNgeb7ab2TYPE/i/bYy5tipbHXCyR8WM+73QLy39EJzw751yLX1wLkFKSFPpoHqbHA=
	=
X-Received: by 2002:a17:90b:5106:b0:37f:c22a:c188 with SMTP id
 98e67ed59e1d1-39b260feb03mr32280186a91.4.1788774261208; Mon, 07 Sep 2026
 02:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904234401.2339633-1-jthies@google.com>
In-Reply-To: <20260904234401.2339633-1-jthies@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 7 Sep 2026 11:44:10 +0200
X-Gm-Features: AcwNN1WMY3fqhnicN71CEKCWOY9vaZG4m4eQH1V9NiV1awWwS6rAM01YuF7ygVM
Message-ID: <CAMMMRMd-7=hzAiMASAkgUxxG50+sNQQUQN2=dNOS_THVjDmxxw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 1:44=E2=80=AFAM Jameson Thies <jthies@google.com> wr=
ote:
>
> The UCSI displayport driver indexes the connector's port altmode array
> with the GET_CURRENT_CAM response after checking it is not 0xff. The
> port altmode array is UCSI_MAX_ALTMODES elements long. If the PPM
> returns an invalid GET_CURRENT_CAM response above UCSI_MAX_ALTMODES and
> not equal to 0xff, the kernel may crash with an array index OOB error.
>
> Update the UCSI displayport driver to verify the current cam is less
> than UCSI_MAX_ALTMODES before accessing the port altmode array.
>
> Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>

> ---
> Changes in v2:
>  - removed 0xff alt mode assignement when GET_CURRENT_CAM returns an erro=
r.
>  - return -EINVAL when alt mode index above UCSI_MAX_ALTMODES is returned=
.
>
>  drivers/usb/typec/ucsi/displayport.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucs=
i/displayport.c
> index 7067f2561b84..572da7bbd29c 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -71,11 +71,14 @@ static int ucsi_displayport_enter(struct typec_altmod=
e *alt, u32 *vdo)
>         if (ret < 0) {
>                 if (ucsi->version > 0x0100)
>                         goto err_unlock;
> -               cur =3D 0xff;
>         }
>
>         if (cur !=3D 0xff) {
> -               ret =3D dp->con->port_altmode[cur] =3D=3D alt ? 0 : -EBUS=
Y;
> +               if (cur < UCSI_MAX_ALTMODES)
> +                       ret =3D dp->con->port_altmode[cur] =3D=3D alt ? 0=
 : -EBUSY;
> +               else
> +                       ret =3D -EINVAL;
> +
>                 goto err_unlock;
>         }
>
>
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --
> 2.55.0.979.g7e5102b832-goog
>
