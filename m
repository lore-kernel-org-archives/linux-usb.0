Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074062;
	b=D6b9cMvGGhys8+QaXf4iInurhBPBUPrVD8MN5KwkSTHNicrWvjysZP6mb5qqGEhKiG97
	 mkVjsphq486V2+LdGrAxGU0UHVzcQxNpqeiXlzYicpzDNPRHh2OYfpPMEad2/PvQ3+MqW
	 4MQj7w5D/fQMTh4NOaYZEPFXb3OUjBgxm2stXpG5vzAwCeCQ3Fo6jJv4TZWb53/PNnmN0
	 kF3HsxhKJEeUx16Tfn/AHAPZzE+B4BGoQIVQor/J9V5iZ7Z8oovisrmUHfPwecSTGH/1q
	 f1FkNUVFtnQe4TKFqEWwJfnrg2O83B8cyQjyEtvAZYldqLgq9tysK8QeUMCw00vIG+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074062;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=O6cpn7FTUmB1GxLwO8arMJzqt41vkvuYEup1nWwnvDw=;
	b=Y6wMGzqC/prL+ERpnC1nA8t+2SmPa0kuq27F3+GzmaE7m2mRoQBsbTCW3awMfmISxidK
	 NwYghJE4ZiLF8+V01JinaJbT3vXSiZHOU6h3US/Ezlm816AuhOqR7RFV3s4njXQxarRRY
	 FQCU8Qxe2eE9LpVuQmuTKFNuesLmgq/gGvzZUywW8Jb55hIrH2qE0q89FXpX2aoZjgyTk
	 09ezFynv95ZvzTwqwo9vVda1efftt+pElvdHhVanjkuqsRqqnwuga4h1pjJsKvAI1c42E
	 /Z9LH65slvylLMOuqkDRBqKw7PkMTu6MFZ2z1DviUVkC611v8lAGzO4Mdo7qCJZVQMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3N99eqv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B76B606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 17:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3N99eqv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82311F0089F;
	Sat,  7 Nov 2026 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794074061;
	bh=O6cpn7FTUmB1GxLwO8arMJzqt41vkvuYEup1nWwnvDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c3N99eqv4bWc/ZY++5VU5fPPl1zAWZZ8K9cwLQiYyWK7X0jYVJ8cH49rBa8ruergn
	 oeHLCmcH83t8qlHqwIq/vsF6zHsNHziosuoq+i6Mg8H9fwvY8zoW/bJkc1SbBJn6xU
	 7M29HmccEap9R6D6NVbc+f2eLZwtPVFo4Vbxr+JT/7cxgPx3TcTAc/C8M/Xw/Jf04H
	 8b4w5AwmNZ2qP2zD8SLSEGKkUk/FuA4rrN+FQ5VQk7Z9EFbcYTdH3aS/s8Tc9xLixo
	 +aOKGKQpahDjLXU1vJGY3gFE248K/2sLEzocnHX7b4QFvlevZX96Q1LQXXHnrcSmoy
	 b4QC11WcGJ7JQ==
Message-ID: <sashiko-outbox-203139@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] usb: musb: gadget: count givebacks in busy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elvira Khabirova" <lineprinter0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107173601.63095-2-lineprinter0@gmail.com>
References: <20261107173601.63095-1-lineprinter0@gmail.com>
 <20261107173601.63095-2-lineprinter0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 17:54:21 +0000
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
- [Low] usb: musb: gadget: missing Fixes trailer on ep->busy race fix
--

commit b6b3d8fc1d6d15564bfaa947266d072504b05814
Author: Elvira Khabirova <lineprinter0@gmail.com>

> usb: musb: gadget: count givebacks in busy
>
> The ep->busy flag is used by musb_g_giveback() to signal that
> req->complete() is running on an endpoint, the ep is busy and
> starting a new request is not appropriate right now.
>
> It is only a flag and not a counter currently;
> musb_g_giveback() saves the old ep->busy value, sets busy to 1,
> releases musb->lock, runs req->complete(), restores the old ep->busy.
> This works when there is no possibility of two musb_g_giveback()s
> running in parallel.
>
> This does not work when musb_gadget_dequeue()->...->musb_g_giveback()
> happens at the same time as musb_interrupt()->...->musb_g_giveback().
> The above save-then-restore can get the busy flag stuck at 1.
>
>   CPU0 (interrupt)                CPU1 (usb_ep_dequeue())
>   giveback: saved 0, busy =3D 1
>   unlock, ->complete()
>                                   giveback: saved 1, busy =3D 1
>                                   unlock, ->complete()
>   lock, busy =3D 0
>                                   lock, busy =3D 1
>
> ...and this gets the entire endpoint stuck.
>
> This was reproduced and the patch was tested on a Pine A64+
> (Allwinner A64, four cores, no DMA) with PREEMPT_DYNAMIC and lockdep,
> using a specially constructed f_fs function that keeps two AIO requests
> queued on a bulk endpoint and cancels the newer one with io_cancel(),
> in a loop. Tested with both a bulk IN and a bulk OUT endpoint.
>
> If musb_g_giveback() were to be started from some other context,
> the same issue would come up.
>
> "Promote" ep->busy from a flag to a counter.
>
> musb_gadget_enable() should not reset `busy` to 0 anymore because
> musb_g_giveback() decrements busy, and if these two run in parallel,
> it would be problematic (cause an underflow).
>
> Signed-off-by: Elvira Khabirova <lineprinter0@gmail.com>

[Severity: Low]
Should this bug fix include a Fixes tag for the commit that introduced
the ep->busy save-and-restore logic?

  Fixes: 550a7375fe72 ("USB: Add MUSB and TUSB support")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107173601.6309=
5-1-lineprinter0@gmail.com?part=3D1
