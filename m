Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759058;
	b=ANf4lIGAlanlAQAZ2jk9yFiXQMwfzskQaVH0iIV47lkNZEuVlog2FmdiH2giQwm6uftx
	 6rSzzfPta255m8loDZUFgUTR7U2BEnAIVB/CYyYFijXOk2GJXnoDvo5TWJS5HH8qLh+Ib
	 48pnjv0Nqxmbaym/Ki0QInJvBsElVJDl4wLPDGNUkQijCFrY+5sTL+EaAIeuIyLzXv4JE
	 02FeKW0lIb4TtX6ATC9XJKGwlRKOFC8BEU6AkNFQzAQWx/ybqglt8tcBMPBvxTECjvtQ7
	 XljIzLDbvrlxEuzaRr4omxymkJNKcgnv8lLT5b1W99dHQynfX4LGRNjTnNEQoMCfzxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759058;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=C1hULKCKG2WIVitNsK/NMifrtdbGTd6/y8wbVaKJyqI=;
	b=My1AdhArpsRQteGpuVhBsZhBXA+A60FhbTAgwTKXZ7y2vy0JZoFhG+wCNq6Dlec5387X
	 SqCgfUKC88a0pEGfeEdtyypkXg33OPU2ve93iq0c/iVAqPZG6KVdlIqd2wbrWYTutXKod
	 l8zSXd1C0K2L8rYBFXXS9NATzg925BBzbskLz7KjR3zttZOKOJh4jVYUIlu0rs1gqEPVv
	 3y2875jaMSI9GS7GVWl7lINS0gYq8CfE19Nyc8t0DWJZqYDwU5ZuQrmvF52mYboWrR/2p
	 ClHbg3ExzktRWjsD1iXjHVh1/7v/g5+UaXmm01EeP1Ct8YyAoGYylwdlxRYdg08mrtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LxhBguOj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABC0606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LxhBguOj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD4A1F000C1;
	Wed,  4 Nov 2026 02:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759057;
	bh=C1hULKCKG2WIVitNsK/NMifrtdbGTd6/y8wbVaKJyqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LxhBguOjlfeTXAHR1DHG/je0fAVXyNY4RnWXqsvje6PcVj6b0FR7H+oinuZvagmot
	 BPExElmwj6c/iQjmiMtS2TzSFIol4pbojBTKJbeFCgjGSI5PgYPJFy+9xC6qxkGgw/
	 iG+90q2GtdCUS0nzKksHnLdM/zsJJAQBAtQD5mT4mDhCAMrl36JKGablUfKejL99dv
	 fH9jguOd4QU5RQKxemr0vHwDloo3M5jz41ZMm3DgVxEYtDGCo8T5312lF6Nqip7mvR
	 ONlD+9tT2fBQnNeVdgh3XiEzvVM7+xlHDIwpQ9PT54jl0Co+KA/WikM1j5AX3SBpnI
	 L31+pQrrC/7cg==
Message-ID: <sashiko-outbox-196451@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: chipidea: npcm: keep the ci_hdrc platform device
 for removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021456.1468462-1-vulab@iscas.ac.cn>
References: <20261104021456.1468462-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:24:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> npcm_udc_probe() creates the ci_hdrc platform device with
> ci_hdrc_add_device() and stores it only in the local plat_ci variable.
> The npcm_udc_data::ci field that npcm_udc_remove() passes to
> ci_hdrc_remove_device() is never assigned, so it stays NULL.
>=20
> ci_hdrc_remove_device() therefore never unregisters the device created
> during probe.  Both the platform device and the reference it holds on
> its parent are leaked on every unbind, and the UDC core structures are
> never torn down.
>=20
> Store the returned device in ci->ci.
>=20
> Fixes: 70f13579c2f7 ("usb: chipidea: Add support for NPCM")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021456.1468=
462-1-vulab@iscas.ac.cn?part=3D1

