Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899148;
	b=DtuZar4XWri/sCaVrkzcedTbi2wPlmICRjT3n7Ze4EiqahOmwhXCCiEiMHXeG+fIusGy
	 lOb0i9wKhaU6bZQn/vm4NzfP+7IwPg+GwojjPBjTFsOYuwJnYjOPwYltRKA1+SLLsYRSd
	 pUSg8TcKlZqKwrrN5hEP/U6k3SoQqJkkX86/LEa9UkZA19Chx8z7jzjNGgT+Fuaz5ji7X
	 /tnfebugU1e8F0GiDbceiJZIfm7RaeeKl4mI9dnTP8r8mdgf2rcs6ZXeC7P5ci5qtMlQH
	 GQgbOkj6+9IsoT4ru48dzFcYXNRv/wUI5K5Ik9ZjvpyIi7G11/M8UHQu8yE009mCSPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899148;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nV6r8suDHf2z/PQZIGO85z8bCxdbEVWd3ZzU/YEspfE=;
	b=B5q+Qse9S6r/mkkAWg/Jbm9pddWH2JsSrda+3B4+Rfr06pU912ol2ovq8LZG0IGCwqXA
	 gtdSCYsIQcVyPG6jawkbSBEUFbMTWx+KBtakTFeg+iriyBDk+CWqOBEHd/PZyoOKTC6W3
	 nhkUZqCuej/apST1GaKs20ZNwcXWLDfK/+wYLNlBWxbvl75UAAwkmsIk2+9nzlIvLzRqc
	 u34VE5iaTXvUEB3fbUgIonrqhtCIZdhzzVVoWSiDwZuTG/ouYqYilWyTTyk0/I92WnALE
	 C6iWgcH4YfCqP+xKDKcYhdlg9U8b6t+PUiyltFVfNG7gVsv7sekjsPEP+z/KAS/yQHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otdR4uyh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0B7606D836;
	Thu,  5 Nov 2026 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otdR4uyh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F45A1F00A1C;
	Thu,  5 Nov 2026 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793899147;
	bh=nV6r8suDHf2z/PQZIGO85z8bCxdbEVWd3ZzU/YEspfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=otdR4uyhp/ftZpJxQEV/mxb6HBgMYYLA+DoC1VgzULGLsL1INJIVoL6wNNRHFE8pL
	 y1/fhxHRYzVvBEKi4Ip8Q4DMbR1iliOOq40VoW/3sYeyZu4q8lMvzOH83BWS7aAkDr
	 wnGlqSAV7JXvLmZ11o3Y8hZiZ/noKLzzKdG5PCDnU0mbwVKEtnm3phjazmxabuN4K7
	 37bq3wl5bic3tznczmI6DAEAkfd0ngW/LHsCxG2tsJciAKTpQ/ZCcU1ZrKAck0TrRi
	 rXWGf2CEUIqiEpf4SAlFesI9Wb4yFgvAuFDPlBfrW8sPTPI+Zr3cYXT2oahXK/1vzJ
	 PC8gwF2snNWMg==
Message-ID: <sashiko-outbox-199596@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/8] ALSA: usb: babyfacepro: add the hardware DSP EQ
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105151553.223722-8-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
 <20261105151553.223722-8-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:19:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] ALSA: usb: babyfacepro: shared biquad scale overwritten in bf_eq_u=
pdate_strip()
- [High] ALSA: usb: babyfacepro: inverted sign of high-shelf a1 in bf_eq_ba=
nd_words()
- [Medium] ALSA: usb: babyfacepro: unrolled EQ cache in bf_eq_put() and ign=
ored errors in bf_eq_reupload()
- [Medium] ALSA: usb: babyfacepro: missing freq_hz <=3D 0 guard in bf_eq_ba=
nd_words()
- [Medium] ALSA: usb: babyfacepro: uninitialized boolean min and max in bf_=
eq_info()
- [Medium] ALSA: usb: babyfacepro: plain 64-bit signed division in bf_eq_lc=
_freq_raw()
- [Medium] ALSA: usb: babyfacepro: missing hardware DSP EQ reset in babyfac=
e_probe()
- [Medium] ALSA: usb: babyfacepro: ignored error return in bf_eq_reupload()
- [Low] ALSA: usb: babyfacepro: 64-bit value truncated before range check i=
n bf_eq_put()
--

commit 100d534996c41ac8c2801f7eafc48e129593aa13
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add the hardware DSP EQ

This commit adds support for the 4-strip (AN1-AN4) 3-band and low-cut
hardware DSP parametric EQ, including fixed-point Q27 biquad coefficient
calculation, 64-byte block uploads over bulk endpoint 0x0A, and 15 ALSA
mixer controls per strip.

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> index 51cf8c7bd4357..a1b8caa281dad 100644
> --- a/sound/usb/babyfacepro/babyfacepro-ctl.c
> +++ b/sound/usb/babyfacepro/babyfacepro-ctl.c

[ ... ]

> @@ -3336,3 +3337,610 @@ int babyface_create_panel(struct snd_usb_babyface=
 *chip)

[ ... ]

> +void bf_eq_band_words(s32 *w, int type, s32 freq_hz, s32 q100,
> +		      s32 gain_x10, s32 fs)
> +{
> +	s64 f =3D freq_hz;
> +	s64 w0, c, s, u, su, cu, alpha, A, sq;
> +	s64 b0, b1, b2, a0, a1, a2;
> +	s64 pi =3D 0x1921FB54;	/* pi, Q27 */
> +	s64 hpi =3D 0xC90FDAA;	/* pi/2, Q27 */
> +	s64 t;
> +	int both =3D 0, cflip =3D 0;
> +
> +	if (type =3D=3D 0 || gain_x10 =3D=3D 0 || q100 <=3D 0) {
> +		/* Inactive band (type Off, or no gain/Q yet): identity
> +		 * words.  Also guards the alpha division below against
> +		 * the default Q=3D0 the controls start with - a user
> +		 * setting gain before Q used to hit a kernel
> +		 * divide-by-zero oops.
> +		 */
> +		w[0] =3D 0;
> +		w[1] =3D 0;
> +		w[2] =3D 0;
> +		w[3] =3D 0;
> +		/* w[4] is the shared scale bf_eq_update_strip() reads when the
> +		 * band has a type and a gain but no Q yet (Q defaults to 0).
> +		 * Leaving it unwritten uploaded a garbage shared scale.
> +		 */
> +		w[4] =3D BF_EQ_Q27;
> +		return;
> +	}

[Severity: Medium]
Should the inactive-band check in bf_eq_band_words() also guard against
freq_hz <=3D 0, similar to bf_eq_lc_freq_raw()?

At probe time, bf_eq_defaults() initializes band_q[] to 100 while leaving
band_freq[] at 0 Hz, and bf_eq_info() / bf_eq_put() allow frequency values
down to 0. If a user sets a band's Type and Gain before setting Freq (or
sets Freq to 0), bf_eq_band_words() runs with freq_hz =3D=3D 0, which gives
w0 =3D 0 and u =3D 0. Calling bf_sincos(0, ...) produces su =3D -1 (alpha <=
 0)
and c =3D 0x7fffffe (~1.0 in Q27), uploading a degenerate biquad with poles
on or outside the unit circle at z =3D 1 instead of the identity filter.

[ ... ]

> +		if (type =3D=3D 2) {	/* low shelf */
> +			b0 =3D (A * (ap1 - cp0 + ab) + (1 << 26)) >> 27;
> +			b1 =3D (2 * A * (am1 - cp1) + (1 << 26)) >> 27;
> +			b2 =3D (A * (ap1 - cp0 - ab) + (1 << 26)) >> 27;
> +			a0 =3D ap1 + cp0 + ab;
> +			a1 =3D -2 * (am1 + cp1);
> +			a2 =3D ap1 + cp0 - ab;
> +		} else {		/* high shelf */
> +			b0 =3D (A * (ap1 + cp0 + ab) + (1 << 26)) >> 27;
> +			b1 =3D (-2 * A * (am1 + cp1) + (1 << 26)) >> 27;
> +			b2 =3D (A * (ap1 + cp0 - ab) + (1 << 26)) >> 27;
> +			a0 =3D ap1 - cp0 + ab;
> +			a1 =3D -2 * (am1 - cp1);
> +			a2 =3D ap1 - cp0 - ab;
> +		}
> +	}
> +
> +	w[0] =3D (s32)div64_s64(a1 * BF_EQ_Q27 + a0 / 2, a0);
> +	w[1] =3D (s32)div64_s64(a2 * BF_EQ_Q27 + a0 / 2, a0);
> +	w[2] =3D (s32)div64_s64(b1 * BF_EQ_Q27 + b0 / 2, b0);
> +	w[3] =3D (s32)div64_s64(b2 * BF_EQ_Q27 + b0 / 2, b0);
> +	w[4] =3D (s32)div64_s64(b0 * BF_EQ_Q27 + a0 / 2, a0);
> +}

[Severity: High]
In the high-shelf branch (type =3D=3D 3) of bf_eq_band_words(), is the sign=
 of
a1 inverted?

With am1 =3D A - 1 and cp1 =3D (A + 1) * cos(w0), the Audio EQ Cookbook
high-shelf denominator coefficient is:

  a1 =3D 2 * ((A - 1) - (A + 1) * cos(w0)) =3D 2 * (am1 - cp1)

Using a1 =3D -2 * (am1 - cp1) negates w[0], so as gain approaches 0 dB (A -=
> 1,
am1 -> 0, cp1 -> 2 * cos(w0)), b1 approaches -4 * cos(w0) while a1
approaches +4 * cos(w0), placing the filter poles at pi - w0 instead of w0.

[ ... ]

> +static u32 bf_eq_lc_freq_raw(s32 freq_hz, s32 slope_db)
> +{
> +	s64 f, word;
> +
> +	if (freq_hz <=3D 0)
> +		return BF_EQ_LC_OFF;
> +	f =3D freq_hz;
> +	switch (slope_db) {
> +	case 6:
> +		f =3D f * 15267 / 10000;
> +		break;
> +
> +	case 18:
> +		f =3D f * 8061 / 10000;
> +		break;
> +
> +	case 24:
> +		f =3D f * 6977 / 10000;
> +		break;
> +	}
> +	word =3D div64_s64(11508 * f * 11656 + (11656 + f) / 2, 11656 + f);
> +	return (u32)word;
> +}

[Severity: Medium]
As reported by Sashiko on v7 [1], in bf_eq_lc_freq_raw(), f is declared as
s64 and divided by 10000 using the plain / operator.

Because bf_eq_reupload() -> bf_eq_update_strip() passes chip->eq[strip].lc_=
hz
(an s32 field in memory) as freq_hz, the compiler only knows freq_hz is in
[1, INT_MAX], so f * 15267 can exceed 32 bits. On 32-bit architectures,
this emits a libcall to __divdi3 / __aeabi_ldivmod and fails at link time.
Should this use div_s64() (or 32-bit arithmetic since lc_hz <=3D 20000)?

[ ... ]

> +static int bf_eq_update_strip(struct snd_usb_babyface *chip, int strip)
> +{
> +	struct bf_eq_channel *e =3D &chip->eq[strip];
> +	s32 fs =3D chip->rate ? chip->rate : 48000;
> +	s32 last_c4 =3D BF_EQ_Q27;
> +	int band, i;
> +
> +	lockdep_assert_held(&chip->mutex);
> +
> +	for (band =3D 0; band < 3; band++) {
> +		s32 w[5];
> +
> +		bf_eq_band_words(w, e->band_type[band], e->band_freq[band],
> +				 e->band_q[band], e->band_gain[band], fs);
> +		for (i =3D 0; i < 4; i++)
> +			e->words[band][i] =3D w[i];
> +		if (e->band_type[band] && e->band_gain[band])
> +			last_c4 =3D w[4];	/* shared scale: the last band */
> +	}
> +	e->shared =3D last_c4;
> +	e->lc_raw =3D bf_eq_lc_freq_raw(e->lc_hz, e->slope_db);
> +	e->slope =3D bf_eq_lc_slope_byte(e->slope_db);
> +	return bf_eq_write_strip(chip, strip);
> +}

[Severity: High]
When two or three bands are active on the same strip in
bf_eq_update_strip(), doesn't overwriting last_c4 =3D w[4] discard the b0/a0
scale factors of the earlier active bands?

In bf_eq_band_words(), each band's numerator coefficients w[2] =3D b1 / b0
and w[3] =3D b2 / b0 are normalized by b0 rather than a0, factoring that
band's b0 / a0 gain scale into w[4]. Since the three biquad slots in
bf_eq_build_block() only receive w[0..3] and share a single scale word at
offset 0x34, shouldn't last_c4 accumulate the Q27 product of w[4] across all
active bands rather than taking only the last active band's w[4]?

> +
> +/* Recompute + re-upload all four strips (rate change). Caller must
> + * hold chip->mutex - bf_eq_update_strip()/bf_eq_write_strip() are
> + * lock-free by convention (see bf_eq_put()) and the only caller,
> + * babyface_pcm_hw_params(), already holds the lock across the rate
> + * change; locking here too self-deadlocked it (hung-task: "blocked
> + * on a mutex likely owned by" itself, hit via regress.sh's rate
> + * sweep).
> + */
> +void bf_eq_reupload(struct snd_usb_babyface *chip)
> +{
> +	int strip;
> +
> +	for (strip =3D 0; strip < 4; strip++)
> +		bf_eq_update_strip(chip, strip);
> +}

[Severity: Medium]
As reported by Sashiko on v7 [1], bf_eq_reupload() ignores the error return
value of bf_eq_update_strip().

If kmemdup() or usb_bulk_msg() fails in bf_eq_upload(), bf_eq_reupload()
continues attempting up to 7 more synchronous bulk transfers (with a 1000 ms
timeout each while holding chip->mutex), and callers such as
bf_resume_locked() and babyface_pcm_hw_params() cannot detect or propagate
the failure. Should bf_eq_reupload() return an int error code and stop on
the first failing strip?

[ ... ]

> +static int bf_eq_info(struct snd_kcontrol *kctl,
> +		      struct snd_ctl_elem_info *uinfo)
> +{
> +	int param =3D EQ_PARAM(kctl->private_value);
> +
> +	if (param =3D=3D 0) {
> +		uinfo->type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN;
> +		uinfo->count =3D 1;
> +		return 0;
> +	}

[Severity: Medium]
When param =3D=3D 0 in bf_eq_info(), uinfo->value.integer.min and
uinfo->value.integer.max are left uninitialized.

In snd_ctl_elem_info_user(), uinfo is copied from userspace without zeroing
uinfo->value, so callers reusing the struct across controls see stale
min/max values; in 32-bit compat mode (snd_ctl_elem_info_compat()), max is
reported as 0 instead of 1. Could this set min =3D 0 and max =3D 1 (or retu=
rn
snd_ctl_boolean_mono_info(uinfo)) like the other boolean controls in this
file?

[ ... ]

> +static int bf_eq_put(struct snd_kcontrol *kctl,
> +		     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	int strip =3D EQ_STRIP(kctl->private_value);
> +	int param =3D EQ_PARAM(kctl->private_value);
> +	struct bf_eq_channel *e =3D &chip->eq[strip];
> +	int band =3D (param - 1) % 3;
> +	s32 nv;
> +	s32 *v =3D NULL;
> +	int ret =3D 0;
> +
> +	/* Read from the union member matching the control type: ENUMERATED
> +	 * params (band type 1-3, slope 14) use .enumerated.item, everything
> +	 * else (BOOL 0, INTEGER) uses .integer.value.
> +	 */
> +	if (param =3D=3D 1 || param =3D=3D 2 || param =3D=3D 3 || param =3D=3D =
14)
> +		nv =3D (s32)ucontrol->value.enumerated.item[0];
> +	else
> +		nv =3D (s32)ucontrol->value.integer.value[0];

[Severity: Low]
On 64-bit architectures, ucontrol->value.integer.value[0] is a 64-bit long.
Casting it to s32 before the switch (param) range checks below truncates the
upper 32 bits when CONFIG_SND_CTL_INPUT_VALIDATION is disabled, allowing
out-of-range 64-bit values whose lower 32 bits fall within bounds to wrap
and be accepted. Could nv be kept as a long (or range-checked before
narrowing, as in bf_master_put() and bf_width_put())?

[ ... ]

> +	guard(mutex)(&chip->mutex);
> +	if (param =3D=3D 0) {
> +		if (e->on !=3D !!nv) {
> +			e->on =3D !!nv;
> +			ret =3D bf_eq_update_strip(chip, strip);
> +			if (ret < 0)
> +				return ret;
> +			ret =3D 1;
> +		}
> +	} else if (v && *v !=3D nv) {
> +		*v =3D nv;
> +		ret =3D bf_eq_update_strip(chip, strip);
> +		if (ret < 0)
> +			return ret;
> +		ret =3D 1;
> +	}
> +	return ret;
> +}

[Severity: Medium]
As reported by Sashiko on v7 [1], in bf_eq_put(), e->on or *v is updated
before calling bf_eq_update_strip() and is not restored if
bf_eq_update_strip() fails (for example, if kmemdup() returns -ENOMEM or
usb_bulk_msg() fails in bf_eq_upload()).

Because chip->eq[strip] retains the new value nv, the host cache becomes
desynchronized from the hardware DSP, and a subsequent retry writing the
same value nv sees e->on =3D=3D !!nv or *v =3D=3D nv and returns 0 without
re-uploading the coefficients. In addition, while bf_eq_upload() sleeps,
concurrent lockless readers in bf_eq_get() observe the uncommitted value.
Should bf_eq_put() restore the previous value on failure (like
bf_phantom_put() and bf_reflevel_put())?

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> index ece2bd0c4e63a..ed17600aba2f0 100644
> --- a/sound/usb/babyfacepro/babyfacepro.c
> +++ b/sound/usb/babyfacepro/babyfacepro.c

[ ... ]

> @@ -1638,6 +1640,8 @@ static int babyface_probe(struct usb_interface *int=
f,
>  			BF_REF_LEVEL_4DBU : BF_REF_LEVEL_MINUS10DBV;
>  	}
> =20
> +	bf_eq_defaults(chip);
> +
>  	/* The 0x16 clear zeroed the mixer registers: apply the factory
>  	 * default routing to keep the outputs live out of the box.  alsactl
>  	 * restores the user's settings once the card is registered.

[Severity: Medium]
Does babyface_probe() also need to call bf_eq_reupload(chip) after
bf_eq_defaults(chip) to reset the hardware DSP EQ state?

As noted in the commit message and bf_resume_locked(), bf_cold_init() does
not clear the DSP EQ on bulk endpoint 0x0A. If the device already had EQ
filters active before a driver reload, warm reboot, or re-probe,
bf_eq_defaults() sets e->on =3D false and default parameters in chip->eq[]
without uploading identity blocks to the hardware. When alsactl subsequently
restores a state where EQ is disabled (or at default values), bf_eq_put()
sees e->on =3D=3D !!nv and *v =3D=3D nv and skips bf_eq_update_strip(), lea=
ving the
stale EQ filters active in the hardware DSP while the ALSA controls report
EQ Enable as Off.

[1] https://lore.kernel.org/r/20261027113140.134257-8-i.bahloul01@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105151553.2237=
22-1-i.bahloul01@gmail.com?part=3D7
