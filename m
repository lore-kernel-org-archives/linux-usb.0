Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102300;
	b=le2dAr++oUJ9XN3UnT7edjtg3OJF92FZ9Fi7ZPkY3QnHMkeveD+tfZWRpwt+itkEXPY2
	 6StWU/vFUPsa+EU65F6Q/ORJKNknme/wImTWsWLm27LvwuDfFmB8tC1dbrlK00rSR3pCL
	 kZNH47aWxm4niADQR2r1sHqrEMPXsun+vOBLErrZxVshqVGxse04vIEUSyMaxJVtkglWr
	 RjcUqlEzTS1ti/OoeUcjJzzl5BY1hahcsLSerL8zLdu2230U2D2WCQZ8dDmN59F+YxkNs
	 B/AMuBxEANT21im9iT9ocObJybEl360yuuzdeNuek2hqlzCbpOsYwjXFOBj+kPCs2pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102300;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qcz949BQDxHmhw4kW/j4/5MmneszusHYwagS3hjJcew=;
	b=soiRQrKOvCUgknLpRWTuGVooyZoint6ZraKL4k04LFkXGabZSO0i0ZAgRihmHApfS2Xr
	 MtSYLSGKlTnfqYPR17ZO1MlG2ns6pwrtlG/AcMRV0YNhXoSCPGZ6tfStG2I0QIz4Ndgxh
	 3aryDn1g4iJ83wfOAhNW14rkiPuCMJ/wctEfBvSviJUkacyg+HX7Dou4lRBJGisNxjGbN
	 2MXy9mDg4e8txK+oOV+rsa6XtDMuUvPrQMriixe3cMmrANUegDq6SdK58DrkSio3pqYjW
	 PLiaVwZPjIypRwBzHXUK80Hvei8++Ly1KR8ZXfw1WY2aHSwY4h8Aj0u7vWFd99DQjNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iyzxii7F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C31E606A32A;
	Tue, 27 Oct 2026 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iyzxii7F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB8E1F031E3;
	Tue, 27 Oct 2026 11:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102299;
	bh=qcz949BQDxHmhw4kW/j4/5MmneszusHYwagS3hjJcew=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iyzxii7FUOj5tqlGokOldY8H55mzOUFK7ZQeTX0+5PdB1/FgLH2p9ngtqh8ZzPlAL
	 6iX9hPvcnho3u8k/xiOJlbOOyLWTrImhf4zEUf/TaAyNJfA7BJ2zYeEZfFza0Ba7LV
	 tpE3P5qzEQ0tfh7QGItDk3UFzgudbY5ARAttGnZj3CWdtRsMgLwJh9c89c8sk18oK3
	 F0X129LGMFMwLVl84Ejoc75cbNvnP73RUFlhCdqqsmd10MRQJDFTtTm9Q0yplBGHFM
	 bsqZ6IVbeebS7g/Wzd8QFS3XTxr1FfDPKEC6nzAJ1Nl7vGufNPFvp3X2ihX/yjFK6g
	 s8xjRyKlKjKzg==
Message-ID: <sashiko-outbox-186491@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/8] ALSA: usb: babyfacepro: add the front-panel poll
 and controls
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027113140.134257-7-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
 <20261027113140.134257-7-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:58:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] ALSA: usb: babyfacepro: MIX wheel stuck due to raw fader quantizat=
ion
- [High] ALSA: usb: babyfacepro: unlocked panel_select races in bf_panel_ti=
ck()
- [High] ALSA: usb: babyfacepro: unchecked snd_ctl_new1() NULL dereference
- [Medium] ALSA: usb: babyfacepro: broken SELECT handling in bf_panel_mix_w=
heel()
- [Medium] ALSA: usb: babyfacepro: panel_saw_fader reset clobbered in bf_pa=
nel_tick()
- [Medium] ALSA: usb: babyfacepro: snd_card_register() called before panel =
init
- [Medium] ALSA: usb: babyfacepro: panel_start reset on resume breaks selec=
t put
- [Medium] ALSA: usb: babyfacepro: tick-based SELECT hold in bf_panel_tick()
- [Medium] ALSA: usb: babyfacepro: OUT wheel and resync overwrite active Ph=
ones DIM state
- [Medium] ALSA: usb: babyfacepro: stale panel_master_last after master upd=
ates
- [Low] ALSA: usb: babyfacepro: undocumented panel_poll_ms and urb_split pa=
rams
--

commit c4b87dcdef0e3e95b0b69cf856f88b85d3f4ed85
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add the front-panel poll and controls

This commit adds periodic polling of the Babyface Pro front-panel state
via vendor request 0x17 and exposes the decoded buttons, rotary wheel,
and channel selection state as mixer controls. It also implements host-driv=
en
handling for output volume, balance, preamp gain, phantom power, and
monitoring fader levels in response to front-panel input.

> diff --git a/sound/usb/babyfacepro/babyfacepro-ctl.c b/sound/usb/babyface=
pro/babyfacepro-ctl.c
> index 39584ec719b23..cf41093dcbcaf 100644
> --- a/sound/usb/babyfacepro/babyfacepro-ctl.c
> +++ b/sound/usb/babyfacepro/babyfacepro-ctl.c
> @@ -611,6 +612,7 @@ int babyface_create_xpoints(struct snd_usb_babyface *=
chip)
>  			err =3D snd_ctl_add(chip->card, kctl);
>  			if (err < 0)
>  				return err;
> +			chip->xpoint_kctl[out][src] =3D kctl;
>  		}
>  	}

[Severity: High]
What happens in babyface_create_xpoints() if snd_ctl_new1() returns NULL
on allocation failure?

Before calling snd_ctl_add(chip->card, kctl) (which checks for a NULL
pointer), babyface_create_xpoints() writes directly into kctl->id.name:

    kctl =3D snd_ctl_new1(&(struct snd_kcontrol_new){
        ...
    }, chip);
    strscpy(kctl->id.name, bf_sources[src].name,
            sizeof(kctl->id.name));
    strlcat(kctl->id.name, " Playback Volume",
            sizeof(kctl->id.name));
    err =3D snd_ctl_add(chip->card, kctl);

The same pattern also appears in babyface_create_masters() and
babyface_create_trim(), which were introduced earlier in this series and
call strscpy() or strlcat() on kctl->id.name before snd_ctl_add().

Should these functions check for !kctl and return -ENOMEM before modifying
kctl->id.name?

> @@ -834,6 +836,83 @@ static int bf_split_put(struct snd_kcontrol *kctl,
>  	return ret;
>  }
> =20
> +/* MIX-mode monitoring level (fader curve).
> + * Calibrated crosspoint-fader curve (AN1->AN1/2, cap_calib.pcap
> + * 2026-08-22; the same table as tuxmix-core/src/usb.rs FADER_CURVE).
> + * dB stored x2 (half-dB grid): the MIX wheel steps +/-0.5 dB per click
> + * on this curve (cap_mix.pcap).  0x0000 =3D -inf (digital mute),
> + * 0x0003 =3D -62 dB, ... 0x2D41 =3D +6 dB.  Raw values interpolate line=
arly
> + * between the 1-dB points.
> + */
> +#define BF_FADER_DB2_INF	(-130)	/* -65 dB =3D the wheel's -inf floor */
> +
> +static const struct bf_fader_pt {
> +	s16 db2;	/* dB x 2 */
> +	u16 raw;
> +} bf_fader_curve[] =3D {
> +	{ -124, 0x0003 }, { -122, 0x0004 }, { -120, 0x0005 },
> +	{ -118, 0x0006 }, { -116, 0x0007 }, { -114, 0x0008 },
> +	{ -112, 0x0009 }, { -110, 0x000a }, { -108, 0x000b },
> +	{ -106, 0x000d }, { -104, 0x000e }, { -102, 0x0010 },
> +	{ -100, 0x0012 }, {  -98, 0x0014 }, {  -96, 0x0017 },
> +	{  -94, 0x0019 }, {  -92, 0x001d }, {  -90, 0x0020 },
> +	{  -88, 0x0024 }, {  -86, 0x0029 }, {  -84, 0x002e },
> +	{  -82, 0x0033 }, {  -80, 0x003a }, {  -78, 0x0041 },
> +	{  -76, 0x0049 }, {  -74, 0x0051 }, {  -72, 0x005b },
> +	{  -70, 0x0067 }, {  -68, 0x0073 }, {  -66, 0x0081 },
> +	{  -64, 0x0091 }, {  -62, 0x00a3 }, {  -60, 0x00b7 },
> +	{  -58, 0x00cd }, {  -56, 0x00e6 }, {  -54, 0x0102 },
> +	{  -52, 0x0122 }, {  -50, 0x0145 }, {  -48, 0x016d },
> +	{  -46, 0x019a }, {  -44, 0x01cc }, {  -42, 0x0204 },
> +	{  -40, 0x0243 }, {  -38, 0x028a }, {  -36, 0x02d9 },
> +	{  -34, 0x0332 }, {  -32, 0x0396 }, {  -30, 0x0406 },
> +	{  -28, 0x0483 }, {  -26, 0x0510 }, {  -24, 0x05af },
> +	{  -22, 0x0660 }, {  -20, 0x0727 }, {  -18, 0x0807 },
> +	{  -16, 0x0902 }, {  -14, 0x0a1b }, {  -12, 0x0b57 },
> +	{  -10, 0x0cb9 }, {   -8, 0x0e47 }, {   -6, 0x1004 },
> +	{   -4, 0x11f9 }, {   -2, 0x142a }, {    0, 0x16a0 },
> +	{    2, 0x1963 }, {    4, 0x1c7c }, {    6, 0x1ff6 },
> +	{    8, 0x23dc }, {   10, 0x283d }, {   12, 0x2d41 },
> +};
> +
> +/* Fader raw -> dBx2 (linear interpolation; raw 0 =3D -inf). */
> +static int bf_fader_raw_to_db2(u16 raw)
> +{
> +	int i;
> +
> +	if (raw =3D=3D 0 || raw < bf_fader_curve[0].raw)
> +		return BF_FADER_DB2_INF;
> +	for (i =3D 0; i < ARRAY_SIZE(bf_fader_curve) - 1; i++) {
> +		if (raw <=3D bf_fader_curve[i + 1].raw) {
> +			u32 num =3D (u32)(raw - bf_fader_curve[i].raw) *
> +				  (u32)(bf_fader_curve[i + 1].db2 - bf_fader_curve[i].db2);
> +			u32 den =3D bf_fader_curve[i + 1].raw - bf_fader_curve[i].raw;
> +
> +			return bf_fader_curve[i].db2 + (int)((num + den / 2) / den);
> +		}
> +	}
> +	return bf_fader_curve[ARRAY_SIZE(bf_fader_curve) - 1].db2;
> +}
> +
> +/* dBx2 -> fader raw (linear interpolation; below -62 dB =3D mute 0). */
> +static u16 bf_fader_db2_to_raw(int db2)
> +{
> +	int i;
> +
> +	if (db2 <=3D bf_fader_curve[0].db2)
> +		return db2 < bf_fader_curve[0].db2 ? 0 : bf_fader_curve[0].raw;
> +	for (i =3D 0; i < ARRAY_SIZE(bf_fader_curve) - 1; i++) {
> +		if (db2 <=3D bf_fader_curve[i + 1].db2) {
> +			u32 num =3D (u32)(db2 - bf_fader_curve[i].db2) *
> +				  (u32)(bf_fader_curve[i + 1].raw - bf_fader_curve[i].raw);
> +			u32 den =3D bf_fader_curve[i + 1].db2 - bf_fader_curve[i].db2;
> +
> +			return bf_fader_curve[i].raw + (u16)((num + den / 2) / den);
> +		}
> +	}
> +	return bf_fader_curve[ARRAY_SIZE(bf_fader_curve) - 1].raw;
> +}

[Severity: High]
Can the monitoring fader wheel in bf_panel_mix_wheel() get stuck at mute
(raw =3D=3D 0) when turning up, and stuck at -52 dB (0x000e) or -54 dB (0x0=
00b)
when turning down?

In bf_panel_mix_wheel(), each poll tick converts chip->panel_mix_raw to db2,
adds delta, converts back to raw, and stores only raw in chip->panel_mix_ra=
w:

    db2 =3D bf_fader_raw_to_db2(chip->panel_mix_raw);
    db2 =3D clamp(db2 + delta, BF_FADER_DB2_INF, 12);
    raw =3D bf_fader_db2_to_raw(db2);
    chip->panel_mix_raw =3D raw;

In babyface_write_default_mixer(), all hardware input crosspoints start at
raw =3D 0. When panel_mix_raw is 0, bf_fader_raw_to_db2(0) returns
BF_FADER_DB2_INF (-130), whereas bf_fader_curve[0].db2 is -124 and
bf_fader_db2_to_raw(db2) returns 0 for all db2 < -124. If a user turns the
wheel clockwise by 1 to 5 clicks within a single 20 ms poll window,
db2 =3D -130 + delta is in [-129, -125], so bf_fader_db2_to_raw(db2) return=
s 0
and chip->panel_mix_raw stays 0. On the next poll tick, bf_fader_raw_to_db2=
(0)
starts from -130 again, discarding the clicks unless at least 6 clicks occur
in a single 20 ms interval.

Similarly, when turning the wheel down by a single click (delta =3D -1) at =
any
segment in bf_fader_curve[] where bf_fader_curve[i + 1].raw -
bf_fader_curve[i].raw =3D=3D 1 across a db2 span of 2 (such as {-106, 0x000=
d} to
{-104, 0x000e}, and {-124, 0x0003} through {-108, 0x000b}),
db2 =3D bf_fader_curve[i + 1].db2 - 1 evaluates in bf_fader_db2_to_raw() to:

    bf_fader_curve[i].raw + ((1 + 1) / 2) =3D bf_fader_curve[i + 1].raw

which rounds back up to the starting raw value and prevents single-click
decrements from moving past those points.

Would tracking the monitoring fader state in half-dB (db2) rather than
re-deriving it from the quantized raw value on every tick avoid losing
half-dB steps?

[ ... ]

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
> +	mutex_lock(&chip->mutex);
> +	db2 =3D bf_fader_raw_to_db2(chip->panel_mix_raw);
> +	db2 =3D clamp(db2 + delta, BF_FADER_DB2_INF, 12);
> +	raw =3D bf_fader_db2_to_raw(db2);
> +	chip->panel_mix_raw =3D raw;

[Severity: Medium]
How is channel selection handled in bf_panel_mix_wheel() and bf_panel_tick()
when panel_select is unknown/none or changes while mix mode is active?

There appear to be four related issues here:

1. When panel_in =3D=3D 3 (Opt), bf_panel_mix_wheel() checks panel_in =3D=
=3D 3 before
   checking panel_select !=3D 3, so it modifies targets[0] =3D 4 even when
   panel_sel[2] ("Front Panel Selection" index 2) is unknown or none (3),
   without calling bf_panel_sel_hint().

2. When panel_in !=3D 3 and panel_select =3D=3D 3, the else branch calls
   bf_panel_sel_hint(chip) without returning, so bf_panel_mix_wheel() still
   acquires chip->mutex and modifies chip->panel_mix_raw when n =3D=3D 0.

3. In bf_panel_tick(), chip->panel_mix_raw and BF_REG_PANEL_GAIN are only
   seeded on the mix_flash entry edge:

    out =3D bf_panel_out_pair(chip);
    ref =3D READ_ONCE(chip->panel_in) =3D=3D 3 ? 4 :
          (READ_ONCE(chip->panel_in) =3D=3D 2 ? 2 : 0) +
          (READ_ONCE(chip->panel_select) =3D=3D 1 ? 1 : 0);
    chip->panel_mix_raw =3D chip->xpoint[out][ref][0];

   If the user presses the select button (or writes "Front Panel Selection"
   via bf_panel_select_put()) or switches the input or output pair while
   panel_mix is already true, chip->panel_mix_raw is not re-seeded from the
   newly selected channel's crosspoint, causing the next wheel click to jump
   the new channel to the previous channel's level.

4. On that mix_flash entry edge in bf_panel_tick(), when panel_select =3D=
=3D 3
   (none/unknown), ref evaluates to base + 0 and writes BF_REG_PANEL_GAIN +=
 ref
   for an unselected channel, whereas when panel_select =3D=3D 2 (both), on=
ly
   base + 0 is written to BF_REG_PANEL_GAIN and base + 1 is omitted.

Should bf_panel_mix_wheel() return early when panel_select =3D=3D 3 (includ=
ing
for panel_in =3D=3D 3), and should the fader reference level and display re=
gisters
stay synchronized with the active selection?

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

[Severity: Medium]
Can bf_out_wheel_level() use a stale sub-floor offset from
chip->panel_out_hdb[out][ch] after the master volume is updated by
bf_master_put() or bf_panel_balance_wheel()?

When the output wheel turns an output with a stereo balance offset down so
that the quieter side drops below BF_OUT_WHEEL_FLOOR (-180),
bf_panel_out_wheel() records:

    chip->panel_master_last[out][ch] =3D 0;
    chip->panel_out_hdb[out][ch] =3D db[ch]; /* e.g. -220 */

If the user then updates the master volume via bf_master_put() (for example,
setting both channels to 0) or adjusts balance via bf_panel_balance_wheel()=
 ->
bf_panel_write_master(), neither path invalidates chip->panel_master_last[o=
ut]
to 0xffff (or clears chip->panel_out_resync). When the output wheel is later
turned up, bf_out_wheel_level() sees step =3D=3D chip->panel_master_last[ou=
t][ch]
(0 =3D=3D 0) and returns the old sub-floor panel_out_hdb[out][ch] instead of
BF_OUT_WHEEL_MUTED (-181), reintroducing the stale balance offset.

Should bf_master_put() and bf_panel_write_master() reset
chip->panel_master_last[out] to 0xffff?

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
> +	mutex_lock(&chip->mutex);
> +	chip->panel_out_resync =3D false;
> +	out =3D chip->panel_out_wheel_out;
> +	for (ch =3D 0; ch < 2; ch++) {
> +		if (chip->master[out][ch] !=3D chip->panel_master_last[out][ch])
> +			goto unlock;
> +		db[ch] =3D chip->panel_out_hdb[out][ch];
> +		if (db[ch] < BF_OUT_WHEEL_8BIT_MIN)
> +			goto unlock;
> +	}
> +	if (!chip->muted[out]) {
> +		flag =3D bf_flag_cycle[chip->flag_cnt];
> +		chip->flag_cnt =3D (chip->flag_cnt + 1) & 3;
> +		bf_vendor_write(chip, BF_REQ_GAIN, BF_MASTER_8_0DB + db[0],
> +				BF_REG_MASTER_8 + 2 * out);
> +		bf_vendor_write(chip, BF_REQ_GAIN, BF_MASTER_8_0DB + db[1],
> +				BF_REG_MASTER_8 + 2 * out + 1);
> +		bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				bf_master_reg16(chip->master[out][0]),
> +				(BF_REG_MASTER_16 + 2 * out) | flag);
> +		bf_vendor_write(chip, BF_REQ_CROSSPOINT,
> +				bf_master_reg16(chip->master[out][1]),
> +				(BF_REG_MASTER_16 + 2 * out + 1) | flag);
> +	}
> +unlock:
> +	mutex_unlock(&chip->mutex);
> +}

[Severity: Medium]
Does turning the output or balance wheel on Phones (out =3D=3D 1) while
chip->dim is engaged, or engaging "Dim Switch" within the 150 ms resync
window, overwrite the hardware's -20 dB dim attenuation with the full
un-dimmed volume?

When "Dim Switch" is engaged via bf_dim_put() -> bf_dim_apply(chip, true),
the driver writes the fixed -20 dB values (BF_MASTER_MINUS20_8 and
BF_MASTER_MINUS20_16) to the Phones master registers while leaving
chip->master[1] holding the un-dimmed level.

If a user turns the output wheel on Phones (out =3D=3D 1) and "Dim Switch" =
is
then engaged within the 150 ms BF_OUT_WHEEL_RESYNC_MS window,
bf_dim_apply(chip, true) does not change chip->master[1]. When
bf_panel_out_resync() runs 150 ms after the click,
chip->master[1][ch] =3D=3D chip->panel_master_last[1][ch] and !chip->muted[=
1]
are still true, so bf_panel_out_resync() writes the un-dimmed 8-bit and
16-bit levels to the hardware, wiping out the -20 dB dim attenuation.

Similarly, in bf_panel_write_master() and bf_panel_out_wheel_write():

    chip->master[out][0] =3D l;
    chip->master[out][1] =3D r;
    /* A Phones change while DIM is engaged re-bases the restore. */
    if (chip->dim && out =3D=3D 1) {
        chip->dim_saved[0] =3D l;
        chip->dim_saved[1] =3D r;
    }

both functions update chip->dim_saved when chip->dim && out =3D=3D 1, but s=
till
write the un-dimmed l and r values to BF_REG_MASTER_8 and BF_REG_MASTER_16
while chip->dim remains true.

Should bf_panel_write_master(), bf_panel_out_wheel_write(), and
bf_panel_out_resync() avoid writing un-dimmed master levels to out =3D=3D 1=
 while
chip->dim is active (or clear chip->dim if the wheel is meant to cancel it)?

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
> +	mutex_lock(&chip->mutex);
> +	old =3D chip->preamp;
> +	/* One channel selected: toggle it.  Both selected: ALIGN both to
> +	 * the same state, so repeated SET presses cycle all-on <-> all-off
> +	 * (a mixed phantom state cannot persist with both selected).
> +	 */
> +	if (READ_ONCE(chip->panel_select) =3D=3D 2) {
> +		if ((chip->preamp & bits) =3D=3D bits)
> +			chip->preamp &=3D ~bits;
> +		else
> +			chip->preamp |=3D bits;
> +	} else {
> +		chip->preamp ^=3D bits;
> +	}

[Severity: High]
Can a concurrent write in bf_panel_select_put() race with
bf_panel_set_phantom(), bf_panel_gain_wheel(), and bf_panel_mix_wheel() and
cause +48V phantom power or gain to be applied to the wrong channels?

bf_panel_select_put() updates chip->panel_select_armed,
chip->panel_sel[pair], chip->panel_select_known, and chip->panel_select
(via bf_panel_sel_load()) without taking chip->mutex, while
bf_panel_set_phantom() re-evaluates READ_ONCE(chip->panel_select) four
separate times instead of snapshotting it once under a lock.

If chip->panel_select is 0 or 1 when bf_panel_set_phantom() checks:

    if (READ_ONCE(chip->panel_select) =3D=3D 3)

and bf_panel_select_put() concurrently sets chip->panel_select to 3
(none/unknown) before the next two reads:

    if (READ_ONCE(chip->panel_select) !=3D 1)
        bits |=3D BF_PREAMP_48V_MIC1;
    if (READ_ONCE(chip->panel_select) !=3D 0)
        bits |=3D BF_PREAMP_48V_MIC2;

then both conditions evaluate to true (setting both BF_PREAMP_48V_MIC1 and
BF_PREAMP_48V_MIC2), and READ_ONCE(chip->panel_select) =3D=3D 2 evaluates to
false, toggling +48V phantom power on both microphone inputs when no channel
is selected.

Similarly, bf_panel_gain_wheel() and bf_panel_mix_wheel() re-read
READ_ONCE(chip->panel_select) multiple times across the !=3D 3, =3D=3D 1, a=
nd =3D=3D 2
checks, which can select channel 0 if panel_select changes to 3 or push
duplicate channel 1 entries if panel_select changes from 1 to 2.

Should panel_select state updates in bf_panel_select_put() and reads in the
panel worker be serialized (or at least read once into a local variable)?

[ ... ]

> +		if (READ_ONCE(chip->panel_mix))
> +			bf_panel_mix_wheel(chip, delta);
> +		else if (chip->panel_sel_hold >=3D 10 && cls =3D=3D 1)
> +			bf_panel_balance_wheel(chip, delta);
> +		else if (cls =3D=3D 1)
> +			bf_panel_out_wheel(chip, delta);
> +		else if (cls =3D=3D 2)
> +			bf_panel_gain_wheel(chip, delta);
> +	}
> +	bf_panel_out_resync(chip);
> +
> +	/* Selections - keep the previous when the field is not in range
> +	 * (the fader-mode readback drops the IN position bits).
> +	 */
> +	in =3D bf_panel_in_decode((st[2] >> BF_PANEL_IN_SHIFT) & 0x7);
> +	if (in && in !=3D READ_ONCE(chip->panel_in)) {
> +		WRITE_ONCE(chip->panel_in, in);
> +		/* The unit keeps one SELECT selection per IN pair, and an
> +		 * IN switch does not clear it (hardware-verified
> +		 * 2026-10-02: back on Ch 1/2 after a trip through Ch 3/4,
> +		 * the first SELECT press showed the L it had left, while
> +		 * Ch 3/4 showed nothing).  Switch to the new pair's.
> +		 */
> +		bf_panel_sel_load(chip);
> +		/* The LEDs go dark on an IN switch: the next SELECT press
> +		 * only shows the selection again (no step), the one after
> +		 * that steps it (user-verified 2026-08-28).
> +		 */
> +		chip->panel_select_armed =3D false;
> +		bf_panel_notify(chip, BF_PANEL_KCTL_IN);
> +	}
> +	out =3D bf_panel_out_decode(st[1] & 0x07);
> +	if (out && out !=3D READ_ONCE(chip->panel_out)) {
> +		WRITE_ONCE(chip->panel_out, out);
> +		bf_panel_notify(chip, BF_PANEL_KCTL_OUT);
> +	}
> +
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
Does counting 10 poll ticks in chip->panel_sel_hold accurately measure a
200 ms hold when fast polling is active or when panel_poll_ms is changed?

bf_panel_tick() checks chip->panel_sel_hold >=3D 10 assuming a fixed 20 ms
poll interval. However, during the 200 ms fast-poll window after an output
wheel click (chip->panel_fast_until), babyface_panel_work() polls every
BF_PANEL_FAST_POLL_MS (5 ms), so 10 ticks elapse in 50 ms (shorter than the
100-150 ms flash of a normal tap). Conversely, if the user sets the
panel_poll_ms module parameter up to 1000 ms, 10 ticks require holding the
button for up to 10 seconds.

In addition, because the rising-edge check:

    if (st[3] =3D=3D BF_PANEL_FLASH_SELECT &&
        chip->panel_prev[3] !=3D BF_PANEL_FLASH_SELECT &&
        chip->panel_select_known)

runs unconditionally on the first tick of BF_PANEL_FLASH_SELECT, holding
select in output mode to adjust balance also steps chip->panel_select on the
initial press edge.

Would measuring the hold duration with jiffies or ktime_t (and avoiding
stepping the input channel selection on an output-mode balance hold) work
more reliably?

[ ... ]

> +	mix_flash =3D st[3] =3D=3D BF_PANEL_FLASH_MIX &&
> +		    chip->panel_prev[3] !=3D BF_PANEL_FLASH_MIX;
> +	fader_now =3D (st[2] >> 4) =3D=3D 0x0;
> +
> +	if (mix_flash) {
> +		if (READ_ONCE(chip->panel_mix)) {
> +			bf_vendor_write(chip, BF_REQ_PREAMP, 0x0400, 0x8000);
> +			bf_vendor_write(chip, BF_REQ_PREAMP, 0x0400, 0x8080);
> +			WRITE_ONCE(chip->panel_mix, false);
> +			WRITE_ONCE(chip->panel_saw_fader, false);
> +		} else {
> +			int ref, out;
> +			int m;
> +
> +			bf_vendor_write(chip, BF_REQ_PREAMP, 0x8480, 0x8c80);
> +			WRITE_ONCE(chip->panel_mix, true);

[ ... ]

> +		}
> +		bf_panel_notify(chip, BF_PANEL_KCTL_MIX);
> +	}
> +	if (fader_now) {
> +		WRITE_ONCE(chip->panel_saw_fader, true);
> +	} else if (READ_ONCE(chip->panel_mix) && READ_ONCE(chip->panel_saw_fade=
r) &&
> +		   st[3] !=3D BF_PANEL_FLASH_MIX) {
> +		/* device left fader mode by itself (IN/OUT/SET press) */
> +		bf_vendor_write(chip, BF_REQ_PREAMP, 0x0400, 0x8000);
> +		bf_vendor_write(chip, BF_REQ_PREAMP, 0x0400, 0x8080);
> +		WRITE_ONCE(chip->panel_mix, false);
> +		WRITE_ONCE(chip->panel_saw_fader, false);
> +		bf_panel_notify(chip, BF_PANEL_KCTL_MIX);
> +	}

[Severity: Medium]
When exiting mix mode via a second press of the mix button, doesn't the
subsequent if (fader_now) check immediately overwrite chip->panel_saw_fader
back to true?

While mix mode is engaged, the device is in fader mode, so fader_now
((st[2] >> 4) =3D=3D 0x0) is true in the readback that reports the second
BF_PANEL_FLASH_MIX press. The mix_flash exit branch sets:

    WRITE_ONCE(chip->panel_mix, false);
    WRITE_ONCE(chip->panel_saw_fader, false);

but immediately after the if (mix_flash) block, if (fader_now) executes
unconditionally and sets chip->panel_saw_fader back to true. Because the
mix_flash entry branch does not clear panel_saw_fader to false either, the
next press of the mix button starts with panel_saw_fader =3D=3D true before=
 the
device has switched st[2] >> 4 to 0x0, which can trigger the device-driven
exit branch prematurely if the 0x44 flash clears before fader_now becomes
true.

Should if (fader_now) be gated on READ_ONCE(chip->panel_mix) (or cleared on
mix entry)?

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
> +	if (pair =3D=3D READ_ONCE(chip->panel_in) - 1 && !restore && sel >=3D 0)
> +		/* Set while the LEDs show the selection: the next press steps
> +		 * it.
> +		 */
> +		chip->panel_select_armed =3D true;
> +	if (sel =3D=3D chip->panel_sel[pair])
> +		return 0;
> +	chip->panel_sel[pair] =3D sel;
> +	if (pair =3D=3D READ_ONCE(chip->panel_in) - 1)
> +		bf_panel_sel_load(chip);
> +	return 1;
> +}

[Severity: Medium]
Does resetting chip->panel_start =3D jiffies in babyface_panel_start() on
system resume cause bf_panel_select_put() to misclassify writes for 3 secon=
ds
after every resume?

babyface_resume() calls babyface_panel_start(chip), which resets
chip->panel_start =3D jiffies. For 3 seconds after every system resume,
restore =3D time_is_after_jiffies(chip->panel_start + 3 * HZ) in
bf_panel_select_put() is true, so user or application writes to
"Front Panel Selection" are silently ignored if chip->reprobe is true, or
fail to set chip->panel_select_armed =3D true if chip->reprobe is false.

Conversely, during boot or probe, if alsactl restore runs more than 3 secon=
ds
after probe, restore evaluates to false, bypassing the chip->reprobe check
and setting chip->panel_select_armed =3D true while the unit's selection
indicators are still dark, which desynchronizes the host-tracked selection =
on
the next physical button press.

Should chip->panel_start only be set at probe time, or is there a more
direct way to handle initial state restoration without a 3-second timer
window?

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> index e0eb0ce9b92f3..a1aafebb2037c 100644
> --- a/sound/usb/babyfacepro/babyfacepro.c
> +++ b/sound/usb/babyfacepro/babyfacepro.c
> @@ -1479,8 +1527,12 @@ module_param(frames_per_urb, int, 0444);
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
Should the new panel_poll_ms and urb_split module parameters be documented
in Documentation/admin-guide/kernel-parameters.txt?

Also, urb_split belongs to the pcm period-splitting logic from the earlier
streaming patch rather than the front-panel changes described in this commi=
t.

> @@ -1731,12 +1787,24 @@ static int babyface_probe(struct usb_interface *i=
ntf,
>  		goto error;
>  	}
> =20
> +	err =3D babyface_create_panel(chip);
> +	if (err < 0) {
> +		dev_err(&intf->dev, "front-panel control creation failed: %d\n", err);
> +		goto error;
> +	}
> +
>  	err =3D snd_card_register(chip->card);
>  	if (err < 0) {
>  		dev_err(&intf->dev, "snd_card_register failed: %d\n", err);
>  		goto error;
>  	}
> =20
> +	/* The panel poll mirrors the physical buttons/wheel into the
> +	 * Front Panel controls; it runs for the whole card lifetime.
> +	 */
> +	chip->reprobe =3D bf_seen_before(dev);
> +	babyface_panel_start(chip);

[Severity: Medium]
Can userspace access "Front Panel Selection" via bf_panel_select_put()
between snd_card_register() and babyface_panel_start()?

snd_card_register(chip->card) exposes the control device to userspace and
triggers udev's alsactl restore before chip->reprobe =3D bf_seen_before(dev)
and babyface_panel_start(chip) have run. If bf_panel_select_put() executes
during that window on a re-probed device, chip->reprobe is still false and
chip->panel_start is still 0, so the if (restore && chip->reprobe) check in
bf_panel_select_put() is bypassed and babyface_panel_start() subsequently
overwrites chip->panel_select_armed.

Should chip->reprobe and the initial panel state in babyface_panel_start()
be initialized before calling snd_card_register()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113140.1342=
57-1-i.bahloul01@gmail.com?part=3D6
