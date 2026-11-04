Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777201;
	b=QLc2jgIjwNT060+Igj/WOvtyrY0borQtymbJmj9bWqMhfDgMbUwWL+5BAZ+ZtgJuqAJh
	 3nPwuX42KFjOsPJg7xr8wjmCQbuB6+dJl6wjnTruVIw+QG/NFSB1o1j7xrHqPt4iIuRVZ
	 pLKRYHC+83h3UsWCbHCXGQXLfcdvLMaK7R+kMQ9TatjWvn/IPh4oii0/bxL4XO6TEVcBU
	 F8dnB5p4BVv0KR8h7c/XRLxe9IzFhg0vKvPFAPIA/mRdcRTFqih3dfClrrPF7/s8Os7z6
	 h6lnoyy8numSpwls8a9TGp3+kKoN6xnYAPS7dX3UpeygRxsnRk9JkGSoH39PeVfwZjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777201;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bHm8ryhMYMHxu2zGoTQhqtldb2i3W5FbFO8xQqBJlgk=;
	b=lhDuiwMk66FSmMgwCFPscuUFGT6CthPgraWrZzMUicdkJ4rRHND0qx2XYhBsk+JY6XV8
	 t7qz5pDcb3/WdiUHMPqI+mlpsl4kpmSz0HrIvrjQKBY1G/lFYurcvnwKgIJs5I8Dlha6z
	 H6IFIgoUanL7Pm2Ip4d1i9C3c3s1fZysT5FDMyDF3ytYCvBStWuaPp+p3dgksyYi2warA
	 iGuBz+rZGXRb1AJwROrKv4ie5Zi+fQuYMKue1LI5T9e1xNTetiJg0n4XcRL0055t76yzN
	 1yzMHS2dj3llEE29FrkCpYSc3ALB6xPv5R9tFnrEv7xMwTTU4SqZ30oL3Ko9wD8/ciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JnQLAWA3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C7606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JnQLAWA3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3D61F000C1;
	Wed,  4 Nov 2026 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793777201;
	bh=bHm8ryhMYMHxu2zGoTQhqtldb2i3W5FbFO8xQqBJlgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JnQLAWA3BMLm99VUUk3Nu9UNx8NjGM0SdWK70G62XckaIR2q0VWTUG0esCmHlAutZ
	 9tlLPQ6r9G2HNUmskr1zo4B4U4G8KWsnjt6Ei7/jpDRRotPuQRTjoLHJIgyi9Vt7f6
	 FGr4qjzLEnd+gs++/wtSHqXApwB0f9FJFbzLalPhd+36FE81caYN1g514yiEcmhSTb
	 lpmqs73FMwQUe57UQmfM1o9+8f3AYhhbgxR9lqBIKkty9D8cIxrNZ7ieVCIY04qtJj
	 okxKZxibpA/Q/ANERXcH9ZiDczS4ki2VCBnIrJgsp+SatWFHRUdKNLXXfp02WS4dOF
	 Nu+/jbyA66IIg==
Message-ID: <sashiko-outbox-196791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: dwc2: Add Siflower SF19A2890 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104-sf19a2890-dwc2-v1-2-d959375e26ab@telaak.dev>
References: <20261104-sf19a2890-dwc2-v1-0-d959375e26ab@telaak.dev>
 <20261104-sf19a2890-dwc2-v1-2-d959375e26ab@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:26:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Chuanhong Guo <gch981213@gmail.com>
>=20
> The Siflower SF19A2890 has a DWC OTG 3.30a controller. Limit its
> transfers to 65535 bytes and its AHB bursts to INCR4, the settings the
> OpenWrt port has run it with.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from OpenWrt's siflower target, rebased on v7.4-rc1, commit message,
>  subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
dwc2-v1-0-d959375e26ab@telaak.dev?part=3D2

