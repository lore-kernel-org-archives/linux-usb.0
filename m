Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEB652D600
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420109; cv=none; b=clvZMi75FVhNzQHb/lxDzdrXwXj7XFTTdgf3Sts/IiINOY1AXVsIDAR+3u9IP9yN8XiXnrIgSMXmrq127LWvcmazdQUFtvOr3BXcKA4Co7aaUXn7NZkcXEvg92c9AG5KnMCxA51eQpcKRdGROJIQYlscqxPNXDf6dGdUFs1O2mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420109; c=relaxed/simple;
	bh=2DHMoUCdvLp3++1HsNc/q5ivsYe2ef7xB9vPmW/eTi8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=P2L8ONNK+A85O0s/L8b0U6g3N9ce+KiSq+4Mla2Pd6ZM1DHKMF7YGHFRy1COsIucdzY7Yqb16PzgpN0srdMvaG4nT3p1twLcJPbbwy00nCytPd6sHdSZ7dkNeP4YqtDWNiAii+4KG52wRk/T4DqLTnqF7Z/cwxAfvH8XQIvzlmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFacsnK+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFacsnK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4B01F000C4;
	Mon, 19 Oct 2026 14:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420108;
	bh=2DHMoUCdvLp3++1HsNc/q5ivsYe2ef7xB9vPmW/eTi8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OFacsnK+pCmYF6TcZ2Sq975d7fcLmPC4JBg3FYTpytIh+v8C2UmBclG5XDvr+DhHV
	 SI0SnzRarN+BCMVPVjZ+y9jmp7twX2ARPGW7AoZTcG4QQHqbDlz0tQzk6TMxn0TKur
	 HmPnRn4aOLgoSpWdfb9EgSSKEvxoWBNwGr6Jk4RZgZhQmeld8IEpZ1PGtyvvAweHtD
	 KJWtDlcS83SXSRKkUBT8y9iZAwj0RUXGTihKuFBUFOBgTSBeO0PhtnkQ0n72GwtuNA
	 BB2wbpE8tSAjbyNhKR1eREEH2BrTlzpN50jgLoHc11PDJiSbfhLZ+qNZIxUq0X4oPR
	 7af/RXU6gNaSQ==
Message-ID: <sashiko-outbox-177394@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-5.10] usb: musb: host: clear stale RX
 interrupt on three-strikes error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-136-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-136-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:28:27 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Lucas Martins Alves <lucas.alves@lumal21.com.br>
>=20
> [ Upstream commit 3a3a48487344a653f46a4aadc9ba296386eb3541 ]
>=20
> Unplugging a busy USB Ethernet adapter can leave a stale RX interrupt
> pending while the host handles MUSB_RXCSR_H_ERROR. On AM335x/DSPS
> platforms this can retrigger the same three-strikes error before the
> disconnect path completes, flooding the log and potentially leaving the
> host port stuck until reboot.
>=20
> Clear the pending endpoint RX interrupt when aborting the transfer so
> the error storm is broken, and rate limit the error message to avoid
> spamming the log while the fault path completes.
>=20
> Signed-off-by: Lucas Martins Alves <lucas.alves@lumal21.com.br>
> Link: https://patch.msgid.link/20260714134941.18508-1-lucas.alves@lumal21=
.com.br
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-136-sashal@kernel.org?part=3D1

