Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501202;
	b=XRYw1EqAFuXLMRNcAVDOgYyDkk2mA44tOtk+v8Ss6KZEwwJh1Xg1wORpTuAnWWPm14yh
	 KNHlTDyYStkC/TEuxkFGokqvZ9FgQNXn52hZGz3yZFae649Z5n74PQygKKeDiMwwpWpKp
	 JAI/809vD9Y+Efff9REkDwIqXmBSaEiZHP/immTR9HTOWaQipu7u19uGiUcPgfVYJgoUG
	 AAefxbESkTQqAWppf90RwM2uBE7Yxoa+J4HdXPDFk2wBvjeLn1fkucuuLhD5iWelhetCA
	 fA4HwRtFy+aFHpzeqjDu+w5MrTovdjA7TBNqyxJFpLqWgQLN8jS9686xo4xi3CAMGMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501202;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/wqXWe/kfwlqtaHw+IBZ/PFNtS8NU5WnshHHS0NyyIk=;
	b=QGHsF0JyFeUlP9D9JqmFTscp26luYIuPs0SnjqDM7XAZGCs7O1LqoLRGOXbHei039721
	 /+VkckZXt3A6u50Nxyj2J85lABlv/l/0MrQpejLwxqnrKQfI2BVlMe1e3PsSh9zj55x3d
	 zmbTRYjp87cxn00jBm6sy/+aBtj/wh92TH6y4nZ7kT+ZKPHhTgDebdwDOhp8tAD5Dji4p
	 SxfCLfj31w/oirmjf6OL/BOLKq7zOWgvKXPfWQbZCx69eBbY08MX7gf1zIqveMkq07Rgf
	 tw0VGL57h+QFu/6jX+GQgIbiLGM92uf6tbKLDI47FGs3of0BZqMtkYFU37+0OpOOruQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=grU86T8i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2DE606A33E
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=grU86T8i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872FD1F000C5;
	Thu, 12 Nov 2026 16:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501202;
	bh=/wqXWe/kfwlqtaHw+IBZ/PFNtS8NU5WnshHHS0NyyIk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=grU86T8iC/Tp6330TnPiZNE0fEUvu+QeFhuQhHxLqEs19yplxn+siQbaB38rDIaDE
	 2DVps+l5Ve6OJKz03IFFZWsdBDU3hWSlNte+G8urnPP0ab0PSJZ3t7ohNJVNIjD2Lc
	 po59nqeCcWgSt7yLO9m3J+Tf9EDgcOZRR7NyXZiV9yaPiP4FHFpbkmDg28bMgAQV//
	 FojQdH81gmdMoR7OqDlAK8fJOL8t41TSfiYb90mlnXdFPlppeN6UhBtihAlt38mnTV
	 ZV8YTUcfvqyljh4eNQNRvrDMY0FwbK7f4tMcerVOJlLhvAqWcjAIGd6SQFxSUyBDVi
	 IOZacxsCsBb0w==
Message-ID: <sashiko-outbox-211501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3] net: usb: smsc75xx: reject frames without a full
 header and FCS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joas Antonio dos Santos" <joasantonio108@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-smsc75xx-rx-fcs-v3-1-6ad0378d0384@gmail.com>
References: <20261112-smsc75xx-rx-fcs-v3-1-6ad0378d0384@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 16:33:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Joas Antonio dos Santos <joasantonio108@gmail.com>
>=20
> smsc75xx_rx_fixup() takes the frame length from the RX command word
> supplied by the device and strips the FCS by using "size - 4" for the
> allocation, skb_put() and memcpy() of each frame that is not the last
> one in the URB.  The length is only checked against an upper bound and
> against skb->len, so a device can report a length field of 2..5, which
> gives a size of 0..3 after RXW_PADDING is subtracted.
>=20
> size is a u32, so "size - 4" then wraps to 0xfffffffc..0xffffffff.
> __netdev_alloc_skb() adds NET_SKB_PAD to the unsigned length, which
> wraps back to a small value and the allocation succeeds.  skb_put()
> adds the length to the 32-bit skb->tail and skb->len, which also wrap,
> so the skb_over_panic() check does not fire.  The following memcpy()
> then tries to copy almost 4 GiB from the URB buffer into that small
> [ ... ]
> Found by LLM-assisted source review.
>=20
> Fixes: 1b3b2d9e772b ("net: usb: smsc75xx: stop lying about skb->truesize")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-smsc75xx-r=
x-fcs-v3-1-6ad0378d0384@gmail.com?part=3D1

