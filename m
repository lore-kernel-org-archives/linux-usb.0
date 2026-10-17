Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763583806D2
	for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 06:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792219498; cv=none; b=KLEWNj0giUsE/1Io5meQGd8+Y9ebVJl6gemoYQEwFiYwfYI9StMbgfisLGfPzaP7MYvGuTv7x/iMqvzbZiZI3iQBhTWx5DM3tEmIzvq6szxFSjIUzz8faqGaZcDNxzcJAB5uqQJooahFkDkavQUOWTXD1d+QRImAeVrky0OBPSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792219498; c=relaxed/simple;
	bh=sSjUcFt4mQtQbnreYRfe7Dtcf0F2LUdSzH8LtlAfapc=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=G2PP2mJ2D3j59kN+M+kGGNL0n+dPCfc7M1A0wDxZCpQ2BrdWvLL5y0GiwtStFWaVAvKzCRrUU7RpU4UYibnhRmrYojaEt67aGLeiA8jmlH1zr6VvedvUZ1NeDL8mdBeP27aWxjgPUjjp8FKTubHY0K+VLxOmJQKWtvGFl2MGozA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYqWvtZD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYqWvtZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7CB1F000C4;
	Sat, 17 Oct 2026 06:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792219497;
	bh=sSjUcFt4mQtQbnreYRfe7Dtcf0F2LUdSzH8LtlAfapc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=gYqWvtZDFp2jBmP3tgSHaJc8JnEw1Dq+mT8XAH0SmtpJxYDVScpXoRFHpyOhzCI9x
	 EIkE0bPG5wXODM4YmvjJv65Yo/2Ss1MhKdWwsN2CKQ0fOHePTqXFz8PiKuM6NgQdKq
	 nrtYZy+3a050ba25x9eOjYFlgNEKvJVedijhZk8UKNf5v7ENkmQgELGN9B20yzJU1g
	 H7kQT3MImpSDzpglGDGPqVRQfPHnF7+O1Gt27VFmfv1pRO/ZFEKzpuZf6qn12ghREW
	 ZJKLJV5BUEEJHLuEM1ATrV/nxuSFPlMsWURw1y9/8wOzv3EYVjsSZWyK+D2pJSJPki
	 OvXCqy3q/i2Ug==
Message-ID: <sashiko-outbox-175338@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Check ACPI companion before use
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261017064321.3816776-1-yaojiale02@163.com>
References: <20261017064321.3816776-1-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 06:44:56 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Platform drivers can be forced to bind to devices outside their match
> tables through driver_override. ucsi_acpi_probe() assumes that every bound
> device has an ACPI companion and accesses adev->dep_unmet without checkin=
g.
>=20
> Return -ENODEV when the companion is absent to avoid a NULL pointer
> dereference.
>=20
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017064321.3816=
776-1-yaojiale02@163.com?part=3D1

