Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101709;
	b=tKc4bgl9jOcwUGndNcpjS6wvArqb69EWrQ+WtKCEW9VyQ+IJp6woOER3TuanqAXcVgyK
	 BN5JPA9taK9jCVcGWPvm3b1PE3sKYnmJzNI/yDBeaG1J2rKyPqBRGJJCECbQNFG4jQW+b
	 ZlZMS6fwRDvgU67mtmzvM4LAbu0H5z1TVavXnRrYBdK25QVI0Je5/AHoY9r6JBJoWx3X1
	 Ua4DHn9doKD+QIJapo+1mIHF8ulKbncoz9//bX+pRO9N8tI/bP9mSaOmDQeWRBbxCiOg9
	 wvn0bms3GxyUMYyQrvfsVDhjdXrI52Oaqo9HY5qLjy3fkHHnluqxTMejNDQQjA8Kw1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101709;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sd5eAaiU7UHA2GQLojSd23ytQtrYY5wLx5xhRCAo6Ws=;
	b=rIvFJvOGnM6SK8IBnPwl+snSaL3otxtyHIwdgJdwDiJkhafzrmmRQMpdDay/DQdT19x1
	 s1IGIUMikB39meEm/JcJKV9eHSjjDGTuvdIbNmQ2jnaK40OJ+IdjLgbRM+VXdch0xAe3B
	 WxysKyvsvVRSbL9rp+goRSHf9iJ3bb7C8cmKM3sGAgLRKS6fT31gAxFP0wcjU7mg0HpKe
	 mo9w+mCOrBSKbFCXxmRLo4I3ANcIxhcAVgZR2O0mUqpiuCAH0+7anL3Oz9wjcVcgMWyNq
	 9ZnToYd1Njm32LknJ6FXPbvSZi8V5Pq+VH8RMCF5Pf7anXfav/EIO5ZXFJgfLGiQo9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mzSEjiBr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9B3606A31A;
	Tue, 27 Oct 2026 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mzSEjiBr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060201F01825;
	Tue, 27 Oct 2026 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101709;
	bh=Sd5eAaiU7UHA2GQLojSd23ytQtrYY5wLx5xhRCAo6Ws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mzSEjiBrryb26nc4AxL8ZbHlHK7w8xWHuNb0/G52LP1MZ3xWXQdCpZgv6gKiz8dOq
	 IesegtYzv+pJbX+KDTMJnDlXW748Z0nLSuvUYciHAE1mIzDSR13agFdwr5CKq909eP
	 sqvoHgGTz1+O5XIP/Rq5rpPTuwlf2mjo+0XuVlLWHwhcRh7JC+/alvGW2hKqfJ86Fh
	 yvlZsID8/SdGalHgh5463LwMKaAGk2KKVH9VnatUp6c4CHl1cd/rIQ7w7Zi3ZJEcrP
	 5QBwI92dEDNY4a6ox7iDhu5X8EY+6k/DIY0CBOunOZC+ckVnlrQtacOGrluGrb3T7o
	 rf+5SrZMvOYIQ==
Message-ID: <sashiko-outbox-186476@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/8] ALSA: usb: babyfacepro: add mic preamp,
 phantom/pad and input trim
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027113140.134257-4-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
 <20261027113140.134257-4-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:48:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] ALSA: usb: babyfacepro: bf_trim_apply() and bf_split_apply() clobb=
er xpoints
- [High] ALSA: usb: babyfacepro: unchecked snd_ctl_new1() in babyface_creat=
e_trim()
- [Medium] ALSA: usb: babyfacepro: hardcoded Mic 1 names in babyface_create=
_preamp()
- [Medium] ALSA: usb: babyfacepro: unsynced ref_level on readback in babyfa=
ce_probe()
- [Low] ALSA: usb: babyfacepro: unlocked preamp read in bf_phantom_put()
- [Low] ALSA: usb: babyfacepro: unused dead function bf_gain_db()
--

commit b41b007f1eed261ac67b9aeaa1416892ba18f7af
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add mic preamp, phantom/pad and input trim

This commit adds ALSA mixer controls for microphone phantom power, pad,
instrument reference level, preamp capture gain, phase invert, stereo split,
and input trim on the RME Babyface Pro.

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> index 9b41dcde5308a..60604242be883 100644
> --- a/sound/usb/babyfacepro/babyfacepro-ctl.c
> +++ b/sound/usb/babyfacepro/babyfacepro-ctl.c
> @@ -654,3 +654,629 @@ int babyface_create_masters(struct snd_usb_babyface=
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
> +	u16 l =3D split ? 0x2000 : 0x1000;
> +	u16 r =3D split ? 0x0000 : 0x1000;
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

[Severity: High]
Won't bf_trim_apply() and bf_split_apply() clobber the active AN1/2
crosspoint fader levels, panning, and phase inversion?

In babyfacepro.h, BF_REG_LOWMAP_BASE_L (0x0000) and BF_REG_LOWMAP_BASE_R
(0x001a) are aliases for BF_REG_XPOINT_BASE_L and BF_REG_XPOINT_BASE_R,
which are the crosspoint registers for output pair 0 (the AN1/2 main analog
output).

Although the commit message states that trim combines with the current fader
value on the crosspoint fader curve, bf_trim_apply() ignores
chip->xpoint[0][...] completely. Instead, it converts trim_db2 using
bf_master_16bit() (where 0 dB is 0x2000 and the return value is clamped to
[1, 0x4000]) and writes trim_raw directly to all four L and R crosspoint
registers of the input pair on AN1/2.

By default in babyface_write_default_mixer(), analog inputs AN1-4 have
chip->xpoint[0][0..3][0/1] set to 0 so live microphones are not routed into
the main speakers. Writing to Trim Volume via bf_trim_put() ->
bf_trim_apply() (even setting it to a value and back to 0 dB during alsactl
restore) writes 0x2000 into all four AN1/2 crosspoint registers for that
input pair, unmuting both live inputs into both L and R of the main speakers
while the AN1..AN4 Playback Volume controls still report 0. Even at -65 dB,
bf_master_16bit() clamps to 1 rather than 0.

In addition, bf_trim_apply() overwrites any active phase inversion in
chip->phase[] on out =3D 0 (including inside bf_state_apply_flags(), where =
the
trim loop runs after the phase loop and overwrites the negated L register
just written by bf_phase_apply() for out =3D 0). In bf_phase_apply() itself,
only BF_REG_XPOINT_BASE_L is inverted while BF_REG_XPOINT_BASE_R is left
untouched, and when plain =3D=3D 0 (muted), ~plain writes 0xffff.

Similarly, when disabling stereo split (split =3D=3D false) via bf_split_pu=
t() ->
bf_split_apply(), hardcoded 0x1000 (-6 dB) is written to the AN1/2 L and R
crosspoint registers instead of restoring the cached crosspoint fader values
in chip->xpoint[0][8 + pb][0/1] (which default to BF_FADER_0DB =3D 0x16a0).
Conversely, any subsequent bf_xpoint_put() -> bf_xpoint_write() writes plain
chip->xpoint[out][src][0/1] values, wiping out active phase, split, or trim
state on the hardware while their control caches remain set.

[ ... ]

> +int babyface_create_trim(struct snd_usb_babyface *chip)
> +{
> +	struct snd_kcontrol *kctl;
> +	int src, err;
> +
> +	for (src =3D 0; src < 4; src++) {
> +		kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +			.name =3D "Phase Switch",
> +			.index =3D src,
> +			.info =3D bf_phase_info,
> +			.get =3D bf_phase_get,
> +			.put =3D bf_phase_put,
> +			.private_value =3D src,
> +		}, chip);
> +		strscpy(kctl->id.name, bf_sources[src].name, sizeof(kctl->id.name));
> +		strlcat(kctl->id.name, " Phase Switch", sizeof(kctl->id.name));
> +		err =3D snd_ctl_add(chip->card, kctl);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	for (src =3D 0; src < 6; src++) {
> +		kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +			.name =3D "Stereo Split Switch",
> +			.index =3D src,
> +			.info =3D bf_phase_info, /* plain boolean, same shape */
> +			.get =3D bf_split_get,
> +			.put =3D bf_split_put,
> +			.private_value =3D src,
> +		}, chip);
> +		strscpy(kctl->id.name, bf_sources[8 + src].name, sizeof(kctl->id.name)=
);
> +		strlcat(kctl->id.name, " Stereo Split Switch", sizeof(kctl->id.name));
> +		err =3D snd_ctl_add(chip->card, kctl);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	for (src =3D 0; src < 4; src++) {
> +		kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +			.name =3D "Trim Volume",
> +			.index =3D src,
> +			.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE |
> +				  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
> +			.info =3D bf_trim_info,
> +			.get =3D bf_trim_get,
> +			.put =3D bf_trim_put,
> +			.tlv.p =3D bf_trim_tlv,
> +			.private_value =3D src,
> +		}, chip);
> +		chip->trim_kctl[src] =3D kctl;
> +		strscpy(kctl->id.name, bf_sources[src].name, sizeof(kctl->id.name));
> +		strlcat(kctl->id.name, " Trim Volume", sizeof(kctl->id.name));
> +		err =3D snd_ctl_add(chip->card, kctl);
> +		if (err < 0)
> +			return err;
> +	}
> +	return 0;
> +}

[Severity: High]
Can snd_ctl_new1() return NULL here and cause a NULL pointer dereference in
babyface_create_trim()?

In all three loops in babyface_create_trim(), kctl->id.name is passed to
strscpy() and strlcat() before snd_ctl_add() checks whether kctl is NULL.
(Note that babyface_create_xpoints() and babyface_create_masters() from the
earlier patch in this series have the same unchecked kctl->id.name
dereference after snd_ctl_new1().)

Also, in the Trim Volume loop, chip->trim_kctl[src] =3D kctl is assigned
before snd_ctl_add(chip->card, kctl). Since snd_ctl_add() frees kctl on
failure, wouldn't an error in snd_ctl_add() leave a dangling pointer in
chip->trim_kctl[src]?

[ ... ]

> +static int bf_phantom_put(struct snd_kcontrol *kctl,
> +			  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	u16 bit =3D kctl->private_value;
> +	bool on =3D ucontrol->value.integer.value[0];
> +	bool cur =3D !!(chip->preamp & bit);
> +	u16 old =3D chip->preamp;
> +	int ret =3D 0;
> +
> +	mutex_lock(&chip->mutex);
> +	if (on =3D=3D cur)
> +		goto out;
> +	chip->preamp =3D on ? (chip->preamp | bit) : (chip->preamp & ~bit);
> +	ret =3D bf_preamp_state_write(chip);
> +	if (ret < 0) {
> +		/* Do not leave the cache claiming a state the device
> +		 * never took.
> +		 */
> +		chip->preamp =3D old;
> +		goto out;
> +	}
> +	ret =3D 1;
> +out:
> +	mutex_unlock(&chip->mutex);
> +	return ret;
> +}

[Severity: Low]
Should cur and old be read from chip->preamp after acquiring chip->mutex in
bf_phantom_put()?

Currently, cur and old are sampled before mutex_lock(&chip->mutex), whereas
other writers (such as bf_reflevel_put() and the front-panel work handler
added later in the series) update chip->preamp under chip->mutex. Reading
chip->preamp before taking the lock could cause the change check or the err=
or
rollback to use a stale value.

[ ... ]

> +int bf_gain_max_db(int mic)
> +{
> +	return mic < 2 ? BF_GAIN_MAX_DB : 9;
> +}
> +
> +int bf_gain_db(int mic, u8 raw)
> +{
> +	if (mic >=3D 2)
> +		return raw / 2;
> +	return 3 * (raw & BF_GAIN_COARSE_MASK) + (raw >> BF_GAIN_FINE_SHIFT);
> +}

[Severity: Low]
Is bf_gain_db() needed?

It is defined here and declared in babyfacepro.h, but it has no callers in
this patch or across the rest of the patch series because chip->gain[]
stores the value in dB and converts to the raw register encoding via
bf_gain_raw() on write.

[ ... ]

> +int babyface_create_preamp(struct snd_usb_babyface *chip)
> +{
> +	struct snd_kcontrol *kctl;
> +	int i, err;
> +
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
> +		err =3D snd_ctl_add(chip->card, kctl);
> +		if (err < 0)
> +			return err;
> +	}
> +	return 0;
> +}

[Severity: Medium]
Are the control names in babyface_create_preamp() intentionally hardcoded to
"Mic 1" for all channels?

The three loops iterate over i =3D 0..1 for phantom power, i =3D 0..1 for p=
ad,
and i =3D 0..3 for capture gain (covering Mic 1, Mic 2, Instrument 3, and
Instrument 4), but every iteration uses "Phantom Power Mic 1", "Pad Mic 1",
and "Mic 1 Capture Volume" with only .index =3D i varying. Should these Eit=
her
omit "Mic 1" when using .index =3D i, or use per-channel names?

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> index de1659307fbc0..c2835e2d64851 100644
> --- a/sound/usb/babyfacepro/babyfacepro.c
> +++ b/sound/usb/babyfacepro/babyfacepro.c

[ ... ]

> @@ -1429,6 +1507,15 @@ static int babyface_probe(struct usb_interface *in=
tf,
>  		goto error;
>  	}
> =20
> +	/* Sync the preamp state from the 0x17 readback (byte 0 mirrors
> +	 * the 48V/PAD bits; it persists across power cycles).
> +	 */
> +	err =3D bf_vendor_read(chip, BF_REQ_PREAMP, BF_REG_PREAMP, st);
> +	if (err < 0)
> +		dev_dbg(&intf->dev, "preamp readback failed: %d\n", err);
> +	else
> +		chip->preamp =3D st[0];

[Severity: Medium]
Does assigning chip->preamp =3D st[0] in babyface_probe() leave
chip->ref_level out of sync with chip->preamp?

Earlier in babyface_probe(), chip->preamp is initialized to BF_PREAMP_BASE
(BF_PREAMP_REF_4DBU, 0x000c) while chip->ref_level is 0 (BF_REF_LEVEL_4DBU).
When bf_vendor_read() succeeds and st[0] has the BF_PREAMP_REF_MASK (0x000c)
bits clear, chip->preamp has its ref-level bits cleared (-10dBV) while
chip->ref_level remains 0 (+4dBu).

After that, bf_reflevel_get() reports +4dBu even though the ref-level bits =
in
chip->preamp are clear, any phantom power or pad toggle in bf_phantom_put()
writes -10dBV to the hardware, and trying to select +4dBu (item =3D=3D 0) in
bf_reflevel_put() hits the early return:

	if ((int)item =3D=3D chip->ref_level)
		goto out;

without setting BF_PREAMP_REF_4DBU in chip->preamp. Should babyface_probe()
either sync chip->ref_level from st[0] & BF_PREAMP_REF_MASK or preserve
BF_PREAMP_BASE when applying the readback byte?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113140.1342=
57-1-i.bahloul01@gmail.com?part=3D3
