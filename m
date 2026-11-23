Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415126;
	b=qPth3wnKNTXRw2Fj18pbuDCWigoXlljF3UQehBj0IHtI9MjI+ct5AeTFtmufEA3mc+n1
	 Xs0+72zwbI0XpzLA70Mkm+6TpbZV/tISzvyFnC/3cihUKRlPxm+OHBUl16DG+RBLFmlzW
	 0niGWz/jjmPg7nGKaGmB6HIRR3lIlXV38awpIQpfZpoLAQ+zyUIHRWkSIftRDSLZBnjtE
	 1wEv4CwfaqFpyXJouK2RiVJkTIAhLZUgvOHGUbdAc+4Zx8YScacLxn7LDzotefPolCCgp
	 M2FO8bdMo/rMWemZJAPe9ajfSRqPs8GJAleAleXrbW0AzbXMjx57rGceAvEuBJVL2NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dXo8tWHfjpJRVP3X4QZLKcOAikBfHSnWZfGPwWhnZ/0=;
	b=u8nF4oYedKS+c+1FlQmaWP64WENwLJts9VwKX4rsCziDswegEoE5BnrDBe01JBKA6sxc
	 a+JYcIA/BlxgLbSvEMyjG79Snuvdpl68ELOB6z2mHZQYFcl3z/jQdoRVpTFvr5l9PH3hQ
	 nrysFk4peFxOYchk7rlmv8QYakcd86LhHNbJzZqocTM/R8DF4VWRrY85LaL0BhnwDHQ90
	 nhjxbD3pj15nm5hebW9l/7Sz/ylHlcy7ajLsgs5NbOzaVTx6MAtpxDVam75aTFLQ+4UVX
	 nJBuucGO7WSLk+vN8PvHer3BUyGDbogdqSTC2MONFvVAob8hbsc+eoZmNCWALJlFBMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D170la6g;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC7606A32A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 06:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00EC7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D170la6g
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38644aedba1so4225390eec.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 22:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415125; x=1796019925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXo8tWHfjpJRVP3X4QZLKcOAikBfHSnWZfGPwWhnZ/0=;
        b=D170la6ga4/y4vsQ4QIWIcg2h04c5gM+Y2q2GVo5kHUg+IMdH+WRaK+f+iQlPFYhv6
         QuVz0ZtCQ+noLFopmwakgZFXm9+41GASqws3fD6s+HBjqmQ50O+7SRfITbdAs92wgpTE
         OzWHUTv3v/lkpBCwVHntEtk0SGQmXE6yhKbt8SiHN+Nmlz48C++/LCepREycGgggFa3x
         6XtmAxNRnXMne8NMRyRdegT/XxLRGdoKd4NNw6vg51wccLn2+Y9D6IF2Zii7T1Thkh/M
         eP1QyZJeuctMGs0s3hhD8YqFS5VTX/YXPOyboZOu4sb3lSNmUtpY/MaSbPrqQyRS6+IR
         JSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415125; x=1796019925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXo8tWHfjpJRVP3X4QZLKcOAikBfHSnWZfGPwWhnZ/0=;
        b=sXZ8zSAsCnUj9XEOqrHwRClHy1ceBZ8IHBcbZUuhaEya2GtlmsB98Xyyo5L6gCP8JO
         6u1qEFHEUb+i0/ZiXf3ygjWYorNUWzRyA0sciKWc9q/EBrEGzgsZ/esqGVIVb4hn/o7m
         EbVMcW1AcfWEGvuN3CqFQhE6NZm+l1Ks/ETVbhRq8IDZMGh3xXj6KtU6sC+usk6CQeDz
         xhcF+KnIn0blO/WDp9HeerxLYpQa/GH5UR2TxekFXJU3dZGzIn2vKTSKIuFbGzyynsTp
         2KKWEedjQPOUVhTZpWH5GYptXsRuAV0zuHc9458AHNl0BSbItjQj194UTm6z8t54JJ0/
         K63w==
X-Forwarded-Encrypted: i=1; AL+hErFiArM7hxdopeyWTbHkJxmSyP+oNGx/4mrveWVIwPQl6r407/9/QLOdAXq5V7IGp53naD5cOcYLVv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q15gPE5zOJMpbFGb0YCavDEcBe/1gqYp6cs2smv1pTL/1p++h
	xBY5xqjsmWx8btt2qAzTpsYZNST1DOvMtw9b5Gv6LSe+d0pjWPTPcIw=
X-Gm-Gg: AZFdTZfY+QVFyHZhYYhkpy76QulTvgE6v5+MDccErsT1pvuzsLS6kyc90suEjs08Gn4
	YiXaYJgTsntxbY0Q5GnH2YewZguyzKPD8sN24Nh3UA/0/oQHxklUJqWPsqoD76AJC2fTzPK3NNT
	z099KNTrZwPS+FGRdiKevTeXNXVwnorsP4pHg2E3KMbBMsK/2hBwo8jeKZ6+5uqUmYI0mIqXTbx
	KHhyFzGMpb7pPp6zusMdo+F2t6aIbsPe0PKnrApywjDKWgwCu6mkXNDyuMasJvi96z6Zi/ni58g
	kuZ08AXn2gpaBhH8OhLKCOop2SEA8mPsoTp2dqHUmpl/XoVEhdr2Uz6gkLCsHb6o8E8cmgW9hnO
	0JN7GJe29+FuVmgBzYC8KSpcUMqUxlOytPWUpzthxgIlNARMiUdwChF5CA+dNJ5CXq3Q7q0vYw9
	rilIhDRbxLskm75JqKT8eVlytGtCkmw5/wRRkvmyXXGvV91MP5m1Lf7LRzSZGeGvWvNQ3HGMxJl
	jDRvpzCinsUMjJ3EQ6JH9Z0a6Pp98CirPUelf6Y3imMTjH+kASkrWux504wJJBJfOdJP2QGzHiO
	+z8prAjaL+W9KOVO/snfSsIv+56T5c2/2TbYpwovTE77dK9/u7dEeU2mR/4/Ji1sKtO9Ea2nHQy
	3sE3Y6FGT
X-Received: by 2002:a05:693c:62d4:b0:386:ad86:21a9 with SMTP id 5a478bee46e88-386ad862c8emr2683229eec.13.1795415124883;
        Sun, 22 Nov 2026 22:25:24 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38577214c2dsm31398955eec.17.2026.11.22.22.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:25:24 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 01:25:17 -0500
Message-ID: <20261123062519.11531-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In All macs, the _PLD values in ACPI is just garbage values
and provide no real data, and that may cause errors like:

usb: port power management may be unreliable

On Internal controllers, with multiple USB2.0 and USB3.0.

To fix this we use Apple's own location methods called SSP
for USB2.0, and they use _ADR for USB3.0.

With this patch we get proper location and peering:

[    0.280281] usb usb2-port2: peered to usb1-port10
[    0.280298] usb usb2-port3: peered to usb1-port3
[    0.280311] usb usb2-port4: peered to usb1-port14
[    0.280325] usb usb2-port5: peered to usb1-port8
[    0.280354] usb usb2-port9: peered to usb1-port9

NOTE: All USB controller has bad _PLD values but SSP is only available
      on internal USB controller, and even only new intel macs has SSP
      method, so we check for SSP and XHC1 before using apple's methods.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
Changes in v2:
- Nulled location provided by _PLD in apple_get_location
- Fixed typos.

Link to v1:
https://lore.kernel.org/all/20261123053911.9856-1-atharvatiwarilinuxdev@gmail.com/

 drivers/usb/core/usb-acpi.c | 74 +++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96..403c2ff44 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/usb/hcd.h>
+#include <linux/platform_data/x86/apple.h>
 
 #include "hub.h"
 
@@ -199,6 +200,69 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
  */
 #define USB_ACPI_LOCATION_VALID (1 << 31)
 
+/*
+ * Set at registration time on x86 Apple Macs whose internal XHC1 controller
+ * has ports exposing an SSP object. Apple reports the port location through
+ * SSP (USB 2.0) and _ADR (USB 3.x) instead of _PLD.
+ */
+static bool is_apple_location;
+
+static acpi_status
+usb_acpi_apple_ssp_cb(acpi_handle handle, u32 level, void *ctx, void **ret)
+{
+	if (!acpi_has_method(handle, "SSP"))
+		return AE_OK;
+
+	*(bool *)ctx = true;
+	return AE_CTRL_TERMINATE;
+}
+
+static void usb_acpi_apple_detect_ssp(acpi_handle xhc1)
+{
+	bool found = false;
+
+	acpi_walk_namespace(ACPI_TYPE_DEVICE, xhc1, ACPI_UINT32_MAX,
+			    usb_acpi_apple_ssp_cb, NULL, &found, NULL);
+	is_apple_location = found;
+}
+
+static void
+usb_acpi_apple_get_location(struct usb_port *port_dev, struct acpi_device *adev)
+{
+	struct usb_device *hdev = to_usb_device(port_dev->dev.parent->parent);
+	struct acpi_device *hc = ACPI_COMPANION(hdev->bus->sysdev);
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *ssp;
+	acpi_status status;
+
+	/* Only applies to the CPU's internal XHCI controller. */
+	if (!hc || strncmp(acpi_device_bid(hc), "XHC1", ACPI_NAMESEG_SIZE))
+		return;
+
+	/* Location provided by _PLD is garbage. */
+	port_dev->location = 0;
+
+	/* USB 3.x ports use _ADR as the location. */
+	if (hdev->speed >= USB_SPEED_SUPER) {
+		port_dev->location = USB_ACPI_LOCATION_VALID |
+				     adev->pnp.bus_address;
+		return;
+	}
+
+	/* USB 2.0 ports: SSP = { "XHCn", <companion SuperSpeed port> } */
+	status = acpi_evaluate_object_typed(adev->handle, "SSP", NULL, &buffer,
+					    ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status))
+		return;
+
+	ssp = buffer.pointer;
+	if (ssp->package.count >= 2 &&
+	    ssp->package.elements[1].type == ACPI_TYPE_INTEGER)
+		port_dev->location = USB_ACPI_LOCATION_VALID |
+				     ssp->package.elements[1].integer.value;
+	kfree(buffer.pointer);
+}
+
 static void
 usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 {
@@ -289,6 +353,10 @@ usb_acpi_find_companion_for_port(struct usb_port *port_dev)
 
 	usb_acpi_get_connect_type(port_dev, adev->handle);
 
+	/* Apple's location overrides the _PLD derived one */
+	if (is_apple_location)
+		usb_acpi_apple_get_location(port_dev, adev);
+
 	return adev;
 }
 
@@ -377,6 +445,12 @@ static struct acpi_bus_type usb_acpi_bus = {
 
 int usb_acpi_register(void)
 {
+	acpi_handle xhc1;
+
+	if (x86_apple_machine &&
+	    ACPI_SUCCESS(acpi_get_handle(NULL, "\\_SB.PCI0.XHC1", &xhc1)))
+		usb_acpi_apple_detect_ssp(xhc1);
+
 	return register_acpi_bus_type(&usb_acpi_bus);
 }
 
-- 
2.55.0

