Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895882;
	b=l0WzlV2w1l3/xIyAFQPX1Cma984sccbQZohO54UTbEtoB2JXjM7B5IjCqKp/DifySO/g
	 VlejQfHg6NpZ2gsVAZ3bj6dh4l74Rp7bvzOpI+oicXUr7YUTv7BNgH5oNRpPBdmbZPtyZ
	 eW/P6q8J0oB+SeFCOpEIbNZ0RxJRIsDKUbnQte4JdXbkkzjgLi7+N4gacG5ewqn2mkNgy
	 Yg/YN88GVdBbFiX5Kfl+o87dhxYi7CnKCOS2q0gIqwf9yo1H185KOgdk+6y1AMHxNu2u2
	 FoA/jh8Ys/qYufdOHpkXx+nZDtXCS/5M2V7x7x1OomrpBujVipbQ8NOY4CDI095dYag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895882;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fq/y5R5RSCmY+yV6DqFGYOf861rFrD4iB4Q9XRwd6hg=;
	b=fP3T39aOCjrsl661cLf6PAEfbEuX5LKLxCpqKJHZGDYpqg3retbjS6hKMnSHzG+1v0Xu
	 8UhRjUcbUdcWWa1oN38VM9o6eiFpNz3dx72RpmpM83g6nZeCQajXit/QSIRH+6+aXrCUc
	 Q7eKHYnGv3Ps7IeDR3dnlvIsi9gtlugtWZCJyyBIFS31ure7B7j7P6/vsHGGjebxnVDfX
	 w6yAAABTV8QjY6a6eGPFyNY61mi90utEAayzRSRqn4WxFV2qIZMdzQUOhXapLSTKyxl5t
	 Bb4WWxp4gEcUS8uy5bZcKcOtw6YlaUJisFoyPKiZLry760k0NgwnjqtswLKBhlJoaxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lG3CXBRo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1ED606A326;
	Thu,  5 Nov 2026 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lG3CXBRo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039F41F000C1;
	Thu,  5 Nov 2026 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895881;
	bh=Fq/y5R5RSCmY+yV6DqFGYOf861rFrD4iB4Q9XRwd6hg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lG3CXBRoTNZAtWwJ55swtf1RvP/2tIavk9N1PwoQNR2TInXQT7kbDwN2q1+d2uA5n
	 H+6Fhr0CTBXzfWU5m64jWg/axhGsHVG9C1vwKsp7ppoAtVnlMzjrVZOnNaC04U40/M
	 7ajwaYZRRSq+EvN+lCRrMtDsv1Woi/uuX5XM7tmXIWSpJ4vwwAQRzIciPNyz0e5f87
	 Hi3hwozZm42DCVg7CORPUm8j5t/9R0XSCY/RhlsfT1KFsg+UI3A8BaT+/WalpkWUh1
	 +0iRPdu9dlw5MTlGbmp2IjXZ85gbTHEWhmYMr6r1oM3Fr6JB04xX/JXaHv2SD11a0l
	 uyyaJEbosNnaw==
Message-ID: <sashiko-outbox-199481@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/8] ALSA: usb: add RME Babyface Pro driver core
 (probe, PCM stream)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105151553.223722-2-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
 <20261105151553.223722-2-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:24:40 +0000
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
- [High] ALSA: usb: babyfacepro: URB and coherent DMA teardown deferred pas=
t disconnect
- [Medium] ALSA: usb: babyfacepro: validate endpoint types in babyface_stre=
am_start()
- [Medium] ALSA: usb: babyfacepro: stop running substreams on babyface_stre=
am_start() error
- [Medium] ALSA: usb: babyfacepro: constrain period_size and rate by packet=
 floor in open()
- [Medium] ALSA: usb: babyfacepro: unconditional usb_enable_autosuspend() o=
n teardown
- [Low] ALSA: usb: babyfacepro: document module parameters in kernel-parame=
ters.txt
- [Low] ALSA: usb: babyfacepro: use per-card slot for index and id in babyf=
ace_probe()
--

commit 6f9408f458b3d9ee7e3ba9156ec7fd66f87dee6c
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: add RME Babyface Pro driver core (probe, PCM stream)

This commit adds a standalone ALSA USB audio driver for the RME Babyface
Pro and Babyface Pro FS in proprietary mode, handling cold-start
initialization, card lifecycle, and full-duplex interrupt-URB PCM
streaming.

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> new file mode 100644
> index 0000000000000..ac1414adc73c6
> --- /dev/null
> +++ b/sound/usb/babyfacepro/babyfacepro.c

[ ... ]

> +static int babyface_stream_start(struct snd_usb_babyface *chip)
> +{
> +	unsigned int urbsize =3D chip->frame_bytes * chip->urb_frames;
> +	s64 since;
> +	int i, ret;

[ ... ]

> +	for (i =3D 0; i < chip->urbs_active; i++) {
> +		/* Do not replay data from the previous stream/format. */
> +		memset(chip->buf_out[i], 0, urbsize);
> +		usb_fill_int_urb(chip->urbs_in[i], chip->dev,
> +				 usb_rcvintpipe(chip->dev, BF_EP_IN),
> +				 chip->buf_in[i], urbsize,
> +				 babyface_complete_in, chip, 1);
> +		usb_fill_int_urb(chip->urbs_out[i], chip->dev,
> +				 usb_sndintpipe(chip->dev, BF_EP_OUT),
> +				 chip->buf_out[i], urbsize,
> +				 babyface_complete_out, chip, 1);

[ ... ]

> +	WRITE_ONCE(chip->streaming, true);
> +	for (i =3D 0; i < chip->urbs_active; i++) {
> +		ret =3D usb_submit_urb(chip->urbs_in[i], GFP_KERNEL);
> +		if (ret < 0)
> +			goto err;
> +		ret =3D usb_submit_urb(chip->urbs_out[i], GFP_KERNEL);
> +		if (ret < 0)
> +			goto err;
> +	}

[Severity: Medium]
As reported by Sashiko on v7 [1], babyface_stream_start() initializes
chip->urbs_in[i] and chip->urbs_out[i] with usb_fill_int_urb() using
hardcoded interrupt pipes for BF_EP_IN and BF_EP_OUT and submits them via
usb_submit_urb() without validating the endpoint descriptors in the active
alternate setting.

If a malformed or emulated USB device with VID 0x2a39 and PID 0x3fc0
exposes non-interrupt endpoints (or omits them) on interface 5 alternate
settings BF_ALT_1, BF_ALT_2, or BF_ALT_3, usb_submit_urb() logs a bogus
URB transfer warning and forwards the interrupt URB with a mismatched
endpoint descriptor to the host controller driver.

Should babyface_stream_start() check usb_urb_ep_type_check() on the
initialized URBs (or validate the endpoints after usb_set_interface())
before submitting them?

> +	/* Session arm (cap_audio frame 5829, after the URBs). */
> +	ret =3D bf_vendor_write(chip, BF_REQ_SESSION_ARM, 0x0000, 0xc000);
> +	if (ret < 0)
> +		goto err;
> +
> +	dev_dbg(&chip->dev->dev, "stream started (%u frames/URB, %u URBs)\n",
> +		chip->urb_frames, chip->urbs_active);
> +	return 0;
> +
> +err:
> +	dev_err_ratelimited(&chip->dev->dev, "failed to start stream: %d\n",
> +			    ret);
> +	babyface_stream_kill(chip);
> +	return ret;
> +}

[Severity: Medium]
As reported by Sashiko on v7 [2], babyface_stream_start() sets
chip->streaming to true before the usb_submit_urb() loop and the blocking
bf_vendor_write(chip, BF_REQ_SESSION_ARM, ...) control transfer.

Because babyface_pcm_trigger() handles SNDRV_PCM_TRIGGER_START under the
PCM stream lock without taking chip->mutex:

	case SNDRV_PCM_TRIGGER_START:
		if (!READ_ONCE(chip->streaming))
			return -EPIPE;

if the other direction's substream is already in SNDRV_PCM_STATE_PREPARED
and triggers start while babyface_stream_start() is in flight, it sees
chip->streaming =3D=3D true and enters SNDRV_PCM_STATE_RUNNING.

If usb_submit_urb() or bf_vendor_write() then fails, could the err path
leave that other substream stuck in SNDRV_PCM_STATE_RUNNING with no URBs
in flight because it calls babyface_stream_kill(chip) without calling
babyface_pcm_stop_both(chip, SNDRV_PCM_STATE_XRUN)?

[ ... ]

> +static unsigned int bf_urb_frames(struct snd_usb_babyface *chip,
> +				  const struct bf_rate *r,
> +				  unsigned int period)
> +{
> +	unsigned int pkt =3D r->min_fpu;
> +	unsigned int hi =3D rounddown(chip->frames_per_urb, pkt);
> +	unsigned int lo =3D roundup(max(chip->urb_frames_min, pkt), pkt);
> +	unsigned int urb;
> +
> +	if (!hi || lo > hi || period < pkt)
> +		return 0;
> +	urb =3D rounddown(period / DIV_ROUND_UP(period, hi), pkt);
> +	if (bf_split_period(r, period))
> +		urb =3D rounddown(urb / 2, pkt);
> +	urb =3D clamp(urb, lo, hi);
> +	return urb <=3D period ? urb : 0;
> +}

[ ... ]

> +static int babyface_pcm_open(struct snd_pcm_substream *subs)
> +{
> +	struct snd_usb_babyface *chip =3D snd_pcm_substream_chip(subs);
> +	struct snd_pcm_runtime *rt =3D subs->runtime;
> +	int ret;
> +
> +	rt->hw =3D babyface_pcm_hw;
> +	ret =3D snd_pcm_hw_constraint_list(rt, 0, SNDRV_PCM_HW_PARAM_RATE,
> +					 &bf_rates_constraint);
> +	if (ret < 0)
> +		return ret;
> +	/* The stream is 24-bit audio in a 32-bit container, left-justified
> +	 * (the device word carries the sample in bits 31-8).  Declare the
> +	 * valid-bit width so user-space knows to ignore the low 8 bits.
> +	 */
> +	ret =3D snd_pcm_hw_constraint_msbits(rt, 0, 32, 24);
> +	if (ret < 0)
> +		return ret;
> +	/* A period must span at least one URB, so a completion crosses at
> +	 * most one period boundary.  The URB size follows the period down to
> +	 * urb_frames_min; while another application holds the session, its
> +	 * period (in whole URBs) is the floor.  Constrain in frames (not
> +	 * bytes) so the minimum period does not balloon at low channel
> +	 * counts.
> +	 */
> +	ret =3D snd_pcm_hw_constraint_minmax(rt, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
> +					   chip->urb_frames_min, 1 << 18);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
In babyface_probe(), chip->frames_per_urb and chip->urb_frames_min can be
configured down to 8 (such as urb_frames_min=3D16, which is documented as
the low-latency floor):

	chip->frames_per_urb =3D clamp(frames_per_urb, 8, 1024) & ~7;
	chip->urb_frames_min =3D min_t(unsigned int,
				     clamp(urb_frames_min, 8, 1024) & ~7,
				     chip->frames_per_urb);

However, bf_urb_frames() requires the period and URB size to be at least
r->min_fpu frames (16 frames at BF_ALT_2 and 32 frames at BF_ALT_3) and
requires rounddown(chip->frames_per_urb, r->min_fpu) >=3D
roundup(max(chip->urb_frames_min, r->min_fpu), r->min_fpu), returning 0
otherwise.

Because babyface_pcm_open() only bounds SNDRV_PCM_HW_PARAM_PERIOD_SIZE by
chip->urb_frames_min and offers all rates in bf_rates_constraint, won't
ALSA parameter refinement allow combinations (for example period_size=3D16
at 192 kHz when urb_frames_min=3D16) that babyface_pcm_hw_params() then
rejects with -EINVAL?

[ ... ]

> +static int index[SNDRV_CARDS] =3D SNDRV_DEFAULT_IDX;
> +static char *id[SNDRV_CARDS] =3D SNDRV_DEFAULT_STR;
> +static int frames_per_urb =3D BF_FRAMES_PER_URB_DEFAULT;
> +static int urb_frames_min =3D 32;
> +static int nurbs =3D BF_NURBS_DEFAULT;
> +
> +module_param_array(index, int, NULL, 0444);
> +MODULE_PARM_DESC(index, "Index value for the Babyface Pro sound card.");
> +module_param_array(id, charp, NULL, 0444);
> +MODULE_PARM_DESC(id, "ID string for the Babyface Pro sound card.");
> +module_param(frames_per_urb, int, 0444);
> +MODULE_PARM_DESC(frames_per_urb, "Largest URB in audio frames, 8..1024 (=
256 =3D default); the period chooses the size below it.");
> +module_param(urb_frames_min, int, 0444);
> +MODULE_PARM_DESC(urb_frames_min, "Smallest URB in audio frames, 8..1024 =
(32 =3D default, 16 =3D low-latency floor).");
> +module_param(nurbs, int, 0444);
> +MODULE_PARM_DESC(nurbs, "Most URBs in flight per direction, 2..16 (8 =3D=
 default).");

[Severity: Low]
As reported by Sashiko on v7 [3], this adds five module parameters
(index, id, frames_per_urb, urb_frames_min, and nurbs) that can also be
set on the kernel command line as snd-usb-babyface-pro.<param>=3D. Should
these parameters be documented in
Documentation/admin-guide/kernel-parameters.txt?

> +static void babyface_private_free(struct snd_card *card)
> +{
> +	struct snd_usb_babyface *chip =3D card->private_data;
> +	unsigned int urbsize;
> +	int i;
> +
> +	if (!chip)
> +		return;
> +
> +	/* The URB arrays are NULL when the probe failed before allocating
> +	 * them (snd_card_free runs private_free on any probe error).
> +	 */
> +	if (chip->urbs_in) {
> +		urbsize =3D BF_WORDS_PER_FRAME * sizeof(u32) * chip->frames_per_urb;
> +		for (i =3D 0; i < chip->nurbs; i++) {
> +			if (chip->urbs_in[i]) {
> +				usb_kill_urb(chip->urbs_in[i]);
> +				usb_free_urb(chip->urbs_in[i]);
> +			}
> +			if (chip->urbs_out && chip->urbs_out[i]) {
> +				usb_kill_urb(chip->urbs_out[i]);
> +				usb_free_urb(chip->urbs_out[i]);
> +			}
> +			/* probe() allocates the six arrays separately and can
> +			 * fail between them, so each may be NULL here - this runs
> +			 * on the probe error path via snd_card_free().
> +			 */
> +			if (chip->buf_in && chip->dma_in)
> +				usb_free_coherent(chip->dev, urbsize,
> +						  chip->buf_in[i], chip->dma_in[i]);
> +			if (chip->buf_out && chip->dma_out)
> +				usb_free_coherent(chip->dev, urbsize,
> +						  chip->buf_out[i], chip->dma_out[i]);
> +		}
> +	}

[Severity: High]
In babyface_disconnect(), the driver stops the stream and calls
snd_card_free_when_closed(chip->card), deferring babyface_private_free()
until user-space closes the last ALSA file descriptor.

If the USB host controller is unbound or hot-unplugged while an audio
application holds the ALSA PCM device open, usb_remove_hcd() runs
babyface_disconnect() and then calls hcd_buffer_destroy(), which destroys
hcd->pool[] and sets the pool pointers to NULL.

When user-space later closes the ALSA file descriptor and
babyface_private_free() runs after disconnect has returned, won't calling
usb_kill_urb() and usb_free_coherent() violate the USB lifecycle contract
and trigger a NULL pointer dereference in dma_pool_free() (when urbsize <=3D
2048) or free DMA memory on a torn-down HCD device?

> +	kfree(chip->urbs_in);
> +	kfree(chip->urbs_out);
> +	kfree(chip->buf_in);
> +	kfree(chip->buf_out);
> +	kfree(chip->dma_in);
> +	kfree(chip->dma_out);
> +	usb_put_dev(chip->dev);
> +}
> +
> +static int babyface_probe(struct usb_interface *intf,
> +			  const struct usb_device_id *usb_id)
> +{
> +	struct usb_device *dev =3D interface_to_usbdev(intf);
> +	struct snd_usb_babyface *chip;
> +	struct snd_card *card;
> +	struct snd_pcm *pcm;
> +	unsigned int urbsize;
> +	int i, err;
> +
> +	if (intf->cur_altsetting->desc.bInterfaceNumber !=3D BF_IFACE) {
> +		/* Only the proprietary audio interface is ours; the MIDI
> +		 * (standard class) and bulk interfaces stay unclaimed so
> +		 * snd-usb-audio can take the MIDI one.
> +		 */
> +		return -ENODEV;
> +	}
> +
> +	err =3D snd_card_new(&intf->dev, index[0], id[0], THIS_MODULE,
> +			   sizeof(*chip), &card);

[Severity: Low]
As reported by Sashiko on v7 [4], index and id are declared as
SNDRV_CARDS-element module_param_array arrays, but babyface_probe()
always passes index[0] and id[0] to snd_card_new().

If two devices are connected (or a device is re-probed before
snd_card_free_when_closed() finishes releasing the previous card) when a
non-default index or id parameter is specified, won't snd_card_new() fail
trying to claim the same slot or ID, while ignoring elements 1 through
SNDRV_CARDS - 1?

> +	if (err < 0) {
> +		dev_err(&intf->dev, "snd_card_new failed: %d\n", err);
> +		return err;
> +	}
> +	chip =3D card->private_data;
> +	chip->card =3D card;
> +
> +	chip->dev =3D usb_get_dev(dev);
> +	/* USB autosuspend is untested: nothing in this driver holds a PM
> +	 * reference while streaming, so an autosuspend request could race
> +	 * a live stream.  Disable it explicitly rather than ship an
> +	 * untested code path - full autosuspend support (correct
> +	 * autopm_get/put pairing around the stream) is a deliberate
> +	 * follow-up, not an oversight.
> +	 */
> +	usb_disable_autosuspend(chip->dev);

[ ... ]

> +error:
> +	usb_set_intfdata(intf, NULL);
> +	/* Balance the probe()-time usb_disable_autosuspend(): disconnect()
> +	 * is never called for a failed probe, so the disable would leak and
> +	 * leave autosuspend off on this usb_device until a physical unplug.
> +	 */
> +	usb_enable_autosuspend(chip->dev);
> +	snd_card_free(chip->card);
> +	return err;
> +}
> +
> +static void babyface_disconnect(struct usb_interface *intf)
> +{

[ ... ]

> +	cancel_work_sync(&chip->stream_work);
> +	/* Balance the probe()-time usb_disable_autosuspend(): the usb_device
> +	 * outlives this interface claim (a usbfs detach re-probes without
> +	 * the physical device ever disconnecting), so leaving autosuspend
> +	 * disabled here would wrongly affect whatever claims the device next.
> +	 */
> +	usb_enable_autosuspend(chip->dev);

[Severity: Medium]
usb_disable_autosuspend() and usb_enable_autosuspend() wrap
pm_runtime_forbid() and pm_runtime_allow() on struct usb_device and are
not reference-counted; USB core initializes non-hub USB devices with
autosuspend disabled (power/control set to on) by default, and because
babyface_driver does not set supports_autosuspend, USB core already keeps
the bound interface active while claimed.

When babyface_probe() fails or babyface_disconnect() unbinds interface 5,
won't calling usb_enable_autosuspend(chip->dev) unconditionally flip the
parent usb_device's power/control setting to auto and allow the composite
device (including its MIDI interface claimed by snd-usb-audio) to
autosuspend unexpectedly?

[1] https://lore.kernel.org/r/20261027113140.134257-2-i.bahloul01@gmail.com
[2] https://lore.kernel.org/r/20261027113140.134257-2-i.bahloul01@gmail.com
[3] https://lore.kernel.org/r/20261027113140.134257-2-i.bahloul01@gmail.com
[4] https://lore.kernel.org/r/20261027113140.134257-2-i.bahloul01@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105151553.2237=
22-1-i.bahloul01@gmail.com?part=3D1
