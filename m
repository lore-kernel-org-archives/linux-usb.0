Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901292;
	b=hrkivmDheem386sGtAv+YnhAEVBilqHg0wYMGYTHfQeNqx0cfJXuOBI+cWpGlyAu81a+
	 JPysPXdi1aIjnzNRpK3RtY9qDRKd5oZnV4oPJN96A5qtOkZpsIE6++8V7x5Rv1Mph/q4l
	 qU6RdZ8E73jxSTyZLP6xtOPXyv1r7dOctQurzEY4zawQsQTicYOyXPrAY2AySn8uqyNgs
	 VTQU1cHXolauoU4e7PyjBeh/mQ080MrcAN50v7ZOk2TCk5m5eZYbzgLUHEzW28aZpQTpS
	 CN+zxEsguhNqIRK4RiKGm+MTn6Wl0jJlO/cUwY9uexuCsDRlT74Xxod1atIwoFv0tmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901292;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fldDNfFfvEY7u76RffbJMxccakX47dOujCBsrl3PXEU=;
	b=k9Lz0K8puysSzCAxxMXAzFOH6Q/4lY6G5ZNFzaOK002XFC0SqK6f8KFUWKUlYY3SyXu8
	 WiOoo3hUzcXtonycFydiGtidoUi+p/5B3fFeQXmR9fVJQ7kvtXK4Z0wf/f9NBXL1CSvPf
	 9MGgjg5znwgK4GoQ39wwjDWiG+Dha3GaLUvS4RUVDgxYD5cBDcCUn9Q1vTBbgp4P5iVGu
	 vgZsO/rDipLCQLUaZkwcIsX6cJ1YT3018gjbBlVZ6EhZ/6I6C4Sex2FjxXQXrXMt7NKGr
	 H6skuIWrcnxlClm5x38FdqLf8iHLvTTweqzwlHXery39E39mpz0p9eGUumLC2/5f6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrGcOWLy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1241606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WrGcOWLy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7201F000C1;
	Thu,  5 Nov 2026 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793901291;
	bh=fldDNfFfvEY7u76RffbJMxccakX47dOujCBsrl3PXEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WrGcOWLy3fe7OG3CYQD2KYMASpMmzu2RsR42bnuyoteG6hJySkp947HuW2dcEVGz+
	 8LVPfNG5FWhODQowWbSDoxjbtQOi5vv67UwiihJOGrBdy/ypLAGhIJ04XkWTRnS/M3
	 NmbLvEYFrNKyETot6EIebrg1tFwqzxOQXH21NRFlbYGPYJd4J97HkXSbst68i8/pfP
	 lZa/hgoELoEZYuryG743ZAyyRhSbfFqvuG31Pdw9TSGxo2XVpsxSxxUNhK2NOZiPbP
	 5DZ57yzQ9RCrQZaWyN0jF+mAcufPz69FzKP/DP7J1/BoA2crNxW8M5V73JtaWMnXin
	 l7l2RzAjwBbKw==
Message-ID: <sashiko-outbox-199669@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] usb: pci-quirks: always assert xHCI OS ownership
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105175106.241182-4-mathias.nyman@linux.intel.com>
References: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
 <20261105175106.241182-4-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:54:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Rishabh Jain <rishabh.jain1198@gmail.com>
>=20
> The xHCI ownership protocol requires the OS driver to assert the HC OS
> Owned semaphore before using the host controller, then wait for HC BIOS
> Owned to clear if firmware owns it.
>=20
> quirk_usb_handoff_xhci() currently asserts OS Owned only when BIOS Owned
> is already set. If firmware leaves BIOS Owned clear, Linux uses the xHC
> while both ownership semaphores remain clear.
>=20
> The timeout fallback also clears BIOS Owned using the original register
> value, which can clear OS Owned at the same time.
>=20
> On an AMD PROM21 xHCI controller (1022:43fc), this caused every S3
> resume to terminate Controller Restore State with USBSTS 0x401. Linux
> [ ... ]
> Tested-by: Quinn Schive <quinnschive@hotmail.com>
> Tested-by: Bruno Filipe <bmilreu@gmail.com>
> Tested-by: Maciej Zonski <me@zonni.pl>
> Signed-off-by: Rishabh Jain <rishabh.jain1198@gmail.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105175106.2411=
82-1-mathias.nyman@linux.intel.com?part=3D3

