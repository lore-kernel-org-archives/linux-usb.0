Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB84CEE65
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052442; cv=none; b=R3kN30yOdmmSORQSLqJJ0v73vYinFlZPsQvh4/1KCPePWr1u2Fa3qQk01sBvbVIQNTWZDBgk7NpyuFKtjGL6Rw1md+sqCs1ZVF1dgp8z/Jav7+msM+KNA63HNBjHmejKAGx7vDHkxj9VOoWNRrJ/NvTu71Z+58x4THGXsSZIHWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052442; c=relaxed/simple;
	bh=vE7GItXQ8q/6zUQcgms9WKd5tM7fD/AZsqnzokN0c2w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CXta/1oLK6x28ORY0ept2W/o5/x0gKuLqEba2saFgaBCCpqa39Io3/K970g/3JIiIjXL+e8uq9FsWVb5ZR6RR5kLgpA7o5YlK+ld+J7wPwinvvQ8yah6CCQXR0AMY7PWE1Wr9PInati7Ei0xdXoqfNK+KcqA/X1P9WQRU5/5KMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFSgvvTe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFSgvvTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2721F000C4;
	Thu, 15 Oct 2026 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052438;
	bh=G9OXogmyFvU3ZpcLitjMO7N0KvsnCTXna9IZsre1Cio=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UFSgvvTe7N4kIb4FusTHLf9L4Amm+Y1JaktHx3K+TP/Z35xeIAL7COnvkE1smD2eY
	 SsEB3ZiGjcNw6lXGlOdf0Qpa3monMQCxmJO+NPpbJKcOwkYYAzA/Rkdep1Et6rm7uj
	 gyDS3E6g+lsshya89J3PzWlNjTPSvw3ushXSQ/7MwR7z2egBLdD2tgFd/YwBPrsfVz
	 dFlOhshdaXK2Eu7fiLN83p3kTgORMEngFRlt/cxl+RCv0215TOOQfMbZOCKx4wS0dQ
	 FMGIoTJqp6iUeINeegg+X3wRXMcVPeNmGbT6mX3GhQdjx92KiV9ApE37I6GnmZZVdk
	 c5UBdPgBwE17Q==
Message-ID: <sashiko-outbox-172468@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 06/10] r8152: split r8157_hw_phy_cfg into
 RTL8157 and RTL8159 variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-7-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-7-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:37 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> r8157_hw_phy_cfg() served both RTL8157 (VER_16) and RTL8159
> (VER_17_QFN68/QFN100) via a tp->version switch inside a single
> function, but per the datasheet RTL8159's PHY tuning differs from
> RTL8157's in more than the per-version blocks already captured.
>=20
> Split it into r8157_hw_phy_cfg() (VER_16 only) and a new
> r8159_hw_phy_cfg() (VER_17_QFN68/QFN100), each with its own copy of
> the shared prologue/epilogue. rtl_ops_init() assigns each one to its
> own chips only. Per the datasheet, RTL8159 diverges from RTL8157 in
> this split in several ways:
>=20
> - RTL8159 doesn't need EEE disabled before reprogramming PHY
>   parameters, so r8159_hw_phy_cfg() drops the rtl_eee_enable(tp,
>   false) call that r8157_hw_phy_cfg() keeps.
> - Since EEE isn't forced off up front, r8159_hw_phy_cfg() ends with
> [ ... ]
> mirroring the existing sram_set_bits()/sram_clr_bits(), and use the
> named OCP_POWER_CFG/EN_10M_PLLOFF/EN_ALDPS_PLLOFF macros in place of
> the raw "ocp_reg_set_bits(tp, 0xa430, BIT(0) | BIT(1))".
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D6

