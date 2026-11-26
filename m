Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655088;
	b=FjhK4uS4TnVaUiWeD6lXpRwKuT4XGzpAaBjHefwM/jLlsHPCRvjGL1PTUm1ZkY02Ku2Y
	 ieFB+Q5eI9LcRbCtKQQskxS6uzCNEKkUxw07rjShjtMmhEqotY/WQPRYLcc8Psue8Wrf6
	 BMj1wnmN7CToXkuJLqtpIfF2rtKV8CO9ls5wCBCnv5Hdra+zzKvqKoItboMonBf8MM+RX
	 Ayty3E8EdkRuEIhYZitfdpASA2IPJxCXdTjnO4OWT5bZToQo+8bEsP+KVaEGKSJp4NJjr
	 OjxuomdTfTvBjFQo9dULzOL1ExzGN42pgdfoxpTH719YSVEh2pfcrn4pMrNnMWuygxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655088;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8zoCpPd67K1sXdYWcSBpCCCSJAGPJxcSDnm23DDJWkc=;
	b=UgDVigGe3FsdavFQ16cA1QUtgu8SMd5o8usMyxRiZPfmMLW9ZaiEynobJ5h8FX0TkBmz
	 Q6l4UK6zNE1qTF3SzS8K+sYvdYSnB6BCQcvOSOhyJA3owCkASkdhFgSqGmrVUqJmMHRML
	 deCNATPcJX6nHDCxlNnceLxODQB6xG/eWCW6WEuWnAdgCfOYuquzD+qiSdfBs+UhPWWnM
	 8NMxunkidSKldnLBuTbqc2iUQ063bNsz70pvammrmIOMCr+IgVg5P9iiCnbSc+wwXZ0ab
	 HB5HgNhy+seJa9yIXBRW5a66temRwaCdLYDHdq+xzmRO0+ICH8IZK7im+KZJISMtSlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvrDXOpU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7937606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 01:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jvrDXOpU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5B81F000C4;
	Thu, 26 Nov 2026 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795655088;
	bh=8zoCpPd67K1sXdYWcSBpCCCSJAGPJxcSDnm23DDJWkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jvrDXOpUSVbkrW1jd/FIr8i0nF1Pt3x5bWnM9QwKiNM3zfR3T1iHNqWorisKFDjKw
	 jNWaa2dDY1M/BdxhtEtHMLxr4stplmDSGF7OtpsqoLCmMvSMawBwHm5lT+ZpUeUxT5
	 fUk2Y6C401+WsoTVghzOxUIpi/0k+TENDzaIEGm6r9Y/OKeN7fOnaFXa0D17XqL0cQ
	 C6JXhSibizo1BqtuerkgYIYo55Cj1MCRxS8WMRBiE/bV2UI7krMqANTREaJlGtLixR
	 OtVX4MZw5zYKTVN41Hh3o/C1wR7ykVgWz5/JjERF9npotAWw2L7eg/g3PMxZ1N7p/D
	 zHbn7Y5J+b45A==
Message-ID: <sashiko-outbox-234520@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/2] usb: roles: serialize unregister against
 callbacks and fix dwc3-apple lock order
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ilia Snezhkov" <iasnezhkov@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126005318.71705-1-iasnezhkov@gmail.com>
References: <20261126005318.71705-1-iasnezhkov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 01:04:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126005318.7170=
5-1-iasnezhkov@gmail.com
