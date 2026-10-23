Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758531;
	b=2SbBjO/JhSERr1VkHtWrwGqhEiQyJET8+9Ne5lNmJwUsxN6jx23rtflUXdyQTawN2iAG
	 tWRhF1T2XTSCT5OkSosAwOn1dNGypq57UCkj6C9c1kiUV29a55S/2jfZMUiQsO/ILGgQJ
	 IIGBfLzwkeUNhoATlFHc4MeIA1yO8H99UH3/z6yndO12P4YrLG2Pvx9Ud4fUS8iLuM9rE
	 pg2I8iW/pU3kXU1yqgBl5R8q0pxU+jzBYhYdND5ymMVNKLzWA/SR8pwYS0GLrbeW8dFag
	 KmFKz1Q6PrP/EbpTvlZP+3FdcdZEO+6VJ1Vr529CNXhb/hEvut/s5UAdYT0Myo6uWkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758531;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uwX3AQSX9O6PHjG45Cl3rSQX1fa11xm3oFDBiDTyJa0=;
	b=QBijT0veywRKGS9GZ8eiVh0JPllXn0orHmKrBAPOkV6jWYiiJN30V+we/FcuSCQGGxZ3
	 QYLOkHi6bDI3En9kv9YJkewXzPBgFUCcOmHmSG5MggHsKPSvr2OkjjZc/jHVyFOT6xMjr
	 1L0F6n5X5CaUxUmjRamSHm0x10VpVjdzPI7rIgwCjqjmM1LPWhDIfQh7PO/S+waDWwNBd
	 C48vE8SJu3b6mbfADtUwgX85iqMEIe7x7GI4lFBr3dlZB6wbQswFMvo8ntRnly1eapFTY
	 yigjORthMI64EZ8ewHiuuLaK54sBdrI9VrviMRL7uJcp7RU8hJSIouMfWqZvrsksgBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG5W3NBS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737A606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG5W3NBS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FE21F01825;
	Fri, 23 Oct 2026 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758531;
	bh=uwX3AQSX9O6PHjG45Cl3rSQX1fa11xm3oFDBiDTyJa0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JG5W3NBSd5cjQElPpI4jX14/MPERmL94fqwYcz/jvTv/uPop0SAvJJV5d/WpQSI4t
	 fqSLtgJnN26LANhE3Jlf7rsRStBRaR260TCbL7zSsAlMN2o8wFxyu0055+yeZNsh36
	 Y0OV9NWtLZzZ8kM1pDhHMyV3sKqU3w5jP5rEb5o0YbUrZODLp9i9nH6b9q2syou1qS
	 Fkqhg8wha5j//cel6qwI9q1SeUlbGZ+0MXBV5u2sOq0gCujJGM1bmc1WesWlXhSP62
	 qB8KYQM4njVwm2E6ZTcuHEEsp0jD+sshbMf3RiEXfvCeqF9hZ+Fxv4vGa6xxH60At7
	 ZsbXgTrTmC5ng==
Message-ID: <sashiko-outbox-182768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/12] USB: serial: io_edgeport: fix potential
 use-after-free on disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-7-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-7-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:28:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The driver submits command URBs asynchronously but fails to stop them on
> disconnect, something which could lead to a use-after-free when
> accessing driver data in the completion handler after a port has been
> unbound.
>=20
> Add an URB anchor to track and kill outstanding command URBs on
> disconnect.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D6

