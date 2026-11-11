Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385182;
	b=CNTH6hqFmgQvoKDcGDeHUIFKIXEWODsZJ3FUhOMvsS/s/nDmJEEnLDnUh76ByGx7Ojvz
	 BmdfTZ1gxIzyW92FHrrWEzuN7bdLN46eoWwcFH7+aNTWx0gr7BJVs/C2nzyhdHErs8FLO
	 PxIW5rKQsXk0U+5NCqCSEa1TqNk49H34sTEkvgCQiDkiCA660isL/4REKW7y0LYh/BXnC
	 j1P1W1AvsELf+/gKrjnfq9y2SNiQur0ADXGZvqVdT17sWdv3oE2lDQmyRn9NQWix0gBSl
	 pRwcx7xnKGdKcrmeyJ10QprlT0yvj5REcKuzIqVnvYUoDDKtUcMvfp1SuUSoUENVyBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385182;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PXloKAS+vS0AzOUIPRkgDbCk0pGooImHhvW5yIvSs1I=;
	b=f2+LN3kZFCj6/a5oWYS9QabDJi1Kot6yr3u3iiVGl+J2zfdCmp6eiS5QGR2XhUxMozfF
	 fpD/u9xopNy1AmeN91uEMtzXMAFmFMi4WXO3SIyaNvm+64mKXj4vMjrp5Lniv2JeWx7LN
	 Cw2qoSavuMEBF6b8Rd/Ul5SCQRvqrZ0wD1l1eyXowa5YmkLZByBLIfCk933a+0QoNC/h8
	 uxNF9H7ssTCRgX6szcadKlSiz2SVIW94V3615WQnGvoyZG9Gwa9517kkSGgqo21uDEDYf
	 AoTZKUmvQhKgAVCFz0t7XjVlrOefL6PCVb4fIsx7fAP17Vael3834SHkBtQq4TiqsgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cR1O7dWg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF3606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cR1O7dWg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CB51F00A05;
	Wed, 11 Nov 2026 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385181;
	bh=PXloKAS+vS0AzOUIPRkgDbCk0pGooImHhvW5yIvSs1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cR1O7dWgN3ORVSOinafgzsh0jQBFlc9fkvvOR5o1APLBLqXKkwfPHshFZnIhzCphs
	 JBAaWiqj1e7hn3CwlMIvc2Emy8ueOGyV56o/pPP0VdPD1nVAvwu2dRL4y7IMvuC4v3
	 xKViwtDHkBi31A8NuBLn7rk9D+H38n+7vSfLRiYYeHOD0paHOAAMHL2cOPCNeFRdfX
	 XeVRjDsBfCZtDCif5+yj9j3pzPXIJshb3Y1FFcL9UlcNB5UoHeIF54mqpcD7SVlHF7
	 8Ftvjafq65v0KJodK2DRNO8iFRqYLguOKrYo6Pn0IjeSBELESIFi7R2DZbbBn1vYnD
	 JQds0i3d8t5tg==
Message-ID: <sashiko-outbox-208589@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] usb: gadget: f_hid: fix sleep-in-atomic-context
 in f_hidg_get_report()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111081313.16626-2-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-2-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:19:41 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111081313.1662=
6-1-shishunbo@cmss.chinamobile.com?part=3D1

