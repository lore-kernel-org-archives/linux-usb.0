Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2783C2761
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076644; cv=none; b=IIjfvBNysNeJX1DJv7ws+clLFIW6Fq3V6tENXPw8kQBDVvFhGE5aERta+X2ah3IeQN9RcBZdKy2nExWGnhXldUquQm4Hq1Y36sKPcZR9x9SswhnHHuBAougLLq/cO+5BqS7+Vw9VyWv8V7pxXbHrzPoxT0leDT0I5zUVrga/Uac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076644; c=relaxed/simple;
	bh=w4vzxOXOy9hhvavKl72p+0ZNQOP9ilFm/bOhh+IgREQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHSlV8lTIO7DfIYnDdEqe7W0MHWce3C/31h5tZmI6+kKFkYzLhJqTr0VInbEdVNWmpQ3W2DYyrr4ImoRDT2Kq7LWR1HJ93cwOUQ5nbYWXHq/XFf6fy4ua3wy9Qhsb8lC5dDimWEVWeKpFHRbxkXdUopBTB7sMEdYor7Z1iv1iWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RD5HGHTh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RD5HGHTh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so6006645ad.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076639; x=1783681439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=RD5HGHThJyE0lLrJ7vdOQemo+OjFzSm2KDwovhjH/5l8yGPX/Xb9hcDY6AQXJu3rHf
         Bta0XHTSwZJVdAGXrWOMy2uVCLCLWgcZ5vEpk/lR7p42hubZXPPbIsY2Hk+nDOnZsa2f
         Ns6SuFrCK64nEC3hhnAOIMCdJL0up7qwgkuJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076639; x=1783681439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=Zwzw971v/2VP6l30Xik+2rjoIGMKd0f4aHcmfxF7tkg6MQa5ylCaUKsbj6edmSEj89
         aSmxI78fLtYxUV7jxOyVm8OXmw/382Uds7g9amUNAXy7OB0PAegEaG4rTv0azZ1K/DwX
         /DFkVPrRanEe6j8jN7S/TI1yoLCrmGgkpuMa4i4S369UT5gatOidLmk//YZWk5VHM24+
         lLbEk+WnopteF0eydQtNIsjufo2Fo1tfJRg6xMnCPzheEoCA+qR7dA3tlyxbHz3ctdjh
         VzEQQ6NK70s2qEFG9cJMvxQH4dg6PJ20A69TKAr0u8Zc+japEx/g2bgki6lGD++Fxd2b
         5wYw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9qbegQqQhM/UPx2vufv25VCYK3DD0wiajfBkjmkTmmtXHJOiGui8DxqzYvBXsG2G+VwTnp9FzN3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL/qHFRhNhTcjj1hmIt02COCIJUBgSOLHUh/seiJ7LYz7oYntI
	sxi9KMdBDa17Yq6sIlcomnkY4DVDO0CE6Pu2EZUWKNWGYiV+EfQlcfLUVFmnHjsLpQ==
X-Gm-Gg: AfdE7ckux+oWEpQk26aSSwiKvqnHEQwzFHJ3LaX452r4vLt9touX/1QTZ5XGZYzJ/6/
	9luKmuLJQ9Qt8WxjLpmcV/10c86tyGXrkUMXzbwfMSXpZOsqtgaF7BCqjWPkUHZvM7PAMSHlsOO
	jyyPAU+63KmFGCYMAK0yZV0HE9SA9eonnD8DUmZdmQ3XW+hiuFiBLe4oCfP5EHrX6HUchp4i1a6
	bqMPbTW8oQSWwfqdalrqoukEEWmi+HBSeQKmBcUzS4MmQr9+ZRRUXv4GLte2IOUdZWz4Yia6fHC
	649oGD0FtiNpFUSnfSELNG6jAWAA3+7X5cx46z0ZW9z9XN9heZqKvigcrCCstVQtQ8QLAj4kd1A
	5x3srNVMNXwnG/mggQMoXqHUgP3H6uM2TbTMPdoFvn6zbrsLIZ1hRSSpt46a+mT8Pt30rqjWYCa
	lYilVubUlDf46IeeQ4Cjq1XQUjqaQC2UVGNS6DUhdawd0N/J+F0PoXrXxy1VPpQ1MseJPPMA==
X-Received: by 2002:a17:902:e5c4:b0:2ca:d874:c6de with SMTP id d9443c01a7336-2cad874c884mr19763035ad.26.1783076639217;
        Fri, 03 Jul 2026 04:03:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:58 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
Date: Fri,  3 Jul 2026 19:03:06 +0800
Message-ID: <20260703110317.1283411-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Skip assignment if hub firmware node is ACPI node

 drivers/usb/core/port.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1088776ef750 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -780,6 +781,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
+		device_set_node(&port_dev->dev,
+				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.rc0.799.gd6f94ed593-goog

