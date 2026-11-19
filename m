Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109200;
	b=PTFvLoPStUvjXGPqirC0QLIyspKkRkRQs30vQR4aAkY5ZyB0HhFSdtEKLXGtX3NbJZfn
	 kagLqxRCUCMl219R63AupKEM2Vup41xD17VMNNtfihU5t+pPjtuSGeIEPcCchNTXYIJni
	 E4tGOWPrB2vlPdstCyaDYCfa1jiIxPQxysHMqeagSwSZo2rHpTDe5bgvFnZSqiMLhlv+Q
	 6KBDDvzL2sOhWwlQhWfM1qKcZDBzKQX7+gT0r85lViVMYCL/AmDt9fhLxUvPz+eqmr8WP
	 kedmROBoIory/A3SXcc68bXwdlmvHHILidcUYZCkjwWxXCCUgibiiGFdwNa7718SzPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109200;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1dRKOlYHqDodpqzm7dGaG0eOkw9Ksfa8DUu3fL62k/4=;
	b=gVddx/zxbYgdtmzx0dHehxJ2Y5WGkLhlC0GB1hXcddO//Rhq/Np73DgTCQluOHYZyBua
	 w+uZD6agZGDRws27q/Vb2h4iCpwQ+9bXlvv9pMTDDztElYXXsnN6dFmek4fccjGCJ8Nlm
	 mQivrimYkcZCQgTrwi4yS2pPPBL4NJm51eOgx4XMOFM9K+whJirD9UiJFxZg4+4ruGDXH
	 7HlVPQfPB1I4gQaBC8hQlvq53jbz5BKxdfmMXT8SN6jb8GBKCQ233Tfj/5zmw4ec6KdoC
	 xDLjkJj1q968JDDL2No4+lz61hUUH6IiZn+Wxw0P/cqtbK5IIPvhptcKqkAqsm04BWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aoiBKMjm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ED3606A330
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aoiBKMjm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941451F000C7;
	Thu, 19 Nov 2026 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109200;
	bh=1dRKOlYHqDodpqzm7dGaG0eOkw9Ksfa8DUu3fL62k/4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=aoiBKMjmmnOMxBAhMf8rgrXjLDjANpjX5eE3zoeT4+B3Fl9vz28p/QBu0uR2gT9sD
	 S0KP6fs135E8iz/oIh1zV/ADIAetZOEwkLYTs4upxK8fdYhq7SIlzdmFr10R4WPA1h
	 nmXXuuMI4UW77varip11uxa5KFxnaZFDe7QlXHaEizHv5OQUB4FLVuNLQNYfxRILx2
	 KpJUpMkO3UFevv8/gi7g6kZK9xn2PbDIb1txzs+SscL8KNcqPf45iqA5QVOMQusR52
	 Dta1H9KgOzaZW6Jxd59+2LzoyIZ13QM5BcpltZc8056t0PNHS49+xxWZPnoR521czH
	 Bqg5d7P8CBxPQ==
Message-ID: <sashiko-outbox-223692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/18] thunderbolt: Delay re-pairing DP IN/OUT if DPRX
 negotiation fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-4-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-4-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:26:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> If DPRX negotiation fails, for example the DP IN that was tried does not
> have cable connected to the add-in-card, we call tb_dp_resource_unavailab=
le()
> and that then tries to pair the DP OUT with another DP IN. However, at
> that point the existing tunnel may be still referenced so its HopIDs are
> reserved and that causes the new tunnel activation to fail.
>=20
> Instead schedule a worker that runs on the same work queue as the DPRX
> work so the reference should be dropped at that point.
>=20
> Fixes: 67600ccfc4f3 ("thunderbolt: Fix use-after-free in tb_dp_dprx_work")
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D3

