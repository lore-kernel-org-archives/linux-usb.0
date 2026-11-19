Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118132;
	b=fmvusEReJtysb8UCXAe5IxJy+9kHt3DXBplzGHSelBJgtF4Z+OWXOeJHvDJJ7Mmw2/ff
	 PCA9zrgIwQwjDFxqGqPX3IopqBhotPlp+GB0EPv5wFAQNqZuthGjqZG+whSL7SrI466gN
	 RdHEPPCCWqvWraXCC6vwEF+Zaz3SilykQz/yq4zkbvxX4eindF0Ys4JEH0b42QUGzZ0pB
	 VMWsIL8x5U/ZEGoW6vW9UQkLGBKQb4m9XVMydQuspV1iWRJdEGzWui58mPWqrIVfg1Fh0
	 qciiN4rt74psmFnLnJfCeuOpFgx5tu0YE0RHUuGkVP6XUKJ+LQUsNsFpQ2GFR0Xh43A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118132;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eiIJ49s1Tt6PCFOYDDrio3IgyUvwuoNu3t+LY7t3g94=;
	b=n9XVGzmSkveHf33fyzmsBGyExF/4okhLqI3bzwnvuMIMCwJsh1MTIjV1zNlI7FQVKZcW
	 7g/6IPqgX3m9hrbnj8i6XV5i3TZnnTW8bTU3I58cxymjszwJEmcg6Vi+j9B8OfG/cmaUF
	 oxJjppNZq2ZVzwi5lo5RXHqT008A/IlBG1twIC0kQaW3RxeJPFJmHaJIDC2prdRj8Xzd1
	 NWGGe/t5VB74/kQlYl4UfQQ/DrVYjk4xaBrjD3zljhtZ4y4jzR2KLVcYt8banmFJh7ENy
	 FkrZ1v/EG3z/HnFmbcQDWAVcSIKPnnAWoP+FFFJagR1BjddgCjHB4oyrfhtd6ODGD9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e60mAvnK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805BF606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e60mAvnK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2961C1F000C4;
	Thu, 19 Nov 2026 19:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118132;
	bh=eiIJ49s1Tt6PCFOYDDrio3IgyUvwuoNu3t+LY7t3g94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e60mAvnKUUoC2JnjXAFkd/LvhfLg9jemXhRqNnhzDXEDxe0zqBEslqHJvMVM4bHFH
	 7ck/n2jo5HNoEPLj62X9oM/B2aE2m2UE42iBM4yrgxld6WQk+96ZLdGo2pYb45Oqt+
	 ZI/Ge4n3ho+OhC2AGEQc0D5n6tpnU5O5ZJbhP3019TpW3VsgwfN6zaXrxzOeaAuko9
	 ALvcE6THtJoOIUTANI8FmaMhx2PRc1lHSvOkClfNY7LQLPMrS7fZqv3Ib6tUvMSY74
	 y6/ebTDvMFxiDqdW8IgjLn7Naql688C09PrjqKHO5WbsL7Bpc2LYTBPhMYPWaJcAAI
	 VQKVjLovTm8tw==
Message-ID: <sashiko-outbox-223987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] phy: exynos5-usbdrd: support Exynos7885 USB PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-3-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
 <20261119-gta3xllte-usb-battery-v1-3-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:55:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: David Virag <virag.david003@gmail.com>
>=20
> The Exynos7885 SoC has an Exynos USB PHY that theoretically supports
> USB3 SuperSpeed, but all known devices using it only have USB2 and the
> vendor driver has USB3 function stubbed out, so we'll only support USB2.
>=20
> Apart from this mysterious USB3 capability, it's the closest to Exynos850
> out of those supported. Unlike other SoCs though, this one doesn't set
> the reference clock by default, so we have to set it manually.
>=20
> For this, create a set_ref_clk_rate property in drvdata that can be set
> to a predefined value to set the clockrate to.
>=20
> Signed-off-by: David Virag <virag.david003@gmail.com>
> [Umer Uddin: Rebased onto krzk for-next branch]
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-gta3xllte-=
usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org?part=3D3

