Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778103;
	b=sdNSwAhsgRtxc+z0TAAhT6rKuwcNLzulY6GAy0ji8wNXTpK5wdMru9ZoVt3hxvMUudy2
	 nHVCn9mh0Ws1TVZCYOpkKYF7HGDlcatTVEdMKiOYbjqShe0mrcgoyPXTflttFNghN/dsq
	 e27VwcfCbOd4YY7SraFbSyS8gUV2DiuX0bf9cuNVReEa9YSS0qhm/GRxtDuOcrvEmWIqE
	 HMqv4MhMH3mfNcUaNkStpmK7lWhtJuGV/fMOQwbfMk6GA9ru3OiRdiqlhRFu3B+99AvSD
	 RiYHXNft/mNs7HHBPi35Y/Clcnr4UV5cx+qJB0R5fcU328Djj4D2eTbNEta6FnU8cQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=COWDtAifNxy9eheKajXdjw2ArjUB6Mu5k/ceulB+33A=;
	b=FVbskXEErRaPkhbziIloP5EdDoL8nIvvwMtgo44uQD3E/Lo5n5vjI4lXaMqGlirfcfyn
	 G7qR0QGsN9gz9SzeVyErHq3LZEp9Sm/UNV0zDo+ehswR3FYxqvLzzYj50Rhf9SZBxbNhG
	 UMTHO1yM6zKK4ec6rb1q2Ssqvyao6+DRI59FsFIXb7Hf5UsCnZokNQs8bW9yMIDjS+Y1f
	 3mqAO/5W5Z6XWuRig5draCD0Hs1R4qRX35wkn+sgNxZsdRJuTe6BfXhs4h3RgFAg/gLKv
	 jvIg5ZYcJICQp3qP3bdGnVr+2CgX/pShse6nTbBMCIJTgzL3hPLkLq+ECo9FkkNZJAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JiNghS0W;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5426606A334
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5426606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JiNghS0W
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b565211890so30826a12.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 23:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778101; x=1794382901; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COWDtAifNxy9eheKajXdjw2ArjUB6Mu5k/ceulB+33A=;
        b=JiNghS0WbjBhBjplbOoFlqjxzZeyvtmCJK69gYiV7tEtoa1I+21q3J2Ylf1p7L/tDZ
         lrJVG/LZH7mUuENylhmMwA5PqSglaKNrvi7WgywMzZEUdK5OughJlpokHLxmqqgR+eeE
         DqzpNug6VzlkuOOVJbS+nTHWlUwVdNc/GUgrFZiOpP98FV4kD9oArKwb9je036+TbePJ
         WvnbLBZJ+7JjzlcZ4zBxZ++HpBUSS8FPfGI6NmSgschT5c0czNGij65Bn/PTLDYL7B/L
         +Yrqk+LHo7/i0oc21yRYNeFJ50INTNV0xB1sP2/+YcER0e4mNHkF16U0idnDASxuIOfF
         HsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778101; x=1794382901;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COWDtAifNxy9eheKajXdjw2ArjUB6Mu5k/ceulB+33A=;
        b=TeoKLE2iN+h3vAWHz0hWoJsACVvXXRWe8K5LqoWZk7GOaqsyvPRP2h9ehCTLLvtdka
         X1kQzZ8VSmSK1JxPguywPeZLvK2znOuKwHVCX9iPtqFJq8QCQ59uyNpLju0h62H0mXVB
         C6A5zC4gOAg52FTckU8fv/OlXZNJllwkRBAiIlvHXRQyoblGhOfXBweT9bXMccqkfBuY
         GlJj+mGrPZBnXMLV1rEOtOX+xusZ5VjtwPvxwatFdznba4J77We5kDgEAWrFMy7llK5x
         obzAszluzghupmOeEpjLFueAmgbppnWmLrj/KNT+FUgs6PunhMUwSNCmtAKOndVX2gbC
         LGfw==
X-Forwarded-Encrypted: i=1; AKwUvBw9NOWGxaSS5UT9fTvnHsGgcdu4Wz9jcVXVnxYdZyH/BhjEdlkgLgI0kqfMsptaixDxZPlRE8AVxNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yRUXMUd9YSqBt886pMMITprhkm1LlISARV2vA0TESs25JZZc7
	+gOUwRcmDeiJklEUUVvWkn/QqsN45XZdaBigDGSzMa0ZkweP26T5X1fu
X-Gm-Gg: AYBFou00aSu0t/RsfETG5ZvWIV5tIqQChBa5RbgBWE6TUz9aDpkJ8sWXLZqQUSukcHH
	9LR1GYSYkTXeYrOLoLukHKUfz0mXGSmMEo37TUXkTSykiN404RuWFBK4BRqGX/HkfmAhW+2uU28
	hzZtJeG1vGjI38UQFI0bkFxZEVCJJ4+weqAzBbFeGjghK0gXJfJ70y4USwVL4PEIniTtngGPugL
	f8F/9o3yYbXKuHOFcTsCJZcpTG56/S6xWYxF8SoI3hgRbsycZFsB+LogvtV34aXkAFoxQBixUPm
	LeqduWcAycB7UK8XQJpv9roove/p+H/LphpTZpTbQBPaTwzMq0Z9XzrsmmTBuDA1NQCNuvtPzRw
	B3jscMVOA4XCvR2d9+TY0PSXgNOZK/8xteioq2v1PJ8hMoB6YFNpx0I7q7SBv9JBbqb8MSrbdk5
	WV7ajY1bb8dd51t1rOfVNeghO9e06cVWgzD5FD3Xbc68bXsYTeVtKbikgzTfp61PshHPsU3D7JO
	usi/d5RFm/RNLwpCGK+/CcZYJSm6V9I3LfJ7X53K6wDBAlDpVja7ILY0tZJTC9rM+XLmtujs2zx
	XSrVDZifT744Owi6yPLA/BXEH2HHvN8JiSfeHPUKkUFSCtMMg76LyMdQz7mAGAleooaVOaEOWGR
	I83aHUz6nVUxAU4YayiU7HxQDCsnqLiRk7wM=
X-Received: by 2002:a17:906:f15:b0:c43:f1ab:167c with SMTP id a640c23a62f3a-c4ca7970666mr1286785766b.1.1793778100876;
        Tue, 03 Nov 2026 23:41:40 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e423a48sm43450366b.27.2026.11.03.23.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:41:40 -0800 (PST)
Message-ID: <c80644469f01ae6d2ba0339a7a2fcd7c6080c310.camel@gmail.com>
Subject: Re: [PATCH v3] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?=
	 <michal@nozomi.space>, Paul Dino Jones <paul@spacefreak18.xyz>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 04 Nov 2026 08:41:36 +0100
In-Reply-To: <20261104-b4-pidff-rescale-exponent-v3-1-f45e64cf488c@cherr.cc>
References: <20261104-b4-pidff-rescale-exponent-v3-1-f45e64cf488c@cherr.cc>
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

On Wed, 2026-11-04 at 03:44 +0800, Shengzhuo Wei wrote:
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
> Also warn during initialization if the duration field's unit exponent
> is outside the range -8 to 0. This helps identify unusual device
> descriptors without logging on every effect upload or changing the
> rescaling result.
>=20
> Fixes: 8713107221a8 ("HID: pidff: Rescale time values to match field unit=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> ---
> Changes in v3:
> - Declare and initialize exp at its point of use, as requested by
>   Tomasz.
> - Remove Tomasz's Reviewed-by at his request, since his v1 review
>   does not apply to the updated patch.
>=20
> Changes in v2:
> - Following Tomasz's suggestion, warn during initialization when
>   the duration field's unit exponent is outside -8..0.
> - Add Tomasz's Reviewed-by.
>=20
> v2: https://lore.kernel.org/r/20261102-b4-pidff-rescale-exponent-v2-1-a75=
bcca65fd0@cherr.cc
> v1: https://lore.kernel.org/r/20261029-b4-pidff-rescale-exponent-v1-1-3ba=
54accf767@cherr.cc
> ---
>  drivers/hid/usbhid/hid-pidff.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 22951b7ecd17..7827b366fa5f 100644
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
> @@ -1433,6 +1433,13 @@ static int pidff_init_fields(struct pidff_device *=
pidff, struct input_dev *dev)
>  =09=09return -ENODEV;
>  =09}
> =20
> +=09int exp =3D pidff->set_effect[PID_DURATION].field->unit_exponent;
> +
> +=09if (exp < -8 || exp > 0)
> +=09=09hid_warn(pidff->hid,
> +=09=09=09 "duration field has unusual time unit exponent %d\n",
> +=09=09=09 exp);
> +
>  =09PIDFF_FIND_FIELDS(block_load, PID_BLOCK_LOAD, 0);
>  =09if (!pidff->block_load[PID_EFFECT_BLOCK_INDEX].value) {
>  =09=09hid_err(pidff->hid, "unknown pid_block_load report layout\n");
>=20
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261028-b4-pidff-rescale-exponent-1d5c4e218e6d
>=20
> Best regards,
> -- =20
> Shengzhuo Wei <me@cherr.cc>

Works as expected. Thanks!

--=20
Reviewed-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
