Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590411;
	b=Zx8/RDklWPDgty4Kba0q5SpyRFuS7kNdDI9RQf2p55etVoTTjiQHJ/RwfndTDvHt1SdJ
	 iruVlrNL7eTGeXXN3sdKMuepHQpV5xqHhc3zslQJOKA5pKV41pOCFsgNRhYJVJ2zRkIY/
	 w0YNkG65HWcCGZHP/d/N9yj/QeCALRs9FjQz7Gu1s0odR+1wreJac4HYXYAzSl5+0wnuf
	 jhmukyWexwl3DSJBDk8y74qErpptCZOYN6ZKYcsD88o6sd4wxiZyN4/jIA4EwW6EGBPQq
	 jGDx9El72OX/RawBMsab6X0/6cvT+jOFobODYDmyoAUO9xHnyyAeAhU/N7Mynhedf9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590411;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WxGBcaBJfyi8h+6EC9F556lb9XFngFMVH+gKwL+2sj4=;
	b=vAEdT5YN9+PNueYXgs33imSn88BW8df3g7Kqmb6lBqb6KbZ0Q5iQiifHiPuErm4zCXhk
	 H6MgDxRpu0fZDA+bivO4xyMCwYZwfpMpfjGDzghNs4FW1SX90WUW3c6mLJ5TUoCWd9ItY
	 h7lWmEOeSSXhAoTVpjbX0FNt+EcgiCVlwv89lOk8LTZ4UB30T+D+2Uk9zrEELowUPbdLJ
	 db0Nj/j27UU7k+E51CY/CAsrCIN/L5ZMOH0StOSyfDmx4xatMlpuhMoTcI9h/XP33+K3g
	 NDV4MI2WQCdcBKYu4p0PAWnLR4xvFlVb14aKECdvreTeWfQugjdV3qhumbuvTMJoCSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYcIi8KG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3112606F700
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QYcIi8KG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E9C1F000CA;
	Fri, 13 Nov 2026 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590410;
	bh=WxGBcaBJfyi8h+6EC9F556lb9XFngFMVH+gKwL+2sj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QYcIi8KGZMrVBMLaZVEhRLqScFC8MEXz6C+5DC2zpuQTrJcnU/BEqF2BVda+yz2MR
	 vMcXI8z8ojy5BkzRtWtkjkpJuBUSw/aB2LN89BZik0M4+HturdlraJEpQ0OWBfkhwu
	 Jw+/KuNgIffBGGhAqVikwjWSEcBvnc9mowDtKhdI+dQC9mwfb8baDSDa8e6nr1T05J
	 eIT6CieqL/AWR1Kch9ICr+9Z5jTzDPbPauzCn8JhNANfipm2h+JE4o4x2yJrUylaeB
	 yMDbHGwkSAm+VSJ2ULPqcBLy2o80+iBsbt+IhIQMH7EVz3Ch9fqHKIxOqboOp13+dg
	 tyuBMSsWsjxwQ==
Message-ID: <sashiko-outbox-213292@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] usb: core: Pair ports of different hubs through
 their connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-usb-port-pairing-v3-1-d6c6edb4341c@gmail.com>
References: <20261113-usb-port-pairing-v3-0-d6c6edb4341c@gmail.com>
 <20261113-usb-port-pairing-v3-1-d6c6edb4341c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:20:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] usb: core: port numbering mismatch in usb_port_graph_id() for
  controller DT
- [Medium] usb: core: wrong port index passed to
  usb_of_get_connect_type() on root hubs
--

commit 6078d04cbe13cbfa47a3ee5f362dcccb9bc5fd1f
Author: Arun Iyengar <aiyengar1990@gmail.com>

usb: core: Pair ports of different hubs through their connector

This commit pairs USB 2.0 and SuperSpeed ports routed to different hubs or
host controllers by traversing their shared usb-connector OF graph node.

> diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
> index a6ee20d8774e3..1b26d20835252 100644
> --- a/drivers/usb/core/of.c
> +++ b/drivers/usb/core/of.c
> @@ -145,6 +145,104 @@ enum usb_port_connect_type usb_of_get_connect_type(=
struct usb_device *hub, int p
[ ... ]
> +struct device_node *usb_of_get_connector_peer(struct usb_device *hub, u3=
2 port,
> +					      bool superspeed, u32 *peer_port)
> +{
[ ... ]
> +	/* Peers on the same node are paired without the connector's help */
> +	peer =3D usb_of_connector_remote(con, superspeed ? 0 : 1, peer_port);
> +	if (peer && (peer =3D=3D np || !*peer_port ||
> +		     !of_device_is_available(peer))) {
> +		of_node_put(peer);
> +		peer =3D NULL;
> +	}
> +out:
> +	of_node_put(con);
> +	return peer;
> +}
> +EXPORT_SYMBOL_GPL(usb_of_get_connector_peer);
> +
>  /**
>   * usb_of_get_interface_node() - get a USB interface node
>   * @udev: USB device of interface
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f591..6a65dc6f14e7c 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -649,10 +649,52 @@ static int match_location(struct usb_device *peer_h=
dev, void *p)
>  	return 0;
>  }
> =20
> +/* Root hub graph ports use the controller's port number, as in ACPI */
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
> +/* Link the port to @peer_hdev's port at graph port cp->port, if it has =
one */
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
Does usb_port_graph_id() mismatch the OF graph port numbers used by USB
controller Device Tree bindings?

On DWC3/xHCI controllers, usb_hcd_find_raw_port_number() returns 1 for the
High-Speed root hub port and 2 for the SuperSpeed root hub port, and
usb_of_get_connector_peer() rejects *peer_port =3D=3D 0.  However, controll=
er DT
bindings such as Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
define port@0 as the High-Speed bus and port@1 as the SuperSpeed bus (or use
a single unnumbered port node parsed as port 0).

On in-tree boards such as arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m=
.dts,
usb_a_3_0 routes port@0 to usb_hub port@1 and port@1 to usb_drd1_dwc3
port@1.  When usb_drd1_dwc3's SuperSpeed port (port1 =3D 1) runs
find_and_link_peer(), usb_port_graph_id() returns 2, misses port@1, and
falls back to pairing with usb_drd1_dwc3's USB 2.0 root hub port.  When
usb_hub port 1 then runs match_connector_peer() with cp->port =3D 1,
usb_port_graph_id(peer_hdev, 1) returns 2 and fails to link the ports.

> +	if (port1 > peer_hdev->maxchild)
> +		return 0;
> +
> +	/* No connect_type check: the connector shows the port is used */
> +	peer =3D peer_hub->ports[port1 - 1];
> +	if (!peer)
> +		return 0;

[Severity: Medium]
When a root hub's controller node has an OF graph indexed by
usb_port_graph_id(), does usb_hub_create_port_device() pass the wrong port
number to usb_of_get_connect_type()?

drivers/usb/core/port.c:usb_hub_create_port_device() {
    ...
	port_dev->connect_type =3D usb_of_get_connect_type(hdev, port1);
    ...
}

For a SuperSpeed root hub port where port1 is 1 but usb_port_graph_id() is
2, usb_of_get_connect_type(hdev, 1) looks up port@1 in the controller's OF
graph instead of port@2.  When port@1 has no endpoint (as on the
SuperSpeed-only RK3588 host controller), usb_of_get_connect_type() returns
USB_PORT_NOT_USED instead of USB_PORT_CONNECT_TYPE_HOT_PLUG.  Although
match_connector_peer() skips checking connect_type,
set_usb_port_removable() later marks hotplugged USB 3.0 devices on that
connector as DEVICE_FIXED and sysfs reports the port as "not used".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-usb-port-p=
airing-v3-0-d6c6edb4341c@gmail.com?part=3D1
