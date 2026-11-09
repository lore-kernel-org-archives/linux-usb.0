Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204057;
	b=0teETTKaHA1jPNBKRT62fdWk5X+OQsoG8AondlNt8lc9xe2op+/4t2k4OgmkewQOy44H
	 /8FZEYlFngs1Yo78yG89MKiYqTlY9DGuteSHvY7sR1rw2sJFjFgJ+G9Ofaf6Tec4brcr7
	 buoeP9QQCgczIN8nFCqpKTuvdmgngPhdHkkh1sqsIyeMZjui9azB8fHra0Sl9QGxLWWyI
	 y6xbBwhFYt2GoAg1dNF9UGZHTNdv2RFdhGAih491eZRbskbzp7eeB8EmBzjdddfszrDby
	 exnYUyUfkF72K2wRG/1JqUAgovGdyTdPBUjIBDLSFhF9qHHo8a+OvPhaAi4ErlfATqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204057;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aKIJoYhedO0/GYbpDLtTPfI7GYy/kc5ssa/5OztTpZo=;
	b=cFbUgNWIP5x55BFJLcX4RJujv2tObRCXg6wzEAIUwHLp6qPE9NMw61+mPt7taWBhNpHA
	 o+ZfdaKw3w3bpCAOCbGMGpT7/u85HvfYXvu60ikfE0bpCUU/eWd8qZBPH/UkOyw3TJoqW
	 qo+ZXpGDqXPnu1OTcH2wigUoKZ8LCzoGOs7qz9fFEPjAToPYi/xBtbAw9sAQ2PUIxeEKR
	 qLqXo5CD74RXY3k+MzWPaT3VCktFicVcN/O4MmPRxTffSM0smjUzyA6TKCFoaHOB7hSpL
	 zt7fv1B2OtUmeGqURKfQPe5B38jhO9fUEJ/JE9WTlSWL2gRmCFBvxIQWGiFJtvSSC9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSqVSZ8Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC2606A321
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 06:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSqVSZ8Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B061B1F008A1;
	Mon,  9 Nov 2026 06:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794204056;
	bh=aKIJoYhedO0/GYbpDLtTPfI7GYy/kc5ssa/5OztTpZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XSqVSZ8Q2J3vy0dWP2MwnGnI5aKj7nYHW3bsp/t82qo25WGseZRnDGiEzCUjACS0u
	 xZ1LOMCFB/DFrgXtH1Pv80VcxszeKo+JGEvF5fCg8NQDtp8X9XBzuOvLJFSyb6PHDu
	 ms64+3sb9LuaLb0Qm0Grs8Uqy/qKfRaLUVH/nG/vkSrNy2HjojUuNo6Yqczm39S6ac
	 +7ycHxGI6rscG5qewcfR0zZqpWTrzxb/FQSYjkbyO14vLP1QFhKiR674HuTYZ2FGVr
	 ijpnnomkhAIYD6ZzgKUVKOsvu04AKrQqF8TiufQNIZ2CQW57ETvfGpR7HQrSsNF10H
	 mGMh+CZ0iUgAg==
Message-ID: <sashiko-outbox-204477@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] usb: gadget: gadgetfs: avoid writing through the
 const setup pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261109-b4-gadgetfs-ep0-v5-3-f16d0b648bc2@gmail.com>
References: <20261109-b4-gadgetfs-ep0-v5-0-f16d0b648bc2@gmail.com>
 <20261109-b4-gadgetfs-ep0-v5-3-f16d0b648bc2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 06:00:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jing Lin <kayano050408@gmail.com>
>=20
> gadgetfs_setup() receives the setup packet as const, but clamps an
> oversized control IN request by casting away the constness and writing
> the truncated length back into the caller's wLength field.
>=20
> The setup() callback has no business modifying the setup packet.  Use a
> local copy of the request for the clamped length instead.  Userspace
> still observes the truncated wLength in the GADGETFS_SETUP event, and
> the queued request length is unchanged.
>=20
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-b4-gadgetf=
s-ep0-v5-0-f16d0b648bc2@gmail.com?part=3D3

