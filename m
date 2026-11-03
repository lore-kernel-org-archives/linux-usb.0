Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715028;
	b=TeLWpo8b3n3aBEjYZ7hNoZpPBJcsnWTR4tSdMogr3Xori1aduSeHP5lCoeVrwmSKBKrn
	 Xih+CzZJAYE5Iw37TT6sjLdDEljLeMAnHnP63Sq9Kkfewx+9hB7f4SCtNutOJXNzNf7hI
	 UzrJikT4xdIbJmpOzWVJiIGStlRTCHvgCRSCaT+0yPyT45GEfrpAPcdvRNXx4XGI4mQU8
	 lnkKhlOVD6tJgruKqZNk4lakIbw1WqRvfrWcbVKxOBRDl1D+pmM/V4mgT3H3wjVlpyoVe
	 TIfhiNpzs6l3vgKWbCRkyErhGpFctNo8Ye1spmhXlYYakNMqgS5TwCKopWHVsg+sC9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715028;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Imuu/q4NB3Rlxt/29nw8u2aftxRHlHLzOOAtWjPGP3E=;
	b=4QxSoy/Z022XZBTjtsk5PZSz4MyMJfDnY0n2IPuJuNC39+PbqMpELTmFhM2T6Z0mapF6
	 KIrLSk5NszfHHVADfO36yJ4iIrPF4+9Rb0YbZO1iukavd9fNz8fzmE3yC/1nMqm/N7pUS
	 njyRUW/xvM2QjcOJnbr69vEqyNmZz4jx0gbFkm16IHY9Wlgc2fepV04qDWBlXG6pdWUsJ
	 jlDaieLcUGBttjby06uoakFLy1PngOVONe4i8KqvCwLNwTxRulYU5W3w+7Ivu622fBr12
	 R5W9jn//u7KJx7tB96h4cPgybNf78lFEbufZbn8tQLxfd6mubRCcYLGtSwZqy7rBNuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUam7Z4U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6D606A334
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 14:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUam7Z4U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306D21F000C1;
	Tue,  3 Nov 2026 14:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793715027;
	bh=Imuu/q4NB3Rlxt/29nw8u2aftxRHlHLzOOAtWjPGP3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hUam7Z4Ugddrkng8hxwwMfV2LRx3mlZ8WHsQKDj+PZ+8AkSZeT+eo/xnH5hVAZpqz
	 D61jBTsL+4rQBn5NxB7PPEGLBAb9VIPbihEc8va4gCCHv2ukGh8mcyDO2Y1jc2vU+y
	 37RLl7N+sJf5AlpOpXdZii49NzjeqnG3Wdm9ryhGaOTiu7jHXl+IQeEdhtMTbiAKXw
	 ZCdJDqWSQPzUXKttcCB7jEzJ/ZQ5Ybqic/DL1+tF7L88lDnh7LMwppzgCW53pOcXmV
	 1esopPQEKo9SwbwCPp6T9ENjgAxTjQ6Ndlmxjdx7Ti7HIa+AF2i2TGn1z4bGIaQBMd
	 FcrF9imCHxNDQ==
Message-ID: <sashiko-outbox-195424@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: qcom,snps-dwc3: Add
 mode-switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103135057.1682-2-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
 <20261103135057.1682-2-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:10:26 +0000
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
> has to move to the UTMI clock before that happens, so it needs the
> Type-C mux state as well. fwnode_typec_mux_get() only matches graph
> nodes that have the "mode-switch" property, so allow it on the
> controller node.
>=20
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103135057.1682=
-1-26rote@gmail.com?part=3D1

