Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101623;
	b=5S2SbkPfhgk5WTAF/h8wut3Myb79hjGjGTEnNHapZMAQePoGPoQiSuCTnBilkVTxfSgn
	 hA4m/vF8b6VND5pHtxdlJ96GuweodRVPq6cbr8G64p70791Z3k7DuLMhv3zt9CePkmapC
	 mxsjaUbpSM1nVF+O4/uHnB59Ft7Vfmc1Pv/XBs3kCYBdUYvLgYFFXlJTMCMKSvZl9JxeM
	 OuoPKrOYb241e6y52a6U0hWEuTY2I6ll2fBE++9iGqDhFePZA1yHqeNSNk+VcuiKuDsJm
	 ZOW/Cw86X7PXFZQE55aLi7jeqWIgw6TLs4RuNUMRTDGvovQnFeuLfiDS+dY0QO0Ur4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101623;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2v5HOnfONpClGccMR4K3H7XgZuAhQrb8SBlfd59+ozw=;
	b=hh5VpVqn1C5Gm37OKbJf8ALFipUc7y60X4cr62sAy/Lt6s6dQRyJ9gXEfephbZoKinUO
	 hH4rD9F17EFjgCIlhSiDnlJym1KhJxbcjj752SIibRjjRmXyDNVABDN1vQ+tRBiYZ6w7s
	 wP+FgHFjc2zjGwRUmoD/6VJUP8j9Qje0odeq8p+4z7JLh3kPDDCAxsEAjYn8VRmPn3vhj
	 CFl0k3NBx7WIqU2HVQHWJ7R7Q5OK9FEnEMCnKaFCwT2RrjWhuBcWC7n6n7nkO6rJsVEDh
	 64OmXVjsVPzkB7w+zpOULiKE9tHrPh3adxL6a/0F2V6rd9nyR7AG6AxJskuodqZ8Tdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BwTFhlI0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93D2606C903;
	Tue, 27 Oct 2026 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BwTFhlI0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1EE1F01825;
	Tue, 27 Oct 2026 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101622;
	bh=2v5HOnfONpClGccMR4K3H7XgZuAhQrb8SBlfd59+ozw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BwTFhlI0PYk9bbLTwMv4i/P1SF3jOqOiKYvyR5FaF3HmJld7T2SRjWgu4HENgaM7g
	 jVSguyTAA/8WVASIbNvNhuRT2nRZt8S2bA1t8vLDZcZJ5zHdxdylUlSeVW3IEmLTdY
	 YjzydWLNo6NrKT8XF3E0MCDoCmC8BTmJiDWcYB7LViSB1c9r+NSyVoNvGLirjAU9bg
	 RtFL1dVbU9RSl/pvM81jgd7eJaph0SEMVNPFWqq2SFChajo2n7C7COIpA9KNP5gJU3
	 mnAGXoGRFdh2Qd3ECa80Hpy4xcqoohR7Ry3T6noORSPH0/5En2Mjsygr0tSVUA4ioL
	 QLmEX79kyxW4A==
Message-ID: <sashiko-outbox-186473@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/8] ALSA: usb: babyfacepro: add routing flags and
 varispeed pitch
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027113140.134257-5-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
 <20261027113140.134257-5-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:47:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] ALSA: usb: babyfacepro: bf_state_apply_flags() unmutes AN1/2 input=
s on probe
- [High] ALSA: usb: babyfacepro: bf_ms_put() restores wrong crosspoints to =
AN1/2
- [High] ALSA: usb: babyfacepro: DIM and Phones master/mute states clobber =
each other
- [Medium] ALSA: usb: babyfacepro: preamp flag commits clear Boost ref leve=
l state
- [Medium] ALSA: usb: babyfacepro: bf_loopback_put() omits notify on cleare=
d outputs
- [Low] ALSA: usb: babyfacepro: missing enum bounds and long checks in flag=
 puts
- [Low] ALSA: usb: babyfacepro: unused dim_kctl pointer in babyface_create_=
flags()
--

commit 43e9e598414a501c1d77575b85841ffbf7ea280c
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add routing flags and varispeed pitch

This commit adds ALSA mixer controls and state restoration for loopback,
AN 1>2, sample clock source, optical output format, AN1/2 input link, MS
processor, DIM, stereo width, FX send, and varispeed pitch.

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> index 60604242be883..39584ec719b23 100644
> --- a/sound/usb/babyfacepro/babyfacepro-ctl.c
> +++ b/sound/usb/babyfacepro/babyfacepro-ctl.c

[ ... ]

> @@ -377,6 +381,11 @@ static int bf_master_put(struct snd_kcontrol *kctl,
> =20
>  	chip->master[out][0] =3D l;
>  	chip->master[out][1] =3D r;
> +	/* A Phones change while DIM is engaged re-bases the restore point. */
> +	if (chip->dim && out =3D=3D 1) {
> +		chip->dim_saved[0] =3D l;
> +		chip->dim_saved[1] =3D r;
> +	}
>  	ret =3D 1;
>  out:
>  	mutex_unlock(&chip->mutex);

[Severity: High]
Does changing the Phones master volume while DIM is engaged cancel the DIM
attenuation on the hardware?

In bf_master_put(), when chip->dim is true and out =3D=3D 1, the code updat=
es
chip->dim_saved[0..1], but only after writing wire_l and wire_r (the full
undimmed volume) to BF_REG_MASTER_8 + 2 * out and BF_REG_MASTER_16 + 2 * ou=
t.
That drives the Phones output to the undimmed level while chip->dim remains
true.

Similarly, in bf_mute_put(), unmuting out =3D=3D 1 while chip->dim is true =
writes
chip->master[1][0..1] to the Phones master registers instead of the dimmed
BF_MASTER_MINUS20_8 and BF_MASTER_MINUS20_16 levels.

> @@ -1280,3 +1289,699 @@ int babyface_create_preamp(struct snd_usb_babyfac=
e *chip)

[ ... ]

> +static int bf_pitch_put(struct snd_kcontrol *kctl,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	int p =3D ucontrol->value.integer.value[0];
> +	int ret =3D 0;
> +
> +	if (p < -50 || p > 50)
> +		return -EINVAL;

[Severity: Low]
Can ucontrol->value.integer.value[0] wrap when narrowed from long to int he=
re
(and in bf_width_put() below) before the range check, unlike bf_master_put()
and bf_fx_send_put() which validate the long value prior to narrowing?

[ ... ]

> +static int bf_loopback_put(struct snd_kcontrol *kctl,
> +			   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	int out =3D kctl->private_value;
> +	bool on =3D ucontrol->value.integer.value[0];
> +	int ret =3D 0;
> +
> +	mutex_lock(&chip->mutex);
> +	if (on =3D=3D chip->loopback[out])
> +		goto out;
> +	ret =3D bf_loopback_write_map(chip, out, on);
> +	if (ret < 0)
> +		goto out;
> +	/* Single-active model (TotalMix writes one pair at 0x0001, the
> +	 * rest 0x0000): toggling one output clears the others.
> +	 */
> +	memset(chip->loopback, 0, sizeof(chip->loopback));
> +	chip->loopback[out] =3D on;
> +	ret =3D 1;
> +out:
> +	mutex_unlock(&chip->mutex);
> +	return ret;
> +}

[Severity: Medium]
When enabling Loopback Switch on one output clears a previously active
chip->loopback[] entry via memset(), should this notify user space with
snd_ctl_notify() for the cleared control (similar to how bf_trim_put()
notifies its sibling control)?

Also, babyface_create_flags() registers Loopback Switch using bf_mute_info
(which declares count =3D 2 channels), whereas bf_loopback_put() only inspe=
cts
ucontrol->value.integer.value[0]. Should Loopback Switch use bf_switch_info
(count =3D 1) or handle both channels?

[ ... ]

> +static int bf_an12_put(struct snd_kcontrol *kctl,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	bool an12 =3D ucontrol->value.integer.value[0];
> +	u16 v;
> +	int ret =3D 0;
> +
> +	mutex_lock(&chip->mutex);
> +	if (an12 =3D=3D chip->an12)
> +		goto out;
> +	v =3D (chip->linked ? 0x0400 : 0x0000) | (an12 ? 0x1000 : 0x0000);
> +	ret =3D bf_vendor_write(chip, BF_REQ_PREAMP, v, 0x1000);
> +	if (ret < 0)
> +		goto out;
> +	ret =3D bf_vendor_write(chip, BF_REQ_PREAMP_COMMIT, 0x0000, 0x0000);

[Severity: Medium]
Does sending BF_REQ_PREAMP_COMMIT with a hardcoded 0x0000 here (as well as =
in
bf_link_put() and bf_state_apply_flags()) clear the Instrument 3/4 Boost
reference level on the hardware?

In bf_preamp_state_write(), Boost is distinguished from -10dBV by passing
wValue =3D 0x0003 instead of 0x0000 to BF_REQ_PREAMP_COMMIT:

    u16 commit =3D chip->ref_level =3D=3D BF_REF_LEVEL_BOOST ? 0x0003 : 0x0=
000;

When chip->ref_level =3D=3D BF_REF_LEVEL_BOOST, toggling AN 1>2 Switch or A=
N1/2
Link Switch, or running bf_state_apply_flags() after bf_preamp_state_write(=
),
sends 0x0000 and drops the hardware back to -10dBV while chip->ref_level st=
ill
reports Boost.

[ ... ]

> +static int bf_clock_put(struct snd_kcontrol *kctl,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	bool optical =3D ucontrol->value.enumerated.item[0] !=3D 0;
> +	int ret =3D 0;

[ ... ]

> +static int bf_optical_put(struct snd_kcontrol *kctl,
> +			  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	bool spdif =3D ucontrol->value.enumerated.item[0] !=3D 0;
> +	int ret =3D 0;

[Severity: Low]
Should bf_clock_put() and bf_optical_put() reject ucontrol->value.enumerate=
d.item[0] >=3D 2
with -EINVAL when CONFIG_SND_CTL_INPUT_VALIDATION is not enabled, matching
bf_reflevel_put()?

[ ... ]

> +static int bf_ms_put(struct snd_kcontrol *kctl,
> +		     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	bool on =3D ucontrol->value.integer.value[0];
> +	int ret =3D 0;
> +
> +	mutex_lock(&chip->mutex);
> +	if (on =3D=3D chip->ms_proc)
> +		goto out;
> +	if (on) {
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x0035);
> +		if (ret < 0)
> +			goto out;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x004f);
> +		if (ret < 0)
> +			goto out;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x0001);
> +		if (ret < 0)
> +			goto out;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0000, 0x001b);
> +		if (ret < 0)
> +			goto out;
> +	} else {
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				      chip->xpoint[1][1][0], 0x0001);
> +		if (ret < 0)
> +			goto out;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				      chip->xpoint[1][1][0], 0x0035);
> +		if (ret < 0)
> +			goto out;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				      chip->xpoint[1][1][1], 0x001b);
> +		if (ret < 0)
> +			goto out;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				      chip->xpoint[1][1][1], 0x004f);
> +		if (ret < 0)
> +			goto out;
> +	}

[Severity: High]
When disengaging MS Processor Switch (on =3D=3D false), does this write out=
put 1's
(PH3/4) cached AN2 crosspoints into output 0's (AN1/2) registers?

Registers 0x0001 (L) and 0x001b (R) belong to output pair 0 (AN1/2), whose
cached AN2 levels are in chip->xpoint[0][1][0] and chip->xpoint[0][1][1],
whereas chip->xpoint[1][1][0..1] holds output pair 1 (PH3/4, registers 0x00=
35
and 0x004f). Writing chip->xpoint[1][1][0..1] to 0x0001 and 0x001b overwrit=
es
output 0's AN2 routing with output 1's fader values and leaves hardware out=
 of
sync with chip->xpoint[0][1].

[ ... ]

> +static int bf_dim_apply(struct snd_usb_babyface *chip, bool on)
> +{
> +	u16 flag;
> +	int ret;
> +
> +	lockdep_assert_held(&chip->mutex);
> +	if (on) {
> +		chip->dim_saved[0] =3D chip->master[1][0];
> +		chip->dim_saved[1] =3D chip->master[1][1];
> +		ret =3D bf_vendor_write(chip, BF_REQ_GAIN, BF_MASTER_MINUS20_8,
> +				      BF_REG_MASTER_8 + 2 * 1);
> +		if (ret < 0)
> +			return ret;
> +		ret =3D bf_vendor_write(chip, BF_REQ_GAIN, BF_MASTER_MINUS20_8,
> +				      BF_REG_MASTER_8 + 2 * 1 + 1);
> +		if (ret < 0)
> +			return ret;
> +		flag =3D bf_flag_cycle[chip->flag_cnt];
> +		chip->flag_cnt =3D (chip->flag_cnt + 1) & 3;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				      BF_MASTER_MINUS20_16,
> +				      (BF_REG_MASTER_16 + 2 * 1) | flag);
> +		if (ret < 0)
> +			return ret;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				      BF_MASTER_MINUS20_16,
> +				      (BF_REG_MASTER_16 + 2 * 1 + 1) | flag);
> +		if (ret < 0)
> +			return ret;
> +		ret =3D bf_vendor_write(chip, BF_REQ_PREAMP, 0x2000, 0x2000);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		ret =3D bf_vendor_write(chip, BF_REQ_GAIN,
> +				      bf_master_reg8(chip->dim_saved[0]),
> +				      BF_REG_MASTER_8 + 2 * 1);
> +		if (ret < 0)
> +			return ret;
> +		ret =3D bf_vendor_write(chip, BF_REQ_GAIN,
> +				      bf_master_reg8(chip->dim_saved[1]),
> +				      BF_REG_MASTER_8 + 2 * 1 + 1);
> +		if (ret < 0)
> +			return ret;
> +		flag =3D bf_flag_cycle[chip->flag_cnt];
> +		chip->flag_cnt =3D (chip->flag_cnt + 1) & 3;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				      bf_master_reg16(chip->dim_saved[0]),
> +				      (BF_REG_MASTER_16 + 2 * 1) | flag);
> +		if (ret < 0)
> +			return ret;
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				      bf_master_reg16(chip->dim_saved[1]),
> +				      (BF_REG_MASTER_16 + 2 * 1 + 1) | flag);
> +		if (ret < 0)
> +			return ret;
> +		ret =3D bf_vendor_write(chip, BF_REQ_PREAMP, 0x0000, 0x2000);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	chip->dim =3D on;
> +	return 0;
> +}

[Severity: High]
What happens in bf_dim_apply() (and in the chip->dim restore block in
bf_state_apply_flags()) if the Phones output is muted (chip->muted[1] =3D=
=3D true)?

Both paths write non-muted gain values (BF_MASTER_MINUS20_8 /
BF_MASTER_MINUS20_16 on engage, or chip->dim_saved[0..1] on release) to the
Phones master registers without checking chip->muted[1]. If Phones was mute=
d,
toggling Dim Switch or running bf_state_apply_flags() unmutes the headphones
on the hardware while chip->muted[1] remains true.

[ ... ]

> +	kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +		.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name =3D "Dim Switch",
> +		.info =3D bf_switch_info,
> +		.get =3D bf_dim_get,
> +		.put =3D bf_dim_put,
> +	}, chip);
> +	chip->dim_kctl =3D kctl;
> +	err =3D snd_ctl_add(chip->card, kctl);
> +	if (err < 0)
> +		return err;

[Severity: Low]
This isn't a bug, but chip->dim_kctl is assigned here in
babyface_create_flags() and never read anywhere in the driver (a later patch
adds a separate chip->dim_press_kctl for the front-panel button). Can
dim_kctl be dropped from struct snd_usb_babyface?

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> index c2835e2d64851..ed4555c711064 100644
> --- a/sound/usb/babyfacepro/babyfacepro.c
> +++ b/sound/usb/babyfacepro/babyfacepro.c

[ ... ]

> @@ -300,14 +317,111 @@ int babyface_restore_state(struct snd_usb_babyface=
 *chip)
>  	return bf_pitch_write(chip, chip->pitch);
>  }
> =20
> -/* Re-apply the per-input state that sits on top of the crosspoints
> - * (phase invert, stereo split, trim) after a state restore.  The write
> - * patterns mirror the corresponding _put() handlers.  Caller holds
> - * chip->mutex.
> +/* Re-apply the state that sits on top of the masters and crosspoints
> + * (the routing flags, DIM, phase invert, stereo split, trim) after a
> + * state restore.  The write patterns mirror the corresponding _put()
> + * handlers.  Caller holds chip->mutex.
>   */
>  int bf_state_apply_flags(struct snd_usb_babyface *chip)
>  {
> -	int ret;
> +	int out, ret, on_out =3D -1;
> +	u16 l, r;
> +
> +	/* Loopback: the full 30-channel map from the cached state (the
> +	 * single-active invariant keeps at most one pair at 0x0001).
> +	 */
> +	for (out =3D 0; out < 6; out++) {
> +		if (chip->loopback[out]) {
> +			on_out =3D out;
> +			break;
> +		}
> +	}
> +	ret =3D bf_loopback_write_map(chip, on_out, on_out >=3D 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D bf_vendor_write(chip, BF_REQ_PREAMP,
> +			      (chip->linked ? 0x0400 : 0x0000) |
> +			      (chip->an12 ? 0x1000 : 0x0000), 0x1000);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D bf_vendor_write(chip, BF_REQ_PREAMP_COMMIT, 0x0000, 0x0000);
> +	if (ret < 0)
> +		return ret;
> +
> +	l =3D (u16)(((0x2000 * (100 + chip->width) / 2) + 50) / 100);
> +	r =3D 0x2000 - l;
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x0000);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x001a);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x0001);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x001b);
> +	if (ret < 0)
> +		return ret;

[Severity: High]
Does running bf_state_apply_flags() unconditionally unmute hardware inputs =
AN1
and AN2 into the main outputs (AN1/2) on probe and state restore?

In babyface_probe(), babyface_write_default_mixer() intentionally writes 0 =
to
all hardware input crosspoints (src < BF_SRC_PB1, which includes AN1 at
0x0000/0x001a and AN2 at 0x0001/0x001b on output 0) and caches 0 in
chip->xpoint[0][0..1][0..1] so live inputs are not routed out of the box.

Immediately afterward, babyface_probe() calls bf_state_apply_flags(). Even
when chip->width =3D=3D 0, this block computes l =3D 0x1000 and r =3D 0x100=
0 and
writes them to registers 0x0000, 0x001a, 0x0001, and 0x001b, routing AN1 and
AN2 at 0 dB into output 0 while chip->xpoint[0][0..1][0..1] remains 0. Beca=
use
the cache still holds 0, a subsequent alsactl restore or mixer write of 0 to
those crosspoints hits the early return in bf_xpoint_put() and cannot mute
them.

Also, when chip->width is non-zero, bf_width_put() writes both the low map
(0x0000, 0x001a, 0x0001, 0x001b) and the block-0 map (0x0034, 0x004e, 0x003=
5,
0x004f), whereas bf_state_apply_flags() only writes the low map. Should the
width writes in bf_state_apply_flags() be guarded by if (chip->width) and
include both maps?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113140.1342=
57-1-i.bahloul01@gmail.com?part=3D4
