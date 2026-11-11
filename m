Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367518;
	b=pLl+G3e/3m/UTFbiYXTkTFs9iLhjHHNXA8b12juVExlxm/p9OCyEIqC/ebwtwqO2rVA6
	 aMIImupfB+hA4C4CH7USz1OVZEB4ppLl7FxEcCv0aC1LanNW2obL/FdqPFQEGMcTOypkK
	 Svc6KQxxTVUt0BOYANEMBBWu2d8kHqErSZhstLyOud2j30ZNBKzfOM9tLT0TIXX5sPJVS
	 VKoQ/dndMAs6wsKQ4Os+7xEapkQXWhfn2wnUu0Mr9oxX9hmK5fpHehv0O9cH+U8/XIOiE
	 y6zRyWtU86kQtFbeUC5RGeLYbTPWwLicJjCS6gOSTszLofe1gF3azbHeVUsgMOwgFdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367518;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MzhL4Dyo4hKfmeQRyc7TAXFTGMBPnlStOXNVUKlpuFA=;
	b=VUP4VONptLQTFBJhT5c9nobR6305oMo1L8QX82YQEG2+6qHyedzlA38J6rvVTu5XBo5G
	 v3YbdyO3RBS2C/Ja1Hrkjv8qVFxTxnvqRNPHe+wkkyI/e116lQdgM3zuYAcoP2NnDS4KB
	 Uh9ECmNfNVhndm2WN8gv8/35biCJ1MHHlNAYHxq1SXCB9x5YQ6Gzwfwrj9RVtiiMU3Ry9
	 y+0dD2WhpU3LjLDztph4QcGMho/t1j2ShbhFHtgqq+P896PqsUYpVM9RSUt1R7dUxh4jS
	 hmbzDR3ZEQqYsLrespLrY/wAE95uyklojqWjgxiFQg+JIdfaBfWE0L6XsfIY9WGFdRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRzMNaV7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F3E60A260F
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BRzMNaV7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591221F0089F;
	Wed, 11 Nov 2026 03:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367518;
	bh=MzhL4Dyo4hKfmeQRyc7TAXFTGMBPnlStOXNVUKlpuFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BRzMNaV78CtMNHcKqkbmH8Iywg80sF/eZpIwVaJtGvoSI/qJrWrzHmC/8Jky7ezp5
	 +sW8FzrhPkcn7exZQ4Px45v1OyqEsnbyQBK+8KEMfO9rErJDPZOF1TFn/KM/Czp8CQ
	 36DXcUvZtYSIlMvrQZ+Foj6hGoVRJ1Flwycxq3P314hbNFTcqFhRk1hn1Z7VSm65zA
	 zxPL3pOgpHxmIhz6KGLtyaHC8IqB0N2o9Rh1WskxjykKwk71cCbFjUJEWkKxlNCu/D
	 mPahSpLxklXjh6JVv3d+Lvbn/1XzFhFL9twZdXVYz5rnkWGi+6WS3JcTxpYCoYPZ32
	 QoPtOtFnF60KA==
Message-ID: <sashiko-outbox-208190@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 09/11] r8152: split r8157_hw_phy_cfg into
 RTL8157 and RTL8159 variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-10-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-10-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

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

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D9

