Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595788;
	b=L+hyebYIAdWHiaf4xr1WMWcd6rZ9cmPEsfjmkPSrM6lMmoIA1Q3lObo7HbItsc/DnxVx
	 2/NH56vUDObDyB61iq+l1lrDpzK0+DSVql9hZ4IMnQFdi6gz+9YmZ+TnOnWv2yOdN3g97
	 eZYe7j5cXlj+jLgCBY297G7euSQwg8Xfkc+wePq2jkEpD7QzavoXwCiukIdVPs8FPmDoY
	 t3wcJsL8NveDzyOFJdwmbV4CH0I77acT+214cenebA1S2Z6lNvHKZ+TV3BkHpA+GiOwrq
	 GHAARIW+RobUZnL46TLjo3ySqsft4J8xjGFJPUz8QGTiJymkfNgFRgGohKHcDHUx4vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595788;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SZB4zRvQ4bge2gShfQ9PW8cD7oJra2bb/hsNFyfeR88=;
	b=HEA8uCRde1JNLL9r8GidzamvdeeMK8h4bdvR2gVKv7ESKsf9qHFzTwVlP93FqALHw/Ex
	 4VpynCRNdyJ3bzuGr5S4n0CNvIgQhwAjUDiXGCgslLC8r/ZcZB/uz+4aEcMHHff5Eah0N
	 tIRr0QMt+6sKyzdPdZsAp4uYIqu8MQUvkohNqlrBbsnaby+iJ1r4Nctz6MW6X/X3j829q
	 Of9jX0UY4I4K6pXTmI7VLeBHUsDjZun2RwO5dCOMNoAX4WRSaEFo4Z46Q2NZ5FTxTNEB/
	 GHaJiPfpJSngbvIDVOOBeEUugzyDmF2FOb8J+uoLRnI5l/WnZIvYoT/jmVHjLHPExkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HayNdKD7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823DA606A33C
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HayNdKD7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69C21F000C1;
	Wed, 21 Oct 2026 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595788;
	bh=SZB4zRvQ4bge2gShfQ9PW8cD7oJra2bb/hsNFyfeR88=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HayNdKD7w59fvFi54P1TiD9xdFhDlqqJK9EW4kHRSHfOiubXb7B3xmXe9jwbnIw24
	 /9XVzbsRf0G+IGyrZ0bagRalRL+6EJ2zHLbUWHtC/2BY6c695kVC3utNgJnHcxypKQ
	 riGIcCaw6eGd4+oeMNm/pP4BsVs423ueyYqVS7T7PK77Tslbab2T0HQBAlD0qBRGfG
	 hwQmp7k97ABHUZ6ei4VIag2+DMLd0XBDOGOEsBzKJAX+bZqsRPS5wIBXOvVFieSI2t
	 mDmf+KxRixtKNU0Mh6gbBGEJhOrs01xRVFodvhLjFh/TxjHgEo8RxUomI9qrDovoQX
	 XpXEk7IjdRZ9g==
Message-ID: <sashiko-outbox-180427@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] usbip: vhci_hcd: allocate vhci_priv outside lock
 and handle ENOMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raul E Rangel" <rrangel@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021150704.3129446-6-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
 <20261021150704.3129446-6-rrangel@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 15:16:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In vhci_urb_enqueue(), usb_hcd_link_urb_to_ep() links the URB onto the
> endpoint before calling vhci_tx_urb(), which allocates struct vhci_priv
> with GFP_ATOMIC while holding vhci->lock. If that allocation fails,
> vhci_tx_urb() triggers VDEV_EVENT_ERROR_MALLOC and returns while
> vhci_urb_enqueue() still returns 0, leaving urb->hcpriv NULL and the URB
> linked on ep->urb_list where vhci_urb_dequeue() rejects it with -EIDRM.
> Moreover, failing a single URB submission should return -ENOMEM to the
> caller rather than tearing down the entire USB/IP connection.
>=20
> Allocate struct vhci_priv in vhci_urb_enqueue() using the caller's
> mem_flags before acquiring vhci->lock, pass it to vhci_tx_urb(), and
> free it on early-exit and non-transmit paths.
>=20
> In vhci_urb_dequeue(), if allocating struct vhci_unlink fails after
> usb_hcd_check_unlink_urb() has already marked urb->unlinked, return 0
> after triggering VDEV_EVENT_ERROR_MALLOC so callers know the unlink was
> accepted and connection teardown will drain priv_rx and give back the
> URB.
>=20
> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Gemini
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021150704.3129=
446-1-rrangel@chromium.org?part=3D5

