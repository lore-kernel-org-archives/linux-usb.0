Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957712;
	b=sEAQn3/9KCytCnLdqL3hyYUyyhoWwKDw1XQ25pvPUfLnZV1m38EWoSNwjt/DBII+afYW
	 NFfSYU84Hn3KkvLW4Vrw/8oxzu4DWzdYtR6HLLoRAqMSt26P2UQLgFDSojS4B79wLAiPq
	 8wSb1Z2oFCw/0mH3I08wsfQjAZHxQaGzjaNNlXzwbV0pXfla40eogRegy+sLNHE5J5IC/
	 wjxbxbAlnmaaIESnqHpdI3Of55+9OLIbH47A3J3Fv/FfBbm6ptr/JEi6qP3dmJ2Ml5L6z
	 VBqYAV8FUN4UDn8wZsPaxihy8Ts1mvcb4hdFqd9iOv0Oj+jVCpFJhIHjAr2OJDqXOPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957712;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UmEdfzRhW50nHuKxTjo8DGqlBuEJbWvl3D2rDssjdKs=;
	b=ezeKQe8gkiSenPzoKba3ALNZRLcSYOJFIhu8R9XgRKrzNLIyj5U5B9RD65+Rg0iCu7mX
	 1NXNzkDWKC77yiauL1j2FTCVU0jEJNT5WyqLzEM+a5nDsqA+8ujGBtMCbM8U8+Co2SWqh
	 8W8NT8LRkXu1kE8gGrG+6Iop+QrMBWEifZ3yL52E7YsdrnqInml32cGxW0q6aCPmki6JV
	 0jVBnXofmXvg9eGIU2pS4Ckxww1uPAYcKSqmOI1aDii3Htw01Lczo1Tz06w+xV1z4uE3T
	 9oaArRl6UmsGAn0TZp8nql6SaZSlxIGRmRixLRcjzbVpqJF0p2GM8AESn2+JUXOUAHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkoUHulo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D356083606
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TkoUHulo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4931F0089F;
	Fri,  6 Nov 2026 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957711;
	bh=UmEdfzRhW50nHuKxTjo8DGqlBuEJbWvl3D2rDssjdKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TkoUHuloYFRvvI4+r3KS6azOOsPLK8CcIZ9AjJ+3EUJLC9qUc8WijLqQwh6tqZZiF
	 P66F7jpSXcbdR6Rpq5bHACn3m7ulWBwoME7TAVSEQZx2+4wmkMqLMCvej9FK4KhKTU
	 08qf2Ka04BQCLWJ0PznuoPtmM2ThSoht/pY4No0lOR6IxMHznBLO6eptXLO8ce3LQO
	 pGygfepKdug4+NOcgXBkThWPPJjl51J/EPI77z1GBmR27vGxSMd/ANeTWITtey2aWJ
	 4LtnpOoFjmhqWPeaNIQNlAC8fKZYwl9fWXILM8KmT6o01F/Ur7aEHH1Lxdv5ceZIsB
	 mCy7NywO0NIjw==
Message-ID: <sashiko-outbox-201120@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/25] dt-bindings: interrupt-controller:
 andestech,plicsw: add Metanoia MT2824
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-8-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-8-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:35:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Metanoia MT2824 integrates the Andes PLICSW software interrupt
> controller. Add its compatible string, with andestech,plicsw as a
> fallback.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D8

