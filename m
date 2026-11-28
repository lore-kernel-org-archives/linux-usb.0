Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795831184;
	b=kSmgQzhDzOScHM6ZdP3G7HywLMA1HDxUmmPC/l30nvPzRdPkY4t6kOuoxEzm5QRbZoH4
	 8kjC2c3Smt0QzFiU4N/hzCHkebMZMZkLY74piHdbxImk+N2n63bDf12ZQDNqB7uP04amT
	 bmZ0IUeGGXqMmvCN+FxuETSxuKO1hiyRDL/XExkz0Nf/lqjX/SNvmcg7JwDuNyxbpcPUy
	 DomXivDjJ1mWtzd+ylwS5yF3IK/NBq8TUjc2dnOhJik8f+OwWnmS4stB1e3O7hdF0aH39
	 uYCYqoSFCIq04D455o1jE0/KkDZIOl0UjLe/ZDn7JBS35rYJmzzZyRop97StjGzv+Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795831184;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DCPboehuXWisAWjwU+B2xtOINvGm0sqOXB8QsruR89U=;
	b=HPesu8T03Gsl76BK/LvZHQ/6klINIjpAlljihPf8psKLLCGbFdbPIdV+cSsoSFoaQ8cP
	 1Kw0R7Qe4IZ2H7ppLnj7DG2a5bVOxkXnoAmLATBVWWK66EO68OwO3GpWH/C89zHRf7CK5
	 FBqTL6qnLCc5cSWJ30ITUBXb0UQ9ytos0Tg7Nkfwgn1OQc9LXivlUqcMRHLtj8F6ZfGWO
	 gfsP6/lDA4ct//UmHiNW9KYvRmAwlydBiSqwzQN38R0kN7g+zi7q3li2jg82FJq9tKaFO
	 a6BwpyluaeaqqSLTkAWyctmSj0IcqOmIeIsDK11O6IOsSQc5HZpdNtN0rhh8o/OSt1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mrq9tJIn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED546606A31C
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 01:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mrq9tJIn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729A21F00893;
	Sat, 28 Nov 2026 01:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795831183;
	bh=DCPboehuXWisAWjwU+B2xtOINvGm0sqOXB8QsruR89U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mrq9tJInLenblAWJqBuJf7o5+kS1ayk5YGySpMDEwhAqHBifvuv7H4RzuR67NboAm
	 gagiTZWZnjnkEzJ9Puo3gD8LbFcDfQhI+FZk8fkAIdrhZQtx0q5zPKXTTN9ZG/bxq4
	 J1+FOOgCHOqmHlbOqJVEa7NtiVYRsdV9vxRdJ73MovfC1VV10LP6nPxyfOzjdT0PWu
	 i3csiFkDYvD6RQ84m996RCPngRqXcwz0A/5hZWB9LuVvVYwRgiTjxf7TwXdwQxulPx
	 V9fpqz/4lDWGy/dUntcDA/7c4zhLv2NxqvIbOKezd4V6rFpc4044U54YasFr7aJquV
	 XB10nA9a8S1QA==
Message-ID: <sashiko-outbox-238414@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: phy: fsl-usb: use NULL instead of plain integer 0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Huang" <akafelixab@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-fsl-usb-null-pointer-v1-1-1d10607f9f39@gmail.com>
References: <20261127-fsl-usb-null-pointer-v1-1-1d10607f9f39@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 01:59:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Felix Huang <akafelixab@gmail.com>
>=20
> Fix the following sparse warning in fsl_otg_set_peripheral():
>=20
>   drivers/usb/phy/phy-fsl-usb.c:618:31: warning: Using plain integer as N=
ULL pointer
>=20
> Assign NULL instead of 0 to the struct usb_gadget pointer otg->gadget.
>=20
> Signed-off-by: Felix Huang <akafelixab@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-fsl-usb-nu=
ll-pointer-v1-1-1d10607f9f39@gmail.com?part=3D1
