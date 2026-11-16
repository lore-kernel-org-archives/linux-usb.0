Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864613;
	b=g3wd08y/MpZqtExhCzsR/eZ7xoy+qIr4mKD9ul1i3D/u1CX1ORxCu7hmJtHglbrdV9js
	 ooZoQQAtYAvEjhvbksFD2VeoDjQl4Tz8JO+Zw3rst7iSbSR4PrkVtNsCVXzDCkrBlbyph
	 LcCym1IULbRjNFFvDW/Lv7Ly9R9jvmJsxvbfiysPa6cg5EiSMuGKIgI4eQWnQ8GdoaVpS
	 YFByKFmBtSU815ALD0fdIHr57H0SuzzahNZYobX9Cvd4bhnz24Y3kWOajAn8An5uEYYxe
	 b24EUx/77Yqzz1caNk4msWRPZF3G2lilc6v8RuTPIucu76ObP7LErWx+XHda8AL4XxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864613;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q52NYO+WniOpD+RziB6/g7e1BjPGZ18obAmZBemqi9c=;
	b=hV47XyE5ZON+Yml5ZFi/+is+4JdVt3z2SWfFEgZAlHXQH3/e3inFoulZkSvqqg5wQJOI
	 CLYXPM5s55t1Aj3gRPbatsBb4yRUMTCcg8peq/ywUFxsEU0jHv085PnfOzm/oAfSq+mnK
	 xvfWMc7HlIxj0FQX6FEbjZaXlFP1pc9xzibInqlPxTFkDn4iLndo1c0aJLbIyyF6p7PZH
	 ic1/UCmD8TOzYb5lNxxbp/9Tq69PWXzvW9fdl/tjvLY4FyifcUHnL95rIXHAQr8jhdXCm
	 0pZTyCiqgFhtqVhXqXeY0WI9y0xFQS++h1hFGyoW8PQtX0MMwsE2baRNHSAtF7FnO7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Egp7CJCR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA00606A31C;
	Mon, 16 Nov 2026 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Egp7CJCR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2F01F000C5;
	Mon, 16 Nov 2026 21:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864613;
	bh=q52NYO+WniOpD+RziB6/g7e1BjPGZ18obAmZBemqi9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Egp7CJCROn9yz/JxQ7C44f8XMGIYTN/iHPWJX5/xKuQUelis2uYbZKzRznuyYRdW1
	 FmwrL8wQYCWciQz9OfpbxZUopu5POblU/OTl4TaqTFDvMS6+mLwp9PNrt6TFDwZ21O
	 uU4LO13bwHFIqXLLZzpQUjVSF0RR0V9GBMx4NQpXMIPe7av81poTxRtwYUWyy139cm
	 13NMDnRNTQ1sx87IlsZdQcfCbhimkndlLvzukWlW9Wl8jA3QPfmgTTWJ1DhVv3+PMZ
	 tApx/rcHMdMZ3dIS8YPWJFpyyj2w/qpN83X9Elam0jCgX/859jRl12EIolOtsOdWpu
	 c8X+QcCHJQQGg==
Message-ID: <sashiko-outbox-217718@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/16] dt-bindings: arm-smmu: Add Halliday SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-4-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-4-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:30:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the SMMU-500 on the Qualcomm Halliday SoC.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D4

