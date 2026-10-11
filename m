Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F33B8D78
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694496; cv=none; b=Kw/QRjszVvgqBwmL1tn6+W7ogK3Z86OEygXD0kVqD1QhEhuv2IfMotGNR8TRaAmt3YXXUZmpuL0BJKitOG3opmthxg2T+w0HBXfbcdEWWIQbGV1e1y2KPO4WlHfbLa2ZH42DIBm5cE45WRcp8dgLCm5nyr6RVQNrgmPT7BkqajI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694496; c=relaxed/simple;
	bh=UenMTEx8oJ0w3rsiKUsEN+zWrJwY4s72aAeJvzI9/iU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gt8+N762ciTdMxPcOzo+2Skj4BfmU2Fcys3ZZeD4+SaIT+I1EuCzVoqv8MizHfMRbhJNE1waohvGY9TM/c90TOHu735jNNcUOvIZcTNp1VagOTQWMxgceUMSzO51F8uAdoU6RJuvxApA5j4t0Xm4wXKoC7MxGl2EyJFhquOl7e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogxEpXAU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogxEpXAU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E8A1F0089B;
	Sun, 11 Oct 2026 04:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694495;
	bh=UenMTEx8oJ0w3rsiKUsEN+zWrJwY4s72aAeJvzI9/iU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ogxEpXAUS+lcjFuWxCiWcnajkHkC5ysEe79VUBvjWgXS5MdUzDWIFn2mLoMOi22on
	 5kiqvYKZYFUNEfGQtG57rfKxSfkMcktVJgE9dl6l5mgHlXaHMJvdoNjgIuGoBNtTjc
	 zj5R+TAZZZwEjJYYahN+PHbWq4AEN8RyucYOKk9iUFc3ch1fuPtbvzvhYOPgzwJkWu
	 pHN0usvqv+0trsCVrnCQXpxS+fR+4pOBHkMOiUZ/61kuH4GI8EUJW5ocq8D3dRTjN9
	 B3tzZrxlX8L8CyAlyfH5TMT9zcaSKaQdrxEZK/T5gz80aPGx2LDLx8QHY01kMc3D3Z
	 eDzzu7E/L59Bg==
Message-ID: <sashiko-outbox-167011@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 06/13] ax88179_178a: Add EEE configuration
 support for AX88179A PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-6-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-6-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:54 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D6

