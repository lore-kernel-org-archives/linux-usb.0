Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978792;
	b=D3BpJF3JkeustwSDkUfiMmwq317UZH5nR9xeuhCkhzPu5K0GWq+k1m3ZViq3Qd7OeRlL
	 PtcQUIFXGCOfVnBZPAT3oH3tjOnAv+PfgfpDZey9xXt1Vem0gtzVIX5uMFVAZE/5gQjGn
	 nurvA6peR0MzccRdI0y6jaZYill4RdRVFZRENFdA+cYdcnUe8FMvOIppYqDqTK8OLcf+S
	 qgPiyizI/Y/J/wfU1WKNWlFA3dVIYIrsGECyiJllga9KRfBh3plQ26N/63ZoWddfaJBt6
	 wDbR/YGoU+jO/by9+9meMBn7fQQI5rVzJtJR9O2zcxXf0C/I/3HifocLdxaP1ZVqX7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978792;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kUwi+djS8kIqzkAKKeOLN401sN4oLXVOEo2jc6ZUQqE=;
	b=tAgsZizYovolrspo81uudeilzQlVRVQq+a78p5jtXM6hSzRQcxxQX0fBDHUpresrZnu+
	 E2Zt98jjlA/f59WqnMXqwgbJLAu/fcf35gEMVGx+hewAfTojsg1pcK2O43nfEugr/WZdi
	 oOn3ptNWKUH/7kMZaM1bgEblgdSyrs5H/N+2kdvwt6xbRLsHiNPxnJPJMt50msRpF8e9b
	 AFOvohEgmMIxoWBTeysC6KsJls4kwO/q+QCufWLMMqdd7hIDjVDZA5tINgvZ7pn4OpAr9
	 KV5Ov7odqjXmdkpPvzcZop4Lmp0rhGMcuJHpX0DVGcEJTeeG5QGM7ObJ8Paa/7F59cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6Zom11u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF86A606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 05:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O6Zom11u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DFD1F000C4;
	Wed, 18 Nov 2026 05:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794978791;
	bh=kUwi+djS8kIqzkAKKeOLN401sN4oLXVOEo2jc6ZUQqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O6Zom11u1EyYWpX4/xv8aGIc+b/0jU8JWIR6nOmEEJ3J00sZ0W/R7O2l28JQB5IwL
	 uHEofuFZp4pPkDFUo9Ov7BUtJiuX8a/bUgX4qgijhd3UVrbWVnsgkVAIFUw/TsYTjd
	 5K7HpgtxqYLtzjBuLDSi7eTk9jZrTKs7bOd31eAUiNWhn8iH6ENprfRzFIa45HgCij
	 2I8we2lUT4Ov+ZniKlgHctxA0HGVSF6+dW8lTTAcoFKl28nJhbnu9n67EYVO5bNnV+
	 S9zRq+F1R/QBJD9cpOEneZgqzUbUwJvCWTDd82UmDVEfa95rZVLi7tdYvh49UJvsGz
	 2aYO0rXVYTLKw==
Message-ID: <sashiko-outbox-220149@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] usb: core: Pair ports of different hubs through
 their connector
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118-usb-port-pairing-v5-1-5f1a26789270@gmail.com>
References: <20261118-usb-port-pairing-v5-0-5f1a26789270@gmail.com>
 <20261118-usb-port-pairing-v5-1-5f1a26789270@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 05:13:11 +0000
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
- [High] usb: core: broken connector peer lookup in
  usb_of_get_connector_peer()
- [Medium] usb: core: wrong connect_type fallback in
  usb_hub_create_port_device()
--

commit b5e6aabc1813e83de610f267477e491f798833aa
Author: Arun Iyengar <aiyengar1990@gmail.com>

usb: core: Pair ports of different hubs through their connector

This commit pairs USB 2.0 and SuperSpeed ports belonging to different hubs
when they are linked to the same usb-connector node in the Device Tree, and
looks up root hub connect_type using the raw controller port number.

> diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
> index a6ee20d8774e3..df789cef265c4 100644
> --- a/drivers/usb/core/of.c
> +++ b/drivers/usb/core/of.c
> @@ -145,6 +145,93 @@ enum usb_port_connect_type usb_of_get_connect_type(s=
truct usb_device *hub, int p

[ ... ]

> +struct device_node *usb_of_get_connector_peer(struct usb_device *hub, u3=
2 port,
> +					      bool superspeed, u32 *peer_port)
> +{
> +	struct device_node *np =3D hub->dev.of_node;
> +	struct device_node *ep, *con, *remote, *peer =3D NULL;
> +	u32 remote_port;
> +
> +	if (!np || !of_graph_is_present(np))
> +		return NULL;
> +
> +	ep =3D of_graph_get_endpoint_by_regs(np, port, -1);
> +	if (!ep)
> +		return NULL;
> +
> +	con =3D of_graph_get_remote_port_parent(ep);
> +	of_node_put(ep);
> +	if (!con)
> +		return NULL;
> +
> +	if (!usb_of_is_connector(con) || !of_device_is_available(con))
> +		goto out;
> +
> +	remote =3D usb_of_connector_remote(con, superspeed ? 1 : 0, &remote_por=
t);
> +	if (!remote)
> +		goto out;
> +	of_node_put(remote);
> +	if (remote !=3D np || remote_port !=3D port)
> +		goto out;
> +
> +	/* Same-node peers are paired by port number */
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
> index b4452b665f591..da7037bbbf57f 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -649,10 +649,44 @@ static int match_location(struct usb_device *peer_h=
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
> +	struct usb_port *peer;
> +	struct device_node *np;
> +	u32 port;
> +};
> +
> +static int match_connector_peer(struct usb_device *peer_hdev, void *p)
> +{
> +	struct usb_connector_peer *cp =3D p;
> +	struct usb_hub *peer_hub =3D usb_hub_to_struct_hub(peer_hdev);
> +	int port1;
> +
> +	if (!peer_hub || !peer_hdev->maxchild ||
> +	    peer_hdev->dev.of_node !=3D cp->np ||
> +	    hub_is_superspeed(peer_hdev) =3D=3D cp->port_dev->is_superspeed)
> +		return 0;
> +
> +	for (port1 =3D 1; port1 <=3D peer_hdev->maxchild; port1++) {
> +		if (usb_port_graph_id(peer_hdev, port1) =3D=3D cp->port) {
> +			cp->peer =3D peer_hub->ports[port1 - 1];
> +			break;
> +		}
> +	}
> +	return 1;
> +}
> +
>  /*
>   * Find the peer port either via explicit platform firmware "location"
> - * data, the peer hcd for root hubs, or the upstream peer relationship
> - * for all other hubs.
> + * data, a DT connector, the peer hcd for root hubs, or the upstream peer
> + * relationship for all other hubs.
>   */
>  static void find_and_link_peer(struct usb_hub *hub, int port1)
>  {
> @@ -660,6 +694,7 @@ static void find_and_link_peer(struct usb_hub *hub, i=
nt port1)
>  	struct usb_device *hdev =3D hub->hdev;
>  	struct usb_device *peer_hdev;
>  	struct usb_hub *peer_hub;
> +	struct usb_connector_peer cp;
> =20
>  	/*
>  	 * If location data is available then we can only peer this port
> @@ -671,7 +706,27 @@ static void find_and_link_peer(struct usb_hub *hub, =
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
> +		bool found;
> +
> +		cp.port_dev =3D port_dev;
> +		cp.peer =3D NULL;
> +		found =3D usb_for_each_dev(&cp, match_connector_peer);
> +		of_node_put(cp.np);
> +		if (cp.peer)
> +			link_peers_report(port_dev, cp.peer);
> +		/* Without the peer hub yet, wait for it */
> +		if (cp.peer || !found) {
> +			port_dev->connector_peer =3D true;
> +			return;
> +		}
> +	}

[Severity: High]
Can a USB 2.0 hub port end up neither connector-peered nor default-peered w=
hen
connector port 1 points to a dwc3 controller using the standard snps,dwc3
binding (port@0 for High-Speed, port@1 for SuperSpeed) or to an intermediate
non-hub node such as a Type-C mux or PHY?

When find_and_link_peer() runs for a USB 2.0 port (superspeed =3D=3D false),
usb_of_get_connector_peer() inspects connector port 1.  Unlike a lookup from
the SuperSpeed side (where a dwc3 High-Speed endpoint at port@0 is filtered
out by !*peer_port), a dwc3 SuperSpeed endpoint at port@1 (as on
arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts, where usb_a_3_0 links
usb_hub port@1 to usb_drd1_dwc3 port@1) or a mux/PHY endpoint with reg >=3D=
 1
passes the !*peer_port check and is returned as cp.np with cp.port =3D 1.

In match_connector_peer(), a dwc3 SuperSpeed root hub port has
usb_port_graph_id() =3D=3D 2 (from xhci_find_raw_port_number()), so it never
matches cp.port =3D=3D 1, and a non-hub mux/PHY node never matches any usb_=
device
on usb_bus_type.  Whenever the USB 2.0 hub probes before the SuperSpeed root
hub (or when cp.np is not a hub), found is false, so find_and_link_peer() s=
ets
port_dev->connector_peer =3D true and returns early, skipping default peeri=
ng
and preventing the peer from linking later.

[ ... ]

> @@ -766,7 +822,11 @@ int usb_hub_create_port_device(struct usb_hub *hub, =
int port1)
>  		return -ENOMEM;
>  	}
> =20
> -	port_dev->connect_type =3D usb_of_get_connect_type(hdev, port1);
> +	graph_id =3D usb_port_graph_id(hdev, port1);
> +	port_dev->connect_type =3D usb_of_get_connect_type(hdev, graph_id);
> +	/* dwc3 graphs give the SuperSpeed port port@1 */
> +	if (port_dev->connect_type =3D=3D USB_PORT_NOT_USED && graph_id !=3D po=
rt1)
> +		port_dev->connect_type =3D usb_of_get_connect_type(hdev, port1);

[Severity: Medium]
Does falling back to usb_of_get_connect_type(hdev, port1) misclassify a
SuperSpeed root hub port by matching the USB 2.0 child device or graph
endpoint at raw port 1?

On split-roothub controllers such as xHCI, the USB 2.0 and SuperSpeed root
hubs share hdev->dev.of_node, and child USB device nodes under the controll=
er
use raw controller port numbers (so reg =3D <1> is High-Speed raw port 1). =
 For
SuperSpeed root hub port 1 (port1 =3D 1, graph_id =3D 2), whenever
usb_of_get_connect_type(hdev, 2) returns USB_PORT_NOT_USED (either because =
the
DT uses dwc3 port@1 numbering or because SuperSpeed port 2 is unused), call=
ing
usb_of_get_connect_type(hdev, 1) checks usb_of_get_device_node(hdev, 1) and
port@1:

drivers/usb/core/of.c:usb_of_get_connect_type() {
    ...
	child =3D usb_of_get_device_node(hub, port1);
	if (of_device_is_available(child))
		connect_type =3D USB_PORT_CONNECT_TYPE_HARD_WIRED;
	of_node_put(child);

	return connect_type;
}

For example, on rk3576-lckfb-tspi-3m.dts, usb_drd1_dwc3 has both an onboard
USB 2.0 hub child node hub@1 (reg =3D <1>) and ports/port@1 for the external
SuperSpeed Type-A connector.  The fallback matches hub@1 and marks the
external SuperSpeed port as USB_PORT_CONNECT_TYPE_HARD_WIRED, causing
set_usb_port_removable() to treat hotplugged SuperSpeed devices as fixed and
usb_dev_authorized() to auto-authorize them under
USB_DEVICE_AUTHORIZE_INTERNAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-usb-port-p=
airing-v5-0-5f1a26789270@gmail.com?part=3D1
