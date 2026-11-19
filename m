Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795082604;
	b=EgdcsXni13CVLEEB0z98NfHjCdzNZnuNIyNywT4mG6w5a85nD8OgtV7/yVXasDV4Jpk5
	 5KYgmdNd7muQB7cPYR9rtdCiGzTyYL4QkvJVTg8Ph/qbJLTv30O36PwO3JT9RBUhb0xsu
	 DGrxPyH1wEFgyNuVxahJEAv8DGua0v3G+OvgkAM1np3iYYT3okr1JexvwddKcFcZ0TkVu
	 RYK3eALeTHIVRHbHyrVtv5HIbw6+HsaQIHrDjYFMwAEjsVmOZ9GnUiziclsFvyovW7p4V
	 RD5N7zYMh3anMknTFibnEvfKDdabpgxuxtBf8ru6gmCNTG8RC8MpDojYG9myqxH5xcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082604;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=spVbTEeEE5bjTMsk1i080ORu+LmEKtk3oErLsfoitkE=;
	b=gaIsT/+zzMpjBRXw6C7+BkUBLXnw+dDUhLLy90L4HaxC6yoE2jvOpVaCic1rSgJodCsp
	 SgZlEss45BNg+MZixdP0sP+OvMPFLvsnS6l21z0MNz1ZFfts+LIOKlGPMY5EAZSWz5Tds
	 i0Of3opvV8zZiOjlm3E/qghOFieRfU8Y2R+JIT+NNXPnCno+ZwnPl1aYVga7SAMz0Jb+L
	 ZfMcVHdK3BQHEtsSaYTVo4O8/xpLtEAd5/XP/M+swdq4TwAnZiHONJ8gTEAWYC8+/HXv1
	 XosKGkToa0xUyhcb7gTjBMpvru7EnoHk08tq7RxV/SpJyrkmmVXjWX/k1fyqU78JeGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N5euVaeA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECC4606A326;
	Thu, 19 Nov 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N5euVaeA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795082604;
	b=Q1TiUrw25T0dkElGfxN14Fmkp5ypXkdLCLPqK3PHessi39Jdo4JK4eetJNvRgrJCL8fa
	 zJ0das5Bkm8v6vHmRF3K0KA0f5NEFYGlpx7KJNZ2TohXUYC3jKj+Ht48+ZBLdeuifSPQ6
	 dxAQ7n+7ptyxgExHM+Vj20P3kCvMJYNFaMHcfd2ZXH7VAnTvd7YrFYuxRknk1k1jAmsJb
	 V0mK73Ab4PAvk0U9yTVCaWDVaZWKBqIpWXyyNLqDeJMMW6v3X1K2Jhm8KyGBUm9dTF2ua
	 cZQ9ZqrNeTdfILRYpHJmOTuvcpu9dMTms3eBcTwuMQ50iqGtxzb460Cud9XiCZcvdOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082604;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=spVbTEeEE5bjTMsk1i080ORu+LmEKtk3oErLsfoitkE=;
	b=aERIgfZQotPzMMrTm3z9IZMrdc2UVsGd3gPG3oOS5LysEsIWE6kU6B+aW0WBFMAIYtuW
	 aKaCA+90S7cyL5mDPIgnjSYOt7kYFeHKXZyH4IuibsH/RNuYNXTWXVbVtPMaydQM7h2oo
	 Pdxq32MF7Q6GsFWpHmOQYvlAK2kjeUwgpYrVc75owMR1tNtn2R8wrhUn80IFDrbDKrOno
	 Bbvw3hKTwvgBhXpPsRxHFc2FrZOzgiDpQs7G2OIChsrQgPhUeLmILew19n/feMgYza9he
	 YhyFRdoOa4PE2yVgkOmdEiIjzNQIAYVnlNu+Nu4GYACWakieqVDBlo5LhopMD3s3AvQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 978A51F000C4;
	Thu, 19 Nov 2026 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082604;
	bh=spVbTEeEE5bjTMsk1i080ORu+LmEKtk3oErLsfoitkE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=N5euVaeAUiUxPZClhAzHE6f9mGG0gw1O5iegJYgk10SdWX8a7KIF8/xBv3MiWxBMZ
	 TYMuP9rOaI85E1ZpOTjuqTcQzoVN52iBX3ay5ZpqFH6P8k5LmmhOUeSNRXd7Lgu2r1
	 yyZGz2w9TbXY5qorl3XnJgolyYF/1rCRVEDpGMV57GyjxrbSwnxbOqgeYeN+s/C7vy
	 QUU6gdbrui3BmkB8JdkQBZ/L4c/YRShKPGXIUFR7gzD3gBHmQs6GA+xKTLqy8MMQBr
	 ERUCZCVtU4iLHv9g3LYF5ba8ROy+LCaDQ3tYk4DBh+23QJXlrafdX/kdRGyJ3vaPGQ
	 99TxkPTlZ8d9A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 148E74B1FD;
	Thu, 19 Nov 2026 10:03:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 10:03:23 +0000
Subject: [PATCH v6 1/3] usb: core: Pair ports of different hubs through
 their connector
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-usb-port-pairing-v6-1-32bd7e36e426@gmail.com>
References: <20261119-usb-port-pairing-v6-0-32bd7e36e426@gmail.com>
In-Reply-To: <20261119-usb-port-pairing-v6-0-32bd7e36e426@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mathias Nyman <mathias.nyman@intel.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082602; l=10674;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=GNUJhryeA+mjNTDirCrLtBLmuiwuLK3ni6guXQXpejU=;
 b=KWyQDtRsWWlyfiqnbfWhUYX2V7afsIzPlewx6PeOoXWY0KrTUHeyGw72jBCgpJ0MWpGpB2LGl
 KmurQm8cpWMALWn0gas6R4rDG8GePJm6IXViiSwB8T4roOIqaR0pOQt
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On the RK3588, USB 3.0 host 2 is SuperSpeed-only and its connector's
USB 2.0 lines go to a separate EHCI, so pairing by port number gives the
SuperSpeed port a dead USB 2.0 peer.

When ports 0 (USB 2.0) and 1 (SuperSpeed) of a usb-connector graph lead
to different hubs, pair them through the connector. The peer must be a
"usb" node (usb.yaml) or under one; a mux or PHY there keeps today's
pairing. Root hub ports are found by the controller port number; graphs
in the dwc3 numbering don't match and keep today's pairing, as xHCI
registers both root hubs before devices enumerate. connect_type is
looked up the same way, so such a SuperSpeed port reads "hotplug".

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/core/hub.h  |  2 +
 drivers/usb/core/of.c   | 97 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/port.c | 87 ++++++++++++++++++++++++++++++++++++++++----
 include/linux/usb/of.h  |  8 ++++
 4 files changed, 187 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a32..ab80164b4b46 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -97,6 +97,7 @@ struct usb_hub {
  * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
  * @early_stop: whether port initialization will be stopped earlier.
  * @ignore_event: whether events of the port are ignored.
+ * @connector_peer: peer found through a connector.
  */
 struct usb_port {
 	struct usb_device *child;
@@ -118,6 +119,7 @@ struct usb_port {
 	unsigned int is_superspeed:1;
 	unsigned int usb3_lpm_u1_permit:1;
 	unsigned int usb3_lpm_u2_permit:1;
+	unsigned int connector_peer:1;
 };
 
 #define to_usb_port(_dev) \
diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index a6ee20d8774e..eebfc9cd0c88 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -145,6 +145,103 @@ enum usb_port_connect_type usb_of_get_connect_type(struct usb_device *hub, int p
 }
 EXPORT_SYMBOL_GPL(usb_of_get_connect_type);
 
+static bool usb_of_in_usb_node(const struct device_node *np)
+{
+	for (; np; np = np->parent)
+		if (of_node_name_eq(np, "usb"))
+			return true;
+	return false;
+}
+
+static bool usb_of_is_connector(const struct device_node *np)
+{
+	return of_device_is_compatible(np, "usb-a-connector") ||
+	       of_device_is_compatible(np, "usb-b-connector") ||
+	       of_device_is_compatible(np, "usb-c-connector");
+}
+
+static struct device_node *usb_of_connector_remote(struct device_node *con,
+						   u32 con_port, u32 *port)
+{
+	struct device_node *ep, *remote;
+	struct of_endpoint endpoint;
+
+	ep = of_graph_get_endpoint_by_regs(con, con_port, -1);
+	if (!ep)
+		return NULL;
+
+	remote = of_graph_get_remote_endpoint(ep);
+	of_node_put(ep);
+	if (!remote)
+		return NULL;
+
+	if (of_graph_parse_endpoint(remote, &endpoint)) {
+		of_node_put(remote);
+		return NULL;
+	}
+	*port = endpoint.port;
+
+	ep = remote;
+	remote = of_graph_get_port_parent(ep);
+	of_node_put(ep);
+
+	return remote;
+}
+
+/**
+ * usb_of_get_connector_peer() - find a port's peer through its connector
+ * @hub: hub to which the port belongs
+ * @port: graph port of the port
+ * @superspeed: whether @hub is a SuperSpeed hub
+ * @peer_port: returns the graph port of the peer
+ *
+ * Return: the node with the peer port, with a reference, if the other half
+ * of @port's connector leads to a different node that is or is under a "usb"
+ * node. NULL otherwise.
+ */
+struct device_node *usb_of_get_connector_peer(struct usb_device *hub, u32 port,
+					      bool superspeed, u32 *peer_port)
+{
+	struct device_node *np = hub->dev.of_node;
+	struct device_node *ep, *con, *remote, *peer = NULL;
+	u32 remote_port;
+
+	if (!np || !of_graph_is_present(np))
+		return NULL;
+
+	ep = of_graph_get_endpoint_by_regs(np, port, -1);
+	if (!ep)
+		return NULL;
+
+	con = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+	if (!con)
+		return NULL;
+
+	if (!usb_of_is_connector(con) || !of_device_is_available(con))
+		goto out;
+
+	remote = usb_of_connector_remote(con, superspeed ? 1 : 0, &remote_port);
+	if (!remote)
+		goto out;
+	of_node_put(remote);
+	if (remote != np || remote_port != port)
+		goto out;
+
+	/* Same-node peers are paired by port number */
+	peer = usb_of_connector_remote(con, superspeed ? 0 : 1, peer_port);
+	if (peer && (peer == np || !*peer_port ||
+		     !of_device_is_available(peer) ||
+		     !usb_of_in_usb_node(peer))) {
+		of_node_put(peer);
+		peer = NULL;
+	}
+out:
+	of_node_put(con);
+	return peer;
+}
+EXPORT_SYMBOL_GPL(usb_of_get_connector_peer);
+
 /**
  * usb_of_get_interface_node() - get a USB interface node
  * @udev: USB device of interface
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..154f6bfc0805 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -649,12 +649,70 @@ static int match_location(struct usb_device *peer_hdev, void *p)
 	return 0;
 }
 
+static u32 usb_port_graph_id(struct usb_device *hdev, int port1)
+{
+	if (hdev->parent)
+		return port1;
+	return usb_hcd_find_raw_port_number(bus_to_hcd(hdev->bus), port1);
+}
+
+struct usb_connector_peer {
+	struct usb_port *port_dev;
+	struct usb_port *peer;
+	struct device_node *np;
+	u32 port;
+};
+
+static int match_connector_peer(struct usb_device *peer_hdev, void *p)
+{
+	struct usb_connector_peer *cp = p;
+	struct usb_hub *peer_hub = usb_hub_to_struct_hub(peer_hdev);
+	int port1;
+
+	if (!peer_hub || !peer_hdev->maxchild ||
+	    peer_hdev->dev.of_node != cp->np ||
+	    hub_is_superspeed(peer_hdev) == cp->port_dev->is_superspeed)
+		return 0;
+
+	for (port1 = 1; port1 <= peer_hdev->maxchild; port1++) {
+		if (usb_port_graph_id(peer_hdev, port1) == cp->port) {
+			cp->peer = peer_hub->ports[port1 - 1];
+			break;
+		}
+	}
+	return 1;
+}
+
+/* Set before device_register(): sysfs stores write the same word */
+static struct usb_port *find_connector_peer(struct usb_hub *hub, int port1)
+{
+	struct usb_port *port_dev = hub->ports[port1 - 1];
+	struct usb_device *hdev = hub->hdev;
+	struct usb_connector_peer cp;
+	bool found;
+
+	cp.np = usb_of_get_connector_peer(hdev, usb_port_graph_id(hdev, port1),
+					  port_dev->is_superspeed, &cp.port);
+	if (!cp.np)
+		return NULL;
+
+	cp.port_dev = port_dev;
+	cp.peer = NULL;
+	found = usb_for_each_dev(&cp, match_connector_peer);
+	of_node_put(cp.np);
+	/* Without the peer hub yet, wait for it */
+	if (cp.peer || !found)
+		port_dev->connector_peer = 1;
+	return cp.peer;
+}
+
 /*
  * Find the peer port either via explicit platform firmware "location"
- * data, the peer hcd for root hubs, or the upstream peer relationship
- * for all other hubs.
+ * data, a DT connector, the peer hcd for root hubs, or the upstream peer
+ * relationship for all other hubs.
  */
-static void find_and_link_peer(struct usb_hub *hub, int port1)
+static void find_and_link_peer(struct usb_hub *hub, int port1,
+			       struct usb_port *con_peer)
 {
 	struct usb_port *port_dev = hub->ports[port1 - 1], *peer;
 	struct usb_device *hdev = hub->hdev;
@@ -671,7 +729,15 @@ static void find_and_link_peer(struct usb_hub *hub, int port1)
 		/* we link the peer in match_location() if found */
 		usb_for_each_dev(port_dev, match_location);
 		return;
-	} else if (!hdev->parent) {
+	}
+
+	if (port_dev->connector_peer) {
+		if (con_peer)
+			link_peers_report(port_dev, con_peer);
+		return;
+	}
+
+	if (!hdev->parent) {
 		struct usb_hcd *hcd = bus_to_hcd(hdev->bus);
 		struct usb_hcd *peer_hcd = hcd->shared_hcd;
 
@@ -703,7 +769,7 @@ static void find_and_link_peer(struct usb_hub *hub, int port1)
 	 * does not have location data
 	 */
 	peer = peer_hub->ports[port1 - 1];
-	if (peer && peer->location == 0)
+	if (peer && peer->location == 0 && !peer->connector_peer)
 		link_peers_report(port_dev, peer);
 }
 
@@ -754,6 +820,8 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
+	struct usb_port *con_peer;
+	u32 graph_id;
 	int retval;
 
 	port_dev = kzalloc_obj(*port_dev);
@@ -766,7 +834,11 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 		return -ENOMEM;
 	}
 
-	port_dev->connect_type = usb_of_get_connect_type(hdev, port1);
+	graph_id = usb_port_graph_id(hdev, port1);
+	port_dev->connect_type = usb_of_get_connect_type(hdev, graph_id);
+	/* dwc3 graphs give the SuperSpeed port port@1 */
+	if (port_dev->connect_type == USB_PORT_NOT_USED && graph_id != port1)
+		port_dev->connect_type = usb_of_get_connect_type(hdev, port1);
 	hub->ports[port1 - 1] = port_dev;
 	port_dev->portnum = port1;
 	set_bit(port1, hub->power_bits);
@@ -778,6 +850,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 		port_dev->dev.groups = port_dev_usb3_group;
 	} else
 		port_dev->dev.groups = port_dev_group;
+	con_peer = find_connector_peer(hub, port1);
 	port_dev->dev.type = &usb_port_device_type;
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
@@ -809,7 +882,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 		goto err_put_kn;
 	}
 
-	find_and_link_peer(hub, port1);
+	find_and_link_peer(hub, port1, con_peer);
 
 	/*
 	 * Enable runtime pm and hold a refernce that hub_configure()
diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
index de42f14bd280..4be581bd2758 100644
--- a/include/linux/usb/of.h
+++ b/include/linux/usb/of.h
@@ -20,6 +20,8 @@ int of_usb_update_otg_caps(struct device_node *np,
 			struct usb_otg_caps *otg_caps);
 enum usb_port_connect_type usb_of_get_connect_type(struct usb_device *hub, int port1);
 struct device_node *usb_of_get_device_node(struct usb_device *hub, int port1);
+struct device_node *usb_of_get_connector_peer(struct usb_device *hub, u32 port,
+					      bool superspeed, u32 *peer_port);
 bool usb_of_has_combined_node(struct usb_device *udev);
 struct device_node *usb_of_get_interface_node(struct usb_device *udev,
 		u8 config, u8 ifnum);
@@ -49,6 +51,12 @@ usb_of_get_device_node(struct usb_device *hub, int port1)
 {
 	return NULL;
 }
+static inline struct device_node *
+usb_of_get_connector_peer(struct usb_device *hub, u32 port, bool superspeed,
+			  u32 *peer_port)
+{
+	return NULL;
+}
 static inline bool usb_of_has_combined_node(struct usb_device *udev)
 {
 	return false;

-- 
2.55.0


