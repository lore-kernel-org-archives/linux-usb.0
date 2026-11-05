Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898234;
	b=hsfJgLi7aR5bBaqnnM7ly4gPzz51to+37N7tFcwe1M8yQBIVI/A9PGuahDruEx44TrYb
	 2o3ZMuLu8hfefhlrZWrx3jxwekqW8b8wdYgkIu5Q10Wb4n/Nxw56jjFWJk+V7tjMgZHaQ
	 VZeZU8KyCs1LnLHtm1UDq8lMezPWG7sHgZLEaqXkeA8fvuYZzFW/MbGYkV88ZxTFUBhdb
	 KT4K6t20wiEEtF1MKh4ZajPA8qey2sBss44T532iYNXI5fbgTjCUwUBygZO4R7G1arm+9
	 fCVi2YX7w1ia/aLugGTyz+CMVUulDOoBHqho3698aP64WQW5TfPNaZOxZGtX7+NVL4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898234;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D/hGo8Q+f5lVFiwsVjliTKymC1TRvioQOj7mYiEoqNk=;
	b=RaFSRBByAl4uMI4KgBBwvczNNuEp7UtHwpofXVY1hx5SUkJ86nh7zU0XnnbYZy4wv+U8
	 yKdYx/RL3t79V+pQmeKkJq8cN6wZiC6N3IeEAH2AbtM3C82YT2fU3CDOmhIjB0CQtRp6Z
	 BAEkG11xk5IU7ZlEthM0w9Iv+TqSIrJumzABB4lBWiKlP1En5ENQozDASbvVTdMNTmpFB
	 OeavYJznyK0R+lgteJUugsz6x64rwT9S2F8CXvRLgxE/Scj5zWPShG5QvbJ+PbSoz8Khg
	 WHKN9i9NahFazoeNOcqRhkHIjWWQ3eJYSRtaZKtcImJDhRcf+Shx20v2dcRf2a1busA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U/m0Wlpg";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826CB606D81E;
	Thu,  5 Nov 2026 17:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/m0Wlpg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32281F00A17;
	Thu,  5 Nov 2026 17:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793898233;
	bh=D/hGo8Q+f5lVFiwsVjliTKymC1TRvioQOj7mYiEoqNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/m0Wlpg4wleO9EZVZF7kV8Jduu1Ti+VCdq4hRABt0HjrP4mUmRF4Ss/LboR2TEeZ
	 qFHisqYp0/vTolWswZ98uwNkscWotkm7wfweDzrGgoDoL/nNR2MYOq1B1+aIoubHii
	 yJ9BKqFsfybqgnyj2hiJlLEE5hdY/A4XkbBCwHYXHlj/CMpwWPHvPhNKT/knRsfax9
	 9kXHMqssKnAXSHTxtNNYiqp/80TbZOpm5UirjC57frtl4evjmTik4niUQnrSYZwGP1
	 jdAhCbaePmhoFLvlMCjVt9Qyc9YBOQ+dWVROhQW2VWW5MX+W9fvFEyETw4E+J8/tNe
	 v3GsHig8seE8A==
Message-ID: <sashiko-outbox-199570@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/8] ALSA: usb: babyfacepro: add the front-panel poll
 and controls
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105151553.223722-7-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
 <20261105151553.223722-7-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:03:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] ALSA: usb: babyfacepro: unlocked selection and MIX state in bf_pan=
el_tick()
- [Medium] ALSA: usb: babyfacepro: broken panel_start init in babyface_pane=
l_start()
- [Medium] ALSA: usb: babyfacepro: wrong AN1/2 flags in bf_panel_mix_wheel()
- [Medium] ALSA: usb: babyfacepro: broken MIX selection and VU seed in bf_p=
anel_tick()
- [Medium] ALSA: usb: babyfacepro: stale OUT wheel state in bf_out_wheel_le=
vel()
- [Medium] ALSA: usb: babyfacepro: unhandled unknown panel_in in bf_panel_s=
elect_put()
- [Medium] ALSA: usb: babyfacepro: unseeded panel_mix_db2 on first tick in =
bf_panel_tick()
- [Medium] ALSA: usb: babyfacepro: tick-based SELECT hold detection in bf_p=
anel_tick()
- [Low] ALSA: usb: babyfacepro: undocumented panel_poll_ms and urb_split pa=
rams
- [Low] ALSA: usb: babyfacepro: panel_wheel saturates at SHRT_MIN/MAX in bf=
_panel_tick()
--

commit 743b738314668be227407d88e571ec6f84054392
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add the front-panel poll and controls

This commit adds periodic polling of the Babyface Pro front-panel readback
register (request 0x17) and exposes the decoded button, wheel, IN/OUT/MIX/D=
IM,
and per-pair channel selection states as ALSA mixer controls. It also
implements host-driven handling for the front-panel rotary wheel and SET/MIX
buttons.

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> index 5482b6f09b73a..51cf8c7bd4357 100644
> --- a/sound/usb/babyfacepro/babyfacepro-ctl.c
> +++ b/sound/usb/babyfacepro/babyfacepro-ctl.c

[ ... ]

> +/* The selection of the IN pair now shown, from panel_sel[]. */
> +static void bf_panel_sel_load(struct snd_usb_babyface *chip)
> +{
> +	int pair =3D READ_ONCE(chip->panel_in) - 1;
> +	int sel =3D pair >=3D 0 && pair < 3 ? chip->panel_sel[pair] : -1;
> +
> +	chip->panel_select_known =3D sel >=3D 0;
> +	WRITE_ONCE(chip->panel_select, sel >=3D 0 ? sel : 3);
> +}

[ ... ]

> +static int bf_panel_mix_seed(struct snd_usb_babyface *chip)
> +{
> +	int out =3D bf_panel_out_pair(chip);
> +	int ref =3D READ_ONCE(chip->panel_in) =3D=3D 3 ? 4 :
> +		  (READ_ONCE(chip->panel_in) =3D=3D 2 ? 2 : 0) +
> +		  (READ_ONCE(chip->panel_select) =3D=3D 1 ? 1 : 0);
> +	int db2 =3D bf_fader_raw_to_db2(chip->xpoint[out][ref][0]);
> +
> +	/* A muted crosspoint reads as -inf, six steps below the curve's
> +	 * first point; seeding there would burn six clockwise clicks
> +	 * before anything is audible.  Start at the first point instead.
> +	 */
> +	if (db2 < bf_fader_curve[0].db2)
> +		db2 =3D bf_fader_curve[0].db2;
> +	chip->panel_mix_db2 =3D db2;
> +	return ref;
> +}
> +
> +/* The kernel driver plays the TotalMix role for the MIX button (the
> + * standalone emulator is hardware-validated in tuxmix-core/src/panel.rs
> + * + usb.rs): one wheel click in fader mode =3D +/-0.5 dB on the SELECT-
> + * chosen channel(s) of the IN-selected pair, into the OUT-selected
> + * output's crosspoint block - the STANDARD map only (cap_mix.pcap /
> + * cap_select2.pcap, no low-map mirror).  Mirrors the change into the
> + * xpoint cache so the ALSA controls follow the wheel.  Takes the mutex
> + * (the 0x12 writes cycle the transaction flag like the mixer puts).
> + */
> +static void bf_panel_mix_wheel(struct snd_usb_babyface *chip, int delta)
> +{
> +	int out =3D bf_panel_out_pair(chip);
> +	u8 targets[2];
> +	int n =3D 0;
> +	int db2;
> +	u16 raw, flag;
> +	int i;
> +
> +	/* SELECT-chosen channel(s) of the IN pair (manual sec. 5.1: SELECT
> +	 * steps left/right/both; none =3D nothing selected =3D no-op wheel).
> +	 * Source indices: AN1/AN2 =3D 0/1, AN3/AN4 =3D 2/3, AS1/2 =3D 4.
> +	 */
> +	if (READ_ONCE(chip->panel_in) =3D=3D 3) {
> +		targets[0] =3D 4;		/* Opt: the AS1/2 pair */
> +		n =3D 1;
> +	} else if (READ_ONCE(chip->panel_select) !=3D 3) {
> +		int base =3D READ_ONCE(chip->panel_in) =3D=3D 2 ? 2 : 0;
> +
> +		targets[0] =3D base + (READ_ONCE(chip->panel_select) =3D=3D 1 ? 1 : 0);
> +		n =3D 1;
> +		if (READ_ONCE(chip->panel_select) =3D=3D 2)
> +			targets[n++] =3D base + 1;
> +	} else {
> +		bf_panel_sel_hint(chip);
> +	}
> +
> +	guard(mutex)(&chip->mutex);
> +	db2 =3D clamp(chip->panel_mix_db2 + delta, BF_FADER_DB2_INF, 12);
> +	chip->panel_mix_db2 =3D db2;

[Severity: Medium]
As reported by Sashiko on v7 [1], in bf_panel_mix_wheel(), checking
READ_ONCE(chip->panel_in) =3D=3D 3 before READ_ONCE(chip->panel_select) !=
=3D 3
causes the wheel to modify AS1/2 (targets[0] =3D 4, n =3D 1) when Opt is se=
lected
even if panel_select is 3 (None or Unknown), bypassing panel_sel[2] ("Front
Panel Selection" index 2) and bf_panel_sel_hint().

Also, when panel_in !=3D 3 and panel_select =3D=3D 3, bf_panel_mix_wheel() =
calls
bf_panel_sel_hint(chip) with n =3D=3D 0, but falls through without returnin=
g and
still updates chip->panel_mix_db2 on every wheel click.

Should bf_panel_mix_wheel() check for panel_select =3D=3D 3 and return early
after bf_panel_sel_hint(chip) before handling panel_in =3D=3D 3 or updating
chip->panel_mix_db2?

> +	raw =3D bf_fader_db2_to_raw(db2);
> +	for (i =3D 0; i < n; i++) {
> +		const struct bf_source *s =3D &bf_sources[targets[i]];
> +
> +		flag =3D bf_flag_cycle[chip->flag_cnt];
> +		chip->flag_cnt =3D (chip->flag_cnt + 1) & 3;
> +		bf_vendor_write(chip, BF_REQ_CROSSPOINT, raw,
> +				(BF_REG_XPOINT_BASE_L + BF_REG_XPOINT_STRIDE * out +
> +				 s->idx_l) | flag);
> +		bf_vendor_write(chip, BF_REQ_CROSSPOINT, raw,
> +				(BF_REG_XPOINT_BASE_R + BF_REG_XPOINT_STRIDE * out +
> +				 s->idx_r) | flag);

[Severity: Medium]
In bf_xpoint_write() and bf_phase_apply(), the rotating transaction flag bi=
ts
in bf_flag_cycle[] are only ORed into wIndex when out !=3D 0, because the A=
N1/2
crosspoint block at 0x0000 is written with flag =3D=3D 0:

sound/usb/babyfacepro/babyfacepro-ctl.c:bf_xpoint_write() {
	const struct bf_source *s =3D &bf_sources[src];
	u16 flag =3D 0;
	int ret;

	if (out) {
		flag =3D bf_flag_cycle[chip->flag_cnt];
		chip->flag_cnt =3D (chip->flag_cnt + 1) & 3;
	}
	...
}

Here in bf_panel_mix_wheel(), flag is cycled and ORed into wIndex
unconditionally even when out =3D=3D 0 (Ch 1/2). Can this use bf_xpoint_wri=
te()
instead of open-coding the BF_REQ_CROSSPOINT writes?

[ ... ]

> +/* Write an output's L/R masters (8-bit companions + 16-bit with the
> + * transaction flag) and mirror into the cache - used by the balance
> + * wheel on an unmuted output.  Caller holds the mutex.
> + */
> +static void bf_panel_write_master(struct snd_usb_babyface *chip, int out,
> +				  u16 l, u16 r)
> +{
> +	bool muted =3D chip->muted[out];
> +	bool dim =3D out =3D=3D 1 && chip->dim;
> +	u16 flag;
> +
> +	flag =3D bf_flag_cycle[chip->flag_cnt];
> +	chip->flag_cnt =3D (chip->flag_cnt + 1) & 3;
> +	bf_vendor_write(chip, BF_REQ_GAIN, bf_out_reg8(muted, dim, l),
> +			BF_REG_MASTER_8 + 2 * out);
> +	bf_vendor_write(chip, BF_REQ_GAIN, bf_out_reg8(muted, dim, r),
> +			BF_REG_MASTER_8 + 2 * out + 1);
> +	bf_vendor_write(chip, BF_REQ_CROSSPOINT, bf_out_reg16(muted, dim, l),
> +			(BF_REG_MASTER_16 + 2 * out) | flag);
> +	bf_vendor_write(chip, BF_REQ_CROSSPOINT, bf_out_reg16(muted, dim, r),
> +			(BF_REG_MASTER_16 + 2 * out + 1) | flag);
> +	chip->master[out][0] =3D l;
> +	chip->master[out][1] =3D r;

[ ... ]

> +/* The wheel's view of one side: its own tracked level while the master
> + * is still what the wheel wrote, else the master's level.
> + */
> +static int bf_out_wheel_level(struct snd_usb_babyface *chip, int out, in=
t ch)
> +{
> +	u16 step =3D chip->master[out][ch];
> +
> +	if (step =3D=3D chip->panel_master_last[out][ch])
> +		return chip->panel_out_hdb[out][ch];
> +	if (!step)
> +		return BF_OUT_WHEEL_MUTED;
> +	return step - BF_MASTER_STEP_0DB;
> +}

[ ... ]

> +static void bf_panel_out_resync(struct snd_usb_babyface *chip)
> +{
> +	int out, ch;
> +	int db[2];
> +	u16 flag;
> +
> +	if (!chip->panel_out_resync ||
> +	    ktime_ms_delta(ktime_get(), chip->panel_out_wheel_t) <
> +	    BF_OUT_WHEEL_RESYNC_MS)
> +		return;
> +
> +	guard(mutex)(&chip->mutex);
> +	chip->panel_out_resync =3D false;
> +	out =3D chip->panel_out_wheel_out;
> +	for (ch =3D 0; ch < 2; ch++) {\n> +		if (chip->master[out][ch] !=3D chi=
p->panel_master_last[out][ch])
> +			return;
> +		db[ch] =3D chip->panel_out_hdb[out][ch];
> +		if (db[ch] < BF_OUT_WHEEL_8BIT_MIN)
> +			return;
> +	}

[ ... ]

> +static void bf_panel_balance_wheel(struct snd_usb_babyface *chip, int de=
lta)
> +{
> +	int out =3D bf_panel_out_pair(chip);
> +	int db[2], ch, i, louder, bal, lim;
> +
> +	guard(mutex)(&chip->mutex);
> +	if (chip->muted[out]) {
> +		bf_panel_remute(chip, out);
> +		return;
> +	}
> +	/* Read under the lock so the L/R pair is consistent with the
> +	 * master/mute/dim writers (they update chip->master[] under the
> +	 * same mutex).
> +	 */
> +	for (ch =3D 0; ch < 2; ch++)
> +		db[ch] =3D chip->master[out][ch] ?
> +			 chip->master[out][ch] - BF_MASTER_STEP_0DB :
> +			 BF_OUT_WHEEL_MUTED;

[Severity: Medium]
As reported by Sashiko on v7 [2], how is chip->panel_master_last[out] kept =
in
sync when chip->master[out] is modified outside bf_panel_out_wheel()?

1. Neither bf_master_put() nor bf_panel_write_master() (called from
bf_panel_balance_wheel()) invalidates chip->panel_master_last[out] to 0xfff=
f.
If the OUT wheel previously left a channel muted at step 0 with a sub-floor
balance offset in chip->panel_out_hdb[out][ch], and the user then centers or
sets the master to 0 via the ALSA control or balance wheel,
chip->master[out][ch] =3D=3D chip->panel_master_last[out][ch] (0 =3D=3D 0) =
remains
true and the next OUT wheel turn in bf_out_wheel_level() restores the stale
sub-floor offset.

2. In bf_panel_balance_wheel(), reading chip->master[out][ch] directly
instead of bf_out_wheel_level(chip, out, ch) discards any sub-floor offset
currently tracked in chip->panel_out_hdb[out][ch].

3. In bf_panel_out_resync(), tracking only a single scalar
chip->panel_out_wheel_out drops the pending 8-bit resync if the user switch=
es
outputs and turns the wheel within 150 ms, and returning early from the loop
whenever either channel has db[ch] < BF_OUT_WHEEL_8BIT_MIN skips the 8-bit
resync write for the louder channel of a panned output as well.

[ ... ]

> +/* IN-mode wheel: the gain of the SELECT-chosen channel(s) of the
> + * IN-selected pair, +/-1 dB per click (manual sec. 5.1: SELECT steps
> + * left/right/both, then the wheel changes the gain).  Writes the PANEL
> + * gain registers 0x1A 0x000A+mic (cap_select.pcap 2026-08-24 - the
> + * "ADC gain" family, which drives the same preamp as the GUI
> + * 0x0000+mic; the cache tracks the raw either way).  Opt has no
> + * preamp and SELECT None =3D no target.
> + */
> +static void bf_panel_gain_wheel(struct snd_usb_babyface *chip, int delta)
> +{
> +	u8 mics[2];
> +	int n =3D 0;
> +	int i;
> +
> +	if (READ_ONCE(chip->panel_in) =3D=3D 3)
> +		return;
> +	if (READ_ONCE(chip->panel_select) =3D=3D 3) {
> +		bf_panel_sel_hint(chip);
> +		return;
> +	}
> +	{
> +		int base =3D READ_ONCE(chip->panel_in) =3D=3D 2 ? 2 : 0;
> +
> +		mics[0] =3D base + (READ_ONCE(chip->panel_select) =3D=3D 1 ? 1 : 0);
> +		n =3D 1;
> +		if (READ_ONCE(chip->panel_select) =3D=3D 2)
> +			mics[n++] =3D base + 1;
> +	}

[ ... ]

> +static void bf_panel_set_phantom(struct snd_usb_babyface *chip)
> +{
> +	u16 bits =3D 0;
> +	u16 old;
> +	int m;
> +
> +	if (READ_ONCE(chip->panel_mix) || READ_ONCE(chip->panel_in) !=3D 1)
> +		return;
> +	if (READ_ONCE(chip->panel_select) =3D=3D 3) {
> +		bf_panel_sel_hint(chip);
> +		return;
> +	}
> +	if (READ_ONCE(chip->panel_select) !=3D 1)
> +		bits |=3D BF_PREAMP_48V_MIC1;
> +	if (READ_ONCE(chip->panel_select) !=3D 0)
> +		bits |=3D BF_PREAMP_48V_MIC2;
> +
> +	guard(mutex)(&chip->mutex);
> +	old =3D chip->preamp;
> +	/* One channel selected: toggle it.  Both selected: ALIGN both to
> +	 * the same state, so repeated SET presses cycle all-on <-> all-off
> +	 * (a mixed phantom state cannot persist with both selected).
> +	 */
> +	if (READ_ONCE(chip->panel_select) =3D=3D 2) {

[ ... ]

> +static void bf_panel_tick(struct snd_usb_babyface *chip)
> +{
> +	u8 st[4];
> +	int delta, in, out;
> +	bool dim;
> +	u8 cls, pcls;
> +	int btn;
> +	bool mix_flash, fader_now;
> +
> +	if (bf_vendor_read(chip, BF_REQ_PREAMP, BF_REG_PANEL_READ, st) < 0)
> +		return;	/* device gone / busy - retry next tick */
> +
> +	if (!chip->panel_seen) {
> +		chip->panel_seen =3D true;
> +		memcpy(chip->panel_prev, st, sizeof(st));
> +		/* Seed the state controls from the first snapshot. */
> +		in =3D bf_panel_in_decode((st[2] >> BF_PANEL_IN_SHIFT) & 0x7);\n> +		i=
f (in)
> +			WRITE_ONCE(chip->panel_in, in);
> +		/* The IN pair is only known from here on: pick up its
> +		 * selection (kept across a suspend, or set by alsactl).
> +		 */
> +		bf_panel_sel_load(chip);
> +		out =3D bf_panel_out_decode(st[1] & 0x07);
> +		if (out)
> +			WRITE_ONCE(chip->panel_out, out);
> +		WRITE_ONCE(chip->panel_mix, !!(st[0] & 0x80));
> +		WRITE_ONCE(chip->panel_saw_fader, (st[2] >> 4) =3D=3D 0x0);
> +		WRITE_ONCE(chip->panel_dim, !!(st[1] & 0x20));
> +		return;
> +	}

[Severity: Medium]
When the device is already in MIX mode on the first poll tick
(!chip->panel_seen with st[0] & 0x80 set), bf_panel_tick() sets
chip->panel_mix =3D true and returns without calling bf_panel_mix_seed(chip=
).
Because chip->panel_mix_db2 is zero-initialized at probe (0 dB unity gain on
bf_fader_curve[], whereas the default input crosspoints are muted at -inf /
-62 dB), won't the first MIX wheel click jump the monitoring crosspoint from
muted directly to ~0 dB?

Also, since the first tick runs asynchronously after snd_card_register() and
babyface_resume(), shouldn't changes to panel_in, panel_out, panel_mix, and
panel_dim here notify the corresponding ALSA controls?

[ ... ]

> +	if (delta && cls =3D=3D pcls) {
> +		WRITE_ONCE(chip->panel_wheel,
> +			   clamp(READ_ONCE(chip->panel_wheel) + delta,
> +				 SHRT_MIN, SHRT_MAX));
> +		bf_panel_notify(chip, BF_PANEL_KCTL_WHEEL);

[Severity: Low]
Unlike the comment in babyfacepro.h ("accumulated wheel delta (consumed on
get)"), bf_panel_wheel_get() never resets chip->panel_wheel on read. Because
chip->panel_wheel is clamped to SHRT_MIN..SHRT_MAX here in bf_panel_tick(),
won't the control permanently saturate once net rotation in one direction
reaches 32767 or -32768 clicks?

> +		/* Wheel by mode (LINUX-VALIDATION sec. 12, the TotalMix
> +		 * emulator): MIX -> monitoring level, OUT (0x8x/0x9x) -> the
> +		 * selected output master (or its balance while SELECT is
> +		 * held), IN (0x4x/0x5x/0x6x) -> the SELECT-chosen preamp
> +		 * gain.
> +		 */
> +		if (READ_ONCE(chip->panel_mix))
> +			bf_panel_mix_wheel(chip, delta);
> +		else if (chip->panel_sel_hold >=3D 10 && cls =3D=3D 1)
> +			bf_panel_balance_wheel(chip, delta);
> +		else if (cls =3D=3D 1)
> +			bf_panel_out_wheel(chip, delta);
> +		else if (cls =3D=3D 2)
> +			bf_panel_gain_wheel(chip, delta);
> +	}

[ ... ]

> +	/* SELECT press cycles the channel selection L -> R -> both -> none
> +	 * -> L (manual sec. 5.1).  The state is NOT in the readback
> +	 * (panelprobe 2026-08-24), so it is tracked host-side.
> +	 */
> +	if (st[3] =3D=3D BF_PANEL_FLASH_SELECT &&
> +	    chip->panel_prev[3] !=3D BF_PANEL_FLASH_SELECT &&
> +	    chip->panel_select_known) {
> +		if (!chip->panel_select_armed) {
> +			/* Disarmed (IN switch since the last step): the press
> +			 * only shows the selection - the device steps it on
> +			 * the NEXT press (user-verified 2026-08-28).
> +			 */
> +			chip->panel_select_armed =3D true;
> +		} else {
> +			int sel =3D (READ_ONCE(chip->panel_select) + 1) & 3;
> +			struct snd_kcontrol *kctl =3D
> +				chip->panel_select_kctl[READ_ONCE(chip->panel_in) - 1];
> +
> +			WRITE_ONCE(chip->panel_select, sel);
> +			chip->panel_sel[READ_ONCE(chip->panel_in) - 1] =3D sel;
> +			if (kctl)
> +				snd_ctl_notify(chip->card, SNDRV_CTL_EVENT_MASK_VALUE,
> +					       &kctl->id);
> +			if (READ_ONCE(chip->panel_mix)) {
> +				scoped_guard(mutex, &chip->mutex)
> +					bf_panel_mix_seed(chip);
> +			}
> +		}
> +	}
> +	/* SELECT hold (the OUT-balance gesture, manual sec. 5.1 "Output
> +	 * Balance"): a tap flashes byte3 0x50 for ~2-3 frames at 20 Hz
> +	 * (~100-150 ms - selhold_probe2), a hold keeps it sustained, and
> +	 * byte0 does NOT gain the 0x80 engaged bit - so the duration is
> +	 * the only discriminator: >=3D 10 ticks (200 ms at 50 Hz) =3D held.
> +	 */
> +	if (st[3] =3D=3D BF_PANEL_FLASH_SELECT)
> +		chip->panel_sel_hold++;
> +	else
> +		chip->panel_sel_hold =3D 0;

[Severity: Medium]
As reported by Sashiko on v7 [3], bf_panel_tick() detects a 200 ms SELECT h=
old
by counting 10 poll ticks (chip->panel_sel_hold >=3D 10) instead of measuri=
ng
elapsed time. During the 5 ms fast-poll window after an OUT wheel click
(chip->panel_fast_until), 10 ticks elapse in 50 ms (shorter than a normal
100-150 ms tap flash), whereas with a larger panel_poll_ms module parameter
(up to 1000 ms), 10 ticks require holding SELECT for up to 10 seconds. In
addition, on the initial rising edge of holding SELECT in OUT mode (cls =3D=
=3D 1),
the block above immediately steps chip->panel_select and chip->panel_sel[].
Should SELECT hold detection use elapsed time (ktime_t or jiffies) and avoid
stepping the IN channel selection when holding SELECT in OUT mode?

[ ... ]

> +	if (mix_flash) {
> +		if (READ_ONCE(chip->panel_mix)) {
> +			bf_vendor_write(chip, BF_REQ_PREAMP, 0x0400, 0x8000);
> +			bf_vendor_write(chip, BF_REQ_PREAMP, 0x0400, 0x8080);
> +			WRITE_ONCE(chip->panel_mix, false);
> +			WRITE_ONCE(chip->panel_saw_fader, false);
> +		} else {
> +			int ref;
> +			int m;
> +
> +			bf_vendor_write(chip, BF_REQ_PREAMP, 0x8480, 0x8c80);
> +			WRITE_ONCE(chip->panel_mix, true);
> +			/* Seed the monitoring level at the reference
> +			 * crosspoint's current value so the first wheel
> +			 * click doesn't jump from -inf (the reference =3D
> +			 * the first SELECT-chosen channel of the IN pair;
> +			 * Opt =3D the AS1/2 pair).
> +			 */
> +			ref =3D bf_panel_mix_seed(chip);
> +			/* Seed the VU display shadow at the CURRENT level
> +			 * (cap_panel.pcap: TotalMix writes the display value of
> +			 * the current fader on engage - 10 in that session -
> +			 * not a hard 0; cap_mix's 0 was because the fader sat
> +			 * at the bottom).  Only the channels the wheel can move.
> +			 */
> +			for (m =3D 0; m < 4; m++)
> +				chip->panel_mix_disp[m] =3D 0;
> +			if (ref < 4) {
> +				int disp =3D bf_mix_display(chip->panel_mix_db2);
> +
> +				bf_vendor_write(chip, BF_REQ_GAIN, (u16)disp,
> +						BF_REG_PANEL_GAIN + ref);
> +				chip->panel_mix_disp[ref] =3D disp;
> +			}
> +		}
> +		bf_panel_notify(chip, BF_PANEL_KCTL_MIX);
> +	}

[Severity: High]
As reported by Sashiko on v7 [4], can concurrent execution of bf_panel_tick=
()
and ALSA control writes in bf_panel_select_put() (or bf_xpoint_put()) race =
on
the selection and MIX state?

1. In bf_panel_select_put(), updates to chip->panel_sel[],
chip->panel_select_known, chip->panel_select, chip->panel_select_armed, and
bf_panel_mix_seed() are serialized under chip->mutex. However, bf_panel_tic=
k()
calls bf_panel_sel_load(), updates chip->panel_select_armed,
chip->panel_select, and chip->panel_sel[] on IN switches and SELECT presses,
and calls bf_panel_mix_seed() and mutates chip->panel_mix_disp[] when MIX is
engaged without holding chip->mutex.

2. In bf_panel_set_phantom(), READ_ONCE(chip->panel_select) is evaluated fo=
ur
separate times across the unlocked prefix and after acquiring chip->mutex. =
If
chip->panel_select is 0 or 1 at the initial check and bf_panel_select_put()
concurrently sets chip->panel_select to 3 (None/Unknown), both
READ_ONCE(chip->panel_select) !=3D 1 and READ_ONCE(chip->panel_select) !=3D=
 0
evaluate to true (setting bits =3D BF_PREAMP_48V_MIC1 | BF_PREAMP_48V_MIC2)=
 and
READ_ONCE(chip->panel_select) =3D=3D 2 evaluates to false, toggling +48V ph=
antom
power on both microphones when no channel is selected.

3. Similarly, bf_panel_gain_wheel() and bf_panel_mix_wheel() evaluate
READ_ONCE(chip->panel_select) multiple times outside chip->mutex; a concurr=
ent
change from 1 to 2 populates both targets[0]/mics[0] and targets[1]/mics[1]
with base + 1, stepping the right channel twice.

Also, when mix_flash engages MIX mode above, if panel_select =3D=3D 3
(None/Unknown), bf_panel_mix_seed() still returns ref =3D 0 or 2 and writes
BF_REG_PANEL_GAIN + ref, whereas if panel_select =3D=3D 2 (Both), it only s=
eeds
BF_REG_PANEL_GAIN + ref and leaves ref + 1 unseeded.

[ ... ]

> +void babyface_panel_start(struct snd_usb_babyface *chip)
> +{
> +	chip->panel_seen =3D false;
> +	/* The SELECT channel selection is not in the readback, so the
> +	 * driver follows it from the presses.  The unit keeps one per IN
> +	 * pair across a driver reload and even a power cycle, with the LEDs
> +	 * dark until the next SELECT press, which shows it again instead of
> +	 * stepping (hardware-verified 2026-09-29: after an unplug, the
> +	 * first press lit both channels).  What panel_sel[] holds comes
> +	 * from before a suspend, from alsactl after a boot, or is not
> +	 * known, and an unknown selection targets nothing: SET, the IN
> +	 * wheel and the MIX wheel then do nothing rather than act on the
> +	 * wrong channel, until "Front Panel Select" is set to what the LEDs
> +	 * show.
> +	 */
> +	bf_panel_sel_load(chip);
> +	chip->panel_select_armed =3D false;
> +	chip->panel_start =3D jiffies;
> +	chip->panel_fast_until =3D jiffies;
> +	chip->panel_poll_t =3D 0;
> +	/* No master holds 0xffff: the wheel starts from the masters. */
> +	memset(chip->panel_master_last, 0xff, sizeof(chip->panel_master_last));
> +	schedule_delayed_work(&chip->panel_work, 0);
> +}

[ ... ]

> +static int bf_panel_select_put(struct snd_kcontrol *kctl,
> +			       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_usb_babyface *chip =3D snd_kcontrol_chip(kctl);
> +	unsigned int v =3D ucontrol->value.enumerated.item[0];
> +	int pair =3D kctl->private_value;
> +	/* alsactl restores the values of its last store shortly after
> +	 * every probe.
> +	 */
> +	bool restore =3D time_is_after_jiffies(chip->panel_start + 3 * HZ);
> +	s8 sel =3D v < 4 ? v : -1;
> +
> +	if (v > 4)
> +		return -EINVAL;
> +	/* After a boot they are what there is.  After a re-probe the unit
> +	 * may have taken SELECT presses since that store, and a wrong
> +	 * selection makes SET and the wheels act on a channel that is not
> +	 * the lit one: leave the pair unknown, as for a never-seen pair.
> +	 */
> +	if (restore && chip->reprobe)
> +		return 0;
> +
> +	guard(mutex)(&chip->mutex);
> +	if (pair =3D=3D READ_ONCE(chip->panel_in) - 1 && !restore && sel >=3D 0)
> +		/* Set while the LEDs show the selection: the next press steps
> +		 * it.
> +		 */
> +		chip->panel_select_armed =3D true;
> +	if (sel =3D=3D chip->panel_sel[pair])
> +		return 0;
> +	chip->panel_sel[pair] =3D sel;
> +	if (pair =3D=3D READ_ONCE(chip->panel_in) - 1) {
> +		bf_panel_sel_load(chip);
> +		if (READ_ONCE(chip->panel_mix))\n> +			bf_panel_mix_seed(chip);
> +	}
> +	return 1;
> +}

[Severity: Medium]
As reported by Sashiko on v7 [5], setting chip->panel_start =3D jiffies ins=
ide
babyface_panel_start() causes two issues for the restore check in
bf_panel_select_put():

1. In babyface_probe(), snd_card_register(chip->card) is called before
babyface_panel_start(chip). If udev's alsactl restore runs immediately upon
card registration before babyface_panel_start() sets chip->panel_start =3D
jiffies, chip->panel_start is still 0 (so restore evaluates to false once
uptime exceeds ~303 seconds), bypassing if (restore && chip->reprobe) and
allowing babyface_panel_start() to race unlocked with bf_panel_select_put().

2. In babyface_resume(), calling babyface_panel_start(chip) on every system
resume resets chip->panel_start =3D jiffies, re-opening a 3-second restore
window after every resume during which bf_panel_select_put() drops writes if
chip->reprobe is true or skips setting chip->panel_select_armed =3D true if
chip->reprobe is false.

[Severity: Medium]
What happens in bf_panel_select_put() and bf_panel_sel_load() when the unit=
 is
in OUT mode (st[2] =3D 0x8x/0x9x) or fader/MIX mode (st[2] =3D 0x0x) at pro=
be or
resume time?

In those modes, bf_panel_in_decode() returns 0, leaving chip->panel_in at 0
(Unknown). While chip->panel_in is 0, READ_ONCE(chip->panel_in) - 1 is -1, =
so
bf_panel_sel_load() forces panel_select_known =3D false and panel_select =
=3D 3,
and writing to any of the "Front Panel Selection" controls in
bf_panel_select_put() never loads the selection or arms panel_select_armed.=
 If
the user enters MIX mode while panel_in is 0, turning the wheel prints the
bf_panel_sel_hint() message instructing them to set "Front Panel Selection",
but setting the control has no effect while panel_in remains 0.

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> index 06ef1a97d27a4..ece2bd0c4e63a 100644
> --- a/sound/usb/babyfacepro/babyfacepro.c
> +++ b/sound/usb/babyfacepro/babyfacepro.c

[ ... ]

> @@ -1432,8 +1459,12 @@ MODULE_PARM_DESC(id, "ID string for the Babyface P=
ro sound card.");
>  module_param(frames_per_urb, int, 0444);
>  MODULE_PARM_DESC(frames_per_urb, "Largest URB in audio frames, 8..1024 (=
256 =3D default); the period chooses the size below it.");
>  module_param(urb_frames_min, int, 0444);
>  MODULE_PARM_DESC(urb_frames_min, "Smallest URB in audio frames, 8..1024 =
(32 =3D default, 16 =3D low-latency floor).");
> +module_param(urb_split, int, 0444);
> +MODULE_PARM_DESC(urb_split, "Split the period into two URBs, queueing 1.=
5 periods instead of 2: 0 =3D auto (default), 1 =3D never, 2 =3D always.");
>  module_param(nurbs, int, 0444);
>  MODULE_PARM_DESC(nurbs, "Most URBs in flight per direction, 2..16 (8 =3D=
 default).");
> +module_param(panel_poll_ms, int, 0444);
> +MODULE_PARM_DESC(panel_poll_ms, "Front-panel poll interval in ms, 10..10=
00 (20 =3D default, matches Windows' ~50 Hz).");

[Severity: Low]
As reported by Sashiko on v7 [6], should the new panel_poll_ms and urb_split
module parameters be documented in
Documentation/admin-guide/kernel-parameters.txt, and should the PCM urb_spl=
it
module parameter be moved to the PCM streaming patch where urb_split is
introduced?

[1] https://lore.kernel.org/r/20261027113140.134257-7-i.bahloul01@gmail.com
[2] https://lore.kernel.org/r/20261027113140.134257-7-i.bahloul01@gmail.com
[3] https://lore.kernel.org/r/20261027113140.134257-7-i.bahloul01@gmail.com
[4] https://lore.kernel.org/r/20261027113140.134257-7-i.bahloul01@gmail.com
[5] https://lore.kernel.org/r/20261027113140.134257-7-i.bahloul01@gmail.com
[6] https://lore.kernel.org/r/20261027113140.134257-7-i.bahloul01@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105151553.2237=
22-1-i.bahloul01@gmail.com?part=3D6
