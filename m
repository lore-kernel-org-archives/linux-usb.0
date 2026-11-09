Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184861;
	b=wWe8CxrHDgtFgz0/V+4AyHwccRTKFraMyKGR1RoC+0csEVpuJCoaHM6x4NfWygA3kfiN
	 XgrSnivUIiVnL7TQzKOWFt1yI4usOgp0TiJshoMGMfRFxpdapTBDqfm6YaKdY+hWtFty4
	 dP3RnIuztpV50Qf4zCs303BrVj6YJOJsdyuoHbTlSy2sDVEBysCrPrqE/cGg8TYRNstnp
	 fODRZweNy0oXEqJNyMeNhuIBd2GvkqQcvBSsv+wfDb+LvVLHPvbMhAmBhyjUG8UzCvjRb
	 dM5PTMEWLZ4C/K8mE9yalaw6mz/HF+TjDBpOkuXCJnH9+xzbiOwDLbecNyzAHvz52dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184861;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f0Kl+Arth854YQdg0wVgiQA59pq+B2C0oMm4CoUVGGM=;
	b=wHUUEhRa2LR8CWMhZjAiuIgceurJROQwPFwzg249AyfhcU2fwIXOqesWqcBbRrcqqXer
	 M6EnFFp4gdTacvIuzjYsHXILCxlqWKySvPh7f6kG3KMSiSwi8sHekVftGGQhiaZNGsJ1/
	 khPf2amDXzI/4yPp2CLFvi4ggE0xaaIKV4f00/DHjO0kYpxhPp9rMEBcvz093RnUVE28n
	 lQpEX1xdZf/SngS/YwiAs8DR5jq1+/lVCFLlEa2STOTvl+6Zo4nOuDJFWcRNubaQge7eP
	 KOTqJGtI8O4Jz+YiA+Hvm5SsrS3HcDBL3RbrCltH3KyYjlYpYxDECaGvgWM49l0mYcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iQI17n22;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654A606A31C;
	Mon,  9 Nov 2026 00:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iQI17n22
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4721F0089F;
	Mon,  9 Nov 2026 00:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184860;
	bh=f0Kl+Arth854YQdg0wVgiQA59pq+B2C0oMm4CoUVGGM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iQI17n22FsuH1eyYeQ8dGbbE/bmSOKdLvUsuOjVMrHvFWjNdvYslqu7up3lyImSG6
	 6wn+7ekLz78sva3ZMJCYfm6WlvRIxKdBodX3YVp7VwfApSaXRALZLRXLnuPXIxGsNX
	 HlLk9eohbj8pbRww7kAUPZIEfocLF9p6sHQyxpZjPWWha35ZXD96SIchdgUBd4ni6o
	 GXY+Cf6ro4Q2vs8Wy/rnjTr6FA7L69L2FDn+opYy6t/wcMxyGETttx5TPuGlZATAlL
	 enj0kAxpufp4rm9FZkcNieMqh/rgGN9Q6pCMJiLu0npnC8ZwoRaze97xs3w4D0sVIr
	 46EiuUgrGpNcA==
Message-ID: <sashiko-outbox-204237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/17] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-4-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-4-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:41:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the RPMh Power Domains on the Qualcomm Halliday SoC
> (SXR2250P). Its command DB has the same power domains as SM8450
> (CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
> qcom,sm8450-rpmhpd as the fallback compatible.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D4

