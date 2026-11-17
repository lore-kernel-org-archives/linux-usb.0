Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919406;
	b=C2/piJxEES14U7zuQpbfCL4V8OIvd5tIBWS9GxmtZbrotCOsCqLgKeUeFBRFnglbpfOQ
	 g83vzt93XCrQvFtLziLy/g79J8oARYg1dU5rGH3aKMdUpO7NfUpP72Y0kLEpn7TKcxqlc
	 Ivp4Mv8p8d+CFs7pbukW6OxU3GJxilC4PRyK7ZB2QPNkAf7INP2ip2aklZimMcCmkoozi
	 2sdWpAREpP+0ajkBOO0gda+0S4LPmkgGNYZRxZZ0nMXHoEk+fiJJW8ZLh7qTfoH24jn3j
	 uZLP5tHpcxGAABNAhYp9urwaYWy/jFTy2TycgZGvPH3ZNXEM34XJV1X9VwJwYsIta6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919406;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YdTOENV2U/QNuvoRHV1ipjsZb5HtSP8TMsn4XyzT8C4=;
	b=a7XqBCGJUb4ltoGpBG+SbsDg03MqA4wHBEmD3mpPh2haxU/yzD3OxBxSyajSmp0066uP
	 VTYf37GQrqSrF3+Qg0W5g3oY0H/kq0n7K9Kip1jMQUzooQs4u+ewUfRWEMXw+yKTUMy3/
	 Zvr5zL90lAl5PApoOuFs/cLBvxypk1/KKCLdPfpWT5Y/PRLaJAQPUYSelGLEyqb3FnlsT
	 0mraKx9QlTUCqDcIZC01A6SxvqW7dUcOOp45Pfmg7awDjHgFQbN7tEeC0Cuv4Q8cBFoVi
	 lGoHOSFT0/SV7KkaeSzM+NmBdT6zvH347szuaaacIFXYCY8C3XsuV34Hmp015z41z4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdcm767L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CC4606A32C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdcm767L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEAF1F000C5;
	Tue, 17 Nov 2026 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919405;
	bh=YdTOENV2U/QNuvoRHV1ipjsZb5HtSP8TMsn4XyzT8C4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jdcm767L4Vvx/xkP1lHF8x80enEe5YZW/zdX0S32IlKjp9FS8KZ8bVLrFiPM0CzOa
	 F5zf31Srr1y1VLNTm2YN2lK+3Pz5cu5eg3OlRWJh1xm5jvL7oZyDUMBx0wzFzvcYuv
	 gi/DeT5INEu74xDcYcNgQmghaJTh01t+mgieTctTRsMkpQjGOD7buCALUYr4nB0sQZ
	 Lie5iNrQ2hKYQgg6oKP9XhQQS36Pb7VbcrZXHmm84b6ENo3yASrN1FpK1s+etuMlr5
	 z6RvZMhF4fmvAS+NzqJQwMHhrRr7RKLke1pnENXsHSM4SepEqjnuC3vkzBwhQnuZMi
	 pmn8f7yTREOnQ==
Message-ID: <sashiko-outbox-218783@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/9] usb: chipidea: usb2: use
 devm_clk_get_optional_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-2-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-2-52c3829cca69@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:43:25 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-b4-spacemi=
t-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com?part=3D2

