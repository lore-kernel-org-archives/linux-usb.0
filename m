Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653176;
	b=vSXcxfbWSW8RigEUQwn4fbkEEhRaSC/bJAVR5T1xyFPyhxnRITki/xTuQ93eErVVPEFe
	 cssGvd4gZOGj3mKPnwXQT+9mv30xaB2shxwz9pT5xi7eAfWJgP9ePiYo4pZtZt/rKPIEJ
	 GUO3yUGytYZ35aICBRsiKHxDlsRsB7FofXZ131R8ilT3+VwUGloBm2CoSY9MkWBFLf3lh
	 gfVHZRF23SDpTmm1hys3XddjMW6MHcVlhkghfkmE8/xsGyLfZsyVAsUCbSZoOStxPmtKR
	 jR8WPCSqrlB1uT5oF/RgZ6gz5H7PHqE2Sk8x6Ao1uOGCLfwK/8gaUnk7VOMNnetDyMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653176;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AyV8nTmMr+aQZhsqxyO8DRCQxC/zcRvbloJ6lKgo8SA=;
	b=mrbUTGBluYjXEyJZkL8tu+dPTVsTH6mc7vA33C1oZ1fkjcCcO2cOLWV8LAfUapRbgsyX
	 jc7KVPCa2HPBA3w0MjzxoPbnNwgKNyU41dbxnGj8xjuOf36dd0o8iJli4hpg964eKEdsZ
	 Vf8FbxKjN9yt6yUfcpQp68s0BHVyqMxkOzwnyyk+TItJuCLN4op6vSiKlnw3kVndR9maA
	 DEUAChWkdU/svzpgNGtWrVLHIbhyIohNW7ZJzFXWKaI/NOxJkD0dKnnkf7Oq5zRn0iDVC
	 UsmapCMfbs9+B0ahwvkAIU63d1y9Qt2NkuUlNWpkL29eUCuGtbx+qhGJqmQ6b94TkUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUPLM9Pg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5DB606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUPLM9Pg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0591F000C1;
	Thu, 22 Oct 2026 07:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792653175;
	bh=AyV8nTmMr+aQZhsqxyO8DRCQxC/zcRvbloJ6lKgo8SA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=LUPLM9PgQQOWs62IZxCdqU3nEuhInShH6iem0g1kFeG+Hqv+UqgsPXsC4s1mi3dDu
	 n7KWz+W0r7sJyWub+vLH2pmXQsMkJk22DM5m8Oo1w0rQejgErkXF3SBU2RkH0IP5jd
	 JrBX6lu6xhclnkc1Ie99Hw0TmsfIRuSBtnW0FBWSmQHlsfI4Abr0iUut6p7+wUKhGg
	 cikOx39gWyChXcCv+iuZfc8yfIqUeUrQTqk8J6oKUm0AkIO+vP5cy+z87J2CeWyv2y
	 tmhess4i6+ajwDyNBwmgRbnM6d5Q6cp+T1ia5qGS8B1y9LX6q/Z/M7RpBKFiarmKft
	 mpzbWji95Nykw==
Message-ID: <sashiko-outbox-181117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 3/6] Input: misc - use usb_make_subpath()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shihuang Liu" <shlomojune6@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261022070929.20820-4-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
 <20261022070929.20820-4-shlomojune6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:12:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The ati_remote2, cm109, ims-pcu, keyspan_remote, powermate and yealink
> drivers build their input device physical paths by appending a subpath
> with strlcat() after usb_make_path(). Most use "/input0"; ims-pcu also
> uses "/input1" for its gamepad interface.
>=20
> In preparation for removing the deprecated strlcat() API [1], replace
> these pairs of calls with usb_make_subpath(). Pass "input0" or "input1"
> as appropriate so the helper constructs each physical path in one call,
> avoiding a separate buffer scan and append operation.
>=20
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022070929.2082=
0-1-shlomojune6@gmail.com?part=3D3

