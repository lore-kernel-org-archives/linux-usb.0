Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C113E0C75
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144874; cv=none; b=gReQwvkgmYbaTf4Q8Bd3zJpX+KA7zhvaxGCpWAKW5XoKRZuWIMSr/lJAeOnojGYKEdTNPqtcYY9aN8TxeszCJX0cu7mZfM39NYmfCTAsgqxCmTKe60IVvb7AU3R9QcwlmlJVz3c3SGJwV59XyZeI8NSd5FNKE1Rw+v53e4OysIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144874; c=relaxed/simple;
	bh=VimD/lddTJod+kSZrkfhZoKoQ7JAis0dmMdMCFIIvO8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=XaZy6yi4hja3fogmDaA5SCZJuueOZ/hwLNCZUzxITETmX33cq1YL50sD7LN7jjOgrAKoAglNU3eH5ClPki9MwYdyWAkgAhFY5QjFog9RLvjbWXFgFHUZqVboyE2+Cu+5oXcNoUGGmihiwDKAPseJfwWKyXbPqgH/V+flGnRgpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wl0Q/dB5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wl0Q/dB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148231F000C4;
	Fri, 16 Oct 2026 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792144873;
	bh=RIOtIkOhvb5IsPfPN4ur4Nz/ObmfsrMO6tnfjK/zhNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wl0Q/dB5LRDQMQPvPg7dkHDhhDkXJuqg/yXmePfeBymnY7nadAZ1IveFgDI6bPTow
	 LA7r5h5N8AQueVqIuDfsuLly+VWXg4tFfaRrwbIULtR88dFRrPtoocyZM5DHQVY+Nw
	 8cp3My9JWfmRTWOQ61HDCqgaPGSQ0rzD7DLPuWHS0Xn0KjXpEyangSK0W1SDg7I06A
	 nDAA7L8bS2s498NhaeUlARZWzLUa5TDm/IJWjgsEHzLf2AILzj+u36uNP32UIfpWoy
	 htCCo1hG9Tz+pIlSC/pt52zOXoBL69e6nkr20nBoGyekGeYYnVSOeir8+q9QY/U+Oe
	 nDjoRXonaKLbA==
Message-ID: <sashiko-outbox-174114@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: usbtest: reject transfer lengths the allocator
 cannot serve
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>
References: <20261016094848.38533-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:01:12 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> usbtest sizes every buffer it allocates from the user supplied
> struct usbtest_param::length, but it never bounds that value.  The
> scatterlist tests, the queued bulk tests and the unlink tests pass the
> length straight to kzalloc() and usb_alloc_coherent(), so a large value
> reaches the page allocator as an allocation order above MAX_PAGE_ORDER:
>=20
>     WARNING: mm/page_alloc.c:5340 at alloc_order_allowed mm/page_alloc.c:=
5340 [inline]
>     WARNING: mm/page_alloc.c:5340 at __alloc_frozen_pages_noprof+0x4ae/0x=
1fd0 mm/page_alloc.c:5397
>     ...
>      alloc_sglist+0x331/0x500
>      usbtest_do_ioctl+0x2686/0x5880
>      usbtest_ioctl+0x440/0x720
>=20
> A run of "TEST 7:  write/-7 -2147483648 sglists 3 entries
> 0..-2147483645 bytes" asks kzalloc() for more than 2 GiB.  The queued
> [ ... ]
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016094848.3853=
3-1-25031212351@stu.xidian.edu.cn?part=3D1

