Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759178;
	b=pKfYhMsH6gI2EYHmgiur4Hf63q78sm6qJG7CT/gZc6+oCoy4Jr1pn9xl0y2tHxdje3ig
	 dQeOESzm98ZdbGpCVsLfOGW25/2FXQAlsKCI4yPrUC58VN0iT0RuYVyQAN7T7HSyJwU3G
	 liaRQgD1TlOevBfZu5QaaOgfr73HrSNePCCP6y7Nj+VQ9FakOZYfYsupEiNtHBodjnZsc
	 uiIuGE+qacFPAO68iR/rNmKMfljf8yvNRBtlwqtfWjW1GDtiH7gu6c3z/VK5WDEubRyTn
	 g8FMJs+DvDWjV8ZAaTPrywtpl37Nt7D0WSs2f5XHCMDFFeO0aJOA8tzIVHH56f6Cd2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759178;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kUhWVgEL3jFCtq3yNJOpcvba0kjplx7beAmAVFDKLPU=;
	b=yZf1zUQhgqyJsRD8BWihcKIxczzQsElonE/FYQ5GPoYFQzTpWWK/IWbfVk/Dd6XIoqdl
	 ra7pzV5IvCvNC0GbS+ynel1BUH90/4SZdR8WQIcKgZaMTPZz0dKRlmFuYV11hKZZ9OL/F
	 GALg0r8U4JEZXpXlg7bzRcPQKtJWZDpcbZzh1ajDBV/dA3wtdJRmQRzjc+oBmXjjIeeJo
	 9m7QSwNtUvjk39Bn+LM3zUqekV0OMlwamwe3vUJInQkeMLknbQ3UTgzLIME6has9cyzlR
	 043QkMdk9A63EaKhiaS2wLcA7RTBQ8QO/nw3MY848eavPzFl7OIgw1UHcP5gCBCgvfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UteGdN8E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B084D606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UteGdN8E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185611F000C1;
	Wed,  4 Nov 2026 02:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759177;
	bh=kUhWVgEL3jFCtq3yNJOpcvba0kjplx7beAmAVFDKLPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UteGdN8ENSk6Tlepyh8/Yf64bkoQR1/haw6lo3/AODG5lZLRwHk29TnAfQ69WV61t
	 C/FikW+snuO16wB6QSZJhdsRoPNAFJZQtvoySWz0kQlI9SyDLNZLxHUgZuBWjrO/kg
	 uxKGOePsXkI7L/g/RnP6dm2BL3CP6KrNWKsiaZQGTFR7JTCisu/3go9IDX06LOmwkA
	 PcYvaqgPufu5bBuBaKyg7dS4PzGUr/3qrYF7gl7UrlIQUGH+xXBDanSUpk277tyClQ
	 MZTwqtpMciDmo5qOE1XE8yRul9gbzb8hycE5lUuEfaePX6SSbzYucbhsWWb/jYobB3
	 s6GqRTHqva/fQ==
Message-ID: <sashiko-outbox-196458@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: thunderbolt: release a non-Thunderbolt
 cable plug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021516.1468625-1-vulab@iscas.ac.cn>
References: <20261104021516.1468625-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:26:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> tbt_ready() takes a reference on each cable plug with
> typec_altmode_get_plug() and keeps it in tbt->plug[] for the lifetime of
> the alternate mode.  When a plug reports an SVID other than Thunderbolt,
> the loop breaks without storing the plug, so the reference taken for it
> is never dropped.
>=20
> Put that plug before leaving the loop on the SVID mismatch path.
>=20
> Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate =
Mode")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021516.1468=
625-1-vulab@iscas.ac.cn?part=3D1

