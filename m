Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864619;
	b=yHxki1VZgnVxvKgkeLlq6GzM+H2z5Q1XcRflwRyzIXBbgXsujI1tIqnGWOKsfS1xLRDj
	 km8jRh2j0D+HqVLEiKudt2r2msoUPO36B5buUqBET1ivjw+KQEz0BSlDoYDYnctXgS6dQ
	 YMnAhXbevjbGDTsx8s/jA5bCBEFnxPENm8eP/L4qI4Jj3M10DeJZKJARpi4znjTGwQKLZ
	 vsbAM2IJrgqdq+NOs5QJx5phFZZRrwJmrEbJWRewwi0HVZp6qbKpGmdVi75JDWMIG4IyI
	 4Kl8BjCr79my0xPr0t6dAZHRgBfwCMFIOT2PovfvDhATRSwpkLG73r4+oWVnuycQiFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864619;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fKtr3UFu82SpPVCYMkxCUugDkfPc/v20BEO4WwbVopc=;
	b=wOfbtYYneMy4uj0gpaDhCKO0LbCG12CpMCw6jdwpVTP3ZS7lC/ibRlwEm4EGU1fkSz3I
	 7qnasu2Fptt+/L4IFJC2jURBrA/H11f4x+LvWeR16Wibm41P5XH/o6NBYw/67ysZEPAsB
	 qVPTNOq0Uq4gtwZ7PH20njpu2VI9Sr9LY3KjC3Vg/D/CsPHazFX2F+HytGypl8BNc+jzW
	 49xtQJeag0EQtXUCZTnlbGzvZuSRIkirTNuBmUS/8XK1LXErUnY72/aoNdgov0//gFScW
	 SV064fd7EbHN4u/eeqlG/OmJ2QvhZcbt2icycwSfpZU5LgN6Aky3vGioRZNJwAvmYig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=deC3fcXr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5ED606A323;
	Mon, 16 Nov 2026 21:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=deC3fcXr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CF91F000C4;
	Mon, 16 Nov 2026 21:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864618;
	bh=fKtr3UFu82SpPVCYMkxCUugDkfPc/v20BEO4WwbVopc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=deC3fcXr3hIEI90nXPaqLpT8Wr/o3UL3BSUeDhuBhIMRdsE+JAwJrglF1e4N8LwFz
	 KLIvJufqrYsO0ujA5ABdtYerMeDKQJq45x3A4u4ia2pGnWrRFwsiU43Amou9gd9EJP
	 LgCunZjwp5vvsZmUM0C2+uormFkDuvm/J53JGt3D64rnGjfMAHXwZ1YFo3iJnC04B9
	 E7Hycw/0DFc9XuBy9wLQenA1Cx6Trx528crhy10uOaJN0r7S1+2HwhZIueZwO3fEQm
	 fWntSNFfeMALJK8NM9Yf1vJ+6zvZmg1+BXOBQ3ZxiMG663iEqrXaFRw2RHz6YcU3EC
	 oP7z4C7RgHzKQ==
Message-ID: <sashiko-outbox-217721@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/16] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-2-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-2-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:30:18 +0000
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
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D2

