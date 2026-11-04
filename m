Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785092;
	b=kTvswaGHRKZM6wJDSZY/QkYa6fGtJoX/c7S/57MIApEHzsW0ydgTidmqq8FivfC3JFqx
	 hvoqSiFOHi42PSBBBrk7JAL5+tYGijAbNlRsb2XFGYIMJJnCMH/qBsL4T8TYKiin5oxtQ
	 jj7WU+1SfvZNVydf9Ylqpxo0FUamV9lLctinlE/zTkhrf+Bxc3ncQm7jl+wa+QmWa3NiU
	 X6pRYO0Mt01LIxUAkeimTcpmzv0sn/iDBhnOZPnWy6ZDmqIyeNJwOtDTKEhdseKEKprNE
	 5O6cpFM2nbdrJf9wLjeCPvxu+uxhnI5yV2CQxEGhBHWM5Mxez5yJaw9XDurVkUWaS/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785092;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=adZp0B49J/UgkcOqYsHF8wFL/UnOXi8aefOeaihfpZw=;
	b=sSE6fV3RehZtAtISnHr162F3QdeYmC/vIzxJT5nLOT7mnNFDVpn4CNdz9TjQH1hIbsTp
	 qYp+dIOqe8Fk5WSxHcpGaz10tjHPBNfwdkrSpDZzlsdib+h2cXx4HhIEDylZ5D2eFYpZH
	 WkPchnDNj1N9veHomub7a4lw6H4l9Ad2l/zpLqTJ1A9javXm20dFrLR3rWa3GoGefk2kt
	 2uwQw5I0yGPaKTTAwM89oeWMN5RN6lJDql/H6f0tMbxWGiaSvZiUt4/IDqfpC6qlTsSlZ
	 +uJptmFiecMqjxdQDpWCROrmwJTE9t5et1LWryAvbi/GwZoaA9v+cvqs0dkNnm2iSRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aliYgSaM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0E9606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aliYgSaM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845CA1F000C1;
	Wed,  4 Nov 2026 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793785091;
	bh=adZp0B49J/UgkcOqYsHF8wFL/UnOXi8aefOeaihfpZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aliYgSaMkL+q4+mZd+5VVnGUEvhPldJXDk93AJ9Ya/ST47GVm41t1xKDujB+L2Rv4
	 YQ4mrEX6ShWiVQVQyXjApvPsCnB/SghxT3CJ56zpDVaejLCEgetFGRikVPN8Ju5OAV
	 psFNMDFgPg9RiU7cavbUnYDvWvaEQ8pFzu2x/NTiGv8BVrkoobWNBF3VHBgQ/zTcWJ
	 vWHaW8BLQNC0nKzAvIhmHXuDvGF3vdUofiN/O5hxavlet6YR7MsCshWtIJKEdEpI28
	 +1TXI/1SSGZe1iOCeEn5SbqIdzt5TRNUUgov7tyZ1H+pGLkcnyINmz0uqhgoeWpBMq
	 ZajaFc+ytzX/w==
Message-ID: <sashiko-outbox-196974@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: u_audio: read period size while holding
 stream lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179378417544.69464.16164899430939223277@gmail.com>
References: <179378417544.69464.16164899430939223277@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 09:38:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] usb: gadget: u_audio: race with close in snd_pcm_period_elapse=
d() after unlock
--

commit a295a8414332708b19b9379c3e997a95e5d868c8
Author: Yaohan Li <shunsheng1218@gmail.com>

usb: gadget: u_audio: read period size while holding stream lock

This commit moves the snd_pcm_lib_period_bytes() call in
u_audio_iso_complete() inside the substream lock critical section to avoid
reading substream->runtime after unlocking.

> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index f0ee83abcebc7..7f378858146a1 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -156,6 +156,7 @@ static void u_audio_iso_complete(struct usb_ep *ep, s=
truct usb_request *req)
>  	struct uac_rtd_params *prm =3D req->context;
>  	struct snd_uac_chip *uac =3D prm->uac;
>  	unsigned int frames, p_pktsize;
> +	unsigned int period_bytes;
>  	unsigned long long pitched_rate_mil, p_pktsize_residue_mil,
>  			residue_frames_mil, div_result;
> =20
> @@ -267,9 +268,10 @@ static void u_audio_iso_complete(struct usb_ep *ep, =
struct usb_request *req)
>  	/* update hw_ptr after data is copied to memory */
>  	prm->hw_ptr =3D (hw_ptr + req->actual) % runtime->dma_bytes;
>  	hw_ptr =3D prm->hw_ptr;
> +	period_bytes =3D snd_pcm_lib_period_bytes(substream);
>  	snd_pcm_stream_unlock(substream);
> =20
> -	if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
> +	if ((hw_ptr % period_bytes) < req->actual)
>  		snd_pcm_period_elapsed(substream);

[Severity: Critical]
Can snd_pcm_period_elapsed() still race with a concurrent close once
u_audio_iso_complete() calls snd_pcm_stream_unlock(substream)?

Because uac_pcm_ops does not implement .sync_stop and card->sync_irq is not
set, snd_pcm_sync_stop() is a no-op. As soon as u_audio_iso_complete() drops
the stream lock, a concurrent close in
snd_pcm_release()->snd_pcm_release_substream() can complete snd_pcm_drop(),
run do_hw_free(), and enter snd_pcm_detach_substream(), which executes
without holding pcm_stream_lock:

sound/core/pcm.c:snd_pcm_detach_substream() {
	...
	if (substream->timer) {
		scoped_guard(spinlock_irq, &substream->timer->lock)
			substream->runtime =3D NULL;
	} else {
		substream->runtime =3D NULL;
	}
	mutex_destroy(&runtime->buffer_mutex);
	snd_fasync_free(runtime->fasync);
	kfree(runtime);
	...
}

When (hw_ptr % period_bytes) < req->actual is true, u_audio_iso_complete()
then calls snd_pcm_period_elapsed()->snd_pcm_period_elapsed_under_stream_lo=
ck():

sound/core/pcm_lib.c:snd_pcm_period_elapsed_under_stream_lock() {
	struct snd_pcm_runtime *runtime;

	if (PCM_RUNTIME_CHECK(substream))
		return;
	runtime =3D substream->runtime;

	if (!snd_pcm_running(substream) ||
	    snd_pcm_update_hw_ptr0(substream, 1) < 0)
		goto _end;
	...
 _end:
	snd_kill_fasync(runtime->fasync, SIGIO, POLL_IN);
}

If snd_pcm_detach_substream() has already cleared substream->runtime,
PCM_RUNTIME_CHECK(substream) triggers a kernel warning via snd_BUG_ON(). If
snd_pcm_detach_substream() clears substream->runtime and frees runtime right
after PCM_RUNTIME_CHECK(substream) passes, snd_pcm_running(substream)
dereferences a NULL or freed substream->runtime, and snd_kill_fasync() reads
runtime->fasync from the freed runtime struct.

Would calling snd_pcm_period_elapsed_under_stream_lock(substream) before
snd_pcm_stream_unlock(substream) avoid dropping and reacquiring the stream
lock across the period check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179378417544.69464.=
16164899430939223277@gmail.com?part=3D1
