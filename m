Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EA9399377
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517914; cv=none; b=Zv48YfJFhz3KRoNjiWV6Nvnn3TeHWqNTnLKHoQZpo3tDApcfsINsJLHDnjYU2V06sP3Nv1Sww0noNXDIMocEuyKROIQIQ2twhVsL3Y/ovIMSOUVjZDUfgsNvFCaxcC7HIS5MERQzrpbLuLtEfa4gSFXctj1C6rDAf6Tc1dJTdMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517914; c=relaxed/simple;
	bh=KyEQObHdrXnnUb9etN1ri3VDzIxMa6kv/Bqbd+s3duI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=g0cND9Pc7e28pV25P3FaDDKn0wIZVm1rgrBy0xKZwXXPf0g8rzIYYylAHDlxRPQ9r6MucWMqF5PBLXMsvwPGa/hKqmNKZS1cpH4RXHyc3ZZwdyRTboSKDtn2hkohEBFec95j8YXaozEZNWHObhG2d9Usq0RfXMwATxulZIdkPYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiCIdZ+U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiCIdZ+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BA11F0089E;
	Fri,  9 Oct 2026 03:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517906;
	bh=KyEQObHdrXnnUb9etN1ri3VDzIxMa6kv/Bqbd+s3duI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SiCIdZ+UKw3DKWWJ2m7zjYWJB6e+QCguW0CVgVskCFENHfZBb5K1nnvXGmKtc3b4k
	 Y5Gs6+aNrsA0CbelyAE1uooG45rD3z8FIx0qnw6ujqGdXeNzpSRMt1gkY4O4j06DYB
	 loCV+aHxGWzb3jlxQYEyxHp/EJEEt0jN0HR3jxNmS8sVdSKe0Tn3FwALoBGXxTt4Z7
	 spsQfP1Az2quUz0VZgxjaTTylSo3lpnp+d5iUE3sjCTlkm+OIJfRCTEHw5xaS7/id9
	 RdIdkElIULPVPxX9jg8N1M2VBzidW20VjeCm5t7fGhLtcKLVtC3x5/2UjVoRnF93Os
	 RaQVqKCawWtwQ==
Message-ID: <sashiko-outbox-164801@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 11/13] ax88179_178a: Update driver name and
 information
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-11-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-11-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:46 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D11

