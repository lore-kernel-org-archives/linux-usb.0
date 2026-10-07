Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D932B121
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342345; cv=none; b=IBwpKevZSK3G1UyEtV0teHsPYkK+ThvUyL47VOtHq9NTooWQRS0I6gLfMWm+4LR/A3+gU2a076FcGh5UJmv8GMjykDgLwXMTvxaUB85rOop23JbD0iwHTsXqZfR3g2WkB4aOpeCnFaQiTy9KXSCgqQcG4GyQc/ln8KUmf1sQMUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342345; c=relaxed/simple;
	bh=tv0ZW5r5TIYMvnoftQfliQ/og5lmHEnEcG47L+K/8Zs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=k5H+KI4fV6NjIndugOFe8LAuVN7d3ADRt9OzNSXhhnyf1a1bz/5WIyoTZLWHAimVM9vFCIDZHdo9+wYA27QznGfhYELyKfwt4XXNOZ+aqvb0/XrYR3uwonNaLFO2XOdtyKARdsNYHkqKg2DKJ845hhbE4b/MUAIUBENSvwJRf74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEhkmeYM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEhkmeYM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913951F0089C;
	Wed,  7 Oct 2026 03:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342344;
	bh=tv0ZW5r5TIYMvnoftQfliQ/og5lmHEnEcG47L+K/8Zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WEhkmeYMR1fPJ9cSZu5SMV2H39x09C0e6Cut5iRDhaWU1rM0aH45uKcv+8Iu+Nsvn
	 A4pKJpT0HuxaL4KPk9T9ePeM+XJIp/W1hAu3I6xpIZilXoOl9iiIQr8zI7BMR7uIHk
	 G1fBqMRuC4IaopB0qQWHO/0xL3dcuggkCgYVs+EGsrGfR9Py9hvjOM/VmgFXzZ3ATi
	 prHpMK4D+Y2jnt4HN5Kuc3drCif7mt3dvMXhdZqAZMYsYVSVXoF4c8V/omUuoPTlDD
	 9zInx47MT4CZRCyM0r/bGOPQGHFRtPTTE6fKhKc+eBcUIKRygfYq0kJG7aHyxDHNR7
	 0y9UxqV1Hj5XQ==
Message-ID: <sashiko-outbox-162608@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 08/13] ax88179_178a: Add AX179A/AX279
 multicast configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-8-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-8-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:44 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add support for conditionally setting the ip_alignement flag
> AX_RX_CTL_IPE in AX_RX_CTL and make sure that AX_RX_CTL_DROPCRCERR
> is also set to be consistent with the initial configuration in
> ax88179_reset()
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D8

