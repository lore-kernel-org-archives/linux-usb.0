Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117936;
	b=EDxMc1xQRPu2+cgUuQuJhZ0KclMq8+xco93qjv4rhfg//4Th1eLG8TD6UbIUOfYRvOKj
	 +JdxRSurg3aI8d45Nx+63D0e+bBnWtbi/Wa6nHa1i4hBGI+4+zvDqN5QVXqwxTprjQNZg
	 bwGsSQF3VZUJEbMP+oDYl6xb4RooXrCbilpTxvZ3XZBxzAXixcCJqQD0JoPKceXsgbuMJ
	 9VOwcAS/EkOas5DofnP39aOaAnlkyD6+Zrza2ncZsYRLyMv6yzmXzXqHwn7nrHoLDyOU+
	 aL4ixa8ZZNuy/hs3I5Z//Ak0LL8aR1MxuSJLxsDuAOI0YqpIcoA4uqhKZXFnkkTTFsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117936;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0HZbnDXoq4Eku/V/FEmySmWB0cYpeQYCr4vRaqwOVGE=;
	b=gUKBLwHeE0TvX4xRLRJkuINQMLpTFjFEEtQ9j7/ghWgAtmDuoEz93LNKRPKCR8h7xhwd
	 9DzPSkJ0RvR+CEBEC+Bty1JIFjKCVsQtRdICBldLlf7cfL3T7kPiPm24XAHDMT9xakb9f
	 mmEjqP6s518BGppp0Zx6+v+k8ZWGjWBJ4ud1rvAph5I037k+cZ22IhbRyUZwvaabNKWb4
	 VV2WxCTP2i0vpm/7IVrqz38XqR3aHGXkIm6PoyjfKmMwKpcuF0+iPFjF/kkPUyPopO2sW
	 DYL/LlgySDk/A8+TyxN6AbJ+SfN+mptzRcVFRRDnnJ9qlriB40NDPiTAVuvvcPHNt8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=my5rd8Wr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B6606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 19:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=my5rd8Wr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4171F000CA;
	Thu, 19 Nov 2026 19:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117935;
	bh=0HZbnDXoq4Eku/V/FEmySmWB0cYpeQYCr4vRaqwOVGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=my5rd8Wrx0xYk8cl9P9hctVCTp4SwEsT3R55RGZGItGtsn1jnwjAvezmpO7FqBiLP
	 FQrihbYN0PSaaHrZG2FUGgUjOY0sCcHrw6yqZqdhiX5kavEr7hINbVKPGsiCHjOHMx
	 h8BCCTQW9q02b4/NbMUv3xCq55YaFPRfB/JLxUkeZGmg4tOEDjuun61/d038rJM8aY
	 3cGYqEOzwFZPNBPE9pJ/zFcYTPyetrkCWAlZkOZcclXHRs7ep0lJ9sJNBwzTaRYpyV
	 cR58+5oAVl8umVMJqL84ibCSH3TAQMUV4iTZt+cji8IQOlZRw4pSMRg22+b38o79tY
	 MFNMLRwq/MWAA==
Message-ID: <sashiko-outbox-223977@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: usb: samsung,exynos-dwc3: Add
 Exynos7885 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-2-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
 <20261119-gta3xllte-usb-battery-v1-2-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:52:15 +0000
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
> Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
> existing Exynos glue layer. Clocks are the same as on Exynos850.
>=20
> Signed-off-by: David Virag <virag.david003@gmail.com>
> [Umer Uddin: use samsung,exynos850-dwusb3 as fallback compatible instead
> of adding a separate match entry to the dwc3-exynos driver]
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-gta3xllte-=
usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org?part=3D2

