Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864661;
	b=DqGN4VmAYYhB5enKr5OuXkHBH2zltAdR22YwN3l2Fp0MHAtA8Em07DGAlXrj1B4VjK41
	 JZupOsP9pK/HuoJecJ6YyvxICKhIl1E5y0o8DDOkqKQZPmRXHTzIRCjrxgTw+1gjIxgp+
	 xHyveU0mpPSLMObqEkcwpmBYDDey6dhN9zsqbKFvTyo/aUL7Sd9Mh09eRHsZ3vIrey7IK
	 2tnfNEIR4jE4okHMHNeoHmscfWYMkHLIu+fuXBJZnjeTkSiJDBkH5Gb+kX+RhD9dovhkc
	 J/4mmL2cW0ecvgWjjLr24F01u6SFzfdFpEGWyErp7C56tPQLgG4jiqolMEshRNRQXUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864661;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=68zvNdtzmhlCSW+waJ89+bkXjXepq6xuTDfs2/tB/tc=;
	b=Lpag7pZFSx4lgaxXb4Om6K53aWVbtgbtoSGgUECeH1w+80td79t5w45G+WGWPDk94+nm
	 HIsubB3rnefq83vczrxK94RoKquGE2StqLPP1FL4g/okLKChVkLJDbyz8NZ6tf5hdxZ9M
	 rDNLeji60UuA3fjzbEJlB0t65roOaT7odjPGnZVkqqmyk8ARoaWYb0rXJCt33/4SFkTZ4
	 k/Mk5BtycNEn5i7L/iFxLBr4DjfBFTqhtAxgPdlouX3nm6LPcDZQ4pTpfochX5Dy3rZpL
	 s4comL+cJTqyTXouuKEKz8meD8wtYvwyQeWw5RPSSA37vF18QyOZ55NXXZADYDPFb9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cB0ThKeL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2081B606A31C;
	Mon, 16 Nov 2026 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cB0ThKeL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20E51F000C4;
	Mon, 16 Nov 2026 21:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864660;
	bh=68zvNdtzmhlCSW+waJ89+bkXjXepq6xuTDfs2/tB/tc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cB0ThKeLryKrpEMlMGm3QN0CAG7ZYLS7JvZx18eYVPZE/Zcccs/h1JqJBYqDbg4gF
	 4ZkaLsJzVHuzN2JMQHdVemV7su/FKA6ZdzhSFyp7dZdVRCvIZ9U4I0LkkhZYGhvd+4
	 PmxqVoWvVrLn6d9bTO68lTS6A+sRUhttapsAsvY4VgymnKMQL38f7TbHSg31+KVgMq
	 WSjFfPcaHw6oHPWhJXRy8RVEEycFVgkcQ4ABKw8mARqo+rBXg0wO+s2xh6YzjG7jI9
	 gxw+4r9MnKpCvFdZCkow3pR7o3lssZ0boNBfSyAdKt1HCdiHIfdBz20z8NDMJqJ9yR
	 ZZbSkRkyAljCQ==
Message-ID: <sashiko-outbox-217723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/16] dt-bindings: firmware: qcom,scm: Document
 Halliday SCM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-11-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-11-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:31:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the SCM on the Qualcomm Halliday SoC.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D11

