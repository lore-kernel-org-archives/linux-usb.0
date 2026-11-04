Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759328;
	b=xh87elKj9PlANpeG1y5PWzDlQAa92xFrlzztXVE9q1SHSb2IWPjfo1tN1Ah1CAHEv+d6
	 lT5UYwStAgb4wIniiUh+AOOqiKfhra1A3Yq8ZOYC4i/h8fev+7h7zf234qFjWd32fqgau
	 V7IEJ2VvP9ZGb45/QMjlI3WmE6+/4TKtxrlvvzaWNKId28aEd6q7qpQsgUyOBK1G1W1yr
	 r8o5tdBhRotkCDXQmMsLm7PdlgEpeUvajCa/2P7TOmy/JSx4ND8jD3CnXwjnXOFo6uu3C
	 SQWFBmtp0F6sb9G2hB+EzuGDcEJX+ntDQCqCZR8Da956elIk40vXeftrVjNi1o6BNTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759328;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xMH6Zu74URhPj3FmA1pVTUbfT8uzIGLDwcKKobpiXeg=;
	b=OTMsjbypyr4MTzye2TvalyDAqfGnxKclvzLHfJFPCZxSTT8CseqXzKnSY4pxq7dp6sXe
	 3rgnnnggOoWsYbpXgVv+iBoV0Ps5iUmQmrcCt3N4Ps3LDzdBgfc03AYHpZ7ZqYGfsz21h
	 /anVcMjW5mMCwCbbKlc8cz/G9acS1VYDTUkl34iIL1ebjFfv1hZmC2Sm2bTKA5kANrCjs
	 JWxH4waKK3FyxVuNglVkreMFM3NmmrRW0s/Cqxy5I1Cvr4Qv0sxU6fmrd4gBhKxfxNLWO
	 yIYMMf/kT/Xd3LiNu3ceVqrFjMvvfld76+S10MO1nrl1zSyNMtq2aSzG9D37V5yLI/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1FJ5Tc2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC4F606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D1FJ5Tc2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07C11F000C1;
	Wed,  4 Nov 2026 02:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759327;
	bh=xMH6Zu74URhPj3FmA1pVTUbfT8uzIGLDwcKKobpiXeg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D1FJ5Tc2OuoVWD/FhM1sKIaA7GSjuaMMRmxZeWacvTlRVMfciJ9AzMikES2cFoF/E
	 5TqWwXipgqjeKpkSuJEoJ6uDNUhIS4+2rGNqsf48C0Y2asDYtKxfN2m/AeUm9jht3I
	 n1dIEoYDXH+Fc/aH7A8QSwefGiEmOFPGo/0lrcBekk6Ij1V4im/WMNVJdFw0EqXUxs
	 dGsIiM+88u30Pr6hUJGNVfASmmsg1EQzRq/EcJRw9YneQHLqXtVsFxg/wymy/gbsFa
	 wWXg9o9O8r2Hy8EBhTquTneN2MD7S0mPPueXb9NezM9FUHpQy7Db3a/zQZWVMopgHr
	 +b8NTHFlNLvtA==
Message-ID: <sashiko-outbox-196469@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: hcd: drop the root hub reference if it was
 not registered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021511.1468577-1-vulab@iscas.ac.cn>
References: <20261104021511.1468577-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:28:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_remove_hcd() takes an extra reference to the root hub and relies on
> usb_disconnect() to drop the reference held by hcd->self.root_hub before
> usb_put_invalidate_rhdev() drops the extra one. If the root hub was
> never registered - for example when xHCI defers registration and adding
> the shared HCD fails - usb_disconnect() is skipped, so the reference
> held by hcd->self.root_hub is leaked and the root hub device and its
> HCD reference are never released.
>=20
> Drop the extra reference in that case.
>=20
> Fixes: a44623d92790 ("usb: core: hcd: Add support for deferring roothub r=
egistration")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021511.1468=
577-1-vulab@iscas.ac.cn?part=3D1

