Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843277;
	b=lN6P+4IzszPEUs45lhoBWf3y5j/e2+tLP85CCF4e84QsmdnbOqOEZBODVmTfFZ0MQ87c
	 9thRjkZCimCJbn/Nc7V64/W+/ktHdBpqqJ9D0USQfIbYykMZBUrRrtBbTf1hhS7Vnza54
	 z6TEBcCgkZPC0ZZq6FQJl2v/pbAboDxzxfpq8OaHqC7bu07AzUm6x7WegKuCdNbHf23aU
	 +JX1NddsEtv8ma3K/tgVhzv1HOhVMk6rzznTcmv5jB3KUd50Xd6KiSTUYN99fh//6yDx0
	 //+eiYzrPrqt9VgxB9FpUp1U8hGrFLH74BUgISWRaReiR5W7aG7x5eOB+Vp/3NJ/bcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843277;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LaxAF6Rg3w2SSjF0mNRMmz91bhn9SAfK3+c9RYYNHWM=;
	b=U27UUZa5GF1E9qu+qRf1LXUtTePbZ918FTfVIT4mU0Rv8lOW/gJSDBdPig4U2YgU3rVO
	 u+VyBrzP2ia6+TVAmZ/huShPkni7XC6TvdIDpjOioJ5wzyNXRdvkB/WWSWMoJUdCptQPT
	 /I0S/UzkJCOG7lMqWMI1QtYNUdjDBm0d1+/slNdIWzKSCun8u9cyyxJiAX6Bksr7C6Yj/
	 Fhf4CunmQkuDP5rkuy6dQYED9+bNQbwwk0uSjKMUdND7MzZyZ9aGYdXt+XNDuxLy5ti4b
	 G5E8IPjywkYj/PksKCx3+bsvJuVDaCM8wa66eMzyc3PzRq2zu0gaEuhlOcGs/WoynNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VUybNXA+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E81606A32A
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VUybNXA+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD931F000C4;
	Mon, 16 Nov 2026 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843276;
	bh=LaxAF6Rg3w2SSjF0mNRMmz91bhn9SAfK3+c9RYYNHWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VUybNXA+kkXJwqZ2Atlu6uXZrPxdSan42v7no693fZW0gCyLuTeu3TymuPPcg94IQ
	 W5x1pdjjbFf6OVXvfLJAtz+ko72XSP1i3BdwaRMJ0bhcfEhRsNnuHhv585WGLH6jg8
	 1uZMkOyZIS403ia8oDtoAg+8/rxy8UEQZHiL2oceWMN86baIAfcvKd0D78/iQkVkWL
	 2cY6j5XF28UQ9J8ULyGT9iikHpKNBat4/VO7XWI8mvfcRd4mS+elw16bAS//DSO+nT
	 JkX3A0sjwk9+ea7XTr+5LOjknFHAaLw2Zl+J5WApbTM49MNwZfH25OPxpILLOa/Xzf
	 mIpnT7Put3xrQ==
Message-ID: <sashiko-outbox-217292@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/12] usb: gadget: tegra-xudc: Add default settings
 to SoC data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-11-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-11-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:34:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Some of the default settings that need to be programmed into the
> SuperSpeed Port (SSPX) registers differ for Tegra264. In preparation for
> adding support for Tegra264 move the necessary register settings into
> the SoC data so that different values can be programmed for Tegra264.
> Note that for Tegra264 not all of the SSPX registers programmed for
> existing Tegra devices are programmed and so only write these registers
> if there is a non-zero value in the SoC data.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D11

