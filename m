Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E378411F8D
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 07:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396795; cv=none; b=StwMQM3MiKHkTMgzajbmaLF914duO9JxtEdKJcBjNfOYeNPUKPl38EUhKYpBGu/HSkTuBIF0BjZsgRBhlDMakjucjGy/B2ajSGOUs+eLqJCqdp1L/Two50pdEZajp3jVaKOGP/TOMPTu9wmTZuNj3WmqZMutFZGCnHj3glC99jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396795; c=relaxed/simple;
	bh=7IIgIx4OwaoIIK9gxcPBzERUxSRkEAhulct5sEWK1t4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=f5RRWZ9mpFX6Q4Z6pGqki4+mBYQZj3yHyXeQgKc6A7DCnrcMFU4NxswtRc1HqEkSEXSRn2314u7iB016/AlgVuIsLpPGt5m3dCxesuYdiGSDuOhZ80Z3i8kKEwLLI/lTm78VLIY2bblgg+3PSyE0IkWmFuOcya8eiOdEhaeBH1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnCthhLX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnCthhLX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3900C1F000C4;
	Mon, 19 Oct 2026 07:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792396794;
	bh=7IIgIx4OwaoIIK9gxcPBzERUxSRkEAhulct5sEWK1t4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gnCthhLXZhix2NEBKTPLsdUy8UkflZhiz+6IH+5oSs4cgvOXC8kKZkdskRGGvQ27l
	 AuVvubqExTKYc+yxW1Y8QFPdQKnlxThsGtuP6bpB2fvkgVPazUD2M4GrqP6qQAVpAg
	 EicLyhrgqzKuNbEMGOacV+pfVEOpDwc4CZ81hZIGMwrsrRt23qDfH1V7zBDWwG6iWF
	 PGVq2+417hEAbGt8wnQHmnnhG/wJuhKgNt9JsYyTkEPO1lCcMICQXwkIUpWABldCwk
	 7sxqwHjN8KismZbDPzMYPmIv5u9hqLjZ8bCXXkjRIeLaEs9QHESRjoAW+d478a8pAG
	 oJkTGcXAt2aDQ==
Message-ID: <sashiko-outbox-176771@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: net2280: fix out-of-bounds read of short
 packet in write_fifo
Reply-To: sashiko-reviews@lists.linux.dev
To: liuc63 <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019075651.2093625-1-liuc63@xiaopeng.com>
References: <20261019075651.2093625-1-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 07:59:53 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Liu Chao <liuc63@xiaopeng.com>
>=20
> write_fifo() handles the trailing short word of an IN transfer by
> reading a full 32-bit word from req->buf even when only 1..3 bytes
> remain. get_unaligned((u32 *)buf) therefore reads up to three bytes
> past the end of the request buffer, which KASAN reports as a
> slab-out-of-bounds read.
>=20
> The over-read bytes are not sent to the host: set_fifo_bytecount()
> limits the FIFO to count & 0x03 bytes, so this is an out-of-bounds read
> rather than an information leak.
>=20
> Copy the remaining 1..3 bytes into a zero-padded word and feed that to
> the existing get_unaligned()/cpu_to_le32s() sequence, so the trailing
> word is built only from data that belongs to the request. The full-word
> path above is unchanged, and reusing get_unaligned()/cpu_to_le32s()
> keeps the byte order identical on both little- and big-endian hosts.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Reviewed-by: Weibin Liu <liuwb@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019075651.2093=
625-1-liuc63@xiaopeng.com?part=3D1

