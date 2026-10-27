Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102555;
	b=kMKCbaqy583rGmmKHngv97xRkwvCkEW9eqWYBk6R0MmiGyF/PDGtOcDzk/T8xKHU85M0
	 wKrr/dgkp8KJ9dUwnbDXkGluIzzpC9k6ifPlDIEWdFgH9yasLeP0ULcUsNjA1EZxYupAM
	 I8TGwztVTsKevS9MT7FGK8aknfqFXjMYoZROs3Yg3SaXMgnwIvLrR/BY3g8p2pXzxt3bY
	 YGw1RTliZRsXMoGoJyzSPViD4xzQpK4msHTVuF0YWvpP/gFM4+JrJaJKRP2rpi9PI0V8Y
	 3sFZI29avD5LF3vX/gVasHzkyH1520Ngg04jtxH4YSJfebLXhmeuw48apvrZgcTlIng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102555;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lGlmBhp2DA4XianCYvs9KUnSitEhmF51kUKq/tjJPwM=;
	b=OY+Z4OHT40RfIgWvTi+HWcJGea6Q/ils5jwputwhms90qNA821atRPZjjoVNrCvzvYnO
	 DAi+WUD1RgU+T5hvslPl11F6qcGg6YZslMUnHfLYbA7E8zjNm25kkLIALiLLk8T0+fF8/
	 mRunhH8Z+yRKuvvIyT9YePl7APa+5tIudbl8mjvHOD1FJ/9IE3Ds8DWB0XHHj2GDsa6Al
	 HGxy5m9P7wFXcKrzD8Q0TVDrTbA1bYhfh4p8o5eUVaI/yMhImpRgERl7LbJIEonRZtZeH
	 JJBrURJJNfa9d4vT76w3Td9ex4JvVzPjJmEZAPvjTOJPdvrrh/S9WJngaNnOxD4fVnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbfXUzQY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116CF606A320;
	Tue, 27 Oct 2026 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dbfXUzQY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DD31F01241;
	Tue, 27 Oct 2026 12:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102554;
	bh=lGlmBhp2DA4XianCYvs9KUnSitEhmF51kUKq/tjJPwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dbfXUzQYr0AKJC5yWUZIUwcljneYQ0BTpqMtX14EhwvkzgSzmZyoqFXAaNFOx9YVk
	 ryo7kRludo1sHLDP9UW/7LXzE3HdCgbjF/DXcSi308DOJ4esQwasho6Js657GsCTIL
	 hK+MroMg/szuTrsZ+/Z0kSnDEzNuTV/DLuw4Mug6sZVfO12JqfgQjsRHxwaSKnwhDd
	 Gx2Z/27kSgrEAE0vSnhSeh45AgRA84MFPFOw2hfgPX4bFboBycMHeDgGMplc7UA64l
	 OH5qFM9swYwTeY2LrmMz6a6mwCgbTlkWttu4ZL54CCFQdv82yG2BL3vK4mC+7z9sED
	 V/6k/QBNbsxQQ==
Message-ID: <sashiko-outbox-186495@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/8] ALSA: usb: add RME Babyface Pro driver core
 (probe, PCM stream)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027113140.134257-2-i.bahloul01@gmail.com>
References: <20261027113140.134257-1-i.bahloul01@gmail.com>
 <20261027113140.134257-2-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 12:02:34 +0000
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
- [Medium] ALSA: usb: babyfacepro: return -ENOMEM on alloc failure in babyf=
ace_probe()
- [Medium] ALSA: usb: babyfacepro: reject stale prepared substream on sessi=
on change
- [Medium] ALSA: usb: babyfacepro: fix startup races in babyface_stream_sta=
rt()
- [Medium] ALSA: usb: babyfacepro: handle URB resubmit failures without wed=
ging stream
- [Medium] ALSA: usb: babyfacepro: missing endpoint type check in babyface_=
stream_start()
- [Low] ALSA: usb: babyfacepro: use per-card slot for index and id in babyf=
ace_probe()
- [Low] ALSA: usb: babyfacepro: document module parameters in kernel-parame=
ters.txt
--

commit 987d4560f049cb8d97cb2d1cddb245f93c85ffad
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: add RME Babyface Pro driver core (probe, PCM stream)

This commit adds the standalone ALSA USB driver core for the RME Babyface
Pro and Babyface Pro FS in proprietary mode (VID 0x2a39, PID 0x3fc0). It
implements cold-start device initialization, card lifecycle management, and
full-duplex PCM streaming over interrupt URBs on interface 5.

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> new file mode 100644
> index 0000000000000..81a3714623e5a
> --- /dev/null
> +++ b/sound/usb/babyfacepro/babyfacepro.c
> @@ -0,0 +1,1530 @@

[ ... ]

> +static bool babyface_urb_error(struct snd_usb_babyface *chip)
> +{
> +	if (atomic_inc_return(&chip->urb_err) < BF_URB_ERR_STOP)
> +		return false;
> +	schedule_work(&chip->stream_work);
> +	return true;
> +}
> +
> +/* A good URB ends a run of errors - unless the run has already reached
> + * BF_URB_ERR_STOP.  The URBs that got it there were not resubmitted, so
> + * the count has to stand until stream_work has seen it; clearing it
> + * here would leave the session running on fewer and fewer URBs.
> + */
> +static void babyface_urb_ok(struct snd_usb_babyface *chip)
> +{
> +	int err =3D atomic_read(&chip->urb_err);
> +
> +	while (err && err < BF_URB_ERR_STOP &&
> +	       !atomic_try_cmpxchg(&chip->urb_err, &err, 0))
> +		;
> +}
> +
> +/* An OUT URB that is not resubmitted leaves the queue. */
> +static void bf_out_lost(struct snd_usb_babyface *chip)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&chip->lock, flags);
> +	if (chip->out_inflight)
> +		chip->out_inflight--;
> +	spin_unlock_irqrestore(&chip->lock, flags);
> +}
> +
> +static void babyface_complete_in(struct urb *urb)
> +{

[ ... ]

> +resubmit:
> +	/* The session is being stopped: babyface_stream_kill() clears
> +	 * ->streaming before it kills the URBs.  A resubmit now would only
> +	 * fail against the kill and be counted as a stream error.
> +	 */
> +	if (!READ_ONCE(chip->streaming))
> +		return;
> +	ret =3D usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret < 0) {
> +		dev_err_ratelimited(&chip->dev->dev,
> +				    "IN resubmit failed: %d\n", ret);
> +		babyface_urb_error(chip);
> +	}
> +}
> +
> +static void babyface_complete_out(struct urb *urb)
> +{

[ ... ]

> +resubmit:
> +	/* The session is being stopped: babyface_stream_kill() clears
> +	 * ->streaming before it kills the URBs.  A resubmit now would only
> +	 * fail against the kill and be counted as a stream error.
> +	 */
> +	if (!READ_ONCE(chip->streaming))
> +		return;
> +	ret =3D usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret < 0) {
> +		dev_err_ratelimited(&chip->dev->dev,
> +				    "OUT resubmit failed: %d\n", ret);
> +		bf_out_lost(chip);
> +		babyface_urb_error(chip);
> +	}
> +}

[Severity: Medium]
Can a failed usb_submit_urb() in babyface_complete_in() or
babyface_complete_out() drop URBs from the session or wedge the stream
indefinitely?

When a URB completes with a negative urb->status and chip->urb_err is still
below BF_URB_ERR_STOP, the handler jumps to resubmit so the URB remains in
flight. However, if usb_submit_urb(urb, GFP_ATOMIC) fails at resubmit, that
URB is permanently lost from the queue while babyface_urb_error(chip) only
increments chip->urb_err by 1.

If another in-flight URB subsequently completes with status =3D=3D 0 while
chip->urb_err < BF_URB_ERR_STOP, babyface_urb_ok() resets chip->urb_err back
to 0, leaving the session running with fewer URBs in flight.

Furthermore, when chip->urbs_active is 2 (such as when one URB equals one
period, or when nurbs=3D2), if both URBs in one direction fail usb_submit_u=
rb(),
chip->urb_err only reaches 2, which is below BF_URB_ERR_STOP (3). Since the
hardware only advances the stream while both directions have a pending URB,
all completions stop, stream_work is never scheduled, and running PCM
substreams hang without entering SNDRV_PCM_STATE_XRUN.

Should a failed usb_submit_urb() in babyface_complete_in() or
babyface_complete_out() immediately trigger stream_work to stop the session?

[ ... ]

> +static int babyface_stream_start(struct snd_usb_babyface *chip)
> +{

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

[Severity: Medium]
What happens if a malformed or emulated USB device matching VID 0x2a39 and
PID 0x3fc0 exposes non-interrupt descriptors (for example,
USB_ENDPOINT_XFER_BULK with bInterval =3D=3D 0) for BF_EP_IN (0x82) or BF_E=
P_OUT
(0x01) on interface 5's altsettings 1, 2, or 3?

In babyface_stream_start(), chip->urbs_in[i] and chip->urbs_out[i] are
initialized with usb_fill_int_urb() using usb_rcvintpipe(chip->dev, BF_EP_I=
N)
and usb_sndintpipe(chip->dev, BF_EP_OUT) and submitted via usb_submit_urb()
without prior validation via usb_urb_ep_type_check() or usb_pipe_type_check=
().

In drivers/usb/core/urb.c, usb_submit_urb() only logs a warning when
usb_pipe_type_check() fails and still submits the PIPE_INTERRUPT URB to the
HCD without checking urb->interval if the endpoint descriptor's transfer ty=
pe
is bulk. On EHCI, submitting a PIPE_INTERRUPT URB against a bulk endpoint
with bInterval =3D=3D 0 can cause shift-out-of-bounds or a zero uperiod in
ehci_urb_enqueue() -> intr_submit() -> qh_make() -> qh_schedule() ->
check_period(), resulting in an infinite loop under ehci->lock with IRQs
disabled.

Should babyface_stream_start() (or probe across the altsettings) validate
chip->urbs_in[i] and chip->urbs_out[i] with usb_urb_ep_type_check() before
submitting them?

> +		/* The buffers come from usb_alloc_coherent(), so
> +		 * they are already DMA-mapped: hand the HCD the
> +		 * mapping instead of letting it map them again.
> +		 * Without this, usb_hcd_map_urb_for_dma() calls
> +		 * dma_map_single() on a coherent allocation, which
> +		 * fails with -EAGAIN on any host where that
> +		 * allocation is a vmap (IOMMU-backed dma-iommu,
> +		 * e.g. amd_iommu in its default translated mode).
> +		 */
> +		chip->urbs_in[i]->transfer_dma =3D chip->dma_in[i];
> +		chip->urbs_in[i]->transfer_flags |=3D
> +			URB_NO_TRANSFER_DMA_MAP;
> +		chip->urbs_out[i]->transfer_dma =3D chip->dma_out[i];
> +		chip->urbs_out[i]->transfer_flags |=3D
> +			URB_NO_TRANSFER_DMA_MAP;
> +	}
> +	/* A count left over from the previous session would stop this one
> +	 * as soon as a URB errors, or through a stream_work still queued.
> +	 */
> +	atomic_set(&chip->urb_err, 0);
> +	/* Mark the session live before the first URB goes out, not once the
> +	 * state is restored: the URBs complete while the vendor writes below
> +	 * are still running, and ->streaming is what says the session is
> +	 * theirs to keep going.  The error path clears it again.
> +	 */
> +	WRITE_ONCE(chip->streaming, true);
> +	for (i =3D 0; i < chip->urbs_active; i++) {
> +		ret =3D usb_submit_urb(chip->urbs_in[i], GFP_KERNEL);
> +		if (ret < 0)
> +			goto err;
> +		ret =3D usb_submit_urb(chip->urbs_out[i], GFP_KERNEL);
> +		if (ret < 0)
> +			goto err;
> +	}
> +	spin_lock_irq(&chip->lock);
> +	chip->out_inflight =3D chip->urbs_active;
> +	spin_unlock_irq(&chip->lock);
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
Could the ordering in babyface_stream_start() cause three startup races with
URB completions, bf_delay(), and concurrent trigger(START) calls?

First, chip->out_inflight is assigned after the usb_submit_urb(...,
GFP_KERNEL) loop. Since earlier URBs are already live on the bus while later
ones are being submitted, an early OUT URB completion that fails and calls
bf_out_lost(chip) will have its decrement of chip->out_inflight overwritten
when chip->out_inflight =3D chip->urbs_active runs after the loop, skewing
runtime->delay in bf_delay().

Second, chip->in_done is not initialized in babyface_stream_start(). If
babyface_pcm_pointer() -> bf_delay() runs before the first IN URB completes,
ktime_sub(ktime_get(), chip->in_done) is computed against 0 (or the previous
session's timestamp), clamping moved to a full URB of frames before any aud=
io
has transferred.

Third, WRITE_ONCE(chip->streaming, true) is set before the usb_submit_urb()
loop and the sleeping bf_vendor_write(chip, BF_REQ_SESSION_ARM, ...) call.
During that window, the other direction's substream (if already in
SNDRV_PCM_STATE_PREPARED) can enter babyface_pcm_trigger(SNDRV_PCM_TRIGGER_=
START)
without holding chip->mutex, observe chip->streaming =3D=3D true, and trans=
ition
to SNDRV_PCM_STATE_RUNNING. If usb_submit_urb() or BF_REQ_SESSION_ARM then
fails, the err path calls babyface_stream_kill(chip) without calling
babyface_pcm_stop_both(chip, SNDRV_PCM_STATE_XRUN), leaving that substream
stuck in SNDRV_PCM_STATE_RUNNING on a dead session.

Should chip->out_inflight and chip->in_done be initialized under chip->lock
before submitting URBs, and should the err path in babyface_stream_start()
also stop any running substreams via babyface_pcm_stop_both()?

[ ... ]

> +static int babyface_pcm_prepare(struct snd_pcm_substream *subs)
> +{
> +	struct snd_usb_babyface *chip =3D snd_pcm_substream_chip(subs);
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	mutex_lock(&chip->mutex);
> +	if (chip->shutdown)
> +		ret =3D -ENODEV;
> +	else if (subs->runtime->rate !=3D chip->rate ||
> +		 subs->runtime->period_size < bf_session_period(chip))
> +		/* The other direction changed the rate or the URBs since
> +		 * this one was set up: it has to be set up again.
> +		 */
> +		ret =3D -EINVAL;
> +	else if (!chip->streaming)
> +		ret =3D babyface_stream_start(chip);
> +	mutex_unlock(&chip->mutex);
> +	if (ret < 0)
> +		return ret;
> +
> +	spin_lock_irqsave(&chip->lock, flags);
> +	chip->hw_ptr[subs->stream] =3D 0;
> +	chip->prev_period[subs->stream] =3D 0;
> +	spin_unlock_irqrestore(&chip->lock, flags);
> +	return 0;
> +}
> +
> +static int babyface_pcm_trigger(struct snd_pcm_substream *subs, int cmd)
> +{
> +	struct snd_usb_babyface *chip =3D snd_pcm_substream_chip(subs);
> +	unsigned long flags;
> +
> +	switch (cmd) {
> +	/* The session runs from prepare to hw_free; START and STOP only
> +	 * decide whether the URB handlers move this substream's audio.
> +	 */
> +	case SNDRV_PCM_TRIGGER_START:
> +		/* A URB error may have stopped the session since prepare. */
> +		if (!READ_ONCE(chip->streaming))
> +			return -EPIPE;
> +		spin_lock_irqsave(&chip->lock, flags);
> +		chip->hw_ptr[subs->stream] =3D 0;
> +		chip->prev_period[subs->stream] =3D 0;
> +		spin_unlock_irqrestore(&chip->lock, flags);
> +		return 0;

[Severity: Medium]
Can a substream that is already in SNDRV_PCM_STATE_PREPARED bypass the rate
and period_size check in babyface_pcm_prepare() when the same process
reconfigures the other direction in babyface_pcm_hw_params()?

When a single process owns both directions, bf_other_holds_clock() returns
false, allowing babyface_pcm_hw_params() on the second direction to change
chip->rate or chip->urb_frames and chip->urbs_active. To force the first
direction to be reconfigured, babyface_pcm_hw_params() calls
babyface_pcm_stop_both(chip, SNDRV_PCM_STATE_XRUN):

    snd_pcm_stream_lock_irqsave(subs, flags);
    if (snd_pcm_running(subs))
            snd_pcm_stop(subs, state);
    snd_pcm_stream_unlock_irqrestore(subs, flags);

However, if the first substream was prepared (note that alsa-lib's
snd_pcm_hw_params() automatically calls snd_pcm_prepare()) but not yet
started, snd_pcm_running(subs) is false and that substream remains in
SNDRV_PCM_STATE_PREPARED.

Once the second direction calls babyface_pcm_prepare() and restarts
chip->streaming with the new rate or larger URB size, the first substream c=
an
call SNDRV_PCM_IOCTL_START, which invokes babyface_pcm_trigger(subs,
SNDRV_PCM_TRIGGER_START) directly without re-running babyface_pcm_prepare().
Because babyface_pcm_trigger() only checks READ_ONCE(chip->streaming), the
first substream starts running with a stale runtime->rate or with
runtime->period_size (and potentially runtime->buffer_size) smaller than
chip->urb_frames, causing babyface_capture_copy() or babyface_playback_copy=
()
to wrap around the ring buffer within a single URB completion.

Should babyface_pcm_trigger() also verify that subs->runtime->rate =3D=3D
chip->rate and subs->runtime->period_size >=3D bf_session_period(chip) on
SNDRV_PCM_TRIGGER_START?

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
Should these new module parameters (index, id, frames_per_urb, urb_frames_m=
in,
and nurbs) be documented in Documentation/admin-guide/kernel-parameters.txt?

[ ... ]

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
Does hardcoding index[0] and id[0] in babyface_probe() break multi-device
probing when module parameters are used?

Since index and id are declared as SNDRV_CARDS arrays with
module_param_array(), passing index[0] and id[0] unconditionally to
snd_card_new() ignores elements 1..SNDRV_CARDS - 1 and causes a second
Babyface Pro unit to fail in snd_card_new() with -EBUSY if a non-default
index[0] or id[0] was specified.

[ ... ]

> +	err =3D bf_cold_init(chip);
> +	if (err < 0) {
> +		dev_err(&intf->dev, "cold init failed: %d\n", err);
> +		goto error;
> +	}
> +
> +	/* Keep the allocation size independent of the active USB mode. */
> +	urbsize =3D BF_WORDS_PER_FRAME * sizeof(u32) * chip->frames_per_urb;
> +	chip->urbs_in =3D kcalloc(chip->nurbs, sizeof(*chip->urbs_in), GFP_KERN=
EL);
> +	chip->urbs_out =3D kcalloc(chip->nurbs, sizeof(*chip->urbs_out), GFP_KE=
RNEL);
> +	chip->buf_in =3D kcalloc(chip->nurbs, sizeof(*chip->buf_in), GFP_KERNEL=
);
> +	chip->buf_out =3D kcalloc(chip->nurbs, sizeof(*chip->buf_out), GFP_KERN=
EL);
> +	chip->dma_in =3D kcalloc(chip->nurbs, sizeof(*chip->dma_in), GFP_KERNEL=
);
> +	chip->dma_out =3D kcalloc(chip->nurbs, sizeof(*chip->dma_out), GFP_KERN=
EL);
> +	if (!chip->urbs_in || !chip->urbs_out || !chip->buf_in ||
> +	    !chip->buf_out || !chip->dma_in || !chip->dma_out)
> +		goto error;
> +
> +	for (i =3D 0; i < chip->nurbs; i++) {
> +		chip->urbs_in[i] =3D usb_alloc_urb(0, GFP_KERNEL);
> +		chip->urbs_out[i] =3D usb_alloc_urb(0, GFP_KERNEL);
> +		chip->buf_in[i] =3D usb_alloc_coherent(dev, urbsize, GFP_KERNEL,
> +						     &chip->dma_in[i]);
> +		chip->buf_out[i] =3D usb_alloc_coherent(dev, urbsize, GFP_KERNEL,
> +						      &chip->dma_out[i]);
> +		if (!chip->urbs_in[i] || !chip->urbs_out[i] ||
> +		    !chip->buf_in[i] || !chip->buf_out[i])
> +			goto error;
> +	}

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

[Severity: Medium]
Does babyface_probe() return 0 to the USB core when any of the URB or
DMA-coherent buffer allocations fail?

After bf_cold_init(chip) succeeds (or after bf_state_apply_flags(chip)
succeeds in later commit 7aa91fef1871), err is 0. If any kcalloc(),
usb_alloc_urb(), or usb_alloc_coherent() call returns NULL, babyface_probe()
jumps to error without setting err =3D -ENOMEM, frees chip->card via
snd_card_free(), and returns 0, leaving the USB interface bound with NULL
intfdata and a freed card.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113140.1342=
57-1-i.bahloul01@gmail.com?part=3D1
