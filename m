Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806225;
	b=ElkTMwbI2bhIZXskPar3YH7nR4gTzl/gvGgaufglNP4ch07f3681FyzGirhD6XH1hy99
	 A1gneKFfJkeHfVvI9M4cDc8yzy5sXa7y27JH/q/fq5k7fMJy9JdhZhscjZQHWBVNZ3XfM
	 DaD5c6JAFT883ug2vUPf9eJxT1H2yvDwxyGpK8QDW87PoaBdRorzdV9tNQqZLxSUHDolk
	 wiSiYuiYSX4JhoW2iiz5dwc2ZVRuqPJynR+TxYgnUEIFmmUBoaT+CeNh+fzKaheNZztBK
	 tteNXCumXdRDfazfr4FiRo369OD2Fp368Ivtxg0iV7U9vx3pqwBLIYRMsPZvtRZuZqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806225;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a2KUVLaDqOlaegWIjXJOctfSF10TjF4y6IduUW8MXWY=;
	b=IAc94FB/7mwHMX4Yx2JDZxVqRNQbR6EB+bdLulnwFwRSCLDkNtRhttUuQmt1pkYmP8Or
	 cLsroukEW96cP4rv12/gz+xbIh3uRMxM2iHLiNbj85y4CnY4KAgpMw9Z62lAwgGIq8/n2
	 Uj1VxnIISWpEV++PmXCmjHXTcPEtA0CaWG8Gv7ob5hO2CF+yNCgFII6ylzfHY+/hqsjU+
	 TXmYIQndDZm33HdTfWYiA8Sf+bcOtn8XsDsAtyhMc3jmzlKn3Mu41N4q2XGnPcfme+QJM
	 HlfHmGK6+QUrSOuIv9u59CejcE241B7Kj6Rh8ZcmbUpdBNKO0L2D8pdZdFo28bVpgdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ygwgh4SR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3E8606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 05:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ygwgh4SR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81F31F000C4;
	Mon, 16 Nov 2026 05:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794806225;
	bh=a2KUVLaDqOlaegWIjXJOctfSF10TjF4y6IduUW8MXWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ygwgh4SR27Tj4bHKtN0vr0lgA9PgkWg18lEtnnFwdnwPb0PXyMCSX+s/tPmDrn30C
	 d4CKW9XSVqoBbXT6VuQMuVHsiqVBOG4NbYVHSriRS3rr8WDHP5UTB+HspfAY/lw8HX
	 aiI7/oMHHm0qy0UO2fA9tXH9oqlF7cLiM/Cg3W1e3E95wz935pPVWzONmiFdtxJcED
	 q6JPGxRp13fi7zI660agkkgVMpmsC9PibgEH+bn3lzCy9p5ozlgwv7UNVQHpLn7PCk
	 +X0R7Gybuj73moFuiKKno+ozu/n+g9KNAoxhm3wq/BvRi9hleueDE6OY1nAc5Px+pI
	 u7Hap06gdhFIA==
Message-ID: <sashiko-outbox-216209@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: f81232: drain work on failed open
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haowen Tu" <tuhaowen@uniontech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <B2303336BB3BED22+20261116051024.3330549-1-tuhaowen@uniontech.com>
References: <B2303336BB3BED22+20261116051024.3330549-1-tuhaowen@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 05:17:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The interrupt URB is submitted before usb_serial_generic_open() starts
> the bulk read URBs. A modem-status notification can therefore queue
> interrupt_work before a bulk read submission fails. A bulk read that
> completes before a later submission fails can also queue lsr_work.
>=20
> The error path kills the interrupt URB but does not drain either work
> item. The tty port is not initialized after a failed open, so the close
> callback, which normally flushes this work, is not called. If the device
> is then disconnected, the work can outlive the port private data it uses.
>=20
> Flush both work items after killing the interrupt URB. The generic open
> error path has already killed any submitted bulk read URBs, so neither
> source can queue more work at this point.
>=20
> Fixes: 87fe5adcd8de ("USB: f81232: implement read IIR/MSR with endpoint")
> Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/B2303336BB3BED22+20=
261116051024.3330549-1-tuhaowen@uniontech.com?part=3D1

