Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B102222AC
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342341; cv=none; b=kVodRbDKeNtCAIR30fPnwZ4v/KAGiKUEqh7+6oKAitM2CtzbMYdekDOi1LRoBX8JLMM6VAMnnuRjBHL758LR4WAWeUiVKaDyd9yuOoEq4CGiCW1uZERynaVa7Si6kJX2fYl+p7Bp4zrOf2dVRaC+SS8de1lIslDp+FIWvWHQ/tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342341; c=relaxed/simple;
	bh=g9hzZMxl3rNvc4KGQ8WiftJuL+rwuBxDS5JqYISnAsw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=j0GF5OnBGIzyOPaVTGW4v3c3qxB1y2ccqT9j5/qhJXbjlUv3/peBEC3pwuectKYd9uGH7x65rTSSbhqcoc9VtgQ9Mn1w8S4fMEU/h+5nYLPeGKwRIyCixqJix3OnUNa3HSYIiqazgpoY/G7hyMdrsYGFszLOcfxrFttIGg75/hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGq5SV/t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGq5SV/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408AF1F0089B;
	Wed,  7 Oct 2026 03:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342340;
	bh=g9hzZMxl3rNvc4KGQ8WiftJuL+rwuBxDS5JqYISnAsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bGq5SV/t631t6MifPwZ3Jj4kprnHmpdc1xJ18DVoNu02wYegzc54ko46zI/GOhaX4
	 bjx5haSNtz8cBKx08QRsvdiwvUVYQLab4DFWsXWuCAJ6M1o2Pq9caZnSLglMk5jDmG
	 EdfOhReyYX4pQy9jzF8lK7zb74W7RDJ0C3xCe4J8Y8tykuV38AaS5MlIaNpxabBsWC
	 3LjUMcv+9VcOaqSUBuZsu031wb4Iw+TacjBMsZIxMBPNqUBJRx0130CUBe4z6Eu1Gg
	 njpkeAGCx5m6NW+MiKK38H57SxJtX4bd1JlLPpnSY0AoKmMNkCUMceGxNmZ+2X+jr9
	 AcICQRJTl8Sgw==
Message-ID: <sashiko-outbox-162601@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 05/13] ax88179_178a: Add EEE configuration
 support for AX88179A MACs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-5-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-5-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:39 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The AX88179A uses a simple HW configuration for EEE
> via a single EEE configuration register without LPI timer support
> Add support for setting this EEE enable/disable register in implementatio=
ns
> of mac_enable_tx_lpi/mac_disable_tx_lpi.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D5

