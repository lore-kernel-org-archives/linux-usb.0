Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794091070;
	b=CUmQZqb54aXh1WTVHgfaSbrX6rWPUddKblgPSMb+PGDswHfG92TIewfeVGyeHcb3Nec4
	 r5a3E++flEoeaqfgnaxaEtXJkYKtP5Rz9PacJ/l5a2Sm9qJnvKY3P6x1LVTZHekyzhOYL
	 SGibM2+NzupMBgbEytDyllrIDDhYLrrPe+LzONbggfFvOjFxRz24uz1pFFrKr3jrE0Saj
	 WpXjVHKrUtrQkkTV7BCAn+TBoBzP4up8LJ9lMZDaDqLl9+W54lp6s6hnI1uwXo6i4ehEL
	 qqhgJEs4IEG0HvgqYXX/KmORGDypr6gN9HM/bvHI83OotygfdRu+ibFx1rNZy1b9mog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794091070;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RvPH2TNsI9MLrlp6yqMPsRRxywfhJV1K4j3FyL6F5oM=;
	b=F3dd4WD+IjxPRJOfPpcg1jB6u3/1fUfOb6TqjNrWZJdMKHe8/aGG/tDjeSAwQEbUTp8Q
	 +qgJ3qQkapPHhUEkoLb6i14SlfCm1AciWCHv4pOnZigDP3rbn966Py0xNZuB2MWvo7flv
	 eeQ1VNGK+KaT4marpATuzfRBdAFk/Xs67VT7vSVO9SkE+F+1dLhbRKlNW50mia88DT7mr
	 N4s8DKzl5KhXh/dT48NylzgGQMOVQICl7W2Ko9EV772xALf4NZR95305bNfFre3n/+QsM
	 JajPypSeIiEhj2+a/8yULA8sqoNyBHcYsRBXOClwIg4elFgKNuhFYgC0zCKmsoo8gXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOPsmyLM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB519606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 22:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOPsmyLM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1C51F0089F;
	Sat,  7 Nov 2026 22:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794091069;
	bh=RvPH2TNsI9MLrlp6yqMPsRRxywfhJV1K4j3FyL6F5oM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QOPsmyLMzVgTGupchZd8+zeU/fIopu/F+lwoD5wl7aCoBCfRJIWycjw1WrJ9wyiSN
	 SWq9AQu7x3OGycceYL/S50zavHcQoukHWHuMJjjOwb0PUwZMrzrhdUZ5Iq6WCGuC6b
	 Vv2FHZrMoE8633YnREUKq6qLDSPs3k0b28UFE2ASRh/gj8UZeVSU3ov/j8ZttEdM1H
	 JWJ7lO8aJllWNRK/4+Ox2fOMf8RcnmbiLDur5ACs3iEoprBPCtq7eDKTK6pukKxskS
	 pb7vlgZpGYFRXZgCzYakibPUJkKmQP/1M5+xe7RL412IQtFWeSF4BArQS6iQoI0oPB
	 PNkA7du0ErE1A==
Message-ID: <sashiko-outbox-203369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: musb: gadget: don't flush a waiting RX
 packet when queueing a request
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elvira Khabirova" <lineprinter0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107221904.82487-3-lineprinter0@gmail.com>
References: <20261107221904.82487-1-lineprinter0@gmail.com>
 <20261107221904.82487-3-lineprinter0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 22:37:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Since commit 3fc137386c46 ("usb: musb: Fix hardware lockup on first Rx
> endpoint request"), musb_ep_restart() flushes the RX FIFO instead of
> calling rxstate(), with the premise that in case of Ethernet, dropping
> a couple of packets during gadget initialization is not an issue,
> because it will only happen when the software is not yet ready.
>=20
> But when using other functions with musb, for example, f_mass_storage
> or f_acm, this code path will be used not only when the software is not
> yet ready, but also mid-communication, and it will cause data loss.
> Data loss happens on gadgets that don't always have requests queued
> for an ep.
>=20
> The timeline of a data loss:
>=20
> 1. A function that does not have a lot of requests pre-queued
> [ ... ]
> This patch was also tested with suspend to RAM on the Pine A64+,
> both idle and during a transfer.
>=20
> Fixes: 3fc137386c46 ("usb: musb: Fix hardware lockup on first Rx endpoint=
 request")
> Signed-off-by: Elvira Khabirova <lineprinter0@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107221904.8248=
7-1-lineprinter0@gmail.com?part=3D2

