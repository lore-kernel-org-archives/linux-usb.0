Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFFE495AD5
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 23:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791501139; cv=none; b=MDkSXH+XzH94U5YtOMBFdSknGza0owh6L9tyi/51DWqMM4tyaAX7g4YSb9+mzdUN6egtm38trYOyGCrOdFluJYyvvvXTD1omZfKWeQ3xUHr8dii8CdmjES4TtvR8w6uoO3PP5fzQl+qVEraKgZnIFRAdDmKXiXmli2lq2lGFcRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791501139; c=relaxed/simple;
	bh=/sbyYQqp9pQV3UII96m/ZPtisTDcIJM1O0TURbGm9Eo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Giz2yFE4Df+JfL3n3ATDg8ukxy4RCT7HFN8W0aQGoDmwOlLADMqum7vm/+xjvDSuBMAGjov8aakXA4fsqUxYBDgWDHGSfL4tw4VCHfJyTB2YcRTRZlBQ9evIXi06d7d/8U2qHsVh2WalQ4x8oq5mBDYvfFwSEO9X/WpPMdaccb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NB85nsr/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NB85nsr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 582A41F000FF;
	Thu,  8 Oct 2026 23:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791501130;
	bh=PAYIUIgYi1hY0PToNUGqTs2k6vJ5tw/EYl0ruANOBMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NB85nsr/LOTn6oFy64Ny3RTFZtnO9ZKrn0ASfpAmLQzj8DGRN+eYBW2eBib8QTTfr
	 9MeLUKk2pW9YUMfTLOVbKhhHNzeoCXo1ah9eJX2eqgIlsMoJ6c7FGHkiiUxTwDvIEU
	 Um5hD0agAUHn73SUdnTYQHWhqVvtrVCRS25cOqau4o/Wsk6meNyaL3OqSRAj5899Hs
	 ZyJBn4N5I4ObgkbSgsgRjYHlt7nlb0twlYImyKc3y5gJlcJj0oqp8dTJVFt6A10Va1
	 Bn93knwKWAJOfIqRrHn4c70LYaPInbtLZIp+sz/ckbkD85oZCsxZye9fzmBawR3GI4
	 oSUdZIYn9jW0A==
Message-ID: <sashiko-outbox-164655@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add mic resolution quirk for Logitech
 Webcam C200
Reply-To: sashiko-reviews@lists.linux.dev
To: "Olivier Kaloudoff" <olivier.kaloudoff@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008230844.11246-1-olivier.kaloudoff@gmail.com>
References: <20261008230844.11246-1-olivier.kaloudoff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 23:12:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The C200 (046d:0802) reports a mic capture volume range of
> 1536..7680 with a resolution of 1 (6144 steps), triggering
> "Warning! Unlikely big volume step count (=3D6144), linear volume or
> wrong cval->res?" at probe and exposing a uselessly fine-grained
> mixer control.  This is the same firmware behavior as the other
> UVC-era Logitech webcams already carrying QUIRK_FLAG_MIC_RES_384
> (C500, C600, C210, C270, C310, C510, C525, ...), so apply the same
> quirk: CTL_MSG_DELAY_1M (which the Logitech VENDOR_FLG would provide
> if the device-specific entry did not short-circuit the lookup) plus
> MIC_RES_384.
>=20
> Verified on real hardware: with the quirk the warning disappears and
> the driver logs "set resolution quirk: cval->res =3D 384".
>=20
> Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008230844.1124=
6-1-olivier.kaloudoff@gmail.com?part=3D1

