Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BE31E85E
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 06:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782281882; cv=none; b=cnl22wdQDz1epJCaaYx4skGnaHi43H9Zp/2f6uzf/POUKh8jmBajRrsN4l8RxC0gH7d3Mhim2o6UHAIeQx3IiCY0XQjEwNbqtjjUOdROu0jetFYCXiH0UyakT78M47HWZ2pVSh8rF5CC7bsDLBYLnF4M8yUDN7wbd9tiHpV0qrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782281882; c=relaxed/simple;
	bh=7ie2E0KGXH7/XyeJn3y9eBxqaDWArriCX30vUeCPhf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HvksRPGRh2QpDGw4Tqi91JUGdPAtGItgL/4m9xil7uTlOPaysI/JSjhRFi35Ha8LA2UVYZkhoJgHodYzk3BKTUF7sZrCpB0InGwQ+xnpPWyC0d2rnHneFMb5rUbxZVeWNfbABBndKMyQ980Pd2TIeOmbNtxwbLHVjUdFn63R5UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6sI5fAD; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6sI5fAD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso5234555ad.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 23:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782281881; x=1782886681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PlteFNJ6yFp8VW4t9HbOzCYJrmBfWNgcMO3hoK3dwYU=;
        b=n6sI5fADmsOZTDiqOk3Zz0nNMxsFpgbO/GvdnYZ6Lz2CZDMYYhQ186pGKND5Pp9NA9
         BE5cOmOMakLDm1RSTlEZ7jiidR+yGseFqES43dQqEJQS5PFwBJBfgBa7z+k4jaaFI1ws
         85FQgCOpp+kA6w5sCWqaWHFGpAroYCL70NFEXg5qc75IMIfJUCBOoin4cGKzsuu9j2q1
         I1ujhXI2DECMt8cHW7xQcG8vcQfgy2mReQljxNaV7jXLnZmcA8h6K8UV9BNpX1/gTomN
         7nYABR6OZQAvOlOF96g/rcCuU7UNyS+Q7iKXbi2akT5TXIj7dgJlB0y4S3C139DucitD
         8YwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782281881; x=1782886681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlteFNJ6yFp8VW4t9HbOzCYJrmBfWNgcMO3hoK3dwYU=;
        b=pkLUYY+nTimOnRc9IowoByOo/ZRzUHkj3W+DR9dFO6PrDbapxgvLz6JzSN6S2+TJoM
         A57Zq4uWiE1x/5Sp2K5oW/fqyyNcwdfnLjaKHcqdgz0Zn3eWWdUK6XPx2FLDcxUr+iwS
         OXZzDeA0ehlm/tO9TkZPNMJrWdF8pruxkjmU0yFRwO8WyoANn0aeASJ2E3VUcpbYXjs8
         n3l1LdV3HFX9uQrgq2IASLg0yWZODAZEHLF0cwyO5SZTSc+mXVxn4PH1x/mg2AmKeHkB
         Bcyy30U41qP2ViCtWWBVMbYb61XlWwxhTyyQMjROG9jfkORPrEwNpUWYwluPYZQVnNdD
         CK6g==
X-Gm-Message-State: AOJu0YxbmTbTBkJuqvmgjETgvGeTid7qH4GiPqUELXk7JsqXc0q4F7bp
	hKPiJA6TEidirKA4IjzOLlA5KRdl7qZVn+A5vUTPFq7vCB7gzJrI5c4J
X-Gm-Gg: AfdE7ckzY5FjqPBitiNF4QX+SLCRufDoK1ygn2qce7TuYOmM3ITpMdLCYbor5klEBBd
	NK/rYJCzewAb74i8nbWIwEbUleSau7DEVwelzu/jojmweNHBefENgadBDg46bONlUyMTCPHnZK7
	ftTaPlG7u65EuqmofGatx6eo2Nmjl7oz94yskWqW7Mc4DQY4cQ5BDlZ0xycZTxDtHPanwVn9OA0
	4U6wrW9mTLlr2ugWCFyuHbMp6+geyAtbIpeUsD3yuV2U0A3tQXd1U6okpWDeNxrwLF9nQsYKTqQ
	5aAdVisff1gEbadqWW5dJl29Jbf6ee/dkzsdGBXTdF/xfL5axoLdV4dM/3NRiLjRrN8rbR37zld
	cww0uVT23dbhvzQSoGx3YCoDpy0KccVzFVjyzmLdsGReRuW7BEwarJE84s1HQjcDqzxqDN8SSW3
	4nrveDQFA=
X-Received: by 2002:a17:902:f70e:b0:2c0:a555:80e6 with SMTP id d9443c01a7336-2c7c758b73dmr68667755ad.6.1782281880811;
        Tue, 23 Jun 2026 23:18:00 -0700 (PDT)
Received: from adr.. ([149.50.211.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8e81sm124864915ad.52.2026.06.23.23.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:18:00 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH] usb: core: hub: fix coding style and prefer unsigned int
Date: Wed, 24 Jun 2026 03:17:34 -0300
Message-ID: <20260624061734.28479-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix indentation issues and clear checkpatch warnings by replacing
bare uses of 'unsigned' with 'unsigned int' throughout the file.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/usb/core/hub.c | 52 +++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 24960ba9caa91..a75db12506388 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -410,7 +410,7 @@ static int get_hub_descriptor(struct usb_device *hdev,
 		struct usb_hub_descriptor *desc)
 {
 	int i, ret, size;
-	unsigned dtype;
+	unsigned int dtype;
 
 	if (hub_is_superspeed(hdev)) {
 		dtype = USB_DT_SS_HUB;
@@ -506,15 +506,15 @@ static void led_work(struct work_struct *work)
 	struct usb_hub		*hub =
 		container_of(work, struct usb_hub, leds.work);
 	struct usb_device	*hdev = hub->hdev;
-	unsigned		i;
-	unsigned		changed = 0;
+	unsigned int		i;
+	unsigned int		changed = 0;
 	int			cursor = -1;
 
 	if (hdev->state != USB_STATE_CONFIGURED || hub->quiescing)
 		return;
 
 	for (i = 0; i < hdev->maxchild; i++) {
-		unsigned	selector, mode;
+		unsigned int	selector, mode;
 
 		/* 30%-50% duty cycle */
 
@@ -774,7 +774,7 @@ static void hub_irq(struct urb *urb)
 {
 	struct usb_hub *hub = urb->context;
 	int status = urb->status;
-	unsigned i;
+	unsigned int i;
 	unsigned long bits;
 
 	switch (status) {
@@ -1084,7 +1084,7 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 	int port1;
 	int status;
 	bool need_debounce_delay = false;
-	unsigned delay;
+	unsigned int delay;
 
 	/* Continue a partial initialization */
 	if (type == HUB_INIT2 || type == HUB_INIT3) {
@@ -1457,9 +1457,9 @@ static int hub_configure(struct usb_hub *hub,
 	unsigned int pipe;
 	int maxp, ret, i;
 	char *message = "out of memory";
-	unsigned unit_load;
-	unsigned full_load;
-	unsigned maxchild;
+	unsigned int unit_load;
+	unsigned int full_load;
+	unsigned int maxchild;
 
 	hub->buffer = kmalloc_obj(*hub->buffer);
 	if (!hub->buffer) {
@@ -1792,7 +1792,7 @@ void hub_put(struct usb_hub *hub)
 	kref_put(&hub->kref, hub_release);
 }
 
-static unsigned highspeed_hubs;
+static unsigned int highspeed_hubs;
 
 static void hub_disconnect(struct usb_interface *intf)
 {
@@ -1859,7 +1859,7 @@ static bool hub_descriptor_is_sane(struct usb_host_interface *desc)
 	if (!usb_endpoint_is_int_in(&desc->endpoint[0].desc))
 		return false;
 
-        return true;
+	return true;
 }
 
 static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
@@ -2047,7 +2047,7 @@ hub_ioctl(struct usb_interface *intf, unsigned int code, void *user_data)
  * Allow user programs to claim ports on a hub.  When a device is attached
  * to one of these "claimed" ports, the program will "own" the device.
  */
-static int find_port_owner(struct usb_device *hdev, unsigned port1,
+static int find_port_owner(struct usb_device *hdev, unsigned int port1,
 		struct usb_dev_state ***ppowner)
 {
 	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
@@ -3263,7 +3263,7 @@ static void usb_unlock_port(struct usb_port *port_dev)
 #ifdef	CONFIG_PM
 
 /* Check if a port is suspended(USB2.0 port) or in U3 state(USB3.0 port) */
-static int port_is_suspended(struct usb_hub *hub, unsigned portstatus)
+static int port_is_suspended(struct usb_hub *hub, unsigned int portstatus)
 {
 	int ret = 0;
 
@@ -3441,7 +3441,7 @@ static int usb_disable_remote_wakeup(struct usb_device *udev)
 }
 
 /* Count of wakeup-enabled devices at or below udev */
-unsigned usb_wakeup_enabled_descendants(struct usb_device *udev)
+unsigned int usb_wakeup_enabled_descendants(struct usb_device *udev)
 {
 	struct usb_hub *hub = usb_hub_to_struct_hub(udev);
 
@@ -3959,7 +3959,7 @@ static int hub_suspend(struct usb_interface *intf, pm_message_t msg)
 {
 	struct usb_hub		*hub = usb_get_intfdata(intf);
 	struct usb_device	*hdev = hub->hdev;
-	unsigned		port1;
+	unsigned int		port1;
 
 	/*
 	 * Warn if children aren't already suspended.
@@ -4697,7 +4697,7 @@ int hub_port_debounce(struct usb_hub *hub, int port1, bool must_be_connected)
 {
 	int ret;
 	u16 portchange, portstatus;
-	unsigned connection = 0xffff;
+	unsigned int connection = 0xffff;
 	int total_time, stable_time = 0;
 	struct usb_port *port_dev = hub->ports[port1 - 1];
 
@@ -4906,7 +4906,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 	struct usb_hcd		*hcd = bus_to_hcd(hdev->bus);
 	struct usb_port		*port_dev = hub->ports[port1 - 1];
 	int			retries, operations, retval, i;
-	unsigned		delay = HUB_SHORT_RESET_TIME;
+	unsigned int		delay = HUB_SHORT_RESET_TIME;
 	enum usb_device_speed	oldspeed = udev->speed;
 	const char		*speed;
 	int			devnum = udev->devnum;
@@ -5269,7 +5269,7 @@ hub_power_remaining(struct usb_hub *hub)
 	for (port1 = 1; port1 <= hdev->maxchild; ++port1) {
 		struct usb_port *port_dev = hub->ports[port1 - 1];
 		struct usb_device *udev = port_dev->child;
-		unsigned unit_load;
+		unsigned int unit_load;
 		int delta;
 
 		if (!udev)
@@ -5308,10 +5308,10 @@ static int descriptors_changed(struct usb_device *udev,
 		struct usb_host_bos *old_bos)
 {
 	int		changed = 0;
-	unsigned	index;
-	unsigned	serial_len = 0;
-	unsigned	len;
-	unsigned	old_length;
+	unsigned int	index;
+	unsigned int	serial_len = 0;
+	unsigned int	len;
+	unsigned int	old_length;
 	int		length;
 	char		*buf;
 
@@ -5392,7 +5392,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 {
 	int status = -ENODEV;
 	int i;
-	unsigned unit_load;
+	unsigned int unit_load;
 	struct usb_device *hdev = hub->hdev;
 	struct usb_hcd *hcd = bus_to_hcd(hdev->bus);
 	struct usb_port *port_dev = hub->ports[port1 - 1];
@@ -6000,14 +6000,14 @@ static void hub_event(struct work_struct *work)
 
 static const struct usb_device_id hub_id_table[] = {
     { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
-                   | USB_DEVICE_ID_MATCH_PRODUCT
-                   | USB_DEVICE_ID_MATCH_INT_CLASS,
+			| USB_DEVICE_ID_MATCH_PRODUCT
+			| USB_DEVICE_ID_MATCH_INT_CLASS,
       .idVendor = USB_VENDOR_SMSC,
       .idProduct = USB_PRODUCT_USB5534B,
       .bInterfaceClass = USB_CLASS_HUB,
       .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
     { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
-                   | USB_DEVICE_ID_MATCH_PRODUCT,
+			| USB_DEVICE_ID_MATCH_PRODUCT,
       .idVendor = USB_VENDOR_CYPRESS,
       .idProduct = USB_PRODUCT_CY7C65632,
       .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
-- 
2.43.0

