Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892721;
	b=lPj/VC5ywU7VNmaTBTYYBymzHAuTqgG5b9xJ3VaAe6oJLMI/w44ow+/yVWOVsrY6Rmf4
	 /yrDB2Bv39wchtMzUFWDL+QjonqNLdNge9MeKBEVKHEQAqlcWOr4en56lkTb1C/9QeLpQ
	 04/uqD9ZADl+UJIEnbfi//99cQUh0FvH8AOO7H+v4Bvy7KHAH85KsoiiyPzmuGRh2PB5P
	 owWoI45Ux3LXdCvBPPtAlE5wT02LPFfGLPZfas1Fper7ERsbOHE0iYM3JZqdDBBYO4WzW
	 XJfdhVXqrPZ/AwbLEn66r6nOj+gWIAOnfZscVudjwBlzgqPKuxh3jQZdtcgFauSRSVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892721;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mi2ntVENYBXFxWjPQdprwpU30d0F1PDeFLffOY8vNww=;
	b=dcWWqRydRrLu9qiJpcCpoLjNTo9uGgPuu+UJTMy1R0gd/XFR5xGViOGsrWozQv+fHhpm
	 6epBbO7aXaR76sc59iRiCJTeJviS2pjmhwaOuv6K47w2RynkRm/okYXEsAhh4AZjZWRPr
	 AGgsYb614CHtqKUZ/IzCaAi885RPhIr0fS3UB1aDckK22Ydx6vm0TTFORUuWkjeIEtL6G
	 J0xvywb4ihcSXbZe+rCipCUzpQMMKVaROo3ruVdP/k9cNCEezpklLDfdMIQNWkjijZiqb
	 EqnnBYAGtyo/mejotMvGeNrG9qlXbIU0f395ZvSdZh4H8aQPGih5xfJruTY+dEUQqiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U0/1EGIe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB96606D829;
	Thu,  5 Nov 2026 15:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U0/1EGIe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76EA1F00A1A;
	Thu,  5 Nov 2026 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892720;
	bh=mi2ntVENYBXFxWjPQdprwpU30d0F1PDeFLffOY8vNww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U0/1EGIeh9Vd6cU+xKWkVzAhaQaNYPkb1knoO05lC+DD7LUPPW9DpuYzxxmqG+jIM
	 AoC9I244/4dwQM76O0avISTIv05oKfLTM0pldZJhlzshRF/6o+XHGtg0Iq6JhUc0tC
	 S3s41kU7UEOnhVRzR21hTkgXutWTeLG5yVnWS/SxOwHl1q4y72OSPIirzBryIA73yc
	 Bs4qo8U3Tw0TEG+6gcGC94oEw9lY5VCqfZKlNAU1yRbsna2N38AGRysyFwAFI5VEaV
	 MCWfwZP+RVaB41n0UJXdg0L1Qd2kbxMt4qbHiRIAGPuqNI8R3D3Cyi8Ng2WALRyziI
	 yitZ6pzXINbOg==
Message-ID: <sashiko-outbox-199312@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/8] ALSA: usb: babyfacepro: add mic preamp,
 phantom/pad and input trim
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105151553.223722-4-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
 <20261105151553.223722-4-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:32:00 +0000
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
- [High] ALSA: usb: babyfacepro: bf_trim_apply() and bf_phase_apply() clobb=
er xpoints
- [Medium] ALSA: usb: babyfacepro: hardcoded Mic 1 names in babyface_create=
_preamp()
- [Low] ALSA: usb: babyfacepro: unchecked snd_ctl_new1() in babyface_create=
_preamp()
- [Low] ALSA: usb: babyfacepro: bf_phase_info() and bf_bool_info() duplicat=
e code
--

commit 82ef805ee77606164dc3814bf736734ca60721d5
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add mic preamp, phantom/pad and input trim

This commit adds ALSA mixer controls for the input side of the RME Babyface
Pro, including phantom power, pad, instrument reference level, mic/instrume=
nt
preamp gains, phase invert, stereo split, and input trim.

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> index 942d4732cbe07..fe6266ea118e6 100644
> --- a/sound/usb/babyfacepro/babyfacepro-ctl.c
> +++ b/sound/usb/babyfacepro/babyfacepro-ctl.c
> @@ -654,3 +654,627 @@ int babyface_create_masters(struct snd_usb_babyface=
 *chip)

[ ... ]

> +int bf_phase_apply(struct snd_usb_babyface *chip, int mic, bool invert)
> +{
> +	const struct bf_source *s =3D &bf_sources[mic];
> +	int out, ret;
> +	u16 flag;
> +
> +	for (out =3D 0; out < 6; out++) {
> +		u16 plain =3D chip->xpoint[out][mic][0];
> +		u16 value =3D invert ? (u16)~plain : plain;
> +
> +		/* The AN1/2 block is written without the rotating bits, as
> +		 * bf_xpoint_write() does.
> +		 */
> +		flag =3D 0;
> +		if (out) {
> +			flag =3D bf_flag_cycle[chip->flag_cnt];
> +			chip->flag_cnt =3D (chip->flag_cnt + 1) & 3;
> +		}
> +		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, value,
> +				      (BF_REG_XPOINT_BASE_L +
> +				       BF_REG_XPOINT_STRIDE * out + s->idx_l) |
> +				      flag);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	return 0;
> +}

[ ... ]

> +int bf_split_apply(struct snd_usb_babyface *chip, int pb, bool split)
> +{
> +	const struct bf_source *s =3D &bf_sources[8 + pb];
> +	u16 l =3D split ? 0x2000 : chip->xpoint[0][8 + pb][0];
> +	u16 r =3D split ? 0x0000 : chip->xpoint[0][8 + pb][1];
> +	int ret;
> +
> +	/* The AN1/2 block.  The same values also went to a "standard map"
> +	 * half at 0x0068, which is AS1/2's submix, not part of AN1/2: it
> +	 * overwrote AS1/2's own crosspoint for this playback pair.
> +	 */
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, l,
> +			      BF_REG_XPOINT_BASE_L + s->idx_l);
> +	if (ret < 0)
> +		return ret;
> +	return bf_vendor_write(chip, BF_REQ_CROSSPOINT, r,
> +			       BF_REG_XPOINT_BASE_R + s->idx_r);
> +}

[ ... ]

> +int bf_trim_apply(struct snd_usb_babyface *chip, int mic, int trim_db2)
> +{
> +	int base =3D mic & ~1;
> +	int sib =3D base + 1;
> +	const struct bf_source *sb =3D &bf_sources[base];
> +	const struct bf_source *ss =3D &bf_sources[sib];
> +	u16 trim_raw =3D bf_master_16bit(trim_db2);
> +	int ret;
> +
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, trim_raw,
> +			      BF_REG_LOWMAP_BASE_L + sb->idx_l);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, trim_raw,
> +			      BF_REG_LOWMAP_BASE_R + sb->idx_r);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, trim_raw,
> +			      BF_REG_LOWMAP_BASE_L + ss->idx_l);
> +	if (ret < 0)
> +		return ret;
> +	return bf_vendor_write(chip, BF_REQ_CROSSPOINT, trim_raw,
> +			       BF_REG_LOWMAP_BASE_R + ss->idx_r);
> +}

[ ... ]

> +static int bf_trim_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_va=
lue *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	int mic =3D kctl->private_value;
> +	int sib =3D mic ^ 1;
> +	int db =3D ucontrol->value.integer.value[0];
> +	int ret =3D 0;
> +
> +	if (db < -65 || db > 6)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &chip->mutex) {
> +		if (db =3D=3D chip->trim[mic])
> +			return 0;
> +		ret =3D bf_trim_apply(chip, mic, db * 2);
> +		if (ret < 0)
> +			return ret;

[Severity: High]
As reported by Sashiko on v7 [1], does bf_trim_apply() clobber the AN1/2
crosspoint state and unmute live analog inputs into the main outputs?

In sound/usb/babyfacepro/babyfacepro.h, BF_REG_LOWMAP_BASE_L (0x0000) and
BF_REG_LOWMAP_BASE_R (0x001a) are the exact same register addresses as
BF_REG_XPOINT_BASE_L and BF_REG_XPOINT_BASE_R for output pair 0 (the AN1/2
main output). In babyface_write_default_mixer(), analog inputs AN1-4 have
chip->xpoint[0][0..3][0/1] initialized to 0 so live microphones are not
routed directly into the speakers.

When bf_trim_put() calls bf_trim_apply(), it converts trim_db2 via
bf_master_16bit() (clamped to [1, 0x4000] where 0 dB is 0x2000, compared to
BF_FADER_0DB =3D 0x16a0 on the crosspoint curve) and writes trim_raw direct=
ly
to all four L and R crosspoint registers of the input pair (base and sib) on
AN1/2, ignoring chip->xpoint[0][base/sib][0/1]. Touching Trim Volume at all
(even at -65 dB, or returning it to 0 dB which writes 0x2000 instead of
restoring chip->xpoint[0][base/sib][0/1]) unconditionally routes both inputs
of the pair to both L and R of AN1/2, overriding any muted state, fader
level, or panning.

Because chip->xpoint[0][base/sib][0/1] remains 0 in the cache while the
hardware holds 0x2000, a subsequent write of 0 to the crosspoint control hi=
ts
the early return in bf_xpoint_put():

sound/usb/babyfacepro/babyfacepro-ctl.c:bf_xpoint_put() {
	guard(mutex)(&chip->mutex);
	if (l =3D=3D chip->xpoint[out][src][0] && r =3D=3D chip->xpoint[out][src][=
1])
		return 0;

	ret =3D bf_xpoint_write(chip, out, src, l, r);
}

and cannot re-mute the hardware.

Additionally, because bf_phase_apply(), bf_split_apply(), bf_trim_apply(),
and bf_xpoint_put() write to the shared crosspoint registers without
combining their state:
- bf_trim_apply() (both in bf_trim_put() and in bf_state_apply_flags() where
  the trim loop runs after the phase loop) overwrites the negated out =3D 0=
 L
  register written by bf_phase_apply().
- bf_phase_apply() only negates BF_REG_XPOINT_BASE_L (leaving R un-inverted,
  and writing ~0 =3D 0xffff when plain =3D=3D 0).
- Any subsequent bf_xpoint_put() writes plain l/r values, silently wiping o=
ut
  active phase, stereo split, or trim settings in hardware while their cach=
ed
  control states remain active.

[ ... ]

> +static int bf_bool_info(struct snd_kcontrol *kctl,
> +			struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN;
> +	uinfo->count =3D 1;
> +	uinfo->value.integer.min =3D 0;
> +	uinfo->value.integer.max =3D 1;
> +	return 0;
> +}

[Severity: Low]
This isn't a bug, but bf_bool_info() is identical to bf_phase_info() added
earlier in sound/usb/babyfacepro/babyfacepro-ctl.c (and to the existing
bf_mute_info()). Could these controls use the standard ALSA helper
snd_ctl_boolean_mono_info() from include/sound/control.h instead of
duplicating the callback?

[ ... ]

> +int babyface_create_preamp(struct snd_usb_babyface *chip)
> +{
> +	struct snd_kcontrol *kctl;
> +	int i, err;
> +
> +	/* The control name is the type and .index is the channel (0 =3D
> +	 * Mic 1/AN1, 1 =3D Mic 2/AN2), the convention the companion mixer
> +	 * and existing asound.state files use.
> +	 */
> +	for (i =3D 0; i < 2; i++) {
> +		u16 bit =3D i =3D=3D 0 ? BF_PREAMP_48V_MIC1 : BF_PREAMP_48V_MIC2;
> +
> +		kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +			.name =3D "Phantom Power Mic 1",
> +			.index =3D i,
> +			.info =3D bf_bool_info,
> +			.get =3D bf_phantom_get,
> +			.put =3D bf_phantom_put,
> +			.private_value =3D bit,
> +		}, chip);
> +		if (!kctl)
> +			return -ENOMEM;
> +		err =3D snd_ctl_add(chip->card, kctl);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	for (i =3D 0; i < 2; i++) {
> +		u16 bit =3D i =3D=3D 0 ? BF_PREAMP_PAD_MIC1 : BF_PREAMP_PAD_MIC2;
> +
> +		kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +			.name =3D "Pad Mic 1",
> +			.index =3D i,
> +			.info =3D bf_bool_info,
> +			.get =3D bf_phantom_get,
> +			.put =3D bf_phantom_put,
> +			.private_value =3D bit,
> +		}, chip);
> +		if (!kctl)
> +			return -ENOMEM;
> +		err =3D snd_ctl_add(chip->card, kctl);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +		.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name =3D "Instrument Ref Level",
> +		.info =3D bf_reflevel_info,
> +		.get =3D bf_reflevel_get,
> +		.put =3D bf_reflevel_put,
> +	}, chip);
> +	err =3D snd_ctl_add(chip->card, kctl);
> +	if (err < 0)
> +		return err;

[Severity: Low]
If snd_ctl_new1() returns NULL for the "Instrument Ref Level" control in
babyface_create_preamp(), passing NULL to snd_ctl_add() will return -EINVAL
instead of -ENOMEM. Should this check if (!kctl) return -ENOMEM; before
calling snd_ctl_add() like the other control creation calls in this functio=
n?

> +
> +	for (i =3D 0; i < 4; i++) {
> +		kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +			.name =3D "Mic 1 Capture Volume",
> +			.index =3D i,
> +			.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE |
> +				  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
> +			.info =3D bf_gain_info,
> +			.get =3D bf_gain_get,
> +			.put =3D bf_gain_put,
> +			.tlv.p =3D bf_gain_tlv,
> +			.private_value =3D i,
> +		}, chip);

[Severity: Medium]
As reported by Sashiko on v7 [1], why do all three loops in
babyface_create_preamp() hardcode "Mic 1" in .name ("Phantom Power Mic 1",
"Pad Mic 1", and "Mic 1 Capture Volume") across all loop iterations?

When i > 0, this registers Mic 2 phantom power and pad as "Phantom Power
Mic 1",1 and "Pad Mic 1",1, and registers Mic 2, Instrument 3, and Instrume=
nt
4 capture gains as "Mic 1 Capture Volume" with indices 1, 2, and 3. Should
these either use a channel-neutral name when indexing by i, or format the
per-channel name as babyface_create_trim() does?

[1] https://lore.kernel.org/r/20261027113140.134257-4-i.bahloul01@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105151553.2237=
22-1-i.bahloul01@gmail.com?part=3D3
