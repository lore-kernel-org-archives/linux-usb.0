Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101597;
	b=tlY0gxNBeVmPwb38FYxORrFShtU04fRV5a3C2VtgsNnYhXqj9pXz3H8nqynUYRPeA0NO
	 dykgqzO7y3HbyHEnT9+gB/AAB21GGrUmHwNDON9kL5jasKmT6pWWz0euiqsZMBKreTD6S
	 D9Gq7ivDhipkKAXS1qsDzlUB3T+o5En+CP1Ekp2Wpc58mSyXrH49SaEmDy32EkcW3qnAN
	 s22HBaWPVv+0lpL1UqqXSIiPBV8PWt2iZhU11b41ZDoNFfKPO4/ro0jjBZeKwj+6zgWRK
	 ++rA7BUWMlEJAE5Lsrn8cR89NNnp7nr57uM0dQHWMldsvR3g8jJEBK0QCIKWsGJaBrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101597;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VRMWiQ2UKso7oYTy9HT64TmBXeavVV8LNtdRV2H7WnI=;
	b=pI+w30aOwl5lq4YUlz7XKAPfc/hc6tcu8TbwleKFpGn63XKV1+wS+EaJVRUEqVQp+Zl0
	 ONu2Lklff753g1wGTGmPEpwlXkhVTIdXxJX7Yy1ViMVMqT159g3xgAVGr0/ZqH1gGToAL
	 LZs4+aDhty+zYGkfpS06iLgVGUGI08elaTsw1dvtOYYyPtYvoSm+Pv2x2y+RTKaQt3kCH
	 1adNixG89AC+jdHiBj+jFMbovohxW/Tg1TsrNmrElm6/RXpSVCwKlNYjkoEmYF4BrWVS/
	 fEXWXSd1sSF6kk9S7tJEYgvo0myvzGt05yaHNehqYewEwbuT2mWQGe1A9R8y+86fV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KTGG9NX0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632EE606A7F5;
	Tue, 27 Oct 2026 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KTGG9NX0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BF21F01183;
	Tue, 27 Oct 2026 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101596;
	bh=VRMWiQ2UKso7oYTy9HT64TmBXeavVV8LNtdRV2H7WnI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KTGG9NX0icTALhA5HmNBQiQOgrQ0l7hJmlz6yJiq48DskCdyjrJK5it4To+wJoGrh
	 LEU/DmDOxWwgU/utNRGiQoRxgp1qGk7bPeyaulb3PvYh2Rolh+5KZBmI+kuBMwejdP
	 YE0tEEAM8H4u8CHn25u+YiHPjOXT5yRp9y3IDAeMBsP4jMJySAuu/hPDV93wOb471l
	 ODsywg6FmA2vnquFF5c2kdevOY7BzYblgIlhrzQuFqREMm3XE8IZPR84KQbKnExrMa
	 75NkeKvAn4E5cmLksJr4kpTKaknV7z5Z8pQ3+logqq97caYMPsMsIh4MHLd1M1W9qv
	 35ck1sWiBlumA==
Message-ID: <sashiko-outbox-186472@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/8] ALSA: usb: babyfacepro: add the hardware DSP EQ
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027113140.134257-8-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
 <20261027113140.134257-8-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:46:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] ALSA: usb: babyfacepro: 64-bit signed division in bf_eq_lc_freq_=
raw()
- [Medium] ALSA: usb: babyfacepro: bf_eq_band_words() treats Off band type =
as High Shelf
- [Medium] ALSA: usb: babyfacepro: bf_eq_defaults() leaves slope_db uniniti=
alized at 0
- [Medium] ALSA: usb: babyfacepro: bf_eq_update_strip() ignores bf_eq_write=
_strip() error
--

commit 0dcbeee55d8e88a09f8b929a55a7b8a07d5a308a
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add the hardware DSP EQ

This commit adds hardware DSP parametric EQ support (3 bands plus low-cut
 across 4 analog input strips) for the RME Babyface Pro. It implements fixe=
d-
point Q27 CORDIC biquad coefficient calculation, bulk endpoint 0x0A block
uploads, and 15 ALSA mixer controls per strip.

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> index cf41093dcbcaf..0606bcc609a47 100644
> --- a/sound/usb/babyfacepro/babyfacepro-ctl.c
> +++ b/sound/usb/babyfacepro/babyfacepro-ctl.c
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
> +	if (gain_x10 =3D=3D 0 || q100 <=3D 0) {
> +		/* Inactive band: identity words (also guards the alpha
> +		 * division below against the default Q=3D0 the controls start
> +		 * with - a user setting gain before Q used to hit a kernel
> +		 * divide-by-zero oops).
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
[ ... ]
> +	if (type =3D=3D 1) {
> +		s64 ta =3D (alpha * A + (1 << 26)) >> 27;
> +
> +		b0 =3D BF_EQ_Q27 + ta;
> +		b1 =3D -2 * c;
> +		b2 =3D BF_EQ_Q27 - ta;
> +		a0 =3D BF_EQ_Q27 + div64_s64(alpha * BF_EQ_Q27 + A / 2, A);
> +		a1 =3D -2 * c;
> +		a2 =3D BF_EQ_Q27 - div64_s64(alpha * BF_EQ_Q27 + A / 2, A);
> +	} else {
> +		s64 ap1 =3D A + BF_EQ_Q27;
> +		s64 am1 =3D A - BF_EQ_Q27;
> +		s64 cp0 =3D (am1 * c + (1 << 26)) >> 27;	/* (A-1).c */
> +		s64 cp1 =3D (ap1 * c + (1 << 26)) >> 27;	/* (A+1).c */
> +		s64 ab =3D (2 * sq * alpha + (1 << 26)) >> 27;
> +
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

[Severity: Medium]
What happens in bf_eq_band_words() when a band has its type set to 0 ("Off")
while gain_x10 is non-zero?

In bf_eq_defaults(), band_q[] is initialized to 100 while band_type[] starts
at 0 ("Off"). In bf_eq_update_strip(), bf_eq_band_words() is called for all
three bands and w[0..3] are unconditionally copied into e->words[band][0..3=
]:

	for (band =3D 0; band < 3; band++) {
		s32 w[5];

		bf_eq_band_words(w, e->band_type[band], e->band_freq[band],
				 e->band_q[band], e->band_gain[band], fs);
		for (i =3D 0; i < 4; i++)
			e->words[band][i] =3D w[i];
		if (e->band_type[band] && e->band_gain[band])
			last_c4 =3D w[4];	/* shared scale: the last band */
	}

Because the early return in bf_eq_band_words() only checks
(gain_x10 =3D=3D 0 || q100 <=3D 0) and does not check (type <=3D 0), settin=
g a
non-zero gain on a band whose type is "Off" (or switching an active band's
type back to "Off" without zeroing its gain) falls through to the else bran=
ch
for type =3D=3D 3 and computes high-shelf coefficients. Those coefficients =
are
then stored in e->words[band][0..3] without updating last_c4, uploading an
unscaled high-shelf biquad to the hardware DSP instead of the identity
filter.

Should the inactive-band check in bf_eq_band_words() also guard against
type <=3D 0?

[ ... ]
> +/* The 0x38 low-cut frequency word: round(K.f'.(11656)/(11656+f')) with
> + * K =3D 11508, f' =3D f x slope-compensation factor (cap_eq9 fit, 0.003=
%;
> + * the slope factor keeps the composite -3 dB point constant).
> + */
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
> +	word =3D (11508 * f * 11656 + (11656 + f) / 2) / (11656 + f);
> +	return (u32)word;
> +}

[Severity: Medium]
Will the plain "/" divisions on s64 variables in bf_eq_lc_freq_raw() cause a
link failure (__divdi3 undefined) on 32-bit architectures?

SND_USB_BABYFACE_PRO has no 64BIT dependency in sound/usb/Kconfig. Here, f
and word are s64, and both the constant divisions by 10000 and the division
by the runtime s64 expression (11656 + f) use the "/" operator directly
rather than div_s64() or div64_s64().

[ ... ]
> +static void bf_eq_update_strip(struct snd_usb_babyface *chip, int strip)
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
> +	bf_eq_write_strip(chip, strip);
> +}
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
[ ... ]
> +static int bf_eq_put(struct snd_kcontrol *kctl,
> +		     struct snd_ctl_elem_value *ucontrol)
> +{
[ ... ]
> +	mutex_lock(&chip->mutex);
> +	if (param =3D=3D 0) {
> +		if (e->on !=3D !!nv) {
> +			e->on =3D !!nv;
> +			bf_eq_update_strip(chip, strip);
> +			ret =3D 1;
> +		}
> +	} else if (v && *v !=3D nv) {
> +		*v =3D nv;
> +		bf_eq_update_strip(chip, strip);
> +		ret =3D 1;
> +	}
> +	mutex_unlock(&chip->mutex);
> +	return ret;
> +}

[Severity: Medium]
Should bf_eq_update_strip() and bf_eq_reupload() propagate the error return=
ed
by bf_eq_write_strip()?

When kmemdup() or usb_bulk_msg() fails in bf_eq_upload(), bf_eq_write_strip=
()
returns a negative errno, but bf_eq_update_strip() discards it. In
bf_eq_put(), e->on or *v is updated before calling bf_eq_update_strip() and
ret =3D 1 is returned unconditionally. If the bulk transfer fails, the cach=
ed
state in chip->eq[strip] becomes out of sync with the hardware, and retrying
the same control write from userspace will see *v =3D=3D nv and do nothing.
Likewise, babyface_resume() calls bf_eq_reupload() without checking if
restoring the DSP state succeeded.

> +
> +/* The Q controls declare 5..1000 (Q x 100) and bf_eq_put() rejects
> + * anything below 5, so a zeroed band_q would read back out of range -
> + * alsactl then fails to restore it (EINVAL) - and could reach the
> + * coefficient math.  Seed the neutral Q 1.0 on every strip at probe,
> + * before any saved state is applied so a restore still overrides it.
> + */
> +void bf_eq_defaults(struct snd_usb_babyface *chip)
> +{
> +	int strip, band;
> +
> +	for (strip =3D 0; strip < 4; strip++)
> +		for (band =3D 0; band < 3; band++)
> +			chip->eq[strip].band_q[band] =3D 100;
> +}

[Severity: Medium]
Does bf_eq_defaults() also need to initialize chip->eq[strip].slope_db to 6?

At probe, chip->eq[strip].slope_db is 0. In bf_eq_get() for param 14 ("EQ L=
ow
Cut Slope"):

	case 14:
		v =3D &e->slope_db;
		break;
	...
	} else if (param =3D=3D 14) {
		s32 slope =3D v ? *v : 6;

		ucontrol->value.enumerated.item[0] =3D
			slope >=3D 24 ? 3 : slope >=3D 18 ? 2 : slope >=3D 12 ? 1 : 0;

Because v is non-NULL, slope evaluates to *v (0), which bf_eq_get() reports=
 to
userspace as enum item 0 ("6 dB/oct").

However, if the user enables EQ and sets "EQ Low Cut Freq" > 0 without
changing "EQ Low Cut Slope" from its reported "6 dB/oct" setting,
bf_eq_update_strip() passes e->slope_db =3D=3D 0 to bf_eq_lc_slope_byte(0),=
 which
returns 0 (low-cut disabled) instead of 0x01, and to
bf_eq_lc_freq_raw(e->lc_hz, 0), which skips the case 6 frequency compensati=
on
factor. In addition, writing enum item 0 via bf_eq_put() maps 0 to 6, sees
*v (0) !=3D nv (6), and triggers a bulk upload and a control change notific=
ation
even though the control was already reporting item 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113140.1342=
57-1-i.bahloul01@gmail.com?part=3D7
