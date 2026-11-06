Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965240;
	b=D3bE4vI+PCT5qx+2tH6KJJCZVdMdIScMVbFLAheIqk5eD/fcMsFNg3yXAHgy8gugOYXz
	 8wvPG7XbI2fwcVKSkSlngUmvhz0DcTCvWZj9u9m1AGNiRU+BHCY6NqHWukywh4JWAgI47
	 dEjIh5xdfDNfvf13532g2XMigGoAj4B1VUw8fm95pzRzCuW/k4gyf7084PbBo/AKlktOu
	 lrJvoxtqf6cIy+TB9ikibQoAob4dyJ92wglyPHeWhNvC0mKgrnYdqaTRTmeKto3A4ncIe
	 YPN3Ux7stF+CokNYQqDt5q7K6VZWdi0fJ6uk2Oi+dK3Tr97cyexMsFctTHkemLT6W/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965240;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9yRwx/+GPbGKg1IxLxCnY4jJqMjssvneMD0mtA/PJKw=;
	b=rwwOJb0fPeGcwn64+oDtGfgEVB1q1vtX4TNDkZ0Gb4sYDKKr+cuF2u1HzixzV310euSS
	 lezfbfOvU2AHytUiXTThq6eOl0bh2ffVFKQ4BqqdszW3ibUW+HO9UVadjhZL2fXcTEkEZ
	 9febYCTfKdkB80onitOkSY4prN2KyQ2xenbK/A+oM9a59J7J3xpAwmfI+wO6MKXdivN6S
	 aKx1FpiQYHXLn7Jok0DtL0uh+GjZP9qucJuzux+1uVMWOqa2B6C8irSOrsuSF0eCUNYNW
	 /NLRq3svn0loGlelNax5ucFdIrPClqz7HvEBGpwgA5LqcxG0sCYeXz1+bO2TSaAODxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lvHvHlb8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C0606BD4C
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lvHvHlb8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C511F008A1;
	Fri,  6 Nov 2026 11:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965240;
	bh=9yRwx/+GPbGKg1IxLxCnY4jJqMjssvneMD0mtA/PJKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lvHvHlb8MgRT5cbQsXkQVwKewKliSxXm4tFo7e5jIdWadfvGSzZN7mFwFHxDL/NQ7
	 /5crawkPeLqsx5rKSNPYMYOhQ2dCTBnBcMFWZGtBEHlv6kFM7zDn+dkRljYh3ev0vw
	 qmLRB5zm/BncjGhSBnnu+dqc7zhKg0tEVFAS0zbjw9/+VFye8pqAwEd0NnDmjDV9K+
	 cOIP0KgnvhFulQq3ybCjRjFyhjy4cU8fiPPDkadHcBkmjAKtp5nYfEDy0TwQ9vh4yd
	 MT0giaDsWp4P2YHo2bUqa8xUtAoPNmp7C1OAx80nfROTy6aqY1IndG5sokgw3d3wMw
	 OgNXMZNEgY9SQ==
Message-ID: <sashiko-outbox-201328@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] usb: dwc3: support two connectors sharing one HS
 data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106112811.963923-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106112811.963923-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261106112811.963923-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:40:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On some boards a single DWC3 controller drives two receptacles: the Super
> Speed pairs are wired to separate PHYs, while the High Speed data lines a=
re
> muxed to whichever connector is in use.  Such a controller has to service
> two independent role-switch inputs, and the shared data path has to be
> moved before the controller is reinitialised for the requested role.
>=20
> Register one usb_role_switch per connector endpoint described by
> "port-select-gpios" and the per-endpoint "mux-state" property.  Requests
> from the two switches are serialised by the mux lock, the oldest pending
> request wins, and the port-select GPIO is only changed once the previous
> host or gadget instance has been torn down, which is where
> __dwc3_set_mode() runs.  A same-role request that moves the data path to
> the other connector reinitialises the controller as well and starts it
> from the same SUSPHY state as a role change.
>=20
> [ ... ]
>=20
> While the two-connector mux owns role selection, the debugfs "mode" write
> used to force a specific role is refused instead of racing with it.
>=20
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106112811.9639=
23-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3

