Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480985;
	b=qzl4RWm5RjEKvefOuKJsG5gwl6qc7W4nFqWq8O1wroAEbyLkwuimTxQ4XMqIHEVtV3bM
	 5qtWOhZRWc7uYWbITX8c15rQq2i9aA0Vzc/7flu6t7KYYFwY2GIeDLRANRY7PeZSiCEMv
	 BgdKdukZu3TkhNFmNFc61yFilbuUqTrOVXGamdvyAdtBcoqRslZRYUl9o0vlAtA6PV3TF
	 OyhmmD0akX8U44rg1tKgIBB4CtXGBj0GCqVA+2aX7jzFhTHo0jp/pIpSuJg4eJLiarLb+
	 T7msZ1VMbT7rGziTR1RJwCTmhgtJgyvwT/24jpEcsfy5DqAeGW+wcqpUaNjgzKy5OgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=admPb6RDUUyQnHF1uTkWAohc96AfvEkkjESWlPY5zhM=;
	b=hYodd3gMslcy0IYexdfc//kuI+ueq89je9AkXuK9us+KHcjY4yOTkS8ML//Xop/fL/HD
	 w4Tt/oWjzJ3Vc9XglSRa3Pvs5gT0JcCdsWp4gwv/AV0e/GDpaKvRMi7rA46k8+TcOZ7rQ
	 vxDPcu/l3KXHk63KBq4/ujqP/wY2oJsQcpzJFPc1YULO66UR/hB5gVUHe1F9HlRB+MgCo
	 1Losy5yujfRXaiLs98rY+N0fLWX7U6rPPv24EfBem7z24tRFxhZRVkxImtAPkJLctwuPZ
	 BaTttk5JmYTHY93U0r8vGoaC57PLB532Lyk6EFqMdXR2DKOy58XETVnWMiJGZMabHOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KcWHaBAM;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1CA606A31B
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C1CA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KcWHaBAM
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso2375380e87.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 00:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792480983; x=1793085783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=admPb6RDUUyQnHF1uTkWAohc96AfvEkkjESWlPY5zhM=;
        b=KcWHaBAM3A3RRUMlcUgGVwLbCpZqI7qqbXNdLDSR3yKNfVsf3VaO/cCU8BGVRN8C4b
         I9EyVpaDqv7ocZvf5l0o7m8IDbGcPyNhURNx17ixL2aTuCQwf93mh5MPg7lXusYipzqH
         GkacnEfxhnyegCPlbXzqpuzTOsoKlAGxNGjpoQsQR8FViu9v2R3JtHDaBw85+B6Bdyzq
         FkV5U3OLMmqFJvbVPiLPCm08KnJy9AEY7RIzX4Z6Y1X+2nGmJw17EwptRzHGQLUB/bBP
         JfOYLkhCpismTni3VkMuDbNOUvKicO2nvlFPOSwL3w183tdRH4K6ZYGYmIl2kI6H5TkW
         yTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480983; x=1793085783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=admPb6RDUUyQnHF1uTkWAohc96AfvEkkjESWlPY5zhM=;
        b=Hh6bkHRXCsrlfjJvv6lpl0VxcfC2/X2w9P87uwdGVppwYcdcykEd9/orK6r4uxNEw1
         qakka8qhLEq5aylDm1Mqd7ofhF1OtJH92rMPmMlnrfw6s9z/U8ASWpCX/FcvrIBeDEjh
         xK8VX6iZiEdI8ILGEyvybHgSgbKtQ6ix34dCENk4Jh9QbFi2+t7EfLIrP4/v38mDIVuS
         EvP4ZbwweEKVp/qljjl2VLXVcAhSRDiRFTNd6STm4hVhiEmIuTSy5JktKxG6LVmRDHAU
         jcSKRInkDAgEf3GfCyf1AC51lCTMjPhgIgP0N2rgs2rR/oGT5WqhxbjiOY0CUb6gbbP4
         eLEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNJyw1gdMPMXhyzs8605qZBZsrfr+85poQK26zCQELJDYGdzHqNQ0pUZ+WuQowlCSrNloMKybZpwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqKlZPXT9UJpnBXqY76JL8kIvHlQeF/DuJODwseq7U/yHT5wET
	N6F0bLSsGLSifo9LHsDjz0o+Rj5wFHNIz8LOIRyldsI/+YCH3zhjjI2I
X-Gm-Gg: AYBFou31JTw/OwH/+DHzYexVzSa7Azl65mZ7mqEnqGqbeRzfo5x2jaA/DY0Qb0UevGP
	14WF6sBTdkGIOIbFozE6OgPXfbeSZos8HsCj/Q2zy5mHhHJuWYipAXQhYcP8NrVxEjSeKBDGIvd
	hQ2DOV5XTKQ4lg9nRlCZjeHsBwZBr5Rkcla0hBzMkm5nOruMmuR7azyA7DOZ52YSa0pvs1ugrvn
	vgpDOTFzIRRuKNiRzKwkVW/+sI1nKOg8XdUXzTGwI15w4Gv9z1CrpTd6fV23SQC82HBcUFr4m9Y
	DYKNs6KngwsKrs5wNGXLuZV7PCHdO7dTDawrTE30r5M+EDcEitrOlc/OTSZkwDcrHTpZD91Wcpk
	xONR3scTwPlmCYdjGASAK8XMBRTvsDlKHs/doIzG1SZMLkju5I4XPeNDAGgWfAqgh8911kPAXRH
	jYh2GwhvDeeivYJFomdGsv9vYhYEBv/ib05BFGmVbrighMkYYhLqW7iRaXqwR5ZxfwyAXLNt5f
X-Received: by 2002:a05:6512:3d09:b0:5be:4c7e:ade1 with SMTP id 2adb3069b0e04-5be50a5016cmr3395440e87.16.1792480983044;
        Tue, 20 Oct 2026 00:23:03 -0700 (PDT)
Received: from HachikujiMayoi ([92.36.78.63])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4be346b3sm2455631e87.18.2026.10.20.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:23:02 -0700 (PDT)
From: Daniil Iskhakov <shkiper325@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Agalakov Daniil <empt1nesss@proton.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Roman Razov <bonenooo@gmail.com>,
	Daniil Iskhakov <shkiper325@gmail.com>
Subject: [PATCH] USB: serial: mos7720: fix actual baud rate not reported back to TTY
Date: Tue, 20 Oct 2026 10:22:47 +0300
Message-ID: <20261020072248.7607-1-shkiper325@gmail.com>
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
