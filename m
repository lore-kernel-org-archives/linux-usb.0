Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957706;
	b=wTTUAz+dTt+Qd1zKXijII5XsI0O4+ecIIzcVns9TIaMYfodFGKYiMYN/+aGB5s4+1DkW
	 8oKC4n7hHU01yNchWqJYW1XxHPQItbmavjdy5KX46Rnco1Hmx/axQ3eN7GIpo0HMZAy4M
	 q0IXvDQ8q+L4Fd9aXQ92aVDtWcGFXR8TzS1b0RLRXMFGOr6j+aJ9XY1O7OHfQ/nDGo98L
	 2Rg/UBihfNS2MK9x99qchsccMjg8L1NMTqx3pBfBITnrMNzoEq2nvW1plCTImnoIesdLS
	 +XIO20Xf049mu/XhFBvUM/HgAI22r7eS4N4BFRqtOkDVxbkKe10iI4VOeN6aTZ3Cr5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957706;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LByZqvxZngVsixeAwT9OyHjrx6r6iQtrkbkRM5bdLlg=;
	b=ipMlxO7W0Kpg3+1wjLOrYXpQq1qjss/wdWbl7b0dMFqv9CSXx1FpK+EAOmQt/Pbe1jJc
	 MpaDYttZLgXK3fpRA1qIdCvB3pPwuRB21kcDyYKhkypK7eAXNoCay3W/RI2Bo3rtpzn8A
	 6ejzIE2Ra1RiA2DRz05H4MGK3SkZDnv8wP+CGSlBzFgLMUZu5+eQS9Qcar8Wj6QS4fOWX
	 GJ62vkv+Odt56DeaM1S4w8guxrQAZQr5aHD3d7D0XWKOev54MdljKFyxKwM5UBRKLbbsM
	 4zt5NpFXT26hwRKrxXJFWEUCdtrLSXb9z8UiN2PS9DOZ0K93G+AQ5sHEhlqD46zntow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9vaYWz4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1495B606EEB1
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H9vaYWz4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01741F0089F;
	Fri,  6 Nov 2026 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957705;
	bh=LByZqvxZngVsixeAwT9OyHjrx6r6iQtrkbkRM5bdLlg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H9vaYWz4PWBa4BYtJVb135/vwsiZUdcBBPrjtxoW7qG7myxiK1Uc2u1kYneF11TS2
	 4M9EpVvA/QeoVfMnKkMNfxiM7RSD5K7kEvNCvIsR5vaCiQdjBIvNX39Tt3fGgRzw6g
	 wgW7Vq/zLMgfaiGeTV+wNPzZeGdAhWRW7/widCcGBYuxMoIsxxjdnNpsnlkqx83eSQ
	 oXHPNe7khLvz8yd1L/FMwsp4otAWns0Mbd/PsQ5SGW0YUeqvveAI3OOh6lMd1Wd6T/
	 KWb0u3H8y9MMTKiwYIR37ZvGkJWxSFROWePkJ8+LJnKDKj51k1KXrBXwhpWsPJaIAj
	 VEdBWIr58SqlQ==
Message-ID: <sashiko-outbox-201119@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/25] dt-bindings: vendor-prefixes: add Metanoia
 Communications
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-1-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-1-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:35:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the vendor prefix for Metanoia Communications Inc., a fabless
> semiconductor company specializing in wireline and 5G radio access
> networking chips.
>=20
> Link: https://metanoia-comm.com/about-us/company-overview/
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D1

