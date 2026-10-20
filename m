Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507573;
	b=QBGWbwpVNQIpgCbcDdyKGeCmzsFyecj1HIKA3kq7esAeSVGO6ZQTllqD8bEVBWPUoITB
	 SiY4zKab4y1mneSYN7MxQURwNX6YMDi6VtuZks3tts9Goq2Eg6jniy4OIb6cERjQMWOSL
	 TcYvjJYUmmOBfzbwTVT1TwzprNN6/h4yLzy5o1WqkVFE4J9oOMOuK3Kj/Bsz0OGeT8dm/
	 u9iI+wW1w8t1tmqXEVuBVGCb+gQK5bZcHkRs7UiP3uCkQ7eQHFwFwSe6bhBgqjgzVlfgr
	 mc9p80uH/QwWQuY4NpKHjjrV/rAfooeQsKwHvTkPGxB7U3DARe+PjohjdtqUMI2cVTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507573;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IZc4bRz9VTB7ApmIMj58peBOyygkIpnwODKzrJqgzKU=;
	b=Hb9AuYHdk2K+J0AL3MIqQ6SFoJy3nkdbshFeNOBWXfGHd1xIHdYMDq/6AoCClKfs4d2M
	 GllTRb99tCZ+XelDdexOdvODe/+a8mSmArkxC696HPbekXjcbHhou2Vsv5us61f57xMNJ
	 aF22rQqDEKb0S49rWBG3t8APJwOJK8rPMeL/GF4sW36cGj+jAwadFhiIeh7hSlBC7P/r5
	 ySivcklWy0v9Lg9mt0zONLtubXsUTrCRs2JoqhC7wL1VF/saP3H8DFB+hDBvL24t9JF8B
	 zzefd7Nh93r7c3ibPJxpf5yrY0YUOo4GgxLQDbedhFCxmSlh+ogcDIaaoUso2ht/cSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hp9dnzcp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00576606A324
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hp9dnzcp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB441F000C4;
	Tue, 20 Oct 2026 14:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792507572;
	bh=IZc4bRz9VTB7ApmIMj58peBOyygkIpnwODKzrJqgzKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hp9dnzcpYA2WY7JCYPgFT5b/xyaMu8eHqjzT/Ez9difOqecFcFpyX+oUjR0oppHOH
	 /6YoFpNEUa1bU/1j+DiT/ncgssOdPOvbGaWuHvoImiE2oRvIat4KSfG6pYbvoGyNmm
	 qVHSxa9wXd+bHFiCcpakhGbRtCdH5qZJI4n8k3swXIYo6u6QSDMPx/NUCLexI+7RR7
	 rdKWK1luAdZELjiRwBqzLeOJBrwI3vsbJCvfsw5BGRjH7AD9epo2x8YILi1ViKBx0U
	 iOwcKqhAHFTql6Pa3iCgvXlyCELoUwCWf0D7F8i3alNti4DbKoW9zXx1ygnJtMJG2h
	 +Zak8jcZ0Aklw==
Message-ID: <sashiko-outbox-179189@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] usb: usbtmc: handle undersized high-speed bulk IN
 packets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020-fix-usbtmc-short-packets-v1-1-903f4d029193@tipi-net.de>
References: <20261020-fix-usbtmc-short-packets-v1-0-903f4d029193@tipi-net.de>
 <20261020-fix-usbtmc-short-packets-v1-1-903f4d029193@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 14:46:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Siglent SDM4065A-SC advertises 64-byte bulk endpoints at high
> speed. USB 2.0 requires 512 bytes there, and xHCI uses 512. The device
> still sends 64-byte packets, so each packet ends the transfer and
> usbtmc_read() returns only the first one. The rest is read as the next
> reply:
>=20
>   usbtmc 1-1.3:1.0: Device sent too small first packet: 8 < 12
>   usbtmc 1-1.3:1.0: Device sent reply with wrong bTag: 4 !=3D 6
>=20
> Read one packet per URB in usbtmc_read() on this device. Also check for
> a full first transfer before stripping the alignment bytes, otherwise a
> reply whose padding fills that transfer leaves its trailing ZLP behind.
> The existing 4096-byte path had the same problem.
>=20
> Fixes: d7604ff0dc01 ("usb: usbtmc: Optimize usbtmc_read")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-fix-usbtmc=
-short-packets-v1-0-903f4d029193@tipi-net.de?part=3D1

