Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793203609;
	b=tAr5AgHJ4E0c69e4emNfPnATy4F9tbMFNB9Z6wQUSuoKElP3v8VMIxie70yM4jBhDEVw
	 byI/6vJqdG9JuWHXpUGaYmS5u1CqadrhUsjHMCAXEnVzTIHTMhx07DrsLAxVHNrBG/dWR
	 2oXiBG7x7erfFMeN2IwfJi79UK8eiTD0dUBd/sRAoKEmIpXTkfAAZPFK6uOI9AwCib4TX
	 kBhrjs0tlZn301hrX1U9yXxJJ+66u403FsrpnqO9FrMlvKd3LXRQToWho1QpO7Wy49uz8
	 eRdodEHUSc15esgD/OwZvYv0pmbnTfNQyDr5Qpm8TBbOUCgF+xzDTwqs0kjQfmHZMLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203609;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JGj9MAYStEqrd+xOIds30Sh3FSi3CkH5bjwWhcgEyOs=;
	b=iHB5oTyioRl/GW33Hx4J1XNv0gnY1cDWAM1BBf2YDfbauwvhKAsob/oavsACTw4epMIQ
	 22pdEjr4JMgQMvtYROL7OagnUCGcFQ0Ktx3Lx1T6iHnOOWlm3VDY/X5CxNshAKEg3UYIS
	 bJXIP+z5KxUu8HMWFT74+C9wQUCelfRiuc+ExIVVRps2shWxP3/ozgj7Bkh8AFQbhqnST
	 jYO5t4YzAxD6vPn+QyGsJ+DUmpRmvQs724LC3UJXPyxP15YKm0Dzjy+dYVqIn0f5q1/d9
	 xEuXpvtuteB6ixFPj1ewFDH2F1YRvJnqoStrkoYDrG37JwJ4slAzhnLMoGr8NiwcQdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OwJI7Ku9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B365860A6F61
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OwJI7Ku9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D18C1F01301;
	Wed, 28 Oct 2026 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793203608;
	bh=JGj9MAYStEqrd+xOIds30Sh3FSi3CkH5bjwWhcgEyOs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OwJI7Ku9KJrCcGuk32xRD6anDSs/Lc8geqWGeZHHT3dtjcYeK6gB2Y4ZgKoCgJnxv
	 XpOZ+luUNYnDa9t8T11QRE1aYyMMvtWN8XhEfhme3RAUUVHkrkZ8vmv/LX9IbIjx2I
	 TSKh3NhvqjJYTqYhAWqQfZDyv3T4LZrqyZlbMrCUtV10t1/iPoM87nM2deAcCjlmGv
	 F+TzguW7dZESsN5WMQkztwcAnX2jSKcYIM/GUiO4Fwyde9ADmmNnMAUz1hcHIJlZyV
	 nn8NnIfNS6Yvpl3m/+XCmwXxoZBE3vzh8WGfMX2XkXsBWuMtYVfLfFl3afwRYAH3VW
	 ZNZuRpfjm5Iow==
Message-ID: <sashiko-outbox-188116@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] HID: pidff: bound the unit exponent rescaling loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029-b4-pidff-rescale-exponent-v1-1-3ba54accf767@cherr.cc>
References: <20261029-b4-pidff-rescale-exponent-v1-1-3ba54accf767@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 16:06:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> pidff_rescale_time() walks the device-provided unit exponent one step
> at a time, allowing extreme values to cause billions of iterations
> while ff->mutex is held. In a UHID test with an INT_MIN exponent,
> EVIOCSFF took 3.1 to 4.3 seconds to upload a finite-duration effect.
>=20
> Stop rescaling once scaled_time becomes zero, since further
> multiplication or division by 10 cannot change the result. The u32
> value becomes zero within 32 multiplications by 10, and the u16
> input within 5 divisions. This bounds the loops while preserving
> their results for all exponents, including wraparound.
>=20
> Fixes: 8713107221a8 ("HID: pidff: Rescale time values to match field unit=
s")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-b4-pidff-r=
escale-exponent-v1-1-3ba54accf767@cherr.cc?part=3D1

