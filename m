Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589682;
	b=WcH/Lq2ahNEs79Ph4RulxILVhn4RmFwBaQTCWMb6mhKgeXzho4HiOT0W8aWFxM7jdNSk
	 g1goy4VpPI5SQFjzbPmqN9Z+2K4NGaT10tvDe/hJ28YIAqCTr9RyGQ7AtlD+b/Z4NlLnu
	 vDLQ35MEzjLQPOnfd5T8cFv/YSbgKHlCROeAmUwqUeYvTkZR8sF9w1oQnGAnfCWziDb9P
	 IDNpAu5PsP56O8trJaROIp0A5RNwLZiGV2eI4QDBz+KXNhnA6KdOJKvpJmHSzm0eG2WpI
	 LFe34YRUUvXqIO1mC6AXYi3vpeG2koZ3zQgQrsZ8nQ6kJJPDqdMo7SnZ9mOZvn8YslA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589682;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eCff2xNYMAkmauLpO2ibQZV4b31AjD27bamp1dc9ExE=;
	b=A3NCTK18E2jibeGWwLPTMoWG26Lda6TPcYGaOf0CNxUqXmdS3CbsnjG2A98NliLKduME
	 8Dw390nxdNL4p35x6LSRJobAVMXWVhJ+kuMahxTKPREf1+cSQ/TezywhSKErxf5Vt2nvB
	 5ZoVCRMcobMJOA83rz0I35PibxRNKRSTJyfZWuHEHsM6BDDyad5qzABhAUvjBXYcGXmfN
	 ymHRAXBqpwPIQS3nfiw94AjM/YdqylVxIGL+Ys6x43+3QBA1xK1MSUegO9I7LL8GeqsrZ
	 1M6apwIVSc4yFQEiaUznOHP57wsHePdgetODtk1ptH16P1JoShwbiOFGbb7ASRblE5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oQ8e4RNy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD8606A330
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 17:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oQ8e4RNy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51881F000C4;
	Fri, 13 Nov 2026 17:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794589681;
	bh=eCff2xNYMAkmauLpO2ibQZV4b31AjD27bamp1dc9ExE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oQ8e4RNySzHQb1FJdszih07B46l7cbUjTc4JuOuCrhYd/6KKyHBVrQ1AJnSi9bRcK
	 csJMApPNtACtgSnmfpNgn3uy009vaWUVcbRbBqWFMQeTVGans4IKxD70nDrAZ0Wz+0
	 Fhhu8hDmj85lWAUEF/ELkML7qBrMzCuqYL4bIMqxDHE1kf7QRW0zX6w7y2yCnkwiOO
	 N5tPGZACvS0Xw/bA/WZTIH9ELZDiLxanWZzsMu/Pz7JS8M8n/JGDCWVKruh5mzDh9k
	 A0OLeNJfWFy10y+KdhUuaHCTJlWxxdZdIc49jf5ensQm4h97u4E3dnOdjU+Fk/jh87
	 I4AX5OO+q0GTA==
Message-ID: <sashiko-outbox-213277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] usb: hub: Retry SuperSpeed for a device stuck on
 its USB 2.0 peer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-usb-port-pairing-v3-2-d6c6edb4341c@gmail.com>
References: <20261113-usb-port-pairing-v3-0-d6c6edb4341c@gmail.com>
 <20261113-usb-port-pairing-v3-2-d6c6edb4341c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:08:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: hub: hub_peer_reset_work() ignores quiescing state during
  teardown
--

commit 292ab4e7add6e385ccf460779fb12521a3d0b6e7
Author: Arun Iyengar <aiyengar1990@gmail.com>

usb: hub: Retry SuperSpeed for a device stuck on its USB 2.0 peer

This commit schedules work when a SuperSpeed root hub initializes to reset
any SuperSpeed-capable device connected at high speed to a peer USB 2.0
root hub port on another host controller so it can reconnect at
SuperSpeed.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 199d3f535a891..6bbe5fe2c0b52 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1076,6 +1076,105 @@ int usb_remove_device(struct usb_device *udev)
>  	return 0;
>  }
> =20
> +/*
> + * A device present at boot may have connected at high speed to the USB =
2.0
> + * peer before this SuperSpeed root hub was up; a USB 2.0 reset makes it=
 retry.
> + */
> +static void hub_reset_peer_child(struct usb_device *peer_hdev, int peer_=
port1)
> +{
> +	struct usb_hub *peer_hub;
> +	struct usb_device *udev;
> +
> +	/* Wait for an enumeration in progress on the peer port to finish */
> +	usb_lock_device(peer_hdev);
> +	peer_hub =3D usb_hub_to_struct_hub(peer_hdev);
> +	if (!peer_hub || peer_port1 > peer_hdev->maxchild)
> +		goto out;
> +
> +	udev =3D peer_hub->ports[peer_port1 - 1]->child;
> +	if (!udev || udev->speed !=3D USB_SPEED_HIGH)
> +		goto out;
> +
> +	/*
> +	 * The USB 2.0 half of a USB 3 hub stays at high speed next to its
> +	 * SuperSpeed half, and resetting it would disconnect its children.
> +	 */
> +	if (udev->descriptor.bDeviceClass =3D=3D USB_CLASS_HUB)
> +		goto out;
> +
> +	usb_lock_device(udev);
> +	if (udev->state !=3D USB_STATE_NOTATTACHED &&
> +	    udev->bos && udev->bos->ss_cap) {
> +		dev_info(&udev->dev,
> +			 "SuperSpeed peer port available, resetting\n");
> +		usb_reset_device(udev);
> +	}
> +	usb_unlock_device(udev);
> +out:
> +	usb_unlock_device(peer_hdev);
> +}
> +
> +static void hub_peer_reset_work(struct work_struct *ws)
> +{
> +	struct usb_hub *hub =3D container_of(ws, struct usb_hub, peer_reset_wor=
k);
> +	struct usb_device *hdev =3D hub->hdev;
> +	int port1;
> +
> +	for (port1 =3D 1; ; port1++) {
> +		struct usb_device *peer_hdev =3D NULL;
> +		struct usb_port *port_dev;
> +		int peer_port1 =3D 0;
> +
> +		mutex_lock(&usb_port_peer_mutex);
> +		if (port1 > hdev->maxchild) {
> +			mutex_unlock(&usb_port_peer_mutex);
> +			break;
> +		}
> +		port_dev =3D hub->ports[port1 - 1];
> +		if (port_dev->connector_peer && port_dev->peer) {
> +			peer_hdev =3D to_usb_device(port_dev->peer->dev.parent->parent);
> +			peer_port1 =3D port_dev->peer->portnum;
> +			/* Only root hub ports of another host controller */
> +			if (peer_hdev->parent ||
> +			    peer_hdev->bus->controller =3D=3D hdev->bus->controller)
> +				peer_hdev =3D NULL;
> +			else
> +				usb_get_dev(peer_hdev);
> +		}
> +		mutex_unlock(&usb_port_peer_mutex);
> +
> +		if (peer_hdev) {
> +			hub_reset_peer_child(peer_hdev, peer_port1);
> +			usb_put_dev(peer_hdev);
> +		}
> +	}

[Severity: Low]
Should hub_peer_reset_work() and hub_reset_peer_child() check
hub->quiescing?

hub_disconnect() only zeroes hdev->maxchild under usb_port_peer_mutex
after hub_quiesce() has finished waiting in
cancel_work_sync(&hub->peer_reset_work).  If the SuperSpeed root hub is
quiesced or disconnected while hub_peer_reset_work() is running (for
instance, while hub_reset_peer_child() is blocked on
usb_lock_device(peer_hdev) waiting for USB 2.0 enumeration to finish), the
work item will still reset the USB 2.0 peer devices across all remaining
ports to migrate them toward a SuperSpeed root hub that is being torn
down.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-usb-port-p=
airing-v3-0-d6c6edb4341c@gmail.com?part=3D2
