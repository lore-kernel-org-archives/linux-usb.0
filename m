Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A791146D0B5
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545594; cv=none; b=jEu0Eg7U1N0PgexF/PrYcQSXT/nVc+wJdiakW/sY+vs3yA9ctnMOIOiriLABW9scS5G4VMPG90+hcr4E/KSnrwcQ9KnltA7GhlRoupCPG7EZZ0WQ5wbfO4zRRT7st/+N1M7+KlxE5JnpUTElalDeyL7XCxfOzbM+kdDl8XQI+os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545594; c=relaxed/simple;
	bh=/ZoutxQ0ZJmBlGurPpdzCW+RhJfBFL4vY9B17VjHF/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSPDowjMIl73hr3/Y3xpsvWjQIEszOO1asoe3QpFeWP0ZtxHHhsna81EMDABEHD08HS3x9YqimwDNuTpcCvs4Yt+uvtSQ2d6HPNCr7M+m0qE/SxOXnQfkQrDTc6nS4rVuAl3ULV7Pq9+90aW37gUPY05IuhLv4s/tEJT7iOAToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FBTGVx+X; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FBTGVx+X"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba91so453678a91.1
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545534; x=1790150334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FWq5hvO3hBRGVn3uOxsC9S/weGAcU55UsXVnM8MhFFA=;
        b=FBTGVx+XreBB0No3JY3I1ljaehiVfYG95okspG0lIcfJ0ts3QzC1LMLHABTdX2yWWp
         9PWU/Ydh3Q+uKRyFcruT0v8o4FC17PT3WMMrKYJgcaRtDafztky3V1p6FKZnq9xp9V6t
         Ospvv7BQNp1T2bA4cyb4AUR/7wmr/dmYv5J8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545534; x=1790150334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FWq5hvO3hBRGVn3uOxsC9S/weGAcU55UsXVnM8MhFFA=;
        b=irWI/JiElH550EIsoKExrR5Mnm4IrFf4+fd09yYdNgtEs33ijE67XkM/1o/D4zKuyS
         uLM1svI0glQR9JbnEcIO0xYciTYj1xYRFGXe6DtIOteZyquDFlwrzLHiVcqJV4mzvH8N
         JS16vcOphoKOuluozTycbo19GCsR5/TByUYTDV4D4rpDZr3oDzO1LUvzvoX+umJDJ9Cx
         /1Os02yvcGJTxaRhp21Fv3qv7kQUUXTX8B/HmGCXAWJMhAmA9OArI9PxrxGGpST5Xzvx
         64Zhy3kwX9AARt3gZMJX0y2b5nZ7WDsWKI3sODe1htfdjzcSWvZuOe0G9DHM+Xq3RoIn
         5USA==
X-Forwarded-Encrypted: i=1; AKwUvBxCaYvcYc0stjArSMvnOWIXoX4A0Jp3//nAr/KClNlgdbaROHK7VIvZzy7XwRDueUR380rSk6gSKWs=@vger.kernel.org
X-Gm-Message-State: AFuF++lLTgmgXF0BozQIDAh/Cf/R1oFtaRlTtLcey21I3qlzz8tZZHY6
	CUTs8Micy0ohPUXaDOiL2IFPYtcx0EY9tNfNHeaCTgTrWZpJTHdYBxedLRZR2DFoCw==
X-Gm-Gg: AYBFou2jligTkKmD2Vc3UJ67AQEcc2BN9dMkt49QvElLqPqtM3crCrIDQ7xw/OrdRRy
	jUw65u4AkxBfH30vDtWK2MIYw/UlQeJDqE4QMxCUTzUyQNb/NpGKho5oCCRCppJ+1h7rD2qXJYH
	yjekoMItboKq8FvaUt2f7ADjded8KtNsTMlNf34Jiu9beIOpyBROahg/ZT/WQq+pJ6ATBeNfFcY
	FZQJbQ2FEqkl23PAclOMBDY7pAigKk+t5Vpva63Q9VPfuFLQC+uOtojuGa5fde/g64b2nroFvkg
	P4Q20gvXtui9TgCK/2jGZjI/vaVrMVb6Dzy7zsdnaWoMrC1UWmcb6lPODKqLBE+EzR1tOEcTXMY
	teTjPEWhbrKk3gJPExVzX5I6EpraS4tDyjLAE4LXMIQDUIaqElWWmUZXlM16B0fv7xeOMMovcv7
	FFtz4CEPr0rBdZ4y9JSyA/Ok6VZCmVTVAU6g6OLGos+qhby4wDSyFwmuiZ22DA7QrlCpMordoE9
	3C/2g74hBL5NTt6zFEWBQ+f4DTQMnoDesRz/c5LNdg/YmHy+IES5RcxARHDEV+tpnuv
X-Received: by 2002:a17:90b:2d4f:b0:39e:1b0c:4773 with SMTP id 98e67ed59e1d1-39e1df86c10mr4199444a91.0.1789545534152;
        Wed, 16 Sep 2026 00:58:54 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 06/15] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 16 Sep 2026 15:57:32 +0800
Message-ID: <20260916075745.3549953-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

To avoid potential conflicts with ACPI firmware nodes and then causing
power management issues, only assign the firmware node if the hub's
firmware node is not an ACPI firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added extra |struct fwnode_handle *| local variables to shorten lines
  (Andy)
- Added comment about passing fwnode_graph_get_port_by_id() return value
  directly to device_set_node() (Andy)

Changes since v4:
- Dropped unused |hdev| variable
- Added flags for fwnode_graph_get_port_by_id() with
  FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
  ports can be connected

Changes since v3:
- Added missing fwnode_handle_put()

Changes since v2:
- Skip assignment if hub firmware node is ACPI node
---
 drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..c0a51d9b06a6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *dev)
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
+	/*
+	 * At this point ACPI nodes and swnodes have been removed by
+	 * device_platform_notify_remove() in device_del().
+	 */
+	fwnode_handle_put(dev_fwnode(dev));
 	kfree(port_dev->req);
 	kfree(port_dev);
 }
@@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
+	struct fwnode_handle *fwnode = dev_fwnode(&hdev->dev);
 	int retval;
 
 	port_dev = kzalloc_obj(*port_dev);
@@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(fwnode)) {
+		struct fwnode_handle *port;
+
+		/*
+		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
+		 * or NULL. Passing NULL to device_set_node() clears any associated
+		 * fwnode. It is effectively a no-op here, since no fwnode has been
+		 * assigned to the newly created device yet.
+		 */
+		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);
+		device_set_node(&port_dev->dev, port);
+	}
+
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.1032.g73a4cd73de-goog

