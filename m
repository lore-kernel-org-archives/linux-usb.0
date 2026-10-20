Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510583;
	b=lbmGdQ88CyQLsEX4CZtBBdN0hE61+oXkmd+UrFru7TFtD73pFZmiC+KreYAkQYR38R22
	 WY5EAGQRxbdUaoFB167USIck2qsIEaE3YfdOQnsVdLOs0AOVwb4A/CyWX2vbRuvygJ5ix
	 cuOx4wXO4Gdpbg/buo9MnQbDMGKdtHKe8brX51PU/LLnYBJ2qvDlNqrnpO+Evl6Y/d7IJ
	 VJnCR/nvwky+X1uCiVM2p/gb5CiSroJJltD3tU1Ot0QWrB/CGdamdg6CV+eEh7z2xQhse
	 zvRrr1Bq+Krvr3QoN9lPrvu8q8U8ZPQ7fTpEICxICAW1txH9aIPvU+RNayADXgtowtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510583;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iisecgbWNUqKMQdJu3346ehlewHqxPUFcrMwlliEavw=;
	b=t6i9zPTxkxZwWMCG2dsYk+nfOtlj8YDVQ27prNmAZ04TYDFW3QcERH1T41MZd9w1Ifms
	 GqRFnGy0qbkL49o6vxnhVJQL46pZoNtpWYr172KbZD7bZEpdLivdy7SzIuT0v05/GU626
	 gduT/GXOfZGPGEONM9jtp1pjDWF15ELp5HeLy2YuELR6Suk/b7tGQD38QVMmCzmMfYV+Q
	 V15SxrSgjGwZAL2nJxGhIFosaYaG1MGc9okJzYW7bPPJNNA/XvmiC5QYt/dA5WoXbEDGG
	 HZUv3JIT/hlM9Pqt6kA/eUGuw2adEzI10NmMV44aY1d9Q3GGabsWwCD4KVJlLGTmJNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ahfat5c2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701B2606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 15:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ahfat5c2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5081F000C6;
	Tue, 20 Oct 2026 15:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792510583;
	bh=iisecgbWNUqKMQdJu3346ehlewHqxPUFcrMwlliEavw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ahfat5c2pdP9S3BqwKn60cCr6le23WAYSmb6y852qgxD9DKhj8nNda3RcwvUCnNHX
	 XZ6fjvfJl5dXuWcJb6sK8CO9unpyaDbDm8UMwcC4Gli0sv8a14dvhfRtfo8g/EpmVM
	 mJdXJs9yqQBEqEacDTYYlA17Xa03u/6JKwFa1FzUIf+G22JYvMf5Lu0VU6mCLRLIzp
	 5Kt/0fRcUmBSRs8oE1UBoM/SBgxsA5V26it6Vb8CQa7gKFmF4yHQG/rtYRk50ayElb
	 Ds7W7cZRWoW4XuAtSiCQZ0jCBQPkkygR7FdTBTyeyq3C5DUstByZOV7ckkTwm5IfAS
	 2nZX6Pb7OVhbQ==
Message-ID: <sashiko-outbox-179261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v4] usbnet: fix EVENT_RX_PAUSED race in
 usbnet_skb_return()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?w5ZtZXIgTWV0ZSBLYXlh?= <omermetekaya0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020153044.18828-1-omermetekaya0@gmail.com>
References: <20261020153044.18828-1-omermetekaya0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 15:36:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On SMP, usbnet_skb_return() can observe EVENT_RX_PAUSED as set on CPU0
> while usbnet_resume_rx() clears the flag and drains rxq_pause on CPU1.
> The skb can then be queued after the drain has completed and remain
> stranded until the next MTU change or device stop.
>=20
> Synchronize the EVENT_RX_PAUSED state transition and paused-queue
> dequeue operations with rxq_pause.lock, dropping the lock around each
> usbnet_skb_return() call to avoid lock inversion. In usbnet_skb_return()
> use a double-check pattern under rxq_pause.lock on the slow path,
> keeping the normal RX fast path lock-free. Use spin_lock_irqsave() to
> match the lockdep class shared with other sk_buff_head locks taken from
> hardirq context in defer_bh().
>=20
> Discovered by Sashiko, not triggered, not runtime-tested.
>=20
> Fixes: 43daa96b166c ("usbnet: Stop RX Q on MTU change")
> Signed-off-by: =C3=96mer Mete Kaya <omermetekaya0@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020153044.1882=
8-1-omermetekaya0@gmail.com?part=3D1

