Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D94479895
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798739; cv=none; b=GanQ/SuIfyf8mBlcVtFQVlPekRHB1QmmQVDTRkCZFy5g5Lmpf6gQrJ+jrZmPgmCpqNk9s24JkBJXQkTM0JPz2LFHKT1+ean52OFbLJ1Kw+u9kZfl7JK9xcRdBCPak9hBQT9P5ivSkTg6xz3ZMn4zDRi4agarb8fUOZefHZg/Gdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798739; c=relaxed/simple;
	bh=wAYDzzOr3TGwoX6Deb9sqoCUq9rBomeY/J4lGQbSTBE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=L+pIuQ5x+lhDZZ7Rvwp5mlIni9kwc/TAeccroY1bz70FlDM9qcwjXcTTCy2SQY5kRfNjFfgJiYyvcfzQqIaS9RJc6L5CkFmapXFHQywhcQzJAUAEKuFj1me5OPPO/KT2v6zIcmC9b5SO1t3eupb+Uy48Vg47EVxrbLTTNoYHa94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPrRCQpj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPrRCQpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E361F0089B;
	Mon, 12 Oct 2026 09:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798732;
	bh=wAYDzzOr3TGwoX6Deb9sqoCUq9rBomeY/J4lGQbSTBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EPrRCQpjLTwm01Kjdy8D2m3kSKa0W6BJhO0QXMWekIk+2XmAYfJdEbNwpn78txYzv
	 DkA93rP6fjgFDS2sKE5H+/yLl8aWZBqtn0LPQlwLiApsD9vnss7cZX77+xvI6e25LX
	 ZWRy+ppCBdjUmzGMugNH4JOTEdJbPhI5A/2In7Jg8XSghSjI6Yso3S48gle1HA1uWm
	 cLdMddti0FDgpMPmvI9iMZfDtrgSv79YNWHFGpeF7pqkzHBx4gdZG839YFItydkFgc
	 2NS2ic1ozIS71Cm006IGTs4GUcX0Sr5VfjTxNQSgEu7tIqu74N0dolbmsSNopSjjH5
	 6gAnaqjNpT4Yw==
Message-ID: <sashiko-outbox-167909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] USB: cdc-acm: add control line state quirk for
 Telit QCX216 modems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniele Palmas" <dnlplm@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012092730.332531-1-dnlplm@gmail.com>
References: <20261012092730.332531-1-dnlplm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 09:52:11 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add control line state quirk for the diagnostic port of the compositions
> exposed by Telit QCX216-based modems, since the control line state
> requests prevent the modem from sending the diagnostic data.
>=20
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012092730.3325=
31-1-dnlplm@gmail.com?part=3D1

