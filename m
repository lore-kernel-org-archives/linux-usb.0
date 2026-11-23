Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442511;
	b=UJvq5TUxygjACbSGZgPH1RlBcTREuEsJIXfZ3sOLH8wxM35cKGXNu6j3zUNg9UFLWz7W
	 vt8/1KmjeqCq/eR2JIhMVUS5zb0bPmqM9Jv7C1SMB05Fu0DWGrJr/mcsjYixiiMt+9zwK
	 OpS2OB+Up21RrAXDvhG79PR8mZAVkZ+bbIIxZEiFEYQPJtn1WrT1G5Uh6JuMztwjUUDBX
	 dOaF/buvIE25PbuElsVc8y9lLEz7pw1zzOqlK6oRUe4DyaIzMRPPhzW0ZwFqMKdL1xSEH
	 ObpYwLeBNnTzFx6oi4GjUSzC3KxPd6f+Pg6EiNVrBBf2yMFOt2O9L6C46uyi515jpTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442511;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bYnSTv+rCbc+waZ7kftrqYbGnZIYly6MXNT6HVUqpJY=;
	b=u+WqnFPn7ikg+Mc1sqCkUTzVvRn0FhrNtBiweaoXSRIhwbkNzLW9P5P5bs9QVziOw9w8
	 ZVHy/yYRWSyGd3rbjQOM+oifzdSZKAa1FGVblRE7qTQs849rAYdRiF/Bizp+q+Vkeryex
	 5S/MN0d3sx4ZRxXrDAPX0ds99uh9wylbwJmCsOelFK5EfhsABGqcSigHnaZwO9okSE4hY
	 WGD4xGu4d8Pdi4dDWHrY3IUUHLxmXyd6kBNVlCmoKzNFQvULacWH8QfxXvMoTYmiXxS5O
	 LV2NffXoIX8gAEvyb8TfH8aDcTwbPRLZp7qGAXzuH9dHXnPB1EoYiC/ztcOrw+PCheA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePZnLzpX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B64606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 14:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ePZnLzpX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDC51F000CF;
	Mon, 23 Nov 2026 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442511;
	bh=bYnSTv+rCbc+waZ7kftrqYbGnZIYly6MXNT6HVUqpJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ePZnLzpXby4GTOJUbjOMzg9fxf47veyEF2rduKfLuIFfQ3FETL++txVWLpMRTm65I
	 ZFeQ+oAka71576i3zEg3ZnGpK0AFflGB593OtZaQLE3r+32IU5YTea67Vju8sEN7F1
	 sj0gzKvDW9WR4rSRF7lD92dRFkB7z066gBstkQABd94koSlE/kuv+5Yspx53NBq6Dj
	 3EfeRnDwiIDztWvg0HxRzjcBO225t7HWv6JttHmojZ6Zdl/wJJ7062VykXs8+BfWWA
	 3TadAbo6MbnQCF+rrSDyHENtXn2xMInWhG0mh63bwhxfJyR/4/81gARgY1EA9qFT66
	 2u2M7NG9gtu/w==
Message-ID: <sashiko-outbox-229355@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: uac1_legacy: fix double-close of sound
 device files
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shuai Liu" <847807867@qq.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <tencent_7C654BDEA5891337506C7242C8FD481A9E05@qq.com>
References: <tencent_7C654BDEA5891337506C7242C8FD481A9E05@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 14:01:50 +0000
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
- [Low] usb: gadget: uac1_legacy: missing Fixes: trailer in commit
  message
--

commit 3da4b8607e9ed8f8aab229a9303b5baa05b42d1a
Author: Shuai Liu <847807867@qq.com>

> usb: gadget: uac1_legacy: fix double-close of sound device files
>
> syzbot reports:
>
>   VFS: Close: file count is 0 (f_op=3Dsnd_ctl_f_ops)
>   kernel BUG at fs/open.c
>   ...
>   Call Trace:
>    filp_flush+0x...
>    filp_close+0x...
>    gaudio_close_snd_dev
>    gaudio_cleanup
>    f_audio_bind
>    usb_add_function
>
> gaudio_close_snd_dev() closes the control/playback/capture device
> files but does not clear the file pointers afterwards, so it is not
> idempotent.  gaudio_cleanup() is invoked both from the f_audio_bind()
> failure path and from f_audio_free().  When a bind attempt fails after
> gaudio_setup() has opened the sound device files (e.g. because
> usb_ep_autoconfig() cannot find an isochronous endpoint), the files
> get closed while audio_opts->bound stays true and the stale file
> pointers remain set.  A subsequent bind of the same function instance
> skips gaudio_setup() and closes the already freed struct files again,
> triggering the file count corruption check in filp_flush().
>
> Make gaudio_close_snd_dev() clear the file pointer (and the PCM
> substream) after each close, and reset audio_opts->bound to false on
> the bind failure path so that a subsequent bind reopens the sound
> devices instead of reusing stale ones.
>
> Verified with a QEMU setup (dummy UDC provides no isochronous
> endpoints, so every bind fails): without the patch the second bind
> attempt hits "VFS: Close: file count is 0 ... kernel BUG at
> fs/open.c"; with the patch ten consecutive bind attempts complete
> cleanly.
>
> Reported-by: syzbot+592c653b056459925299@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D592c653b056459925299
> Signed-off-by: Shuai Liu <847807867@qq.com>

[Severity: Low]
Commit f3a3406b3f56 ("usb: gadget: f_uac1: convert to new function interface
with backward compatibility") added the audio_opts->bound guard around
gaudio_setup() in f_audio_bind() while calling gaudio_cleanup() on both the
bind failure path and function teardown.  Should this include a Fixes: tag?

  Fixes: f3a3406b3f56 ("usb: gadget: f_uac1: convert to new function interf=
ace with backward compatibility")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_7C654BDEA58=
91337506C7242C8FD481A9E05@qq.com?part=3D1
