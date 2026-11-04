Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756326;
	b=soPfz1ADndmC15PAOllETwkFrNwMHhNblbpvDM7nbXt6Rrhx5Xp2Z4Hsh5XYzgiS+t60
	 B4ky9F6zSWisnzhmyz7nUVktobxS0Hl2Y8uVfYjVsVCgjajBie5IlPZvAwtWqOLcq/b3+
	 0EWW0oeaARprfuo2Q1G9Mfy6wTmsZXQd3YfxMcLbgHQCwD62wMzBUh8Em7bzHNE9FQLJO
	 D0qUMpeypPI4KtDHdiignMYAWhSgfyhiRLRgPrcfTL46Yj4PHwFS4zZjkwQUWOYyQlqKH
	 TMUWLUV5zaACA0msqJPYG4qfzu/COd+MzMa//9C7z+5Qd/lOZYi+mBxFKgzyJh/wqOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756326;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ym8FnbTuGOmUoBmGRcMfNyV1ADGfsNxpqxnqSZsLizc=;
	b=VwYb4mcfkEPndTINFhIqC/x3hMkzKh/sx7KRcMhQ6FeyUDv7f0XtSOUi05IpX9QbREmI
	 SS1tQb9A1XpQImu5NjVuuJwncmJIWZR9y9WLY/TIb+F4tNP57f8oXu/NCcyR6FBlW/+Qq
	 S3uw6kOdXCkLW2RHi5yNP3HXjDmaXB5J0D3Ny8fZyvHlfwwJJe0RjyJvmhaQPjH/gyD4d
	 9rsabHhjVsiIWM91TApCVPc9hvpJsq7k2n1qqAJ2OIsDoucC2tY9lXMK+rYkODhyFzzfL
	 aIGJAdXlDNikddqJX12Mo1L9Apoqcd5nsToixZwvdfyfa4HjQNqFX5U6UA/gEQYprKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWi65jYx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34351606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 01:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWi65jYx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECE71F00919;
	Wed,  4 Nov 2026 01:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793756325;
	bh=Ym8FnbTuGOmUoBmGRcMfNyV1ADGfsNxpqxnqSZsLizc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eWi65jYxaZma3J0/buWi6LLgpC6MCVi7LO4UEgdUxWw4Zt1Z3Smxi4hn6/4DEQGEs
	 nqGbSNsKxROIBg6NrxBu4AJYUo1K4eMsJNh1DSRu0+N0U3No28qxzhYIvY2wOJTWu0
	 dcl2ZgQuikmQrz1AEDro3RolbnvikT9NzAjjHn46WL7RIsqNaXC1dcE28DAQcOlwsP
	 zGm0jxnvT0Igq02qk9XDZQv9bWFKOhJV6v0bs7STmtVCDH/TpboHQaFTfnDF2XFFad
	 8Vrej+Mv1oKKdHI81LcRwuMEArdfvx2ZRZJhOCvaTEpwYdFyJOImkFqCRaUW6SOXa8
	 mjwoYYnfkC5Iw==
Message-ID: <sashiko-outbox-196369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: cancel playback_work and
 drain buffers on free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104012821.3253258-1-tristmd@gmail.com>
References: <20261104012821.3253258-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 01:38:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] usb: gadget: f_uac1_legacy: double-free of copy_buf in f_audio=
_free()
- [High] usb: gadget: f_uac1_legacy: ERR_PTR dereference in f_audio_free()
--

commit a5cde968b12751616eeb36689b59c4b3f003c8ef
Author: Tristan Madani <tristan@talencesecurity.com>

usb: gadget: f_uac1_legacy: cancel playback_work and drain buffers on free

This commit cancels pending playback_work, drains queued audio buffers from
play_queue, and frees copy_buf in f_audio_free() before freeing the f_audio
structure.

> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/ga=
dget/function/f_uac1_legacy.c
> index 7c8d60c7e87d1..9fab3f9c8b9d6 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -942,7 +942,15 @@ static void f_audio_free(struct usb_function *f)
>  {
>  	struct f_audio *audio =3D func_to_audio(f);
>  	struct f_uac1_legacy_opts *opts;
> +	struct f_audio_buf *buf, *tmp;
> =20
> +	cancel_work_sync(&audio->playback_work);
> +	list_for_each_entry_safe(buf, tmp, &audio->play_queue, list) {
> +		list_del(&buf->list);
> +		f_audio_buffer_free(buf);
> +	}
> +	if (audio->copy_buf)
> +		f_audio_buffer_free(audio->copy_buf);

[Severity: Critical]
Can this cause a use-after-free and double-free of audio->copy_buf?

When the audio streaming interface switches to alternate setting 0 in
f_audio_set_alt(), audio->copy_buf is queued onto audio->play_queue without
clearing audio->copy_buf:

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

A similar situation occurs in f_audio_out_ep_complete() if
f_audio_buffer_alloc() fails after queuing the full copy_buf onto
audio->play_queue, returning -ENOMEM before audio->copy_buf is updated:

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_out_ep_complete() {
    ...
	if (audio_buf_size - copy_buf->actual < req->actual) {
		spin_lock_irq(&audio->lock);
		list_add_tail(&copy_buf->list, &audio->play_queue);
		spin_unlock_irq(&audio->lock);
		schedule_work(&audio->playback_work);
		copy_buf =3D f_audio_buffer_alloc(audio_buf_size);
		if (IS_ERR(copy_buf))
			return -ENOMEM;
	}
    ...
}

When f_audio_free() later runs, that buffer has either already been freed by
f_audio_playback_work() or is freed by the play_queue drain loop above, so
calling f_audio_buffer_free(audio->copy_buf) afterward frees it a second
time.

[Severity: High]
Could f_audio_free() also dereference an error pointer in audio->copy_buf?

f_audio_buffer_alloc() returns ERR_PTR(-ENOMEM) on allocation failure rather
than NULL. In f_audio_set_alt() when alt =3D=3D 1, the return value is stor=
ed
directly in audio->copy_buf:

drivers/usb/gadget/function/f_uac1_legacy.c:f_audio_set_alt() {
    ...
			audio->copy_buf =3D f_audio_buffer_alloc(audio_buf_size);
			if (IS_ERR(audio->copy_buf))
				return -ENOMEM;
    ...
}

If that allocation fails, audio->copy_buf holds ERR_PTR(-ENOMEM), which
passes the if (audio->copy_buf) check in f_audio_free() and faults when
f_audio_buffer_free() dereferences audio_buf->buf.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104012821.3253=
258-1-tristmd@gmail.com?part=3D1
