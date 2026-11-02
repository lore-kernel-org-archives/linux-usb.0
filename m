Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622968;
	b=jhFZPpqp6MTci6TlIMD5HW4WfZOolGpCxxpKMUSPkL47EqdpMtA/RY1Kxykr1L0NtOia
	 wgtFCSd580W3vdYPdeKKvfgyvToUfIZR30gkVeA+jmKi8oBwWiF/OLRnVelHWimiN92sY
	 Emjo2bmL61a7aHDdgoJOcY5e+JrkqqNEpDXrryrK2yeVIsArF6XdtDVy7ozmt2Rlga6gs
	 zub3GRcRWmykv/IATRTXHx+KYbhfcLEY/fZ9jWbTq+HPTX/VrQdhJFDQOlHOoJY3/EyWp
	 7N9Hulmgsf3M4S3DiWufCoyjIciWCr467CYVaZNEg8NDnRI1S1M27vCb18nl9DyfykQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=M322gxN17KH2FpLbwEqFxfIE1eUVU6+ZQO7JUqapB7A=;
	b=hl5EF61fDV56l7PX7MS8aMUCuTGjpg3p2lfp4jO934Cl+04CvkZ2/qoAvDO9j4pyY9th
	 46ayU4Mti/GKQNEZx8AGtHY12PojQib22MygC1cWqfz6F3gxOzQ7vAtQab0tKdCy9MPEw
	 jaIjv8txrZ5dTQeTvzsLPa8EXedCPKPWb1z3bjwPXbZw+UPNd7GfjUE0Lb9xXszhluwGq
	 3hG/zov4z1sfnzowkwF0lOogg8UHOzGhpPgmnZmzY8MUN5ZAzAMSSxOeryAcDkXCGGjiX
	 v1cDw0vVjil1bpyVcddqb+u/R/7ILN4CKEEdUKHbBA5vKEoRdOS2p5X9BWnEGf/q5yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5CiVmW6;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C36606A32D
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 12:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C36606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c5CiVmW6
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be502e1adaso357440e87.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 04:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622966; x=1794227766; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M322gxN17KH2FpLbwEqFxfIE1eUVU6+ZQO7JUqapB7A=;
        b=c5CiVmW6TC6wzhilCy2vRAOjt377rQOFvnTggK30VMkmy3zHL8cjaFj3kEfM20B7V8
         S6MqGtKCdWYPj+71NvS719/pZjRnNbji4M40tk9LAAqL9+2GNQrhs5ef8hvWzRxpKF0R
         Ypu7f+N2BzXigxVRJEM2xymxy4BYBu7CATH1NeSvlsJBu6Gqe2OobIDH/CUAcysBRDS2
         DUGfWArThmDBRC5zzEMfJ+4/MY0b7CT86GFT2eAfVaEL5ZE+oaIb5H1FO3wC/43PUVVC
         6FsrVSrr3GGlULr7XBfLYmaD8AJHuw20cBeP61bZj96ONnDPk0mdhObdLXnCjbxGcGVl
         IgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622966; x=1794227766;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M322gxN17KH2FpLbwEqFxfIE1eUVU6+ZQO7JUqapB7A=;
        b=ee5Mak5SBmLy0mRMVO2ToYtONknG+3UO2Yu9TOuinrVO8Qrhy5g1oH2+0hXRWcKRGo
         /qFa3zEME6aSroMTR6LC0xKFMSXdVhj7U2xSIfIUkmGiQo+cpG+pzeHHcEQ1oFgEyxWS
         kfPjXk0+IujrUJL266eg4DAS2Z6Uah4hYJV+m+cmH2GgSAJpmwrGk+qXgcW6/JF+eUOO
         p8qEg1BcqwpSt7rn5wkeYhjagcDoBRuDWrcwI4J7uUMaRp5Zgr/fMO/K+kaCMvNqfQIr
         FNoQBLhVoOQV//S9Sb6Nc1M8NrChszHqWPu43ZCyXOB9kvI3BlBszugHS7Pcw9GNu1eO
         uBtw==
X-Forwarded-Encrypted: i=1; AKwUvByNpBRiP2hH+P8duCf3TJzrDfd/YyCHZeUK6A/a0b3D+fx4zxAVEWX2a0PStBWti4KenXJ1AqL7Te8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G3/RYNH8OYGCyr+OGfV1CkgFiEnE0UPmSotz8anPqYHXQkAYl
	QJ2ede6XW/E9JmdcKNFncEqIY7P7LfJrkKq+BISf7FFyPXpplyR5/mFV
X-Gm-Gg: AYBFou0pOqPxMdyzOmVWElNcOpNUiM2VaxhA2KfQP37DZ4pQIgdrR+pCvZRzeqn0m2E
	NZ32Ik8PyEJNMucpxlgIOumTj06ZEVoKxUtJ7PKrtq7ow0RbZZBy8EGnFbe0cONwWO5ZZJmmjm+
	FA+t/9uNYFbmoc04oF2zDXydVycz7jp//TZrmAhiE7fVxvMUzPTmKaOo5049O1DGZczOSzL0ZmD
	lVsdOe11hmX7pEDHRJHYtJ5oMztYlbtmva6qODzdjLVN47qHfoL/t0HR8GEpEpGpaFXu64eYbHW
	Br0LK4yKIrLIzf/A1trI07M6gXAlSUKd3ZBc5AR0aG5UQ9eO/N+TveRcTH/UI7AsyEoATxsGDUO
	tV1IEGUhh0Gq4lg+tnkc/Zf+Uumlr4Y2s8xKZ4p/MyRKo7xq3wM5fJ7W3tY8jizMpm+TzH32Zoi
	x0UHA29UO8caT1J7fdQnUn45imNZupb/lbwIHz5j0d3Cal2bkGW13MNE/G2+Wl80/mWyW5G2uHJ
	GcH3bQC1+/BMyPQo+SSCmEPqphcpdpOpxK8Ir/kdxRCI0ylzNsjnzvbkl0wa87K7WVrALAhAmfQ
	eZM1n6ENuk4r4owk/GviA4omeRCwYYcFSwcr7V8a2PA1jnZYn53mTsuYnndgGwlV6oHqu/I+YZ4
	3RzX6bDAKH/DKMg==
X-Received: by 2002:a05:6512:159d:b0:5bf:ba43:fa67 with SMTP id 2adb3069b0e04-5bfd95989a1mr4171090e87.6.1793622965865;
        Mon, 02 Nov 2026 04:36:05 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07551e2sm1599770e87.84.2026.11.02.04.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:36:05 -0800 (PST)
Message-ID: <b27645a5948ec37836a9186f0eb4699b6d6fd87a.camel@gmail.com>
Subject: Re: [PATCH] HID: pidff: fix undefined shift for infinite duration
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>, Oleg Makarenko <oleg@makarenk.ooo>, Jiri
 Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 02 Nov 2026 13:36:02 +0100
In-Reply-To: <20261028-b4-pidff-duration-shift-v1-1-65028c6b4a37@cherr.cc>
References: <20261028-b4-pidff-duration-shift-v1-1-65028c6b4a37@cherr.cc>
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

On Wed, 2026-10-28 at 18:55 +0800, Shengzhuo Wei wrote:
> pidff_set_duration() computes the infinite duration as
> (1U << report_size) - 1, but report_size comes from the device's
> report descriptor and can be 32 or greater. This causes an undefined
> shift. A UHID test on x86-64 triggers UBSAN and programs a 32-bit
> duration field as zero instead of 0xffffffff.
>=20
> For report sizes of 32 or more, store -1 in the s32 field value to
> set all 32 bits without shifting. Keep the existing calculation for
> smaller fields.

Yeah, that's a good idea even though finding a real device that would
trigger this would be quite difficult.

>=20
> Fixes: 1a575044d516 ("HID: pidff: Compute INFINITE value instead of using=
 hardcoded 0xffff")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>
> ---
> HID: pidff: fix undefined shift for infinite duration
> ---
>  drivers/hid/usbhid/hid-pidff.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidf=
f.c
> index 22951b7ecd17..25b82e7d0b9e 100644
> --- a/drivers/hid/usbhid/hid-pidff.c
> +++ b/drivers/hid/usbhid/hid-pidff.c
> @@ -394,7 +394,11 @@ static void pidff_set_duration(struct pidff_usage *u=
sage, u16 duration)
>  {
>  =09/* PID defines INFINITE as the max possible value for duration field =
*/
>  =09if (pidff_is_duration_infinite(duration)) {
> -=09=09usage->value[0] =3D (1U << usage->field->report_size) - 1;
> +=09=09if (usage->field->report_size >=3D 32)
> +=09=09=09usage->value[0] =3D -1;
> +=09=09else
> +=09=09=09usage->value[0] =3D
> +=09=09=09=09(1U << usage->field->report_size) - 1;

I prefer default operations instead of if/else. Just a style preference.
Would you mind changing this to unguarded
`usage->value[0] =3D -1;`
and then the previous calculation behind
`if (usage->field->report_size < 32)` ?

>  =09=09return;
>  =09}
> =20
>=20
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20261028-b4-pidff-duration-shift-8df4f6451448
>=20
> Best regards,
> -- =20
> Shengzhuo Wei <me@cherr.cc>
