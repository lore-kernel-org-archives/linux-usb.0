Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793532759;
	b=yIrA+wzFIbPAf3DKHe9ZIfwI91PMdKMw8eGypsxoFYxOtmivvxb1IoWNhztC2E+ZBWEu
	 LI6SSAZf2cTv+IDAhgtLpCiQDiajfmzNjvuMkj22G3rPMxkCjMKscE1mZPeR4x3/oE34r
	 PmCIwP6lTdsCrXG5Bsoc+k3cUIUVeqGBF3SdoeCD4Zb+9TAxO+Opz4WoFYCCSOEefgS3W
	 7IYHdStOwHBv/H08phwt4GyOKz7HC1nImwKKgRJWK/QjZL714S5EIjHSUqguVCqf0rHYt
	 +mr3JTXGHRFM095RHWGvh3hJqUYlgdRrDWNtWcDmZL5su3y6JUvKPHOKLWdHhKIgfXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793532759;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ck/RR5Of8C6UouFPo11FSbZDVmOLZjw5K1y3Q8R88dg=;
	b=Dpkd29E16ubQt899het1TPSii/FGDJYi5UJ8FeA2X3CjdZdLqmO4AbPOAdiDSj0pu7BU
	 zMydTB8buPzDhgW5C4snEdPuODtKi4h2QiweM9zBavCVh28W4GLqjNUO09ERNw20IW6YF
	 XmTNKDZi6cBZvBrOFHaP0v6qGh8x6tVzHfqI+Z55BKXFCTHfEPyQov414EGshKIKNbiFd
	 NdlhDvYal7qj/qniXgth8eY7fsmYu97K2zhz/BAHKKqsfvbyhxiOvgX0nWA9VnMBgFiV4
	 5kZy10G+aqupVsFnqCppepw2K3auAzN3n5+BX3R32bgZANqtxU+mQ019gRPPObFt+Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gOAtGHOL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8158F606A324
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gOAtGHOL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E20C31F000C1;
	Sun,  1 Nov 2026 11:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793532759;
	bh=ck/RR5Of8C6UouFPo11FSbZDVmOLZjw5K1y3Q8R88dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gOAtGHOL5aKk6xAlLvoZD3bKhthpu9STbLHIkOu0QILhfCrJN2a9JQzF6G78NeiDK
	 VwTCUUVmeNhlzwblCvV/Z4xK9eJqAHI62EZyTnudQ2yKxNish1yFD2yTPmUgTRiVxU
	 mxTns+phBYxbhjOlyvCsuKqr/8ZcdJKzVMP6BkwEcTJRBzb9Tk7yGHVHblv24uz8n8
	 R7CN/B0n8OP98ymE6O8O0hrJ5RbqvOlv61dsnSEwLFQwXvrjqGO2tRauE/pRtEdmr6
	 S0k+CTsnuzvVxMaKk2PnORQlAfMhTACcMgc/ziO7LK9aJOuRYiuilMiMq1Kn00QPAX
	 XvEWNXpYgd1gQ==
Message-ID: <sashiko-outbox-192380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usbip: clear actual length after receive failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sung Byeongchan" <tjdqudcks0424@naver.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261101111551.1785593-1-tjdqudcks0424@naver.com>
References: <20261101111551.1785593-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 11:32:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A USB/IP peer supplies actual_length in RET_SUBMIT. usbip_recv_xbuff()
> rejects positive values larger than the URB transfer buffer, but stores t=
he
> u32 length in a signed int. Values with the top bit set therefore take the
> size <=3D 0 success path and the VHCI gives the URB back with the
> peer-controlled length still present.
>=20
> usbfs completion consumers use urb->actual_length as an unsigned extent. =
On
> review base e971f4f365bad, 0x80000000, 0x80000001, and 0xffffffff each
> produced a KASAN out-of-bounds read with usbfs snooping enabled in three
> fresh boots, both before the original patch and with its V1 applied.
>=20
> Keep the transfer extent unsigned in usbip_recv_xbuff(), so the existing
> transfer-buffer bound rejects positive and top-bit-set oversized values.
> Also clear actual_length when receiving the transfer buffer fails. No
> payload is valid on this error path, and zero prevents completion consume=
rs
> [ ... ]
> This issue was found through manual source inspection assisted by an
> AI/LLM, then evaluated with local production-path dynamic validation.
>=20
> Fixes: aabb5b833872 ("usbip: Fix error path of vhci_recv_ret_submit()")
> Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101111551.1785=
593-1-tjdqudcks0424@naver.com?part=3D1

