Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688050;
	b=RyXSjfVH3M8qbvuc3s296jrHshaCf9ZWhi3/+phycH2SanZjFB/Z7Wbo5Ta5U11Z4dMM
	 QLwYzRUCQUJ6egWQrY7gkheDuOD/bzVvLs0X+/dvveDlxZ9SJVAIHFbShS1Gsqew5ijwr
	 O8kK5VMZ1nNEQLXgvsPo5FLyHMbA+Dhc/y4UuK4GLYh627pFyA+lhiJUiN4ROcHFdXVBa
	 JMx5tIdAKwBkVNueHUBEgdPDRhli0xq/1Cq3L+6cC2y0kuG6XL4GC6Ep+CyBNyF+IBwbF
	 NU7DGcpUGse3JNw8H7+Yb95zzERQOOTKQndffwTygBFsMv2nHL5RcMsSJaDT2NwddNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688050;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E+Pc2de3+8UXpGFTBFpeYIshixkB04aKV87U5y5LIW8=;
	b=JNCvci0cKqv2enfqjvXd0IHbHzOT68SSeR4drZ98vcWJbPdUnlcB7eJH4N9ju6YVaK71
	 xO1Gba/BG+ptQdnqCai+mpemGmTIggdloGAiS+oRNhbKo4ay/5obCy1WFQbxVbOTtNJBm
	 b5oiVTMwEIJAi2FvsBOEBgrx2wG0omzabVdjtj/p7D5VIhrBt6HAi1UUST+U0tAfVYxUf
	 258N9dq8f07u6b37guijRalPQMjvJbm0OTr4rdj0/yM/AqWlJg722MpCjy7357izMaGEj
	 cvSA/ksLjsKO9GmoeSLxFkfF+qewykenIVe6IWgcfDRoZ5rG75vjp52qo1qKArE3D4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYVPcbPM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C13606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PYVPcbPM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7501F01825;
	Thu, 22 Oct 2026 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792688049;
	bh=E+Pc2de3+8UXpGFTBFpeYIshixkB04aKV87U5y5LIW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PYVPcbPMUWpqGBtAdV+r7Ao++giI0tXRmMCVRljaD3ORLSR1vaAvGRt1mcbb58Zn2
	 QqFX0f/j2t48pC4sJba+AH09gFBAHoLFQlqWynWGaMoAnBAof4yFMp31LZ/qzbq3yS
	 tty84h28uH6v7dpuFHISrsX+6YYrqq6fJ4jXswKo0u0rxGVeNfrqSqkCL4vVdX9/my
	 slUjVs77P+frqj1R/XOe0DKtpiAoN5VSRxq4XOyPriHtRmY7/o0eKYbyzIVY/yLnF+
	 As5N8Jhk7tvu3a+Ul30hVlnVlHAar+O0hzhQQ9ddJMd/xHRX3dmgdmyKTiD/3ATWBA
	 3FBh3hZQCRokQ==
Message-ID: <sashiko-outbox-181833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: mux: fsa4480: Keep the USB 2.0 switch on in
 DP-only modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022165143.1327-1-26rote@gmail.com>
References: <20261022165143.1327-1-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 16:54:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> DisplayPort pin assignments C and E give all four SuperSpeed lanes to
> DisplayPort, but the USB 2.0 D+/D- pair is not part of the pin
> assignment and stays available. The FSA4480 sits on that pair, and in
> these modes the driver turns its USB switch off, so a USB 2.0 hub or
> device behind a DisplayPort sink is disconnected as soon as the
> DisplayPort mode is set.
>=20
> Configure the USB switch the same way in all DisplayPort modes.
>=20
> Fixes: c7054c31c1c9 ("usb: typec: fsa4480: rework mux & switch setup to h=
andle more states")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022165143.1327=
-1-26rote@gmail.com?part=3D1

