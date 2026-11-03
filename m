Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669901;
	b=HKgOhKMErUh8OruwF6zxpcDxZV4IrsPqRhGetzzXVHeouCfD9jDFPDHhRutYoMbdwFCd
	 YbWZ9bQcC2Md2qQPu/ODxsl1ZIG2igmwFjtsaSn0/r2mUDgmmx48D/gZ9MK4hiA822t5s
	 QLRrgdGakpm7m71RX6bepmBjlKIQma2T8Lio7POJaj10ZWyElj2mw7lQM9XJ7b5tGS2c1
	 RNTECeOtTpRQVABzIG+7EM8GYdTxCElIwX7aB1z9OnjanvJe43QCzimH/R0oUDKG0GzNg
	 c3kdn3FHweHURIxnVTPHBVZm0xn2RNtLpZ26MTgAsRHLGQi65ZO7ncgMiTcHXpLwlWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669901;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6k5fSAVLzceloA5kbtTAoM31lBefRBBrt6UfZXIWtYE=;
	b=u8ZrTlt5V3BP3253jblNn+97QNNjdvRxMX8Q2jwbbt3ozF+3Cnp6b94XIwJOqjyld7hw
	 YbaFlInoV0rXjXhxvns8P8DVaNLjjKiGXIw5nFUz55LtoxHxYB4Q8kz/Ewk0fpXE465kV
	 9/pYcMBSWlvPGiKhsK2jKbLE3RHM2b+ix6/6F1P4Qfk9ga7vCK9J3kfWulii2Ay4LjuSx
	 8tdm0dLrGKdJQHC7bTYdtf1Bu3BuC4hdNWcs9psG2zyYbZKLGH6Jh0KMsdGOLbZQbBwrS
	 gyG6UZHIjgivH+WpPcEL2BCEU4TsZSVbjgDH7oA1JODCQ3Nkf2/Zpy9X2pVUFuG7KOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KoSLEYoK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823A8606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 01:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KoSLEYoK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C291F000C1;
	Tue,  3 Nov 2026 01:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793669901;
	bh=6k5fSAVLzceloA5kbtTAoM31lBefRBBrt6UfZXIWtYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KoSLEYoKFSmF0T3wIGHlDsLbBTMXJyicWfpuJbJoWXp10XFXDkd5tVoz61asNFkGY
	 mfICH+1w+4m+WoSNfY8KA/ZSEkZrZWXD67mJ6HpQjnoa8TeOE8OYTApHslvWHEQwOb
	 30xHhspWO2kaPiBGh2rLBSiCKbgaGEu2VxXkzFejLFy4EwOxKLFqhJ2d9htlzWrMMV
	 xwzvRUC4oSJr6qvHRLVxp5Lo193JzgGJKId38Z986kD8N7m4CV6pwSzVkEbFlSnqFh
	 xTRfbCpyijlVlnJrKJDEKGO5IpwJIL+rUbUmSx1+X/ezLbbe2ASxNpuWANGclmz4XU
	 lxrky1TCy6Qlw==
Message-ID: <sashiko-outbox-194434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] xhci: Handle missing USB2 resume events on Etron hosts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuangyi Chiang" <ki.chiang65@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103013126.3603-1-ki.chiang65@gmail.com>
References: <20261103013126.3603-1-ki.chiang65@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 01:38:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On Etron xHCs, a USB2 remote wakeup may also move other suspended
> USB2 ports into the resume state without generating individual Port
> Status Change Events.
>=20
> The issue can be reproduced as follows:
>=20
> 1. Connect a USB2 hub to each downstream port of the Etron xHC.
> 2. Wait for all hubs, including the root hub, to autosuspend.
> 3. Connect a USB device, such as a mouse, to each USB2 hub in turn.
> 4. The last connected mouse does not work.
>=20
> The affected USB2 ports may remain in the resume state, preventing
> newly connected devices from enumerating. Reconnecting an affected
> hub or mouse does not help. Reloading the xHCI driver restores
> normal operation.
> [ ... ]
> [ 4825.027484] usb usb3-port3: resume, status 0
>=20
> Tested on Etron EJ168 (1b6f:7023) and EJ188 (1b6f:7052).
>=20
> Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103013126.3603=
-1-ki.chiang65@gmail.com?part=3D1

