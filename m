Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353527;
	b=IX7OC1iSf2xQXh6ZioGTN2K0NBmfXHRukbCOYVPv0SclDTZA7L6Jh3ty6gP1T0zm6xWU
	 1zqJsqfXYUoe4QbBfTNnuUwR28E+OHqFceH/4CzfN4kClyLatFeBZHWa5aTOGPGpzuXWn
	 M9ucFv3n8um2YN/EAl/AV0r6j9JIwtLry9PH4Y+FLJKmfEGmSZUnKfB9I/ZjH2v/BI2tk
	 eqiSK99ZRVVf+Mcf7lRvWj93Ct9C74zFz0wsxYtYRyJpjbVa19liQKDNDtur2XZiaxOXt
	 tbhHZDgYNPSeLH23/BldP4BDnKdNyc7PNSWATXEnDC8RWQ6sCQ0Hmyg4AqbH8PBY7Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353527;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ODByUjEBuhVWJAAo31u8DKJeObV2r7v+/WIT1vOrveE=;
	b=0gS//E+V5ABdS2putIEVk0XcN4OK4dvhW5stHc4cCBpAAq3RNBVer6ERJR1+Fdfj9SV3
	 kp+NTfSAgFVu35H4lccypUdJYzu8kC3HHZ8Ce/Cx3hQQVhW9I1o1VxTysIqF0J6atorbb
	 cjvSRL/X4mGsswWTBHPpVyyVldZv8A6cPoe1Y6R03cNe4E6aTCC6fFbEWYDLwIN1bK0PU
	 2mkvGUYX1nsGv3VZJXWOFYUfJRPrGrv8/POo15SvXjdfNlE7NL6UL3UUT6+hnxS90SVWy
	 NdZhuRcEp6Slwyw4F150ZSKOYPFlp2hBbozvJjiVJHeGCcuPoKZc1lkulCZAmiKSFmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hw9vL4mY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAA3606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hw9vL4mY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D6D1F0093C;
	Tue, 10 Nov 2026 23:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353527;
	bh=ODByUjEBuhVWJAAo31u8DKJeObV2r7v+/WIT1vOrveE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hw9vL4mYr8NyfbnRu5AlUwUzodS06o/nDG3WCirf+uHvxHpkegOxAwiaQ1bMUexRY
	 /GaGhY/PGHr0nxhu2yvp4CnHNKrSLm9LUcgFdglmTmjJur7Hs9wE67HhNvq6QnSZ6Q
	 vTFXDuyDoLuaos4x4GmVgiICfk+w61JZE/tfm82HJjgL5fUhROMnMeIZ94o6/sD8Xo
	 gO1JIXRRQicIM4er8rEDXFC+S2AiXmcl8W6CwkfllmqCW8/emCqivfE1HZdUG0CVX/
	 S6+zxOqTiohg0WaaK9UM6K+yEHiw4cyOICOYkM9Zow3lm6he41i6FzfkL0zr9rx4NC
	 +MBJEaYKx/J/g==
Message-ID: <sashiko-outbox-207924@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/22] usb: core: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-7-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-7-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:32:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: core: comment typo wakeup up above usb_set_lpm_mel()
--

commit 4d89b6e99df2b30286e869e88db58e1d24d63a0e
Author: Shunbo Shi <shishunbo@cmss.chinamobile.com>

usb: core: fix a few spelling mistakes in comments

This commit fixes several spelling mistakes in comments across
drivers/usb/core/.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 199d3f535a891..9478b23e506d5 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -215,7 +215,7 @@ int usb_device_supports_lpm(struct usb_device *udev)
>  }
> =20
>  /*
> - * Set the Maximum Exit Latency (MEL) for the host to wakup up the path =
from
> + * Set the Maximum Exit Latency (MEL) for the host to wakeup up the path=
 from
>   * U1/U2, send a PING to the device and receive a PING_RESPONSE.
>   * See USB 3.1 section C.1.5.2
>   */

[Severity: Low]
Since "up" already follows the word, should "wakup up" be changed to
"wake up" rather than "wakeup up"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D6
