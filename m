Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012125;
	b=ecPoTs5SW+NaBkpM5pDhTI5bFv/mhp1BytMLA7ZWqSzlzyblWm4PINxLF7Sbv58Mxxsh
	 yThmk//k3DyRfBdgoA3unOT6nLsFc4wAhmO/EJBDVRgE9oICq+nfYUOVfKsDItqgc21ul
	 ASVm/2KNXAYKj97d7St6YKIrvD5SXhQ3GpX0nMTWDxAPocoOrw4PZ48QicKbkRwOSymQX
	 N4ubDPeU5xBwhtykVQxBTNq3fFt6hqpg2cGBLrcEqKUpkAQNezW6aoqe/feQDg5tcy8y9
	 YXwrUFxAQ7S6d05IdoYzeAYI1u4TReAETuA86GSbJbeQPv1awAFf+vew9o1QgU7ql/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012125;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wgizGrr413YLS1G+k03ubtMNwvC01R1zBsV7IZYuGQA=;
	b=01VdpHqGmcQgJi+HFanToCej8LEnAoieY7yAD2wh/bV51XVQOHkoC0M41WbmZJ8w6MSB
	 kk+sn/lTrDDZXHd5tjfOVG6GvXurLZdC6984vWI79Jo2EJWayykLpND8n1Xwz7ZD3rPDX
	 N9nKT76zaIn9jlXnsZ07XbPLGKvkUzEjm7Geh15v3MFvJYamRlnazYfO54yKM9etaB84W
	 V6O8Il3sKN5GuUUGl2APrqDsJbuIq69wQ8sJYkfcH3jjs4YWS2rwoIUkifgly8P5O+Vme
	 109G+hSpfGqLrlLdD3xvEejEtJSWBT4fyejDfJRV1hNsubKF1myaO7K4vCELYKpI7NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANtiG+Nt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2C960A2600
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANtiG+Nt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47191F000C4;
	Wed, 18 Nov 2026 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012125;
	bh=wgizGrr413YLS1G+k03ubtMNwvC01R1zBsV7IZYuGQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ANtiG+Nt0JIvWc2oolUDfXumMTjMDOWpHUjWLPZlWM55Ok2vpNO0RJMPoWJS4rkpu
	 bV8rCnrLkExsTnIEBm7F5GkCviiuUPW87GMK0cBRtXGJ89eXzmN2i5WJIt3stTgAdc
	 JVPVNpWJ2Lw+jJP6BDMHwh+mmSaWPnzcdA6qXPiSXmlnRIp2Bu1u4u1tIqYEsFnTBz
	 3IzfS0QSa3oNx2UW1zlnFli7JRk3soYvIc1j7KqvjsVM4GD4JpLjqFiW22xWSGxOID
	 +sS5qWtS06ozQzD7C3kxnopA4OAzZwi1rqdFphlsAyCVCjpvvNDwsFwukLY7Kz1Nh6
	 CPVLMLOCKp/4A==
Message-ID: <sashiko-outbox-221205@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: nokia: Fix potential use-after-free on
 bind failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118-324f82bd41-usb-gadget-2@mail.sdu.edu.cn>
References: <20261118-324f82bd41-usb-gadget-0@mail.sdu.edu.cn>
 <20261118-324f82bd41-usb-gadget-2@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:28:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> If the second configuration fails to bind, nokia_bind() frees the
> functions in the first configuration while they remain on its function
> list. Composite cleanup then accesses the freed functions.
>=20
> Remove those functions before putting them, and also put the mass-storage
> function acquired for the first configuration.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 15761826eecd ("usb: gadget: nokia: use function framework for ACM")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-324f82bd41=
-usb-gadget-0@mail.sdu.edu.cn?part=3D2

