Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070265;
	b=Ma2fE/yRcK4bUyZ1ACFVfZGMt8nkbzJT0co4xei66Y0RFuU0jr68X/g7pfBYadCbi9Tp
	 S2cZcYobkiHCr8pvvLj+Dz8l9PVlGFLouJ9FQMF4d+boVwzuWiuWxPRR4LR/7Oe6SqsDK
	 i2EPDRudr/bXPvFtBUJpojLXN6hw6egLcKpVjGPmCqLwoBXAcA8ZbmOsKIpOzL4+SOXS4
	 11sOvqeFVJfzwm+IrmzBmQR3/gIqO8o0gOwbxWTI302E3PN+Ig9bCxJ4vA5UTyfexLacj
	 tRpKYlzAN2tn3vjoBi2KtocbNaacLJ4fjDPINFbvH01yDyjEZoZMhVEsPqQa3zgATig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070265;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Of/LkLr23+Y6jGXdo7ZR3GP5DjoEVQB8l95lJDf8oh4=;
	b=gQZt0R0OgRQ6KXqqertxOhfhvSHcFD6fF6WK3X4PCu5sK3x/W0vm6VYLvGc96HfQtg2J
	 XVggYnETl5f8fILGhp08u5l5oWBoCFa7JxW4ba7PpYZyv30pDw6CdEJGYK3mMCgib9x2i
	 qS/0aHCpyjCO/fW2ZaG7FCjR4lrG7sAMsn6bnCssEQSCz6Cv8WU9/9p3g6Wtb90dmDs0Q
	 bpWLo8Y2nJ95Q1p5gNc6V6f5HvgdDqpuzGZd4/5LCTSahhnhVO/b9gYz0GBl6NL25RxyM
	 ukQA4x0zh2s9xR/ksSHd1aEJkj7/rFLOzmDRS1LvWQize8S7iCnenlaRJpaKV6hXTog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=am93ZSBz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474E606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 16:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=am93ZSBz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2081F0089F;
	Sat,  7 Nov 2026 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794070265;
	bh=Of/LkLr23+Y6jGXdo7ZR3GP5DjoEVQB8l95lJDf8oh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=am93ZSBzJq3kEEThuYaaN533KLgAiyPjw3m2Uz1Na2AkAhsaJ9KNqVoe9jV23ue57
	 ogxGIqZiqFFCYNaddkINyhs1CUnZvjMnD8fhPWCSNmgCAq+NpA/lxIZw+n6I7eR3Xf
	 6fdjrtD+mu3re5ekExNVgilcVRffuJXiG9Wil1E4+kUSmqfFK16Hwv02LKRbHNBM9U
	 WUaKqHZYilAVg9jGuJj5mKpsPb5f6zGLwjJCmzcXG7Jh/fHMlVUZ8qrOvs7PGY/Y3l
	 LpEGSgg/m9wLjB5MP2b3eWoi8ilbcJn6tyRFTTwc1SINz9q+sRG7m77fwIbp+lNPbG
	 MElO4qntII14A==
Message-ID: <sashiko-outbox-203075@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: musb: ux500: Fix transceiver leak in
 ux500_musb_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107164653.481516-1-vulab@iscas.ac.cn>
References: <20260916165055.2085246-1-vulab@iscas.ac.cn>
 <2026091648-ozone-opponent-8a42@gregkh>
 <20261107164653.481516-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:51:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ux500_musb_init() takes a reference on the USB2 transceiver with
> usb_get_phy() and stores it in musb->xceiv. If the following
> usb_register_notifier() fails, the function returns without releasing
> that reference.
>=20
> The reference is only dropped in ux500_musb_exit(), and that callback is
> not reached on this path: musb_init_controller() jumps straight to its
> fail1 label when musb_platform_init() returns an error, while
> musb_platform_exit() is only called from the fail2 path. The reference is
> therefore leaked.
>=20
> Put the transceiver on the notifier registration failure path. The
> notifier itself does not need to be unregistered, since
> usb_register_notifier() failed and never added it to the chain.
>=20
> The bug was found with a static analysis tool; the candidate was then
> audited and the fix written with the help of DeepSeek-V4.1-Flash and
> GPT-6.1-Sol, and the result was checked by hand before submission.
>=20
> Fixes: 0135522c4898 ("usb: musb: ux500: add otg notifier support")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20260916165055.2085246-1-vulab@iscas.ac=
.cn/
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107164653.4815=
16-1-vulab@iscas.ac.cn?part=3D1

