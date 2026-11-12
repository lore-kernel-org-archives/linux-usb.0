Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473794;
	b=QbD1Jte4Gmvm6eAOyL4PemHjtraD3REA/y6yuR4py1cXo32J2VBXtqQ72k+LZx1vy8NW
	 +nYCVSxSXl33mHo7t7kBKcKh6nJKDvklAmtJKsYSF4pJ8qVMQ9DocoCWDRCz8Ar9z4QbO
	 QauJ0iu6jv9DfylF6onY2EeeE5cgqKxHYxeWDfGNdAdCzkJpTExRS5NW5Ywkuqql7SH4t
	 qBGvmPaAgYzo2Uybsk3d6BHU3u7pnX+AUFZ7BumXAwHIw67eRLeDCECM8aFde1vv58e84
	 FkjGvWUIMnU2XERof5ka8qt2OWLHa6gWuzKjcL/K2cc4pjIVvOKBpJcNG3+fABL522w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473794;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IaOMnr1aO923YtJvf271bAY1q6ifCmQQecnmnXCPTM0=;
	b=A6XauTnmqM//XHVOzfijOQlgf36bqymCkCa+FQSCeyK/AnH2Svv+Q3itLVic5FFlHnfS
	 nXZ/ix6pbok2VCStcYAmHqPhhA9czjFo7LIy41/Z/nbDasJsw43gbN0HcwPVuv/MIDr1T
	 6K1RL2R5+ZxnwCmsG8UhuK6w0wBVkP+MNgh+zyGGnBXCtsDopAo1/kqRewtE6Gz1Wrke1
	 CPt+ZboIS2U63f7oCyKWsDN0rgcpBAWYN3T0YdKYMzBR5BJ8WUs8PRa5A2hRrOAuP95ul
	 O/zsytcmb6NpxaXK2jK85bE1nCMpL25a0S2h6CC+cbfBee4aqhQfaXS9NVSAq/mKA9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4qI17nH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27021606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4qI17nH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84811F00A05;
	Thu, 12 Nov 2026 08:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473794;
	bh=IaOMnr1aO923YtJvf271bAY1q6ifCmQQecnmnXCPTM0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m4qI17nHh2UsNo5mtnJbkf4HR4dJGGoEPDPNMaj0olJKzgj6suO7H7WeGCBue6l0s
	 NNpUaF8Ck5u7JM/mnw3615kDtQQxZKOyOm+NnLva+vXIeBg50uFh+HA6GbG7QpNN5N
	 vYrf2kxHP7mA2ZUVaBoex3LFl9YNyw8JlFniAI442lNuth85N+RCKJ399pUZaNG1wp
	 T5ObXr1zHxKWrow3OrKupu3Tnr5D+wLZFJi5fskFlDlZp+H3NObiPpnUR2ENK1JA+c
	 g1IMjpYTeSq7Ia5cjSd/kNa/um32coe1/SQ2Ax/1RBv9tN4vg3Sx1Mqqp1ttQEakkd
	 VuQHFekdW476w==
Message-ID: <sashiko-outbox-210801@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 2/2] usb: dwc3: rockchip: Keep the host bus across
 suspend-to-idle on RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-dwc3-s2idle-optin-v1-2-842e3f8413d0@gmail.com>
References: <20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com>
 <20261112-dwc3-s2idle-optin-v1-2-842e3f8413d0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:56:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> On RK3588 nothing powers the USB3 controllers down in suspend-to-idle:
> this glue has no system sleep work of its own, the controllers are
> either in PD_USB, which has GENPD_FLAG_ACTIVE_WAKEUP and so stays on for
> a device on the awake path, or (USB3OTG2) in no power domain at all.
> Tearing the core down there only ends the power sessions of the
> suspended devices: on an Orange Pi 5 a SanDisk Extreme drive and a card
> reader behind a USB3 hub are disconnected and enumerated again after
> every resume, which kills a filesystem mounted on them.
>=20
> Set keep_host_bus_in_s2idle for RK3588, so the core keeps the suspended
> bus in suspend-to-idle. RK3576 is left as it is: its second controller
> is in PD_PHP, which is switched off in suspend-to-idle.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-dwc3-s2idl=
e-optin-v1-0-842e3f8413d0@gmail.com?part=3D2

