Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758207;
	b=4oH3XeIVl64S9WqMW6StrqUiwAc7Bv31bnxmStJg66zsw2HPWTgVCTjQAbYt/CfZaBAF
	 atLG3yB8fiODQKgCBT+nADXyI5D4Vuz28OkLkvqdRkAsmGtMQx6uSDTeuXEKvG1qZ7TK7
	 EThQ3Xj9JjKnbuRrSWdkwbjYT9CXBtx2d9b0IZwvNjFL4hVF2O24DwSzeBGvN2EcGWoyr
	 7LL0cg3Ss3vQLXmaujtQcXFlKuUknUlWIqFVoeZs9ZHgyfnF0rRz3+eEbAgnypta6TMOe
	 P/kvH61oQ4MGyaW7MCq8Ls8JDcBxSQBLulqk6FqUheq0W5UZ5acDp+ZSIHWQt4kSlfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758207;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xQSSHoTvfl2ldokarCe4aWu+kVsbJMrp4v3+22LK8ys=;
	b=GM5Bn3bzXunjERYTznZlJTIxekdGP5HH4DD8PL+LbAY/MoVwz1imLrY5E+Gbg3YXf9P3
	 e35jrFyvtFgLbPR9HX0j9C4ZXGDzrM9sI1pQi5g9PKzMInnbnc1mD00o/yo8YFn5HTl0W
	 FkxnNFdh8qFOd4uy2KRe2raNznwvD20BcDohJwjWlFs7SVMSF7fGgH2myOoTX/v13aGP4
	 SP2tueifaVxK5gcCoL2Nf1ZE2LpxQ9ZfhblGEoPikk6xuFQhjT5Ku+zE07cPC76A8Xj3Q
	 X4DXHyDWJtYow757XvdNlgnfNOiq2vlxDkRPdU3zbT0kUYLSM0oUNEYHJtpO1qlfk3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbxxFbyT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848CE606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbxxFbyT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6461F01825;
	Fri, 23 Oct 2026 12:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758207;
	bh=xQSSHoTvfl2ldokarCe4aWu+kVsbJMrp4v3+22LK8ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NbxxFbyT26Obbp4nfMjEWwQYd4HD911NhzT4qPohs12T+nqiE8Pup6mX1v9P0x81H
	 PxRbFCkr5KWPO9v3mfeePTCAGo7sMBd3NZS7vWA7z6KL4j+IiEgDSuJl2NvOO/o2p4
	 z5hk9fNaRTaFE+CvIc6WZASGuUUcYj2g7tG7WPxFUNTijQgzA894UcwAUIQzFQA/4I
	 OnMLTUK15juutJKWSATQ/tbMvmkTOJK6UCdU8qFR9lSYqJuLrsqneGFAkYHRQi/9Fa
	 AHxNeEp/RyQSGP34lX+89cRgN1iJZWyyNbdqZIQxJ4/F43jVl4XckaCJt1s+2kQyQu
	 xkbDBh2lazNJA==
Message-ID: <sashiko-outbox-182756@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: f_ecm: do not notify from
 ecm_set_alt()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Massimo Toscanelli" <massimo.toscanelli@leica-geosystems.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023-ncm-ecm-lpm-v1-2-d01e81fbf460@leica-geosystems.com>
References: <20261023-ncm-ecm-lpm-v1-0-d01e81fbf460@leica-geosystems.com>
 <20261023-ncm-ecm-lpm-v1-2-d01e81fbf460@leica-geosystems.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:23:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.com>
>=20
> ecm_set_alt() calls ecm_notify() for both altsettings of the data
> interface. So a notification is already queued at SET_CONFIGURATION,
> when altsetting 0 is selected, and it waits until the host reads the
> interrupt endpoint.
>=20
> The USB 2.0 LPM ECN (section 2.2.2) lets a device answer NYET to an LPM
> request when it has data pending for the host, and DWC3 does so. So
> when the host loads no class driver, the device never enters L1.
>=20
> For altsetting 1 the call is not needed: gether_connect() already
> calls ecm_open() or ecm_close(), and both notify. The extra call only
> restarts the sequence while the first notification is in flight, so
> the host gets two connection notifications before the speed one. The
> removed comment calls this a minor disagreement with the ECM spec.
>=20
> Remove the call and the comment.
>=20
> Fixes: da741b8c56d6 ("usb ethernet gadget: split CDC Ethernet function")
> Signed-off-by: Massimo Toscanelli <massimo.toscanelli@leica-geosystems.co=
m>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-ncm-ecm-lp=
m-v1-0-d01e81fbf460@leica-geosystems.com?part=3D2

