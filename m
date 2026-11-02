Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633246;
	b=dtWc6cTg30Ox7mD5P/m5fv+BSg8iAXgZ6PuRhsA4cGCBwd8fG+OSClmGdY/ibngcl2sg
	 /92VXM8W3o/InKOsS+buMcAMOPTcRZ1DlcMMEsM3LbWKSlhm+YnEOiZ+p3G3WnVpmY8xO
	 GcH9mfF6PCaS3H2wllTxwE4p5BORmU5eAquoATQ3x/av8jLDzs/KPa2y3+uyck9SZxH9u
	 jByiJB5B3GHPZ2jIRD2rsZ3uFQhAneZM6DUEySfBolNo3Z5IxlFK4hFDYeXkeHcUEm+S7
	 aNVgysVPImALk9pBc0x24Ab7t56w1/57s5HUSCVB1g9WuVu08QoJqvr2n8V1uLm/C6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633246;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jPHHSTw/CXnzY+9GL/7Lh8JJOKWcfi3nalkLKJTzH3I=;
	b=pshr07vENoh6Srzss/8oRFURQgkG3AYdyRgB9kCFBOJLUjX/6xCD6nl58w/afw24724z
	 U3gRb3mHwPFrGV0HiSyeceMRPMeeJiWuEBhCbT6FN/2fVhjNuznLqSY4hkCVtcXpazM9U
	 4NY8IagMqVvm78DNFFeJBYK/lZryFVv84LgUjEMvSQspPkA965EaWWWgV58SL8FGsTi8n
	 lPZN8lFAtW9a/zzf0jqf1DM5s6nUtttH3Xh3ytnL71GPwuqKF9YUaJzQ+F3/m6WR14Gfz
	 8LFarbc3jcNvJtL349WlJ7+qQcgDBBeHKso8UDOBedZh8y8jaYmHNtoNNAruGvBFU0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f6l/1lXw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4109F6084400
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6l/1lXw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8D71F00A1A;
	Mon,  2 Nov 2026 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633245;
	bh=jPHHSTw/CXnzY+9GL/7Lh8JJOKWcfi3nalkLKJTzH3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f6l/1lXwuDmB5/FSC6AGvjx1sB+KIpPq1t407xxVglSXWbTSx5VIJQbe4sylDkW0+
	 CH3GV8pOBNG3m0WvlAi6uj3/Fli5AGcDoEAPckPI3JbACQYt4gZn+Eyf8kxOT4U7th
	 dHGDibeDb6xYQSPLu9tB9xhSq5Zw8OgbWt40Kd8TecfhLvy0iAiYt60BoUQiHgX2is
	 jVL9vf3soZn+UFLueYgTDylDW4EO0/xfYKb4M6gDNZuahfBb0m4eM9ro9WjRlqTA7/
	 ocsLBTOebX5Hb8HAS3sfLoVX8d3heAaQVI5Cqc8klQ2vPI0Iffo+c/rt3x7HRae2FY
	 kWFy3hGQQWh8A==
Message-ID: <sashiko-outbox-193660@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] HID: pidff: bound the unit exponent rescaling loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102-b4-pidff-rescale-exponent-v2-1-a75bcca65fd0@cherr.cc>
References: <20261102-b4-pidff-rescale-exponent-v2-1-a75bcca65fd0@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 15:27:25 +0000
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
> Also warn during initialization if the duration field's unit exponent
> is outside the range -8 to 0. This helps identify unusual device
> descriptors without logging on every effect upload or changing the
> rescaling result.
>=20
> Fixes: 8713107221a8 ("HID: pidff: Rescale time values to match field unit=
s")
> Reviewed-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-b4-pidff-r=
escale-exponent-v2-1-a75bcca65fd0@cherr.cc?part=3D1

