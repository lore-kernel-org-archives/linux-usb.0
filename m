Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793568561;
	b=J3LWdCijJ1A3dYfQPqtWuo6orkTzPnpPkM5DSSsyGRRDt2MielEedbnhXwZw1zfR8Wqk
	 6Vgh3EhMhZL6n7W7izw2yg6D57dz3Vx5EdfQg2E+SenG+bzM+/rQ+Mngv8+wfieE30mTy
	 g6UnEfFRF12QCusrIX8HQEqhZuEAVKkZNyA9vI8vyvMRyeAHEjHE539msA+HKMEtzJS+h
	 fAnQC44W0wdJYZIxCesLBU6G0xe7R4LEMNJYxMikQuK0JZRgLHhg2uorZhPY2IGCPWQJk
	 4WOuIbfp8HwA0w/Zs+ejOEKo5dHkxUNraQkQkY/vwKxCiO3JTINc3rlwWufN5ur04Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793568561;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=t0ceX5dLnfUvH2CToQBDGShB5f13ERe4J9v17lIs+2w=;
	b=gGmNbbmdI+48TbXQ2u55MI8YtJmpChz2WdhfyWrdeGdjAM5aadeTwr5nswqIjYfHxqBO
	 5auAtEseX28L3GveGdmDz2/JU5fEf//goufr+yhAOua9A5dvYKU1+LGKZ6KZ0C7+sMPhg
	 b9uYKNOw4zMTRXSH1z2GlrbcK4Sw8R5pj4IiGEBN5Rqx0/oBhQPV+rZiD9EjKV1pa+Y5H
	 aerVmp2MfhmrruwjMSsWbK0z1762Sg2y9LPqlY8D2ZR+Yl7VYe023aoQW86VAqTW2mkmH
	 3+d662+cqjQ9IjxAXC/yedAt7mx4xuH7PFh3ERGYSBQ9rxnP0zC8VVmoXRe/NooieAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3rw16tu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D9A606A324
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3rw16tu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AF71F000C1;
	Sun,  1 Nov 2026 21:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793568560;
	bh=t0ceX5dLnfUvH2CToQBDGShB5f13ERe4J9v17lIs+2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e3rw16tusU/DM6CHcgTtZ97Es2nrmrb7rV8FPQ5EkAUoShWfFB+w5ZIeAJ1+Vkm7w
	 nRQ/6vBMNe9J9B3LtzbtjSVG2SS386aJyHegAjaPUW9JH0VuVN5m76pvPCSDANYyYP
	 H2q0+IiepNhX/MnJzUg4HCV/2r2kykaXbGPHLz6lRmDYHczK9ERBDpDNRKFmTJn02E
	 v47+31fjsEhRyusfOJJCx0hnRPHmtJO5/9g5AOHEIO6FkxsepJBEyAfrvaDWeuOhTg
	 E+iS1xYVwA6beb2afgX6PnD3UzJ+QlZbTwTVnM+2zj5QEQQsyg/kx6E7AGL5JnnvCz
	 046uux4zJiT7Q==
Message-ID: <sashiko-outbox-192681@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thunderbolt: Enable hidden DP OUT adapter on Dell TB16
 dock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Grant Morphett" <grant@gmorph.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261101212311.10946-1-grant@gmorph.com>
References: <20261101212311.10946-1-grant@gmorph.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 21:29:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Dell TB16 Thunderbolt 3 dock consists of two Alpine Ridge 4C routers
> in a chain: one in the captive cable module (DROM 00d4:b051 "Dell
> Thunderbolt Cable") and one in the dock itself (DROM 00d4:b054 "Dell
> Thunderbolt Dock"). The dock has four video connectors: mini DisplayPort,
> HDMI, full size DisplayPort and VGA.
>=20
> Mini DisplayPort and HDMI sit behind an MST hub on DP OUT adapter 8 of
> the dock router and work fine. Full size DisplayPort and VGA are wired
> to DP OUT adapter 8 of the cable router, but the cable router's DROM
> marks that adapter as disabled. The software connection manager
> therefore never initializes it, never tunnels DisplayPort to it, and a
> monitor on the full size DisplayPort or VGA connector stays dark. Only
> two external displays can be used with the dock, while all of them work
> with the firmware connection manager (and under Windows).
>=20
> [ ... ]
> 8087:a76d) with a TB16 at dock NVM 27.0 / cable NVM 16.0, driving three
> 1920x1080 monitors on mini DisplayPort, HDMI and full size DisplayPort.
>=20
> Assisted-by: LLM
> Signed-off-by: Grant Morphett <grant@gmorph.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101212311.1094=
6-1-grant@gmorph.com?part=3D1

