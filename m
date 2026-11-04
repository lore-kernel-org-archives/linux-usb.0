Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786553;
	b=dZib4i7iSaFhIRG4M8bHktBrjlkginM8wouLQyKGg/7Gu0q6L3R1eGhXm9UCu3xdUQf3
	 d99eetkmQ1TGwcPxbSVytblPXtNTVeXapyfhzpGIeVDF43kO/E6Yq48SP41oDXfBmzkbo
	 xuI+y57bWvM/7TgURWwJU7VTtrcfPxs8cAbJexsQPAP37KoBYjUbZSe1MKKRcgqXuTHnX
	 FblkwmWtMOl2EZ5ZP2Ior/2cXXrTAZ40mUSOdqpowfPruzHvPjuAycEk68C1FAwClYrNi
	 f0XHpZdUrOAve8lyT7zOALGlpf5FsU+iVR+vtefI3cK5xRqEzR9mZB0UHpK+PkYhaIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786553;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jm0CkZQiPAjXS+IcMURvggtCYOLudCb//ODPRFbaZq0=;
	b=KMCTmw9cRsE32DfO9YNXIkxcckA/IgQFl9mYc5cmTV8wKANkQ9aGPfU8nVDuP7Lr/BI8
	 DSAxgz2cKQf5vyG8hQZxsnufFD+uEmHqzlz0DaPXnwFcyVnRATtH0X4h6hlaE4dKB3ISd
	 aXxAWWE7dp5YN9v3+PulKLmSwX2kbk6jYrdDNpo/3sy4+tRQfx7neXGlpmYzba2ZxzIma
	 UayyYyT3rSckBZaafOMRMxnHcDpSNpJU6aoQLSlrjPTbNooGVCO4Vs5Lb7NzrAaPdzlVS
	 M56gVNzMIIP6+fUMzuLL/WU56xqUQAxqfCHxDFuofCryA00eOh/F4uk8efVq/HxVttQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrqeAc+P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C7606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrqeAc+P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E218D1F000C1;
	Wed,  4 Nov 2026 10:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786553;
	bh=jm0CkZQiPAjXS+IcMURvggtCYOLudCb//ODPRFbaZq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MrqeAc+PYEhlu0QhEBqi7AKkbY0lnHL9KOkMH4fbCcczQD5e3qX5UyJDauO5owRPw
	 nXi7JBtQ5odUtpEp8Swcemvp9oKTZr/RT4X1VIQ0svyqDI3/W16d5daMvghbF4yLBn
	 OcdDAoXtJzDwEVB8uv4Fk1aC/2qNey51zE5vVcMWSRURO/L9KpCTn5m5bNswuf9Oju
	 FBVBBII4qssHHksMU4kYHFHmt2g2B6mZ/PVYB6WAGFuKUOWKlc4b87OFnI0K1IcalI
	 6899nSaCVLZjBz5ZnbFOFovi/cpVc7ImQbWDzwQtVdwMFPOvVWZpM4/3IpQeNl375A
	 98FRAdBXAs7/Q==
Message-ID: <sashiko-outbox-197022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpci: free IRQ before unregistering TCPM
 port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179378589227.74015.8259496684787732118@gmail.com>
References: <179378589227.74015.8259496684787732118@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 10:02:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> tcpci_remove() unregisters the TCPM port before the managed threaded
> IRQ has been released. The IRQ handler can still queue work on the
> TCPM port worker after unregister has destroyed that worker, causing
> a use-after-free.
>=20
> Free and synchronize the managed IRQ before calling
> tcpci_unregister_port(). This ensures no new alert callback can
> queue work after the TCPM worker has been torn down.
>=20
> A KASAN test using a simulated I2C TCPCI device reproduced the
> race while unregistering the port. The corresponding teardown
> sequence produced no report after the change.
>=20
> Fixes: ae8a2ca8a2215 ("usb: typec: Group all TCPCI/TCPM code together")
> Assisted-by: ZCode:GLM-4
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179378589227.74015.=
8259496684787732118@gmail.com?part=3D1

