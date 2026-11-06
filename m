Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957823;
	b=GkLeR6gnjBxIAHPBcq/amcPVNYqvDMTDiJZZyVAfHWiY7lcaoLanCp4rX56JY9lxTfjI
	 fVAXUG+tgTzOryqIYdeuqvvPUIUtClyfFsqXi+DeXzT9mGayOpc9PKpHw6Vt02HocY9dG
	 E2dEnk5hqsc7Pg2rKNTHKS/MxPzOlwXO3VhaG3n4PCFlhYo2L7gEimeJMLsAdai9nO1R/
	 IKY91xrNvKnKgyy1/jUSj++u5db3fUANO6v7E8mip3FUNWrLXPQRIq+s/jTjeIRnFXvhm
	 sIR2LFlmJtMhsXL/7el9dvwfGpx8P/p+biASQ94Od3g8ZyfF+d1AItSxw9Du3F+zg8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957823;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o1yO1BKgQEOOtCWrGJeEO7OUwwZhDKb2n4n4YE4XoXw=;
	b=AQLHWTp8mx7oxwYsghaG4QokF0cp5IjGQL2LVpVhlW5AjbOTJFGBj0Yj2GxCs4wnIBEb
	 ahU/fCJRYr7xQrP+ZEPOtb9VRZbBsCyFTllvPjB7ceYU1Rxo9+nM1lpD5RYLBuYY09wfG
	 SfatWu8D5Le6KUVVnLvx475/wNohHfwJXSrs8hEKYWJgB2DE+7H1ovga2EBGj043VgG7j
	 /CQaBADXFauLlpLbxxxzObxZdG7wSvw55gX0+vhoWdBq9qi/EataA5hafJv8EWnNGRVdN
	 8wCjg6gehzXdNjX4BIaGzSmSg0FEdYzAs1D/6SHc5FErWcEwauEEnx6Zhz54roCRVjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huBLUGSl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BDE606A330
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huBLUGSl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32F31F0089F;
	Fri,  6 Nov 2026 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957822;
	bh=o1yO1BKgQEOOtCWrGJeEO7OUwwZhDKb2n4n4YE4XoXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huBLUGSlys8x7SXWevbKwuhW9t2zNRNDzBHl4oYEd1xB5ihc4+f0SSENFFsSa2m8z
	 CR5a9Ih8q/8+Awx/wlznnaI4sB2EECtLwqtPb4qebFQycEfggkRFEHgyaS4LlU1L4y
	 GpYNWARpAxs6GRIE11cqK2ohiYVrCGBCQhatNBaR5E17fTsRxtPBEKgBNcr8Q2YQmX
	 wHWmMaDzUTBe1aVsotEMWTqFmA/CpwIn10B9wNLvWGUSWIVIX/kylFXRWqlb7jcPVM
	 VCF1ObpwRYvFPXm6vJ5AcYsp2Qeu9mG3cJTCO+ENNyaHN36jDN7cMw15hcAh++GzQJ
	 /bnpGcaE54dtA==
Message-ID: <sashiko-outbox-201132@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/25] dt-bindings: spi: andestech,ae350-spi: make DMA
 and interrupts optional
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-11-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-11-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:37:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The ATCSPI200 controller can be used in PIO mode, without DMA, and PIO
> transfers can optionally use the controller's interrupt. Make dmas,
> dma-names and interrupts optional, and require dma-names if dmas is
> specified.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D11

