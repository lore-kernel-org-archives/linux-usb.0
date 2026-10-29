Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284372;
	b=I4Axbx6woIe9ek5DNyWARnedw5rjhWsBtG+31h2PXyiXLr4tsTSHIyzJUlXwcsCHQpZL
	 btvdrsZff3eyiSu5LK1LLNKmPr5Po+ajtIq7xsyUEJEez05mw1t3XFJI+IzF6sazL9MoF
	 G8sIfB6PVGqvrE6cdDb1v0+aB2C6izi+cAvD/OKUipNrVd1p4/a9r9PD9+/6f0b9pVEd0
	 VVZs9xl6J6xVh62Xo7IVrMfIMdDxhmRDpVozDKIoQ/hcLBO/6nvlWwQ+VeySKNPrXiw/D
	 /5VDok5zEzCpQzlWIewtV4koO0V9kAzK3jFfeqBqji34lVzsHLfd9OclNnMvDooYq9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284372;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dZ7I9cj1hd91TRDXWnKC719qWhZwa14pHy+3uuoZMnE=;
	b=VBdBHwdMXrLNo/in3UfPAnOQYVTa3wCs0G5mdCBMKn5gdfpjvtqcb0cST0eaFfMwWWtA
	 VkgARJgjv57ddukxwibfI+xxi/kh9wQjiAq3uyU2Tw2O+cYV6Vo+nLI7GgvdOL6bCQqKZ
	 Zi/J2S8hhT7JyaUtdpz/Q1KwKjFNN4iRkbPnfY6Rec614Qj7a8y+ZyD44Od/GMzx0e+xz
	 VB9ruxOYDtHo7gz0AhoKo+4KG3xzmNiQiTWd1SB0EPLTGCQTLToVN5A2Rj5hkWeXzWH/b
	 RXETK13TqL/2fHl/nSniiy4QkRU3a/L+HyCPIQhp8/lo4fQiCTxuVRAyzZyEP/5tkNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DT3lYOH5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F7D606A31C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DT3lYOH5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F651F01825;
	Thu, 29 Oct 2026 14:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793284371;
	bh=dZ7I9cj1hd91TRDXWnKC719qWhZwa14pHy+3uuoZMnE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DT3lYOH50dfY9ZhAy534KxeCe82rV7sm7R6XBekPqa/TdzlxaWVpiE4i/0RbXVQcX
	 T41+nvwoqig/+4j/aUH8EzohbRNGi0fiyOvxfIHJ47nBYLzr/3eqV9OOQ2ZJHv94XV
	 +LjMp4CPpiYN6OiAkxOUBeyNwwl2Xs7eFYfOtCM5dddz1ci+dPk9tLjMR5ptfwXglL
	 857zIxWugf3FfswrfsIu0lKxB2/LTxVKVLoqhQDjupdpw3j2K9ocCnjTJCNkdhf+2a
	 ZolTEzcQcC9mkBRFnGdYT6VB5QRPkBeml8cm4b4ce6j1uAwSWhdKqD6i/HXZD7RzIt
	 2TxW/ea9bK6SQ==
Message-ID: <sashiko-outbox-189525@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cheng Yongkang" <teel4res@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179328314074.648427.388274461758949120@gmail.com>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:32:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> vhci_recv_ret_submit() receives the transfer buffer for an IN URB.  When
> usbip_recv_xbuff() fails, it sets urb->status to -EPROTO and gives the URB
> back, but leaves urb->actual_length at the value supplied by the usbip
> peer.  A malicious peer can set actual_length larger than
> transfer_buffer_length; usbfs then copies that many bytes from the
> kmalloc(transfer_buffer_length) buffer to userspace:
>=20
>   BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x79/0xb0
>   Read of size 88 at addr ...
>   copy_urb_data_to_user+0x36f/0x480
>=20
> Clear actual_length on the failure path so the failed URB never carries a
> peer-controlled length.  The URB is completed with -EPROTO and userspace
> observes a zero-length, failed transfer.
>=20
> Fixes: aabb5b833872 ("usbip: Fix error path of vhci_recv_ret_submit()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179328314073.648427=
.8311262845412746237@gmail.com?part=3D1

