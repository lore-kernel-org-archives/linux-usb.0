Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513594;
	b=vvbBJmkPTh5CTF2kgQl4TfB6LJDdnnohFYu0pSkcMqJvhNdXOCOBmsA3dO0gLEp2P+m/
	 HmBBqMilS/1QvWS9DDIiwm6vw0QVAHPc2ufSl3R/XCLS66gNhq5zol1pQ1Z6+kSc5+wSH
	 54YigLFtT2rylAvnISj1VmChN+bWQsOluDoia5VyeffgEpNsJWMXXM6FkYgZLFdmYwc61
	 VWlfN9yLq/SSNi+6TjeEqxx+OlY40D5vmKfQ7QGKxFlEpyrMdlnCSn7NBLLnGV3pvQ4b6
	 fXXnTjpcocG6aV5vZrqX707k8VFVNi19wEfLV8q9SNSGBAuA5xYTa113CfsGBG0PG7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513594;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6yp8WkVY7UWHl0RvKITrUjygczhkuzyrPTK/4ZgeZwY=;
	b=qBTCnabobp1+aJhno8W/GTZ2aiPM6X/NZSlGMXV0ReQh9AijiZ2dooUL2tIMLFhARPKq
	 E50YkEg+GF/KHSNb+yyBHaBxWAsCNgNgiQz7xU4BVl7+vrun8BWP27NIbPKZLXPYx8GXz
	 zwQByfV8eXECh4PB4cwyXDajrHmwfGmWEIpilvnsniYnRykuFSvHPVJzAzojOfwkQwRHH
	 0393L+M9v7cH9MlMNN9y7dRFzYB7OYDf7Aa88FO5S4GjK3BgSWQDN5tLhpouY/7vwpMdZ
	 cItGpfMjTvqyHYOP9jGqkoD47mtWmFIxIzaB0YiyP98t1F0cI9mUQkzbkbgc97MWBjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B9B606A31B
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 16:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC7051F000C6;
	Tue, 20 Oct 2026 16:26:33 +0000 (UTC)
Message-ID: <sashiko-outbox-179349@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: fsa4480: Add an optional audio
 port/endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020162101.1527014-2-val@packett.cool>
References: <20261020162101.1527014-1-val@packett.cool>
 <20261020162101.1527014-2-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 16:26:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The fsa4480 mux is physically connected not only to a Type-C port
> controller, but also to an audio codec which has to be notified when
> an analog audio accessory has been plugged in.
>=20
> Describe a second port intended for the codec. Keep it optional to make
> sure existing device trees do still validate.
>=20
> Signed-off-by: Val Packett <val@packett.cool>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020162101.1527=
014-1-val@packett.cool?part=3D1

