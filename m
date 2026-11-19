Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095895;
	b=LQKXpf4ZY0x/WI20Mof5Ac7KbvS9n3xtdp2BGBbihFLkeYCFu9JMG+EZY/REgBhvJhqD
	 0PllY2wN7eewUuFHH7Pk9IXwaKMVsr8oOPzQ4yr4l2iBts2Y9tAo8V/ioHGQHLeYRTQYo
	 Mq/xfhq9wNYJrSdM7JYS+7pZ5I74vlsozoqMZoGeT4KnIBCsuMzn/EIbLE7hJn/dXwWlF
	 Tn8c0YFoLfr0jtnqARhVqOLGTNeNJ2qVOOibqIfnImYGuZoP7r7eMqQYxFnESjD7BJJX2
	 Q/sSeiYqM5qw6YDD2m2maaVzVX/5yhBDgQAltkWzVeZWePbWRsW1ll1LMm2LmpbUBHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095895;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vCHNSKXmPa86AzfCs4DEn2U4hM31rJi4YjMe3A44Gjs=;
	b=bu83fxU6CvLnI/cFA60Aeedb7Efns6Z6w6jTaIkw34tb7l0SzxuXPRDhx66AEB8HC74l
	 SkqO4CKeK3VXNSgboos8/vX8/v4weJ9ZNdLLf2k0vJUgWbTeqSrfsfkgwHCm0ILBptCRT
	 kszM+wBYUypfSR9ffdUmK65R1JdAR/pAc0FYwXH2S1xm9AdK0hdBvrVo5C/FQrnCFLk3D
	 HG7aWiM/K2Jnk27sUMwlatYN+aTPaPAjOT8/vY9MWLK/GMfzqnJnwv4PwsI5vOtTehssd
	 hjeUjSL9Q4lHtKgexFFaojjjmBiT0Uqvb+MTRWNRQt+Hy/V6wI0subqrb7dKv4Y2/nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmDZr19X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3595160A380A
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmDZr19X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08A91F000CD;
	Thu, 19 Nov 2026 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095895;
	bh=vCHNSKXmPa86AzfCs4DEn2U4hM31rJi4YjMe3A44Gjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmDZr19X6u2CccUJPH6rlU7MTnXsipntLWClaydi63AJ0m4je3w+TppS2xwk3iei0
	 CsAR+ShXUXkp6c8XRAOATCy9T7wHIU0FvhfggrJJz4B02tUbe6xA397D+3j82pt4XS
	 gv8jMTvXp2PQrnY2d06sTOLLBocqatQMd1RItG/fYX2+ZH9QZwGxElBVdBiqz7nOEL
	 xltwwjmAxeqxxk8uXZftKJmffyBBkAoVKxMRto0d8LJlUdU6eZbtihgN0KaN1dnK8S
	 oiMTtdKyO892Ta7gANbVZuyo5AvY/vTGmgaktwS2V9iXWJmCEnfnfKmhZxOgYJ13ml
	 wecHilkI8bMMg==
Message-ID: <sashiko-outbox-223202@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-2-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
 <20261119-b4-spacemit-k1-usb2-v6-2-4a9add848728@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:44:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Convert devm_clk_get_optional() and clk_prepare_enable() into a single
> call devm_clk_get_optional_enabled().
>=20
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-b4-spacemi=
t-k1-usb2-v6-0-4a9add848728@linux.spacemit.com?part=3D2

