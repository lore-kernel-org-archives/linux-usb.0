Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792844672;
	b=tmNqHqXrYB93zUIf4MffXz/1zTjlsut+I3UbycsCX5aQe+dsbBHB5KxCgahcFsryCZO7
	 iSlPmrR2APuCiplC+UuUqwAs7Wl8NpaFQv6YPeXpBwHApAa9qGfT8TPB77Q5HB7FV+JQU
	 J4hLqvhFxroxUkTT0crPXoaEB2To3bRna92FEYm704KbEuoQ3zC1Ds1OS9ZjYgY3Z7jfm
	 QXT7S5VJCe+Z+fAwe3mdhUZt3597Ox6OKwnWEyu7+cFBSJKBEDNDX4WokRh203/GxXwgr
	 yhLXCu4ANATstswi04eBINjCeRkvcSdefJ6CflNAV/XWMA19EYt6CmlMV8/f7dZpRGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792844672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x0E0N4PEHQIL6W+L4s3/Xp+JnHMeJXV3tHaOOzvfO3o=;
	b=sod4/9ukVkpaOypY7/ZKgokeknSuo/oeu/sB3Ie4nulcpJ60Iy3t6NOZfan2JMPt/DDr
	 dzXMKhnOQF5Wh/K3BC7J4kTTyou0FGx4m+VnkcmsDhSejE2IQI0J8RzBjQgNHTWrHxeXg
	 ST+5HzbIZg0VedVtU+uDr8qePY8MZhFHFsPUzOIngiCRO8nqpEVuHPatcqenDmZJ4hRVi
	 N5zVLNg3+KEneAPso6jIFK3kTFx20FkcljM5LZsjVR1XTU0UWxK7+KqS2+dtfX+Qrt6Lr
	 Bnac3BP5doajhHiaX810XM9Qd33hxcLLRHpVmdsVF0PBJpS05EUVxWw+404Gr3m6fsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGlbDZZC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4AB606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGlbDZZC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373191F01825;
	Sat, 24 Oct 2026 12:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792844671;
	bh=x0E0N4PEHQIL6W+L4s3/Xp+JnHMeJXV3tHaOOzvfO3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OGlbDZZCvUFVxo8NDa9YGKOlRMCunQ5eawqR1zU/gU0Yce53L5pX5smuuSiypHjY1
	 o3J1uEX8LlUzDvRLGwJMzS8didPX1Zh9j/9PlIqAmm4Bx1eTl3WG3FxWOi9p/YxylD
	 aK3fgqCIfsckyXG29oK+PCVn57PPY+hhw0gZy0OI8oej5Ei4RmHNfFQ+8IyNbL9R5C
	 vvkvRfYINB0teVIw/uh/cIAXXivFRkckJR5trfYzJutqKKEDenjPrdTaywhhcmhTAN
	 GfhjsmRApWYWlbTnhKCWis1gY+HYHW/nbINfAhvWmFZ8qE7wd920ux1V7xyg0qno2W
	 K/5P5yLYJlv6Q==
Message-ID: <sashiko-outbox-183710@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: usb: cdc_ncm: add Apple Silicon MacBook Air
 (05ac:1903) device ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Divyanshu Jha" <divyanshuj2006@gmail.com>
Cc: =?utf-8?b?b3BlbiBsaXN0OlVTQiBDREMgRVRIRVJORVQgRFJJVkVS?= <linux-usb@vger.kernel.org>
In-Reply-To: <20261024122051.14427-1-divyanshuj2006@gmail.com>
References: <20261024122051.14427-1-divyanshuj2006@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 12:24:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Apple Silicon MacBook Air exposes a CDC-NCM interface (05ac:1903)
> when connected host-to-host over USB-C.
>=20
> The device tested is an Apple MacBook Air (13-inch, M1, 2020), Model A2337
> (MacBookAir10,1) with an Apple M1 chip. Unlike
> commit a5148bc2fa27 ("net: usb: cdc_ncm: add Apple Mac USB-C direct netwo=
rking quirk")
> which hypothesized all Apple Silicon Macs share PID 0x1905 ("Mac"), this
> M1 MacBook Air exposes PID 0x1903 with iProduct string "MacBook Air".
>=20
> Like other Apple CDC-NCM peripherals (0x1902 and 0x1905), Apple's
> firmware omits the CDC status interrupt endpoint. This causes the
> standard cdc_ncm probe to fail with a missing endpoint error:
>=20
>   cdc_ncm 1-7:1.0: bind() failure
>   cdc_ncm: probe of 1-7:1.0 failed with error -22
> [ ... ]
>         bInterfaceClass        10 CDC Data
>         bNumEndpoints           2
>=20
> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
> Signed-off-by: Divyanshu Jha <divyanshuj2006@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024122051.1442=
7-1-divyanshuj2006@gmail.com?part=3D1

