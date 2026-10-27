Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102004;
	b=sYN8L+izPVC+LowqM19hpUxE5SMCr+W4t87x2SIcfJlqsZTn2dVPnmCA3ZXvqFYRHX8F
	 NXshssWhHqrHSy0Rb4KxzdLzmD+gNUIOiVHcwGcMuR0onwz44dL9RXaKQcCkeQhB2W9MU
	 1RsmxK9MGipnughYsqg0WwnIoCojJC+njDW7bMDqgrhCbWj4+zFhPtjTB5o/wSbT7J1t5
	 E9xROX9/ke9Cb/qQm16QQY7ECW93qOOPQYrHjoyrSVG+zxyZgVzSoFS8Bj5PHl5ZiteZN
	 allyWnaQIHTOs+ODDCYD6EYjXCWnOQGYrIZMm3346ogGhllMF6pQxLrxWkITw3BCSLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102004;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sWN1PpSYOz5KEHq+XMlHpxa9XGMfitXYGS0npUSymIw=;
	b=iHhshS3weuU91zlp6PQ0pdwzkYZ+1QN05MIBCu5ErobEV1K9Bbq5VqXfpYjC6RGNlr33
	 YbFiIM9ZCr/MA1VN2va6eejAIVDXskCHqQsSeWpwI7rG5kueUPMUq/qx8Tt5VnnZOqSmv
	 rFUyG7uJqabcG4ZckY75JY2L2pqKpy9mEMY+aaDbptjXVvYh0WxmOP6rrzk1rhun9iiCc
	 JXw+LW0sI2QJYVsnrZQ1JN3cVtSufZAnvsYWexrjTaHaYDC1o18rNPYsiIrVPKsAt3Mn8
	 auKbQli/utRW3+H0oa6JuvCnQ5BrqpJjtut0nG9w/o81+sirfMdqDNDPiPx5Ybbw9kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LCLTQqKh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07388606A31B;
	Tue, 27 Oct 2026 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LCLTQqKh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAAA1F01828;
	Tue, 27 Oct 2026 11:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102003;
	bh=sWN1PpSYOz5KEHq+XMlHpxa9XGMfitXYGS0npUSymIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LCLTQqKhaRbOV6iITpgxtMkAc7q3cxd7S9GsIK4mEFU9EAk0NSiKlI3ebcxdKh1L4
	 5gryC3tQ33bV+ZPZFBAZ25cnqJggh+KXc2TDcOeSylFQZLivjKnKJZUnrZh96MKQ7A
	 m1UA/bycwSbMjvTU+scRDGsGM2SD9QP09gdL7jD+k9NVouZWBHFLkIORobSRI8v84F
	 YBw0LwCj0FvDIosre/bu92nYK5D9bgyaJxD11QaxxH3UCWCvMnh4Z5pH4vQVD+699q
	 FbNhp+5zPKGcflFuofmftzXUKK4g9IPqqlmL2EY7H8Mhai7gbXyOtgn788l9fV5EoJ
	 p7dxmM65pU2ow==
Message-ID: <sashiko-outbox-186482@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/8] ALSA: usb: babyfacepro: add S3 suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027113140.134257-6-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
 <20261027113140.134257-6-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:53:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ALSA: usb: babyfacepro: bf_state_apply_flags() clobbers AN1/2 cros=
spoints on resume
- [Medium] ALSA: usb: babyfacepro: bf_state_apply_flags() unmutes Phones on=
 resume
- [Medium] ALSA: usb: babyfacepro: bf_state_apply_flags() resets Boost ref =
level on resume
--

commit 310405e76a62da749e95a774e21001c8c29e80f6
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add S3 suspend/resume

This commit adds S3 suspend, resume, and reset_resume callbacks for the RME
Babyface Pro USB audio driver. On suspend, it suspends active PCM substream=
s,
kills running URBs, and cancels pending stream work; on resume, it re-runs
cold initialization and replays the cached mixer state and hardware flags.

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> index ed4555c711064..e0eb0ce9b92f3 100644
> --- a/sound/usb/babyfacepro/babyfacepro.c
> +++ b/sound/usb/babyfacepro/babyfacepro.c

[ ... ]

> @@ -390,10 +400,8 @@ int bf_state_apply_flags(struct snd_usb_babyface *ch=
ip)
>  	}
> =20
>  	/* Re-apply an engaged DIM (the fixed -20 dB Phones pair + flag).  The
> -	 * level DIM releases back to is not persisted: it always tracks the
> -	 * Phones master while DIM is engaged, so rebuild it here - otherwise a
> -	 * DIM released after a re-probe would drive Phones to
> -	 * silence (dim_saved still zero on the fresh chip).
> +	 * level DIM releases back to tracks the Phones master while DIM is
> +	 * engaged.
>  	 */
>  	if (chip->dim) {
>  		chip->dim_saved[0] =3D chip->master[1][0];

[Severity: Medium]
What happens on resume when both chip->dim and chip->muted[1] are active?

In babyface_resume(), babyface_restore_state() calls bf_apply_masters(),
which checks chip->muted[out] and writes the muted level (BF_MASTER_MUTE /
0x0000) to the hardware master registers:

sound/usb/babyfacepro/babyfacepro-ctl.c:bf_apply_masters() {
	for (out =3D 0; out < 6; out++) {
		u16 l =3D chip->muted[out] ? 0 : chip->master[out][0];
		u16 r =3D chip->muted[out] ? 0 : chip->master[out][1];
		...
}

Immediately afterwards, babyface_resume() calls bf_state_apply_flags(), whe=
re
the chip->dim block unconditionally writes 0xcb (-20 dB) to
BF_REG_MASTER_8 + 2 * 1 (and + 1) and 0x0333 to BF_REG_MASTER_16 + 2 * 1
(and + 1) without checking chip->muted[1]:

sound/usb/babyfacepro/babyfacepro.c:bf_state_apply_flags() {
	if (chip->dim) {
		chip->dim_saved[0] =3D chip->master[1][0];
		chip->dim_saved[1] =3D chip->master[1][1];
		ret =3D bf_vendor_write(chip, BF_REQ_GAIN, 0xcb,
				      BF_REG_MASTER_8 + 2 * 1);
		...
		ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, 0x0333,
				      (BF_REG_MASTER_16 + 2 * 1) |
				      bf_flag_cycle[chip->flag_cnt]);
		...
}

Won't this overwrite the muted state on the hardware headphone output (PH3/=
4)
with -20 dB across a suspend/resume cycle while chip->muted[1] remains true?

[ ... ]

> @@ -1788,6 +1798,63 @@ static void babyface_disconnect(struct usb_interfa=
ce *intf)
>  	snd_card_free_when_closed(chip->card);
>  }
> =20
> +static int babyface_suspend(struct usb_interface *intf, pm_message_t mes=
sage)
> +{

[ ... ]

> +static int babyface_resume(struct usb_interface *intf)
> +{
> +	struct snd_usb_babyface *chip =3D usb_get_intfdata(intf);
> +	int err;
> +
> +	if (!chip)
> +		return 0;
> +
> +	/* The device lost its state across the suspend; re-run the cold
> +	 * init and re-apply the cached mixer state.  Suspended PCM
> +	 * substreams are woken by the core - apps get -ESTRPIPE and
> +	 * restart (prepare starts a new session).
> +	 *
> +	 * This is also the reset_resume handler.  Some hosts reset the
> +	 * device on resume; that needs nothing more than the cold init
> +	 * already does here, and without the handler the USB core unbinds
> +	 * and re-probes the driver instead: the card goes away, open PCMs
> +	 * fail, and udev's alsactl restore then loads the mixer state
> +	 * stored at the last shutdown over the current one.
> +	 */
> +	mutex_lock(&chip->mutex);
> +	err =3D usb_set_interface(chip->dev, BF_IFACE, chip->alt);
> +	if (err < 0)
> +		goto out;
> +	err =3D bf_cold_init(chip);
> +	if (err < 0)
> +		goto out;
> +	err =3D babyface_restore_state(chip);
> +	if (err < 0)
> +		goto out;
> +	err =3D bf_state_apply_flags(chip);

[Severity: High]
Does calling bf_state_apply_flags() right after babyface_restore_state() in
babyface_resume() clobber the restored AN1 -> AN1/2 and AN2 -> AN1/2
crosspoint faders?

During babyface_restore_state(), the crosspoint loop writes all cached
chip->xpoint[out][src] values to the hardware, including out =3D 0 (AN1/2) =
and
src =3D 0..1 (AN1 and AN2 at registers 0x0000, 0x001a, 0x0001, and 0x001b):

sound/usb/babyfacepro/babyfacepro.c:babyface_restore_state() {
	for (out =3D 0; out < 6; out++) {
		for (src =3D 0; src < 14; src++) {
			ret =3D bf_xpoint_write(chip, out, src,
					      chip->xpoint[out][src][0],
					      chip->xpoint[out][src][1]);
			...
}

Then bf_state_apply_flags() runs. Unlike ms_proc, phase, split, and trim
(which only touch the shared crosspoint registers when their respective sta=
te
is non-zero), the chip->width calculation in bf_state_apply_flags() executes
unconditionally:

sound/usb/babyfacepro/babyfacepro.c:bf_state_apply_flags() {
	l =3D (u16)(((0x2000 * (100 + chip->width) / 2) + 50) / 100);
	r =3D 0x2000 - l;
	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x0000);
	if (ret < 0)
		return ret;
	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x001a);
	if (ret < 0)
		return ret;
	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, r, 0x0001);
	if (ret < 0)
		return ret;
	ret =3D bf_vendor_write(chip, BF_REQ_CROSSPOINT, l, 0x001b);
	if (ret < 0)
		return ret;
}

When chip->width is 0 (the default), this writes 0x1000 to registers 0x0000,
0x001a, 0x0001, and 0x001b, overwriting whatever chip->xpoint[0][0] and
chip->xpoint[0][1] values babyface_restore_state() just restored and routing
live microphone inputs AN1 and AN2 into the main AN1/2 output even when they
were muted in chip->xpoint[0][0..1]. Because chip->xpoint[0][0..1] in the
host cache still holds the old values (such as 0), subsequent bf_xpoint_put=
()
calls with the same value will also see no change against the cache and ret=
urn
early without updating the hardware. (Also, when chip->width is non-zero,
bf_width_put() writes both 0x0000/0x001a/0x0001/0x001b and
0x0034/0x004e/0x0035/0x004f, whereas bf_state_apply_flags() only writes the
first four.)

[Severity: Medium]
Could bf_state_apply_flags() also reset the Instrument Ref Level from Boost
back to -10dBV during babyface_resume()?

In babyface_restore_state(), bf_preamp_state_write() restores the preamp
state and commits BF_REQ_PREAMP_COMMIT with 0x0003 when chip->ref_level is
BF_REF_LEVEL_BOOST:

sound/usb/babyfacepro/babyfacepro-ctl.c:bf_preamp_state_write() {
	ret =3D bf_vendor_write(chip, BF_REQ_PREAMP, chip->preamp, BF_REG_PREAMP);
	if (ret < 0)
		return ret;
	return bf_vendor_write(chip, BF_REQ_PREAMP_COMMIT,
			       chip->ref_level =3D=3D BF_REF_LEVEL_BOOST ?
			       0x0003 : 0x0000, 0x0000);
}

However, bf_state_apply_flags() then writes the linked/an12 flags and follo=
ws
up with a hardcoded 0x0000 commit to BF_REQ_PREAMP_COMMIT:

sound/usb/babyfacepro/babyfacepro.c:bf_state_apply_flags() {
	ret =3D bf_vendor_write(chip, BF_REQ_PREAMP,
			      (chip->linked ? 0x0400 : 0x0000) |
			      (chip->an12 ? 0x1000 : 0x0000), 0x1000);
	if (ret < 0)
		return ret;
	ret =3D bf_vendor_write(chip, BF_REQ_PREAMP_COMMIT, 0x0000, 0x0000);
	if (ret < 0)
		return ret;
}

As noted in bf_preamp_state_write(), sending 0x0000 in BF_REQ_PREAMP_COMMIT
causes Boost to degrade to -10dBV while chip->ref_level still reports
BF_REF_LEVEL_BOOST. Should bf_state_apply_flags() pass
chip->ref_level =3D=3D BF_REF_LEVEL_BOOST ? 0x0003 : 0x0000 in that commit =
write
as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113140.1342=
57-1-i.bahloul01@gmail.com?part=3D5
