Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935545;
	b=QEvUvrS7v+2wgLYw7ZfmMgBkWyDrmdPUo6JInrnXeWLXC/+gkOJ5Zis2aP2SPoNTsJKv
	 NiAYVLmCq8ro4Q/A/n6729Dcf/yCtkPoZGTub3Fel5OYlgVSR0RjVlhAbVuHs89twHDVg
	 OWUvzzsory8/guylZRA68qJ957+wqQ4IReKSYymqxJjqevvjvk0b94lMUtxTjzcgcRuEH
	 ZkZs9podKcfY1mp52RjzWD2x9tI7fj4vaW4yRBAD9s8oiUBhjPhIO6xswrLcx7+fGNULz
	 gUF/YK97vj01T6Pe8IGGYTk5gHpxnCTKgVIJFTUeUx0o7nN9B/mpt1bPryLO/ycoeAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935545;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UTdUZKZCUINnglZO5mJjNQb4o02m0x7oxAjmtvYdHDM=;
	b=ovJOdF24Hwr7Xw/rrAWxk/ldukOZXdxOFCSUvCg+8hxe+PwaZzsny1FxFgrtmQCNWjEI
	 E6jhhQxZXZPUKF/DD3yt8dqnVobymstT4nvFAt0lQsj76NtBdxp3wA5ZfWaajRHBSae4i
	 UiJlalmenQbTTE0/jDYW9XX6jrxwdMaMlkQk38+hUe8Xp2xYj5xxqi1+6mIkcjvK3DXTv
	 65cbSb7dFeQXqofq7dW3EvAHSdpDSI89rTDmMvo585T02L2Kt5NqE0Wbn6b0sBQetJG2V
	 pSTEeJK22sSqHmyWxJop2B3VqEzi2KIXQB/zCWDAPlL6L9oQTDp5PbqE9+mAG9zxQqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OlF9qedC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2913606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OlF9qedC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F321F000C4;
	Tue, 17 Nov 2026 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935545;
	bh=UTdUZKZCUINnglZO5mJjNQb4o02m0x7oxAjmtvYdHDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OlF9qedC3BL3IsMvUJPd7Gj2WECkWJ+4UptImrFED195+o757yZ5RiJFSTPzzJ0ft
	 oKbKpSiFwEvy0XaEM8mA3xAh6vB2Icx6ffyyE+KpfqQIpXl3qVbv0Z3z36taLI/ZKM
	 kRhECOQRSUZfDHj1XhIz5KswakYMVKeV3QPLxHedL5l0oqJiQkBYpYT9pmA3ddyWiI
	 RUAH1dBWbGIYKIw0VfLImoLToAt0f/6+WMMSOe1OEU9O+IPTKYwPTHuIfi2kSEjYOr
	 pKE0WPAU7W/iu8OAScReW4NA3zhx5CcojujKvNaPoyrXPoF+5k+rFCCvj5+hvwu8yp
	 Qi3pb8NZpduuw==
Message-ID: <sashiko-outbox-219214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Use retention for USB power
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
References: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:12:25 +0000
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
> Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Q=
ualcomm Shikra SoC")
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117170854.3257=
471-1-akash.kumar@oss.qualcomm.com?part=3D1

