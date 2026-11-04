Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756315;
	b=C5gZ9VRG2FxkWuQnOgTkvDuxGqQRmSaQoDTEZ9LGtNkRVhxX67LzAEXcEz+QUeOaHaIm
	 NUlS1EW2hEyO7uWBmLCRCCqsflZKO781GGRBcrd0g3m40FYie9NV/0SkBq51+sqaIqwUm
	 d06kgHvR02dZudPevvtFV55YvqRGoPRNuPguOc/hrWMkCR8ZRchoXWIKQiaCXMjsAft0t
	 /aANGMzcPOzB2GPniHnTX5rEouckMfpDcpj2otrIv7Gzec2chcAsFzeQ2zUZ583gqsDnI
	 7JId9kvzMQO6sQRHsOW6n4t8yn+yZk3CQ/dM0yXPWlBPCIw3sbzx/Uk9SspIlerMw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756315;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UsYIqRBxwXCl7iQsQSGhSZ4YARLfQzOsGB4KNMKgepo=;
	b=uSoPLsAzBwOCxMDgdtgvnqoQ/lHnhkF1D1d+pZ3/IWhESFHwaRGUGV9RkUfcGzTAFQYJ
	 N0TFGbGjy5/oSVoMXsEV7QXFqqbcRFLajUut0OslT90+uuSehmcZVS7nJz/CUt4Y/jDEt
	 IqhsmhTeO/3YLelWu3pOrr9EVgyKVTzt1c6ACxpUIsasFS/k+oN1Ks8f0NT6CtuyeJnuV
	 Oec1tmK98JLEbZx5+uotQ7NBDPXDocIW0/iRfoKMuzmnNPADLPPoUY99q524Si/iwU5Sm
	 pegCOKHIgB9kcr3tm+hs0D6LI4pU/NRs0xFHzYwkJiKgqX3ImDaEn1vQ38/w8viyspQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WDjWoHU0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82617606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 01:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WDjWoHU0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B11F1F00919;
	Wed,  4 Nov 2026 01:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793756315;
	bh=UsYIqRBxwXCl7iQsQSGhSZ4YARLfQzOsGB4KNMKgepo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WDjWoHU09mwY6+4udXWcFYw+54WQwKMd+8K5/4p7xpPxyhtBlwHD727jrEdQafCDG
	 Mg2jo81/TswaPaJsXmw0x7jivcWDzhPLFpKShA9cGVM5VRa5TvtRUe78lXrzfPj7iH
	 HE+W/tmWsMEI3CLdo3MuYesJfH6jfBmt/nFxkqGFd5yRefy8wwlV2ntardRLQg9pFZ
	 l0fkOlA4r8MhcITkBuODTXBBwQY1XpoNlBbjh3e8u7HO6ib/hnO2XYmAn06ZCPKi5n
	 WzSizByRBuMBAbyyeBwwgXYLWLB/9XawNfx+Ss16c1xc582iZQ0wGuxMTYZJYSZHpp
	 tSFYdHvNxREGQ==
Message-ID: <sashiko-outbox-196368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR
 Dequeue timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ambareesh Balaji" <ambareeshbalaji@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104012725.147741-1-ambareeshbalaji@gmail.com>
References: <20261104012725.147741-1-ambareeshbalaji@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 01:38:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When a command times out, xhci_handle_command_timeout() aborts the
> command ring. The aborted command is turned into a No-Op TRB, so its
> completion is handled as a No-Op and the command's own handler never
> runs.
>=20
> A timed out Stop Endpoint command already halts the host and tears it
> down. Reset Endpoint and Set TR Dequeue Pointer timeouts are not
> handled, so the endpoint stays halted (EP_HALTED or SET_DEQ_PENDING)
> and its cancelled TDs are never given back. A driver waiting for those
> URBs, such as usb_kill_urb() during unbind, then waits forever.
>=20
> Reset Endpoint and Set TR Dequeue Pointer change endpoint state in the
> host controller only and never talk to the device, so a timeout means
> the host controller is not responding, as with Stop Endpoint. Handle
> them the same way: halt the host and give back all URBs with
> xhci_hc_died(). The endpoint state flags are not cleared here, because
> the endpoint handlers and URB dequeue check XHCI_STATE_DYING first.
>=20
> The timeout was reproduced on an AMD xHCI controller passed through to a
> QEMU/KVM guest. An endpoint halt was set on a usbhid interrupt IN endpoint
> and the doorbell of the Set TR Dequeue Pointer command queued by the
> usbhid unbind was suppressed with a kprobe, to emulate a host that does
> not answer the command. Without this change the unbind blocks forever in
> usb_kill_urb(). With it the command times out, the host is torn down and
> the unbind completes. Normal unbind and rebind of the same device is
> unaffected.
>=20
> Fixes: c311e391a7ef ("xhci: rework command timeout and cancellation,")
> Signed-off-by: Ambareesh Balaji <ambareeshbalaji@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104012725.1477=
41-1-ambareeshbalaji@gmail.com?part=3D1

