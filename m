Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17441BF33
	for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 12:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784465785; cv=none; b=RIRaoWYw4k2H5gU4tNppfOZVDyjLvn79FwlRzYJph88536HVdR+yw6wYb4rvdXAofoTHlddRkeO9FwAaoT9mCsY45VyXoFAD4iWPnmgqlFYUn1xhc80W9EVx/tBbSgxiMAvbYbzrrj6kA89KYey7iyL4HYgtVnnavHNnwghISyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784465785; c=relaxed/simple;
	bh=5zvKnd0JD5ih/+cLM7K1dUL0S6yC1cEB7EpZtuHweFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UUP42lBnhGgprNwZxkk6tUML4rtfM0HdjfZ5SvfuZyFW2bONMm4P3fgZGqHVdkwrl3BaisbafAe/Mo8soDnPiPYW5QPSN3XqeqZ9WwQTsueXxddPW9e6Z0K1/30QqcTb8Zbsdw9ORxcX8182FRLpRJFh+SwjVWHeSgc5a1DgO24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jztYGRF8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jztYGRF8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so2087313a91.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 05:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784465783; x=1785070583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaeHrzDwq749xNqEBv7Hp6+uBqLf+sS5NmRKMPCInEA=;
        b=jztYGRF8x/pCoppTkp/2pgMTocATSWQQ+qA3aIDJYhIID8e/k6zCtz1N/JaY38mtiq
         oZlHqTns/A05IXOOHW9Qfvc9fyppJoISOEVeIxNMpTdMUEXD2upXwrUl6+4/iR8gDahZ
         xrlTYoXpxyqo2XmcG2FNQ5o+OuaaR8izR29o3KVJG5xQe1GS8iab4YfwAu3+wrzaKn4k
         3WNDwtLe2BJJv4FO21Gjtd6RJcoAUX+WMRfuCHStGTfqVI91KsqXjSSBjKfugWtbZ4dL
         nCvAQYGKxI4P+XpL3+zx3c5StLzJGRWzSF+UFNKWVcL9d+ADCJ57gASkmhtnko6Ev/jJ
         oo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465783; x=1785070583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaeHrzDwq749xNqEBv7Hp6+uBqLf+sS5NmRKMPCInEA=;
        b=FHUv/tj2+O35vEEFZxKfDwbRinv4rp1ziFf+zua5KJrP97KGETcHBjsXAqAF9NS/nU
         eBC9FHB6Lq2p+BF17YRIc4oU0SPYJeC+Lzik3W7Tw9yzGtIdLmO4piev7Yy4HAnIX02I
         J8VAzZMWv9StIw0jfJ1jkK65urvXNcQoqQCYlrf7BeNbmTgMlbuFNPiUKO3QbJ6AzeOy
         QvHRIExtR9o1YYwUtbijRvZ1JEh2KqQBW8lFSomexAavWbaSnoi27KJE0/2iCwCWSCbo
         ICt/VSfxyRn9x1myx9l9PJtgq3KCcInRf+HP2U8AyQkHZl1tTsbWo/UBY3qKQAhyeREX
         /VQw==
X-Gm-Message-State: AOJu0YxFVZpWBdjrr60v9ssM77eGICv11ZuZj7qiuO+J8Lsd+Vqc1Wid
	l5QdRZQnJ0j3IGwqQiWrkxogQc4yJToD6MR8NhQ66x6fI+gnPcCE2zwp
X-Gm-Gg: AfdE7cmIYreRmPYVOgXhQOoe2NyefHoeQLR9Y418CARRDyJY/10W+e2Jc1hSpbXNHWq
	kl/UKpnLwZ/UvSmlK+mLr4NpROY8kveljD4Ce7nV1Up6fzWw749abkpPhJQBAwC8WIxcy/byS+J
	tIxxrBmIm522QcOxhsKEZVhVfMJfXUU+ifan8MSykxH/dhuI/I3sqExp3clxYQ0gSetXRf8FLjR
	9uzoxbBttbRMV75WdE1kedBRzBzfOLfiLbu1jv9wCoGtZ6mlmF+xaNI5rZuK0VdH8lBoc+ZDhfc
	rvPkf83/ylpf4wANJNBpeZeEOnHhX8wiuoLHIaU1OGNm03ADO5F8xBEgmTD+B0hSCMassRCUEq5
	HtZi89ym0UtJ0Btu4IvUoWyjyq0YR9nSemUIbp2sGI3dhxeiT6N/ZUgcP6gPdGkavu8ArV4Mp9n
	wdMoDPzOsWgCLgFw==
X-Received: by 2002:a17:90b:1fc3:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-38e3d2b11dfmr16744203a91.21.1784465783164;
        Sun, 19 Jul 2026 05:56:23 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:edd:423c:25d9:f95a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm20990052c88.9.2026.07.19.05.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:56:22 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 19 Jul 2026 18:25:47 +0530
Subject: [PATCH 2/3] usb: misc: Use %pe to print error pointers
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-usb-ptr_err_patchset-v1-2-85f7f2e4fefb@gmail.com>
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
In-Reply-To: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784465765; l=3927;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=5zvKnd0JD5ih/+cLM7K1dUL0S6yC1cEB7EpZtuHweFE=;
 b=ql28qsE4EWaYsxnuq4JZUcJCPFY2lrNmFjQWb9Rd/+w5VfSlKcXCXOhlFyrJi7M80qTF8IpCY
 OaddRPOw0BcCS0eedCYsSCCl31WLSBEf+wArxIm7CVH02A31l4uhy6q
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in various drivers across usb subsystem.
This prints symbolic error names (e.g.-ENOMEM) instead of
errno numbers (e.g. -12), making error logs more readable.

This patch fixes coccinelle reported warnings:
./misc/usb3503.c:206:5-12: WARNING: Consider using %pe to print PTR_ERR()
./atm/usbatm.c:983:14-21: WARNING: Consider using %pe to print PTR_ERR()
./core/hub.c:5675:6-13: WARNING: Consider using %pe to print PTR_ERR()
./gadget/function/u_serial.c:1315:24-31: WARNING: Consider using %pe to print PTR_ERR()
./dwc2/pci.c:72:3-10: WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/atm/usbatm.c               | 4 ++--
 drivers/usb/core/hub.c                 | 4 ++--
 drivers/usb/dwc2/pci.c                 | 4 ++--
 drivers/usb/gadget/function/u_serial.c | 4 ++--
 drivers/usb/misc/usb3503.c             | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 9600e1ec0993..c78caa1b57c9 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -979,8 +979,8 @@ static int usbatm_heavy_init(struct usbatm_data *instance)
 	t = kthread_create(usbatm_do_heavy_init, instance, "%s",
 			instance->driver->driver_name);
 	if (IS_ERR(t)) {
-		usb_err(instance, "%s: failed to create kernel_thread (%ld)!\n",
-				__func__, PTR_ERR(t));
+		usb_err(instance, "%s: failed to create kernel_thread (%pe)!\n",
+				__func__, t);
 		return PTR_ERR(t);
 	}
 
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..5e33e3984499 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5671,8 +5671,8 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 			descr = usb_get_device_descriptor(udev);
 			if (IS_ERR(descr)) {
 				dev_dbg(&udev->dev,
-						"can't read device descriptor %ld\n",
-						PTR_ERR(descr));
+						"can't read device descriptor %pe\n",
+						descr);
 			} else {
 				if (descriptors_changed(udev, descr,
 						udev->bos)) {
diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
index f3a1e4232a31..9845327f95c5 100644
--- a/drivers/usb/dwc2/pci.c
+++ b/drivers/usb/dwc2/pci.c
@@ -68,8 +68,8 @@ static int dwc2_pci_probe(struct pci_dev *pci,
 
 	phy = usb_phy_generic_register();
 	if (IS_ERR(phy)) {
-		dev_err(dev, "error registering generic PHY (%ld)\n",
-			PTR_ERR(phy));
+		dev_err(dev, "error registering generic PHY (%pe)\n",
+			phy);
 		return PTR_ERR(phy);
 	}
 
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..da31e5cea0a5 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1311,8 +1311,8 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 	tty_dev = tty_port_register_device(&port->port,
 			gs_tty_driver, port_num, NULL);
 	if (IS_ERR(tty_dev)) {
-		pr_err("%s: failed to register tty for port %d, err %ld\n",
-				__func__, port_num, PTR_ERR(tty_dev));
+		pr_err("%s: failed to register tty for port %d, err %pe\n",
+				__func__, port_num, tty_dev);
 
 		ret = PTR_ERR(tty_dev);
 		mutex_lock(&ports[port_num].lock);
diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 759770a13260..3ac57d31376c 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -202,8 +202,8 @@ static int usb3503_probe(struct usb3503 *hub)
 
 		hub->clk = devm_clk_get_optional(dev, "refclk");
 		if (IS_ERR(hub->clk)) {
-			dev_err(dev, "unable to request refclk (%ld)\n",
-					PTR_ERR(hub->clk));
+			dev_err(dev, "unable to request refclk (%pe)\n",
+					hub->clk);
 			return PTR_ERR(hub->clk);
 		}
 

-- 
2.43.0

