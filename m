Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F72EACEF
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694499; cv=none; b=EWf7iTVoLcvBnzEIPj4cObIvgt+pJaQvbaXR+BUD5/9H4Rhx4AiD3QeH30uVRX9UCL/G/A7VxQ+oiukK1RetANrWUgm4yKgKikfDUtiUf8OYfscp9a1tM5aZV7HkeSrKHG5K3n9/f52dyd1HPDHji+85X23mF96N8wv0aTWIgDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694499; c=relaxed/simple;
	bh=2z+hFShb80rbnYh0xmgPG2bI2n/qXZ3tCnvzLhXCodA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Zw4gBkCuJI6u+WAZmyYXw9bSPbZqrUBJpB4rgUUc2pD1fU7Sp17YRqt2Q0eOurcHAW0uvC7wgimeLHN2L88THHm3n2DofRJQmBnzsZCjNjE+d2o6gXo5o46v0379KuaGuJTsVo/y4OeMk8M1HKtULmt5yRgUxxV8mdHTQUglpqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3z8LvY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3z8LvY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77651F0089C;
	Sun, 11 Oct 2026 04:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694498;
	bh=2z+hFShb80rbnYh0xmgPG2bI2n/qXZ3tCnvzLhXCodA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N3z8LvY/Y6YIW5qZhMJbqUq0/i6oUGhIZDbEN02pCvNi9v3GyYhiuUi5GHIqLLSXc
	 CTVe5mNoX4JruyIIuv5LfmKV3OMxhCqML1mj7vd2xvxOIgD3fJgi0r4zhK/B6XjCY2
	 EDniowPL+aYeqi6TuFaASTttXIdSCyy3bVjF6yEt5I7dh+hlBJFpsEW1Cv8QOYrcAy
	 +ylT/SjbGpmkysTRhu8Wjfx/J5Be+VlzmwPOeGCmbnHTw3/VkQUHmW4QSTO5jMGmVI
	 1Nn7+ka4Jz972hJWkcnofw/IkdpUMUfK9XVlsXLMd0ZdP+etGlgIfkLQ0qI2ZXOmCc
	 X1eErJMJuqW9g==
Message-ID: <sashiko-outbox-167015@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 11/13] ax88179_178a: Update driver name and
 information
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-11-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-11-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:57 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add additionally supported devices to Kconfig description, add
> further requirements such as PHYLINK.
>=20
> Update driver name in usb_driver and update MODULE_DESCRIPTION
> to include the additionally supported chips.
>=20
> Change Kconfig symbol name from USB_NET_AX88179_178A to USB_NET_AX88179
> and update loongson32_defconfig/loongson64_defconfig to use that
> symbol.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D11

