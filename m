Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794125607;
	b=KjWYZCzyeWV0HAOeF3/V0SB+UHaJbtqkLvodq59UFx11W50U8/RG2sJO9wUWE9qW84fx
	 1wbOKR/gYDyo9hPi2C+Qvv0rhTuHCVmHOOWnHDZOwhvnYjpb3HUBpOhHNHkOZdw8Zrh8J
	 73z29q7mObaY43Jps6I6eT9UVJOD3IMyJ5mW60YgmkaQenGVWvQFSyiDT87wEfKrfrGko
	 +UDYu3vlXENOjQbCSjdsO+MjtpuZ7eLQACEr3fQjl7e62bRDVqUTla4butWopEAOWItOf
	 I4VruTXADqpCalcXpnkhAiHd332OX5e1kjfVdgBI9etQPgoh3EaI5ZT/RfGRONs/60w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794125607;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=haZMi2kLmRr+HCcUojX8392H22F9+odjqewThIiV7BI=;
	b=P8A1Hr5wogBPP82BAqoUPMx2nJzZtfPIoq7a7pz9iNoDLTgyrkDF6nlC349C8cjbUCO/
	 91E4a+S0YTBxGo4VDP6jlxSS00I9T3aoBSgsBI0dQKkQYaisA67z/9AdXt7SSTgqPmQun
	 ds2HL/f1fm1R+t3HSLRE3Hg8GSxIf6c3zXdJH8wdOQ4fHPT+M58zOQNet3o4IKDiwcTos
	 s1mzbXROnPPQQ3liNGZ/Xzv7PzboDmmVE7GztpOSLY7VgDftQP/fF+XOEkndbHVeVfqrO
	 /bGWPd/IJamU8p36dwD1Vj2hBatl/2aH0KEcrm5VWqAQQeSU8pHJF1wlYSela7AMxhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=loVjCt6o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9BF606A31C
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=loVjCt6o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCDD1F0089F;
	Sun,  8 Nov 2026 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794125607;
	bh=haZMi2kLmRr+HCcUojX8392H22F9+odjqewThIiV7BI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=loVjCt6oPnOLtsCJD0hHnuQ8Pgh8a4KllDtVtD1bEZDWF1p7rgMewD1+n1bcHcsCo
	 OrXk8ZNLAmuQfVmmUsxegwvSv8HRKt1hpGJNgTjnLhMguxtsSjOz6mVmNzofRpuHGH
	 WPqLOApq4ja/pTgEQzy305eif4aoQfso5fM9wHM8aYhjRWTBwYJ4GGM6yjgU/jdV+m
	 2tJ9dmCuIhbzEe3orcJ9SxqqjeQTmM/e+C6k/4CNIDhiQqHbNFeJ7ayOePHsXylcVq
	 wCAAvAevps8qQ96nLzl3BhsRqaxCSD+e38QEvqJrE6o1tdRJmLa8SWTTvlTceUcfVX
	 y1U1bBaivhOnA==
Message-ID: <sashiko-outbox-203644@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: cancel playback_work before
 freeing f_audio
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261108075116.251501-1-hj351016@gmail.com>
References: <20261108075116.251501-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 08:13:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] usb: gadget: f_uac1_legacy: cancel_work_sync() after
  gaudio_cleanup()
- [Medium] usb: gadget: f_uac1_legacy: play_queue buffer leak in
  f_audio_free()
- [Low] usb: gadget: f_uac1_legacy: Fixes tag cites file rename commit
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] usb: gadget: f_uac1_legacy: use-after-free in
  f_audio_complete() due to undisabled out_ep [1]
--

commit 12cbf9965abf5188436aa00e354e601adc2d615b
Author: Hyunjung Ko <hj351016@gmail.com>

> usb: gadget: f_uac1_legacy: cancel playback_work before freeing f_audio
>
> The OUT endpoint completion (f_audio_out_ep_complete) and the set_alt path
> schedule audio->playback_work, whose handler (f_audio_playback_work)
> dereferences the f_audio (audio->lock, audio->play_queue, audio->card).
> On teardown f_audio_free() frees the f_audio with kfree(audio) but never
> cancels playback_work -- f_audio_disable() is empty and nothing else
> drains it. A playback_work still pending when the function is freed runs
> against freed memory, a use-after-free.
>
> Cancel playback_work in f_audio_free() before kfree(audio). By then the
> function is unbound and the OUT endpoint is disabled, so the work cannot
> be re-queued and cancel_work_sync() is sufficient.
>
> This was reproduced with KASAN as a slab-use-after-free in
> u_audio_playback(), reached from f_audio_playback_work(), under dummy_hcd:
> with a UAC1 playback stream active, unlinking the configfs function frees
> the f_audio in f_audio_free() while the work is still in flight. A delay
> was added to the gadget streaming path to make the schedule-vs-free race
> land deterministically; the missing cancel is present regardless. With
> this patch applied the splat no longer occurs.
>
> Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implemen=
tation legacy")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>

[Severity: Low]
Commit d355339eecd9 ("usb: gadget: function: make current f_uac1
implementation legacy") only renamed f_uac1.c to f_uac1_legacy.c.  Should
the Fixes: tag point to f3a3406b3f56 ("usb: gadget: f_uac1: convert to new
function interface with backward compatibility"), which introduced
f_audio_free() without cancelling playback_work?

> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/ga=
dget/function/f_uac1_legacy.c
> index 7c8d60c7e87d1..2dca5cda8cfd7 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -945,6 +945,12 @@ static void f_audio_free(struct usb_function *f)
> =20
>  	gaudio_cleanup(&audio->card);
>  	opts =3D container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
> +	/*
> +	 * The function is already unbound, so the OUT endpoint can no longer
> +	 * queue playback_work. Drain any work still pending before the
> +	 * containing f_audio is freed, otherwise it runs against freed memory.
> +	 */
> +	cancel_work_sync(&audio->playback_work);
>  	kfree(audio);

[Severity: Medium]
Should cancel_work_sync(&audio->playback_work) be called before
gaudio_cleanup(&audio->card)?

f_audio_playback_work() calls u_audio_playback(&audio->card, ...), which
reads substream->runtime from card->playback.substream and loops back to
try_again when snd_pcm_kernel_write() fails.  Calling gaudio_cleanup()
first closes card->playback.filp while playback_work may still be running,
which can free substream->runtime underneath u_audio_playback() or leave it
retrying in try_again while cancel_work_sync() waits.

[Severity: Medium]
Does cancelling audio->playback_work here leak buffers left on
audio->play_queue (as well as audio->copy_buf)?

f_audio_out_ep_complete() and f_audio_set_alt() append each allocated
struct f_audio_buf to audio->play_queue and schedule audio->playback_work,
and f_audio_playback_work() is the only place that dequeues and frees them
with f_audio_buffer_free().  When cancel_work_sync() cancels a pending work
item, or when more than one buffer is queued, the remaining buffers on
audio->play_queue are never freed before kfree(audio).

[Severity: Critical]
This problem wasn't introduced by this patch, but nothing disables
audio->out_ep before f_audio_free() runs [1], so can
f_audio_complete() still race with teardown and use audio after free?

When the host selects alternate setting 1, f_audio_set_alt() enables
audio->out_ep and queues usb_request objects with req->context =3D audio and
req->complete =3D f_audio_complete, while f_audio_disable() is a no-op and
neither f_audio_set_alt(), f_audio_unbind(), nor f_audio_free() calls
usb_ep_disable(audio->out_ep):

CPU0                                  CPU1
f_audio_free()
  cancel_work_sync(&audio->playback_work)
  kfree(audio)
                                      f_audio_complete()
                                        audio =3D req->context
                                        out_ep =3D audio->out_ep <-- use-af=
ter-free
                                        f_audio_out_ep_complete()
                                          schedule_work(&audio->playback_wo=
rk)

During gadget_unbind_driver(), udc->driver->unbind() runs before
usb_gadget_udc_stop_locked() gives back pending requests on the enabled
endpoint with -ESHUTDOWN, so f_audio_complete() can also be invoked after
f_audio is freed.

[1] https://sashiko.dev/#/bug/linux-7598f007-24ed-4b73-bc9a-a11e4ec9838e

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108075116.2515=
01-1-hj351016@gmail.com?part=3D1
