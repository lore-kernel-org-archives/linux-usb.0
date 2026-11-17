Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887249;
	b=YYTNFEVaG4NR4N5/vXzG/71LSNM6Sxs7nCIUQ767xFjgHDuruEt7eGWdWYSyvs3vWCfg
	 YsFlDJbAsgmnOgLQ3+8RkMjey8IIebczZ+9zcLIBKj276q2jGHQ0rONWHe7qlTt8aTMxd
	 ivhiC+vT7mugqLhb4zz/3Cqz+eeDhHOSEeS1yxhhbBrmvWFqkekvHY+TFrQqpRXtRltuG
	 I6Hl3XfAAf3qTR6RDUlITZXFyduoPW36bxfoqJaZHZ373Ai2cR+E1rd4zGzaCqPI2P85p
	 L+aXwT/kcguFFmaBIw5ZQ50LoopNzKnGVVquIVJu1iuAAMryL9UsBE3SP8Hn0cdZAFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887249;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ezpMkA5nP6ezyVMY2fM5yX+7PEpfhoP3cC1RNX5OBKA=;
	b=BOOS+4MpBBOVvyNHCFJPgYviHJWvMW0dV3ArspYsJ+D88IZDqUr22Ey8W3MH3hi3K6+A
	 y2zGAbFQevSCLsHj/czDB6nmxmvbbnxdcXfjf0get2fi8ERPiafEBvOLZqSim2YdP+R+A
	 B5dB7yiFRbKP+43du5ogNG569I0RHkjEDC9c576PVjCkq9vr7uXCnfFWD5AbOL94hX3z/
	 mXt4UOp1Mc1prBAgWDKNbnG4hITgrNPXO+7IBxGOkIFfyJnem0MzcJxb7Oo6GmiqxuW7l
	 gemZEBG9msh9X8bCTYCAWeyuytxtKo5oMVk10Y/ce83R+4I13NhsaZFJtJXnokVh+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPehRr8M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0E3606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 03:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPehRr8M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110661F000C4;
	Tue, 17 Nov 2026 03:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794887249;
	bh=ezpMkA5nP6ezyVMY2fM5yX+7PEpfhoP3cC1RNX5OBKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPehRr8MMjvb8Q25qRpMDK8Z6hQa0PU55B7+j4563xE2b42dbg1f4zzf7DkioOD+b
	 sRBZLNlfszPpZUYF5qdSmj14MCit4uh/TKz6T0AFc1puHQzMaidztuHHOAihecopOB
	 ccOs+xEGcpVh+2rOWg7KKj4+QJa/us2G0OpC4yX6Hz3oz2p41jLLjNE6mPSU40tZFf
	 zVZkLzu5HBwAoVDQZOoxRohcJU4aStm1m1uDAhrV/k8AqL3RJCjOg5OkDsBUqM+Flb
	 5xTWh6Ib34wXja68x0fY97P6t5x64g7h1G8gvMXuCRK6YUFvf0ljbM4QswueVDi3h/
	 bLo/FVLf7ugPQ==
Message-ID: <sashiko-outbox-218159@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: use the clamped bMaxBurst and Mult for the
 wBytesPerInterval check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cheng Yongkang" <teel4res@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117034311.538314-1-teel4res@gmail.com>
References: <20261115163701.226491-1-teel4res@gmail.com>
 <77330361-136e-4e26-b5ac-9c4259f90978@rowland.harvard.edu>
 <20261117034311.538314-1-teel4res@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 03:47:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_parse_ss_endpoint_companion() clamps bMaxBurst to 15 and the isoc
> Mult to 3 in ep->ss_ep_comp, but then computes max_tx for the
> wBytesPerInterval check from the original descriptor. A device with an
> invalid bMaxBurst or Mult can then keep a wBytesPerInterval that the
> clamped endpoint cannot carry.
>=20
> With wMaxPacketSize 1024, bMaxBurst 16 and Mult 1, bMaxBurst becomes 15
> but wBytesPerInterval is limited to 17408 instead of 16384.
> usb_submit_urb() uses the clamped values and rejects isoc frames above
> 16384, while usb_endpoint_max_periodic_payload() returns 17408, which
> xHCI uses as the Max ESIT Payload. The same endpoint context gets a Max
> Burst of 15, so the two fields disagree.
>=20
> The rest of the code treats ep->ss_ep_comp as the sanitized copy of the
> descriptor. usb_parse_endpoint() checks and fixes ep->desc the same
> way, and everything after parsing, including usb_submit_urb(),
> usb_endpoint_max_periodic_payload() and xHCI, reads only these copies.
> max_tx itself already takes wMaxPacketSize from ep->desc. Before commit
> 842f16905dfc ("USB: remove the usb_host_ss_ep_comp structure"), the
> clamps modified the descriptor in place, so max_tx was computed from
> the clamped values. That commit moved the clamps to the copy but left
> max_tx reading the original descriptor.
>=20
> Compute max_tx from ep->ss_ep_comp.
>=20
> Fixes: 842f16905dfc ("USB: remove the usb_host_ss_ep_comp structure")
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117034311.5383=
14-1-teel4res@gmail.com?part=3D1

