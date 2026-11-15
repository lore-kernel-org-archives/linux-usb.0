Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794734845;
	b=26DIO+HK+RMTwY7hlZ5hzqbL7lbjqG/WF7OHN2XpstRV4IsWhwQ5lbu7oA6y/sMUVStK
	 /dkkzpZXAV7yzVQqQ+7WDz52KBW75HyVcLc4KM49KxJPB6QD0UHQRr1iuNZvvs26OwhX5
	 oD2Oc/ek7vX8MqTuyuwaNBjU7hFfvhf9v/I1LMsw/9XPwpDfmrS/7yIoYLNqCLBJ3Zfwo
	 GzteARut0J/6Z8VjlUXyzfpQnHbxlDzk8ZqxRJYhckmJ5jn4P2D6Ih1oA1fSrmcxRhr92
	 2XtzZopByeF2bkZ+bOY7FY5AdKeqZsR5tY3Hepy1Qo9eo8fEO0mgxRuIsVhrxWMFM0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794734845;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W17zqz61FvynEh+DK/gx8buxxuah/xJZZsWyf7E6XO4=;
	b=Nt3pgBwPUBnWgKRIegsewVAIenYO7MPqeIsfrSb9KDEbEeqcWO9oPQdr9W2SboC+VVPY
	 e2qlPl11SEhk9ct7cz/VJaGi8eCLM7nRsVtjJ+3pN3pdqLs+LBrgTfupjpEf+1VSAZwOZ
	 D33/Txl2q6v8oYoxPGDPusleopoTQHKRAvFiZAzMNPVqNCarI1poDdU5PGEt2DWsfwhNj
	 vKyTXUfQeq9Hv9EEAqqLMOWIJhLUU3VRL068zK4IUqutSv2qrpRhTXiwZZTZaeQWnZwhX
	 b6bFs0l9hibG5GioBaLlCktIWcMN7F7bCELUoTbYND1K+PyPl6ygDMeFtT1pIuYngGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnDRgV8Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9F7606A31A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XnDRgV8Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0B71F000C4;
	Sun, 15 Nov 2026 09:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794734844;
	bh=W17zqz61FvynEh+DK/gx8buxxuah/xJZZsWyf7E6XO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XnDRgV8Z7Df/XxAK3n7TWTYftKCgslMP9NZY+H7AvqnZYfX6lM4GS0+pvzzrOGe+G
	 dzpv8/QWROEQT5OL3ptparVk3Dd650ODpqlM8/qQxK7PFPvpvaQ7MXshJZyPMch0iB
	 tvVxyDk7eTPtzSnUZDCJpjCKe7ugDeX+0F8yTD70nBdbk8xfZ4gmXkNoZTxuGS52ks
	 LeB9RepcMaxONFmLegucTrCirXLS7WBu1DlWIhz40mAMTwKjlBFtd1FIw8/wpIEbW0
	 exe4pD51AgLZlno4LgZYNTlP6cxi5Di0W2TrqNDcK3zd3sJFNpWz0+EE3txgnPJXq6
	 h9dY4UMCOH4pw==
Message-ID: <sashiko-outbox-215365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] usb: hub: Retry SuperSpeed for a device stuck on
 its USB 2.0 peer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261115-usb-port-pairing-v4-2-25d3c9adcc21@gmail.com>
References: <20261115-usb-port-pairing-v4-0-25d3c9adcc21@gmail.com>
 <20261115-usb-port-pairing-v4-2-25d3c9adcc21@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:27:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] usb: hub: unnotified and unlocked port reset in
  hub_reset_peer_child()
- [Medium] usb: hub: wrong peer disconnect on status error in
  hub_reset_peer_child()
- [Medium] usb: hub: concurrent SuperSpeed enumeration before USB 2.0
  peer disconnect
--

commit 86b9ce000f28b25e9610cbbbb687f6dd87200f35
Author: Arun Iyengar <aiyengar1990@gmail.com>

usb: hub: Retry SuperSpeed for a device stuck on its USB 2.0 peer

When a SuperSpeed root hub starts, this commit queues work to reset any
SuperSpeed-capable non-hub device attached at high speed on a USB 2.0 peer
port from a different controller, disconnecting the USB 2.0 port if the
device appears on the SuperSpeed port or restoring it with
usb_reset_device() otherwise.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 199d3f535a891..b56ee90e55f0f 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c

[ ... ]

> @@ -3278,6 +3289,127 @@ static void usb_unlock_port(struct usb_port *port=
_dev)
>  	__release(&port_dev->status_lock);
>  }
> =20
> +static void hub_reset_peer_child(struct usb_hub *hub, int port1,
> +				 struct usb_device *peer_hdev, int peer_port1)
> +{
> +	struct usb_hub *peer_hub;
> +	struct usb_device *udev;
> +
> +	usb_lock_device(peer_hdev);
> +	if (hub->quiescing)
> +		goto out;
> +	peer_hub =3D usb_hub_to_struct_hub(peer_hdev);
> +	if (!peer_hub || peer_port1 > peer_hdev->maxchild)
> +		goto out;
> +
> +	udev =3D peer_hub->ports[peer_port1 - 1]->child;
> +	if (!udev || udev->speed !=3D USB_SPEED_HIGH)
> +		goto out;
> +
> +	if (udev->descriptor.bDeviceClass =3D=3D USB_CLASS_HUB)
> +		goto out;
> +
> +	usb_lock_device(udev);
> +	if (udev->state !=3D USB_STATE_NOTATTACHED &&
> +	    udev->bos && udev->bos->ss_cap &&
> +	    usb_autoresume_device(udev) =3D=3D 0) {
> +		struct usb_port *port_dev =3D peer_hub->ports[peer_port1 - 1];
> +		u16 portstatus, portchange;
> +		int i, ret;
> +
> +		dev_info(&udev->dev,
> +			 "SuperSpeed peer port available, resetting\n");
> +		/* A second reset hands the EHCI port to its companion */
> +		usb_lock_port(port_dev);
> +		ret =3D hub_port_reset(peer_hub, peer_port1, NULL,
> +				     HUB_ROOT_RESET_TIME, false);

[Severity: High]
When a SuperSpeed-capable device stays on the USB 2.0 port (for example,
when attached through a USB 2.0 cable or when SuperSpeed link training
fails), does calling hub_port_reset() directly here leave the physical
device enabled at USB address 0 for a full second without holding
address0_mutex or notifying bound interface drivers?

Unlike usb_reset_device() -> usb_reset_and_verify_device(), this reset does
not invoke driver pre_reset() callbacks, disable USB 2.0 hardware LPM, or
acquire bus_to_hcd(peer_hdev->bus)->address0_mutex, and passing NULL for
udev leaves udev->state as USB_STATE_CONFIGURED. While the loop below
sleeps for 1000 ms polling the SuperSpeed port:

- peer_port1 is enabled with the device responding to USB address 0, which
  can collide with concurrent enumeration on an external hub on the same
  USB 2.0 bus or a reset on another port of peer_hdev.
- Interface drivers on udev that were just woken by
  usb_autoresume_device() can submit URBs to udev->devnum while the
  hardware is unconfigured at address 0, failing with bus errors or timing
  out in error recovery (such as usb_lock_device_for_reset() while
  usb_lock_device(udev) is held for over a second).
- When usb_reset_device(udev) finally runs after the 1 s poll, any
  pre_reset() callback that communicates with the device will talk to
  hardware that has already been reset.

> +		for (i =3D 0; !ret && i < 20; i++) {
> +			msleep(50);
> +			ret =3D hub->quiescing ? -ENODEV :
> +				usb_hub_port_status(hub, port1, &portstatus,
> +						    &portchange);
> +			if (!ret && (portstatus & USB_PORT_STAT_CONNECTION))
> +				ret =3D -ENOTCONN;
> +		}
> +		if (ret)
> +			hub_port_logical_disconnect(peer_hub, peer_port1);

[Severity: Medium]
Can an error while polling the SuperSpeed port cause
hub_reset_peer_child() to disconnect the high-speed device on peer_hub?

If hub->quiescing becomes set (for instance during system suspend or HCD
unbind) or usb_hub_port_status(hub, port1, ...) returns an error while the
device is still attached at high speed on peer_port1, ret is overwritten
with a negative errno. The if (ret) check then calls
hub_port_logical_disconnect(peer_hub, peer_port1) and skips
usb_reset_device(udev), disconnecting the working USB 2.0 device instead
of restoring it. The same happens if the SuperSpeed port already had a
connection before peer_port1 was reset.

> +		/* Else hub_wq resets the port again */
> +		for (i =3D 0; ret =3D=3D -ENOTCONN && i < 20; i++) {
> +			if (usb_hub_port_status(peer_hub, peer_port1, &portstatus,
> +						&portchange) ||
> +			    !(portstatus & USB_PORT_STAT_CONNECTION))
> +				break;
> +			msleep(50);
> +		}
> +		usb_unlock_port(port_dev);
> +
> +		if (!ret)
> +			usb_reset_device(udev);
> +		usb_autosuspend_device(udev);
> +	}
> +	usb_unlock_device(udev);
> +out:
> +	usb_unlock_device(peer_hdev);
> +}

[Severity: Medium]
When the device does move to the SuperSpeed port, can it be enumerated and
bound on hub before the old high-speed udev is disconnected from peer_hub?

hub_reset_peer_child() holds usb_lock_device(peer_hdev) across the reset
and polling loops without locking the SuperSpeed port
hub->ports[port1 - 1], and hub_wq allows concurrent work items across ports
and hubs:

kworker/0 (peer_reset_work)       kworker/1 (hub->events)
hub_reset_peer_child()
  usb_lock_device(peer_hdev)
  hub_port_reset(peer_hub, ...)
    /* device moves to SS port */
    hub_port_wait_reset()
      /* sleeps up to 920 ms */
                                  hub_event() /* on SS hub */
                                    port_event(hub, port1)
                                      hub_port_connect_change()
                                        hub_port_connect()
                                          usb_new_device(ss_udev)
                                          /* binds SS drivers while old
                                           * HS udev is still bound */
  hub_port_logical_disconnect()
    kick_hub_wq(peer_hub)
  usb_unlock_device(peer_hdev)
                                  hub_event() /* on peer_hub */
                                    usb_lock_device(peer_hdev)
                                    usb_disconnect(&port_dev->child)

Because hub_port_wait_reset() only exits early when
USB_PORT_STAT_CONNECTION remains set, a device that drops its USB 2.0
connection during the reset causes hub_port_wait_reset() to poll until
HUB_RESET_TIMEOUT (920 ms) while holding usb_lock_device(peer_hdev). Even
after hub_port_logical_disconnect() kicks hub_wq for peer_hub, peer_hub's
hub_event() cannot acquire usb_lock_device(peer_hdev) to run
usb_disconnect() until hub_reset_peer_child() finishes, so both the old
high-speed usb_device and the new SuperSpeed usb_device for the same
hardware can be bound to drivers at the same time. Locking
hub->ports[port1 - 1] with usb_lock_port() during hub_reset_peer_child()
would prevent port_event() on the SuperSpeed hub from enumerating the new
device until the peer reset work completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-usb-port-p=
airing-v4-0-25d3c9adcc21@gmail.com?part=3D2
