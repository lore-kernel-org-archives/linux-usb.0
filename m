Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4F3F99F3
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792267310; cv=none; b=mu5OyX+MtTaf9/U6so2H0nQGHD0TkBdCxdk2XXwRRN+hhwZ3KQ7kaUImKryDcVJSvhgLUM08cgUDIC1vrr4HuacB8aBa8RsPkvCr8A/MoFwcm0vP3c4GYGlIEOVPW/BdODXDitGxLREm1auem/4UEs0tEtM43/l1eX9gaKwoiDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792267310; c=relaxed/simple;
	bh=Me4xaITMC8aUxkvlW0At2KSwG4WMGEDDL44x95s+K2k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=UrOw7ctcBO22CNYvnjaC5fQVrD3rwUumjSPHnneUEwf+mBjLuLrZFGYEpA843lAGrWPIXQx+w10Xe2PYT3oJCfsa13AnNGB+tfyZIiGj4Xu3RHJ0iIrdXUl5ELipL83m+zF/MFSzNqtIR5vQk7KRjGjjslrLiXyLsP8zseSCaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlGm8fku; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlGm8fku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD701F000C4;
	Sat, 17 Oct 2026 20:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792267309;
	bh=Me4xaITMC8aUxkvlW0At2KSwG4WMGEDDL44x95s+K2k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dlGm8fkudCXANCHdLQhChlV34KpsWJCNfzHSZA3DkgqhuqV3RfYJ0phrirrtq9C3O
	 bc+xFEcZJStsjoXADCjbteapZC2cDiz0E4TlbY1TOKUA+4CuaVpQPozsJDd/EAgV9n
	 NvzNgQ1LI8vrBsBWom+xTTc6EDfhSCGkvDkuW7nA+hjHYu94ocifmbeRKBYf12PfbY
	 IrwUNhQ6l14cXJ37LrkgmWdZOVXILmvbjHduFlrR9W6r8MTF4BYA1ySQB48986Rouw
	 hxLR0U4x25YVzGQlASrgm2GSerMH41PtlBRMbwi5If3WxGM2veSfpc3t9xpdW2yYWk
	 WiKZwbw21Izqg==
Message-ID: <sashiko-outbox-175814@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: rockchip: Use DP AltMode defines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sre@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-2-7ab3d93553dd@collabora.com>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-2-7ab3d93553dd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 20:01:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>=20
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017-dp-altmode=
-dt-defines-v2-0-7ab3d93553dd@collabora.com?part=3D2

