Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063493;
	b=cWkZssbk381avK6pDrZzW6n4sbgpmJnXfKehIje8B2ciA/rEpr9RmkGdjD7XK/zv56ya
	 oW8BvHMJ6OIaNXSZc5LVNgFFgroH0XWNyMFjSGZlwlSurEtNhKvraCn0LgL2yHrOSAhWy
	 XADeJWtN1lg9oWwImaNyeIJSKgnLi4BPMz+pbHYegHCLT1sTs8inAWc+QQ2JOg5Th43k6
	 2rYIXsG4t5a0epAKTbCGz+bbS7+0B89w3/sOunElkNNgorNyNR7zCnICYvqHJnaEfYzfF
	 Gachb/76LAXP7bEnZeZ5/8/1yR2QgOHLTsbIreZmw6s5bOlSQwI7BwBBQr21FYIJwYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063493;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=15hVBdtT4gTMnhdzPDvS8kzayPKhgSw5QlK/GicvMM4=;
	b=YKWmPv9ccCqWcr0e4U9eoBLRHFTRUV3/Px4i55SI3XNMduMwQ7RdPWyLu7cv/fOJ8GjT
	 yMuVdsoUBW/wWO93N/Mu+afWqLxgMhh8N329aw98unwAs4U0eVvmD/o3rmFlaCx/jbs9n
	 g93hr77zM+gtulPyaBdxGH0y/TYHYXUSpt9YCZpIQbH5AAh2d3fl3VXo+6G7tr66zY9os
	 qgBmIJizU2WGG762TA8zhQwVwuZ8GmDW6Xw5xktq8o7TsT7d0Hj8yaMdchuIPD7K3rIzP
	 lze8cXWsfqnMDdvu4YD1sjKH2W0v+ugdMIjMc6/A34iMrbo2736mn38Cxoh7ISbe+hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llgsabgo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD7606A9CF
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llgsabgo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058271F008A4;
	Sat,  7 Nov 2026 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063493;
	bh=15hVBdtT4gTMnhdzPDvS8kzayPKhgSw5QlK/GicvMM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=llgsabgohBsiggSOdaCxYVn9aHRinN9mQrCrmf4Oppbav9CMx7fBnXS7vhrYBi5sm
	 8q8nzogoW625wnldXkf0FREfwOy2SrEamICv0+Gcdw5Ec8PwFCN3xm6IGQz8uY1hKn
	 Wl/2dqXoHyRQy8922YvIVQyiu7bCyBK7jOk9AtH2ysS+0TwrojRjLdhU3z4uGyq+rk
	 0CM6SQp11k3MLHsLhwldK0wa+2XgS8qCnbcpEVMsbean4FGBm8Ma6iHjVuB2wTH8AN
	 b483UueNaDf+AfBYPs1+a1iNqyedjhyk+yeHWNm97NtojxLtMCetURSy1J4GnASqEe
	 CJxJ23T/Mjg3Q==
Message-ID: <sashiko-outbox-202974@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] usb: mtu3: add mt6595 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-6595-mtu3-v3-3-f36bc569cb47@protonmail.com>
References: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
 <20261107-6595-mtu3-v3-3-f36bc569cb47@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 14:58:12 +0000
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
> Add a platform data for the MediaTek mt6595 SoC MTU3 IP block with a
> quirk for single FIFO slot.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-6595-mtu3-=
v3-0-f36bc569cb47@protonmail.com?part=3D3

