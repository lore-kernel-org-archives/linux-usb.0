Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864837;
	b=R3FPmBG8JKQNnCvfNP96hLGT7sKyKOxalQpqUNDZQz5jJJ0EJ6SN5RuJycFAXRam4sFN
	 3J3LbtTK0IlHfEQ6TjbWrVNgOq6OFQvZMfLgJrb/cfP5RrcFrkDIwsRA3Xd+a2WKmduy4
	 mOrcTN6qafoAMLklvbjIeXFkwLwVeY4M8XZTYTolP4apZv4ko+h5XNteqoyKQWtMjeAzZ
	 94IlbSdndoXRNuqJb/4e2E5eJB18o1Tt3Sq7diDE4nGfzDT2BnuiGpkY+1MGt+vIe5u6A
	 U9hRQL97KLFU1dHszttKDFF31M7pai4h351YsLsQAfui5Krf7ZHM9mep05Mig8azmdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864837;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OyehcxN/AmtSv5I98CTv2P7RSHD/3POczG/nWT8vNJM=;
	b=lay+y9Jdlh149Wnt8HMb2aC7rh84quaBMOoWzUCn/xsWMC02Fdvqchq18VGkHZ7i5H2y
	 HLncf//F6kvQCVBixQDbzF+U6RNXON0QJd9YjLkqSmQQYSGhgOHGVJLZ/Gk42eGfaXmFP
	 KbaSV7xtirP/hihM3S86wtLQHYx8O3vXBbxixi1u5rMDSq6gTlB/dh91DGtz1JdgWI6LJ
	 zksRfSwFAFWUfYg3C3Qk8nLeD5LZ2WW2VPP84SaEvj+D3Unq7+L3ThlKe7M6AXlRh80uZ
	 wAhdxUaGsfwnZz5bV1yRQdVDpcUR/UeIo8C/8x5Y/rCQp3gA7yQFUI7ysKSTqQxqWsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnPzuUkj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DAD606A31C;
	Mon, 16 Nov 2026 21:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnPzuUkj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8853F1F000C4;
	Mon, 16 Nov 2026 21:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864836;
	bh=OyehcxN/AmtSv5I98CTv2P7RSHD/3POczG/nWT8vNJM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CnPzuUkjIwm0/2Wm96jyqbHB6bI0eYkw2B6ocYfrySd2GqM30emIj5gMOoj4b29lO
	 8ZQVnO4WxYAincI6Ei69VMu7WVs19ipvODdSJdQHzehxp4jVSNi6lAfZsKsAjKjXXR
	 t/nAX6jyRfo2JzzDbkglg2oGxd12A/lNFJkonmVL+PP+j6Ixa8kB4cIQ8kShKEG7BA
	 zuuG66Lc5pVc2jhvC9GCXYmUdgRPOUcHV4mwTIni+xkf5YQIi8d8si3EhHHb8u/tla
	 JD2rhN9BK76uewW/pTArUk6ybDcOzwe92fvxs4u4dMD0sFKvJAsxV3QKG3u+YjChja
	 iEiPRWnHgK/nQ==
Message-ID: <sashiko-outbox-217735@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/16] dt-bindings: ufs: qcom,sc7180-ufshc: Add
 Halliday UFS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-8-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-8-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:33:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the UFS host controller on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D8

