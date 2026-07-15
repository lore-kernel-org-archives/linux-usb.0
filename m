Received: from mail.amicon.ru (unknown [77.108.111.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C883168EF;
	Wed, 15 Jul 2026 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.108.111.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125307; cv=none; b=snNrea5/TAbSLBI3nho4jdWyXTFJLdF3hp3EwlgqhzfKylFmM+tlqBfQ5HtjF9qS53lF9lWeR02gSIVor+XXNMCwf9KWT1D7dLKxww0kMCg65K/ZIEytf2ObUMPjRyKWIDThunhqsM7nF0Rd+PowyRgyEy+2vrsO7vCRfbCErYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125307; c=relaxed/simple;
	bh=Ulh1L7OIP8S74pGsecLVG0Xaujdj1gvA3lNFjPc1a+U=;
	h=Content-Type:From:To:CC:Subject:Date:Message-ID:MIME-Version; b=PL7QD/8zxP9vhvL2llEkz8wTtCjGQPT+k3rEGGwTJjn+LuoQhvxJKb/DlY7hW6xtIo5ED0d798tWRX970F9iSF1LR0O/RwhM7oo8/tTSmQhrJPfwV97HEfrkfoiWybV0NZCZiTcmv5MURPJabOqWmcQtQ8GEIe5LPDqX0OytrNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru; spf=pass smtp.mailfrom=amicon.ru; dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b=F7abuiDs; arc=none smtp.client-ip=77.108.111.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amicon.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amicon.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amicon.ru header.i=@amicon.ru header.b="F7abuiDs"
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; d=amicon.ru; s=mail; c=simple/simple;
	t=1784125298; h=from:subject:to:date:message-id;
	bh=Ulh1L7OIP8S74pGsecLVG0Xaujdj1gvA3lNFjPc1a+U=;
	b=F7abuiDsILQc3IEyQybo+ORUwrfy155fbzyiDuFR7Ov8d78lZE4tnMcXKWgBqjEZAyG7CfTB9Kz
	+ZBU057agqrczu017IhmdnxJvQjMtJi9fpv5yaA7Ro6as2/bOkzWtQDiHe1HOr7lg52hpCvD19uu6
	blXoytLMxVLony+xffsT0eNroR1FQZ5g5WVIoL0Tl/9X+kO+JgjK73WXRcWtEu+ACgAgghS900Vxf
	Zv4JJeEjwxMzuCVnBIZvVzEq6SKMEpzALSdtDx0LcmaSyv+p6U8H2iB7OWFH3ek/AhgJ+qjSzMfh/
	Bqd9yCRdHB0JjKMtnE9M1qMOmPR8fRxSWeLg==
Received: from dish.amicon.lan (172.16.30.10) by mail.amicon.lan
 (192.168.0.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Wed, 15 Jul
 2026 17:21:38 +0300
From: Daniil Iskhakov <dish@amicon.ru>
To: Johan Hovold <johan@kernel.org>
CC: Agalakov Daniil <ade@amicon.ru>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Roman Razov
	<rrv@amicon.ru>, Daniil Iskhakov <dish@amicon.ru>
Subject: [PATCH RESEND] USB: serial: mos7720: fix actual baud rate not reported back to TTY
Date: Wed, 15 Jul 2026 17:22:32 +0300
Message-ID: <20260715142234.53046-1-dish@amicon.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: mail.amicon.lan (192.168.0.59) To mail.amicon.lan
 (192.168.0.59)

From: Agalakov Daniil <ade@amicon.ru>

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
Signed-off-by: Agalakov Daniil <ade@amicon.ru>
Co-developed-by: Daniil Iskhakov <dish@amicon.ru>
Signed-off-by: Daniil Iskhakov <dish@amicon.ru>
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
