Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679984;
	b=WoSXlOwVBqfCHIahnKqU7lpcKvMF12ebiC6wh/vjE1K+LLPRrvR62mzpa+bmYTse2f/T
	 OfXLL1gVpR6h5d4eRWPOQO5I0ePLChAzBryn+cf0oG6XtZC50ENv4Vvbqdlvp9BNlDreJ
	 9ud+scu/peboLP3cO+uEmzfJYhlOyTwujHIUs8CNBCR6wnoEv3UwM/+cwy+rjQlM5kSld
	 iEaQF/YRxJxE+QolgDtuda8F5RtHiC3SpOGp2kiX70UeWCZqUR7YoJOG6ykKOoxwtQ0Ur
	 L61/NFN5RmpXy56KbbRsjuqt7FnRrOuoc9604GOJrILDDniO3AcJmD0Nc2+N0c1ZZBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679984;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0lY1GjQDtOJ1Ghfc+ekV9fPNpqkpj9VqcnSoAi5vtPs=;
	b=oe7w+r52o8EHlIe256e12bsCoFqTTHdD4S6hHbEYDrQ6VXzKnMEJRcNRLgLjWNgQzXjR
	 nZx20DS2b1MAePcZ8cyPqZy2nRR47hA3p0gA5PJKjIF2bg5C9nemu+cLW3QJK4CAsY41F
	 2+7nLKjCBV3CtsjhG5IrUA1cGnf1IZ7wZwD3zXvZF1KvtfI2t+4iKvPcw6ZVzIGwYlPBU
	 1sCcsoNCDXwV1M1D8H9Y8WqfnQUZME+tszybuUs/LAo3ScwjMd9xUNXCEsYBjzjlLAb5B
	 AKqJRZwKG1P0GImzyQ0QjwSXZA84sMspuLlp8zQR3lB8kmvLL4d482PXqin113d6tlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+04q5Wc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA493606A336
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 04:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+04q5Wc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BCE1F00A18;
	Tue,  3 Nov 2026 04:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793679983;
	bh=0lY1GjQDtOJ1Ghfc+ekV9fPNpqkpj9VqcnSoAi5vtPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+04q5WcUn/F+T1jTPKPYV5E1nspIQzHaJvFcRxRR3Cb2tzHMu5s8pr6eBR9weOUf
	 XrhBM+Bi4qhRJ+xq5T7TQvLsoLydXAuni93aJSuZpnRBPkXPJLfW18fIFts8FU2Y9k
	 FSjavUzS2At5UKJjQJn30TPGTitvihluywSTaTQj7W7+H7i2UkmVzdW3orJdcDw2Il
	 DVU/94zMaJAk3GmIcqkiasI5fQrs6aJ/1fPxXrDO0REsiDnFk4ZBStGCJAv6Ua3lBP
	 i/3yheV0VaRluvS4SDyx9ltpNWryJ0HPw0SRoVYCdhRhJyzXq5cwECqm/b6H4Gs42y
	 gVObDIxFS1L7w==
Message-ID: <sashiko-outbox-194564@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] usb: typec: Add onsemi FUSB15201 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103041806.1885974-3-shengchao.guo@oss.qualcomm.com>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
 <20261103041806.1885974-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 04:26:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The FUSB15201 is a dual-port USB Type-C and Power Delivery controller
> which runs the Type-C state machine and the PD policy engine on an
> integrated microcontroller. The host only observes the resulting state
> and may ask for role swaps, so this is a plain Type-C class driver
> rather than a TCPC driven by the Type-C Port Manager.
>=20
> Register a Type-C port for each connector described in firmware, report
> attach and detach, orientation, power and data roles and the PD
> capability of the partner, and drive the USB role switch of the attached
> USB controller so that OTG role switching works. Data and power role
> swaps requested through sysfs are forwarded to the controller, which
> performs them asynchronously and reports the outcome as a port status
> interrupt.
>=20
> The controller exposes a per-port VBUS ADC reading, but the Type-C class
> has no VBUS attribute and nothing needs the value, so it is not read.
> PD messages, PDOs and alternate modes are not exposed by the hardware at
> all. The chip-wide MASTER_RESET command would drop both ports at once
> and has no caller, so it is left alone as well.
>=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103041806.1885=
974-1-shengchao.guo@oss.qualcomm.com?part=3D2

