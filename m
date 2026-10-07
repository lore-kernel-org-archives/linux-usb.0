Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FA82222AC
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342343; cv=none; b=f7jGoIxJRPSD5Y5y2Nhb4eBu/ZCQfU6RD6dRmY1o/xsNsceO7V8VddceeirQVPEzg4LF9fxyyDC0LxrNX8sxRn4Jr5YKqinI5vTsjyR+i4O85+ZvqD0gvuvMT9PPGGZM58UyRqtxvBAHKS2eAW6TTTL6J8znyisBL/qLYqfjLaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342343; c=relaxed/simple;
	bh=IVCnZaUs380EFS+esreOEVxMDQndDCRZBHBxhuz/yLc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=stScaj0W0r76n1kyLX6+nWQvcvu8lBEye0j0cBxhmoNviU+y8CfYUhb9wwvDKE7Numbx2P5Jl/Lc2XLkf6u1Xj6EEivI5t9KYbG+2Mng05Ezy6Yo7Ui3o5XzA69yHKxUEqCTBxellwjBvNhJ5z7GPb02L9WKcSVZcB/tkJSj474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9Svd1Y5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9Svd1Y5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE951F0089B;
	Wed,  7 Oct 2026 03:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342342;
	bh=IVCnZaUs380EFS+esreOEVxMDQndDCRZBHBxhuz/yLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B9Svd1Y5gg2RLrbXmCeSjN97iRrmSsB2LBnLILpG26JWrdVGH0EwdxAy7n5yRo5DL
	 +10iswZ+3kykoMeJ+Sw16ALmodOc5A3iHY6kdePGyLnidwjzC3Hvg1sB3RFNY26j/0
	 y3BvWzbRNwb4VpDjAPIXG+nJwl/bkXYxI61Jzc0ItHe4HryCM7xL/Sdy1LhAPdUF0e
	 hzk7Ag6kL64q5e93KShqSSgADqTRdlBjsdiRwnR1Tlvg7ydM0muG+9UQgGfEyJOlmK
	 z5IC/tg6mwy/QLkCfgADB/Fa87vAreYpN68m7NmTVHzLYQTwxOJJThHRkIxLETR565
	 T+47DruEL9gNQ==
Message-ID: <sashiko-outbox-162604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 06/13] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-6-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-6-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Configure phylink to work with the PHYs in the AX88179A controllers
> and provide ethtool get/set eee operations calling into phylink.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D6

