Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595869;
	b=YpUYxyP9BilfHYJESJxYqQM0eBJxubFe2W38mTrFwtuwum4vtNOpsOHnMN9oJdsabW7C
	 6v2fpalmFf5gDrkGlaBHJqAmv4Ru5SmcJR9E/l1GspK6lK46B/zDcJWHR+2wFVjrmNhRi
	 ZAm20GEvOxUeVs9cNhFoSFkNgJA5l2jOICw3AjBirHAuYXlfJhdGly2GydgSzynXQvTs2
	 85GJ3zJigqju318fkjS9no9a4F/P/dH/opu91fpx6BAXFM+TrVspmL6GB8n7OSvi9q7ag
	 8oXxm8h7RGZnyfUntYqsU2DG1BiA/BQHzezItQGegSbZMhzU6aI3J1s08QTnri5cK1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595869;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HVS+ZL4iqoSWjBeVCN3K7FeKcm012ebeSOrLgQmN+Xo=;
	b=E2UU2LonLmc+1em+uw7Mlo5MRua+ofFOCWzHQiWAh2zzIt/Wr12SwAjSYZnwAD6zOJQa
	 BBkJ722YXUo6Fk/u0WT218FrDz3ffGobhCnUzETNmV3GnGncrpQZVMiBufQtsast2JvQD
	 hrZW7G8imXrEWkPlogLhudkZZXpv1gMp1TxstY6YqaWLpO7O4dBsovZ+wRanbqmdDNIcl
	 EF5lY1ljlMA501RsrtuWxjcJ4Wb+Rk7fHW6vMgaIybE3R1RJpxnFTprFdbaujKPHd/+G0
	 g83YHgxeduQ+kChynvSBtqGMrMLZu+EprGRURLOHupJ1DQLQ/edfmVBQ0xf3EMpL17A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DEPnD0+e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B13E606A31D
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DEPnD0+e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B4F1F000C2;
	Wed, 21 Oct 2026 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595868;
	bh=HVS+ZL4iqoSWjBeVCN3K7FeKcm012ebeSOrLgQmN+Xo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DEPnD0+etC1WpNueUDv91UpGpvoBrtz4iweJf9tJYvUwF5GTjkyyTHw4tyKQNiYKZ
	 aSfOlYQF5sJlOheSJkcBbr3xO1pt3RTiqlOkWWXpAAU2eJ2iPrIqEcUQF+dx/v68Kr
	 cZii0JM6ON4XIhumDvu1WZaOfe7dOUCN16mxrPQkNWKd6nGPgTLuXEcuXbL5PhrXh+
	 GS9n8Y3C5KOcxesTGLRD4Igjo2a4Zozbw9zGPuevBaGTruEup5ldt6oYo0D7BtDSCl
	 WaTARDjewhYNj3Vvtiy3nCGRQPfEg4QiUZq5vtZwBwsKSGOtyLcbYiFZpeu9UCoNUy
	 b7enqmVNw0Tzw==
Message-ID: <sashiko-outbox-180428@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] usbip: vhci_hcd: reject URBs from stale usb_device
 after port re-attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raul E Rangel" <rrangel@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021150704.3129446-7-rrangel@chromium.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
 <20261021150704.3129446-7-rrangel@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 15:17:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> After vhci_shutdown_connection() runs, event_handler() immediately
> calls vhci_device_reset(), setting vdev->ud.status to VDEV_ST_NULL and
> clearing vdev->udev before usb_hub_wq finishes running usb_disconnect()
> on the detached usb_device.
>=20
> If attach_store() attaches a new connection to the same rhport before
> usb_hub_wq disconnects the old usb_device, vdev->ud.tcp_socket becomes
> non-NULL and vdev->ud.status becomes VDEV_ST_NOTASSIGNED. Because
> vhci_urb_enqueue() maps urb->dev->portnum to vdev without verifying that
> urb->dev matches vdev->udev, URBs submitted on the old usb_device pass
> the connection state checks and get sent to the new remote device (or,
> if a concurrent USBDEVFS_RESET resets the old usb_device to address 0,
> overwrite vdev->udev).
>=20
> Serialize vdev->udev clearing in vhci_device_reset() under vhci->lock
> and ud->lock (dropping old usb_device and socket references outside the
> spinlocks in both vhci_device_reset() and vhci_urb_enqueue()), and
> reject URBs in vhci_urb_enqueue() when urb->dev !=3D vdev->udev and either
> usb_pipedevice(urb->pipe) !=3D 0 or urb->dev is already registered
> (device_is_registered(&urb->dev->dev)). During initial enumeration and
> PORT_INIT_TRIES retries in hub_port_connect(), each candidate usb_device
> is unregistered until usb_new_device() runs after hub_port_init() has
> assigned vdev->udev, whereas an already-registered usb_device resetting
> via usb_reset_device() is only valid when urb->dev =3D=3D vdev->udev.
>=20
> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Gemini
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021150704.3129=
446-1-rrangel@chromium.org?part=3D6

