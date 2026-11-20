Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207141;
	b=0T5sufT0k/9Q78/67WJo3khGlPbXtOJXnweA1oohg+8/6ttEJer2CeoWAtdJQfs8830T
	 IkW5mWsXufmyLwKQKae/RpqTZbP6i6qXDmD3++5V0UMnxYbGdJOs9NsQ26VYRQkT7T/4l
	 NEYqoThXu9iARPfzGLd/qwFV6w6Rke8sMIPeklyhTYSitSyZlFo9LTgagjz+oQILJyPfd
	 AW2t1PX41cfix9uyr3Tl1JiqliQ3yrA+bQABZMzfjwd9jnGNU8nWaIIPFUPStsR+ta3Xv
	 jeh0F4XI6DaT+h+F/cfPO3RAxvahQe9q7a2I4IjLwPmm13d64RAiHeeVtTwV8UuZ6qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207141;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3/5UdN9ssA4LAu0w8m5qoW3C4g9Mhqen2Yh/ektE8DY=;
	b=Qvm3LHFztMGPmmwgrQXnQAkBXhnRBJtoXIOnTWLACKABmEno3g8Z6wag3hd2+4m9fRbD
	 X6KlYhXYAE2qC1E2LUEDzXiooiGlaXeBXVL8XbBLT/KIoyi+fa/ylGy6g/H9uB6KnfYdF
	 82C9kLG8MJ+jktgYQpOnKoAEmHf+6WodhKMr7TmohWTDW/8z6FoSFk9UgfOMmknTwLLUz
	 Br1mI5XtE9vwguokHIyzanHA41RIc8wyZTiXr/KqpPofJJ+62Y5B/sz/Q9iHGIArVlQcs
	 FlmDexGV6a0zK2nEWNG5WuL0bONNzQ9Czre77aWUF6pkM4b5bm4iiEiR4B/+P/8HsUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUU5iY1D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654BA606A6D6
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 20:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZUU5iY1D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284EA1F000C6;
	Fri, 20 Nov 2026 20:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795207141;
	bh=3/5UdN9ssA4LAu0w8m5qoW3C4g9Mhqen2Yh/ektE8DY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZUU5iY1DTkFupX7HkxF1rK6oLV3O9O/TgFCtBZzpccq9JbrFa+mWZfWpFXqo9Wit0
	 kCSm+zWDd4sUtqExvgttCVHlDEIfzwmjFDdnBUMzww9IgSt9O7KqzWv6SlWqBcfMvM
	 wU4AYp8qzgOPLiXl8uUbwWbJYWPJ2yVlqx3WkkgiC4SkYO4XQKtsgV1kKx3RZkTtU5
	 CUbQsP2xH7/Rr9XS27g1GwJc4b3TLyVhjq5QgMAoCehNBnJdPfB6Jl/3NNApMHQwoA
	 3+PeZX3XRcaeU+EDYsuLbj6O9bEmUwNOwCZglr0OiUbA+ppWhcasyTE1AqLpOlv4Gh
	 cpS1TvsJjGj5w==
Message-ID: <sashiko-outbox-226076@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/3] usb: dwc2: Add Siflower SF19A2890 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120-sf19a2890-dwc2-v3-0-de377bd408a0@telaak.dev>
References: <20261120-sf19a2890-dwc2-v3-0-de377bd408a0@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 20:39:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-sf19a2890-=
dwc2-v3-0-de377bd408a0@telaak.dev
