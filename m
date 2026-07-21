Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1AF3C10AC
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633106; cv=none; b=XnEw4dtV3ywBcxIQkNJAlZt7L8nh8raHkjX+V5yYsJqnh5vIKcNBCaXmj3mzPXZHIgdFk3oBUGfo2nDqMrgKtVXmeG2NcXRY14wJicp3j4DptwmfGZaP/sl7vGHSVpPPkdl5jhTCwFSZ9ACkypZqCCZr6OkWRqFSxySFgFK0/+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633106; c=relaxed/simple;
	bh=UtwmxD6MsVmYq37l2XlHjMAuIf7pKyzG8aNlO7q6yH8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m4NMfwLO0GVfR4f6Y48CuoaNoHfngs5EtzFFTHwClYv6BbEnJFsYGXawAoygCu+2+BtwS8M5vQJ8zcLNm/uMGHNeLs6o2Hwkk5dTcqDxfdR8zNFsVHofQkYpa8Ea/NyVsBTdyDgsN78dQ3roYS/p8fPX20l5ueme+a19Eh2TcSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQ7oYD+n; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQ7oYD+n"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceab75934dso117513285ad.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 04:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784633099; x=1785237899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L5ITH1fyuIRmD5kTN4C2TZ8mCYkfGJE9zClftSPvWV4=;
        b=RQ7oYD+nmEKjYzzetsIbW0pR8cVVvOTnbaO1noaqJWDPbC1S3eKDmz4MOyv2LJAt/O
         lmn+yBp2BPUjD28wkSC/Na4tk1ORDXtcjAL2XkENUScZseQIYdYWsAfE3sv5XSRnpyE9
         0gx8Vqb9suTQreVmkuO0LwsUuhplwFnqxhXMC3iqMg02hGm+QEh1/W0jfyahRqDMw1zO
         IIE4Nv4gWXC0cx2K6E18Q5+tCW4RWN900lYON2ii5gDVxv+QoS6Ky5qnVn2n+BOFcs15
         KU9JDLuqsZxtqgfOnZRpZqsRnL+rDNgwMB9cdby7YE2hq6T6KSOAzA4c7yjNtYo8wD+A
         9sYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633099; x=1785237899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5ITH1fyuIRmD5kTN4C2TZ8mCYkfGJE9zClftSPvWV4=;
        b=f0HDeAH7nEz+BY57GRo4gqGIguM8JBszO1noSBg9TMb+79njdm3sKUa/j6RaFfgxPn
         6DaRQKydqoT/o9dgfLBU+uAyhlEtbd7qoOdiYg8sFCHex+HNpGAL2O9CfeV9lHiI5Esa
         30AxKU4z12IVDEEhcVut3opn/SSb6pzItOtRd933MqQRo7uVk33P3wZfOJAGjQr+UHcD
         ULLaG/3/n61QD8IZ78q7W6TMJsGy2wR6NNN25WdYKV8zPtP+SW46iE1VE4pp+4ZdCNcr
         sKPIR85kjYqiaiR1GxQYJuRyM2irtC9LGz/tkRh6Fuke9iZuU28HwNUVh+MYcMjhrxj/
         BstA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7AEQcRes1ti9seB+NnpY0AEF2nzmL0K9kGTvCU8iWvDWaSouM30joB7Yub9/Q/QvAol7acFYdfDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzf5wu7gDI2Z6yda3PdQk8BZ6vFy7rdR78rG7T58cfA8Clzofa
	8UzCLAM0MPdRQSJwYC47c8SVHCbScEm5y/owSVWUCGJg8ix57KTiK9Re
X-Gm-Gg: AR+sD10vLRcM0G48+awfoBU50IwXJwdQjitUFxKazJmawoxZ3gzvmO8ibLHmICRHsEl
	U26j2v0IJYN0t9L8zpKXsCLOX0UQBcLO41cNeS5b6BrzHvlvd/9MwVVylQ1TL4dkJI122xXIFY0
	aaL0IuOg24EqeeJHeehhd91QEvB+aPK3RIUS7C5IC2+GyALT/jCZ1OaiDB3GweU5Fc7UwULs0Pb
	LmceCyZzgFZfx+7421cCs8xwU3sekiEb2k/NoiBaD7LAPNV19JpgJXm2qKbnN8sTQelLEpdHwWi
	x6XELDgEsg9KjJCaYCsWTwfcG3/4+1EOXwCusP9KHn72g31Hs9yA3b7wTS5cMITh8AIWWDVa1PX
	T1FQ0k4mHlqWoc48SjKD5AFPd/wp9aFSP3XNglxzIlnQeunzNkSsyB7Vxt7CpCFGlVzHjghNfNm
	NhX6IDfnfGi9vLmwrauU1ZPJ7CmkEB2UkGZTcZZ/38EIXdcBxn7oTMTHBzs0JGetrUjKCkg8Af2
	pXUXquzKjm72Pd/eKeQ58WM8m2wzg==
X-Received: by 2002:a17:903:458d:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2cf348bbeeamr188726835ad.21.1784633098877;
        Tue, 21 Jul 2026 04:24:58 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-3815-5578-1114-129c-5580-3908.dynamic-ip6.hinet.net. [2001:b011:3815:5578:1114:129c:5580:3908])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448db72sm75509345ad.1.2026.07.21.04.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:24:57 -0700 (PDT)
From: Charles Yeh <charlesyeh522@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-usb@vger.kernel.org
Cc: charles-yeh@prolific.com.tw,
	Charles Yeh <charlesyeh522@gmail.com>
Subject: [PATCH v3] USB: serial: pl2303: add support for PL256X multi-port devices
Date: Tue, 21 Jul 2026 19:24:40 +0800
Message-Id: <20260721112440.1816-1-charlesyeh522@gmail.com>
X-Mailer: git-send-email 2.32.0.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prolific PL256X devices are multi-port USB-to-UART controllers,
including the PL2533, PL2543 and PL2565 variants.

These devices use vendor requests that differ from those used by the
existing TYPE_HX and TYPE_HXN devices. They also require a separate UART
reset request and use a port-specific register for configuring flow
control.

Add a new TYPE_MP device type and select the appropriate vendor requests,
reset operation and flow-control register for PL256X devices. Store the
USB interface number so that requests can be directed to the corresponding
UART port.

Detect the supported PL256X variants using bcdDevice before issuing any
legacy vendor requests, as PL256X devices do not accept those requests.

PL256X devices support baud rates up to 24 Mbps and do not use divisor
encoding.

Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
v3:
* update the patch subject to describe PL256X multi-port support
* add device variant comments to the bcdDevice table
* use lowercase hexadecimal constants
* simplify pl256x_uart_reset() by removing unnecessary arguments
* improve the UART reset error message
* fix continuation-line indentation
* preserve reverse Christmas tree declaration order
* add a default error case for unsupported interface numbers
* remove the redundant flow-control configuration from startup

v2:
* remove unused variable 'dev' in pl2303_update_reg
---
 drivers/usb/serial/pl2303.c | 108 +++++++++++++++++++++++++++++++++---
 drivers/usb/serial/pl2303.h |   2 +-
 2 files changed, 102 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index 50dc838e8115..11d504416e96 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -54,6 +54,7 @@ static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
 	{ USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
+	{ USB_DEVICE(PL2303_VENDOR_ID, PL256X_PRODUCT_ID_4P) },
 	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID) },
 	{ USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID_RSAQ5) },
 	{ USB_DEVICE(ATEN_VENDOR_ID, ATEN_PRODUCT_ID),
@@ -144,10 +145,15 @@ MODULE_DEVICE_TABLE(usb, id_table);
 #define VENDOR_WRITE_REQUEST_TYPE	0x40
 #define VENDOR_WRITE_REQUEST		0x01
 #define VENDOR_WRITE_NREQUEST		0x80
+#define VENDOR_WRITE_MPREQUEST		0x80
 
 #define VENDOR_READ_REQUEST_TYPE	0xc0
 #define VENDOR_READ_REQUEST		0x01
 #define VENDOR_READ_NREQUEST		0x81
+#define VENDOR_READ_MPREQUEST		0x80
+
+#define PL256X_RESET_REQUEST_TYPE	0x40
+#define PL256X_RESET_REQUEST		0x96
 
 #define UART_STATE_INDEX		8
 #define UART_STATE_MSR_MASK		0x8b
@@ -175,6 +181,16 @@ MODULE_DEVICE_TABLE(usb, id_table);
 #define PL2303_HXN_FLOWCTRL_RTS_CTS	0x18
 #define PL2303_HXN_FLOWCTRL_XON_XOFF	0x0c
 
+#define PL256X_PORT_A_FLOWCTRL_REG	0xc005
+#define PL256X_PORT_B_FLOWCTRL_REG	0xd005
+#define PL256X_PORT_C_FLOWCTRL_REG	0xe005
+#define PL256X_PORT_D_FLOWCTRL_REG	0xf005
+
+#define PL256X_FLOWCTRL_MASK		0x43
+#define PL256X_FLOWCTRL_XON_XOFF	0x40
+#define PL256X_FLOWCTRL_RTS_CTS		0x03
+#define PL256X_FLOWCTRL_NONE		0x00
+
 static int pl2303_set_break(struct usb_serial_port *port, bool enable);
 
 enum pl2303_type {
@@ -184,6 +200,7 @@ enum pl2303_type {
 	TYPE_TB,
 	TYPE_HXD,
 	TYPE_HXN,
+	TYPE_MP,
 	TYPE_COUNT
 };
 
@@ -199,6 +216,8 @@ struct pl2303_type_data {
 struct pl2303_serial_private {
 	const struct pl2303_type_data *type;
 	unsigned long quirks;
+	u16 interface_num;
+	u16 flowctrl_reg;
 };
 
 struct pl2303_private {
@@ -239,8 +258,30 @@ static const struct pl2303_type_data pl2303_type_data[TYPE_COUNT] = {
 		.max_baud_rate		= 12000000,
 		.no_divisors		= true,
 	},
+	[TYPE_MP] = {
+		.name			= "MP",
+		.max_baud_rate		= 24000000,
+		.no_divisors		= true,
+	},
 };
 
+static int pl256x_uart_reset(struct usb_serial *serial)
+{
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
+	struct device *dev = &serial->interface->dev;
+	int res;
+
+	res = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
+			PL256X_RESET_REQUEST, PL256X_RESET_REQUEST_TYPE,
+			0, spriv->interface_num, NULL, 0, 100);
+	if (res) {
+		dev_err(dev, "failed to reset device: %d\n", res);
+		return res;
+	}
+
+	return 0;
+}
+
 static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
 							unsigned char buf[1])
 {
@@ -251,6 +292,8 @@ static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
 
 	if (spriv->type == &pl2303_type_data[TYPE_HXN])
 		request = VENDOR_READ_NREQUEST;
+	else if (spriv->type == &pl2303_type_data[TYPE_MP])
+		request = VENDOR_READ_MPREQUEST;
 	else
 		request = VENDOR_READ_REQUEST;
 
@@ -282,6 +325,8 @@ static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16 index)
 
 	if (spriv->type == &pl2303_type_data[TYPE_HXN])
 		request = VENDOR_WRITE_NREQUEST;
+	else if (spriv->type == &pl2303_type_data[TYPE_MP])
+		request = VENDOR_WRITE_MPREQUEST;
 	else
 		request = VENDOR_WRITE_REQUEST;
 
@@ -307,10 +352,12 @@ static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
 	if (!buf)
 		return -ENOMEM;
 
-	if (spriv->type == &pl2303_type_data[TYPE_HXN])
+	if (spriv->type == &pl2303_type_data[TYPE_HXN] ||
+		spriv->type == &pl2303_type_data[TYPE_MP]) {
 		ret = pl2303_vendor_read(serial, reg, buf);
-	else
+	} else {
 		ret = pl2303_vendor_read(serial, reg | 0x80, buf);
+	}
 
 	if (ret)
 		goto out_free;
@@ -461,6 +508,14 @@ static int pl2303_detect_type(struct usb_serial *serial)
 		case 0x905:	/* GT-2AB */
 		case 0x1005:	/* GC-Q20 */
 			return TYPE_HXN;
+		case 0x3302:	/* PL2533 VC 2 Port */
+		case 0x3304:	/* PL2533 VC 4 Port */
+		case 0x4302:	/* PL2543 VC 2 Port */
+		case 0x4304:	/* PL2543 VC 4 Port */
+		case 0x6502:	/* PL2565 VC 2 Port */
+		case 0x6504:	/* PL2565 VC 4 Port */
+		case 0x6506:	/* PL2565 VC 4 Port QFN64 package */
+			return TYPE_MP;
 		}
 		break;
 	}
@@ -494,6 +549,7 @@ static int pl2303_startup(struct usb_serial *serial)
 	struct pl2303_serial_private *spriv;
 	enum pl2303_type type;
 	unsigned char *buf;
+	unsigned int ifnum;
 	int ret;
 
 	ret = pl2303_detect_type(serial);
@@ -503,20 +559,43 @@ static int pl2303_startup(struct usb_serial *serial)
 	type = ret;
 	dev_dbg(&serial->interface->dev, "device type: %s\n", pl2303_type_data[type].name);
 
+	ifnum = serial->interface->altsetting->desc.bInterfaceNumber;
+
 	spriv = kzalloc_obj(*spriv);
 	if (!spriv)
 		return -ENOMEM;
 
+	if (type == TYPE_MP) {
+		switch (ifnum) {
+		case 0:
+			spriv->flowctrl_reg = PL256X_PORT_A_FLOWCTRL_REG;
+			break;
+		case 1:
+			spriv->flowctrl_reg = PL256X_PORT_B_FLOWCTRL_REG;
+			break;
+		case 2:
+			spriv->flowctrl_reg = PL256X_PORT_C_FLOWCTRL_REG;
+			break;
+		case 3:
+			spriv->flowctrl_reg = PL256X_PORT_D_FLOWCTRL_REG;
+			break;
+		default:
+			kfree(spriv);
+			return -ENODEV;
+		}
+	}
+
 	spriv->type = &pl2303_type_data[type];
 	spriv->quirks = (unsigned long)usb_get_serial_data(serial);
 	spriv->quirks |= spriv->type->quirks;
+	spriv->interface_num = ifnum;
 
 	if (type == TYPE_HXD && pl2303_is_hxd_clone(serial))
 		spriv->quirks |= PL2303_QUIRK_NO_BREAK_GETLINE;
 
 	usb_set_serial_data(serial, spriv);
 
-	if (type != TYPE_HXN) {
+	if (type != TYPE_HXN && type != TYPE_MP) {
 		buf = kmalloc(1, GFP_KERNEL);
 		if (!buf) {
 			kfree(spriv);
@@ -578,13 +657,15 @@ static void pl2303_port_remove(struct usb_serial_port *port)
 static int pl2303_set_control_lines(struct usb_serial_port *port, u8 value)
 {
 	struct usb_device *dev = port->serial->dev;
+	struct usb_serial *serial = port->serial;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 	int retval;
 
 	dev_dbg(&port->dev, "%s - %02x\n", __func__, value);
 
 	retval = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
 				 SET_CONTROL_REQUEST, SET_CONTROL_REQUEST_TYPE,
-				 value, 0, NULL, 0, 100);
+				 value, spriv->interface_num, NULL, 0, 100);
 	if (retval)
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, retval);
 
@@ -764,7 +845,7 @@ static int pl2303_get_line_request(struct usb_serial_port *port,
 
 	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 				GET_LINE_REQUEST, GET_LINE_REQUEST_TYPE,
-				0, 0, buf, 7, 100);
+				0, spriv->interface_num, buf, 7, 100);
 	if (ret != 7) {
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, ret);
 
@@ -783,11 +864,13 @@ static int pl2303_set_line_request(struct usb_serial_port *port,
 							unsigned char buf[7])
 {
 	struct usb_device *udev = port->serial->dev;
+	struct usb_serial *serial = port->serial;
+	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
 	int ret;
 
 	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
 				SET_LINE_REQUEST, SET_LINE_REQUEST_TYPE,
-				0, 0, buf, 7, 100);
+				0, spriv->interface_num, buf, 7, 100);
 	if (ret < 0) {
 		dev_err(&port->dev, "%s - failed: %d\n", __func__, ret);
 		return ret;
@@ -942,6 +1025,9 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_RTS_CTS);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_vendor_write(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_RTS_CTS);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0x60);
 		}
@@ -950,6 +1036,9 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_XON_XOFF);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_vendor_write(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_XON_XOFF);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
 		}
@@ -958,6 +1047,9 @@ static void pl2303_set_termios(struct tty_struct *tty,
 			pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL_REG,
 					PL2303_HXN_FLOWCTRL_MASK,
 					PL2303_HXN_FLOWCTRL_NONE);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl2303_vendor_write(serial, spriv->flowctrl_reg,
+					PL256X_FLOWCTRL_NONE);
 		} else {
 			pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
 		}
@@ -1005,6 +1097,8 @@ static int pl2303_open(struct tty_struct *tty, struct usb_serial_port *port)
 			pl2303_vendor_write(serial, PL2303_HXN_RESET_REG,
 					PL2303_HXN_RESET_UPSTREAM_PIPE |
 					PL2303_HXN_RESET_DOWNSTREAM_PIPE);
+		} else if (spriv->type == &pl2303_type_data[TYPE_MP]) {
+			pl256x_uart_reset(serial);
 		} else {
 			pl2303_vendor_write(serial, 8, 0);
 			pl2303_vendor_write(serial, 9, 0);
@@ -1115,7 +1209,7 @@ static int pl2303_set_break(struct usb_serial_port *port, bool enable)
 
 	result = usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev, 0),
 				 BREAK_REQUEST, BREAK_REQUEST_TYPE, state,
-				 0, NULL, 0, 100);
+				 spriv->interface_num, NULL, 0, 100);
 	if (result) {
 		dev_err(&port->dev, "error sending break = %d\n", result);
 		return result;
diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
index d60eda7f6eda..8eb1e7b5d3ec 100644
--- a/drivers/usb/serial/pl2303.h
+++ b/drivers/usb/serial/pl2303.h
@@ -26,7 +26,7 @@
 #define PL2303_PRODUCT_ID_HCR331	0x331a
 #define PL2303_PRODUCT_ID_MOTOROLA	0x0307
 #define PL2303_PRODUCT_ID_ZTEK		0xe1f1
-
+#define PL256X_PRODUCT_ID_4P		0x2533
 
 #define ATEN_VENDOR_ID		0x0557
 #define ATEN_VENDOR_ID2		0x0547
-- 
2.51.0

