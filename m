Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892757;
	b=HXO7GS1gVLUSi/HEnbb/OyIZI8um297qayK3Fwa2faT1ExonNHyrRtUvfjlKfTKCzW/B
	 p4ZIHNr1eD4sI1x0tLElp3Mx/sTyGu5izUOlXH2tUI/2cIuLQk6PYI2N+vLUOSRchU7Q7
	 TwUlQ1Ee23Ucnb8BzbiZSjoBA0PsK6g4nGK6WepDRcAZZ8ixzWJCFWzmwGReD6X9Rp1CI
	 sypmR5pOeaS0vqUV22VMPMqKJmvk44hX9/0854AmaOZKbzaaIk2O9Z43QYVPTp2vmPEPy
	 bsXLWuA9Rp2WPSgzQSRLeTbOZI9+neHbI87Qby+PzFq7af5b825rzadrY+szESw/ZAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892757;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=njHYVC/5V1wNrVL4KUznjFMwx6yx3V3YV6oieW86crI=;
	b=QHyW1CfgGab6z15icUxMit5S3wD5XyG22EKVUSMQUw3VBJZ+eM1oW7skW2LBi9BJCHXA
	 r8WUhrxN5z35jtGl4TAPA3u32xwXECWuM+6i2UPoUBwF0bzVxZspCGYNQSxvpRSUNTr1v
	 qtoaauItxhFCPhQTrA6TjwYhpvv9VqpvT+KTPlS7ytW44s4VAGl7zNc9GI1O14O9cLupa
	 ws5z2SmJdFZ+0Yqm7sbLwndK2ogmPZkGZIbcdfnZPjeaFDRZ+I8HYqagrRD21RLf/NSPE
	 bmy6TZQQ0HooYfKVHttjRZKHzLSeJI0c1yJsfs+56v1FKyztx4FGPUKigy7XgU+urIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yd990P+5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E3A606A331;
	Thu,  5 Nov 2026 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yd990P+5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEFC1F0093A;
	Thu,  5 Nov 2026 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892756;
	bh=njHYVC/5V1wNrVL4KUznjFMwx6yx3V3YV6oieW86crI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yd990P+5kx63/+fLOft/UEbEtR3hCWRplfn596L68oZXAaIwPAqPty5C2+G4CZlOi
	 SpAj8k2GCopJih2QQAF1TaG2qQz7apSL74YhuHUQw4ZdrMdvcSS3fcWJfnp47eBghO
	 IiuPYEA6xgoTiuodf+ZbIucvPPQDXqV4lrhOwmhpgVi1PCr6/f/na9ngsuvEYkfWqp
	 7lph6ftTfbuuy4rInKHXgNdkg7gqOK+cD9XyANgbou0Oz6hQrsHRGIWS5pHTTfSQkI
	 1Ku5Zo+q2GBD/KBZQ+yMfuk/OQb1fHT7MuycATYdQbw/iZS+TNK+kp4JAak6gvOlAS
	 EXRGGpem5/CLA==
Message-ID: <sashiko-outbox-199313@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/8] ALSA: usb: babyfacepro: add routing flags and
 varispeed pitch
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105151553.223722-5-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
 <20261105151553.223722-5-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:32:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ALSA: usb: babyfacepro: out-of-bounds value[1] write in bf_loopb=
ack_get()
- [Low] ALSA: usb: babyfacepro: leftover contradictory comment above bf_out=
_reg8()
--

commit bc91f1e348293fb57b62c700b674ce38c7dc5791
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add routing flags and varispeed pitch

This commit adds ALSA mixer controls and state persistence for routing flags
(loopback, AN 1>2, sample clock source, optical out format, AN1/2 link, MS
processor, DIM, width, and FX send) and varispeed pitch on the RME Babyface
Pro.

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> index fe6266ea118e6..5482b6f09b73a 100644
> --- a/sound/usb/babyfacepro/babyfacepro-ctl.c
> +++ b/sound/usb/babyfacepro/babyfacepro-ctl.c

[ ... ]

> @@ -325,6 +329,33 @@ static int bf_master_get(struct snd_kcontrol *kctl,
>  	return 0;
>  }
> =20
> +/* The master step to put on the wire.  The cache keeps the real
> + * volume: mute wins, and DIM is the fixed -20 dB step on the Phones
> + * pair, so every writer derives the wire value the same way.
> + */
> +/* The two master registers to put on the wire.  The cache keeps the
> + * real volume: mute wins, and DIM is the exact -20 dB pair the
> + * hardware's own button writes (0xcb / 0x0333, cap_dim2.pcap), not the
> + * master curve's value at that step.
> + */
> +static u8 bf_out_reg8(bool muted, bool dim, u16 step)

[Severity: Low]
This isn't a bug, but is the first comment block above bf_out_reg8() in
sound/usb/babyfacepro/babyfacepro-ctl.c a leftover from an earlier draft
that was meant to be replaced by the second comment block?

[ ... ]

> @@ -1278,3 +1305,679 @@ int babyface_create_preamp(struct snd_usb_babyfac=
e *chip)

[ ... ]

> +static int bf_loopback_get(struct snd_kcontrol *kctl,
> +			   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	int out =3D kctl->private_value;
> +
> +	ucontrol->value.integer.value[0] =3D chip->loopback[out];
> +	ucontrol->value.integer.value[1] =3D chip->loopback[out];
> +	return 0;
> +}

[Severity: Medium]
Does bf_loopback_get() in sound/usb/babyfacepro/babyfacepro-ctl.c write
past the declared element count when populating
ucontrol->value.integer.value[1]?

In babyface_create_flags(), the Loopback Switch controls are registered with
.info =3D bf_mute_info and .get =3D bf_loopback_get:

	for (i =3D 0; i < 6; i++) {
		kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
			.name =3D "Loopback Switch",
			.index =3D i,
			.info =3D bf_mute_info,
			.get =3D bf_loopback_get,
			.put =3D bf_loopback_put,
			.private_value =3D i,
		}, chip);

However, bf_mute_info() sets uinfo->count =3D 1:

	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN;
	/* One switch for the pair: bf_mute_put() writes both channels
	 * together, so a count of 2 would silently ignore value[1].
	 */
	uinfo->count =3D 1;

When userspace reads the control via snd_ctl_elem_read() -> bf_loopback_get=
()
with CONFIG_SND_CTL_DEBUG enabled, the ALSA control core poisons the buffer
past info.count with fill_remaining_elem_value() and then checks it in
sanity_check_elem_value(). Because bf_loopback_get() (like bf_mute_get())
writes ucontrol->value.integer.value[1] on a count =3D 1 control,
sanity_check_elem_value() logs an access overflow error and fails the read
with -EINVAL.

Should bf_loopback_get() only write ucontrol->value.integer.value[0] (or use
bf_switch_info and a single-value get, and similarly in bf_mute_get())?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105151553.2237=
22-1-i.bahloul01@gmail.com?part=3D4
