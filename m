Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843148;
	b=uEvTri5p4CIz4jah6KXEk7eqBgLyw0A07NVT5tqjH7maeOQUatdAcqVS1UO3LYIE3/tR
	 K2lQkQE1Ue+FZxe6/0zVw95HijAePN0EIosyKWpkPBiqMMf8CGIomeCYhugjjk3amdFg8
	 NtVDeYrWti/d9Ow7D746GtFX/CUDXLh5wVkFZzf7UFYwUfIK6sqHwRPRA7Pt99lGIU2rJ
	 JYFw6V0v4SWSPM8LcCswu4BXeuVP2vsXkPgIuzjRmd2X9iC4fJnB1Po/mbz/96hXkTnLk
	 G7SO4zv+chRsnjwTuw0NqH16v7v6wAPYxPw0MVOkX9GTOheGp4WHCLZ05vUXSzAbztg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843148;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9/Cq0oogk0myruRfhCjCaXGsFOHmBGdPwcgRXzlTn78=;
	b=cvDF7TaF9s4CVjgjkmmeW7X342pvR5e0FjJtJE7pUZb4iikvX3RjZ9OvlSQDi/nDDzji
	 AT8z79Ty94l7vvP3I8AqDaJumfD3cnx0Q5VVf2eb/9HRkbZgg666KoB0rMF3Yg3oa0Wft
	 zyCyVedHa7ZPkoOoM1ddZou/Zu1YGxbp6iPXDV3KTAt5yJq0N6vV/QxknKXyFSMmNlSvy
	 /nPL6IE4wmF8oQIsqkIb5Y2TrLazMQ7p98+qV7lPtsVCbsmtOF8YOcdVBujyxqgYzqq7X
	 09JdLia3SMPxnHcwWl4lcVsfB7wnK/YMuKVoGUzuK/ApZ2hfQpCzfq8xGUMQvzA4/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWYCLkDF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A064606A882
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VWYCLkDF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045C91F000CA;
	Mon, 16 Nov 2026 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843148;
	bh=9/Cq0oogk0myruRfhCjCaXGsFOHmBGdPwcgRXzlTn78=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VWYCLkDFG4uJXoC7q0dysQKbpmNsqvFKcIKGf/OYEQlgd6qvrzuJSmz8j6c6Uvn82
	 AH7wus2cda9rkZSRzybwGJarwQEcstSU2g29mEm1ZSRbg08eUjf1Z31xNeNxTt6g0a
	 TG9EOZnjVtmMBDByDflW7erE28CutE7F7g5dQfDFujTtjbRAY5zjYiaDgrHIm4bXD5
	 5ydzDQDSmU2f0yG5gAPx5LEDWnQL4kWJqeWzNRDZQeUGX3G8ZfnvUPgpTq+OrDOCVW
	 LzxjzbNgKqxVQ6dYgyVYEBV9PIPz0DADLahVPEnZvLyfo9Tz4AjDkGMoiQsGbiwGwX
	 hAiyXKN3UX6wg==
Message-ID: <sashiko-outbox-217287@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/12] dt-bindings: usb: tegra-xudc: Add Tegra264
 XUDC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-4-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-4-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:32:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a compatible string for the Tegra264 XUDC device. The Tegra264 XUDC
> is similar to that found on the Tegra234 device supporting 4 PHYs,
> however, the register offsets for the Tegra264 device are different to
> previous Tegra devices.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D4

