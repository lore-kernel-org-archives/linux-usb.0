Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011889;
	b=bDXy1cMQ8vCfze8uoxW3geL/T6bdc1/wvygHU3AMWXlyVdEeTWo//QQBfq/jlYC84VoR
	 qrYKZzGQ4We71b0oWLbpybkk6B918zdhodlmTHiJvJwPZenFKdMZR18sp+NhEA6PMhUvR
	 XfV5yo25P3cjdu10hagWFAdl7PF3sORpMC1dMEn7PlzEs1mqtHn+V7iGIn0qb5ZbFF1b7
	 H+pEJ92oOzXiFV9gQDmhL1eaL9QZBxOMKcHwvCCR6ao2c2vFH2l8s51nwdyxInprbAgEF
	 H5UIudtFIKxByz69j18IfoD505bR99kmtJ92wNaL1ONKeuFYlW1pxcSr+DvSB5ApvQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011889;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=izXC1UC4Nh4H5TfEza9vVSn5C2SjaIWdo8g35fpi6hQ=;
	b=VMCBdNEaBiH9zzg5l+fIF/IE2N4WNbZEBfpIA62iP2Q2BmJralBAjJ3qyCN8QgyzfxrR
	 J3QgMcxftDdEt//igqotCFMq0xjEZd4DuAc3ntHna9AuKUyE+bTuoOkCUDsLYPXo5ybpG
	 3Tir74UDs7qvjAat86Uv6ocjJ79Y5ZKzMyzP2mTYtp982tYkaTuKFxgYaq2hx1HoEu//d
	 ZMmdEqR7L+NRzpUpEDAid4InjramZbe0QrHH4iDjSjjsp39tR3ASkdQJLhBZYnIPCSk2E
	 VPzC7hu4U4J3waspxrYpEOxuP1r1oubXhBnS0vmwPrC7TStpjzRvmIZHsRQKA6mygGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n7GVeVeW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A76608361C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n7GVeVeW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA80C1F0089F;
	Sat,  7 Nov 2026 00:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794011889;
	bh=izXC1UC4Nh4H5TfEza9vVSn5C2SjaIWdo8g35fpi6hQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n7GVeVeWE094SblLVRtykQti70ExlRUuR4mhVVxlSO7QOsyhkNsz3T6biCz8hCSB6
	 NWrkBxGbwdo3dtVt6enludoJmH6+lSjGOt/M3cQOMybjW8iZtB4RHbRIbwLt2icRBk
	 SuAobtNbBztrig9awUUoWqlE3ErP4zVegdRtoOQ9Rq1HQjndY+MZT+P6FRXBq2P6ao
	 nHJfdP47QP7ArptUXEOxKsXFXbk5tbmptiKlkfpr7azD3EOSxBwP6UfLZNBDQwxGv+
	 S0WnJeiClExv/wy3stnbcRDf41gxZSrFS4f2lllBFaLpKchXI82A5ksaUoF1y5sY3n
	 8WZRuB+ISOL3w==
Message-ID: <sashiko-outbox-202434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: phy: phy-ab8500-usb: convert to
 subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Masney" <bmasney@redhat.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-usb-subsys-v1-2-3a86369c3f86@redhat.com>
References: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
 <20261106-usb-subsys-v1-2-3a86369c3f86@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 00:38:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-usb-subsys=
-v1-0-3a86369c3f86@redhat.com?part=3D2

