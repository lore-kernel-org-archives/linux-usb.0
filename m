Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795082605;
	b=eHyta0Mm1QgdTW9O9afn62JAdticHteOq7o8GtAB+D/gPuYO765rQQBZfrT5HxNAjw6R
	 Zj4i3Zim3lbwQ3uEjef1gFMu0cbwiEPbepB8u7CNmOVyEqnZjQLdMW+nCIoJDk8j7NrbH
	 Y4FK1hnDmwT4VS5GJ45iEomayCjg7wWR0LTWya/6pN/ASA/uJArnTP0Kq6X5CGuT4NXPU
	 OSh2Yj8je5+oeIW1U+mS6ySQdKpdUz4e+y6BnoCf4zFJLy6XGw7GLuZQ2CzOrrNBslLZr
	 BKq13vvUHCa8d7bNKs1HRm28p7ikQ65Zp+f7iTV5nY0gyg2IUth/rHWpMH76uly8czg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082605;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V83kY3lyc9x0O4e7/cL8Qi8qPK1+LyFJCxLQcxl22Kw=;
	b=UVftD5sojDOOKYFpj0vdz8mxzJxO0FxWgNZmgFvfL0qWbpifXNiqLBijOaJb3FXPhFu3
	 CplPNzOFR8XkJNnu/ZbggqjhTw3TfZ6Ym3SinwDvyHXhNaCDAFtLK80kJKetXkIvgg66w
	 qWykqLM44Y/qn391YQcpnhQjBmpcGSj5yne2ME0KkK9vJSdJrDO/dZ2oLwrQiiXEgM86z
	 j/z84MRguhApaNTZjOqwYxIjhfZloE0aG8Me60Z7HmrTuWjW/v900onD2vvwAFU0Uh4n9
	 vnPEWTSdmR+sWE4JOmAwKL3lK2FU8IzXQML0u6PvUva3IIQVbmVKSeJ6aqiN/FU9o5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3rPq4wR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7705606A32F;
	Thu, 19 Nov 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b3rPq4wR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795082604;
	b=yISIbBzv/+kSyMCdxVYwEe0micLp/qqjZSpvmhrUUKoSRaL2M7sQDxuSyTZ8hpYFuuf+
	 p9Q4owf9u+0XrIjfsC5RZq3iaZby/0UVD6qB+BYo0CQXHsDoKTXj8J94CMX6duVNjbOKE
	 dzKS9DdoYkGCpaPwl5wd8EjeFtSyEHlctdndI3XSEE/pySs6DdqallWbQrATnJ+79yVU4
	 FdFGazfiBaw3LLqQpIVSyRQg0IoXDgP8s2/+s0+2s2DzvS//Sv95Bk/f1EsHgkxOfo/fs
	 FdllTS+zipFOYoHdcU61S/G4ZC06xiUJpjfgOXSZFznccISQcAJKk47GbUIMlLYfE6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795082604;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=V83kY3lyc9x0O4e7/cL8Qi8qPK1+LyFJCxLQcxl22Kw=;
	b=F2RZ6yaW9WPRO6KNQ2DQSozbrUWNO92xbW8rLu7Whf2UdmXqeihWedFgL6Ibralf0VsH
	 GRC4yzqSydFJDIV7xTZt8e/k8b+YAnMa5m+NO9Fu4SXLQYhCUJxre0uDURUM2d03M0uZ/
	 WhDO8E3wzOjUjpJ+1fGfmImXAk9bkD+uhS3ck4Qf3kKCiY42tsuQ8viuxeWlh5TTd6RlX
	 Z4Bdn0xC7cmW43xGP7/Kp6zOjyaJNX97I1tqEbpXugBaryXeKdOiM8X2yHZY/pQwvD5wR
	 NMm2Mb2zeIDfZwFhAK6ChlLa/7ds3jau4/mxQsPDEhaB4D5sXDYNQ6aX7H4ryO+D6og==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9F17E1F000C6;
	Thu, 19 Nov 2026 10:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082604;
	bh=V83kY3lyc9x0O4e7/cL8Qi8qPK1+LyFJCxLQcxl22Kw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=b3rPq4wRjmaJx/m5jqlix9E5beo2PIkuiEpxGoPbkqAwr3qe/wsUx11emCf5zNylV
	 NPJ8R06LnO5IqM1gruhdLk8XsXNxOPpu9ljWHOzTdda1bgzphS3G6e7gt+GFKGP79F
	 Mx2edpLTuJwE6IAurq7UlBpLUXP04XZhK5BifnajBCRJ/2He91ifhkPSdECoITz/NH
	 LJlgxTZJ5WKs+zMun8wBb6G4zQSVHjk5WiaIkIkWzj5wV287ioK03X+5Mi49qoKIkM
	 6Pw/eFeKBMMa6Dl+ypurteMNwzf5EwkzNb9Tt13vsrK9nDv6bg7vOmyVsNgboxg+Dv
	 wGRthAsXHyR1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2C2954B20D;
	Thu, 19 Nov 2026 10:03:23 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 10:03:24 +0000
Subject: [PATCH v6 2/3] usb: core: Prefer the graph for a dwc3 SuperSpeed
 port's connect_type
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
Message-Id: <20261119-usb-port-pairing-v6-2-32bd7e36e426@gmail.com>
References: <20261119-usb-port-pairing-v6-0-32bd7e36e426@gmail.com>
In-Reply-To: <20261119-usb-port-pairing-v6-0-32bd7e36e426@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mathias Nyman <mathias.nyman@intel.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 Rob Herring <robh@kernel.org>, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795082602; l=5240;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=KsWtuLjWwsm/3S5b9Wgk8+L57380sZNHdrIzJU6t3W8=;
 b=QzujBTqJRDwZncyjvg1KFzQi54QwpLQgf68LE08txdEMyaex74DgOdxWmKKrzz3pUg2C1E1zo
 RAWRXVGs3hoDCd/7oO0K4JzwlDhN6jxbXg6CIZqpqSUktyB+yrdrA9Z
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A SuperSpeed root port not found by its controller port number gets the
connect_type of its root hub port number, as before this series. On a
dwc3 that is 1, and a child node with reg 1 is the USB 2.0 device there,
so a SuperSpeed port with port@1 to a connector reads "hardwired", and
its devices are "fixed" and authorized as internal.

In that fallback, port@1 leading to an available node means "hotplug".
This changes rk3576-lckfb-tspi-3m and sc7180-ecs-liva-qc710.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/core/of.c   | 51 +++++++++++++++++++++++++++++++++----------------
 drivers/usb/core/port.c |  6 ++++--
 include/linux/usb/of.h  |  5 +++++
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index eebfc9cd0c88..5596936c5605 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -90,6 +90,38 @@ static bool usb_of_has_devices_or_graph(const struct usb_device *hub)
 	return false;
 }
 
+/**
+ * usb_of_port_is_hotplug() - check for a hotplug port in the OF graph
+ * @hub: hub to which port is for @port1
+ * @port1: graph port of the port
+ *
+ * Hotplug ports are connected to an available remote node, e.g.
+ * usb-a-connector compatible node, in the OF graph.
+ *
+ * Return: true if @port1 leads to an available node in the graph.
+ */
+bool usb_of_port_is_hotplug(struct usb_device *hub, int port1)
+{
+	struct device_node *np = hub->dev.of_node;
+	struct device_node *ep, *remote_np;
+	bool ret;
+
+	if (!of_graph_is_present(np))
+		return false;
+
+	ep = of_graph_get_endpoint_by_regs(np, port1, -1);
+	if (!ep)
+		return false;
+
+	remote_np = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+	ret = of_device_is_available(remote_np);
+	of_node_put(remote_np);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(usb_of_port_is_hotplug);
+
 /**
  * usb_of_get_connect_type() - get a USB hub's port connect_type
  * @hub: hub to which port is for @port1
@@ -106,7 +138,7 @@ static bool usb_of_has_devices_or_graph(const struct usb_device *hub)
  */
 enum usb_port_connect_type usb_of_get_connect_type(struct usb_device *hub, int port1)
 {
-	struct device_node *np, *child, *ep, *remote_np;
+	struct device_node *child;
 	enum usb_port_connect_type connect_type;
 
 	/* Only set connect_type if binding has ports/hardwired devices. */
@@ -116,21 +148,8 @@ enum usb_port_connect_type usb_of_get_connect_type(struct usb_device *hub, int p
 	/* Assume port is unused if there's a graph or a child node. */
 	connect_type = USB_PORT_NOT_USED;
 
-	np = hub->dev.of_node;
-	/*
-	 * Hotplug ports are connected to an available remote node, e.g.
-	 * usb-a-connector compatible node, in the OF graph.
-	 */
-	if (of_graph_is_present(np)) {
-		ep = of_graph_get_endpoint_by_regs(np, port1, -1);
-		if (ep) {
-			remote_np = of_graph_get_remote_port_parent(ep);
-			of_node_put(ep);
-			if (of_device_is_available(remote_np))
-				connect_type = USB_PORT_CONNECT_TYPE_HOT_PLUG;
-			of_node_put(remote_np);
-		}
-	}
+	if (usb_of_port_is_hotplug(hub, port1))
+		connect_type = USB_PORT_CONNECT_TYPE_HOT_PLUG;
 
 	/*
 	 * Hard-wired ports are child nodes with a reg property corresponding
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 154f6bfc0805..2cb23fa9f75f 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -836,9 +836,11 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 
 	graph_id = usb_port_graph_id(hdev, port1);
 	port_dev->connect_type = usb_of_get_connect_type(hdev, graph_id);
-	/* dwc3 graphs give the SuperSpeed port port@1 */
+	/* dwc3: port@1 is the SuperSpeed port, child reg 1 the USB 2.0 one */
 	if (port_dev->connect_type == USB_PORT_NOT_USED && graph_id != port1)
-		port_dev->connect_type = usb_of_get_connect_type(hdev, port1);
+		port_dev->connect_type = usb_of_port_is_hotplug(hdev, port1) ?
+					 USB_PORT_CONNECT_TYPE_HOT_PLUG :
+					 usb_of_get_connect_type(hdev, port1);
 	hub->ports[port1 - 1] = port_dev;
 	port_dev->portnum = port1;
 	set_bit(port1, hub->power_bits);
diff --git a/include/linux/usb/of.h b/include/linux/usb/of.h
index 4be581bd2758..6de8029749b4 100644
--- a/include/linux/usb/of.h
+++ b/include/linux/usb/of.h
@@ -18,6 +18,7 @@ enum usb_dr_mode of_usb_get_dr_mode_by_phy(struct device_node *np, int arg0);
 bool of_usb_host_tpl_support(struct device_node *np);
 int of_usb_update_otg_caps(struct device_node *np,
 			struct usb_otg_caps *otg_caps);
+bool usb_of_port_is_hotplug(struct usb_device *hub, int port1);
 enum usb_port_connect_type usb_of_get_connect_type(struct usb_device *hub, int port1);
 struct device_node *usb_of_get_device_node(struct usb_device *hub, int port1);
 struct device_node *usb_of_get_connector_peer(struct usb_device *hub, u32 port,
@@ -41,6 +42,10 @@ static inline int of_usb_update_otg_caps(struct device_node *np,
 {
 	return 0;
 }
+static inline bool usb_of_port_is_hotplug(struct usb_device *hub, int port1)
+{
+	return false;
+}
 static inline enum usb_port_connect_type
 usb_of_get_connect_type(const struct usb_device *hub, int port1)
 {

-- 
2.55.0


