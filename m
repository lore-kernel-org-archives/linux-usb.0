Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400156;
	b=qvikqk+vXAGfyp9pgqJGnev6J952j4jNXY+W4we9FrJ7fQPtI2t9s/zMcFZKGehlLuc4
	 kPWxT9XympozFonmDnaTPyM0QdkL9NOowhVsJ2iUvfBpjkioAqExxyIJW0ZUpobry7RY9
	 c0kz4JIo7b9t9oTupTAFUY/AgoyjkFl5LJtdA9jc+V9royO7GFBx1S3RARudddAd3gCKr
	 1r1ExwSjPMlNClXFKU5H3R9Fy10cKu/TyZtM51tczqHSaIJve92RLcmyxcpPUU4AS1ea1
	 yQNnAAHayUIRxbz965I3Sd1f8kBQeXg1u/XZtgYDtp1IdRNBj/bOFqZlcnh72msav1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400156;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OBwRK5pGGJMYsWkaCww8n1SdRSnvR6gMpb/zdDD+h6o=;
	b=yxb5YUkX6cxnUD202ZUN6bGdEeMWlcF2UZwDduViEakzkCPuKP0LYOBdHPjfckNbPhRT
	 Y1rimstJ+lKTrX681vvd4ZKJy3JDEPc8Qee1g3ULUaaxEHdzKbchS7X4M/7FiLCmEIsMd
	 ktcZyfoiMFjgoONL6+m88GKoruW9EF5T+gHCHFOxXB/F0CUMcRixudIJ+Pf2RuWgl/6AD
	 Fa7OESWyv9onX6rGUCPd3GFyRhbxdElRC81+t/SUxVvRDuO88ebONwG9BPsIjflW14Sjl
	 UvmsgPVmmgxXiu7q6xTRW5Udj8kG8Y2dR2JrniWEMWz0JpGU2SqbZROpRzOBVbyuR7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c5eO/+e0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F34606A334
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5eO/+e0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED4A1F00A06;
	Wed, 11 Nov 2026 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794400156;
	bh=OBwRK5pGGJMYsWkaCww8n1SdRSnvR6gMpb/zdDD+h6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c5eO/+e0LNgq62WGKP99mQSYrP7qUpRQuRf+9TpThaH8h6hC/EVwNl/4HmGrV1ghj
	 YYh7cHJrpvgoaqIig50Q90Cxde3V5qZA1N8Zr7w2HMr95qcL92Q5u7CLeAqICj7VNQ
	 rrsBtxNkGLIAQuHs6q5cw8pgn3VZJTX27khdPuvOA5j4MaxkP1vRxCoRz3nTteY4xn
	 YehQWLNpNP8je93yVUiYq7j9Mz0Bsf5evo+eTY9MKl3Vt/N12Oj823JLRBpknPDcFp
	 ix5jZzunXJBsgUHS8WNqWhgz+loHsu56E2u0ReK3n8PTBOHr/5k05qxuqEXIT+ptj8
	 9OlvuUyT+qZHA==
Message-ID: <sashiko-outbox-208977@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb-storage: onetouch: Fix potential use-after-free on
 input failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111-e5624093d6-usb-storage@mail.sdu.edu.cn>
References: <20261111-e5624093d6-usb-storage@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 12:29:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> If input_register_device() fails, onetouch_connect_input() frees the
> onetouch state but leaves it installed in ss->extra. USB-storage cleanup
> then calls onetouch_release_input() on the freed state.
>=20
> Install the extra state and callbacks only after input registration
> succeeds.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 17efe155253e ("USB: onetouch - handle errors from input_register_d=
evice()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-e5624093d6=
-usb-storage@mail.sdu.edu.cn?part=3D1

