Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146310;
	b=I/o9NVPVJR63tAoGxZy5wAaVnhjGrVY04kA4I/9pKikW0JkYoWlr/sjw6nKEB8Ps3ZkK
	 UxwY4woJf5u58603JQM+gXEq2DN7LSIgXsCmu7JtAKXMKZPDof2Mvbv8eTaRCYPBJUKdq
	 VNwkNOwP3PQT+tUMXFJmGIPUyXgj03NUZ4jKvlkmEworwF/kHOfd394VgnIWepSTrdJQY
	 dPzpneESisLTowlFMk3oEv39A0wcMP/POXMBXy1UZdD1icA6LT8CuuAMslDk2c7NKB390
	 ovuxMv5HHWOZos0dTjVqEwMUaxNDL3HWPSbrVcMFvxNtWIV2piLLxrhF06tzcQSmtCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146310;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=p8wn1QrckdSnP9tkXOfUlEYHYXl7ijcO5wcAJs87bmw=;
	b=tYk1BeGsuge+r1R8bBU+8M4CK74lwhnfg1zLb3A1QTml2iawNjIMtIxDaRot3XC9je14
	 T55Rfydyd7JdE4l1b/WVDYNmtYmCLrYLmPYi+Mt1gXzxd5FhXasvn+U5hUlOQOyIRBE08
	 kbjbqBmaICppeDebwCuEN4RFg8HpwkH/1YNLrCNE4wzf2BSd41Sh7jvKe3aoXTXdcQl/7
	 6gq4DsP3FKZS4V/Wo7v33/zhMCE2v1qYfUrx1x7YnHZvx9Vojug0aFYevboUzgThgOOQR
	 uvrJNnloi8I/z9BEk+iNOg73jITdilUDxjpvk1+a4zKQrOEBFi2tI5k7VEqYeILpisw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwGqUrIO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5222606A31C
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 13:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwGqUrIO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E00C1F0089F;
	Sun,  8 Nov 2026 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794146309;
	bh=p8wn1QrckdSnP9tkXOfUlEYHYXl7ijcO5wcAJs87bmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZwGqUrIOtPYTweibITcILTGNT4SLol1ALewORn3PpFqhBockjK1+surHEL78SwvhR
	 esK3DPbCLasWclPqDYRYrSLmqL6Ej3jsXtzPwxy9wlPhjsNhubfL8FFRO2nIH04Opt
	 FEruFetbmtuiGM6I7DMm439i4SHWULThZhxOoaem2K+/3RMSwj6gzKju67KKN6mc98
	 Dy28/p5A26z01WpgayNY0k0KuCC3pgR49IdRE+tpJwdPWTe/s+k433xzudsx3ELmIu
	 UkL7EixMQP2nj7NTx8ksAqv0mQtCtNy06u3WVnetnnRz1Y5L52YkAWvk/qvVjTnYgE
	 BXzJbn8cZ8tmQ==
Message-ID: <sashiko-outbox-203789@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_uac1_legacy: disable OUT ep and drain
 work on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261108133532.532633-1-hj351016@gmail.com>
References: <20261108133532.532633-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 13:58:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: gadget: f_uac1_legacy: playback_work not drained in
  f_audio_unbind()
--

commit f6964e1af41714a76f0159ade1c7d3f32bb5da89
Author: Hyunjung Ko <hj351016@gmail.com>

usb: gadget: f_uac1_legacy: disable OUT ep and drain work on teardown

This commit disables the OUT endpoint in f_audio_disable() and cancels
audio->playback_work in f_audio_free() before tearing down the audio card
and freeing f_audio.

> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/ga=
dget/function/f_uac1_legacy.c
> index 7c8d60c7e87d1..c07f323bcf9b0 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c

[ ... ]

> @@ -943,6 +953,15 @@ static void f_audio_free(struct usb_function *f)
>  	struct f_audio *audio =3D func_to_audio(f);
>  	struct f_uac1_legacy_opts *opts;
> =20
> +	/*
> +	 * The OUT endpoint was disabled in f_audio_disable(), so no new
> +	 * playback_work can be queued. Drain any still-pending work here, in
> +	 * sleepable context and before gaudio_cleanup() tears down the card
> +	 * that f_audio_playback_work() -> u_audio_playback() dereferences,
> +	 * otherwise the work runs against freed memory.
> +	 */
> +	cancel_work_sync(&audio->playback_work);
> +
>  	gaudio_cleanup(&audio->card);
>  	opts =3D container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
>  	kfree(audio);

[Severity: Medium]
Should audio->playback_work also be drained in f_audio_unbind()?

When a ConfigFS gadget using uac1_legacy is unbound from its UDC or the UDC
is unregistered via usb_del_gadget_udc(), purge_configs_funcs() calls
f_audio_unbind() without calling f_audio_free(), which only runs when the
function symlink is removed.  A pending f_audio_playback_work() ->
u_audio_playback() can therefore keep running after gadget_unbind_driver()
returns, and if it hits an ALSA error and logs via ERROR(card, ...), it
dereferences audio->card.gadget->dev on a detached or freed usb_gadget
(use-after-free).

CPU0                                  kworker
usb_del_gadget_udc()
  gadget_unbind_driver()
    f_audio_disable()
    configfs_composite_unbind()
      purge_configs_funcs()
        f_audio_unbind()
  device_unregister(&gadget->dev)
                                      f_audio_playback_work()
                                        u_audio_playback()
                                          ERROR(card, ...)
                                            &card->gadget->dev
                                            <-- use-after-free

Calling cancel_work_sync(&audio->playback_work) in f_audio_unbind() as well
(which also runs in sleepable process context) would ensure the work is
drained across UDC unbind.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108133532.5326=
33-1-hj351016@gmail.com?part=3D1
