Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629481;
	b=Hae220EaYP2gBI4HNqAcburNVZxqWv2GyiWSHB2wQ0LyR4f+XAECzQO5cib7037XSq3D
	 luE99KnQALFRaAxB6eEQAzVUUCk5J77uZ1cMY9lS9XN1ROca1jaYX8EgqftlsFtTlbBSl
	 NNn9zFMoROtEPd1z1SlxBTfjHDCLMJI30FRVNqG80LXWhEPLOW6nzi0Cyaxs5KrKvLSVu
	 sJJ9cNBZNrFAAJS+9updm4MX57o0Eo/oB/F1fwCF5dnf8cGDIFJpqXQaLYftGyLGfml2Y
	 bbqE2jMxrx3x65vPYTGZfmpT+UyrX6MQi1mmVriX17PCKzL+l9BPylTqlEl63mKYJew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629481;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aoVKCrIkBEzq0vttChmtj5SOC905h3EfIiLLOsxJ1RM=;
	b=vg+VkoP4vAzabkumWqczIZ78rt6Tui2b9uspScG6wh3BHZi6dLWFlFu30aaNI5TKelPA
	 9b5fZP/LfAZO1F7AML8XooQLPNCHCxb3YJSsGrVHjuf6buFiBvjZSWaAIUVicjLg2qwSI
	 2fgtgxn339GTCvbxN39u9W+jlpFo5F3p6dBRmMrohIO3kzGyIRdiZHE9tneAaGRCNOukP
	 k0L6tFVzD5HZn48Ki8XbdqpqDj9vXNcq9qZ45Lyrck9b1uJDoQfhj7byQ4/Alm/M98jXl
	 THc2cg4nq0pVZ0OHr8r/pkkWwNQVkGgAbumXQwz+RhfJEsb2Mq3J0Qz6aBUvznNFwcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iuPeXkod;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378B76070C93
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iuPeXkod
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77141F00A18;
	Mon,  2 Nov 2026 14:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629480;
	bh=aoVKCrIkBEzq0vttChmtj5SOC905h3EfIiLLOsxJ1RM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iuPeXkod+jQJGFGYzqKQLMRqnfUpyuG/abMMbbtYgK9lqnuwcthtESgfulO1QrNaI
	 25UCMa6Gi7IZQNKz0E5TyV5SgqY+lzhGVpLFL+lrWnHqISHcnwQwFVwSPoiJMHJveB
	 tASLp074CrBFZSplevCgv2j+FEeh3nDY+ErIElX/TwOHIJ9IP4hRBj3sh406yVP0B3
	 zhTIc6Q5eiQV+XhUX51k7jN4ogKkmMaQhnyM+XKtzSp0OEkMdp0rNXgQZMOX0we19l
	 YYc+ki4hZlNfP6q3xiJnNA3JSc9hTE6QtL9wLWLL78ud5aUjATOAh/hP/UtY3Y3USK
	 DbfB8HlzI04Pw==
Message-ID: <sashiko-outbox-193568@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] HID: pidff: fix undefined shift for infinite
 duration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102-b4-pidff-duration-shift-v2-1-83c5f8c67484@cherr.cc>
References: <20261102-b4-pidff-duration-shift-v2-1-83c5f8c67484@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 14:24:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> pidff_set_duration() computes the infinite duration as
> (1U << report_size) - 1, but report_size comes from the device's
> report descriptor and can be 32 or greater. This causes an undefined
> shift. A UHID test on x86-64 triggers UBSAN and programs a 32-bit
> duration field as zero instead of 0xffffffff.
>=20
> For report sizes of 32 or more, store -1 in the s32 field value to
> set all 32 bits without shifting. Keep the existing calculation for
> smaller fields.
>=20
> Fixes: 1a575044d516 ("HID: pidff: Compute INFINITE value instead of using=
 hardcoded 0xffff")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-b4-pidff-d=
uration-shift-v2-1-83c5f8c67484@cherr.cc?part=3D1

