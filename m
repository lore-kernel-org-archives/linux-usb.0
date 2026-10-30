Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336018;
	b=ql1jQPFEYMn5ysXv1F1AeQsgSJDcASuIqDsDQDOw8OhFFHgABl5uUIg06q66C1hje/Y7
	 Jw7xKcVft07TSah2NIc/td3PqUzm9LfkVb5FectdWjs0luglzhLnMaswSJa20M1H+fWaR
	 LJHwu85olzsKJhQApiro3hOg/ev5mGG1SAlyxzmwMb6nGJkmiKqMzOOD2d45D4AbTcX9R
	 j6dTpqmdWOAEbBLeHSZG4veRoV1pZ15FxZtrz3aIQevFOu6jWaERGG0fxpk40vhIGNh0v
	 sBW9h6f4U1+ZATWYh8xXqPDLvHZzH8jFdSLhvQjlh+pW90P3+vSWk61yE25E5v//IEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336018;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5xkDTZW3qQSTqLJEZNccqnF/DFwrw4kq2pttG9jy+cM=;
	b=UFTm1uA/ww1Rxb9h8US9UqRbd45GyzCVoSomgiK1/w1DYk6EfYuTyNdYwrhy+r1X1lRJ
	 j/AAPcxiihynKRqN8D+BGJ3qD6Pm1arm+6gp79tv59CqgCvWiYhuMRiNdGMOp/05TUCLG
	 0tCCoA0Z47GIlPzie6qNwsXWcwaFpy8FW9Se1pRQ2XoNvqIJHtyQeAmmpfG4oGGiV0zcW
	 usHII5GhC0lTzUKWACweAsiWqGmv2Ghaw1gmkL9G/nSPX23CgIvU1NgpjccD+1D2y3dn6
	 eoaAqvPu1gs98zKaUE1NdEEen37J4vdZdNZq8kw4T6em8p4lRaBWQy/glfbWZtTRb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lcp2MKBb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB4606A320
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 04:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lcp2MKBb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1640E1F0093A;
	Fri, 30 Oct 2026 04:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336018;
	bh=5xkDTZW3qQSTqLJEZNccqnF/DFwrw4kq2pttG9jy+cM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lcp2MKBb66AeitnDZ945Ljc9rHQ4rApaSpaBuZQJY5wIrakz/Ngee/4wFW4JAu5Om
	 C0Wvx0TotivXa3bRPh2E3bdLUf8g003Qgyc837bhpDCDwIzxwpfShkHaWdMu8cWshv
	 YH4KQsM6OAmJWVL+c6B68wNU2FtPeg5uTSaoMBnF8hUnGoGoM10Bim7s92LkNCG8Ev
	 wgIRXxOORqnjhyfCOvOG8vWEsH6JR730igzWDfKXiQHt+RHfmNqZn4ny9Rp6M2jlEm
	 wApMl0OwItNwchc06MoCqNQQaQOGrc9gGSxC3xCehCbANWiI8AllUWzoWsNfyCm4qW
	 kz0lyOR9L9ouQ==
Message-ID: <sashiko-outbox-190328@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/4] r8152: Add irq mitigation for RTL8157/9
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20260428-rtl8159_net_next-v1-3-52d03927b46f@birger-koblitz.de>
References: <20260428-rtl8159_net_next-v1-3-52d03927b46f@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:53:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add interrupt mitigation code for both RTL8157 and RTL8159 that prevents
> USB interrupt callbacks with urb->status ESHUTDOWN being triggered. While=
 the
> issue is rarely seen on the RTL8157, without the mitigation, it is
> common on the RTL8159:
> [273.561863] r8152 7-1:1.0 enx88c9b3b5xxxx: Stop submitting intr, status =
-108
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260428-rtl8159_ne=
t_next-v1-0-52d03927b46f@birger-koblitz.de?part=3D3

