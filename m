Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761641;
	b=FFoI9Xl8754BAnYMFv+DjjAirPKVTfbwvojJR1nWrYK89cIW66XgPZBNSPEqfYD6KBFo
	 3wkuFba08JfKoLUe/qqbTi2HY462toTCoSlamX54uypc/I9iwa80QP/eKNkod6bb/0Ugn
	 zfyc0wN9K/Zah8gh2c1jowUT/BP/ste2pRkCRRL2nSFoYPyA0ETp38tIvs6f/XL2gn+1B
	 Tk+S3qyFUtyKUuBmzfjIyNH9yDeXCZAVD9AERnxpneIz/ruJ8z2XumAzuhMZX/danN2fA
	 ZR9rQL49qA1f3ToY5Yo+LzjBIBXnU+M5+dqI3XNn6GsyR8SGQePmcDs7O87rvBP2GPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761641;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G8kdMDqNgCFyrufbdBkEh19JGh4CvqngKM7ST+8SzF8=;
	b=zjU5EwhUL/UI8HTHx4XvxkgI/V6nQKYkdo9jTN+gwhoxQ+Kt0m4hoIF5Eqilj+AVzZLy
	 C/zgESMp/AVkKVlz6Q5YfPT39qx9oPyquuFPcOjabu8y9a8hy4UmfjH6QgrmDRNENEFpr
	 tWb6cE3Iw4g6SjLmVWgAg6DlKXUm8AxRWd+V0p7vlAewQLWa08Oj7ppVb742GPiBaNAkF
	 Q9OlW66WFjbXEaxhjPqQIhtiPI30vt8RfhJLVDcX9fDPiMo4lNifRF11EBfdizsqnhK9K
	 BxxGreC9cPrOgVCkYC6/raZFntWiksXQiMpLSmyJ5nIMrwv3ixUrsIu6RqqUtwxqwZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCfYcrkD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC7606A32E
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCfYcrkD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F22A1F031E6;
	Fri, 23 Oct 2026 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792761640;
	bh=G8kdMDqNgCFyrufbdBkEh19JGh4CvqngKM7ST+8SzF8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=MCfYcrkDfgEtV1QSCKSsYB3jV+APvKnO9nTyKVxvvczVz/cj2Y+0B0JK4Ml692Xws
	 SMuGkk6wgJ3ui9LcTozMh6rzbOQ9LQw1yQQ3yM+RJqcE7Llsa/welTcz5twTuN0wb4
	 yAw7Bu8HT4hdkn64TAmZWtx18j+niLxAH/A7aG6JYCWhAUu8eiHzmMxSsVRxhPqbxE
	 cDIbIMQN38LTg/tak7cVYUptq2znKpIMVWkLMdYlpuLoqNyfLpvPeQKa+U/6vFmJL3
	 j3dJh8iW4XhWoD0v73IPzAdiLRDacD1gRZPeqIS8w6afZT3S0Rwek6mC4ElM6KCjvh
	 SiaQCU3t4VNCQ==
Message-ID: <sashiko-outbox-182818@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvarasu Ganesan" <selvarasu.g@samsung.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261023131501.3157463-2-selvarasu.g@samsung.com>
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
 <CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
 <20261023131501.3157463-2-selvarasu.g@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:20:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the Samsung Exynos8855 DWC3 binding using a flattened node
> representation, where the DWC3 controller is directly addressable
> rather than nested as a child node of a glue layer.
>=20
> This is the first Samsung Exynos binding using the flattened
> representation.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023131501.3157=
463-1-selvarasu.g@samsung.com?part=3D1

