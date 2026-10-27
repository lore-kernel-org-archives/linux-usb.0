Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101726;
	b=s8LXSt3gW2XFJMoaGyRjXPDkpSG7sI1u/LIAOn9Elxq07QoyIgt1SQ6JkEIUU+G5pHEW
	 Urxc1dGfQHpceXQCcsuTFYsL5TArPOCHIp8PLrLxHKLfBX8DQ15i8228970FwfDOdiRea
	 Qg+he+3iR1+SsCTgLypsP2bex3jXSk0ZmyBpFuwGR+Jt4zgfdGZq5ACoDvmKN17XvEoBO
	 hR0suGRVPsPpQ9Wv0GE/UlrJRNPugef+5lw4FDYHWDucKI8yUc29+aH+hUFNCAZVjM96B
	 XNAJFdXIRowh9MdfegWeZakg2FKEFqQf3zH1oJFKjX5gt9qHjYivw2PTkPPiv2kHuBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101726;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K2ldZRBGHSwKO9q4Kf3qPY21qozQRRtzIm/S6l7jVWI=;
	b=zvWHxMJFuO9z7/gYcr/obvjio2E98Q5vAaJeiSIRaHhhIILTR4oXpnyRZjwaCboxdNVW
	 au4wqJDI/QLip8VuzTAQC+gJfrFks8R1bfqLyAO1pe4K2M2PSaao/ziXHs2AYXFbXlZVa
	 Micn5ig1T+tBdw3tlWv/bxrvSSbmITnwC7YhDbqZ/xkptYOESv9ibwLmGI88C4Ip+wzMk
	 S9Si1KtACjeR5liE5IsZqCj+DAN5eyD49f8qaEE5aSlzuUWHN1js511Vl1Klquk1egCeb
	 QrZdLYJwV7bX9P9Vq9qUYojz9ejcTCSDPBRQvbYRhTnU9BxFlS5J4FZD9p4Ww1oG0Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LA7OrOCo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F6606A32A;
	Tue, 27 Oct 2026 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LA7OrOCo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730971F031E0;
	Tue, 27 Oct 2026 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101725;
	bh=K2ldZRBGHSwKO9q4Kf3qPY21qozQRRtzIm/S6l7jVWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LA7OrOCoIk5GyTIHx9Dp2I3I2q4TBqxoiatzHLMS/UKRhdsiL2pFA+xYRHJ0jFkYH
	 SUyq0ZtNa3NKjwzKax7ZFmKbjqWjFNA9SoXJuZ1UZRAysbxVYaoYbzzjDEtIp3fKDQ
	 yRfUIHjZtfpv3pjJicu3FGgFLQLCjEft4Pk5d3qWIqiuzkuHmch87y7Pjk9n2KZ337
	 /ncAlQXMrH8vqBEjo8yDTwZtdY1X5Nov2X8DKVU/qvcyO7S9GD2KEOl+dTYdZ864OE
	 laqLQwkyCwH8Ysv0zZbudL8PwL4hr6fwMJPasbYqRveZbcEB4y6YLeYayZHZlpKDIR
	 0kjfbmyijuSjg==
Message-ID: <sashiko-outbox-186478@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/8] ALSA: usb: babyfacepro: add output masters and
 crosspoint routing
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027113140.134257-3-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
 <20261027113140.134257-3-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:48:45 +0000
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
- [High] ALSA: usb: babyfacepro: NULL dereference on snd_ctl_new1() failure
- [High] ALSA: usb: babyfacepro: bf_mute_put() ignores second channel of st=
ereo switch
- [Medium] ALSA: usb: babyfacepro: missing shutdown check in mixer put call=
backs
- [Low] ALSA: babyfacepro: orphaned comment on babyface_capture_copy() and =
stale log
--

commit 1ac638b28a6154bd1d16f2527a4340828fe7ffbf
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add output masters and crosspoint routing

This commit adds ALSA mixer controls for the six output masters (volume and
mute) and the 6x14 crosspoint routing matrix on RME Babyface Pro devices. It
also initializes default mixer levels during probe and provides a helper to
restore cached mixer state.

>     ALSA: usb: babyfacepro: add output masters and crosspoint routing
>    =20
>     Add the first mixer controls: the six output masters (volume + mute)
>     and the 6x14 crosspoint matrix.  The device has no readback for any of
>     them, so the driver keeps the state host-side and the controls read
>     that cache.
>    =20
>     The probe's cold init clears the mixer registers, so probe writes a
>     power-on default: every playback channel into every output at 0 dB,
>     the hardware inputs off until a mixer raises them, and the two analog
>     outputs (AN1/2, PH3/4) at -20 dB, the level the hardware DIM button
>     uses.  The AN1/2 output sums from its own "low map" registers, so its
>     crosspoints are written to both maps.  A volume change leaves a muted
>     output muted.
>    =20
>     The masters count the 8-bit register's 0.5 dB steps over the front
>     panel's range: 0 is mute, 1 is -90 dB and BF_MASTER_STEP_MAX is +6 dB.
>     The control value is that step, so no log table converts it, and the
>     16-bit companion register is derived from the same step.
>    =20
>     A userspace usbfs claim (PipeWire, a libusb mixer daemon) detaches and
>     re-probes the interface, and the cold init of the re-probe clears the
>     mixer registers; alsactl restores the user's settings once the card is
>     registered again.
>    =20
>     Co-developed-by: David Fredman <davfre@gmail.com>
>     Signed-off-by: David Fredman <davfre@gmail.com>
>     Signed-off-by: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

[Severity: Low]
The commit message states:

  The AN1/2 output sums from its own "low map" registers, so its
  crosspoints are written to both maps.

However, the comments in babyfacepro.h and above bf_xpoint_write() explain
that AN1/2 is block 0 (0x0000) of a single crosspoint map rather than a
separate layer alongside a standard map, and bf_xpoint_write() only writes a
single block per output pair. Is this sentence in the commit description le=
ft
over from an earlier version of the patch?

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> new file mode 100644
> index 0000000000000..9b41dcde5308a
> --- /dev/null
> +++ b/sound/usb/babyfacepro/babyfacepro-ctl.c
[ ... ]
> +static int bf_master_put(struct snd_kcontrol *kctl,
> +			 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	int out =3D bf_master_out[kctl->private_value];
> +	long nl =3D ucontrol->value.integer.value[0];
> +	long nr =3D ucontrol->value.integer.value[1];
> +	u16 l, r, wire_l, wire_r, flag;
> +	int ret =3D 0;
> +
> +	/* Reject anything outside the declared range, so the registers and
> +	 * the cache stay in spec (the ALSA core only enforces this with
> +	 * CONFIG_SND_CTL_INPUT_VALIDATION).  Check before narrowing:
> +	 * .value.integer.value[] is a long.
> +	 */
> +	if (nl < 0 || nl > BF_MASTER_STEP_MAX ||
> +	    nr < 0 || nr > BF_MASTER_STEP_MAX)
> +		return -EINVAL;
> +	l =3D nl;
> +	r =3D nr;
> +
> +	mutex_lock(&chip->mutex);
> +	if (l =3D=3D chip->master[out][0] && r =3D=3D chip->master[out][1])
> +		goto out;
> +
> +	wire_l =3D chip->muted[out] ? 0 : l;
> +	wire_r =3D chip->muted[out] ? 0 : r;
> +	flag =3D bf_flag_cycle[chip->flag_cnt];
> +	chip->flag_cnt =3D (chip->flag_cnt + 1) & 3;
> +
> +	/* Both registers, as TotalMix writes them: the 8-bit is the analog
> +	 * level, the 16-bit the digital one.
> +	 */
> +	ret =3D bf_vendor_write(chip, BF_REQ_GAIN, bf_master_reg8(wire_l),
> +			      BF_REG_MASTER_8 + 2 * out);

[Severity: Medium]
Should bf_master_put(), bf_mute_put(), and bf_xpoint_put() check
chip->shutdown after acquiring chip->mutex and return -ENODEV if set?

In babyface_disconnect(), chip->shutdown is set and chip->mutex is acquired
and released before usb_enable_autosuspend(chip->dev) and
snd_card_disconnect(chip->card) are called:

sound/usb/babyfacepro/babyfacepro.c:babyface_disconnect() {
	...
	chip->shutdown =3D true;
	mutex_lock(&chip->mutex);
	if (chip->streaming)
		babyface_stream_kill(chip);
	mutex_unlock(&chip->mutex);
	cancel_work_sync(&chip->stream_work);
	usb_enable_autosuspend(chip->dev);
	...
	snd_card_disconnect(chip->card);
}

Unlike babyface_pcm_hw_params(), babyface_pcm_prepare(), and
babyface_stream_work(), which check chip->shutdown under chip->mutex, a
concurrent control write in bf_master_put(), bf_mute_put(), or bf_xpoint_pu=
t()
can acquire chip->mutex after babyface_disconnect() unlocks it and issue
synchronous bf_vendor_write() USB control transfers after autosuspend has b=
een
re-enabled (or after disconnect completes when CONFIG_PM is disabled).

[ ... ]
> +static int bf_mute_info(struct snd_kcontrol *kctl,
> +			struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN;
> +	uinfo->count =3D 2;
> +	uinfo->value.integer.min =3D 0;
> +	uinfo->value.integer.max =3D 1;
> +	return 0;
> +}
> +
> +static int bf_mute_get(struct snd_kcontrol *kctl,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	int out =3D bf_master_out[kctl->private_value];
> +
> +	/* ALSA convention: 1 =3D enabled (sound on) =3D not muted. */
> +	ucontrol->value.integer.value[0] =3D !chip->muted[out];
> +	ucontrol->value.integer.value[1] =3D !chip->muted[out];
> +	return 0;
> +}
> +
> +static int bf_mute_put(struct snd_kcontrol *kctl,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	int out =3D bf_master_out[kctl->private_value];
> +	bool muted =3D !ucontrol->value.integer.value[0];
> +	u16 flag;
> +	int ret =3D 0;
> +
> +	mutex_lock(&chip->mutex);
> +	if (muted =3D=3D chip->muted[out])
> +		goto out;

[Severity: High]
bf_mute_info() declares uinfo->count =3D 2 for the Playback Switch controls,
advertising two independent boolean channels. However, chip->muted[6] only
stores a single boolean per stereo pair, and bf_mute_put() only reads
ucontrol->value.integer.value[0] while ignoring
ucontrol->value.integer.value[1].

If userspace changes only the second channel (for example, writing [1, 0] w=
hen
the switch is [1, 1]), muted =3D=3D chip->muted[out] evaluates to true, so
bf_mute_put() returns 0 without updating the hardware or state, and subsequ=
ent
reads via bf_mute_get() still report [1, 1]. Conversely, writing [0, 1] mut=
es
both hardware channels and reads back as [0, 0].

Should uinfo->count in bf_mute_info() be 1 for a ganged stereo switch, or
should chip->muted track both channels independently?

[ ... ]
> +int babyface_create_xpoints(struct snd_usb_babyface *chip)
> +{
> +	struct snd_kcontrol *kctl;
> +	int out, src, err;
> +
> +	for (out =3D 0; out < 6; out++) {
> +		for (src =3D 0; src < 14; src++) {
> +			kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +				.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +				.name =3D "Playback Volume",
> +				.index =3D out * 14 + src,
> +				.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE |
> +					  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
> +				.info =3D bf_xpoint_info,
> +				.get =3D bf_xpoint_get,
> +				.put =3D bf_xpoint_put,
> +				.tlv.p =3D bf_xpoint_tlv,
> +				.private_value =3D (out << 8) | src,
> +			}, chip);
> +			/* Name the control by its source: "AN1 Playback Volume",
> +			 * "PB1 Playback Volume"... with a unique index.
> +			 */
> +			strscpy(kctl->id.name, bf_sources[src].name,
> +				sizeof(kctl->id.name));
> +			strlcat(kctl->id.name, " Playback Volume",
> +				sizeof(kctl->id.name));
> +			err =3D snd_ctl_add(chip->card, kctl);
> +			if (err < 0)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int babyface_create_masters(struct snd_usb_babyface *chip)
> +{
> +	static const char * const out_names[6] =3D {
> +		"AN1/2", "PH3/4", "AS1/2", "ADAT3/4", "ADAT5/6", "ADAT7/8"
> +	};
> +	struct snd_kcontrol *kctl;
> +	int i, err;
> +
> +	for (i =3D 0; i < 6; i++) {
> +		kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +			.name =3D out_names[i],
> +			.index =3D i,
> +			.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE |
> +				  SNDRV_CTL_ELEM_ACCESS_TLV_READ,
> +			.info =3D bf_master_info,
> +			.get =3D bf_master_get,
> +			.put =3D bf_master_put,
> +			.tlv.p =3D bf_master_tlv,
> +			.private_value =3D i,
> +		}, chip);
> +		strlcat(kctl->id.name, " Playback Volume", sizeof(kctl->id.name));
> +		err =3D snd_ctl_add(chip->card, kctl);
> +		if (err < 0)
> +			return err;
> +		chip->master_kctl[i] =3D kctl;
> +
> +		kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
> +			.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +			.name =3D out_names[i],
> +			.index =3D i,
> +			.info =3D bf_mute_info,
> +			.get =3D bf_mute_get,
> +			.put =3D bf_mute_put,
> +			.private_value =3D i,
> +		}, chip);
> +		strlcat(kctl->id.name, " Playback Switch", sizeof(kctl->id.name));
> +		err =3D snd_ctl_add(chip->card, kctl);

[Severity: High]
Can kctl be dereferenced when NULL here and in babyface_create_xpoints()?

When snd_ctl_new1() fails to allocate memory, it returns NULL. Normally
snd_ctl_add() handles a NULL kctl and returns -EINVAL, but both
babyface_create_xpoints() and the two control creation blocks in
babyface_create_masters() write to kctl->id.name via strscpy() or strlcat()
before passing kctl to snd_ctl_add().

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> index 81a3714623e5a..de1659307fbc0 100644
> --- a/sound/usb/babyfacepro/babyfacepro.c
> +++ b/sound/usb/babyfacepro/babyfacepro.c
[ ... ]
> @@ -249,6 +250,46 @@ int bf_cold_init(struct snd_usb_babyface *chip)
[ ... ]
> +	ret =3D bf_clock_write(chip);
> +	if (ret < 0)
> +		return ret;
> +	return bf_pitch_write(chip, chip->pitch);
> +}
> +
> +/* Copy a saved state (if any) into a freshly probed chip and push it
> + * to the device.  Returns 1 when restored, -ENOENT when there is none,
> + * or a negative error from the vendor writes.
> + */
>  static bool babyface_capture_copy(struct snd_usb_babyface *chip,
>  				  struct snd_pcm_substream *subs,
>  				  const u8 *data, unsigned int frames)

[Severity: Low]
This isn't a bug, but is this comment above babyface_capture_copy() an
orphaned comment from a removed state-restore helper?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113140.1342=
57-1-i.bahloul01@gmail.com?part=3D2
