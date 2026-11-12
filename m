Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446133;
	b=v72pBMapiWqfvyJSwD4CG0/keEzWv/dueokeoAceiA8o7yxjB6sqBV5y7msUuexy/8cr
	 yMFnyaiuPgFuugpht2fylFtbww8Wwrg4BSLm4EAAvMBAfmo1q+hxGJjHiAggBR4zlMsHt
	 oa7maRNcx1anurQNfiFx1Xy/EeHNf+spMwIK1BPJ3Uz+8b6p3rUZhfmuE12fl7HVpzq7X
	 Oitk4YfSMhoxb0ADjwaPZk/rNtTFyPIZGMoJvS2kK13QciLWpHQJQ1Q/2uBCXEvSZu0OO
	 NjqK81OMr8KqU+SPFnMQBW/p1Mgs1lnDbqUv4PujpoW9rS1H1JqZ7gBibdRdXO0aGwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446133;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2kSZWyEsBmlBGl/WQFgK5ABe2kcSiP86HljE3Ng66mY=;
	b=JDmVkhlPjoAvS88tqNua44kznfKTGEmHp9FchTTyLpJuKZJxyH4bx4CDHEV5F448VGXn
	 8xmiKEbRP8d9Rc1p0BSimVwEbGIEqpWl/sfS7CZ1Dfk+8pPUaO4R5ZXTfCsTA/PlIwDUW
	 bDLhKQ1Hig+VZJT+OVhoHOVBZjZ7duEi9c/R5l5JgH7fhUFVK8AJc1O776cKNYKQWwupy
	 979KDeeg8gpSZIsiwiIbHyjy3UkMgET1EonSD+Swy90vx4we5Va/OHPSAnochbnWFIpn/
	 muMSM+g4jfYheZ4gfx0lHPUicpUgXryMUSnsKfRxier4PFTp7zr7VFUD13ua/hDDzFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqSJHT1X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E360A2603
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 01:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqSJHT1X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCC61F00A0B;
	Thu, 12 Nov 2026 01:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794446133;
	bh=2kSZWyEsBmlBGl/WQFgK5ABe2kcSiP86HljE3Ng66mY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iqSJHT1XZ4xlvSxjGUXaS5p1xq1VMO9WTmGoF1fQerEvrzLJU/I7NLMudM/qUDqkS
	 sBIAwvwONwTG2jod/qZYyBlivlJOZTCTtoxzojxhDL0xbvh55tjnS+7/kfalI90cet
	 ECDV1zswxZyIVKZH9finTdYeK4ERI6fhvw5UHAMKWZg8hN1AmInEtta0qdnxwUsA0L
	 FaC0QtGG8c05LE93DusmcJt/yLgLeeCx8emVavJEEhlhsGq+JXPvd6jdOxUfKVxQuz
	 ZqFpFRQRQkXbI3hMRL+uqchS5abAXCl41DBezUaIuARSgSef64ti0xGEqUsUYS0f0N
	 3mj8/xh3LxKtQ==
Message-ID: <sashiko-outbox-210050@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] usb: gadget: f_hid: fix sleep-in-atomic-context
 in f_hidg_get_report()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112010928.23716-2-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-2-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 01:15:32 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112010928.2371=
6-1-shishunbo@cmss.chinamobile.com?part=3D1

