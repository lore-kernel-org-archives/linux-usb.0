Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753751;
	b=eoTMvjqStc5yf7naGH5CoZq0ScFXPCs2wn5+OMZ6LnsbV1hTEOS9eU8LcsZmdncA5w1t
	 9FYRKGxDKPN/3zivuy/9FVAIxAoIstSC0bbaHgZCWIsoHBhHqc1pBgEB9gsQQirz02uVk
	 DsQDDh+sXEXy7fhkNvpv3t341L8apUha1emtDU74m5LOpc7dWhObQFZUDM+UAxAeWv9tG
	 M+tnNPz+6trqYj9p7NQ7gF64uk3JTII56Rd1JGfyIvMGVl0CwZsqDIImsvpyx1VV2I3n5
	 sDIMJ7+zpTFgZF/mltqUPAjfBSJscZtQq0wAdaJsZlHMNtEyOeFEn3KIVMFyYSeLJDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753751;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JazSFNsTv1vKafYeCf+8xgc0KzX028GeWDIuljTF7tc=;
	b=GDS7g91DzwvYOuADfcmEmnkaaC5MkIALJJo4vOFzHOi1WCtVcUVOW6JQkqNCmPWsVdNf
	 FDQQHOORkeJE+1inpcSA9j+KcXb3gkLS9gGxeTcH0fr+0BAeEA1eqEd1GOLWS21Id/XAN
	 yrL3+aArx98OroAKmKoEwb9RTIO0cwkG7jwFmV9vYng46HL+f2UimH7yEPoVSqdyu78SZ
	 yNtZREjZXaas4icRNvZebL75dpQ24KBy//HQ++HuQXII6ES1zSmeRCiW4SWSvd/gLXzXG
	 1qXD/V6bhXOKQocrKBTqZkHAakZP6GbbGpQ+3W41NSawh00pKwd5o5YT8s0cyLA2pdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ke0VZ4jN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AA9606A31D
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ke0VZ4jN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC8A1F01825;
	Fri, 23 Oct 2026 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792753750;
	bh=JazSFNsTv1vKafYeCf+8xgc0KzX028GeWDIuljTF7tc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ke0VZ4jNPiFkfTO72++lIdt/XKfdEbUqgZJnoej5tk63J+8RaYQ4TXVMqb8jKlboq
	 otzdD81WIHLovj7CPWP8oo2eICH4VZB/HKCnXl9S0dW7X/reh8UrsY9i1sUkzC6Pp3
	 uHTt8B4rfsKE2zsAnw9e4sp9TLLzStX6XqJDaVeOIC6guVzoR0dFqlQZJLbZ9gDBcx
	 Qoth56SwGAhl7IKx4YODGKBmLLEe38XdyFCg3Akrk5a25tPnWRWqeYrrQPb4bTXfDb
	 Ff4vD7Tl/Q6VWzusmPvtfI0ekH45pVpQFJpC+c1E6MgYPsJQH/4PNDHNR2TI2YoKsr
	 TY7BDFkyUuisw==
Message-ID: <sashiko-outbox-182716@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: u_ether: fix out-of-bounds read in
 get_ether_addr
Reply-To: sashiko-reviews@lists.linux.dev
To: liuc63 <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023110113.2969708-1-liuc63@xiaopeng.com>
References: <20261023110113.2969708-1-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 11:09:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> get_ether_addr() parses a MAC address string with a fixed six-iteration
> loop, unconditionally calling hex_to_bin() twice per iteration.  It never
> checks for the terminating NUL, so a short string supplied through the
> configfs dev_addr attribute (e.g. "ab") makes the parser read past the
> end of the buffer, triggering a slab-out-of-bounds read reported by
> KASAN.  hex_to_bin() also returns -1 for non-hex characters, which is
> shifted and OR'ed into dev_addr.
>=20
> Bail out as soon as the string ends or a non-hex digit is found, routing
> all failure paths through the existing eth_random_addr() fallback so that
> dev_addr is always fully initialized before the function returns.
>=20
> Fixes: 2b3d942c4878 ("usb ethernet gadget: split out network core")
> Cc: stable@vger.kernel.org
> Reviewed-by: Fang Xieyan <fangxy@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023110113.2969=
708-1-liuc63@xiaopeng.com?part=3D1

