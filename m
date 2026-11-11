Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365296;
	b=40J1bsmn01TEHyeKtVrCcsia4KAbV2IeWcXxYzo4M8R7qjKwe+HCm2dhOF5yvqTJAheR
	 NP9DpSqd7YULf1bDFdxuEX8gHLKK0ZHJpfsfoqkOWv1j0FnqFvBcrWBR8hinQLxD7oWwV
	 PDALlnUwpl5uAggXJqirkT1Fy7A3OeTBMg0ye8HLQ8FguwNx40bWdCNvMBRNGF9IlEv4j
	 AwZYdaSGOv+OOQOIcmeMfvj+ZlTEuqvI46YfkjUp+lj50sU+6VVP6KKi4z8Wx1j6Kj0V8
	 RHtfWjEevX/bkezgJ43nEi6Lop6c89Z+EwmVi1dwoyZ7s+faAGq8U1cjRXpBYeKuxTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365296;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BYeIQglSfn/gcQEMFHHGsXQGHfW5RSQNZwmDv2cSXvg=;
	b=B7A2Q20Q3xpcRjoeI74D6111QA4VyhB20dJW2d0zaCjbrx+fGxRaRo6pp0NAm6vzpXn5
	 nvrlILZaTZpiXZ6yH1rzLhBDT4aFl/j2IL47Nk2aLAfdewydwqgnoDcY9nkzAjgz4fh36
	 bP11K87q1NL1nOJML4nERu8XncRY7KJR2yoBAS5ZMUbc8dFlY6VCBJmM5xd4d1ivm9sSb
	 S5XW+UWLVYxw4kerX7RLcImstG6Pgnb565IhWb9+Myw9770MTUICxhD4IcjYuV8DiIGog
	 ERDdYShLA/R/befwuf9KWKoZD5YyjMyhl91qrEEdfIxNKPhr8Ek4CGSkuUCVwI0V4Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0+pjOoh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1B606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0+pjOoh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8669E1F0089F;
	Wed, 11 Nov 2026 02:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794365295;
	bh=BYeIQglSfn/gcQEMFHHGsXQGHfW5RSQNZwmDv2cSXvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q0+pjOohY2aVHf44EmCFZboZjDYlPssK8KktWXZIOe6tuyryBANdvVT0eoxDCqvFU
	 yTAH93x61+0BXxQ9gxmp+4CEklWNE1AiSuE361lBgN/ejXru9xmt4ij0PfwVp8uamu
	 mFUHaMko58Sr4wrFixmK9Rt3k3FRBFKBdRmV/0mwOTLj1OzDn07L/lBnQyRAFJtId0
	 JoSjbWOPIkhKkGIuh++6hTW6LwDzEX1zdEjznBcHAuE7RBBuquJMVS56ty30mCKn1N
	 dTKnVyCCMqx/tkRYl3KP4CSh5kwldC2EW/KcI0+nSpQf/fCZ/r3aFBDWPZew9p2rzR
	 zQYSFvk99kWBw==
Message-ID: <sashiko-outbox-208116@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] usb: gadget: f_hid: fix sleep-in-atomic-context in
 f_hidg_get_report()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111021655.37851-2-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111021655.37851-2-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:48:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The second copy_from_user() in f_hidg_get_report() is called while
> holding hidg->get_report_spinlock with interrupts disabled.  If the
> user page backing the ioctl buffer is not resident, copy_from_user()
> takes a page fault and sleeps, which is not allowed with a spinlock
> held: it triggers might_sleep() warnings with
> CONFIG_DEBUG_ATOMIC_SLEEP and can deadlock the scheduler on other
> CPUs spinning on the lock.
>=20
> The first copy_from_user() into the freshly allocated entry is
> already done before the spinlock is taken; only the "report already
> exists, update it" branch still copies inside the critical section.
>=20
> Since the data has already been fully copied into entry->report_data
> before taking the lock, updating an existing report only needs a
> plain assignment between two kernel-memory objects, which is safe
> inside the spinlock.
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111021655.3785=
1-1-shishunbo@cmss.chinamobile.com?part=3D1

