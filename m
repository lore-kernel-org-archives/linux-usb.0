Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312979;
	b=UWK7OnmzMaoQC9rFuQbMUfDpIpDiUBrt0m+zINELA3z4Jycggx2Aw5SqHftu9FBR8qf8
	 zCz7L5mws9O7eZhLbOntRZBHy+ysto9k4PmX+9iOG/MXDSriUhK2qgM15CNgc1wnkrBNx
	 Ia4ic3pc/JCONK4C3Ak0l+NvGoBWhSD2E93jtSmUhb+AzgT7znXpoOWsRQmHkFt7Gc77x
	 MJVM7Un+FOPP4yCLGR7pldK1LHYcL4r3HeJaMAa3TMGTLEWxwrTumE1LEuu24z7RHd0cA
	 rUoF2d5gFvwFDZBwLkVrpdr6/ihuRoLNz0AYOdidTKzdbwNCwKcGxrOBTImOsIOPi3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312979;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j6hK7zzTgzpz8++ByAdDlDNpS8v/NQqnlx324tFFxVI=;
	b=fUsgOwTkNBFTUa7U/A575hzjunhf28x8qN6MxAboQno62vYsv8/cXjas+LE/+ZhaR8cC
	 8kluoyG9WAHdJyMwbW1LgFzvTYa9z5vl/KQ4mzpabQ9OIU0woTg0W6kZQLCt7BvqIyqW2
	 YgKQgHsU7B/qsmFkt4/bYGZlB2DWZcsFYahQL/eGouF5Vpg8MZ2wobBJa0nvrTwQGAtvp
	 K2NjDlYkVwLUjkHoa4GkrlzKRN/Hj7wyqRBBFSfnR/ozbIROEEDFu5ctJpppKRtBpQoq6
	 IDnt+sq56snf0TXu64hMn+n2wExTBxm4uFQNzdxzgYHSucKG6QDCaIUl7c6AiWr5pBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VtOA9e4z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE3A606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VtOA9e4z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9783D1F008A1;
	Tue, 10 Nov 2026 12:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312978;
	bh=j6hK7zzTgzpz8++ByAdDlDNpS8v/NQqnlx324tFFxVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VtOA9e4zx9qaCtSoRKZnaWmwPK/LlUOqS8zDezTCGmG4ST0Xl0+dfPhmj1gx65BvA
	 FS5YjclFKWP4Kth5Wvp1zPS1VXm2rb/Tw95w+KbX+aO1jJlxFXdOQPHpdlpVyRf/hN
	 iEg4rd+/5YOsb7MdrysOp0O3Ojrgn83iNlXVo9eo7jRkHvAeRNo1n+HYvlvnSz3Olk
	 Y2R7FoT2roaSQLucHIYKBQs7vAyyoUo2AhBjbfaRkMHF1smcn3W6IDj9XtP0qBtawy
	 Hj2Gg9yLKUNfU8zDouOqHn7n99wIksje30jXalS4ykQJqTtg9dsH6bhZCrKUqZN7G9
	 jVY8hI6SV44NA==
Message-ID: <sashiko-outbox-206995@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: lpc32xx_udc: drain the pullup work on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hyunjung Ko" <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110120243.2540098-1-hj351016@gmail.com>
References: <20261110114351.2524921-1-hj351016@gmail.com>
 <20261110120243.2540098-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:16:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> isp1301_pullup_enable() schedules udc->pullup_job to perform the slow
> isp1301 i2c pull-up access from process context. The work handler
> (pullup_work) dereferences udc and touches the isp1301 i2c client.
>=20
> udc is allocated with devm_kmemdup(), so devres frees it after
> lpc32xx_udc_remove() returns. remove() calls pullup(udc, 0) -- which
> queues pullup_job to clear the D+ pull-up -- but never drains it, so the
> work can run after udc has been freed (and the isp1301 client put),
> dereferencing freed memory -- a use-after-free.
>=20
> Flush pullup_job in lpc32xx_udc_remove() after the final pullup(udc, 0).
> flush_work() (rather than cancel_work_sync()) lets the queued pull-up
> disable actually complete before the udc and its isp1301 client are
> released, so the transceiver is left with D+ deasserted.
>=20
> Found by static analysis; not runtime-reproduced (needs LPC32xx USB
> gadget hardware with the isp1301 transceiver).
>=20
> Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110120243.2540=
098-1-hj351016@gmail.com?part=3D1

