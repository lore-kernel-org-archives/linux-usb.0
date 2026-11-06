Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958075;
	b=vayPMqK+327ah4BMya1lWlToItw1aYlgY+Vmc9namqLZw+OkrS++6ZKoUkLo4S5HNsHb
	 HNnsL/sgyt0s/BR7q47l7UpGiCWeaZVc0YjNqOoOezviwEVRg12LuUvarQAFw7cgF5a7J
	 RvlcXFxknQuYCO/7WQduIVGDIJC7SxPcyhkOWpKSyHXiUcf2nqZaap11ABXxI1Yl8WNAJ
	 u7ai72Zl+bU73QY896xGBNXUbiiTYFna7E8qzvRGS2DbCUfrn+aSHD2e0TK1uC1XykeMh
	 cp+BsoqHM+d+GEkZftxFD1wBeTbsB7cDZ+X662zIFDx0McSNkthWy08EsEdi68ysT6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958075;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F1mcriLsHutWoTVIVO2BUQ5nhUxM1IjvpOmBQiELcBw=;
	b=m9+KzVltC7Z8tXivPPOAtnBAJtp20XzBj/M+a6qrUEUvmjZXHWKyjoX3ezXvzJFyGV7m
	 31Zhg/7VXS3xIgtbAz0tycBeKE+IIxiRzMkFVjicHv17XjQ/8g3ksbhACTi/+ZtjOXK/7
	 dzluJ/vSP57wcrL8kzOkJZVIVjbP6MWFID1OZ0BJo+RhkPfH8gdj/SYT5VpL15jX+j9QL
	 dfs2rmSq0POekpwidGBW124Oj/bHUO0GEKFxG+voN+ZX4rgcf/6OA0tKcPvS9PIHZxnlw
	 QwHwEwAxfAj0UDecdCGXa6s6jU35j4EbgfTDGnKqMSke8ZtDuiDFiPW2ZpS2rhF+JXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FRsPPkOi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66990606C3E0
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FRsPPkOi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3271F008A7;
	Fri,  6 Nov 2026 09:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793958075;
	bh=F1mcriLsHutWoTVIVO2BUQ5nhUxM1IjvpOmBQiELcBw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FRsPPkOiMP6e4FLkfz79w/c4xHlzyo9Hy3JCGqUGleLjm+LSNBs+Z7JCjXTw1dHGG
	 /LbF62VwBIfVYNtrRpO72/XaF2b2rVYsRyBIPjwr7fY+eEw6z2KP8ompcAJQlsqXnq
	 PazPoeHbvB9vpoAcdmOW6/hCPsYiKAYGPY/KSU2zRPSr/PJF4nsCSqtym+gUMMAbmR
	 YlJs6j6jbZPFYGPyPuvWTA0IejtGIXCrJV/Mqh+njq+xKZB4lY9s8aQyrqCo3+hNrg
	 w1FeHGIiCEAybGLvPCl3kejw2UrkaaeViY0dWSn95U7YMBk+5gj2IfyzccgS0C5Pbs
	 KP/93XTW3Da0g==
Message-ID: <sashiko-outbox-201139@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sa8775p: Use retention for USB power
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106093722.3261172-1-akash.kumar@oss.qualcomm.com>
References: <20261106093722.3261172-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:41:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The USB subsystem does not expect to lose its state on suspend:
>=20
>   xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
>=20
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
>=20
> Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106093722.3261=
172-1-akash.kumar@oss.qualcomm.com?part=3D1

