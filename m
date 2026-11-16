Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843137;
	b=DPTgj7TsYHK9R4+o0laPrJq2dYOWBQyuHD9BUaxBsMTeAb3QyPxYl9r77UjNqxw3nLQl
	 Mbh6XKJ7S8o2wQqCxk/w/novDHsn1olMB0jRimXMAjFywrtQecI/8fuVR4rJqeyoqy2ht
	 pRHBPoiCLqk3eI26DzTEkCS/cQwZWKIk2DXc5KSFo31GHvC8UjRX+SuV4T8ApktwXlV8y
	 u9nOXwWZLRrEnCmZYj9ysPZwbZlYEwtmYr6YbsCxP1LQwiPPU9ndClc7pPzQ7+XD5x3wR
	 cUqOKJWuThmvFXzqh9WazQGhUO0Cn2JPwbw8QG+JsP0IRbT6tNBxW6we+3/chVPd0Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yVc8Ujmu/aCUmxg7OlokCP/kdjkqXFPSYdqsoMoj9Aw=;
	b=hSZVEWBcghmRMekFMOyFqfJnOG7Zx4CeCePTz9JThZl7/SRk4K3zvGhnsLFC9Y9ePPbQ
	 L3Cil0nxmQNl87p6sInZGi0a1EEheuiwaaD4k+jNEFRDheg0Wf6Sf18WjlJXcEaIpPlLc
	 PmORBEaGTEo33iWi1X7qn1yW5j/C76EU3dN8pFHFZEAyOlAB0yQ77Cr/0DuY9CO/MF4nV
	 kGUopYVTFI0eiqC5K5ovtZ4+0YM17QPofUjwcFw4w1/dAsqRweYcWScPIGkTZRNa0VaWo
	 HfcfWHFTFoy66jecC8nJy65uW8AMALg/qVDt80wQZDJJP2EjRrkSvhIre7qIgd3Ilbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAV8B95X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EB606A32A
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAV8B95X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B621F000C5;
	Mon, 16 Nov 2026 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843137;
	bh=yVc8Ujmu/aCUmxg7OlokCP/kdjkqXFPSYdqsoMoj9Aw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MAV8B95XrtZXVW8QEwaeN8IPmizfOkk1M/cZOETrg84x/b/N4YyqJq1znm/qhHfcF
	 eChk6wApPw62tH7BvUTT8C3D1+Gpj6RuoKeZhEtDfn1voxPNxEo2nuUE+P7G716ilZ
	 bv96pTUMMquslOIhIYcWgQgZba+TYwQ+laimXiKQinH+7u/MG6xir+ddbQ+L/DElKr
	 NWTh29AejfjaHVHdx8HJBO/gi4d+w1KfbpwPLPjhQz1+2tJ2fNi0PI5xsUjIhyCg7c
	 Fb3ipn/E78JnHJq7XDshn3fdpkk6eZR9DQMjrMBLjLwhVp92EAlcBlOGhLB+4EHbzy
	 vHKYtpUqMjOyQ==
Message-ID: <sashiko-outbox-217286@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/12] usb: gadget: tegra-xudc: Add SSPX register
 offset to SoC data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-10-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-10-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:32:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The SuperSpeed Port (SSPX) register offsets for Tegra264 (0x4000) are
> different to the existing Tegra devices (0x600). In preparation for
> adding support for Tegra264, add the SSPX register offset into the SoC
> data and update the register definitions and register accesses to use
> the offset from the SoC data.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D10

