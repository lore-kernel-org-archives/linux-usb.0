Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141680;
	b=0l+y8zv9NrXkzExSACLA1DYyO/nr7V1MAVTTZ1AwaOoTm6tU0WAVPQLxNjs4d+0OZJbV
	 JHKv2kZ2aKkgklxG0BxhDAiucpjNavaQdFwWFD7/vSR4+pYBfOTQgYwKfVGUaR1VXxw1L
	 tLBBK60o+iKoRaTo6y57ixoFdSi4jWXCUABWVZfJlz4cx54FFKr6AAIMi9UGFsN6iwcJB
	 1cGytNxbjc3VXynRF1hzikDEQSVPpubgb4jk8a7u9hPiO6hTC72aBc3VB0FRh3TMjwQc2
	 MqZ9BQQ/0V98MyNCdHkGhxlzw7mpjEyTqfmZi+kSg+rQawv2zOy4YbGKZNcTtPknQRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141680;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kt2/MH53m1HYG8SXlKsz3xKUUn1Po5hWtpj/iDhYn30=;
	b=EHO9xQb4SiEygfkPNjFWBvgpmFl1V6AutEs6ZWMCNAUXEeOLrVDwJBD/fyJjsOvNez5H
	 +c10T23iqkS0ugirtRbP2b8OvJX9egyOsWkhShmPNfYOyE1Wavqa0ciMe6ixTmb3ZITm8
	 lmXrvr0GOaW8M+dEnBNZORMDaFE1uWFbNkZUJIq/3mc201lFdlk8xUHkim7Nk2jV7HMR2
	 ok7rPNl3QEumF+4vad7NCw9qA0t63JGwSTEoiPssAxeruGkRw0a5iCFY2icfDnI7AWbxm
	 SjZE9bZtNt+1V8XUG/2u5AnKNcEa3xnrg0TTuDsVbbauCVfydwmkhh5B4ZLXk0DNeRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHqDesZg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C4B606A31C
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHqDesZg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861C71F0089F;
	Sun,  8 Nov 2026 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794141679;
	bh=Kt2/MH53m1HYG8SXlKsz3xKUUn1Po5hWtpj/iDhYn30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jHqDesZgcvfyXrT+8vlnay1WeOtdtyc6GqqYgG1cOS+lqbq+/NcMblDN+uIX4w1WN
	 trCQ+DY9fA0scrBnZCpybXO0gaRjHTahiE2iw1Od1s4/qQzZAXXZ+VO02U7j2uBHVJ
	 R5Zwcj2gnlVpF9hXTK1h+6BAxLamHCL2k3dAMQZECTGY0BHzNDwFqkbAWjGuuHR2Kc
	 Ue+qg25YCZL4ZlKbCahXZP8Mew7uawvN1v0uWi3Q8bzdSJKqnnbD/xWCWPj9t+Ec3n
	 NjSxPh01RS8Rge/gUolSiXseLyJUjCZdjZ9GnCEUMb/kmoaf/nmFxqKiI9ZEhNMXhF
	 vOrFHn0IfekoA==
Message-ID: <sashiko-outbox-203739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: disable OUT ep and drain
 work on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261108122645.421721-1-hj351016@gmail.com>
References: <20261108122645.421721-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 12:41:19 +0000
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
- [High] usb: gadget: f_uac1_legacy: sleep in atomic in
  f_audio_disable()
- [High] usb: gadget: f_uac1_legacy: double free and ERR_PTR deref in
  f_audio_disable()
- [Low] usb: gadget: f_uac1_legacy: inaccurate Fixes tag in commit
  message
--

commit 167ec12aa25bf4c3879c873681717d3fce869739
Author: Hyunjung Ko <hj351016@gmail.com>

> usb: gadget: f_uac1_legacy: disable OUT ep and drain work on teardown
>
> f_uac1_legacy enables the OUT endpoint in f_audio_set_alt() and queues
> usb_requests whose completion handler f_audio_complete() dereferences the
> f_audio (req->context) and audio->out_ep, and which schedules
> audio->playback_work. However f_audio_disable() is empty and neither
> f_audio_unbind() nor f_audio_free() disables the endpoint or drains the
> work, so on teardown:
>
>  - f_audio_complete() can run after kfree(audio) (the UDC gives back
>    pending requests on the still-enabled endpoint during unbind), using
>    freed memory -- a use-after-free; and
>  - a playback_work still pending runs f_audio_playback_work() against the
>    freed f_audio -- a second use-after-free.
>
> Implement f_audio_disable() to quiesce the function properly: disable the
> OUT endpoint (which gives back outstanding requests, so f_audio_complete()
> stops touching @audio and no new work is queued), then cancel_work_sync()
> the playback work, then free the buffers left on audio->play_queue and
> audio->copy_buf (f_audio_playback_work() is the only consumer, so a
> cancelled work would otherwise leak them).
>
> The endpoint is disabled before the work is cancelled, and the work is
> cancelled before f_audio_free() runs gaudio_cleanup() on audio->card that
> u_audio_playback() dereferences, so none of them race the teardown.
>
> Found by static analysis and an automated reviewer; the playback_work
> use-after-free was reproduced with KASAN under dummy_hcd (slab-use-after-
> free in u_audio_playback() from f_audio_playback_work() after
> f_audio_free(); a delay was added to the streaming path to make the
> schedule-vs-free race deterministic). The out_ep/f_audio_complete
> use-after-free is established by code inspection.
>
> Fixes: f3a3406b3f56 ("usb: gadget: f_uac1: convert to new function interf=
ace with backward compatibility")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>

[Severity: Low]
The empty f_audio_disable() stub and the teardown lifecycle without
disabling out_ep or draining playback_work date back to the initial driver
commit rather than f3a3406b3f56 ("usb: gadget: f_uac1: convert to new
function interface with backward compatibility").  Should the Fixes tag be:

  Fixes: c6994e6f067c ("USB: gadget: add USB Audio Gadget driver")

> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/ga=
dget/function/f_uac1_legacy.c
> index 7c8d60c7e87d1..0f937a7bd33b0 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -697,7 +697,35 @@ static int f_audio_get_alt(struct usb_function *f, u=
nsigned intf)
> =20
>  static void f_audio_disable(struct usb_function *f)
>  {
> -	return;
> +	struct f_audio *audio =3D func_to_audio(f);
> +	struct f_audio_buf *buf;
> +
> +	/*
> +	 * Disable the OUT endpoint first: the UDC gives back any outstanding
> +	 * usb_requests, so f_audio_complete() stops dereferencing @audio and
> +	 * no new playback_work is queued. Then drain the work and free the
> +	 * buffers it would otherwise have consumed, before the function is
> +	 * unbound and freed.
> +	 */
> +	if (audio->out_ep)
> +		usb_ep_disable(audio->out_ep);
> +
> +	cancel_work_sync(&audio->playback_work);

[Severity: High]
Can cancel_work_sync(&audio->playback_work) be called from
f_audio_disable()?

The usb_function.disable callback is invoked by reset_config() while
holding spinlocks in atomic context, for example via
__composite_disconnect() under spin_lock_irqsave(&cdev->lock, flags) or
via composite_setup() -> set_config() -> reset_config() under
spin_lock(&cdev->lock) in UDC interrupt context.  Because cancel_work_sync()
calls might_sleep() and blocks waiting for f_audio_playback_work() to
finish, a USB disconnect, reset, or reconfiguration will sleep in atomic
context and can deadlock.

> +
> +	/*
> +	 * The endpoint is disabled and the work is drained, so nothing else
> +	 * can touch the queue now; free the leftover buffers.
> +	 */
> +	while (!list_empty(&audio->play_queue)) {
> +		buf =3D list_first_entry(&audio->play_queue,
> +				       struct f_audio_buf, list);
> +		list_del(&buf->list);
> +		f_audio_buffer_free(buf);
> +	}
> +	if (audio->copy_buf) {
> +		f_audio_buffer_free(audio->copy_buf);
> +		audio->copy_buf =3D NULL;
> +	}
>  }

[Severity: High]
Can freeing audio->copy_buf here cause a use-after-free and double free, or
dereference an error pointer?

When the host selects altsetting 0 in f_audio_set_alt(), audio->copy_buf is
queued onto audio->play_queue without clearing audio->copy_buf:

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
    ...
		} else {
			struct f_audio_buf *copy_buf =3D audio->copy_buf;
			if (copy_buf) {
				list_add_tail(&copy_buf->list,
						&audio->play_queue);
				schedule_work(&audio->playback_work);
			}
		}
    ...
}

The same stale pointer is left behind if f_audio_buffer_alloc() fails in
f_audio_out_ep_complete() after adding copy_buf to audio->play_queue.  When
f_audio_disable() later runs, that buffer has already been freed by
f_audio_playback_work() or by the play_queue loop right above, so
f_audio_buffer_free(audio->copy_buf) reads audio_buf->buf from freed memory
and double-frees both allocations.

In addition, f_audio_buffer_alloc() returns ERR_PTR(-ENOMEM) on failure,
which f_audio_set_alt() stores directly in audio->copy_buf; checking
if (audio->copy_buf) treats ERR_PTR(-ENOMEM) as non-NULL and dereferences
it in f_audio_buffer_free().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108122645.4217=
21-1-hj351016@gmail.com?part=3D1
