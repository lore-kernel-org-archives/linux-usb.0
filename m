Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293069;
	b=VcuXpbPEIr1b9U3TQ9E2imKZ3wSrfkNjGv3M3ZAJvsJtN7X8MjsdCOarUzpZtDwlEQwl
	 5I4WaqgfA1ryveBG6jrA/OWtOArIcfQ1XLuQHWlNs/YdM62jligqoggdZTH2O9vdMUnDZ
	 np9/tgq1ubPf5zV/JxkYg1JOIBD7spELg+VuuNfDIz2/pvpcB6cfw4g42w5TAOlFFjlOH
	 GV998J+e8RDItB8ObrKGSlDs/mCfxo0YI+epHPstJyBlgjIlx8qrdq9ZqkyxrijF0DhHk
	 osicFWDqHxP9jE6t9JIG+9POnYpkBxS0kgyPiZ/QdCFwyoZniKZL9M7gz3Zyqy/nO/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293069;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WoEEvAQGJPPdwfPgFJoLu4rEP8FbGaw9rmUrFLHiUog=;
	b=paTfXCuvXgJWWirb2XnLZc2XXxfvxAI4hpWyMAz/NPaC1mWABX13/eiJqJwSbSRS4Ccy
	 SppUxdnVtY1+KNUrYymj87JIoCVUfajQzFPvCUpWZhPa3QyhWlzgYyh0BaHGCiUdOfg4u
	 nFJM2qZ+olqjVzvVebAZZaVI8hSI0ubkeR+Qr9wu5Df7Zk4VOOda0v56bPjf97L5rtPdY
	 8eNYLPNRFyOcBkcymnjRHc/BSGZHRY6SDpHU7pC2BLuF6JAtTf6wPYntvf/C7oOJlH0SL
	 IsW0LPLpL2fKdYtuAO2vBobm0NNnMhfiuqcbfLKzM10ot8e62vC3VJSQ5r5cXeGsdSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBYfQ6OA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290D9606B1FF
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBYfQ6OA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D48701F008A1;
	Tue, 10 Nov 2026 06:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293068;
	bh=WoEEvAQGJPPdwfPgFJoLu4rEP8FbGaw9rmUrFLHiUog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QBYfQ6OAeZy7aqnCnNYGQuDjiWZ7e1/R1JAr+f8FSpGr33I27F0/8bI8qxqcxyRsQ
	 viqBSnng2LAkUiSY+zGZ8KuGFnB0YGtfvmkhaDQmYc4yJBaomvhQtX/Dwr8Jh3s+KR
	 gRWrK8ympTARDMTUnV9zmG5MMBYQbduqBR2Pgw5AECb9IhHFKpp+vd+R0k+lHObvAY
	 qNXi1xVvQP2+M5iEAYvJGgmyx3fUSuUq/pLsegUVwMRrHeBuSrSIjkZQrMkNaosQT9
	 TT8H7pmd3ATRdk7QZ3iRlUiyISVENtHgFniBKqChQVDbTkDMBVL52uZR53UDBDYSC0
	 3sw8UhO4Z/Idg==
Message-ID: <sashiko-outbox-206435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/22] usb: musb: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-16-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-16-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:44:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D15

