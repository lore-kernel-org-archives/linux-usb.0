Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739911;
	b=NK/znH+Iud5R4YrKtiphvp966yMMJsDPIPw3vJ2LLFG3iHlV696TOWLvQ9rNQaoJOjIz
	 /GY03xS8MF9NZDaLONMvT1Nxwk//y07RwBnOS2C5CiUNrzbwCcFshEQtscYR29rSn3HQK
	 6uQZP1HcAXbOEroi73lL7I24Mfr1YDfGN7+McjwJ8CUMjTtwiXKGJ/zNIiJNjvZ3mX/CC
	 pfyBne0mQbXIH5K2GWL3Svz9q+Z6zFRQSjykZ2IKYu1FBAyNXxI31r7u9jtAScpMXrTLB
	 mxKNvC1AD69jpD/VrovZBsa4fPpQsIERKaMR4hDexC9MmSinLoJmMp0mMC3toI8eZug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739911;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ROZDSNkIeZLCiVxb3SsuJsxTOqqqBCeoLgwPuEprkO4=;
	b=aQ2BSoA/zhXgymTaW8YxC+k6HmOBh7kpyJM+x8xLpE9oEzP1VfDydadMFHDEiVt/1xJY
	 nHkgsKTTJ/YGmXkaFsopYeXX5536wB2v4pDGjlGMv/MHmBcHZan3wm1p1EmTuTfVoVPOp
	 45ra1c5WGeRntGdfmSqNFJs79h8DaO56bZGBr5ZDpE9rftE3TsojLBjgt2QlTp6JMW3L3
	 Z1n802hBCJkv2xTKQvh0yIT9tQaEGiSQi7N+iayO8zuhR+TDGxE3PqhiGFNchpCSSK/uE
	 NR5pEbRrjoo1zeeb5RQMjFuc6D3h3wfWvYpkrsHQiOGOEWnIlEZ4k0qGx88IF3t0APg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0ObHT1R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8E606A31E
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0ObHT1R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F661F000C4;
	Sun, 15 Nov 2026 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739911;
	bh=ROZDSNkIeZLCiVxb3SsuJsxTOqqqBCeoLgwPuEprkO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P0ObHT1RF00iou0GDEm9aExTrE8SM1uLmYqpJkTMFrh6w9fPfKtm5l7SHgyAfL38c
	 z0wJblYHYuN0oWq1F6k8B55iYHBFlhCjmlRG4PBBhBNhDNcqBv+J4iAqEGavxMkKoY
	 baBrqumZB4HXhaV6NrMXBEvgWsMH2Pt1IgyQtVsALvinZUlWt9bei7m8wr5fy3TSPs
	 IO3BGc7u4d7iE9PpKQnbmgHkffbQxFIJkDenWqvmASGoUtJT65HNbnFFdAgv5S9UdF
	 EGC+h0Iut1Nn1JGxAu2bdCBkX6PjnpqUfnJKI4BnncXelA2DebUK3e9gfddGQI7pg3
	 1sMTxmI7WcB0A==
Message-ID: <sashiko-outbox-215414@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 01/13] phylink: Add phylink_mac_interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-1-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-1-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the phylink_mac_interrupt() function to phylink, which
> passes a link-change interrupt received by the MAC to phylib.
> This function can be used by drivers which want to avoid
> polling the PHY and instead rely on an interrupt received by
> the MAC when a link-change happens.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D1

