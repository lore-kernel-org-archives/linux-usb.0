Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181375;
	b=cqjBN8FdrRiUx2Mxx2dE+UztgBPfQKDjga2lZF9jO3BUwtfBd2GhLcDNX/GU1JuSWAgv
	 CuqoPxMNvkDXgTbuUQ7roQFgZS7MsviHnLcwvipDagW7UcLGoVumDpm8T9zNpef5l+ZuJ
	 8cBdJ0pShxVJDCxMcCyL96e4zkIZrimgq6WI6Vxg1UGqy1VBQpmDYJ1fnvj2Pke4feKYC
	 Bt2OQKPQ39tgpsVtTsWthVVlHicNgAzVmXncpG7Acw3wsz1hwZ/PJvHp3jhYK6an7CWjW
	 r1gSaukYpsqGoHBx6yxEqYc6F4j+7uf3AB6m31AhAytYwNhXt6LMpwnDtsN5dR+G5Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181375;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n4cvUU8XOyScSJvmQQb2ocnljIkLzvN3nG3FezsKnng=;
	b=JVr23veG+8qfdwoCbVk6N11NrfSuv/jbA16qyBIVQoeQThIwM5ECF4NKvC/PBMTp8uJx
	 6Po4A74SIcREEDRaHK83kO4EMJ5rutxk1737UmIx6xPBG5/BmY89Be2V2NLHNbmbi+RHP
	 REGwqlIN37e9HFG4HYENehNwDgDC0LnSjYOCPNwXAuA2pNbEfxpy0j6CvTpHK10aP+g4Z
	 QTBOZGU2Kl7wovG9D7XTmBONZSvAq14cTXxgS78AEzsUOWD64c6dIbHHSknNR1/bEqPsj
	 3BagD5XOyz1X420GvyoOkCpcgQZo6Hx+04ArTSw/l3OOVar5z1ROlbgvZNkHIKaotrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LjMsROYL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D5606A31C
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 09:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LjMsROYL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E8E1F01825;
	Wed, 28 Oct 2026 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793181374;
	bh=n4cvUU8XOyScSJvmQQb2ocnljIkLzvN3nG3FezsKnng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LjMsROYLIuqT/XZS5TOcKhIFBB342zkGAp2o58y6M1JR0XLlAmFG0tu6zJzEauY+/
	 H9LUpxZVABPU/PP6e8AJl/ly7ruu+WRrZ1Wdprn8SZTKFopa5eLF7u8D/ibq0i4O81
	 RFa5HLrAn1mFmXJJV7ERz0GDjTrsHWw6CpQ/uOruOjznzrHD/8GaXAK5qtxZR8HPVk
	 L5ACFic/rzHRiNo3v0zrf4TvRCGBL1R0ZFIdaXN4hHQJmNGyjp0jvsTw82h7TNKeN3
	 rgiyovUVY7+dAM7iMj0ms3wP6b8AfgWkCJAmj8Pz4Q/JDjEysRvX+Tdz4TF8yVifJV
	 KB24430Fzn/zg==
Message-ID: <sashiko-outbox-187706@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci: Relax high-speed bulk max packet size rules
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Pecio" <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261028104329.3d1c8029.michal.pecio@gmail.com>
References: <20261028104329.3d1c8029.michal.pecio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 09:56:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Nicolai reported multiple dodgy high-speed devices still being made
> which declare out-of-spec bulk wMaxPacketSize and actually require
> the host to use it for correct operation. Apparently, Windows copies
> this field to the EP Context verbatim and other Linux HCDs like EHCI
> and DWC2 do similar things for compatibility's sake.
>=20
> We are also aware of devices like astronomical cameras which use 1KB
> to reduce protocol overhead, and audio devices with MIDI endpoints
> that specify unusual MPS like 8 or 4 (the latter was full-speed) and
> work with larger sizes just fine because they never do multi-packet
> transfers where MPS really matters.
>=20
> I found that sensible (power of two, 8 - 512) MPS are usable on many
> xHCI controllers from vendors like AMD, ASMedia, Fresco, NEC/Renesas,
> and VIA. Nicolai also tested two Raspberry Pi SBCs and a modern Intel
> [ ... ]
> Closes: https://lore.kernel.org/linux-usb/20261020-fix-usbtmc-short-packe=
ts-v1-0-903f4d029193@tipi-net.de/
> Link: https://lore.kernel.org/linux-usb/93d5aeb4-f1c7-9342-7bc5-4b277b4ec=
55e@veikia.lt/
> Link: https://lore.kernel.org/alsa-devel/CAE-xCyPhrS6pgY0T9SG0TCubSi0CE2Y=
d5H=3DttOzBmvgrR8fTPA@mail.gmail.com/
> Link: https://lore.kernel.org/linux-usb/348c50de-f922-8295-ef87-cf5cdea5c=
7f4@gmail.com/
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028104329.3d1c=
8029.michal.pecio@gmail.com?part=3D1

