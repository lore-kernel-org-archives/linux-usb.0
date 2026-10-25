Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792939263;
	b=AarzaMR2zh95JcAlFGumJ+G0dNF2MzJvsMFPLksmz6ihBQbzkQmxlEvVwqQnzGcgjyPF
	 wIgINcoVBVF2G7v7tsqpVuV1BuG5GNBUoxeja6nxlWRpsRF47he4qtxo0VBJEblxBe5/D
	 WApLH1CWL7aq7/fIIjsBEOeQ72QcfjKJsUXMCTgFJldG8DazNS5AVT2BHWn2UcQXXOJjk
	 0uClgXCkM4ioo50eZd3D3Ukq/BWIqsAIs0bglWuN/jq6ivnJyRdWjhDh6YzaRXN62MaJx
	 W0vT144ou5Qb61nJuqX/RHV7fU+Eh4GP7X39qFXz+jo0Q/efGz3Doq4ZgSMO8XAkuww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792939263;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7JPAsZC0rJjq2NkDi2/Fnb92GtAHJ9VXa7jvX9/C44I=;
	b=ghNFTXlj+seBMs0ZxmQKN+G1ZezToSovV1n2xWjgjxAft7ur3XUMcEuLMjjDYb+b3WbQ
	 SiA9YiLfiLueAvBVXucKP1rBr1oL0EqXo0dPqorc+wNVRUiPo0k2g7JHVa7sieIM3Sppn
	 A3A6JBfbwEIszvG0pSJfFg8pp8cvyTHwIT4CdY29cvOz9MoE78j1bHfl7iSZt1FDMmSrd
	 laZhQyrk1o1riFxnR3LTjFpugkbqCMoOKJhEEb4WgD42/iZuAhlvL7Iv7NcmXgKlw64oq
	 B4waUtdlktZnvSBgwXTOxPowr9bJZq/qqTXZcvkekrQ97hzHNPSv8I4JbcWqapTujpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WhbX7r0B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D6606A31A
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WhbX7r0B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCAA1F01825;
	Sun, 25 Oct 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792939262;
	bh=7JPAsZC0rJjq2NkDi2/Fnb92GtAHJ9VXa7jvX9/C44I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WhbX7r0BQTwHk+k9bnUvX9fKbFE8KAxtmPOb3WTnvVrz3R8AnSXpaTW22lCO1/H2l
	 W6kZHcljuPbBVOYbx1WsdPVlJD8ErTYKKOMHgiWBdJfjqDHE05tC1tAXiVCzNGBeL4
	 aacTHHXa7GMF5jIXph3bzhRuWNrNOG8JtKdzVSnzXDfDe28/39w1iZcUmP5Uzu3dwn
	 Uhfk5iK3hLFNZkVXj6wWohQVNvfNcCuv8JBScrHaR+dD5fTWk4HPF9h6IBkXkrrTrp
	 mxx4UkId3ihMW5/GsKlcG5TTiN+DAzZ1OxxB+6z1lnnTiTtpRtdu1TOXLjuM/ucXdl
	 eqfUx3lfirNzA==
Message-ID: <sashiko-outbox-184253@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add support for NV21 pixel format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Herrmann" <m@manuel-herrmann.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261025143522.327365-1-m@manuel-herrmann.de>
References: <20261025143522.327365-1-m@manuel-herrmann.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 14:41:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add support for the NV21 (Y/VU 4:2:0) pixel format to the uvcvideo
> driver. This format is exposed by the color camera of the Creality Pika
> 3D scanner (2bc5:0c0b), next to YUYV and MJPEG. Without it, the driver
> skips the format as unknown.
>=20
> NV21 only differs from NV12 in the order of the chroma samples, so
> bytesperline is wWidth, as for NV12.
>=20
> Signed-off-by: Manuel Herrmann <m@manuel-herrmann.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025143522.3273=
65-1-m@manuel-herrmann.de?part=3D1

