Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311626;
	b=ZAuHlBaPQHdp/SKPEbtJ8Rv4GZxuQeO6SU07LSXTkYJ353KO6mTDw2NyldWARhh7z4Eq
	 9JW6XBYZs3b+TY/Vcz/Mhsa1ansTcDKSHH5kHUYUMgzGvElwwMX9eoZLW5U3sxvZxknRf
	 kruryo19SByNmrLz+qoytncTdQhuz9Sb9gORO4r4OLnrVY/jSV+7Pv/7lf9RYWQaUEyd2
	 kc3BW9jm6stmImoa6Z/CnrDK/7bGv8aPZckE1joucgWKk35cW2b1hrS2voXmRxDUrPPQ4
	 /DpScN7DzrHq++xpX9DTPYSw7r1J86unntnzDjugo2pEACA1I1lxGPn516Z9XqueZpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311626;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=14EkWVoQECLBeLV32S4PTMzuk/sQ/l1KL9lTQ+FHjuE=;
	b=AK1unqRLy/96NTgYD1kF5KB7mzUpumd1mz0YkIWBTdf6D5JTIIa6NCB9/t54bD9WOmf5
	 79cbto5mFS2XTUMIvygzDd40Ob7ygdIORJXY0qUsgioMB02EAAY8jh+3aDJ7HBhbW5hit
	 AnNnwVKGJje3D7VfTH0OtH8yJImDF3hZY5m1JAh50XKerUBvygLuNFzqbTXu7j6n3odt6
	 OXGB1/QQK4hjYHDZj2yyawdocHyeapMGdA8cvkoyPCaATVzWZDIhZAKqvNkFsD5J/njrc
	 ZAo7dq7YuCuVLnrjTlskZIvgb2EqSZ0ehB4zx6T74/5WLmzi6+uqUqhCIHm6c8d1Llg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHLXP7Je;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348B0606A32E
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHLXP7Je
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DC81F0089F;
	Tue, 10 Nov 2026 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311625;
	bh=14EkWVoQECLBeLV32S4PTMzuk/sQ/l1KL9lTQ+FHjuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MHLXP7Jep8K94ZkkeqTIFUYhqoqj6XVs09WIfIAvMyXkypjDgIvQ9WOsCigdMrgp0
	 FJUC4XzAXPiaJUfMyuVoDUecdMna1ypCT36zt75kgkRObkiuKDRmP/lEMDplS1VDr7
	 fsxUNHVP9Kxg7fh4/4jN1RwZgvSgwcJVx7HvMQo0z4rQ6TlGFh736XSUYPzr1n56M/
	 lVZYqgNug0QdNL4rTckQW2mJbpgcJ+Be/UgICUlRCl+7DS8mGzpmPpNjBiVSc9n1o/
	 ZEjfxGvJtMTCzAJjhzbpkWp9D79o3YN/bnJWi+OuumJ/VtFI/WvdSm33gN78lPnGcZ
	 HS05D1n6s1V2Q==
Message-ID: <sashiko-outbox-206961@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110114925.722014-2-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 11:53:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In preparation for modularizing PCIe NHI support and allowing PCIe
> and platform NHI drivers to be built as separate modules atop the
> Thunderbolt core framework, several NHI functions and structures will
> need to be exported.
>=20
> Currently, several of these functions lack standard subsystem prefixes,
> risking namespace pollution or collisions across the flat kernel symbol
> namespace:
>=20
> - ring_msix() lacks any subsystem prefix and diverges from all other
>   exported ring functions in the driver, which use the "tb_ring_" prefix.
> - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard "tb_"
>   prefix used across the Thunderbolt public interface (such as struct
>   tb_nhi and struct tb_nhi_ops).
> - nhi_msi() is named after PCI MSI, even though the ISR simply schedules
>   the interrupt work and can serve as a generic ISR for non-PCIe platform
>   controllers as well.
>=20
> Rename these functions and symbols to conform to Thunderbolt subsystem
> naming conventions before exporting them:
>=20
> - ring_msix       -> tb_ring_msix
> - nhi_msi         -> tb_nhi_isr
> - nhi_probe       -> tb_nhi_probe
> - nhi_shutdown    -> tb_nhi_shutdown
> - nhi_pm_ops      -> tb_nhi_pm_ops
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110114925.7220=
14-2-chunfeng.yun@mediatek.com?part=3D1

