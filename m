Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540830;
	b=D63zC4DBcHuBbU8gFJRey5wWC8KV+JM2FsSCQjyAF1Nllweo5iJKEFGb0bxwcsypSWdQ
	 lFkVaTV1qQgweh7yx0casTTlHTjkolpEzcjJ4sfXHDAgzD1FTw+IGw34vOL+4rMG8ja+s
	 MGdIcbGazBPttkql21re3X+Jxk3c3evUYVJSStE3kmSh6BaQwJgHq0IVOBlqxKZr39dKp
	 9Y6RN41HZd6NS/9khatxMPYEId5z4lAXeRfuyszXrfF8Tna3tvrqy+ybtu9uuND3/XKCf
	 kQuuHbEqbiWiZlf7dK2rtp73ST4DxOImQUxyYInRc/DwfZz1zqSEh0siyTYS6+MMu+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540830;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h9wNbImmEsnkywaKOm8u7V4JCwM0d9kdTy7MEQjA0Mo=;
	b=aZ/3tUiPS9xA/bSYztav6EfexwQurmPZPH9PQ0cT20vlzAsCMaO5aLE/wolgfj05tIxW
	 Pjag3NQYnhYHnwRgpBxKs9v6Vh+mLe6dELQb9ieNOgS2yk0ilIBreWlbfPrB9W7O0Q3by
	 +pc/X1DjRJO70h9J8AKxczAe/gasR8vhuTzufU09vJk4jjMsoP0be534euvs5BVKziWdc
	 vQFs0oa6md1JmwNgfzc931rrRjaa3IaRU748JcjHIPrqr7lvDzWTZcvazPe+uxEsMxG8J
	 vYrI4S/54ggVn2+J3RHrh0VN2mkaVslB2xf2yfQ3T2Ys0yJV/LEy9sn+3pTGOlNJpcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhSsl1IF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBC8606A321
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 17:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhSsl1IF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF15C1F000CA;
	Tue, 24 Nov 2026 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540830;
	bh=h9wNbImmEsnkywaKOm8u7V4JCwM0d9kdTy7MEQjA0Mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BhSsl1IFdHea7/RXZfZYKupe6rBFTpuDfZe590uI/LT67QMc/SGDktVuXWooE1cgH
	 IYY88QgkpYnev0gbegZIiW6WyiYzT54Mg8XbammZn8LiXFL2sqsy0Q81o0n1PV1T1f
	 kNSM8Qilg3K157mUR7FItiy/9IF5mOHqCmZDte7k6Rn38sXYBv9uBTQTZgw7WGGGSn
	 qi4CAyI7K800ksCL7oML1y7fWHLxz3YECuMZvYrtOkq1RXBYfoVOivFJgn3nuHkt22
	 3aJL5UQ0E5odx/L2ZgVJiSkoaXBe69mnLA0iYN4NmqRWSxF6Pqazj6Lrn5jV7EejFb
	 8UAdr4S84D3ag==
Message-ID: <sashiko-outbox-231690@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/2] Add USB support for Exynos7885 and enable USB
 and FG on gta3xllte
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
References: <20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:20:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 2-patch series:

- Patch 2: no issues found.
- Patch 1 ("arm64: dts: exynos: exynos7885-gta3xllte: Enable USB..."): 1
  potential issue (1 High)

A detailed review has been sent as a separate reply to patch 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-gta3xllte-=
usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org
