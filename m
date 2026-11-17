Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935458;
	b=ApA6pI6Ggdl1Zzuz/LShV8Ul46U80JwSUYV6Q/Q4ZPbUXuD5YrLEb6tnrkanyYoSvkjA
	 MUUrLJ9Jfc/SbRNst25NtNmXg/iSSeQual82tDqRq+r1WZyVik30z6UteWuzICVC3jEr0
	 4BKZIUYw2ap9VES5W0pJ5rV0JJamC/JNhR4mS3gCl9Qrx+crx3s/IE3lF15a6loElE7hu
	 gqlKS4Stov8QuziDIm7aiXcn7olP0LNkTA0X/OAsRnu5usFxwZYCHKuRwuYFQ5RgW5FYU
	 IgW1vWIx2vdONuX/LR7JMCdy8uPwdX2akhDdNxFAu03/kUqDrFQF7tM54r+PsTN2j/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935458;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V400UDD3bNX9Tfgo0Wvr2xp/doPeyfhp+xvrmCbr7Sw=;
	b=p8RHWQs1wHo+MIRCElsDqa1YX2oS8I016a6B2QOYS9wYok56m5lsxgYirQAZ5lGe45S4
	 akTCn/yU4wQrycg8ZP1DcvADdpPbobke0vPwKJbRVX2JiYNiQFWHKjN9pewQPbdF3wMlm
	 IPAMNJBLFTuZgavDmEmot5GNtNhz2i70iWp/oChhPlFytJR43jAVB9bRrDgaszq59ZWTQ
	 H25C0PLT0Dpsk6Y9hdouzcPOMMopOfnGMlMr/ybW8zWG3WHB0wwMy2HZfF5zq0Nfr6Hrp
	 40gfipPawQ6NIb35AqIpGEbbtD6mKgAJMGgUh+HQNYsktnQYdWOV9TEu3NLkVy55j3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLniPSTB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2648606A899
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLniPSTB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4AB1F000C6;
	Tue, 17 Nov 2026 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935457;
	bh=V400UDD3bNX9Tfgo0Wvr2xp/doPeyfhp+xvrmCbr7Sw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLniPSTBBpOo3ydD3gA6wrIBg64uWOGSCGQ2dt71Ka5hsg+CYvNFhcnCZkYFuiFNs
	 uouvk3/+iC/4DqtcBTShZ+Fhc55Kk6coEaDcRlPcz/hZf9G6G0cjjRJnOANHj+QxMN
	 kBcb2wOpzFv7LOfPEqqNP/lXVTUGhVxn7fo+pJg+czqvWlBo6rpwtgTjs9RX9qamdP
	 Zngi+C3jlyBRmg75y9+JqUjSXIVwFkwSEvgDzk6PZD8mILirkhkBWofXtoQubwAFgs
	 B8ZgGdFsDrEnQcCDVJTWlV/IKAMyeZx2MrPViihA8Dv2yfT2WVVXwszWUM91QKzLJS
	 woJV2sU5NrOGQ==
Message-ID: <sashiko-outbox-219211@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: avoid redundant strlen() in
 make_name_string()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Antipov" <dmantipov@yandex.ru>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117170207.642330-1-dmantipov@yandex.ru>
References: <20261117170207.642330-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:10:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In make_name_string(), prefer strchrnul() over strchr() to
> avoid redundant call to strlen().
>=20
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117170207.6423=
30-1-dmantipov@yandex.ru?part=3D1

