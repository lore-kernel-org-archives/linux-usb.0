Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732349;
	b=O0ThR+bHWICQRw4gs+dQOtIh4I99bciTr1AyAz5cWYWFzXqKEFByvoWKoIGk4GL4KRib
	 eI61Rahh0k+PuBRzSX6ntqEAPpr0u1/4pUhYmH2L/9ELZr7GA1FYELASr9f3qp83RPChP
	 gVOF0O8V5JcKwYS1BuPwQ5jdkNesoJPE/eG8Mk02x/Fts2drgcnAbIIyL/kP39RDLfkyC
	 /jpJpAyXnSrYguswKIo6OHdQ/AkXl0UrbGNdnq3JXv0lr06N/cGZnvbnNncgAv8m7snUr
	 y19SRlCpeuyITovVSqn8a9xi05iUS/vBlY4QZu2dmTLodKNPJlwId3CnAUdampEskJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732349;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mC5yg49bOwSKohRGRRWiTcsLc91V/sg9tZtAWAkVUDU=;
	b=gmqYuzBUNGboVV5exUrMIG2PKzPCw9xor3+JMKKTYyIUByjd4IyWaV6g17UYi9u0+jYi
	 C7Xd4faa5H44Ts0MFoHDMVKnQlh531iXOYugS2/35Py3gx4Q5Snzb8vqSqwmuMW8fD1S+
	 YKPtjdFa9ehkRVOvTS4RTIwocUHV4VlevCL+TokhdSMEZDD5xeyMjJXaXhV6VCCeeJ0Mi
	 jZZrLxdOGf+IkEBjgonPWPHl0XsDUm2TNT4Ao9xgX0bf9uQ0MpyNdSTkyXDyVkbThxdZp
	 7q9RwUbVmSc1rGsxwliv5JBrawl06lusMVD6i//ypFFjiDTklHPMsX3agz/KYuPWTJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFrhO+6E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C7A606D80E
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFrhO+6E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CE21F00A26;
	Tue,  3 Nov 2026 18:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793732348;
	bh=mC5yg49bOwSKohRGRRWiTcsLc91V/sg9tZtAWAkVUDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oFrhO+6E9BfvwbJPZ2DapzKAknX1tYiyV3RzCzlx4ZNHyS26Txg+UMv+D1G5WrHbU
	 lipIPKYZtVOhuQtqxJ/BZ3FFndd5fBldEHhzsQXeG4QW3jFpK0g/ZkPkKKJrONrG07
	 /GGU78g6zDJ75Yu4YOn8OI3eAjwwDd1gmgJOzHqHi+6jBb7v8X67UPh5HPRCfBL5cD
	 jXQD6n4G8b9qJzvMji5Lq0ib5WsP/EfTCzvVyqMO7n+wDT6vJNtTfjByYxVqJ7YqCh
	 JENga2ex6hij0f8fZQ4wiAC/gbLO+jrK2zDX1t5BueWRFvsJcqqpl1b8eU8U+4Bj1s
	 S5QJefVMHz2fw==
Message-ID: <sashiko-outbox-195870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: microchip,usb251xb: add
 battery-charging-enable property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jhon Wilker Rodrigues Aquino" <jhonwilker0112@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103185514.72144-2-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103185514.72144-2-jhonwilker0112@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 18:59:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
>=20
> Describe the battery-charging-enable property as a list of downstream por=
ts in the USB251x device tree binding.
>=20
> Add an example that enables charging on ports 1 and 2.
>=20
> Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103185514.7214=
4-1-jhonwilker0112@gmail.com?part=3D1

