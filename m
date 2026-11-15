Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794746773;
	b=uKkzyQ24yTXKiejO+1EJ0gvaPV1KTpH+kh/CcfkymjamFUeu7dY++/E8qWhIxvgV+ofH
	 4JjTkAQ9mDgoLPp31mXNQvFkprqcpOBrnpyJsjpWKqgL1WDggzzJH1jl0zEwcODKZHZVC
	 HvKXDg1eI1GE1rqzEJaf1qQlzryyniKvJjsz6qNEVDN27QabluswnhxuDPw9PC0i1Cqjb
	 BwDXnl3i9ceMAIVJAqKwkJyScKK5pzYh4R0pHXoGxIJmUOabyRdLi8eeJP0kB4n2lSDlC
	 7kYpEit5XnbeiYdWgogquvPyHIHFB7L3efYgb5q4sk/l6d2nuZsN1BT1kYRkcU8BQVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746773;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hq3/PCbmhiEa+IrnmDXF3gtDvNNnY1xY7kl/rZMoWHc=;
	b=a0mRIGb/cDHpQeQo4+7C4FTWlQXjQMdYNtcgoiaRYiU21e5PvzvH36aYTiCkN5bYYs2A
	 Py6gyavU2w53lngVSRBiWcHsMGBWRrmRHyrtgsTsnf5XJZ3jwT/0mFodp/lzJ4/JsxFV8
	 y6e7tOPVR9TILkbL93fc6Av2hnDcLRVuREZJdkywfAfNha4yJRHIaC3JTmsTw+MsqMcBE
	 dyp7GU9u/rEQDhZDuEa0k5QLFmNF/x6kl5OykRJ6FenRN9a+0aHNyB12zSGibMNSSpe06
	 c5RlOIr/h01GYYjvHcW29xAbLkIS5K/EQB70Lzj+IPTkSb5NGh38Xq68xN4yRHnj/AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M20zlhBv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B14B606A327
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M20zlhBv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA481F000C4;
	Sun, 15 Nov 2026 12:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794746773;
	bh=hq3/PCbmhiEa+IrnmDXF3gtDvNNnY1xY7kl/rZMoWHc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M20zlhBvzIhKpyAw2TlRj6KlBV/0+n943Tv4xqneHSwNs8xVxZA9qZsqjgzVdqLTb
	 vXoFFCqFq9McajWGayt1w3dz74zPt9e2U2AQXpE0oIrb4JHYi42jr44PN3PhfVezD3
	 PQ2DbfXCFugh3nDOVtXS4KbK0Uz7BT//OUmuH/Tvcl09LUSGFSrMBKFhAKeiKBhUGB
	 Vvcda5DtbWhSSKbRWrBaPOTWN8h4BRTUk0XIOLIKebsFnl6P/V8Q8awsb0RkAwd0Eo
	 dbkpZt/d2e9K+pkVgT3WqnnSDN7TgOgU3tDPjqwYIOFfWo/EnqbLA1FSZGkXbymKBG
	 00gSIqAuiVy1g==
Message-ID: <sashiko-outbox-215505@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: uas: expose US_FL_NO_ATA_1X in sysfs as
 deny_ata_passthrough
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWF0ZXVzeiBKb8WEY3p5aw==?= <mat.jonczyk@o2.pl>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261115124046.5286-1-mat.jonczyk@o2.pl>
References: <20261115124046.5286-1-mat.jonczyk@o2.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 12:46:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The uas driver blocks access to ATA passthrough commands for some
> devices it considers buggy (via the US_FL_NO_ATA_1X flag in
> unusual_uas.h and uas_detect.h). However, it does not expose any
> meaningful information whether the command was blocked by the driver or
> is genuinly not supported by the hardware. This creates a problem for
> the smartmontools program and makes it difficult for it to provide a
> useful error message (with instructions to disable UAS on the drive to
> get SMART readings).
>=20
> So, expose the information in sysfs as deny_ata_passthrough. Other
> quirks may be added in the future if there is any demand.
>=20
> Link: https://www.smartmontools.org/wiki/SAT-with-UAS-Linux
> Signed-off-by: Mateusz Jo=C5=84czyk <mat.jonczyk@o2.pl>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115124046.5286=
-1-mat.jonczyk@o2.pl?part=3D1

