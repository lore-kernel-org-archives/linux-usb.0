Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957781;
	b=OIiFEtS42M/k+mGSZCRf8Gg9EKgXFLzLY+WT3+Us39oSMkSz5TGsmRYoxq/osyRkQ/wP
	 hAXHWQvxGcVHNaAMHVc4bKpvQBqbiCL7gjT0L09CnSF3lNvDUUa1YzmkWkKPd0DF4DM/n
	 PPUq3z921eb8z6+ErqL57HEBRGbhJv1/O/KK6ERg+95Zu+OdG7Jqpx6Xo9qDK5lqmysg1
	 4EWdSZUUDnSe9P5uOnOiDKrwCrzwDJd1ZPlIMlQqtGXs4gepTvc9BhQW2p90fip2V2Xf1
	 AX+tRxkc1hGc4DgyrN3P5UBvPqjmCvVSLbYXCUTiXln9Gz6Qx435Dy/cHJ1VoHlbIFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957781;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PuNF5Acep/gCxsCTkyOfSCLJehSl/DTn75rkD4tMxmo=;
	b=QyzTjQ4engBhCOT0/7Dp1PwYiidTyjE/0etV3uGOSbKBjq1yJtiEBFXTJWijfeTfc1FP
	 ZlMK4mFIc7JWhRO+dbZRssJSEj2iHJyBxp35rlsChGgCE8uMdJlHQSFoFFm+kD8R8QQ3p
	 VC6oqcz/vvKJJqs/ha+rTUxFSWJu3WFz0zN15bTr2zITG+KXPhIcr9OqJISC+HGUXBqWh
	 kr01EDiuZBLaN4Jc+P8O7YUK07An2t2FWwlR6q/LWTtuHYdSKLucoZ56AIBBQu0gQCPf2
	 C9cEaGi3angGfv8oSYoCeuxkwSbEROGT78qvu9wFhkSKyyhoUdjPt4KpOhtkqwHMNNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kwX+NpZU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C158C606A92B
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kwX+NpZU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CF91F008A3;
	Fri,  6 Nov 2026 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957780;
	bh=PuNF5Acep/gCxsCTkyOfSCLJehSl/DTn75rkD4tMxmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kwX+NpZUjWNfERAFpwMx7ZNzKdcNv9C2cPRmi8y8NjmCooznJDr9HQidWkp/jk+4U
	 az06errSSbH3ipgsnDfs+SL4SskvdzhK2+37LE7TYH87yDp5dmHuYHlAUneg3oujIT
	 Qgp5ufmb4GhT76i5lfwEf9gq0SiKVzAWxAcvlR9abi3FKclOEU+TgHcX1+B9NfPnCC
	 I5ds5jJsmSp6Ts7bv5gOJTYlJICuAEeNr1aMKmKKoC7CO+BiZd+DTxHCmE8VUOhNTF
	 DpSNvvNYvGAXbING0J6VLp2Ojh+wxZh6vH319+Gy0rNCAqLVjm0b3szGtXovogE2wO
	 muwEb0KmGNXoQ==
Message-ID: <sashiko-outbox-201128@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/25] dt-bindings: spi: andestech,ae350-spi: add
 Metanoia MT2824
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-12-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-12-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:36:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Metanoia MT2824 integrates the Andes ATCSPI200 SPI controller. Add
> its compatible string, with andestech,ae350-spi as a fallback.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D12

