Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965927;
	b=szgyAMURFFu7f+NkHnmEBT3O1xoBJr1Vn4As9vQYZnjwuhUYFJIF6caC3zFz6UozJSIm
	 AXPr3sQqGZzdfddcCGuU1dHjnswLRPr5TrhI/yjt0b6XrMBvZ88IAW+amM6qeK0TR8EEf
	 VEWqHb1SN3PIBIDyw/vdpzeN/vABU+5/1Ud9LhDt+W9JR5ZdUeJEYyFartZtFrO9TM5Gx
	 miiUWXz8qrLwWOcFk8tGYS+Jkl6aaMTG5SOxzeJjAhPp1wMjIM5VS0Lg7QHoZRCJYaC/Y
	 V5qTByuZm+8bKfkereuSkav9LB3MBA4IBu+ZVKQgos0qPQMdCF7vMR7iA65cX9sefbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965927;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h+oBUOvsyFjHC7mSFFRIp9LPZyyL1DgDmpiBX5O73Eo=;
	b=2odxgkvlozzt50tN1HUT/MuTAQQY9Y5et5OzJdQosiDWMyiB6Fvzq2wFU6IwCxjWpy/U
	 zRzDJLC1cIj/pF0sp/iHxgp+k5GlJGBFGCRq0gjd64M+Dy/cGnx0uHw3J3zvl5Nb1Gd9o
	 2u70HQeDpZ2mg2zhVHOP6xOX9LRg6Uyj4wFdYbAfY1Er7tWi24MjMGR1JA6aN4ZHRdtph
	 kN+lSZtr3C+bzcSU4/zd7AQ2jzFGa94kNuDOQDCB96sYqekDJvoLYHGD2Yfwk4mb+EeWK
	 3QGI4rbrJVGhbzS9E0hf8pw5BlnwXCsv6Oh33iNRZg/Ch1rtZxiFXTT3GibptcREtmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TX7gjFRz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB517606D801
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TX7gjFRz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CF51F008A7;
	Fri,  6 Nov 2026 11:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965926;
	bh=h+oBUOvsyFjHC7mSFFRIp9LPZyyL1DgDmpiBX5O73Eo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TX7gjFRzjwYmG8aQBgn5mhO0nlM9p+/TEzzCemUsmAWNargACVTEx7Yju9aAlKwAu
	 LWQJF0OZYBHKsJC+mw5RJJ9OgRYrrDLURJs96dsXaM/41a7tQJYXBgNfmNde+FLy8U
	 k74r9NOrMb29psMsqGPh6t2AOtkThgt2Ckfyh8he/8SQpE9ZACyAgmda7lh2ylMagR
	 P+XiEWaYO0JaCHBULb3tH6HGDCrscQA+oXFaYhZET6W8Qmy5jMIsBQxv3ndH6bJBx5
	 1LYU6qMbal0s4SNbUaVVM48Tmr9Xy59ERYe3HmRPFkI4nBmTRkTWWDH0UkvLX6MX/M
	 s4gZ6s1Vb3m9Q==
Message-ID: <sashiko-outbox-201364@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] usb: dwc3: support two connectors sharing one HS
 data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106114208.987284-4-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106114208.987284-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261106114208.987284-4-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:52:05 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106114208.9872=
84-1-xiaqinghuan@mail.ustc.edu.cn?part=3D3

