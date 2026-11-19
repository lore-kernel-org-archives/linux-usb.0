Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092528;
	b=Py4oyXYe4CrZ6Uv2F5y6uaDtrs8veFZhpKhQFVe0eo18ln4+A0BKB6FAKS4dP8gVPtkj
	 KyiuS0gprCbAZS64FSrHUmeVTuMg2GIsox8buoL0yLgYiztT63F9L00i+AyLIvqH2PxX+
	 wxqltP7quQqbRbQW2lEPzU2PtWnCJqtsX1KEpek8CBBLDKXr7RpIStZe94g20WTyJ7Q7J
	 2+Iqac6UIC7a2Jw0keDk+x5Y8u7eqcGi7Qg7Il4Tjpp/cJn4gf6pT/BqzRRjotBEETBkS
	 +VfdnaHo0ZJUxh4EnMSwJe3s3K3ITqBer9uRx2y4REi8ruAhWLGbN3dcIUKsJjOIFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092528;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h+daNX9bp/e8g4PF8EwoX1zabB8kBKXnMP0Zt4nOlTI=;
	b=IB72kBfdwd/B93DTEmN/JyNHPY8g+kH2wwBNGxb76u+txe5+TMz9YxxutDcOxNf8t35E
	 m+AeZ3WtZqvGHcxDXewfOa2vYsvUMSrY0Lr2BiAkab58MwyX9SxAA25YgONZAWPu8TjOo
	 F2DdIeS0psKuxCfLgIJ9fmPjGKqKQLatB+4sAIcaAv/Kt7DcMtX5zoX4TZfyW9/YTrRxk
	 p8xkIYwpKulolsGu0dFxENxNujw88yVY+00tq+ABOo7BqC2CKAJnuJR4wtzqjbtUXvhVB
	 YMhNdYd3Oy57K6wMfTTwQ7W9wK+aAMXkW4b1FwmRnGFjU0IQhbxvnZglBf+F49DO1Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eK0GXo1x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00EF606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eK0GXo1x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0CC1F000C6;
	Thu, 19 Nov 2026 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092527;
	bh=h+daNX9bp/e8g4PF8EwoX1zabB8kBKXnMP0Zt4nOlTI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eK0GXo1xnw158Pm+AuwZRlRRSOyOAsOJhsLh5iI9ME4i2LOCS6NrVkKlRhsghVJy1
	 iY+O17GLCK7AebZqlVhDoErE5eBJNSl425uVlmDL7nlvN6rjNMPek5tb5TVS8eYL7n
	 K4G5yK6k5SnzBF17k9YNS0bhOowhpo+wUVxL/UPan1MGf4Qq9FVIpeJa0T6o1yPYlb
	 EM2y4+vnIilkhkkOimbKcYItdbtYBIysmZahGzta2chjCXKpw2+SYb+m8Mshgov5CJ
	 yHCVl+khB+d15DiibrwP6SHsuiIbr21wTQ4EicEjc0MkQMFca6feHuaEftaJTxP9bM
	 tEy4/ScPOkhrg==
Message-ID: <sashiko-outbox-223117@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: qcom,snps-dwc3: Add
 mode-switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119124558.1548-2-26rote@gmail.com>
References: <20261119124558.1548-1-26rote@gmail.com>
 <20261119124558.1548-2-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 12:48:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
> DisplayPort pin assignment gives it all four lanes for DisplayPort,
> while the controller can keep running its USB 2.0 port. The controller
> has to move to the UTMI clock before that happens, so it needs to know
> the Type-C mode. It does not route any signals itself.
>=20
> The Type-C class passes the mode only to graph nodes that have the
> "mode-switch" property, so allow it on the controller node through
> usb-switch.yaml. Orientation and retimer switching do not apply to the
> controller.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119124558.1548=
-1-26rote@gmail.com?part=3D1

