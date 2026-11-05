Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892720;
	b=GUYICi0wq8YW7O5UyJH7OMc1CL9DkJdaJ2/dgn1IkMS6uctu8fvGx6QDGRktF14bm1UL
	 aQuIiBJFlyhQZLDPFfkLRMFH+nli93kPMZrG+fGYsIgEqSQDEU0Vk7d/IJt46I0ii11mQ
	 QmhUtoUY5+V0NbT/DNcGAoZI+PNPKqaR2ghz+X+zESNMp9ojHKmuKm9ozZU3gg5nTAAp2
	 fXYdsjSR792iwLWi0fJ1u3wO1LI3tzjP5T4npikxPI5qz73LWSoDXMlDOkZl0pivC/FLc
	 VmRnUCiUdArTQ5j2yocAMFvhIAlNLQD1rIejKb9ymH8jnLQoeQy+k6eL6dh//laiLAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892720;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kdr5CytSp+QzI8htSD6yTJaK//bvnNSu46epScRZxNo=;
	b=BCir9QboIeCjgFUspYgXSqvna5/ER9wMBvbnWhL7334in2UqovE2D6M9YxzI0x4MFHoW
	 7hdZUdvuuQndHgODRREc2KcVjIyxkJTQnt6qD2M2KymWIL6Vhg/3liatBhYVkRRVVwm4h
	 HVqstLXKnYZQxI3b+qQyZ2Ddfaay/LzMk3N7MJce+YwqN3jEEzOBW0WvCz8In5X5n6oam
	 M1l+bBMSc3GqqyoLqJC2OH1+Ok9spaR1hb+YDDw8v9I2hUI6+hP2qlRymhuLZ3s0smERg
	 GTwyZm9SvsUgMm+C3NKcNBpkim2nbGOqmyLRPse22EJeN+AKLVQm62Jwbbfr6v512vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9KF9U4W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F84606D81C;
	Thu,  5 Nov 2026 15:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C9KF9U4W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA7F1F00919;
	Thu,  5 Nov 2026 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892720;
	bh=kdr5CytSp+QzI8htSD6yTJaK//bvnNSu46epScRZxNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C9KF9U4Wy9MHg2DiZN3xt0tjLQfpvPUWM1pq/WDHmcc0fqjMUFGXs+F4+UOQ8lr3F
	 wL9LOO3/4f/THG3rqhODeVMbyONknBQHfYkLbysNKOuIDqNJomVPe38shF9TahJB7c
	 BuFAA+nXygBMTZ82GSdSij7lSoVuq5epHrUNfiHGslQJmycDH/kOfoH7fc+/j06iQg
	 RsL1UEZrBONnz5r8qzbWotG7ti2drA2cNu7UvOdvfLspHMa4lzEqbRmXjtreYpjjSm
	 IfgsPh/dDEo4yNqAOhGlOj3U5R000Zu9rpOApYAtaLtAusVH/Im+aHd6yld8/CYaq4
	 MtPsBVHV6FojA==
Message-ID: <sashiko-outbox-199311@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/8] ALSA: usb: babyfacepro: add output masters and
 crosspoint routing
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105151553.223722-3-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
 <20261105151553.223722-3-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:31:59 +0000
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
- [High] ALSA: usb: babyfacepro: out-of-bounds value[1] write in bf_mute_ge=
t()
- [Medium] ALSA: usb: babyfacepro: missing shutdown check in mixer put call=
backs
--

commit a0ae4df204731e5d864689d9a4a9ee415579f1a2
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add output masters and crosspoint routing

This commit adds ALSA mixer controls for the six output masters (volume and
mute) and the 6x14 crosspoint routing matrix, caching their state on the
host and initializing safe power-on defaults during probe.

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> new file mode 100644
> index 0000000000000..942d4732cbe07
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
> +	guard(mutex)(&chip->mutex);
> +	if (l =3D=3D chip->master[out][0] && r =3D=3D chip->master[out][1])
> +		return 0;

[Severity: Medium]
As reported by Sashiko on v7 [1], should bf_master_put() (along with
bf_mute_put() and bf_xpoint_put() below) check chip->shutdown and return
-ENODEV after acquiring chip->mutex, matching babyface_pcm_hw_params(),
babyface_pcm_prepare(), and babyface_stream_work()?

In babyface_disconnect(), chip->shutdown is set to true and chip->mutex is
acquired and released to fence in-flight operations before calling
usb_enable_autosuspend(chip->dev) and snd_card_disconnect(chip->card):

sound/usb/babyfacepro/babyfacepro.c:babyface_disconnect() {
    ...
	chip->shutdown =3D true;
	scoped_guard(mutex, &chip->mutex) {
		if (chip->streaming)
			babyface_stream_kill(chip);
	}
	cancel_work_sync(&chip->stream_work);
	usb_enable_autosuspend(chip->dev);
    ...
	snd_card_disconnect(chip->card);
}

Without checking chip->shutdown under chip->mutex, a concurrent
SNDRV_CTL_IOCTL_ELEM_WRITE ioctl in bf_master_put(), bf_mute_put(), or
bf_xpoint_put() can proceed to issue synchronous USB control transfers via
bf_vendor_write() or bf_xpoint_write() after the disconnect fence has passed
and USB autosuspend has been re-enabled (and on !CONFIG_PM builds, where
snd_power_sync_ref() in snd_card_disconnect() is a no-op, while
babyface_disconnect() is completing).

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
> +	if (ret < 0)
> +		return ret;
> +	ret =3D bf_vendor_write(chip, BF_REQ_GAIN, bf_master_reg8(wire_r),
> +			      BF_REG_MASTER_8 + 2 * out + 1);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, bf_master_reg16(wire_l=
),
> +			      (BF_REG_MASTER_16 + 2 * out) | flag);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, bf_master_reg16(wire_r=
),
> +			      (BF_REG_MASTER_16 + 2 * out + 1) | flag);
> +	if (ret < 0)
> +		return ret;
> +
> +	chip->master[out][0] =3D l;
> +	chip->master[out][1] =3D r;
> +	return 1;
> +}
> +
> +static int bf_mute_info(struct snd_kcontrol *kctl,
> +			struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN;
> +	/* One switch for the pair: bf_mute_put() writes both channels
> +	 * together, so a count of 2 would silently ignore value[1].
> +	 */
> +	uinfo->count =3D 1;
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

[Severity: High]
Since bf_mute_info() declares uinfo->count =3D 1, doesn't writing to
ucontrol->value.integer.value[1] in bf_mute_get() write past the declared
element count?

When CONFIG_SND_CTL_DEBUG is enabled, snd_ctl_elem_read() poisons bytes in
ucontrol->value past info.count and checks them in sanity_check_elem_value()
after kctl->get(), so overwriting ucontrol->value.integer.value[1] causes
every read of the Playback Switch controls to log an error and fail with
-EINVAL, and causes snd_ctl_put_verify() to report a false mismatch whenever
the output is unmuted. Even without CONFIG_SND_CTL_DEBUG, setting value[1]
breaks userspace comparisons via snd_ctl_elem_value_compare() (such as the
ALSA mixer-test kselftest).

[1] https://lore.kernel.org/r/20261027113140.134257-3-i.bahloul01@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105151553.2237=
22-1-i.bahloul01@gmail.com?part=3D2
