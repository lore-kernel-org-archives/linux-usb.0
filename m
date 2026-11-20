Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138094;
	b=asoJMoSQAX0lbwkXtJxuDPm0wRjV7LGDi3yqED8tgSxusMwjsOAurmVIUa9q5qIoF8Yp
	 6phLG3Um/Bnwhmc9S6xmsCvVnPF+kH3FT69E0P1xCcgl7GVxWWYLCu+uBNAr1jsDh2x0N
	 8LHyk584QDiGiQsxCuuCwxQXEI+koNavu8f5z7Ay9Q9jA1d88AwWktKkF/hJVky0Lp45F
	 VhrX60CwO24T84krORXzBWNy7Ym+GbNhLNXve1Hm+ld+pQv55yEylYMA0c2lVUKNZ0cel
	 p+CxYep/SfmcGzMepZJCgXAnqiwVp2TODm5gCc5mbr5vKElckT8IE5/p7qfNhGb+J3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138094;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n0vdZvDQ+MzetRYAKzafUK0k8fCFJYmLX4nEmyOrarw=;
	b=ODTg39qvgrU0GzRfLjmE+WkdnutqpPtvDh2USlfxPx10O/fSyzbp+9x+4+IwGNNP3bZk
	 4P4of1Xw0fJ6Br+TgxLg1LpXhhjvrkwp74/qLyDh7Xvqyby5minwY977aQqTh2e3FRtFV
	 DAVOzCt8cLYD825cYXbUIcPiJ3xxAciBlGxheQI2jRKQKXbBMxELZCuxPfXLgX+57Int/
	 cfwdW1p5jCPb47oNK+QmnfDWyQz2Kx2fEs/QV+gn1pOnaM+Pt2+VmEfdsPp2Qmn99GjNr
	 yXu6HO+X0HEYCFwgkSRKL4OWdKzPNnwts7j7J0Iyr18otBiZlB/mglF1IKnpl5h0XKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iZpQuw/u";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A623606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 01:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZpQuw/u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E431F000C4;
	Fri, 20 Nov 2026 01:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795138093;
	bh=n0vdZvDQ+MzetRYAKzafUK0k8fCFJYmLX4nEmyOrarw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iZpQuw/uRTQVUI497SZJdxLV9GNiwxhmA8LlFvPF9VwCApp+1RBza4Ta3bpwoOOkS
	 8xjnDzwY48QRrC1JPx/8NfLhSdHycgWXjHDzRHiSqCGnoAt5oUzQOtObNuAM2kO4B7
	 G8B1XG0iiaz8zkueBZ6FOT+ltXEHMj5m1g1xpsQYfvGRBTxrvebJYCRkyX2G2rUevY
	 74N4csDcV8jWDyVWL/9dsYpEEOWAZg5LAvtHncSJeq59koAV3YncvUjHJWJ5JrB6Yu
	 lJkdWsFj+0lRjYj+T2XOcBdGCTwLHZ6r6QT1Ww+6uHirb6RMkucNS3LyunIJ5oe369
	 /9QwbQ+64wx0Q==
Message-ID: <sashiko-outbox-224305@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] net: hso: cap the MTU and drop oversized frames
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aibing Chen" <chenaibing@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120012309.19-1-chenaibing@cmss.chinamobile.com>
References: <20261116014904.556-1-chenaibing@cmss.chinamobile.com>
 <20261120012309.19-1-chenaibing@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 01:28:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> hso_net_start_xmit() copies skb->len bytes into odev->mux_bulk_tx_buf,
> which is a fixed MUX_BULK_TX_BUF_SIZE (2048) allocation made by
> hso_create_net_device(), and passes the same length to
> usb_fill_bulk_urb().  Nothing bounds skb->len today: the net device does
> not set max_mtu, and even with max_mtu set the core does not clamp the
> length of the frames handed to ndo_start_xmit(), so AF_PACKET with
> PACKET_VNET_HDR, tpacket_snd() with a vnet header and an IPv4 route MTU
> metric above the device MTU can all deliver larger skbs.
>=20
> Cap the MTU at the buffer size and drop oversized frames in
> hso_net_start_xmit() instead of copying them past the end of the buffer.
>=20
> Fixes: 72dc1c096c70 ("HSO: add option hso driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120012309.19-1=
-chenaibing@cmss.chinamobile.com?part=3D1

