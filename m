Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092221;
	b=jiJjwmcRyZrxvDpOxmS9MyicspTDe7DQfAC1RJ8hHOVVcQq3XlzEI13AB92alyiWxgO1
	 0TZzW5FDT3rVHKnHQ03TtlcYI7uBtRxPU4oA95i9JV48IBaVxT0gkNgt8aDr8gOIHVlyE
	 jdFelcpwdz0aP1aLRoghWE6NI4AO33VwrjZHNDppxugzK+aqjtuw3KNeMcMwsW5hC+n3b
	 K0wJnz3c8ZJqQjd0go/LKCjSX7F0KMhXJ9Q5R0EiTe3yHcJrYNAVfJynEa6NeGcj51gLQ
	 W6q2QfkJQI7p7iXEuKwkz7XR2z2ohRj+Inhe841tgNx8eFIHflHA/mtmgWaLNGhNDZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092221;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BC9LVfUj2eLHZ+PzWjIV2LBgw63a3Ks2OviJm05GfQ8=;
	b=lOj5DE15Ls994l2xNWBBlnPKqVu549YQyezJXm0ql28a4/J3VCoin/vSra1etnuyk1Q5
	 FOdSoceZxZc2IzdkawrzNR59KxvJzVlbHWtCMzQIVcCcCAPH3c2g/5ylsp+77Sac9tFNg
	 jukve3FF7YQmDFJn2O4tk5NOvoEOcjFUUCdU0uwX5ngQb4sdvJSPuEP6mmT5ZN1tr7q9w
	 cbKMs2PeDAGMxjk8GmwotL3VStb2PL8oyTC0aZjByWyxfb27Ye9A2bQI7zU9ucyKndStl
	 GhOS9fKEpuze5VJdqKQcynuACJmEyA5WWsJVTHwIsEf62SPTMkDDkGNtoT0WExOT9nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="T/U5g8WJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB47E606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 09:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T/U5g8WJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 196BA1F01825;
	Tue, 27 Oct 2026 09:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793092220;
	bh=BC9LVfUj2eLHZ+PzWjIV2LBgw63a3Ks2OviJm05GfQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T/U5g8WJt4JOS1KwhkqOBTE+leUHpujyC2EhY6Y/lqBFUb30Q8AaacGmn7fFWyc0D
	 EYUOU2QDzdQQHVWcaWk4pzbBy3MfBhXdLauTAqpPtBroGix/GPd88OQNlBX9HoXEqy
	 ZxTJTbHgcMLNb0SUCLODSAdoJQJuRMohra4TmRH+F14zT9D7+8UldF/WL/m2aq+Rds
	 Cjwg6FVJ9WVZU0VrDq9DzOaSdOsUoYOfXSCjZlbxM897zEkZwZomAkQCj8QPRLfNUl
	 GggMLmEd+GrIzxEs1ZoW3kMddVzC+Uv1S/HxyCrPTsgYepHFsbnhCG6LqHccmrJ7du
	 v5G060NyufI9A==
Message-ID: <sashiko-outbox-186313@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] xhci: keep ep0 blocked after disconnect until Address
 Device reloads it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yiyu Zhou" <yiyu@yiyuzhou.io>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027084845.1588204-1-yiyu@yiyuzhou.io>
References: <qLQr_bD2TzCrwVMFdRe7Wg@dsine.de>
 <20261027084845.1588204-1-yiyu@yiyuzhou.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 09:10:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> After a root port disconnect or link error, xhci_handle_halted_endpoint()
> sets EP_DROP_PENDING instead of resetting the endpoint, and gives back
> its TDs.  Their TRBs stay on the ring, and the endpoint's dequeue
> pointer still points at the halted TD.
>=20
> If the device comes back before hub_wq handles the disconnect, a driver
> may reset it on the same slot.  usbhid does this after 1 s of
> interrupt-in errors.  xhci_discover_or_reset_device() then clears
> EP_DROP_PENDING on every endpoint.  The other endpoints are disabled by
> Reset Device and get new rings, but ep0 keeps its ring and dequeue
> pointer.  For USB 2 devices, usbcore by default sends a 64 byte
> GET_DESCRIPTOR before SET_ADDRESS, and so before Address Device reloads
> the ep0 context.  That request is queued behind the stale TRBs.  With a
> Keychron M5 the reset stalled for 11 s, and the xHC then ran the old
> TDs ("Event dma ... for ep 0 ... not part of TD"), writing into buffers
> [ ... ]
> Fixes: 7e0ef4332ed9 ("xhci: avoid xHC endpoint changes after disconnect o=
r link error.")
> Reported-by: Dennis Wissel <dennis@dsine.de>
> Closes: https://lore.kernel.org/linux-usb/4MjB9K-2SoiA85WbI9iEig@dsine.de/
> Tested-by: Dennis Wissel <dennis@dsine.de>
> Signed-off-by: Yiyu Zhou <yiyu@yiyuzhou.io>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027084845.1588=
204-1-yiyu@yiyuzhou.io?part=3D1

