Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422710;
	b=gdYZCm+Z+mhw7MquFC7LggAq7z6rPbrPgncjJb+IcL376mRi6ud4wllLe3cZsOKjPMxM
	 6ph6WJ2hn3NG+gGUMtThygDhZWeiCihR70yMk/ZbLXjBtPA1yZa4iXwbIS+piYp3lNODp
	 Q3IdJTgWximOrNpu5CHSVmyQdsaFOVeHglP0oP1W+SV3T3K2WDhSArq9CvgurotrR8iM5
	 1Np/8MQ9p9iw9TawdFXzvQAt62HhgRacjWlTaYr81MQ8mPeHKQtmBVGv7fXRX9PX7OqXP
	 +aJEf69i7H3mwctzlNvw8x4+1tEobOUHc0AVDxC1b0VdCYDQ1muAOqjXQl52KmN7AVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422710;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PfNh1xWpZ6ttX6c24lnjMmNENwlWHYbc5MV3ffPCAXI=;
	b=cGZpjjyunAtwZQw4aaNFDpTk4cV04Ypp1vj44rJv0nEuK0N0f4x8zwqXd1b4dHY47uQr
	 CZLwiwMuVCcvqSiAfOawhsfnIaKg24rSOFJXoVskrF4d+piUNHSkXzxgBfN9GVTc0t/39
	 AbOvyDe9pFrSYvDDDI4rZn4w8q1Wm8lia3AAw1oZgOsfHAfBDDd8MFxihab5opUpGOkzs
	 yEcb/crVJ5QpPjIvhdoIsycz/xqhN324IYTO4lgBOAuzOGK68fYEq6jhhtpHAFupgYwcN
	 lTvEfmbhtCFJoyQgtjR6BI4b2XEb4FBUC9o0eB00OR9+l8eQ2XWjGz+WF6R97rPUY5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LKcU/AyY";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E288607D35D
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LKcU/AyY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7571F000C6;
	Mon, 19 Oct 2026 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422709;
	bh=PfNh1xWpZ6ttX6c24lnjMmNENwlWHYbc5MV3ffPCAXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LKcU/AyYfGLKg4ZQMjoJsZBN5MYcyyCyqvArA0iY/dAngXM9CslYWweB9ERBq1Ls8
	 wdG84kT5q8v/r9NclZrIchHxKthvx2IsoWxpaFV3pFiPE/xv2LGIDQiJzm8sK7Jre7
	 tx37i/N0+R/EUmnrkJHOHrNuwR25TKyHcNB5Vdy/FN38krQAN+Hr0I8Bqlq7jRUVNK
	 f57Ai60qoTKnnQuxWu6fTN1krVOfXavE2XYm6CiUDlgOOFF+u9p583Tp0R0i2E59+d
	 tFkrxSSwY86nVoP6DGF2eg0Ju3r+KlTJ1bRDgcIE8f/07x4r5rl2Z3KYAb4agdo1gJ
	 10AoWgv77wbyA==
Message-ID: <sashiko-outbox-177640@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] USB: gadget: inode: fix mm lifetime
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-360-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-360-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:11:49 +0000
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
- [High] usb: gadget: inode: mmdrop() called in atomic context in ep_aio_co=
mplete()
--

commit 1034aa9a2c06c8a1a74aa881eb54ff67ca5c0fee
Author: Gabriel Prostitis <prostitisgabriel@gmail.com>

USB: gadget: inode: fix mm lifetime handling

This commit fixes a use-after-free in gadgetfs async I/O handling by pinning
the submitting task's mm_struct with mmgrab() in ep_aio() and releasing it
with mmdrop() upon request completion. It also uses mmget_not_zero() in
ep_user_copy_worker() before switching to the address space.

Link: https://patch.msgid.link/20260601-mm-uaf-fix-v2-2-3c942a707bce@gmail.=
com

> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 13c3da49348c5..7d201c065ae3b 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c

[ ... ]

> @@ -503,6 +509,7 @@ static void ep_aio_complete(struct usb_ep *ep, struct=
 usb_request *req)
>  	 * complete the aio request immediately.
>  	 */
>  	if (priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)) {
> +		mmdrop(priv->mm);

[Severity: High]
Is it safe to call mmdrop(priv->mm) directly in ep_aio_complete()?

ep_aio() pins current->mm with mmgrab(priv->mm) for all async requests. If
the submitting task exits before the USB request completes (for example,
with io_uring or a forked process where do_exit() -> exit_mm() -> mmput()
runs before completion), priv->mm can hold the final reference on
mm->mm_count.

When the request completes and takes the immediate completion branch
(priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)) =E2=80=94 whi=
ch occurs for
async writes, single-buffer ITER_UBUF reads where dup_iter() returns NULL,
zero-length reads, errors, disconnects, or cancellations via
ep_aio_cancel() -> usb_ep_dequeue() =E2=80=94 ep_aio_complete() runs as the
usb_request->complete callback with interrupts disabled and while holding
spin_lock(&epdata->dev->lock):

drivers/usb/gadget/legacy/inode.c:ep_aio_complete() {
	spin_lock(&epdata->dev->lock);
	priv->req =3D NULL;
	priv->epdata =3D NULL;

	if (priv->to_free =3D=3D NULL || unlikely(req->actual =3D=3D 0)) {
		mmdrop(priv->mm);
}

If mmdrop(priv->mm) drops the last reference, it invokes __mmdrop() from
atomic, interrupts-disabled context:

kernel/fork.c:__mmdrop() {
	...
	cleanup_lazy_tlbs(mm);

	WARN_ON_ONCE(mm =3D=3D current->active_mm);
	mm_free_pgd(mm);
	...
}

This appears to cause a few issues:

1. On architectures with CONFIG_MMU_LAZY_TLB_SHOOTDOWN=3Dy,
__mmdrop() -> cleanup_lazy_tlbs() -> on_each_cpu_mask() ->
smp_call_function_many_cond() waits synchronously for cross-CPU IPIs,
triggering lockdep_assert_irqs_enabled() and WARN_ON_ONCE(!in_task()) in
kernel/smp.c and potentially deadlocking with interrupts disabled.

2. On x86, __mmdrop() -> mm_free_pgd() -> pgd_free() -> pgd_dtor() acquires
spin_lock(&pgd_lock) without disabling interrupts:

arch/x86/mm/pgtable.c:pgd_dtor() {
	spin_lock(&pgd_lock);
	pgd_list_del(pgd);
	spin_unlock(&pgd_lock);
}

As noted in free_signal_struct() in kernel/fork.c, __mmdrop() is not safe to
call from interrupt or softirq context on x86 because taking pgd_lock can
deadlock if the interrupted context already holds pgd_lock.

3. On CONFIG_PREEMPT_RT=3Dy, __mmdrop() acquires sleeping spinlock_t locks
while interrupts are disabled and a spinlock is held.

Should ep_aio_complete() use mmdrop_async(priv->mm) here (or avoid grabbing
priv->mm when priv->to_free =3D=3D NULL, since the worker is only scheduled=
 when
priv->to_free !=3D NULL)?

>  		kfree(req->buf);
>  		kfree(priv->to_free);
>  		kfree(priv);

[ ... ]

> @@ -543,6 +550,7 @@ static ssize_t ep_aio(struct kiocb *iocb,
>  	priv->epdata =3D epdata;
>  	priv->actual =3D 0;
>  	priv->mm =3D current->mm; /* mm teardown waits for iocbs in exit_aio() =
*/
> +	mmgrab(priv->mm);

[ ... ]

> @@ -572,6 +580,7 @@ static ssize_t ep_aio(struct kiocb *iocb,
> =20
>  fail:
>  	spin_unlock_irq(&epdata->dev->lock);
> +	mmdrop(priv->mm);
>  	kfree(priv->to_free);
>  	kfree(priv);
>  	put_ep(epdata);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-360-sashal@kernel.org?part=3D1
