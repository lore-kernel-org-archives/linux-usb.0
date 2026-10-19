Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439001;
	b=fyo/1430GpzS0CrK81+m11V1tp05IRNtbBcm0C5+WOouKJmOeCnD2pNNWzG5qvIXZdO0
	 ZVRxa+gGl7+n7DsoM8Xwz/mbSkISRJNojQLmeSyIxcCcLV+Rupn32bUsRRsVcq5mAGLDU
	 ulZASZhxiy3PAoAcvmOd7oGtQR8zhQkD3Rfkb2RLVakrfxRG+nYeJjYN4LTXEG8QYVdbl
	 TVlbE/IKH+h1OZP2QfOBPxQNk7epUNpH1i093FYRNPEFxOCHg/Xb6ukEx+RXWaLoX3rRz
	 LCEN/PH1J/E/LBDdA/Dips/oewrb6n8D+vJsREfp2DATDfSIK0ngKtLAGTRHc1K7V9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439001;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CXlSN5H7v+cCLSPrtEmtQ24ewQetDXD8A/7q+37mEeU=;
	b=VghUEpp6C5zG3V44FkJNNv7mcP5/sp3etW6thbeOvRJ4EPcaAIepJqr65aUp9TNUsJrd
	 tqt4CwOpu9DtLu0bkWRdHFgDSWhGdSJfaotfAOloetmOxXluC9Em/LD5AQnMsqh/hNqjD
	 oLPmERHqeGzVcFB8X7KgyNCLrDzJhZcDukbq1NEIn+agPzWbzzhszQL7ILYaL3my30gcw
	 V1RiZJEOVvWez800fYOXo4H+r4D4JhSpFGnrYlQqye8zkEQIKcqEFerkThQRydvuRnfcT
	 P59qmLGPR8oMic3hiVEH79Ja/a7Q5R+N06mR1CizrOlprH5DOgyhf1wV6zCa0mwQOHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlcbhS4W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D329606A319
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlcbhS4W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C011F000C4;
	Mon, 19 Oct 2026 19:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792439000;
	bh=CXlSN5H7v+cCLSPrtEmtQ24ewQetDXD8A/7q+37mEeU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MlcbhS4WNAWFh8KvL/+fSq78tK80J51nr7Yz61rf27qFWgpX1VfB5Y+eVq/6SXJlQ
	 Q/pTgCrCc7F5aTiwdOBv9ZOlm8JJ0yAOZAqzZFcYGGhFpNSDEz8cxST6v48kNh+zHN
	 buveboen8aAmRp25WowUW+IAv3/Fow5f28yKLzC1mfUPJnmx5XlrCZ6qCSNnQr3n3z
	 SYFFrMq4fUnqODCZCOAy2XiuOgeMuNcvpQ3GKaRPAs1IuJD+OaTMr32+kRM0gWu3Q+
	 TJlIsrOuC3OEfMGYH0lIytxe6sMstQ830bT/w4+BFtFC3EhwJFcX4jQU3xWu2sQqcX
	 pWdVd1U68ywrA==
Message-ID: <sashiko-outbox-178149@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: usb: lan78xx: avoid NULL PHY dereference in
 WoL setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashant Sengar" <prashantsengar25031@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019193148.1381545-1-prashantsengar25031@gmail.com>
References: <20261019193148.1381545-1-prashantsengar25031@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 19:43:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> LAN7801 supports fixed-link configurations without an attached PHY.
> However, lan78xx_set_wol() unconditionally passes netdev->phydev
> to phy_ethtool_set_wol(), causing a NULL pointer dereference when
> a userspace WoL request reaches this path.
>=20
> Use phylink_expects_phy() to skip PHY WoL configuration for fixed
> links, and use phylink_ethtool_set_wol() for configurations that
> expect a PHY. This avoids the NULL dereference while keeping PHY
> operations within the phylink API.
>=20
> The issue was reproduced using USB Raw Gadget and dummy_hcd in QEMU.
> An ETHTOOL_SWOL ioctl triggered a kernel Oops with the original
> driver. With this change, the same request completes successfully.
>=20
> Fixes: e110bc825897 ("net: usb: lan78xx: Convert to PHYLINK for improved =
PHY and MAC management")
> Signed-off-by: Prashant Sengar <prashantsengar25031@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019193148.1381=
545-1-prashantsengar25031@gmail.com?part=3D1

