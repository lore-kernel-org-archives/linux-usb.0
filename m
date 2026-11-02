Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642751;
	b=rrAmL/m5s9liMJWP0Pf1CnJfB3gnxkPCcTfaylUN6jnTz2cpMVq4pb45MnsBHN7N64+P
	 hmwDFLV3Hw4X1zCpOkTN+8tdBDZmaBi9ohz7M/trVYQpX8d0HMELehm+NuxXUeVsrvZis
	 m0rRCyfGH4GNfopLTPKbeCDoy7sqWoqbOZIRWuoKqxEjK7P6PA/1dQ0RxTp1eI0RFQ42h
	 qPqtfPs3+boZrLzwtp5tA/0jDyPClsSWV2J3zF42ZXi0xpmx3gJEjNUdUufN0gjJXf6+O
	 LQ1qYiw03qJ/genasu4A7e6gqTQ8OZDNAUJbrYrmt2zdJFMPz8J4QLW2AQKkBmYC+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642751;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PQ6C3IQ5scOXHGyUGp9dvOYfwc59jUprVV08SjYxnGM=;
	b=f+dCIHhu8M5VNejK7xRhkXwVvxvnED0YpiSMGP6XPaL2Ikv78LMxUtUmeXpga9Jit0ry
	 gxblGBYrUz+UiaJPt6t9KqxXzpcYLt+hC71C0Jo/D1YbuSj2gDcRQUMttTFstJKO6sa7u
	 KeIpFTNGFOkpyvfn3VRwEBRdDdBJZvwAgftSovI1LG2SXG6dPUHS3A6+BL2k+2Ahhdh5i
	 +afitpKs5jY5QzEau7DF0S+VrUZnpgb0Msqdvur+aD43kNRHXNy+lFk7xsO0sEwpW7aHm
	 bj+QR/5mwIf3pS/tFi2UZzV0YNKnwu6PVKlpEKaEBXalyWTkICbqAhhHAEZjF0E6k7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMeDwlOw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B631606A59E
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 18:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CMeDwlOw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD661F00A16;
	Mon,  2 Nov 2026 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793642750;
	bh=PQ6C3IQ5scOXHGyUGp9dvOYfwc59jUprVV08SjYxnGM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=CMeDwlOwSA7CJ8Gu9c9E5OjDHAipMQu7EILRdm4Q8GDdrZ+l40liIFntDNFiLNXAF
	 +kobm3pcYInHITwYBqy7EsN5j3Z5EdEsoggGRc64q//v9KGeQh06OPnw+NRx1YhpIb
	 fguOEXeorN7vy/AE/Fdtr+NLYY3JAZnDAuKdXPzML5E5UeG+bIE80ecpiuijdLWrsc
	 ucOkxCcCyGC8eZx2XtdePt8uo7r/Ye69tWNVJxd+Iz3iBXEyvgzEY4Ez8rmETWRQb1
	 BDPxIIu/dLHXNfxEzw5y8GtPcMi4R+cKNA+rGFRDVcRD7wfU2kvZgNyRYWitSPC3JL
	 P6Q3ZT4NGrbUg==
Message-ID: <sashiko-outbox-193905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] usb: musb: use dmaengine_desc_set_callback()
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com, =?utf-8?b?b3BlbiBsaXN0Ok1VU0IgTVVMVElQT0lOVCBI?=
 =?utf-8?b?SUdIIFNQRUVEIERVQUwtUk9MRSBDT05UUk9MTEVS?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261102180300.3966399-1-Frank.Li@oss.nxp.com>
References: <20261102180300.3966399-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:05:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Frank Li <Frank.Li@nxp.com>
>=20
> Replace open-coded assignments to callback, callback_result, and
> callback_param fields of struct dma_async_tx_descriptor with calls
> to the dmaengine_desc_set_callback() helper.
>=20
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102180300.3966=
399-1-Frank.Li@oss.nxp.com?part=3D1

