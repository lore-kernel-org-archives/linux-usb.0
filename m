Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817273;
	b=35ypnwekxpG2PcSL86UPVCARjQymP3Nz0/atzv0/68bvGNqB+nzSwWmnxt3p5OoIsBlS
	 FxZVJUIoXixdXKmbfzi0yw181FljutL4nDlyjYYu+sbUjSyFXrNQYsKSdTjsvUhS7Fsi4
	 K7SUDLxmqKsD+tRUQKDaY2IAj9NfCrm5AEpG6g1MAyzaYSAKFFmNfQZJiZbkTBAdLFCvg
	 +XUODpvtrnIuT7HRa8XhbdG37KxlGsSlc8LOH95NIwjZcE9UFsnvZ0rU3p+jHEUQOqiun
	 EddpVAf1w+Rb0m7Wl04m3aw3wgDvV0+Dd7mh7qhv2+TlH0zmmHpG/RECvOwB3hk9u8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817273;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kCzVWOyNF8RroXficHJTtGaaJ6qlDUc7oIG41awN3FM=;
	b=RVwi9j34QeS+N2fwCqU7Ob0ooQ5oPJqtMW+QbgnuPgMWpf1kesneqgNaMcwLA3F3g+AZ
	 izCuYP5a71Sb0hCn56QT2tOVFN9X1PoLx+k3zjf45MYHfKQn3nS1Cwurov0T/SgIFMjBz
	 V7flvPwJEKQMIkGmzprpVuUc6yIbln34XNDoCTgFqtOglG4DFGINHVoW+8fgbTNdfIBYU
	 QHYw1JYHCipbMrtdPgwtnH+cWeH7zcT0Geg99ppXUbYdvcsQP0YRrgmCwar/glq1xGQmE
	 a/OuXkLONGTVNJLQLxLrVcvP8XRg4vp3/itAZgKBMGktXnJREP1244QXdh/iRgvAHzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAG8kZsL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB274606A329
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAG8kZsL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377121F000C5;
	Mon, 16 Nov 2026 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794817273;
	bh=kCzVWOyNF8RroXficHJTtGaaJ6qlDUc7oIG41awN3FM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FAG8kZsLghTsBZ6PUAWeVuYsCsUAae06NtfBoxH6/vfqjSWEIFFj3eWW9w7sSq8wG
	 b9g2AvqaYObVnbhQpnQPxMBDJVc8QAQSTYHYiCfKTavOhb2EPO2fyTgHvFtiDhruFD
	 SkcIgCqkgOezYpKRYzCWGN25qtD9qHWoHPn+S0koJcyvB2cMWyIeJZwWo8YMR3/MvM
	 n5ntZKVCPSdJlkM2ArCvdZSVVsd711yfmeuFQMvmPKSYBxb4kaZw4/DqLcLKLDdJO9
	 /143XxodX8I5bREjLWHiGKlBqq+EztzkRXa3VRBvSPG4PArSZURMY4N3KAtflpoy4y
	 Y7oGKU43sC5hA==
Message-ID: <sashiko-outbox-216525@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C
 port controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116081555.2670878-2-gary.yang@cixtech.com>
References: <20261113125304.1693911-1-gary.yang@cixtech.com>
 <20261116081555.2670878-1-gary.yang@cixtech.com>
 <20261116081555.2670878-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 08:21:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Realtek RTS5453H stand-alone USB Type-C port controller.
> The controller is connected over I2C and manages a single USB Type-C
> connector, described with the generic USB connector binding.
>=20
> The connector's OF graph links to the Type-C orientation switch and
> mode mux provided by the platform PHY.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116081555.2670=
878-1-gary.yang@cixtech.com?part=3D1

