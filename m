Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298527;
	b=En92WuYgCtC3kc/THC7hDNH4D1lI/2z7P4y4iWTweEPTg8pDyeIp9mY9cT1T6zgS7NQS
	 ImnzVe+azmG32Qd2VWdle6rMzN6MXIfNgw9PWIs/3bOgTb50Cr0MxtiwZdtTvlJgc6gPk
	 NcA8voHV+GS8qpUOISV5jEDR5obi5ftkmNg2YfMdNY5L7W1uoww3gjlKdmOBtcc3TZ2OY
	 eimpnC82MGuErRjYY4qb8oUucif6savdiLtzlQt7+4GF9Q2D27YmhA0dBAZDUocjwJXW7
	 2VuAjqFnRZ0iHT8YE7zo+gZiviAUoFB05jshBS0X1ouW7atM6b9l297hoPbOGyedg9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=admPb6RDUUyQnHF1uTkWAohc96AfvEkkjESWlPY5zhM=;
	b=ZyTZZr7NgmNYV7n7BBYO25Yq0XLe5Jm8OJICVn6GjgiVZ+lxq39lYW9VkGKN4INz6DE/
	 6gpIwK1G+SKK6djn7HvFvyfCc4SgWX5YIJTv1Qlzix4VLnmSAFCd2bZbAATVe3FQnxxn7
	 PE/V1ltdiSj4qfw5q/vDzKXe2MehPYUeamiOyf20+oe1BVKlFm7IrD4X3jD/liMyMZiMS
	 HkS0E1blngtb8YU/MVVnyRByiZnYQeAhsXmZu3Q9PxADu8r/SPGL5YcFRdxyqWK0E9jwa
	 jL35MKC9V3kvR6fJ2UhVaQtenrvJqPN9nbD5L052fTMaGR8atV8pA2ci2K+Oybw9w4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emsPOiXv;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B59606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 08:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75B59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emsPOiXv
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214af2076so12260135e9.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 00:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298526; x=1794903326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=admPb6RDUUyQnHF1uTkWAohc96AfvEkkjESWlPY5zhM=;
        b=emsPOiXvGAeFGRN0CI8WxjOJ7m7Q/pdVYyfqSJP8DcPGvR42tGpNsIEKSu4j2lzP+D
         yWYxuniT5fg9REsuhnAZ1IyVY/dfwI0PsjG6c96Jl6pcb/NjhWw9l9Rdljx2q3dRsR2j
         OMroWnfthaHER4DSRaS07lLqmZoEZre9o63cIFzvJYOIx7+K9u7kVzU0FNUv8lgqAc1G
         izmBJ2sNV4X0REgRqOafG3SURAHQixfjny8REEa96jvb1V7kMxn61UJJVIr5w1g+b8qf
         RZLabBQoRchMO3OCyvaJ9+inGbG2BdMj3NW8va4AFpmL+8fLyCOTe7zC4twgbCkXhwsL
         i8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298526; x=1794903326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=admPb6RDUUyQnHF1uTkWAohc96AfvEkkjESWlPY5zhM=;
        b=rWa/r3AnmK+ftZ43VaAWxsJDEaP8oJkT0ovll5Cb1/eVyiHt/jHtgG7gKupe9Lyy+V
         GaVEcCFt3mNf3qfmqqwonLW2KO+G1c8wpR5ihKf6R1C6/V1iB45+sqJA/QEneun0iWTj
         VKhMBWkfeNYZNSQnbwFPqnDDCFQTd165JnTduV3GnU8J3/1OinmbvhcJ+bVDzwuf39GF
         blsFlJl37SpbwaOY7VvQ9ckyE30YtJ5z8MRkExlfk3UQQjcL2miDhh54ZoKTfVkW2lYt
         MBFXjFle5EBjeTZfGPOoch9Q9TLKiFM5YiD3svMCmbcflcXrxrGg+Wuxu0nUwIrz18u3
         V8hA==
X-Forwarded-Encrypted: i=1; AL+hErGgtZJluABQU/ceQrDxxTiDUVv+1crFXsjXtIRfXannF2s83apw3iEhIR+H9SsKeRFyDRt4056RBVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gZZ5ShqCuAsgBx2WCYhRX0sJhSYSiHBzw5V8fM//VrjprIeos
	UqtcFat6ImHqxuKK/dKt67ioMj2LD7yyX24iq9gRa1Y9ZmFjd6Pf2hAF
X-Gm-Gg: AYBFou1scKqStsAjwZ/LUJfJrqLZWqew6IWku4z8Gb4hRaOWU810ESq1tSHxikJD0w9
	fcCOnkEWN4nSiv881ao+RbC2IW+/DHXiHPZGh94RPTEv9bzl3IiuwRCzT6XtLdF1FZ87rOTl3KY
	oDYaGfYFLrN0efr0Z22PswGXlA/9OCgbD2khol5aTAHrpzYmPZVTIjAOk1GCVD4AfykauioA9zo
	h+35/MWYNiIwevgsJ6eY5xnE2yZ3onLI+ovrjMbPljRbsjj88izx3/REHFNdiEPfvEU1GrmJl3L
	MFEIqaQIaHKntHrV9T7sjPxCdQZ5yewTCz1qCmsIcxNl1T56JTzMc3boL8HgJiMLrBQpbiinuf6
	u/j/RyVfl2A1XX+Xj7QiLWWObDCehHU2k5Co8bmQXhXbmugpBauSbiHTVIrUXjCLl4jYtK5BFe3
	caWKTRv1eHLsyWyguxTgvfohINg9KH2nqE7dxymasHLuQhpR/N9otzg7Q4s3vBN4DEAmeDtaEyT
	Itwxg3046/cHzBYC+4GIfOU27ytzp9v9muMPLx1JhMU7J361gLv+lO2EDErGlNB6vwY3OreeHNV
	QLZHGfONtBPLLMrisz8bnSZiJ0+A7xdt8eJQ7gpK
X-Received: by 2002:a05:600c:1989:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4ba0233f99amr27733965e9.6.1794298525424;
        Tue, 10 Nov 2026 00:15:25 -0800 (PST)
Received: from HachikujiMayoi.amicon.wifi ([83.237.12.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204784esm63280915e9.10.2026.11.10.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:15:25 -0800 (PST)
From: Daniil Iskhakov <shkiper325@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Agalakov Daniil <empt1nesss@proton.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Roman Razov <bonenooo@gmail.com>,
	Daniil Iskhakov <shkiper325@gmail.com>
Subject: [PATCH RESEND] USB: serial: mos7720: fix actual baud rate not reported back to TTY
Date: Tue, 10 Nov 2026 11:14:23 +0300
Message-ID: <20261110081426.26265-1-shkiper325@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Agalakov Daniil <empt1nesss@proton.me>

The calc_baud_rate_divisor() function computes a divisor from the
requested baud rate using integer arithmetic, which means the actual
hardware baud rate may differ from the requested one. Previously this
rounded value was never propagated back to the TTY layer, so
tty_encode_baud_rate() was called with the requested rate rather than
the actual one.

Change baudrate parameters in calc_baud_rate_divisor() and
send_cmd_write_baud_rate() to pointers so the actual resulting baud
rate can be written back to the caller. Update *baudrate with the
computed value (230400 / custom) after divisor calculation.

In change_port_settings(), pass &baud to send_cmd_write_baud_rate()
and guard tty_encode_baud_rate() with a status check, so the TTY is
only updated on success and receives the true hardware baud rate.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 65d063ab21fe ("USB: mos7720: clean up termios")
Signed-off-by: Agalakov Daniil <empt1nesss@proton.me>
Co-developed-by: Daniil Iskhakov <shkiper325@gmail.com>
Signed-off-by: Daniil Iskhakov <shkiper325@gmail.com>
---
 drivers/usb/serial/mos7720.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 94459408e7fb..1052217edf26 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -1264,9 +1264,9 @@ static const struct divisor_table_entry divisor_table[] = {
 /*****************************************************************************
  * calc_baud_rate_divisor
  *	this function calculates the proper baud rate divisor for the specified
- *	baud rate.
+ *	baud rate and updates the baudrate parameter with the actual value.
  *****************************************************************************/
-static int calc_baud_rate_divisor(struct usb_serial_port *port, int baudrate, int *divisor)
+static int calc_baud_rate_divisor(struct usb_serial_port *port, int *baudrate, int *divisor)
 {
 	int i;
 	__u16 custom;
@@ -1274,10 +1274,10 @@ static int calc_baud_rate_divisor(struct usb_serial_port *port, int baudrate, in
 	__u16 round;
 
 
-	dev_dbg(&port->dev, "%s - %d\n", __func__, baudrate);
+	dev_dbg(&port->dev, "%s - %d\n", __func__, *baudrate);
 
 	for (i = 0; i < ARRAY_SIZE(divisor_table); i++) {
-		if (divisor_table[i].baudrate == baudrate) {
+		if (divisor_table[i].baudrate == *baudrate) {
 			*divisor = divisor_table[i].divisor;
 			return 0;
 		}
@@ -1285,18 +1285,19 @@ static int calc_baud_rate_divisor(struct usb_serial_port *port, int baudrate, in
 
 	/* After trying for all the standard baud rates    *
 	 * Try calculating the divisor for this baud rate  */
-	if (baudrate > 75 &&  baudrate < 230400) {
+	if (*baudrate > 75 && *baudrate < 230400) {
 		/* get the divisor */
-		custom = (__u16)(230400L  / baudrate);
+		custom = (__u16)(230400L  / *baudrate);
 
 		/* Check for round off */
-		round1 = (__u16)(2304000L / baudrate);
+		round1 = (__u16)(2304000L / *baudrate);
 		round = (__u16)(round1 - (custom * 10));
 		if (round > 4)
 			custom++;
 		*divisor = custom;
+		*baudrate = 230400L / custom;
 
-		dev_dbg(&port->dev, "Baud %d = %d\n", baudrate, custom);
+		dev_dbg(&port->dev, "Baud %d = %d\n", *baudrate, custom);
 		return 0;
 	}
 
@@ -1307,10 +1308,10 @@ static int calc_baud_rate_divisor(struct usb_serial_port *port, int baudrate, in
 /*
  * send_cmd_write_baud_rate
  *	this function sends the proper command to change the baud rate of the
- *	specified port.
+ *	specified port and updates the baudrate parameter with the actual value.
  */
 static int send_cmd_write_baud_rate(struct moschip_port *mos7720_port,
-				    int baudrate)
+				    int *baudrate)
 {
 	struct usb_serial_port *port;
 	struct usb_serial *serial;
@@ -1325,7 +1326,7 @@ static int send_cmd_write_baud_rate(struct moschip_port *mos7720_port,
 	serial = port->serial;
 
 	number = port->port_number;
-	dev_dbg(&port->dev, "%s - baud = %d\n", __func__, baudrate);
+	dev_dbg(&port->dev, "%s - baud = %d\n", __func__, *baudrate);
 
 	/* Calculate the Divisor */
 	status = calc_baud_rate_divisor(port, baudrate, &divisor);
@@ -1474,10 +1475,8 @@ static void change_port_settings(struct tty_struct *tty,
 	}
 
 	dev_dbg(&port->dev, "%s - baud rate = %d\n", __func__, baud);
-	status = send_cmd_write_baud_rate(mos7720_port, baud);
-	/* FIXME: needs to write actual resulting baud back not just
-	   blindly do so */
-	if (cflag & CBAUD)
+	status = send_cmd_write_baud_rate(mos7720_port, &baud);
+	if (!status && (cflag & CBAUD))
 		tty_encode_baud_rate(tty, baud, baud);
 	/* Enable Interrupts */
 	write_mos_reg(serial, port_number, MOS7720_IER, 0x0c);
-- 
2.51.0
