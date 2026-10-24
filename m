Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858307;
	b=dsl4NOKJgdXqN9zXjA6AIOzGqLyXxUFmBZI5g6iSRvn3fU7KEd2bb2PxHMJhHH2NU68Q
	 yXlfqnve7s20qhXk2k51654qwZJXKI2mZ9D5jXHxLx+50z/QxFwFCq1BAGpbyN/LPy2nf
	 onHZF6iXphAnem/EnwLQ8iyoz8/edUr5oe2ndJqJ7rmeJ5xCu5I0qbSNq4yI1hw91/elZ
	 8p6nH2YRcujYky7kmBAh3F7bTeq58DpHCCacNhMxXVGhOzavuur9SUzC8SaLHLimY9ct1
	 km8cBNl2fTOdEhYzzRN5U6gHUacGjsv6MDmKqLs8H8W029ilRGrE8OgTTPJBeXh3irA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858307;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=duimOpuL5nU84mD5t1t6eo9wcLsE2QNsu5vbonBfIZg=;
	b=3soc36/e+wM8UdHSef9rzaFx9t7axryK6DfZevFxNzMsXX72F+b9gUoMdZFvc2cw0MvM
	 0tOJEJD1yvLrlRRir/o9nCnChtGzAVwYZCPbdFg1pQwuaI68yfpBde5VHncDEkgz45dyB
	 K+IQKTaINs5AGljGcC/QkN+J3QsPZ9Z4i6TvfaUMHv9t+yv1JCFqOPG2LZKu62MyG7wnb
	 N/Ku1xPxtPDAcbTqH0xiPtA1UVqXBC0JY7Ym0EX5M7L9Kq8zQssVtMXKvULCNV5w1n/0+
	 w/zXsGtnfKGuIHcuXsMEiMJvOHGjnLqUbHzgCuIsQA0eAG6VsycfRNX0/G8UnQk6juQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqSFISD8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A286606A31B
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqSFISD8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23351F01825;
	Sat, 24 Oct 2026 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792858307;
	bh=duimOpuL5nU84mD5t1t6eo9wcLsE2QNsu5vbonBfIZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqSFISD8UhoiIkPLVpGjDy0w73ujggvx1f47xjWppQNM/PHMLXhk6uHGPnmLyxhKW
	 OiDe6HhS22dIlyqnH7la+hqhvdJy2xtGJqll1NAilX1P/xo2bGB/YT7qhCoLoDR50r
	 6hXVLX/tJk6cjZd/XlsH7Au2YBlYd5UmYk+JzlBiEslwcYCuHSRRzs8zyCdDDjUF6b
	 vh4GC2uW1uwX7WwHARj9ikoRVPGOcjDOOa3Vn/BMjTtg0kzxlJ9SunLMy8iJkGvXlR
	 qXj0Nkb87m3GU0gOgJLmSb4TWRg6+6oL+xIs+S4SBczMOC8qq6/dliNtyFldRf7QG8
	 PMMMt4pszBQFA==
Message-ID: <sashiko-outbox-183788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Putko" <igorpetindev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024155614.2732-1-igorpetindev@gmail.com>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024155614.2732-1-igorpetindev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 16:11:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When an HCD is stopped/removed (either during module unload, driver
> unbind, or an error path in probe), pending URBs are unlinked and
> completed. However, for root hubs or HCDs with giveback done in BH
> context, the work function usb_giveback_urb_bh() may still be executing
> on another CPU after __usb_hcd_giveback_urb() drops the URB use_count
> and wakes up waiters in usb_kill_urb().
>=20
> Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
> after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
> the embedded giveback_urb_bh structure in its epilogue (e.g. clearing
> completing_ep or clearing the running flag) after the memory has been
> freed, triggering a slab-use-after-free write detected by KASAN.
>=20
> Ensure all giveback work has fully completed in usb_stop_hcd() by calling
> flush_work() on both high and low priority BHs before deallocating.
> Also remove the misleading comment in usb_remove_hcd() claiming
> flush_work() is unneeded, and document the queue emptiness in the
> usb_stop_hcd() kerneldoc.
>=20
> Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueu=
e")
> Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspotmail.com/bug?extid=3Da5b220cacb0618384d5a
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024155614.2732=
-1-igorpetindev@gmail.com?part=3D1

