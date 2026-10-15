Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB98A4C652E
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052442; cv=none; b=uRAVqT1FHAl+PzuahKdL8Bwx087MTVnNtuwMOk29gF41JL4siSzqz2GMI9+65/BEfKmm4SR0uXZAEX/t/ojwH5lnq5LIc4x/jaNa0LhgoBOLBr5nA5RgtPeLqVwGCnZx4ezYyg7vQmi2YuQdqjMO1TpwDuZmfLRYjUsX6q9Rixg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052442; c=relaxed/simple;
	bh=UV6754c8jFdD9v5Xc2/Zd873CaneAE86xghQmAl90c8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fhlxBymLCux1Cenw9QVUYElfbmDLZr3eDpS9frLRuvzVryWLco1l4L9wPuMGYFNIXuy7ySrU2Hzj2yKWXNloYVvH9MR5AVlVf4VknLk1Pmwnfk4ZxsujtO8aEBx51AaVak/8ODfga51gOqT844GGkJrTqQzc9nc/ER8s+NIZrMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/gEMifo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/gEMifo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6007A1F000C7;
	Thu, 15 Oct 2026 08:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052436;
	bh=UV6754c8jFdD9v5Xc2/Zd873CaneAE86xghQmAl90c8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/gEMifoXYjohttY5mOtxbbkw7wxsHLjju8j6/uBSz3fln3yEUgqiu+f4F8s03Ls6
	 O5hDDgo24XBvEgEYA8U6jti34sTW+UsCcQaxrp+NmyYcClnpy8RSVv6XdHFkio53fT
	 7u+4oR4fgBq6iGxRD4LaUpBYGTaWHdIVuqYFJSgj2UkSEqS+RswwJiquWha3wF7o6d
	 UUyhbhcwp1BPVx91BehT7yUp0tWI0IqUl/VftSJ0KO0bPVMKwmvkw4KY/zRtv2hTy+
	 TSD2w8rq50w9TwPNBELIxCeX8f78KwGB4OEhcaORCxdRaFLXwdYBgj5YiD982hPFqq
	 sgK1ifUv+EqUA==
Message-ID: <sashiko-outbox-172465@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 03/10] r8152: split RTL_VER_17 into QFN68
 and QFN100 package variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-4-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-4-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:36 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

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

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D3

