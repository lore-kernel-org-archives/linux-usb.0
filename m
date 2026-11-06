Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957743;
	b=GAxfQ6u6ll2tkRsPydThEsG+qvpz9VfBvNA/7I1A+9qd5x/yeEu2EdoNk9jZfsUJF/MB
	 k6AEbtad3ButSVpoMZ5+WPUrnMfhuTBOMptrBct3o6gqonxAHhw1y5QBSXQ1bay7ECMSV
	 wcbgGYmFWsGoVTWF5W464RJ9yTowi1TPkbe3F3AYOTxTLI32zNoAOGsmKhGl+jAAEM8fV
	 h4+k9Tga3/o73q6DgRB1eC4mlsnJvlYrSUXE7Ze+Y9zxQgf9SdNiThAr1eU8JNfjmY1+A
	 z+nq8HT8kWb3f8tPNo9A3gQo9848gBhIQD4XaARmZpNFs3gEhDhjs89+3+H+1PCIRGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957743;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XlD/LhqBLQFVFHJZiW3wpmqACONIcHtkMlbtjSfD8hQ=;
	b=q0zpRBhUw3Wh1625gNyAvYnNA8IBY9WLXDfa23ACBVYDl1P1390Xj7smeAyyUucIQVSD
	 9B+ydLHRfptee32/0AWjjlRBE6M5wV4xkmoPwlAMfrEIKtT4M6VblojCAIwYD5603BSV2
	 ABk1GQFaV+FiGhxo1jJNzGzuhezwBNVVXyI1dLC0yJUqTHvvkm3RqjCytx79Qh3uUHmNS
	 /zDJJ63kNEH6cB32VfOWlr8708xOX5+kQN2o0Qe/0VoLc+cR5F9HORk8eAqMteFtata7L
	 RqHIOElyaqQjZeoVEX2khb1KCKIr5L9zgr581WhG8ynPQNAZSbG/IoaV3Kl/639JfZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HmoQEs/A";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585B56082BD8
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HmoQEs/A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3081F008A1;
	Fri,  6 Nov 2026 09:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957742;
	bh=XlD/LhqBLQFVFHJZiW3wpmqACONIcHtkMlbtjSfD8hQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HmoQEs/A8oZXzDy6kymC+uP5ayq0Qs8gyVu+0UHze7Gxzyx7M2J14/4qXv6DF+Jwv
	 bUtzF7eD3Bt7xpVJQBxIqt3bQhunDWOopWEwUv7fOe8BqZ5Rga++OtlZ3btRB9DLMn
	 7n1naZ4ZCjk9AoeDoWGxKTPDR5DSTLy3uLWOKSp3vakma+ZUUptiAfk0kFX9hEDhJ8
	 o2nD+fAXYhBowvLuzmnPULHgu+DtyjnGn7+/tJ40SHCTdFDotDz22Ha2AGjuuCZ9sB
	 GgmQwk6lhOaM6IYjpOpZ+uKWMmPhkiSw2OuSce0u7M1QlA4Bl0abMpuXJL0MX4sXm1
	 xhtHFxWjKGdWQ==
Message-ID: <sashiko-outbox-201122@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/25] dt-bindings: cache: andestech,ax45mp-cache: add
 MT2824 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-6-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-6-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:35:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The MT2824 reuses the AX45MP L2 cache controller with its own cache
> configuration. Add a SoC-specific compatible in case there are additional
> differences between the two implementations.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D6

