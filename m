Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751322;
	b=t/2PQIzGnTX2sCHwqIZHArZzDIejAQMjdxHtPkX5CW/+x1E/QFpVfKHK6adIzDHYzi2/
	 efHacPYhXaFhRRLrK3IDeZojS7l1N51PHxAapVm+h5dvvm1e4U+7iGLB7H3Yo+uOH10Bi
	 8vfeZFSXCBE9v2O1xzNTFHDO6vXtef19BK/URitwTye+kDRPoKEp1Yy10SqXWMPZ49Nl5
	 9ZDQ5Q1FNoMMM1DRJ5o9iWJm8plsfQ9Jsi4zW1vh0YVL18rt+JBJjfyLd0oaQ+5m62Tk/
	 k6U42qVRV1mpHWWPqddl56BfmseUsXLHFbCyDaJjr+vtGMwsk2/J9khhZvkUbIHUFVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751322;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=slWhNDcrZmqGna7kZSJF7eQVKO+uWsGHat0V3HMWAWo=;
	b=uAZIBJ7VCxjtjpF0n5Q3wORzrWP8vgkoamMY7jXIMSaxfff6VSagEXoWcCc2w7OgWmkF
	 nnlNt64n3GgQSHP+LiEoY0vIpIloQ2nsU2gKvFvOnVdbdtmP8KuhXsSHcWy7Iny05poKn
	 2edcrCWK1i3npoQPNa5TEYmLfn2ZBjrlo2BqcM7PDtlZn2S+B+AxRwhoQLyfekw+2eAue
	 pT6UsxCQ2/hA+0j3BiR44F7sT0YQR4zBsJ3ocq0drnCXSrB7cpZWH9RmPDC47hKb8omG5
	 87jW/JeFnyrmOGrTVehyzK7bCYftqDfsi0T4YA6qXm6DvKxJqK+CTsKLiHG49X2zysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNKuKWzz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E962F606A32F
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 00:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNKuKWzz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5551F000C1;
	Wed,  4 Nov 2026 00:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793751321;
	bh=slWhNDcrZmqGna7kZSJF7eQVKO+uWsGHat0V3HMWAWo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=oNKuKWzzfBUQgCEETU5xvBqZjGup+JtG7lBMEaNDO1mTkuQs8S/idZKujgcRZxWQQ
	 WbNF8fGys5GC06CZAjrX6/LkA6EIcE0UHagMteY1zzapVVUVNhBuhhRyK6RaMX91Hi
	 6We8LraGmQS79katxLK/zhN/+joYI6yLjAIMQt3SglqVuiAswyae2hMhmV3Qj1rlwP
	 0bLy4ss4jfFukciX+8DObhcJjYjS6L1+ZFLr9qWaEcq8wWoByLdc4mp6XrZihCGVxI
	 GcNbxFz/aAwUk0zNmhGsRLUidl2TTo+qcn+vLKGu5qHPxkOyHAxkuQvzoVenutDh14
	 36u0hv/xRH6bw==
Message-ID: <sashiko-outbox-196297@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: cancel playback_work before
 freeing audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261104000239.2798131-1-tristmd@gmail.com>
References: <20261104000239.2798131-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 00:15:21 +0000
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
- [Medium] usb: gadget: f_uac1_legacy: f_audio_free() leaks play_queue and =
copy_buf buffers
--

commit 7b0893434cf97360fc2c156524033f06ad05654d
Author: Tristan Madani <tristan@talencesecurity.com>

usb: gadget: f_uac1_legacy: cancel playback_work before freeing audio

This commit calls cancel_work_sync(&audio->playback_work) in f_audio_free()
before cleaning up the audio card and freeing the f_audio structure so that
a pending or running playback_work does not access freed memory.

> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/ga=
dget/function/f_uac1_legacy.c
> index 7c8d60c7e87d1..a9807697265c5 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -943,6 +943,7 @@ static void f_audio_free(struct usb_function *f)
>  	struct f_audio *audio =3D func_to_audio(f);
>  	struct f_uac1_legacy_opts *opts;
> =20
> +	cancel_work_sync(&audio->playback_work);
>  	gaudio_cleanup(&audio->card);
>  	opts =3D container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
>  	kfree(audio);

[Severity: Medium]
Does cancelling playback_work here without draining audio->play_queue or
freeing audio->copy_buf leak struct f_audio_buf buffers?

During streaming, f_audio_out_ep_complete() appends full copy_buf buffers to
audio->play_queue and schedules audio->playback_work:

	if (audio_buf_size - copy_buf->actual < req->actual) {
		spin_lock_irq(&audio->lock);
		list_add_tail(&copy_buf->list, &audio->play_queue);
		spin_unlock_irq(&audio->lock);
		schedule_work(&audio->playback_work);
		copy_buf =3D f_audio_buffer_alloc(audio_buf_size);

f_audio_playback_work() is the only consumer that removes entries from
audio->play_queue and frees them with f_audio_buffer_free(), and it only
processes one entry per invocation:

	play_buf =3D list_first_entry(&audio->play_queue,
			struct f_audio_buf, list);
	list_del(&play_buf->list);
	spin_unlock_irq(&audio->lock);

	u_audio_playback(&audio->card, play_buf->buf, play_buf->actual);
	f_audio_buffer_free(play_buf);

When cancel_work_sync(&audio->playback_work) cancels a pending work item in
f_audio_free() (or when multiple buffers are queued on audio->play_queue, or
audio->copy_buf is still allocated), those f_audio_buf structures and their
backing data buffers are never freed before kfree(audio).

Should f_audio_free() drain and free any remaining entries on
audio->play_queue as well as audio->copy_buf after cancelling
audio->playback_work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104000239.2798=
131-1-tristmd@gmail.com?part=3D1
