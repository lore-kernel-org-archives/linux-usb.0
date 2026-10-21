Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595667;
	b=sj0hGenilRygwbySn4KBOifjPrs3Cy1E/c1XJ2llYAMSpPNMS0uOils48q6+9e1QH+gm
	 k3krrjbnbS/O/Rt1s5F0CaTrY8uXFFhjeHLW0nPjqUwgGO1eY4Nhj4U6qB5hXYzVC6v0j
	 0Tz9JRWOnu0vftKKdibGChczpjcYJjQpeQg5aFii3kPRP0rqQj3YZHM1gBRkkgrBkrnAe
	 nR/kJ/fVST/+/8tp/kwtQb9ResT39CuOBUXzEFhhUwo0Q2yOSqr+UWzz8AlVH60rfw7jy
	 333UV9Mp5Z8YxGkYP2724MgOnZZiXvVPh6pW20WP7/CwvaG3jHWGSLyKH0ELTZT0+bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595667;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/+ymJVgmK2lWS0ie4qjPtx5XDG+4gCRcdMw+8F73KuA=;
	b=sh82RWjgNuJuY4dOw1qBs4N4yZlM7lteKpD80yoSSRs9cWTn9LzOtYdIfBkWDUHDowZ2
	 zFgRtoj2mHXRuf2rUMsts/lc+V3IKsgjDVfgZ27sxf+6iJ64WnLdJ8yxcj7ipXxt9lMTp
	 o86ZCtqTjx4RjaOvEUOTrEvRhYh0DcCVazI1LIKoTiPlusjrSbOp7usNyHyPAVKlTcOy4
	 OTgZALyY7UnNWkNzn2HOzVSnYIj7Zmt7HOVWIV7UKix3m1kLreZWg8PxfvA1NakEK9nTd
	 0DPz8MK/XzVbUE+L1Q9P54KcivsXRmXwp4jKEDTAMOQ0AnRm4QhCzHPnbpVp/ACHL8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O1JxWp/k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7880606A31B
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O1JxWp/k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6464E1F000C1;
	Wed, 21 Oct 2026 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595666;
	bh=/+ymJVgmK2lWS0ie4qjPtx5XDG+4gCRcdMw+8F73KuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O1JxWp/kFvl3c8RxRXHeJi9AAGLI7BXRJL6dQi5bAv7hBxDjOs/09kWgNzE5HZYxM
	 Ha4uRAvgktjq7Pqy4Lbt95gFpi0+hwse5cwAU114vUPq0xndgBJhXSavoK/TfqsKDM
	 udQApThUBP6SUL1am06dywXV2Vd0O7DmH3RhD2yMdCOexfvgwm+lpOGIMMquX1pMix
	 YMVQkS1uQcr/JIWKOmrOJpvQKF587kWFLtJ0Zr0AhVBne52QGqciQUvU97SiGnMCiO
	 f0KbrFAB0XfxaFHxkZVeVmHmECVAmzhFiQEUsEscoiUVdoea3yPmJpRPY6BEdzjFN0
	 OTw9LbiM3yrcQ==
Message-ID: <sashiko-outbox-180423@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] usbip: vhci_hcd: complete unsent URBs locally in
 vhci_urb_dequeue()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raul E Rangel" <rrangel@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021150704.3129446-3-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
 <20261021150704.3129446-3-rrangel@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 15:14:26 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When an URB is enqueued via vhci_urb_enqueue(), its vhci_priv entry is
> placed on vdev->priv_tx until vhci_tx_loop() moves it to vdev->priv_rx
> in dequeue_from_priv_tx() and sends USBIP_CMD_SUBMIT.
>=20
> If vhci_urb_dequeue() is called while the URB is still on vdev->priv_tx
> and vdev->ud.tcp_socket is non-NULL, vhci_urb_dequeue() currently sets
> urb->unlinked and queues a vhci_unlink entry on vdev->unlink_tx without
> removing the URB from vdev->priv_tx. This causes two bugs:
>=20
> 1. If vhci_tx_loop() has already exited after an earlier send error or
>    been stopped during connection shutdown before tcp_socket is cleared,
>    the URB remains on vdev->priv_tx. When vhci_device_unlink_cleanup()
>    later runs pickup_urb_and_free_priv(), which only searches
>    vdev->priv_rx, the vhci_unlink entry is freed while the URB remains
>    linked on ep->urb_list with urb->unlinked set. Subsequent calls to
> [ ... ]
> Fixes: 258c81b341c8 ("usbip: give back URBs for unsent unlink requests du=
ring cleanup")
> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Gemini
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021150704.3129=
446-1-rrangel@chromium.org?part=3D2

