Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793271;
	b=Tcw6Seua+dV2vQDdchS/WSfhOqi19ABUYtjT9d/DAWqU1K0ff4HN/P5SRCC9RUv4faQE
	 fNP+WlbJfKu68JmyjmPJQOBKtrRg3YHk5qiP6VLq1HgFeJkz3IknNnUG9K2Axijo7o48T
	 dp8ClVBpWDiPUVMXSk5wUzPnXJOYWCdLjjdbUFC40V3cXzOLnn0MV8uBuqBz9gciSpNrq
	 Slswn/8F+J7gDfSHD8i1H6mkfC7+YOq4Ij179HnLTR/b0qFnrC7BxABK7uH1yTzGEvrgL
	 D3kSSIe12eqxFxoHSzbvJbPfpfhY8pj1nVqGSWAP73WSavWLVdb3nlXSBQ8KWRNY7/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793271;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=deO9RT75QAB1xxeICGD3wHrLNGVoeRt2aYx5QVxMfKo=;
	b=U2zGBpLcD0cfWe/A0zxSWBI6whxm8227K5odWcMZNSTMe2xAz9Dh4QYgwjdFnci/Tzgo
	 jqBoR+2d07HJBDbXoijH6kBc6ctkuXJ7ThzVp4bZpQ/BEL1LuXnufT6JPK53+hLBljZil
	 hWsC4KgJ+tDL6jzltVDGXQrj6dh7lb/TODiVBIEX+bWXSjYD0p7mjm3Se6+DBfItYJVc8
	 KFT07K04byDkGveFIey9vPol3Qex7W+kHzI12tcpeG8SJX9GjoCQDBnJ5nu3nNR+BQj5R
	 UBKt5GCssZzgGDFx1mny9soCdA9qOeAEN5Y+wjfcLRu3zyK8wu6zZYbo5MqZH5e0D1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H11+r+kX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C6606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H11+r+kX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF481F000C1;
	Wed,  4 Nov 2026 11:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793793271;
	bh=deO9RT75QAB1xxeICGD3wHrLNGVoeRt2aYx5QVxMfKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H11+r+kXwG3A3UwOE09iT3af4vzBwpmvrTXiZceTzz0II5/f9w+ZYdcgzpMX5LNmW
	 7G3Aw9BWVnhniEISrD7XWq8NqF+RiGEmAHvNQzpBDJ0DgneAJkwK7EVVsvfMlGuqC9
	 dJBKIl4V+6Q4c+NnmaJZ+iah5pHEmiaK0AFaaMN6IawTRu+L9wNrKVADEpOa0Av2/G
	 odghZ7dAaWzvAQpKttzoco78nOE0Ps/BPd7XczgBCzgBuldbQGP7SIZVYMSYMywVqR
	 lTkfdQoKnf0osQ1fSlKlJZp6VT1BQ7BPIFv5XtIk0ALAxzNjLNkKdx64QU4HaV1NBY
	 XkIM3wayEcPRg==
Message-ID: <sashiko-outbox-197214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_uac1_legacy: cancel playback work and
 drain buffers on free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104114506.1596023-1-tristmd@gmail.com>
References: <20261104114506.1596023-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:54:30 +0000
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
- [Critical] usb: gadget: f_uac1_legacy: double-free of copy_buf in f_audio=
_free()
--

commit fcd9ff7ea98907dc1b23d26f7dc74bbae03e0203
Author: Tristan Madani <tristan@talencesecurity.com>

usb: gadget: f_uac1_legacy: cancel playback work and drain buffers on free

This commit updates f_audio_free() to cancel pending playback work, drain a=
nd
free any buffers remaining on play_queue, and free audio->copy_buf during
gadget teardown.

> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/ga=
dget/function/f_uac1_legacy.c
> index 7c8d60c7e87d1..88c816b4ba119 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
[ ... ]
> @@ -942,7 +943,17 @@ static void f_audio_free(struct usb_function *f)
>  {
>  	struct f_audio *audio =3D func_to_audio(f);
>  	struct f_uac1_legacy_opts *opts;
> -
> +	struct f_audio_buf *buf, *tmp;
> +
> +	cancel_work_sync(&audio->playback_work);
> +	list_for_each_entry_safe(buf, tmp, &audio->play_queue, list) {
> +		list_del(&buf->list);
> +		if (buf =3D=3D audio->copy_buf)
> +			audio->copy_buf =3D NULL;
> +		f_audio_buffer_free(buf);
> +	}
> +	if (!IS_ERR_OR_NULL(audio->copy_buf))
> +		f_audio_buffer_free(audio->copy_buf);

[Severity: Critical]
Can this still double-free audio->copy_buf if f_audio_playback_work()
already dequeued and freed it before f_audio_free() drains play_queue?

When f_audio_set_alt() is called with alt =3D=3D 0 on the AudioStreaming
interface, it queues audio->copy_buf onto audio->play_queue and schedules
playback_work without clearing audio->copy_buf:

	struct f_audio_buf *copy_buf =3D audio->copy_buf;
	if (copy_buf) {
		list_add_tail(&copy_buf->list,
				&audio->play_queue);
		schedule_work(&audio->playback_work);
	}

A similar situation occurs in f_audio_out_ep_complete() if audio->copy_buf
is queued onto audio->play_queue and the subsequent f_audio_buffer_alloc()
fails and returns -ENOMEM before updating audio->copy_buf:

	if (audio_buf_size - copy_buf->actual < req->actual) {
		spin_lock_irq(&audio->lock);
		list_add_tail(&copy_buf->list, &audio->play_queue);
		spin_unlock_irq(&audio->lock);
		schedule_work(&audio->playback_work);
		copy_buf =3D f_audio_buffer_alloc(audio_buf_size);
		if (IS_ERR(copy_buf))
			return -ENOMEM;
	}

When f_audio_playback_work() runs (either before f_audio_free() is called,
or while cancel_work_sync(&audio->playback_work) waits for it to finish),
it removes the buffer from audio->play_queue and frees it without clearing
audio->copy_buf:

	play_buf =3D list_first_entry(&audio->play_queue,
			struct f_audio_buf, list);
	list_del(&play_buf->list);
	spin_unlock_irq(&audio->lock);

	u_audio_playback(&audio->card, play_buf->buf, play_buf->actual);
	f_audio_buffer_free(play_buf);

Because the buffer is no longer in audio->play_queue when f_audio_free()
walks the list, audio->copy_buf is never set to NULL, and the subsequent
f_audio_buffer_free(audio->copy_buf) call reads and frees the already-freed
buffer a second time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104114506.1596=
023-1-tristmd@gmail.com?part=3D1
