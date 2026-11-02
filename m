Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623474;
	b=GOvauha8hcss7O1xSmH8wb+kvsXu6BluhD4jD1wVFM6dZL+X7Hinio8RA7RQ0f3G1/KY
	 5UfaOpQrHqM4B0FChXWzP+384vFiG1uAH8JBn4HCop7d+BQWyYbU+fKNKh9M5QeOntDz8
	 DS6IfbjGZxiIa3HEFJ2wt86TQFTQCAgXBN4gTSbiZ4rY5voXr6dSAYEyvx+nH4l41+9kW
	 1Pk/Fa77HJUPIUA8+sFxU5VX6Dku89+0k7ICqs5DPtXrHvqBZTfyPhwOLkAaQ5v+aMQ5L
	 EAMwCk7DzW52ITmLlcte7d/tD4t9lLI3lmkJle84JB/uaBnQ7+m+1QsEz7Bvx/oSc4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=dYanbEJ7ydWKIVlseZIgyCbLcRNjwGo/7gUCZwqpJKs=;
	b=rvq0d56IqrIUkOYFaoyVbLVA9lTbtodajTYP5j9L06Az2XXzvEsgp+9z7Ut8SWlUwviY
	 V9qRYH1wQF36MYzFtvfv3x4sdXqjxliwDDVrGbrg1VejJNTTlQH5p1gnQRhDtZv2U+Vev
	 2BaLyNtJCLtdop2Ecc4qjcC03WbcRdZw+cluLfe9Py435YSx8WEfkZoL2xMMfxoZ9x038
	 EO9h5gxrNNpngFPAvug08uaPKH7jJ84EtNtXIIRQB8lyrcS9emIJcrzC1H0GsBRpCxk2L
	 s526qsrBHroyxm0EcrML/qcz+Sy6imrhvb71i+seF/MLxQx0DKH93V9hZFxXNESf0BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ipripHyn;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9C60A260E
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 12:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A9C60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ipripHyn
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c3fae9338f0so55820766b.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 04:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623472; x=1794228272; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYanbEJ7ydWKIVlseZIgyCbLcRNjwGo/7gUCZwqpJKs=;
        b=ipripHynXFhBUZYO3ONkgpAkySdmoxAaDbs93kVcEyX1tuR6xSxgQMnbjh+OfX4ozK
         3ROdQxJdv3Vh/6K70Ycd/gX7I1HGc+HbdWgEcCn281ZdUL5H66Hb2hfk1oIwK8OyZGCV
         YqFq0wo6Z48sEqRXQJVBxDPjcHuXWpPtINRmOjaKecvPs6TuwLfdDiPm6RuhX6UabD6J
         3PWpz/tm8vagnQFLxPv/SqjZySmGtt8OdhXGJhHWx0svC6YSsK4K/BHln98i0VrJwGQB
         +yYMwH2I5/K64IWYRaWxD1RnvziHZPS0ZDU2Yv7bxaUKh4hD44bxeluaiDP3p5/RpAKz
         ERqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623472; x=1794228272;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYanbEJ7ydWKIVlseZIgyCbLcRNjwGo/7gUCZwqpJKs=;
        b=FTky+f25qGgrrIwDj+w97yYVL5tC1aXHkHFX7dr9qs1w+w092ptujICaj8Ru0SRFag
         1wLvkzTMtNL5yagDQVYe+AcVL7sDMj0/tzj3j3ZwTcCnZDetDvLBfyNUOF2BE6ISjpCC
         2l8ap4OTQ3Xt0fb8SUfkTlcZHuiymjppfJ2cXFyoRsnfoApr5w/Taqc8Q8Iv2FlKwKSA
         zNCAvfzrjpwhWC+pM0Y+CXyLcueOnTuDBcaS+DQ8xJLAtGlB5q1CeY+1bjAYFq0zJM49
         cqD+/HNK7hfW7YFcikhEE3WaZxlLQpSCqDJv3VxM8NOviCwMOTXM/JtJ1mcKakRx/FSo
         C1rg==
X-Forwarded-Encrypted: i=1; AKwUvBx0YlIhj6f7kfJbFQ2IscEAzqnlPZkA75DV7d86kmG782CJidXXRSI4Awq5pqE6sVtiqZJ4P/+ItKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kEtqx8q/jFYOiAGvvtaxmwL8LDbVhoMWGMKDOwP1iaOui1Heu
	FL28KIzjqlwbVJ1LE9rNV6n4K30lDbEXJy+o8CdPpv+nPINRxUJEO2LX
X-Gm-Gg: AYBFou2g4A8icYfEEtc42ULRlbmX6zSVH0GYCh39aJAzRyJEYh9veYWbF6uUIKXZxN7
	Wm6EP2ReB+GyY89H01oqR9SN7uGvfO/7tNM2RRbvUGEHpU64vJHp/GlDtcoUaW8kuP2GqfLEwYI
	PMRnK98W/O6ox8MUlWsD/P+7ApAB5rcVHnJbilxPhU6v1rkgHhfcuwLjZZ7lxhxaaT+lHgxOcJ6
	IRFA7KWD20jGc4o9vWdFWGz9xUIltLkmD1kJ68sdYld4mGYtcgyoyU5XhL6nhsu71EnRBeJoRwu
	wrO8IwdRjisvEH1E7eG5Zitc76XFGzMSsAK1jnz1QIo/gHWP7ErpmUAhbinghEutG+pkmpFmm8A
	DHucS79cho6+G+rntX98Nx0+LJC4iucWbVVLL17EB+WGL5bqJiU4QyW/+sLVKrVUkhiOcPqOsSn
	jP3humoMcVU2g1SfoQsQsq7YZeSZUY/Jmhq2IxIxfKBYiABRH1cK0EvwQBdCKmMk2EpMcVfbo9I
	P8Wh3pfRWqv+5EOlPYhZxXzTvf5ISp2lk2uDtbBblMne6W3aKqaSFMsMPlJTvYgos2GPgetgHAs
	9EXF0WHrdi4Jsj7q4R8wz8AoA9+3RbJnAiA2xQenbsWwCzgiW88NFlB4MSEfrViAAkzhK4F+mdL
	l3KQ0C5E4sSzyFwcgC8M0QK4cEV3p1vwVwpg=
X-Received: by 2002:a17:906:178e:b0:c46:b5a7:5b29 with SMTP id a640c23a62f3a-c4ca7a50798mr780727266b.2.1793623472076;
        Mon, 02 Nov 2026 04:44:32 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca214fdsm3152504a12.36.2026.11.02.04.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:44:31 -0800 (PST)
Message-ID: <bbd1ec87a9fff50b189f74cbd21e1d5bddf41136.camel@gmail.com>
Subject: Re: [PATCH] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?=
	 <michal@nozomi.space>, Paul Dino Jones <paul@spacefreak18.xyz>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 02 Nov 2026 13:44:28 +0100
In-Reply-To: <20261029-b4-pidff-rescale-exponent-v1-1-3ba54accf767@cherr.cc>
References: <20261029-b4-pidff-rescale-exponent-v1-1-3ba54accf767@cherr.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-10-29 at 00:04 +0800, Shengzhuo Wei wrote:
> pidff_rescale_time() walks the device-provided unit exponent one step
> at a time, allowing extreme values to cause billions of iterations
> while ff->mutex is held. In a UHID test with an INT_MIN exponent,
> EVIOCSFF took 3.1 to 4.3 seconds to upload a finite-duration effect.
>=20
> Stop rescaling once scaled_time becomes zero, since further
> multiplication or division by 10 cannot change the result. The u32
> value becomes zero within 32 multiplications by 10, and the u16
> input within 5 divisions. This bounds the loops while preserving
> their results for all exponents, including wraparound.
>=20
> Fixes: 8713107221a8 ("HID: pidff: Rescale time values to match field unit=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> ---
>  drivers/hid/usbhid/hid-pidff.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 22951b7ecd17..1a2fffcf204e 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -354,9 +354,9 @@ static u32 pidff_rescale_time(u16 time, struct hid_fi=
eld *field)
>  =09int exponent =3D field->unit_exponent;
> =20
>  =09pr_debug("time field exponent: %d\n", exponent);
> -=09for (; exponent < FF_TIME_EXPONENT; exponent++)
> +=09for (; scaled_time && exponent < FF_TIME_EXPONENT; exponent++)
>  =09=09scaled_time *=3D 10;
> -=09for (; exponent > FF_TIME_EXPONENT; exponent--)
> +=09for (; scaled_time && exponent > FF_TIME_EXPONENT; exponent--)
>  =09=09scaled_time /=3D 10;
> =20
>  =09pr_debug("time calculated from %d to %d\n", time, scaled_time);
>=20
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261028-b4-pidff-rescale-exponent-1d5c4e218e6d
>=20
> Best regards,
> -- =20
> Shengzhuo Wei <me@cherr.cc>

Tested this locally and works nice.

Should we maybe add a warning to the driver that the time exponent might
be out of a sane range? Sane range being, say, 10 to 0? This of course
would have to happen during init stage not to spam dmesg.

Regardless of that:
--=20
Reviewed-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
