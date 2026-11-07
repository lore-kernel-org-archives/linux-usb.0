Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063787;
	b=nMM3+dwZp6udopiqcPjIUR+Ocbd0qNLIJ0gt1q5MrI44RjAw24CyyczUU9m3l7m1Dgpn
	 kROnnsHQIRCvVRlWu8c9OfrJZ2GuGgWHkMfyNWdzU83XouGZGNvBAXMAv4xDgghY8h6fP
	 YwxLVA/Ssjy9WNBIi4rm6Y2cAI3EEGkKk+tID0U9dx6eMfNfXdL4ecexdbpve650bCu1w
	 kyWgzkk+QkXaCzUrXpJwB0S7XrLGkTjv0RtPXmoC5rBlAGomNNhgyh5fJq4EeI4RIzbjC
	 AQMtIKwYjcpLe/mqkSeypQuuEuO2PD9BMWIElCEyzZFVXCnxQMREGsdM04SzhFSZmHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063787;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6brL0RnLTxTcmecCpPQVb32L0uVyvC8HfBUJE7+fh/g=;
	b=QLkCgvotzzAXcQ1Tm+QMqo9Tp8xvkbwaJ46XvBHJihSK7mR28PdxMzANb15sZEARG3xE
	 Mau3P7TWGmlwgyaUPrBlZglNXNx/8DVuB+s02EGW30xiaKknFrHmc9q6LR1hlE/UsGjhB
	 KCLKqjXPqLW7JSgPikfATO9y3iWJX0rZQoqA2j+pGFgO4lri7BCxX9sQWNY8t/tfSBxUM
	 DGtPUDI3K96pNn1UhN7sf+MNMpPOAwLAd0p6/DujOT8lbG8aHI5m4Xw+EKixVe20cFnQv
	 RGbhBHNQueXBeds/048T4TG/K9JR1ue9LyPsEFbpEuZus/igeAVwEQLm+HbZIxmN9Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xm5S8Tjh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E7F60A380C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xm5S8Tjh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C192F1F008A1;
	Sat,  7 Nov 2026 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063786;
	bh=6brL0RnLTxTcmecCpPQVb32L0uVyvC8HfBUJE7+fh/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xm5S8TjhVxguMUJwLyU7Do0ZQ5XBccjkmDXkbdh/Al2IJzg5hM0er2GuB1gMQNtib
	 DsFEjERcUI/rwYy3FvcQ4xQpO2hvThj8LXuinHov1x1v/ZFaciVQ+QjgWr6RB5uff+
	 Z1pZgufyKAuc56386koT5yHwpsvkkvtyftwv8odEHbxFZ6tEgO59yxcdbDRI2aHIwS
	 OQ07ymyLmbIerJhL6rZBJ3Xt/E343f5x4K2S7/ATkXWmfOXkBp1Eyum7CbVKJrGriJ
	 JZBheKSv4/LnZWxaK12yeYCHfnyIbglU0vjZe2Nh4rTUXtDc6SpHkAdBUkmR8BwmDC
	 BvgBfBVXf+96A==
Message-ID: <sashiko-outbox-202980@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] usb: mtu3: add SoC platform data for FIFO quirk
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-6595-mtu3-v3-2-f36bc569cb47@protonmail.com>
References: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
 <20261107-6595-mtu3-v3-2-f36bc569cb47@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 15:03:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Roman Vivchar <rva333@protonmail.com>
>=20
> Some SoCs, such as mt6595, require specific quirks for the MTU3 to
> function properly.
>=20
> The mt6595 IP block doesn't support multiple slots for the FIFO,
> resulting FIFO wrap.
>=20
> Fix this by adding platform data with a field to handle FIFO limitation.
> No functional changes for existing SoCs.
>=20
> Assisted-by: LLM (debugging)
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-6595-mtu3-=
v3-0-f36bc569cb47@protonmail.com?part=3D2

