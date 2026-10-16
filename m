Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5263BA244
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145591; cv=none; b=PxEo894l24tD7mGXtddVzUQfihyN/rlPvqOOqoBwTi/gLPjFk2UUwfKDX+vh+nG40xxnoKZviT3SIoJ9UZWjFDMrcMFNY64p1q+qoIeBwE83Kw+XA9KlItMqy9udnT0zRt+5Nx8Q3s4UsjbmoL1FMmgt89ICn14rNzJXizdGo/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145591; c=relaxed/simple;
	bh=Ew/uBC2dk47nMt9ts7mIHUVsND0v7OlyTcjZ9XaxKTo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KHP2xFigsmU1BEej60JTvQG8AFBnkRRstbJV5EsnBiDWYo3XQCZMIhpeyNdLUsuC1qcQkgl6VIjzIS3WxtOyftlPwT/uZhGFEOitYZY5x3p2Yl67lI31QfcrdIp0EfDNmPNSPLjjktc/v/wD/YhghH9cRgjrmh06DQbD2xQpjAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0lGlHnw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0lGlHnw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1471F000C4;
	Fri, 16 Oct 2026 10:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145589;
	bh=Ew/uBC2dk47nMt9ts7mIHUVsND0v7OlyTcjZ9XaxKTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A0lGlHnwzJ8hPbdCd4bsHxEKWwoxRUS4cMopTqch/aDYYPsOu+ZQx0Tnvn9ykFx6O
	 AsWWra+ECoDxkshIrUGM9XMGP4PexJqGiMNdbCfU6llDPDSmcNq+pGPsnXN+x80M0s
	 gPu2dvvqjK7PBkr2l0DuxXeMl23TxAt4ECtAa00bwY5COExw5ZhbGDAa3MyYo+DSQh
	 XKGEuqskucn4lR5HgX0EC9EpiaEXBPbA00kPiUHMROD+guNX5ths7MddPZVUqDEd0p
	 RLdGOEI+65TAh+zppWT7JIFyopulPIc4SDfdgKNdzyJPzl06iMZSptYe2LIRGUvpKe
	 HCZWkGAeF0P1w==
Message-ID: <sashiko-outbox-174129@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] USB: serial: add stop and start callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Crescent Hsieh" <crescentcy.hsieh@moxa.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261016100351.681390-4-crescentcy.hsieh@moxa.com>
References: <20261016100351.681390-1-crescentcy.hsieh@moxa.com>
 <20261016100351.681390-4-crescentcy.hsieh@moxa.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:13:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The tty layer uses the stop and start operations to suspend and resume
> output, but the USB serial core does not currently provide them. This
> prevents USB serial subdrivers from handling output flow control through
> the normal tty path.
>=20
> Add tty stop and start operations and forward them to optional USB
> serial driver callbacks. Drivers which do not provide the callbacks
> retain the existing behaviour.
>=20
> Signed-off-by: Crescent Hsieh <crescentcy.hsieh@moxa.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100351.6813=
90-1-crescentcy.hsieh@moxa.com?part=3D3

