Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083781;
	b=A9Ic1qzru3J12rQ2twRL29t7II/LcFfSpoKiPWysFoA3+s5X69OlMUUs6m7qMbau7R5y
	 In8EIHCSVxcLfslQNWh5J7APGP2WnjiCA64wd3Siq3pOKfBjV0BVK5C4FXzmUMPfpcc6O
	 f6owPWWbqR0/Yh2tG9cNyGFcMP0SeR64ufUKuoxWLinWGHgbCez2WMKcSKI+q9IIItGuk
	 sSFFZedoZyO44XdPnAc/0BHiaWJWCTRR0Pz/51i6t5qUEbpIjehh43hAY8YC5WYsMPyBW
	 qOhHujX0Z/XhL/5pfGzn1lm0wsJebm52GfhUcJhxtfAq9lIsfViKYtfKqvI3+vS26ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083781;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ixbiff3Qkt8ycjSXAFjHjNRrqPrQ+zlrlnKO8MNO9FE=;
	b=t5lTuf4v/IabHZRJyOA799P2jY1LKtDPcqxnHOVJlkl56H8my50uIVkuZrL65Fd0+BdC
	 OvhbN7t0UfdRN7ENLwGjjA4Md6V4WY0jhc6pW+0Te7BB8GImPSMAR1dsLT9aFgN3uCNoY
	 55mMP9+1blI34Kfw4zthJjFtjndOxn7ywFIUPgBIX+VQ3vTqt1M+DjDlK+HuI9krDc3+M
	 PnQk95kd1aocOPZRhtXSq6DtPRpCb/cipzUa63W7q6VLXZWasongI/NtwwWv2/C3/7/q6
	 maZywv3R4Ct+Igb59QR8KeQJ0lzdyzksa74u1cwlYhX1DI2kbwAGHsEnapk1VioDeqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mJriHpjB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF65760A260C
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mJriHpjB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57481F000D0;
	Thu, 19 Nov 2026 10:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083780;
	bh=Ixbiff3Qkt8ycjSXAFjHjNRrqPrQ+zlrlnKO8MNO9FE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mJriHpjB/p5ir1eD/tUBKffUSslICEeNNW7HEvrCuaTzJg9WwE94j4zOut0Nt10az
	 tpF80TBTHJoc4gjzeZcr8Tyz4ESUubYBall2WgDOkbalWOtew+wKDnAS1h5jk4otEr
	 uqupunI1jEf0rgBqGIUiemvqOx9A8KoQ6a/lCs6kcPkBQraRLDbOBfXdsUtVCLmKWp
	 iC/Bys97a9DRi4a2s5mzzO2TnjcnJTv4JomlV36o7RG2hSzoEpWOBYgQ5d1JZvNDiL
	 DYIjJa2L+e0qya235TQPxO3sXOzQ4YuS7HdzEsA5pmwES3qTSJ/tW1ur7gWiZS9gFD
	 OK/hAiXc8esEA==
Message-ID: <sashiko-outbox-222947@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] usb: hub: Retry SuperSpeed for a device stuck on
 its USB 2.0 peer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-usb-port-pairing-v6-3-32bd7e36e426@gmail.com>
References: <20261119-usb-port-pairing-v6-0-32bd7e36e426@gmail.com>
 <20261119-usb-port-pairing-v6-3-32bd7e36e426@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:23:00 +0000
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
- [Medium] usb: hub: missing sync with peer hub init in
  hub_reset_peer_child()
--

commit 7d4ffb5084a3369e5c00127c3a48cf92988241d0
Author: Arun Iyengar <aiyengar1990@gmail.com>

usb: hub: Retry SuperSpeed for a device stuck on its USB 2.0 peer

When a SuperSpeed root hub starts, this commit resets the USB 2.0 peer
port of any SuperSpeed-capable device so that it can move to the
SuperSpeed port.

> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 199d3f535a891..65d0728d43306 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c

[ ... ]

> @@ -3278,6 +3289,116 @@ static void usb_unlock_port(struct usb_port *port=
_dev)
>  	__release(&port_dev->status_lock);
>  }
> =20
> +static void hub_reset_peer_child(struct usb_hub *hub, int port1,
> +				 struct usb_device *peer_hdev, int peer_port1)
> +{
> +	struct usb_port *ss_port =3D hub->ports[port1 - 1];
> +	struct usb_port *port_dev;
> +	struct usb_hub *peer_hub;
> +	struct usb_device *udev;
> +	u16 portstatus, portchange;
> +
> +	/* Keep hub_wq off the SuperSpeed port until the USB 2.0 device is gone=
 */
> +	mutex_lock_nested(&ss_port->status_lock, SINGLE_DEPTH_NESTING);
> +	usb_lock_device(peer_hdev);
> +	if (hub->quiescing)
> +		goto out;
> +	peer_hub =3D usb_hub_to_struct_hub(peer_hdev);
> +	if (!peer_hub || peer_port1 > peer_hdev->maxchild)
> +		goto out;
> +
> +	port_dev =3D peer_hub->ports[peer_port1 - 1];
> +	udev =3D port_dev->child;
> +	if (!udev || udev->speed !=3D USB_SPEED_HIGH ||
> +	    udev->descriptor.bDeviceClass =3D=3D USB_CLASS_HUB)
> +		goto out;

[Severity: Medium]
Can hub_reset_peer_child() observe port_dev->child =3D=3D NULL and bail out
before peer_hub has finished enumerating a boot-connected device?

In hub_activate(peer_hub, HUB_INIT2), a USB 2.0 root hub with a connected
device sees USB_PORT_STAT_C_CONNECTION, sets need_debounce_delay =3D true,
queues peer_hub->init_work for HUB_DEBOUNCE_STABLE (100 ms), and unlocks
peer_hdev->dev.  Even after hub_init_func3() runs kick_hub_wq(peer_hub),
peer_hdev->dev is unlocked again before hub_event() enumerates the device
and assigns port_dev->child.

Meanwhile, the SuperSpeed root hub has no connection on its port during
HUB_INIT2, so it skips the 100 ms debounce delay and queues
peer_reset_work immediately:

peer_hub (USB 2.0)                hub (SuperSpeed)
------------------                ----------------
hub_activate(HUB_INIT2)
  need_debounce_delay =3D true
  queue_delayed_work(init_work,
                     100 ms)
  device_unlock(&peer_hdev->dev)
                                  hub_activate(HUB_INIT2)
                                    need_debounce_delay =3D false
                                    hub_queue_peer_reset(hub)
                                  hub_peer_reset_work()
                                    hub_reset_peer_child()
                                      usb_lock_device(peer_hdev)
                                      udev =3D port_dev->child; <-- NULL
                                      goto out;
hub_init_func3()
  ...
  hub_port_connect()
    port_dev->child =3D udev;

Whenever the SuperSpeed root hub probes while peer_hub->init_work or
peer_hub->events is still pending, hub_reset_peer_child() exits without
resetting the peer port, leaving the device at high speed.  Flushing
peer_hub->init_work and peer_hub->events before checking port_dev->child
would avoid this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-usb-port-p=
airing-v6-0-32bd7e36e426@gmail.com?part=3D3
