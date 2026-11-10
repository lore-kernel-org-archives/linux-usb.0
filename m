Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299145;
	b=Y/anC8h77N+Pr/LpW2++ujQbrI4p+bqFZlZgzSg5sSt4AA0EvyL56Disy2C29LNQ1uy1
	 qJXc8gwY+uoGYkixYPvwkSX9I/KUBXXELw718mWNXjGI47hquxDvEVyvJ+aEXfcMvCvW8
	 Q9F1slyu7CesrqC72OLPW4fhG0ICpDtv9LqORTXK5o8Xlri9HLr+qD6dI8nHtmY94iZir
	 cUGdQU1Br2Wgw5c3KNse2jB9NjJJ7WPV87UQz4LzmkFAnl+bsQHr6FbAKDNiLbiQ3LKBN
	 tUZwEv6usRYLw6A2ucr2y6w3LPOxlQuNFwCPXQHpoxbkRqlNKKDUnN5MHGey2ZC+FxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299145;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AQAAmgkAJ2N7z6or5zK/Wmjvv/xT0bZlGZgV3QvIlJg=;
	b=mBCa7feOvi49olHWCB+UNhHi26kE3PvlOaqRElsEHO3/BjOLYZyFTBprqsvm92spM1yP
	 PzjqWZgP+yoDxUUXKc1A6jI8XdHFhBGYcFvnt4doo5F5gNXHzZxTNSLsHvsc1RIeajBOb
	 /6HNxG6gEIo9SiyUxGCCLgWiDQfSqL42AcnzTmFOZCR7SbUxZUb3iOsUvKtUJXMNPHCKV
	 TKRscBlqnU8ahoemTKMcIOmk8uVZUpJZkbeJltfjURep8ac3QqPdh5MMGe2IRZJ+/8nZZ
	 pAI/0jtDtMr/XqaImLSljWDP0A2Ukiqm7prqgvNweC683KvQA9snpZTxaPsNOwhV2gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i6xSlQFv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEEC606CFA9;
	Tue, 10 Nov 2026 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i6xSlQFv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCA31F008A5;
	Tue, 10 Nov 2026 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794299145;
	bh=AQAAmgkAJ2N7z6or5zK/Wmjvv/xT0bZlGZgV3QvIlJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i6xSlQFv3u/gaeDf8Bn5BFIAcUeJRAnWPg7ZlyXisgslqVw83XB2YkxIkYXqYaKow
	 hE9nPxl9+z+njHc5ReP4Y4TPqqXEDfY9I9uSohgHmZBgWhun+8IFSu6iXuhyp1uESn
	 txH7o1secI/ddYvPTp7/+5oK9hAc498iSRNhH+olmdri/vQerMk4ue36tNYDP2RHzB
	 Er+RtSdCfK3wDQ7TV266Ck5ZBo9HFBmDtlLHbUPjzOgZ/qFiqYFZCHJR3m1jD3+RXu
	 OpFXXmRITUoV3zrClDQFEVm+kFqUE53ifxyJcnoZSya/rrQxPSv1g1xUOn3CRSlEmW
	 dNp1rH8JF6v5A==
Message-ID: <sashiko-outbox-206609@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] usb: hub: Retry SuperSpeed for a device stuck on
 its USB 2.0 peer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-usb-port-pairing-v1-3-9307e29d2ed2@gmail.com>
References: <20261110-usb-port-pairing-v1-0-9307e29d2ed2@gmail.com>
 <20261110-usb-port-pairing-v1-3-9307e29d2ed2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:25:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] usb: hub: hub_reset_peer_child() resets external USB 3.0 hub
  USB 2.0 half
- [High] usb: hub: hub_reset_peer_child() resets suspended peer on
  HUB_RESET_RESUME
- [Medium] usb: hub: peer_reset_work not canceled in hub_quiesce() or
  hub_disconnect()
- [Medium] usb: hub: missing runtime PM reference in
  hub_queue_peer_reset()
--

commit 764ab1aa27d71134800c09ef7673211be6ab0bc2
Author: Arun Iyengar <aiyengar1990@gmail.com>

usb: hub: Retry SuperSpeed for a device stuck on its USB 2.0 peer

This commit queues a work item when a SuperSpeed hub activates to check
connector-paired USB 2.0 peer ports and reset any SuperSpeed-capable
device connected at high speed so it can re-enumerate at SuperSpeed.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 199d3f535a891..df88de5bbf54d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1076,6 +1076,89 @@ int usb_remove_device(struct usb_device *udev)
>  	return 0;
>  }
> =20
> +/*
> + * A SuperSpeed port paired through a connector with a port of another h=
ost
> + * controller can start after a SuperSpeed-capable device has connected =
at
> + * high speed on that peer: with VBUS always on, the device looks for a
> + * SuperSpeed link while the SuperSpeed host is still down, gives up, and
> + * connects at high speed. It only tries SuperSpeed again after VBUS is =
cycled
> + * or after a USB 2.0 bus reset, so reset it now that the link can train.
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

[Severity: High]
Does hub_reset_peer_child() reset the USB 2.0 half of an external USB 3.x
hub and disconnect all of its downstream USB 1.1/2.0 devices?

An external USB 3.x hub contains both a SuperSpeed hub and a separate
high-speed USB 2.0 hub wired in parallel.  The USB 2.0 hub enumerates on
peer_hdev at USB_SPEED_HIGH and advertises udev->bos->ss_cap in its BOS
descriptor, but it stays on the USB 2.0 bus permanently alongside the
SuperSpeed hub rather than migrating on reset.  Because neither
udev->descriptor.bDeviceClass =3D=3D USB_CLASS_HUB nor port_dev->child is
checked, calling usb_reset_device(udev) runs hub_pre_reset() ->
hub_quiesce(hub, HUB_PRE_RESET), which calls usb_disconnect() on every
child attached to the external USB 2.0 hub.

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
> +			usb_get_dev(peer_hdev);
> +		}
> +		mutex_unlock(&usb_port_peer_mutex);
> +
> +		if (peer_hdev) {
> +			hub_reset_peer_child(peer_hdev, peer_port1);
> +			usb_put_dev(peer_hdev);
> +		}
> +	}
> +
> +	hub_put(hub);
> +}

[Severity: Medium]
Should hub_quiesce() cancel or flush hub->peer_reset_work, and should
hub_peer_reset_work() stop when hub->quiescing or hub->disconnected is
set?

Unlike hub->post_resume_work, hub->leds and hub->tt.clear_work,
hub->peer_reset_work is never canceled or flushed in hub_quiesce() or
hub_disconnect().  If the SuperSpeed hub is suspended, reset or
disconnected while hub->peer_reset_work is pending or running, the work
continues and resets the USB 2.0 peer device while the SuperSpeed hub is
no longer active to accept the connection, and usb_hub_cleanup() can
return from usb_deregister(&hub_driver) while hub->peer_reset_work is
still running on system_power_efficient_wq.

> +
> +static void hub_queue_peer_reset(struct usb_hub *hub)
> +{
> +	int port1;
> +
> +	for (port1 =3D 1; port1 <=3D hub->hdev->maxchild; port1++) {
> +		if (hub->ports[port1 - 1]->connector_peer) {
> +			hub_get(hub);
> +			if (!queue_work(system_power_efficient_wq,
> +					&hub->peer_reset_work))
> +				hub_put(hub);
> +			return;
> +		}
> +	}
> +}

[Severity: Medium]
Can the SuperSpeed hub autosuspend before hub_peer_reset_work() finishes
resetting the peer device?

hub_probe() sets a 0 ms autosuspend delay and enables
pm_suspend_ignore_children() on the hub interface.  When the device is
stuck on the USB 2.0 peer, the SuperSpeed hub has no attached children,
and hub_activate() drops its HUB_INIT2/HUB_INIT3 runtime PM reference
immediately after calling hub_queue_peer_reset().  Because
hub_queue_peer_reset() does not take an interface runtime PM reference
(unlike kick_hub_wq() and the HUB_RESUME path), the SuperSpeed hub and
bus can runtime-suspend while hub_peer_reset_work() is waiting on
usb_lock_device(peer_hdev) or resetting udev, preventing the SuperSpeed
link from training.

[ ... ]

> @@ -1346,6 +1429,10 @@ static void hub_activate(struct usb_hub *hub, enum=
 hub_activation_type type)
> =20
>  	/* Scan all ports that need attention */
>  	kick_hub_wq(hub);
> +
> +	/* Let devices stuck at high speed on a connector peer move over */
> +	if (hub_is_superspeed(hdev) && type !=3D HUB_RESUME)
> +		hub_queue_peer_reset(hub);
>   abort:

[Severity: High]
During system resume (type =3D=3D HUB_RESET_RESUME), can hub_peer_reset_wor=
k()
run before the peer child device has resumed or before hub_wq has thawed?

system_power_efficient_wq is not freezable, so when hub_reset_resume() ->
hub_activate() queues hub->peer_reset_work during dpm_resume(), the work
can run while udev on the USB 2.0 peer port still has udev->state =3D=3D
USB_STATE_SUSPENDED and udev->can_submit =3D=3D 0.  hub_reset_peer_child()
only checks udev->state !=3D USB_STATE_NOTATTACHED and calls
usb_reset_device(udev), which runs drv->pre_reset() or
usb_forced_unbind_intf() on the suspended interfaces before
usb_reset_and_verify_device() fails with -EINVAL without resetting the
port or rebinding the drivers:

drivers/usb/core/hub.c:usb_reset_and_verify_device() {
	if (udev->state =3D=3D USB_STATE_NOTATTACHED ||
			udev->state =3D=3D USB_STATE_SUSPENDED) {
		dev_dbg(&udev->dev, "device reset not allowed in state %d\n",
				udev->state);
		return -EINVAL;
	}

Conversely, if the device fell back to the USB 2.0 peer during system
suspend/resume, hub_wq (which is WQ_FREEZABLE) has not thawed yet when
hub_peer_reset_work() runs, so peer_hub->ports[peer_port1 - 1]->child is
still NULL and the reset is missed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-usb-port-p=
airing-v1-0-9307e29d2ed2@gmail.com?part=3D3
