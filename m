Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218280;
	b=TmUGsiLVsHSy4OrlAAXWsuceA55QanM77SzuI7UztB7VqpTp0XEz52qIAZnuztMoCLeo
	 ca/YYDzpn6shM8wEvrFPcEwBboN/3P/SAgiBlIPE3kfG2qhsdT4CfcLtMl7/8mMbPeSuF
	 0nZU2SeoG8J2Tv4QXruCcJ/rDBzVJZsEG/Tery5ocQDqgVpBRinUig0G9DIMlXqlPaRsn
	 Zw9xXy1+Pp1DAxg4wMyv92wgBa1asOUUGnhSzUdDUeL0eI7VQw21/n0/lzHY8rRVcE6N6
	 kNDeC1Hn8/MuNz1nw9Irmw5gk0jcw1keH68uaZyLet9GCyaDVBUrKrfGrydI91IKRqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218280;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Klh7QHIf4w40cOkI/qGMXxIbz05Y5WlIG3rzBzXMzeM=;
	b=12o6ZCx7TsMK4mt6+3kdUrDP1GytSQVt0lWhk1MMldkPDWHN2ihf2CyVusyerTcscaks
	 bSsUhFL0QudcUdYbAj2sVzlKHI9jFHTCaMNf1XDpYtW5LZM9UuNQw98jAwTr0JwvQCuwX
	 iCIwH9yI9kXDMFwvS+T5xj1qCe0S16FHpbrul9S0/a6jqPj2K3TCYyysoBrlPXtaZVGE4
	 pcDqeBwKSfjuzRKgaVwoX5qX+VLqpo8M26aGeDU6+AOr92l+66mgL4+YhhtoP77VGBZwo
	 NuiX0KsA5S05gv/TcVj02AfNaE+D58Zro6CTcNujf4NdZ+vDqsRnHu4c3VY8gud6OzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="U/jTokEX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15388606A697
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 23:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/jTokEX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136701F000C4;
	Fri, 20 Nov 2026 23:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795218279;
	bh=Klh7QHIf4w40cOkI/qGMXxIbz05Y5WlIG3rzBzXMzeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/jTokEXg6b0rmQ4htvGGdTtkWDXIgCrPT7mnWWPSvxj3MpJIrW6+dtltQC7WFU5Y
	 6qIsrQE4+SOk4d8/6U20JcuMdHa+y4J1OzGIMUruiIZgmYL8X5ykpyeTDU15HtfaNe
	 aR/NIXNWxpu3/Ro1Lsb1KW7m/TjMqtZfFmqC5DsGl0IYWHWo2SvPleR2Iu02gJ9+9l
	 Om+2xjzZeu8hQHUt7b66FnT+xN0Giz2/Dj1wCFTx2Ez1quBw10iOhret3yRJU+9DXq
	 L1H9dXHJeleYr97b80J6oyV4plVSXYt+q/Ac6ISqqoItfJOpWhUV+gQWIGTY3Vrfuf
	 SmsuJyeZO70tQ==
Message-ID: <sashiko-outbox-226351@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: phy: generic: request the vbus supply only when
 it is described
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yang Siyuan" <hsyysy@163.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120233922.2691166-1-hsyysy@163.com>
References: <2026112011-macaroni-manatee-e057@gregkh>
 <20261120233922.2691166-1-hsyysy@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 23:44:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_phy_gen_create_phy() unconditionally asks for an exclusive "vbus"
> regulator. The legacy usb_phy_generic platform device registered by USB
> glue drivers (e.g. sunxi MUSB) has no firmware node, so the lookup ends
> up in the dummy-regulator path and the regulator core warns:
>=20
>   usb_phy_generic usb_phy_generic.1.auto: dummy supplies not allowed for
>   exclusive requests (id=3Dvbus)
>=20
> Only issue the request when the device firmware actually describes a
> vbus-supply, and keep treating -ENODEV as "not present".
>=20
> Fixes: 03e607cbb293 ("usb: phy: generic: Get the vbus supply")
> Tested-by: Freimut Diener <f.diener@pengutronix.de>
> Signed-off-by: Yang Siyuan <hsyysy@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120233922.2691=
166-1-hsyysy@163.com?part=3D1
