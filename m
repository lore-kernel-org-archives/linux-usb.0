Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864591;
	b=ZOPrZjUT90bMxJP6eYVNzZVXKOt5elFikNtaFfDUi39LEznet4hZ8ALqmu3h8dGLkt4i
	 3lmfeFHdF0oGurScKU+DjdEj15WF30o0FO4a0mEIbww1lA0984V6Jj772Mhm6fSRVjcSf
	 eAosrXZrKqrkT7xZNdpLgKIjJDeHNto3RLXJiWWsl92nLkp+XA8jq7stYnUTF9P0xWxSs
	 5p1532Ar5xyhehgzcov8uiwUc5IIf0GMJB3vGvpkeuvvflQnmUUbDfar+/ftPrZjh3GtO
	 rYdr4pap9i4up9ZtdsFT5nQ1+CafP6SksHfmdSdIMZ0OmzOdLPzXMzI0kkDZaqFl0yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864591;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/jYPN/pAVK4j1KibJOc12Fq0lMZQXFc9z0FeHOGa5i8=;
	b=rnQE5sd2qgpdpbgklRygeRotseVA4LLUMOIVpS4UkB6VJwmy7PF/Tp4hLuIE0HRAoqzi
	 TIb3Gnk5oHFlMh2B/k3UWmkXz6F+iTtZh4r9OvlqQbYpOLOqhuhCNsTcIVZ2soHFtS7xC
	 rUKwLt1D+WLc1FM3fMUrXAk4MSleDEjpF/FAzbmfFZp6IMSvkU6xpMQAouGQWPf0J/zPi
	 7EpaGgAF0RfPyQ+wosdv+xkkD7r61jZ8itVnZWUsIUwjpOEp2k24ldohu/nQmY9NO6/Vn
	 fYZ5t6b87/SLkgWE/xAYj9knfXxlNtH8breRsXl9A89bW18z1AEji85sV5CgWj8xnfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDAbL4TG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A1606A31C;
	Mon, 16 Nov 2026 21:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDAbL4TG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDBF1F000C4;
	Mon, 16 Nov 2026 21:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864590;
	bh=/jYPN/pAVK4j1KibJOc12Fq0lMZQXFc9z0FeHOGa5i8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EDAbL4TGFFKF9YdfBikQVeSUGN3ZG6982sKJOsc3PJ6rhStGTq1rFY5+CZ6cos4I7
	 5ytmdGqhCYFGpHObqPHlrsVF3yoRbINv0xjCSY4uYmTTU+BfyEfTULmQ50P2YFJ7y8
	 3AZKUnSQ9JQXYetEF1xGJskNR/XfzaaqjP/so8C28lvu5qqSQuLqbriHiiC2xSICfJ
	 d+nlhssO4AIqKov/Hp6StB7TYsynaHP9hl00QNgWgVirJ9ajrjync9Tm5o/7AenV01
	 eAjycrQ3o2LnP3JXqWRRjanAqOEV2wxlYreErQRL3YF9DdeL7keo2PUqsjmm8WTLkH
	 YWUmAcxb7K2wg==
Message-ID: <sashiko-outbox-217715@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/16] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-3-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-3-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:29:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the TCSR block on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D3

