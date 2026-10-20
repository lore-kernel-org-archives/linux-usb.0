Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507281;
	b=StNBoW0LmN7Dq23Dj1xz0Wk6UpLllgzahHNvt8ZR9AL4JhNl/XbmwjyfV2PmNFsG/QBt
	 pkxImiNW86fi+AEvbp0n85uRoPbBUJO9LeuzDoH4QHRXoFtlTz1Cr3hiUotTr/XcKY2fP
	 pDBkvlEpHphQLw89b3evC+XHcZwUf8bDhmBizSnXA4IWrD4k9WoM9eKc//tAfYD9+J2fY
	 8wdyxFSToHfIsTiHDNRjXwTkSmQnURFT6ZTdDR8gkTq4zsaXks3vAUUNkrYRbxHj+c+C2
	 5tyE1PBKIyBe9TJ1CmjRT3Ad+w6T9a5E95u5LVTHanC6SQdeAxNvpQAbuLJZocudI6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507281;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TJAM38kFFuQ0w69o2+1b/wFs/HLixKVV9sMzZ30mOMA=;
	b=ip0CJ4qbAZJrrVTxsa7rnpI423IPIIE+JkQLAJSI0xY1UPfk/OL7lBG+sjkdzMXmZUep
	 iRduog2fWVeNtw2f6apGgUr6fA9R7nhtYjkYdAxFjKz4Es9+VWuaFVr1EdIjQogjFqt2E
	 LnP1GX8pimUmnf+RQ1hc6xRFSu4y7sCrutBkPtxNejqiub3aYEO7DI6MscDNEsv/yyw4K
	 aZMxat1bkNUQpWUfgXlhDx9AEHzu3PpVx6E4IyW42a13Nf3Likk2vFLM3giikxwWbmDOL
	 0VQPtbn+BmgiakzvDeUG1z0UuPfIRlO4cVFybcXCK45tdmudEOaVLSMQPxx4gjyUBtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLWQws3O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44027606A330
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GLWQws3O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B316A1F000C5;
	Tue, 20 Oct 2026 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792507280;
	bh=TJAM38kFFuQ0w69o2+1b/wFs/HLixKVV9sMzZ30mOMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GLWQws3Oa/u6UBnUegPhkmyni/QhHCkoT/nI+XZFLIM6R49wMuZ/dyA7CXc8XhdI2
	 bcH82zn3gGXRjM26SjUinRdRBIBQq4c/3QAGLO094XEcfm7nD2eTBfJMlzopADEvTc
	 /GZZgJklzNWmRFUGW6MXA7LuGYcFQU0CoATTQdW+O6X0RnQ2TBmrlo4XslLvoGj/WX
	 qC/B+J/j+kyvRIFxW7bnEh2810zLcH/vP7XKlf77/2mZHmPJlzjxj8OV4r1S7lhcsd
	 y8wbB/KljZ7tC4O+ifgu4ucW1UayJygeMlz9utuTkvus+7IyevMH796J5TOmNDeuPm
	 R1HOi+b2/E9pg==
Message-ID: <sashiko-outbox-179180@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] usb: usbtmc: add Rigol DP800 and DS1000Z to the
 packet I/O quirk table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020-fix-usbtmc-short-packets-v1-3-903f4d029193@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
 <20261020-fix-usbtmc-short-packets-v1-3-903f4d029193@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:41:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Rigol DP800 power supply and DS1000Z oscilloscope families also
> advertise 64-byte bulk endpoints at high speed. Replies are cut off
> after the first packet, and writes larger than 64 bytes fail on the
> DP800:
>=20
>   usbtmc 1-1.3:1.0: Unable to send data, error -71
>=20
> Tested on a DP832A and a DS1054Z.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-fix-usbtmc=
-short-packets-v1-0-903f4d029193@tipi-net.de?part=3D3

