Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C66A2222AC
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342348; cv=none; b=atSgkFmjGicstPUbbISuuuzGNhkHP3I53F2PFLiJMYfRfoM1hiAbKVlam/b73HwL5f3IiujOLsy6r9jzICC4jSe2jCixLFuRC9Dc+mb8Eb99a2ZyMIHpQplNmF0A/Z5dlrqCskmYkuTKYrGldZAirNo/GEJAQydfVFSyBhsq1dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342348; c=relaxed/simple;
	bh=CQNAHbrbzG0t6m1WZADrhFAUEbkhOseoqOloNB/d7Vw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=H1yNHrQGPNsX0tBcKQOtFd9051RPMhxBL+NMNNo5jrt+9QIRNbJVmRg7qRLEmttz5UaR10IXdKUVxGocCP+wrvYHbYNPq861Oj1prIMWDXzJ3haOMcibyaEWPzxvj/bvjoaGjW/J5BDB5AhQeGFEzzGMP8+n9cTOU461t0zchiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUoqj084; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUoqj084"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 279B81F0089D;
	Wed,  7 Oct 2026 03:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342347;
	bh=CQNAHbrbzG0t6m1WZADrhFAUEbkhOseoqOloNB/d7Vw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dUoqj084j38Hb9XxRp4Rh25tzh9oNiw8+yyh/JT3rKtmJJHx8R2pwZFyg0nWqQQZB
	 PylUvvGECw0BayxeAlKbdwml3de3ozwN1M1cygbfwjFXdkHihZ5kT38qaDOU/dxl4i
	 OiQrOro+NLujvYia4T+gxktkBsI3jdLsNcaL21ZIB0Q0Ay7c4ouDxO99acMVawdTe2
	 VQ2MmNGhJS66uTr3WnsI8Hr5J2jG3rDt30k9Orfg0qCokyQBYICZgE9kAkfPAg336v
	 ZuCAf9m2u6zXuJ+GF2r5/YeZHieE7pxc+ejsZ6uZWCwOFgKdH6l11qd/DnSJpm4Ald
	 bka9WD13stS3g==
Message-ID: <sashiko-outbox-162612@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 12/13] ax88179_178a: Add support for
 AX88179A/772D/279 EEPROM access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-12-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-12-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:46 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The AX88179A/772D devices have 32 efuses with 20 bytes each,
> which can be randomly programmed. The AX88279 has 16K FLASH.
>=20
> Provide ethtool read capability for these devices. However,
> no write access is provided.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D12

