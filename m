Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794976499;
	b=ZtvjgZ3ADEOvG+rlfv+pbuXGzzD1cpURKCjvmF34cN+ZjJZEjgkyHepw0JIOGsGOeOh+
	 Pqkv6aZ4gQjd1U9EhgnyZqoKfDXXwbH5frlyaWJ2z5j4nLLKC0rLC+UQPBUG7XfvD7rS0
	 jDjg2xZMqlVx7xlkuUsCdjLn9BjFJOAaiYm7Kxbt4FEntfcq9zX4eam5GWAl/eME7ogWg
	 k96Rze0PTvX4xBGGTDJRpwz0oOi6iiWDeEIdHLjripSCzplPbFxgC2Af7TwsrVOWv64xp
	 x2uh4UHF9tLqU2I87eTgkmTSixYI/r/ccfvnqgxew8f0RB+TlgUZp4FURyM7YQnq73g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976499;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T4kCzoKB32EpMiqFKhGICJ/N3uaEhOaEXUffovitKew=;
	b=03FQWUwcReryzrioiOGCaednfgLPfQVaTWtnXAIx4abkBIXdBRlEKHholWytH6SahApA
	 r5hnpk8/vwTDmyqoMRShU9u6CL5tZccafWaqhyHm+azJJZvmZ1wbeoySU41bA3nqpjjhL
	 0U9Gv39vFsvpQN2haGGiQHN05XhrXS+Uu1rSZaSlmXJEJywt54RvM4N+/gHDPRCD2a4uX
	 BpxbQoWmiaix9r3Faz9Z/ubSQ7c7tpY7HWEBufUjD/7U4T8oALH5LkoabOXmDiYCl7es4
	 Jvet3MB66m5dSc1+RVE/jJFQwVGHTkQcSxC/xW6Tm9xx7q4BMIXrhgMnIoIVHj4YX2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FjrveZsA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EDD606A325;
	Wed, 18 Nov 2026 04:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FjrveZsA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794976499;
	b=H5A6kfltPVrpsqg4/DrvB2XpKwgZj8VgeObuwhdLMQ5mfJFGJLk3qelJIPWF1F9Msidv
	 urD4+2Dy3ZVF6RtE8wAghFKeI0IGtR7yWZT5ZpoNhQ+bK+ASEnVBK4EfJvWSOTdRXNDaA
	 tYmHZ/W7UWreEXOlQtK+7kQhmoUD844pgVLvDXq0Rq0rFo02BmuOsF3StKkVJVewEKc9w
	 nCDfshbytH78RqVAGQkkYWqgYXOXx0NUr98+G3QOXMEmr4jg0FqC41IBtVGNBFDupn56P
	 AS8BJfEZ855cXR+Px22vYFq/vnvnGxWAKD0lZOx9WuG7z5sZijxO/YXrOZIOARKJ5JA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794976499;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T4kCzoKB32EpMiqFKhGICJ/N3uaEhOaEXUffovitKew=;
	b=lAwUQdlIYjW3SkkxyvUxtLjvuFHQsQzBCNb7CdF1CzBzkYSkTJhOh5GR428sDJPCrEEq
	 fYFO+UuXcWH8ayx7zY4uFpCt+x1A6iojn/K+5U+NtZA8T/8Ora6OiJRA8+cbIAj7gXIih
	 2Zd2IkmDkWjZHq1LENyJO33bhwydctPEUQlN8lXcmcH79s50MAGLEGMMkBwHn1vcSbSa5
	 K2idpl+KItwxd4OR5+UZzw9jf4gwwTy8l2MwYBuAowJteJ4U+cIGI3vIm2BbMaPAIdDwe
	 +3crCvKU1gZbHw7yYnGxUuThHbEmbQl9omGzoxeIR/0HvuwWSYF3Q2yenE7NzkiJYJw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 692E71F000C5;
	Wed, 18 Nov 2026 04:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794976499;
	bh=T4kCzoKB32EpMiqFKhGICJ/N3uaEhOaEXUffovitKew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FjrveZsA4lHQcepbT6T+3AGqpnQBhzAqDAmT/WW2puurqa8+OdPePtkdIrMWmJ0AC
	 mreqLHVwKi/y5/Fkqb149jTRVs+8mthHSir9F2eyWtXMy9WwtaX6yfK6NLxVtNqGPV
	 ZSgQ0U56O5lOS2ThBUIKrrUQYeG51ot/O+A+z7ITiU8Boz7k7HTcmPN7wLDkRAxWXW
	 dGPsssD/Snit30DjhHymZg1yIbpNUk1UYsiA0sKqVQvCQ9iJHwIZ9hxPXojG/xf1kV
	 tVz1gWBPEv6rBKYwYfH1hLHS0QqRnX6bVskwIipZRJ8rGWm7YOfJeC4aveOnYr77VY
	 6VnK6s7MXi+YQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DC2C54ABD5;
	Wed, 18 Nov 2026 04:34:57 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 04:34:58 +0000
Subject: [PATCH v5 1/2] usb: core: Pair ports of different hubs through
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
Message-Id: <20261118-usb-port-pairing-v5-1-5f1a26789270@gmail.com>
References: <20261118-usb-port-pairing-v5-0-5f1a26789270@gmail.com>
In-Reply-To: <20261118-usb-port-pairing-v5-0-5f1a26789270@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mathias Nyman <mathias.nyman@intel.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976497; l=9307;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=dCXLHugo9jOGf/glpYvz0R7Q+JNowSpJvKwb4Cm8/rI=;
 b=3eBYlpOuPyKv+QBTHqOlhHw6MtjciqjQJyEDrSIZqb7GjelCH4/tYzX+NDPKR0uuYl885zCT/
 z/+USaCX186CsbPQdgsA+Kgm82LMwXYNIk+JQ6gP/7X7dz5pHyVLBI6
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
to different hubs, pair them through the connector. Root hub ports are
found by the controller port number; graphs in the dwc3 numbering don't
match and keep today's pairing. connect_type is looked up the same way,
so such a SuperSpeed port reads "hotplug".

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/core/hub.h  |  2 ++
 drivers/usb/core/of.c   | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/port.c | 70 ++++++++++++++++++++++++++++++++++++---
 include/linux/usb/of.h  |  8 +++++
 4 files changed, 162 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a32..a186c41bdb5e 100644
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
+	bool connector_peer;
 };
 
 #define to_usb_port(_dev) \
diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index a6ee20d8774e..df789cef265c 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -145,6 +145,93 @@ enum usb_port_connect_type usb_of_get_connect_type(struct usb_device *hub, int p
 }
 EXPORT_SYMBOL_GPL(usb_of_get_connect_type);
 
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
+ * of @port's connector leads to a different node. NULL otherwise.
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
+		     !of_device_is_available(peer))) {
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
index b4452b665f59..da7037bbbf57 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -649,10 +649,44 @@ static int match_location(struct usb_device *peer_hdev, void *p)
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
 /*
  * Find the peer port either via explicit platform firmware "location"
- * data, the peer hcd for root hubs, or the upstream peer relationship
- * for all other hubs.
+ * data, a DT connector, the peer hcd for root hubs, or the upstream peer
+ * relationship for all other hubs.
  */
 static void find_and_link_peer(struct usb_hub *hub, int port1)
 {
@@ -660,6 +694,7 @@ static void find_and_link_peer(struct usb_hub *hub, int port1)
 	struct usb_device *hdev = hub->hdev;
 	struct usb_device *peer_hdev;
 	struct usb_hub *peer_hub;
+	struct usb_connector_peer cp;
 
 	/*
 	 * If location data is available then we can only peer this port
@@ -671,7 +706,27 @@ static void find_and_link_peer(struct usb_hub *hub, int port1)
 		/* we link the peer in match_location() if found */
 		usb_for_each_dev(port_dev, match_location);
 		return;
-	} else if (!hdev->parent) {
+	}
+
+	cp.np = usb_of_get_connector_peer(hdev, usb_port_graph_id(hdev, port1),
+					  port_dev->is_superspeed, &cp.port);
+	if (cp.np) {
+		bool found;
+
+		cp.port_dev = port_dev;
+		cp.peer = NULL;
+		found = usb_for_each_dev(&cp, match_connector_peer);
+		of_node_put(cp.np);
+		if (cp.peer)
+			link_peers_report(port_dev, cp.peer);
+		/* Without the peer hub yet, wait for it */
+		if (cp.peer || !found) {
+			port_dev->connector_peer = true;
+			return;
+		}
+	}
+
+	if (!hdev->parent) {
 		struct usb_hcd *hcd = bus_to_hcd(hdev->bus);
 		struct usb_hcd *peer_hcd = hcd->shared_hcd;
 
@@ -703,7 +758,7 @@ static void find_and_link_peer(struct usb_hub *hub, int port1)
 	 * does not have location data
 	 */
 	peer = peer_hub->ports[port1 - 1];
-	if (peer && peer->location == 0)
+	if (peer && peer->location == 0 && !peer->connector_peer)
 		link_peers_report(port_dev, peer);
 }
 
@@ -754,6 +809,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
+	u32 graph_id;
 	int retval;
 
 	port_dev = kzalloc_obj(*port_dev);
@@ -766,7 +822,11 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
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


