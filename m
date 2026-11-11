Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367517;
	b=MDX5jkOfEg56juu65PYw6nsxOptHDHTpXLhyC0lwhLDKIqiW9MobbklfJqIGtX+Oximq
	 GpMpYEj/JFBN4q45ndOwOoxraMkW8qaMnE0hsPJ6C6CgLZnjsLcQtYHlzf4CbRzjAFBY7
	 CO1jukHj50glmbwNb1YLCGHUCSG19XKNkw0DLMnspoGsORq6SBBVwkS7FefJcdnHXzcxy
	 Iq9DzI74bTszRQlrnMqCwkAqRPtPF3hD19ZbSQgTgY3U9WIzX1znFg05oBBgA7WnYdm97
	 80/AyEUtwrEOi6GoVe/hagyco6p7TfRhd7YydG7Avi22LBbHq2eAfDGbidGiW8gVasg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367517;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7nCXcz4Uuc8K3h8AR+B33X+wX8ymQ5bQklQmrOh0iFQ=;
	b=wm8uJg1mDf5ASC1t+EzgqjFUGg4CrTlDKEKO8I61kTNdEYYzhOTs72aErKRMZ6QmDKlM
	 qUB4NJWiJaFl9vUGG6ZwdwtbKlm+o+wTrNWj6Fav8saFw+1tZrPzxACb3OJYPkcFKFAei
	 4Jr2rmgupBJ76sNQ953m+plTnOLXM0At9d2jYmPhEtQYZ0GQJ0YzpwjRpGDSzKduvuhhI
	 lHB0IzbmOtWhv+eeponVy5Slx5mnZDTw5yMyDYksQMZ5dee8u+dfW6HmcGeK7AvomHblo
	 0gZS4tWx+r8Nvl+qmY/4JQszLbeaaZbfT10c/xPJaxZsjitCPUaPNmXiq0Q0+32LF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfTZpU8j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981AD606A326
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfTZpU8j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244D11F0089F;
	Wed, 11 Nov 2026 03:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367517;
	bh=7nCXcz4Uuc8K3h8AR+B33X+wX8ymQ5bQklQmrOh0iFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cfTZpU8jrpDO3vtD2WLAFDFRrJ1nuNhqhkHjE9z9M1wpBbPrjd3BjaDClh/EDGmmG
	 C9S+OD+FhqF4h3LGtLt6U16GB1v8dlrpaBZCf/i22GOEc8SaKwP+fip6kU4bB8k4fW
	 YYo+Kqa5fezdCzgQRYyCWLF5w4jq8VsBD7BWru1wk02yQ4chDgd0l9h+SFemee2hgX
	 Lz6rZlse/jLpgoPrBdJKI2iBlueyacSwxA08kLyFNT0NT6Vd8ZwdUi4nRaE3gUu6LX
	 FVpUW0NVIHmnDdxTthLBmYbjsyjd2UyQDBnZ66N2946dgUUcYsc+xGVFDitWPKaZC2
	 PgfjRYMPWnvaA==
Message-ID: <sashiko-outbox-208188@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 07/11] r8152: split RTL_VER_17 into QFN68
 and QFN100 package variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-8-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-8-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> RTL8159 is sold in QFN68 and QFN100 packages, and only QFN68 needs
> the u2phy backup-restore patch and enables UPS (in a later patch).
> There was previously no way to tell the two apart at runtime, since
> both used the same RTL_VER_17.
>=20
> Split RTL_VER_17 into RTL_VER_17_QFN68 and RTL_VER_17_QFN100 and
> update every switch/case on RTL_VER_17 in the driver to handle both.
> Detect the package by reading the new PLA_PKG_DET register
> (0xdc48, masked with PKG_MASK =3D 0x1e) via a new __rtl_get_pkg_det()
> helper, called from __rtl_get_hw_ver() when the chip ID is 0x2020:
> pkg_det value 0x1e/0x1c selects QFN68, 0x18/0x1a selects QFN100, and
> any other value logs "Unknown package" and falls back to
> RTL_VER_UNKNOWN.
>=20
> r8157_init() gains a QFN68-only write ("Enable u2phy backup restore
> patch", 0xb99c BIT(0)) that does not apply to QFN100.
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D7

