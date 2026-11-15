Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736231;
	b=jRWzrMg1EdYewc/0YFIkekMcf5s0GnEx5WZZsct/jq+MQWbxsnM6eBt+CHOiqQMDvIz4
	 EKiGWGGnuXEzQTZFNBhlYXDoQ/F/Mf3tZ7jOToVEw95UjTAnMzHtBVnZ9j9whx/pVEp0q
	 7dcvRAdotlW5kEdiwmctK6G0l2lkGEtDS03ECOts7uC/9m13P7PLsZBaT5fDc8/RGUmJQ
	 ixLoTrNBuVgU/D+RODxF6PmUhacdD83mshJ6lZGecE67HKmtbM2UCqkTf6fxUtaTNZFie
	 RdBsi01/EYm95xNQW9iVJIVTL9iPNX9G6snRxaqBojZRVL/EbR1M2oH4wbvnZ0wo5gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736231;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BjVJI9EA11G+UpVQi//4bLrUYb+7GhFo+ucAFNR+sfY=;
	b=CnMrk8fhi+fKkbtTGslebjtpXCh6RI7CarKBoQvpNBg988BCjMIJ9vjfTOR0OaeT19QK
	 6i7ONqzcVKwL7odpqE4g8CWmi8snfwBFbzKuGCM9Em/8YBttc6A+8DEoFfRBQjloS7Yoo
	 +bz/oobo/Y3R4Kkjpp6g1RlvvoqQiiQeLWZwe+37mGQDEvtYxAzw9sYy3VLn71CAyAkTf
	 yTj/k2URjRkGg8+kyRpBICEZiqKh05uD1Ve9dO5r+UIEEejkMm7uhk5SzFRzTf7OnPZHM
	 hsyZpbqdu6HW8vShigh396KHvP0shQ7RcqVIeSqgjLVGL28WC7CRF6vAJXlldGWSntA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X69q3THW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046CA606A31A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X69q3THW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19751F000C4;
	Sun, 15 Nov 2026 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794736230;
	bh=BjVJI9EA11G+UpVQi//4bLrUYb+7GhFo+ucAFNR+sfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X69q3THWuVjzqxKHamBi7bqQiyCJjqvGO+wHOFgGhN6ISFTBaw1sUCORt0OtP1S8k
	 5FlWJUlWD+L7/12DFB9BIBegh7sOyIShvru+anqzr9kPKX02k+B9NRb2BOaMeaGFoZ
	 iCJRXCd+9f338Felg9zvzYpDj6wdo6E3ChCJVleD/eLcYMu8Yb48aC2XO3kj+V+ZYC
	 Dvfu8J+NhC4gDHYMlxgD6JSLauDkATs9PQ2SGpy68qYUPWZMEzHOyzo4fCyUKvPslp
	 CqqTgtWvzwAX2Psf5UoNVR9Ys/oopSx9L9TvFY30ZdCJJ9zDeLa1l74aZGO6tXXDvR
	 vEzwuBoPu3jtA==
Message-ID: <sashiko-outbox-215380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] usb: core: Pair ports of different hubs through
 their connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261115-usb-port-pairing-v4-1-25d3c9adcc21@gmail.com>
References: <20261115-usb-port-pairing-v4-0-25d3c9adcc21@gmail.com>
 <20261115-usb-port-pairing-v4-1-25d3c9adcc21@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:50:30 +0000
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
- [High] usb: core: OF graph port numbering mismatch in
  usb_port_graph_id()
- [Medium] usb: core: raw port number not passed to
  usb_of_get_connect_type()
- [Medium] usb: core: update connect_type and connector_peer after
  device_register()
--

commit a8c7879971bee16d5ebf91273578d78c7dde5445
Author: Arun Iyengar <aiyengar1990@gmail.com>

usb: core: Pair ports of different hubs through their connector

This commit pairs USB 2.0 and SuperSpeed ports across different hubs or
host controllers when they are linked to the same usb-connector node in
the OF graph.

> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f591..5b2041d891eca 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -649,10 +649,49 @@ static int match_location(struct usb_device *peer_h=
dev, void *p)
>  	return 0;
>  }
> =20
> +static u32 usb_port_graph_id(struct usb_device *hdev, int port1)
> +{
> +	if (hdev->parent)
> +		return port1;
> +	return usb_hcd_find_raw_port_number(bus_to_hcd(hdev->bus), port1);
> +}
> +
> +struct usb_connector_peer {
> +	struct usb_port *port_dev;
> +	struct device_node *np;
> +	u32 port;
> +};
> +
> +static int match_connector_peer(struct usb_device *peer_hdev, void *p)
> +{
> +	struct usb_connector_peer *cp =3D p;
> +	struct usb_hub *peer_hub =3D usb_hub_to_struct_hub(peer_hdev);
> +	struct usb_port *peer;
> +	int port1;
> +
> +	if (!peer_hub || peer_hdev->dev.of_node !=3D cp->np ||
> +	    hub_is_superspeed(peer_hdev) =3D=3D cp->port_dev->is_superspeed)
> +		return 0;
> +
> +	for (port1 =3D 1; port1 <=3D peer_hdev->maxchild; port1++) {
> +		if (usb_port_graph_id(peer_hdev, port1) =3D=3D cp->port)
> +			break;
> +	}

[Severity: High]
Does usb_port_graph_id() match the OF graph port numbering used by USB
controller bindings, and does usb_of_get_connector_peer() leave USB 2.0
ports unpeered when the peer controller uses dwc3 graph numbering?

On dwc3 xHCI controllers, xhci_find_raw_port_number() returns 1 for the
High-Speed root hub port and 2 for the SuperSpeed root hub port, whereas
USB controller DT bindings (such as snps,dwc3-common.yaml and
rockchip,dwc3.yaml) define port@0 as High-Speed and port@1 as SuperSpeed.

When find_and_link_peer() runs for a USB 2.0 hub port whose connector
port@1 points to a dwc3 controller's port@1 (as on
rk3576-lckfb-tspi-3m.dts), usb_of_get_connector_peer() checks !*peer_port,
which rejects port@0 when starting from a SuperSpeed port but accepts
*peer_port =3D=3D 1 when starting from a USB 2.0 port.  find_and_link_peer()
then sets port_dev->connector_peer =3D 1 and returns early, while
match_connector_peer() compares usb_port_graph_id() (2) against cp->port
(1) and fails to link the ports.  Meanwhile, when the dwc3 SuperSpeed root
hub port runs find_and_link_peer(), usb_port_graph_id() returns 2, which
misses port@1 on the controller node and falls through to default peering
with the wrong port (or is blocked by !peer->connector_peer when the
default peer was already marked).

> @@ -671,7 +711,21 @@ static void find_and_link_peer(struct usb_hub *hub, =
int port1)
>  		/* we link the peer in match_location() if found */
>  		usb_for_each_dev(port_dev, match_location);
>  		return;
> -	} else if (!hdev->parent) {
> +	}
> +
> +	cp.np =3D usb_of_get_connector_peer(hdev, usb_port_graph_id(hdev, port1=
),
> +					  port_dev->is_superspeed, &cp.port);
> +	if (cp.np) {
> +		cp.port_dev =3D port_dev;
> +		port_dev->connector_peer =3D 1;

[Severity: Medium]
Does setting port_dev->connector_peer and port_dev->connect_type in
find_and_link_peer() happen too late, after device_register() has already
exposed the port to sysfs?

In usb_hub_create_port_device(), device_register(&port_dev->dev) publishes
the sysfs attributes and emits KOBJ_ADD before find_and_link_peer() runs.
Userspace handlers reacting to KOBJ_ADD can read the stale connect_type,
and the unlocked bitfield write to connector_peer can race with sysfs
writes to sibling bitfields in struct usb_port (early_stop_store() and
usb3_lpm_permit_store()):

CPU0                                  CPU1
usb_hub_create_port_device()
  device_register(&port_dev->dev)
                                      early_stop_store()
                                        port_dev->early_stop =3D ...
  find_and_link_peer()
    port_dev->connector_peer =3D 1;
    <-- bitfield RMW clobbers early_stop

> +		/* usb_of_get_connect_type() misses graph ports */
> +		port_dev->connect_type =3D USB_PORT_CONNECT_TYPE_HOT_PLUG;

[Severity: Medium]
Why does find_and_link_peer() override port_dev->connect_type here instead
of usb_hub_create_port_device() passing usb_port_graph_id(hdev, port1) to
usb_of_get_connect_type()?

usb_of_get_connect_type() already checks OF graph endpoints via
of_graph_get_endpoint_by_regs(), but usb_hub_create_port_device() passes
the HCD-relative port1 index instead of the controller's raw port number:

drivers/usb/core/port.c:usb_hub_create_port_device() {
    ...
	port_dev->connect_type =3D usb_of_get_connect_type(hdev, port1);
    ...
}

On a split-roothub controller where usb_port_graph_id(hdev, port1) !=3D
port1, usb_of_get_connect_type() inspects the wrong port number on the
controller DT node.  Whenever usb_of_get_connector_peer() returns NULL
(for example, when both ports of the connector belong to the same
controller node, or for a hardwired child device node), connect_type is
never fixed up and remains wrong (such as USB_PORT_NOT_USED), causing
set_usb_port_removable() to misclassify hotplugged devices as fixed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-usb-port-p=
airing-v4-0-25d3c9adcc21@gmail.com?part=3D1
