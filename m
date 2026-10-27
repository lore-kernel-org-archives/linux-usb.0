Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112793;
	b=tYj0Qe85n75clzQoeKQwkRYVfabAHgjiFzEvlS/LPfR1rmDkD2qgs5pWxWIw40/fxGNm
	 XN/nnH40aqA674Byezcdj0m8UmfeYUPaZncO3K7xMeGQr52/oOiiRjE+AchFaRfZ+y3vA
	 tgADsUB9MQdVVGyEHY6Ba8Vt0565yrPcWuCO1R8/VG9PsQEvxHGdw0lLADTGdLBptfWgF
	 dnYJO42efjwmGPRbAOZvtxbcVkYbQKuRHYi8UWld1/gg4+UdrGdH1WH344Mct3lNK/lxU
	 wZilSZhOxxxYwJMdlhhB3iPruiZT4I3WftwiHV0hX58WhFtReMklAVvgEak4Np9wMeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112793;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sBxc9DYKZjXgituJs2h44VkppIduQau2nxACJ/08j/U=;
	b=KDsCSrrlpjLqRGAxgRJGjKMroNMI/Kg4ufY6MkaBrBKsVANdFpeYCQBG3NWEtDz/K9Nr
	 uo+I110l2ph+aKj6SzxM5jF5hsQB3L82WE9iS9nRKhjVPMY7SpXEFeQ1mPguoLtMgmcum
	 FArLN72iM/aIbhW3JVmsZ3bo44F6G5baH/rFeh4z2J6RtrYpvt/De6YJn1afg+h9fFm4d
	 6Z+4ecGwWmOmlaOSgVpKAJ7QxGPrrg/538hJco7e7RsZJwKunkq6ppNQbQZHnjT8wHDLV
	 +jNYQW65gADFvw/BnegVMIPExSgdWQx8kvDSqmZDzqWOUOVnA74L9pI+Ya+TUSIs6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TT5Y0Zg8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF492606A327
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TT5Y0Zg8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F011F01825;
	Tue, 27 Oct 2026 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793112792;
	bh=sBxc9DYKZjXgituJs2h44VkppIduQau2nxACJ/08j/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TT5Y0Zg8id31dw5klnkTDES+tTvJglRNpZSiOE+YwtNBVrZfaSQ8LSUFo6z7nO82G
	 z9117VCL/VTlYR50Jiyh1hzhYP+74vhH/h1HVhbRAPYGfyPVOQCYUJXLU0+eJUs7Ww
	 HjRB2qb91RS8aS/hAbv+SokhCwggiazpeaZreGYAiv1FD8hCyboJpzwQO2aJJ8yroa
	 qfYK/6k5YZydZUhLOQSyAi6nPxU7hPCGFNu8kxBxFourZOlPqUIS42ZG7R67x6yu//
	 uequXud6SYX8+8QpS8H45+icE70MgTeSLQgEsdJfbIgliHRRaY1CaAzhgiGMDuy/pT
	 967Z8/tL46isA==
Message-ID: <sashiko-outbox-186772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] usb: storage: ene_ub6250: report boot block errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-storage-v1-2-d1655e94ed10@linuxfoundation.org>
References: <20261027-llm-usb-storage-v1-0-d1655e94ed10@linuxfoundation.org>
 <20261027-llm-usb-storage-v1-2-d1655e94ed10@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 14:53:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> A Memory Stick whose boot block is rejected by the ENE UB6250 driver,
> for instance a hybrid card or a card with an unexpected class, page size
> or IDI configuration, crashes the kernel with a NULL pointer
> write when it is inserted.
>=20
> ms_lib_process_bootblock() unconditionally sets result to 0 just before
> returning, so every failure is reported as success.  On those failures
> the logical maps were either never allocated, or were freed again by
> ms_lib_free_logicalmap() at its exit label, so ms_card_init() then
> writes through a NULL Phy2LogMap:
>=20
>     info->MS_Lib.Phy2LogMap[btBlk1st] =3D MS_LB_BOOT_BLOCK;
>=20
> It also means the second boot block is never tried when the first one is
> bad.
>=20
> The bug was found by code inspection and has not been reproduced.
>=20
> Fix by returning the real result from ms_lib_process_bootblock(), so
> that ms_card_init() falls back to the second boot block and fails when
> neither one is usable.
>=20
> Fixes: 33842cedfc33 ("Staging: Merge ENE UB6250 MS card codes from keucr =
to drivers/usb/storage/ene_ub6250.c")
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-st=
orage-v1-0-d1655e94ed10@linuxfoundation.org?part=3D2

