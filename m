Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C4F3DC4C9
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105692; cv=none; b=ITyelBQw6g6LFM7dV1OjHgEvaV6T8TLit4QMlk31UsJXN7bXFd2yVcPHi2U944SSR9ZaqA653tn8NojFb8ynsmSENMY5GIkQggn0bgraSuqYIHILcw2xH6I1+Ip+UAKuuRDK6rTKhmenJPBYxgficqROgxGAjOEJHK4mS7jLBG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105692; c=relaxed/simple;
	bh=9nlEv+Xa1sTuFoWhPSW1h4HQ6sr9BjtVm0Twy1kDFGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k0iXRTPrPmnBmKzfbZ7LXsuYwUlMcJYuYggsWT3WS/yLlloYa2rSserbIc8bGgxSclga3a9+i/Cy+MdCeNua6UOnpErMnTA1B4IOodkdu/49WoVuZJ9xYYzEWgXudEa9X5QN5w0rmhPEVGGND7IL53bNlWxmJgXFvKQ88qjdH58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Px+LR3Na; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Px+LR3Na"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485ef63b68so4701240b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105686; x=1784710486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3MWujHDcAo6N5pm988slASDpmZJoFPb9rC5ReM64M0=;
        b=Px+LR3Na5thCg3SeVAiEA3tfSCt+rvACYsEPDHMJIG7EETxCyIyPOFfs+3jC+Sp7yw
         3TY8Q8ZyVsfesqM/WRRPbpoFAMJzUDp8IjCcdWS0+4ZHXlslusKO5SPdREx8for7gXEy
         7w7vJ1yShUl5gefWKwUbRDiN0pOBupC8qKVGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105686; x=1784710486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e3MWujHDcAo6N5pm988slASDpmZJoFPb9rC5ReM64M0=;
        b=sunMR/cQkUt/qNZQpMAhwqGz+BtWZghkyoQRiHvb9VJQK1Hc9llh+uyRw2Lui7Aoee
         WYKX1LFf/Xo+4S1p61WcaaysNaJj5yZZKxBO308nPDclbSLO2tpC3ugzZCynL/Hby4pp
         GcuS97tpvN31R8/HGLlJcCpRO+hekr507Vgf24WjeH6ywBbmqkqSUDqJ0kkB2H7Ea5FL
         4sXHE01Rbk0BqZBGSuR8gUYDHwdirjrWhw/drjpYaEEvwlb5uroJWlW7A6U0LrwXyYg9
         Uv2zR64OAO2vfXEHq0G7p+caMQHoJ2ByR/V3BDndrQ2XyzVetpIZmIgeKDnk4gMrDLTQ
         iQRQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjASGLXLGyw2JRwtNzTyKEn1mQgc5zcmOS4cVUwnVZL0tPRRWmLBDeGVoGjBvm+mMmHbcLNPQ2yPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymq/NQXklqQb2Ba8lqj5h5OTsfSOBEBXqptIiq586nU6UfsQ1w
	S4tTtHtZm0vELRWlXK0YzORWnyA0xzajFYhWaqdbGTZSSemMBE6mL6tnLxdVU0y7YA==
X-Gm-Gg: AfdE7cn6wVNfl9ABBf2l5sPmUX8h2AIAO40V8TeVR+ewGg5ewcoUkjr0BiuoTXYaBsk
	iO9cRiEu17TgmbyayzlG15+yIciG1oF3IneML1dXueLIMAJZOnn9iQJ8fj5M/eko3ztIUHmQkiy
	ZB3fqwE2CLs0czGFME8JWmqELE9QinItR+LyZSrVWhe03JZBUVGKeLXbti50Ks1mOjZyFoMXPsy
	b+1yCIgW9C8OtlJaKKt9R4NBOJxZiNl7hWypz2jvyUax9qxpsHE7qXVXJ2ZsQTdhEAF9KFtcRuZ
	D7+WEuFpZJHrbqaYD+flpul1XKeS14s45fP5rtVP+l7qbWKXJuFLLNe7IJlJMhghhtSaeCgQ+1q
	hcfonP5mh4XY7d1Q7uaXXHGQuxC491LvHReI4oOieEndADow74KR4lTaTuRe5PWykyloAzSo8ZE
	w9lqwBB8w8izCwvACMNnT4r6JwtLTQyyZZbLOc801skrLsux4YN9ri4YsOVgv8bT0htgTrnQ==
X-Received: by 2002:a05:6a00:94d8:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84a554fa4e8mr5539619b3a.11.1784105685669;
        Wed, 15 Jul 2026 01:54:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:45 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v5 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 15 Jul 2026 16:53:36 +0800
Message-ID: <20260715085348.3457359-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
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
 drivers/usb/core/port.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..4fd0a4745741 100644
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
@@ -780,6 +786,14 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
+		device_set_node(&port_dev->dev,
+				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1,
+							    FWNODE_GRAPH_DEVICE_DISABLED));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.795.g602f6c329a-goog

