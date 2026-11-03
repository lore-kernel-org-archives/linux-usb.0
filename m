Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697621;
	b=owIJPLm7s3ubvzQU8OgCUOcOwasBiKqNmD2ZuVNknTM1ZdajR/xn/zDKPxIB2+/FQ8e2
	 0N9vuI83osrP8x/b0qivO+5dt0eAKw2Ga08v67V7uuhQGAK+CxvsvnrFK9o/ixSc6dyfo
	 x7TEK/TSe75bjsiMP0nlx4z+Bx05cJZt59nk0EOhhsjmppUEY99zwY+HyDK4Tq5uttd7q
	 rMlgrt5gNTyZ6mKE03ccw+rvrNak+Fzf7wSpKP+QfEWCVDhXLVDa62FmdEzvBMjIkf16U
	 hvfXszjApnfh7lHf56V80UnyZOxGW+ijkge4llCkQ8y7Q6SZMxYK6Cba6PwZT57wF1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=TNCUkOdrDNw6Y0YerpyggbymdScac6P000lKA53Qu5E=;
	b=1BnLiSDy/vX4LZ9ctDLwF0IKs5ak9SXNUkuoMzn09kmsjMmQbndnzUYTnf2lid6dqdej
	 hvUL066y7E7+c3gAQz5ipcS+PpcFdxbHpmOUDPlDBWcPwyNB/HpXAGzXjNYACZIlGQofr
	 EMq5eBw6T8AdFdKAPeAw5rur3Filwja8tees+VKkFgT2yOHgjTOrZuISNN7HJBnouCinK
	 YBMc0YBnDi2XHlEGcpFV7Cv5RoVQY9T2ZoiFKSexrTm2F7kT5dFpwtQFqa/+0Z3KIz3X6
	 iwRP1kQUxbUsVlwsyOrg0WjGXOg/6Q9VoHhqnwsx+z4fC/AYhSa+hLzXiKqyFfLQ+XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgAXlGvt;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A98606A337
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 09:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55A98606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgAXlGvt
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c41d20c016fso68596466b.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793697619; x=1794302419; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNCUkOdrDNw6Y0YerpyggbymdScac6P000lKA53Qu5E=;
        b=MgAXlGvt3N4HPmYe4BFyl00Qw7aY4cTpOPdLrts5i12nDmokkC38bTWwSetKa3NoYY
         JZqP5sWhuckQoSdqZ0yZvL1x1kKXVozy5G9oAHmArdJizqr+uq7rA5706M7tSOuYs1R7
         RrVysGMeJe22az4/DYIain/haTwAwwdi3exTWR152z4dkQx8qDcMUj9/P/JsScc6kq13
         JxYIwmGHjXIIitvY0j1zqJlwy8BFd3BiEwOGTBmeCUr0yTm7A630uFw6YvKzHNpzxkIA
         qevdaMPZz5TY7i5N8wlW0BN5Yb5Y/81WvJ2GT0A1XVyxSShxQMP19kpKSDJqwPAvBbWu
         xPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697619; x=1794302419;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TNCUkOdrDNw6Y0YerpyggbymdScac6P000lKA53Qu5E=;
        b=QEW5SkwKxK6qDyblcaRZSpU6B1ye4Nh7mAKYw808LDTCTxJWL89wNUIZn1O0t2K7yZ
         PbUqhXoBHSDEntNALxBkc43HkmnlvaQwJX4vmmRGhRs4vdoylpZSD4DinIusobpmAoRs
         uY8yVDnA6Y/aDQ6v2JL9hqvzAVDkuyzmmsT0DNM6eMfYnRYLk0laIwrYakSbQL04PmQu
         iKyQhfkDHlj8oDpfmii7eOVT0syfs4/1m1iiIY3UmX0aTLyPU62HueSSzWezrcSNIcC3
         9O4EshF2EOJTv83zIjMw1lxy+bsi5hUecGoSboIpFLn4oWBjOD/xxsPzkxD6arX/CDro
         VjKg==
X-Forwarded-Encrypted: i=1; AKwUvBwZRHNFfE5EbqIMPLyk5CrVJqK2hX3J3yki7xFL7pYl9u9YDBhUY0cdu/FN0siq03W7W21tu/zKB7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx2OEInOX6gAXl1XuU8Y8SYWPeb0PO9Lqku12eHnoYwI9o1PED
	6l8B0arqEc9vSHmxX972Hu/DYMoHqSR9+Ni+W6LuknaFMg7uhrgYqaKH
X-Gm-Gg: AYBFou3PR32+W883UUvlRf1HnIf8cLCKYzfbE1dbe21T9dVJd0oHiXaTPoSEerBa+1Q
	kQr959Aox7i+BnpJyA51LAwch2YNcDRR/+WMZucrnArbATJh1DiXauLmFr8NhK2m9qGqKl79Wzd
	NhTgcdnIPO2z8Mh7t7Prtlt4zRLzGtWpRZeEhYQRg2oJrMjv7wADiYD7gM++f1CXA2UyvYWP8n7
	MeK3c9nX3yVHJ2q30KA9JZzT0HXsP4xXlTHi+Unmoq0n39/UsyyfOUaMbB+HFf1MXfDLkFDXyIl
	y8jHTPIeIs/TVd5VNhAcmq2z8uwMOyBGkOM0dtQYRIyk2Hl+zGdDmD2e/+e/p0fSXEgK3IZ1P8R
	wc69qzjTHZLGLkbt47JU9HqBUgn9l4uTCuhzo3WxXoE7Qwd7pzG8wl5bzk2PDtXpGFHSKr96MqK
	vJ7DZHtA+tp3jldeeR4JY37tcaHZE7SFr+0p7wlWvz6JzMul9czms645GOdbher/LNKQyrJSI2X
	bzMyGeu/fb1ncW8NRtTngW82oLhpxcOhZRaDr/WD+CvHO5CqljBia1Qg0g2DaD0c2D27U+SHLmz
	qgr3ZUlhdQ6u0P/p3Tymxx8ui+VRCFmL2KvdceXViYYKQiFrzI0Ye8+AkZNT/+xtYj8fzs0wJWH
	jkdPyJmcpyXew9g==
X-Received: by 2002:a17:906:351a:b0:c34:db91:aa1e with SMTP id a640c23a62f3a-c4ca7aa020amr977638966b.4.1793697618437;
        Tue, 03 Nov 2026 01:20:18 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf37c9bsm67920366b.48.2026.11.03.01.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:20:18 -0800 (PST)
Message-ID: <86a644201b1938155af01f3e2b7dfb71dcca159d.camel@gmail.com>
Subject: Re: [PATCH v2] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?=
	 <michal@nozomi.space>, Paul Dino Jones <paul@spacefreak18.xyz>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 03 Nov 2026 10:20:14 +0100
In-Reply-To: <20261102-b4-pidff-rescale-exponent-v2-1-a75bcca65fd0@cherr.cc>
References: <20261102-b4-pidff-rescale-exponent-v2-1-a75bcca65fd0@cherr.cc>
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

On Mon, 2026-11-02 at 23:23 +0800, Shengzhuo Wei wrote:
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
> Reviewed-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>

Afaik, the tags should be in a chronological order (my review on the
bottom) + reviews should be removed if patch contents have been changed.
My review is no longer viable for this v2

> ---
> v1: https://lore.kernel.org/r/20261029-b4-pidff-rescale-exponent-v1-1-3ba=
54accf767@cherr.cc
>=20
> Changes in v2:
> - Following Tomasz's suggestion, warn during initialization when
>   the duration field's unit exponent is outside -8..0.
> - Add Tomasz's Reviewed-by.
> ---
>  drivers/hid/usbhid/hid-pidff.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 22951b7ecd17..4540f49fe6e3 100644
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
> @@ -1428,11 +1428,19 @@ static int pidff_find_effects(struct pidff_device=
 *pidff,
>   */
>  static int pidff_init_fields(struct pidff_device *pidff, struct input_de=
v *dev)
>  {
> +=09int exp;

This driver no longer enforces C90 standard (in line with kernel) so
please, declare the variable where it's needed.

> +
>  =09if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
>  =09=09hid_err(pidff->hid, "unknown set_effect report layout\n");
>  =09=09return -ENODEV;
>  =09}
> =20
> +=09exp =3D pidff->set_effect[PID_DURATION].field->unit_exponent;

So here, int exp =3D ...

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
