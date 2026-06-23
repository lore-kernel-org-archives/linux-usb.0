Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D2A3D7D9D;
	Tue, 23 Jun 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227347; cv=none; b=gmiPxyPJWSy6f2JXbCKf86+ihrBlg9Ii0MJrHB4IwZcWeSv0tGFa29WehxbLhNxdh631n5GbeFMMgh5n3nz8fBxWl3C590x1ntj7DeqM4vYfgRJpaekxcWYLUfEpJ5SVWWONXIeGQ60n/79Hc8Jr0MDqkVvfEhHmyTWJGr7BN+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227347; c=relaxed/simple;
	bh=TZBUpqBxoqZZ4QzlBVX3jv3CHur/x+Ig/nVVEdEh7PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dh1JSJrY6gM0+eddn25t3P3x6KhXpTljZ9O5oE8HSQSeuaUJ93qoyyPg9OHPozsTu0A7qO5wkfObLCrzAtubdi0z4VYnvaSPleGSSXJaUW+166sUleW5JaGSMRs+CBcot/JL3M2x8iSA5JL6mDcKCVpOaKj4Zfwu/Wu7dV/q65c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZcwdrCM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZcwdrCM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DD11F0155C;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=qxphQRYP9Q7VkVYx27KY8y3jtQkNrSTPX6+x7NgbOnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JZcwdrCMg4bWJZzWAFeNg4lrcX3doFZ+56H4lSRnqF1EabonFhiqomw+0/DuWEE2C
	 K2ghpPngoYzSY6WXdwPUGL3qA4Ki171L/m8fjZHcIIOM/ktMz8oBkbmorgrL2XMEae
	 Xs4ygYy8WMYg9Uk3I20BJKO3esAmIk6Lv96mV7+jHUlCLIYyw8BmfGBjOAS97XnPQy
	 AeqmDuu08c6te/U8L0qNJUgEZvgN47TffcvLfPJR6CDi2eRyWhZdUIMTIaSqBIjNjL
	 l6e8HPKYoJEHSoxo+fPViSaIZeGD6iJnYza/7d3QXsqYktFuW+2s+8a/CNAMeDivTW
	 75TEZE0FHPSbA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001JuJ-1WDF;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 06/12] USB: serial: digi_acceleport: clean up declarations and whitespace
Date: Tue, 23 Jun 2026 17:08:20 +0200
Message-ID: <20260623150826.314727-7-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623150826.314727-1-johan@kernel.org>
References: <20260623150826.314727-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the driver by moving some declarations to approximate reverse
xmas style and removing some stray newlines (and adding a few for
readability).

While at it, also replace two spaces before tabs in the driver structs.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 88 +++++++++-------------------
 1 file changed, 29 insertions(+), 59 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index ae4807455dc0..0dd898a96c33 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -271,7 +271,7 @@ static struct usb_serial_driver digi_acceleport_2_device = {
 	.dtr_rts =			digi_dtr_rts,
 	.write =			digi_write,
 	.write_room =			digi_write_room,
-	.write_bulk_callback = 		digi_write_bulk_callback,
+	.write_bulk_callback =		digi_write_bulk_callback,
 	.read_bulk_callback =		digi_read_bulk_callback,
 	.chars_in_buffer =		digi_chars_in_buffer,
 	.throttle =			digi_rx_throttle,
@@ -300,7 +300,7 @@ static struct usb_serial_driver digi_acceleport_4_device = {
 	.close =			digi_close,
 	.write =			digi_write,
 	.write_room =			digi_write_room,
-	.write_bulk_callback = 		digi_write_bulk_callback,
+	.write_bulk_callback =		digi_write_bulk_callback,
 	.read_bulk_callback =		digi_read_bulk_callback,
 	.chars_in_buffer =		digi_chars_in_buffer,
 	.throttle =			digi_rx_throttle,
@@ -334,7 +334,6 @@ static struct usb_serial_driver * const serial_drivers[] = {
  *  interruptible_sleep_on_timeout is deprecated and has been replaced
  *  with the equivalent code.
  */
-
 static long cond_wait_interruptible_timeout_irqrestore(
 	wait_queue_head_t *q, long timeout,
 	spinlock_t *lock, unsigned long flags)
@@ -367,15 +366,14 @@ static struct usb_serial_port *digi_get_oob_port(struct usb_serial *serial)
  *  the interruptible flag is true, or a negative error
  *  returned by usb_submit_urb.
  */
-
 static int digi_write_oob_command(struct usb_serial_port *port,
 	unsigned char *buf, int count, int interruptible)
 {
-	int ret = 0;
-	int len;
 	struct usb_serial_port *oob_port = digi_get_oob_port(port->serial);
 	struct digi_port *oob_priv = usb_get_serial_port_data(oob_port);
 	unsigned long flags;
+	int ret = 0;
+	int len;
 
 	dev_dbg(&port->dev,
 		"digi_write_oob_command: TOP: port=%d, count=%d\n",
@@ -410,10 +408,8 @@ static int digi_write_oob_command(struct usb_serial_port *port,
 		dev_err(&port->dev, "%s: usb_submit_urb failed, ret=%d\n",
 			__func__, ret);
 	return ret;
-
 }
 
-
 /*
  *  Digi Write In Band Command
  *
@@ -425,15 +421,14 @@ static int digi_write_oob_command(struct usb_serial_port *port,
  *  timeout ticks.  Returns 0 if successful, or a negative
  *  error returned by digi_write.
  */
-
 static int digi_write_inb_command(struct usb_serial_port *port,
 	unsigned char *buf, int count, unsigned long timeout)
 {
-	int ret = 0;
-	int len;
 	struct digi_port *priv = usb_get_serial_port_data(port);
 	unsigned char *data = port->write_urb->transfer_buffer;
 	unsigned long flags;
+	int ret = 0;
+	int len;
 
 	dev_dbg(&port->dev, "digi_write_inb_command: TOP: port=%d, count=%d\n",
 		priv->dp_port_num, count);
@@ -483,7 +478,6 @@ static int digi_write_inb_command(struct usb_serial_port *port,
 			count -= len;
 			buf += len;
 		}
-
 	}
 	spin_unlock_irqrestore(&priv->dp_port_lock, flags);
 
@@ -494,7 +488,6 @@ static int digi_write_inb_command(struct usb_serial_port *port,
 	return ret;
 }
 
-
 /*
  *  Digi Set Modem Signals
  *
@@ -504,17 +497,15 @@ static int digi_write_inb_command(struct usb_serial_port *port,
  *  -EINTR if interrupted while sleeping, or a non-zero error
  *  returned by usb_submit_urb.
  */
-
 static int digi_set_modem_signals(struct usb_serial_port *port,
 	unsigned int modem_signals, int interruptible)
 {
-
-	int ret;
 	struct digi_port *port_priv = usb_get_serial_port_data(port);
 	struct usb_serial_port *oob_port = digi_get_oob_port(port->serial);
 	struct digi_port *oob_priv = usb_get_serial_port_data(oob_port);
 	unsigned char *data = oob_port->write_urb->transfer_buffer;
 	unsigned long flags;
+	int ret;
 
 	dev_dbg(&port->dev,
 		"digi_set_modem_signals: TOP: port=%d, modem_signals=0x%x\n",
@@ -572,14 +563,13 @@ static int digi_set_modem_signals(struct usb_serial_port *port,
  *  is only called from close, and only one process can be in close on a
  *  port at a time, so its ok.
  */
-
 static int digi_transmit_idle(struct usb_serial_port *port,
 	unsigned long timeout)
 {
-	int ret;
-	unsigned char buf[2];
 	struct digi_port *priv = usb_get_serial_port_data(port);
+	unsigned char buf[2];
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&priv->dp_port_lock, flags);
 	priv->dp_transmit_idle = 0;
@@ -606,16 +596,15 @@ static int digi_transmit_idle(struct usb_serial_port *port,
 	}
 	priv->dp_transmit_idle = 0;
 	spin_unlock_irqrestore(&priv->dp_port_lock, flags);
-	return 0;
 
+	return 0;
 }
 
-
 static void digi_rx_throttle(struct tty_struct *tty)
 {
-	unsigned long flags;
 	struct usb_serial_port *port = tty->driver_data;
 	struct digi_port *priv = usb_get_serial_port_data(port);
+	unsigned long flags;
 
 	/* stop receiving characters by not resubmitting the read urb */
 	spin_lock_irqsave(&priv->dp_port_lock, flags);
@@ -624,13 +613,12 @@ static void digi_rx_throttle(struct tty_struct *tty)
 	spin_unlock_irqrestore(&priv->dp_port_lock, flags);
 }
 
-
 static void digi_rx_unthrottle(struct tty_struct *tty)
 {
-	int ret = 0;
-	unsigned long flags;
 	struct usb_serial_port *port = tty->driver_data;
 	struct digi_port *priv = usb_get_serial_port_data(port);
+	unsigned long flags;
+	int ret = 0;
 
 	spin_lock_irqsave(&priv->dp_port_lock, flags);
 
@@ -650,7 +638,6 @@ static void digi_rx_unthrottle(struct tty_struct *tty)
 			__func__, ret, priv->dp_port_num);
 }
 
-
 static void digi_set_termios(struct tty_struct *tty,
 			     struct usb_serial_port *port,
 			     const struct ktermios *old_termios)
@@ -761,7 +748,6 @@ static void digi_set_termios(struct tty_struct *tty,
 
 	/* set stop bits */
 	if ((cflag & CSTOPB) != (old_cflag & CSTOPB)) {
-
 		if ((cflag & CSTOPB))
 			arg = DIGI_STOP_BITS_2;
 		else
@@ -771,7 +757,6 @@ static void digi_set_termios(struct tty_struct *tty,
 		buf[i++] = priv->dp_port_num;
 		buf[i++] = arg;
 		buf[i++] = 0;
-
 	}
 
 	/* set input flow control */
@@ -840,7 +825,6 @@ static void digi_set_termios(struct tty_struct *tty,
 	tty_encode_baud_rate(tty, baud, baud);
 }
 
-
 static int digi_break_ctl(struct tty_struct *tty, int break_state)
 {
 	struct usb_serial_port *port = tty->driver_data;
@@ -854,43 +838,41 @@ static int digi_break_ctl(struct tty_struct *tty, int break_state)
 	return digi_write_inb_command(port, buf, 4, 0);
 }
 
-
 static int digi_tiocmget(struct tty_struct *tty)
 {
 	struct usb_serial_port *port = tty->driver_data;
 	struct digi_port *priv = usb_get_serial_port_data(port);
-	unsigned int val;
 	unsigned long flags;
+	unsigned int val;
 
 	spin_lock_irqsave(&priv->dp_port_lock, flags);
 	val = priv->dp_modem_signals;
 	spin_unlock_irqrestore(&priv->dp_port_lock, flags);
+
 	return val;
 }
 
-
 static int digi_tiocmset(struct tty_struct *tty,
 					unsigned int set, unsigned int clear)
 {
 	struct usb_serial_port *port = tty->driver_data;
 	struct digi_port *priv = usb_get_serial_port_data(port);
-	unsigned int val;
 	unsigned long flags;
+	unsigned int val;
 
 	spin_lock_irqsave(&priv->dp_port_lock, flags);
 	val = (priv->dp_modem_signals & ~clear) | set;
 	spin_unlock_irqrestore(&priv->dp_port_lock, flags);
+
 	return digi_set_modem_signals(port, val, 1);
 }
 
-
 static int digi_write(struct tty_struct *tty, struct usb_serial_port *port,
 					const unsigned char *buf, int count)
 {
-
-	int ret, data_len, new_len;
 	struct digi_port *priv = usb_get_serial_port_data(port);
 	unsigned char *data = port->write_urb->transfer_buffer;
+	int ret, data_len, new_len;
 	unsigned long flags;
 
 	dev_dbg(&port->dev, "digi_write: TOP: port=%d, count=%d\n",
@@ -953,21 +935,20 @@ static int digi_write(struct tty_struct *tty, struct usb_serial_port *port,
 			"%s: usb_submit_urb failed, ret=%d, port=%d\n",
 			__func__, ret, priv->dp_port_num);
 	dev_dbg(&port->dev, "digi_write: returning %d\n", ret);
-	return ret;
 
+	return ret;
 }
 
 static void digi_write_bulk_callback(struct urb *urb)
 {
-
 	struct usb_serial_port *port = urb->context;
 	struct usb_serial *serial;
 	struct digi_port *priv;
 	struct digi_serial *serial_priv;
-	unsigned long flags;
-	int ret = 0;
 	int status = urb->status;
+	unsigned long flags;
 	bool wakeup;
+	int ret = 0;
 
 	/* port and serial sanity check */
 	if (port == NULL || (priv = usb_get_serial_port_data(port)) == NULL) {
@@ -1040,8 +1021,8 @@ static unsigned int digi_write_room(struct tty_struct *tty)
 
 	spin_unlock_irqrestore(&priv->dp_port_lock, flags);
 	dev_dbg(&port->dev, "digi_write_room: port=%d, room=%u\n", priv->dp_port_num, room);
-	return room;
 
+	return room;
 }
 
 static unsigned int digi_chars_in_buffer(struct tty_struct *tty)
@@ -1071,10 +1052,10 @@ static void digi_dtr_rts(struct usb_serial_port *port, int on)
 
 static int digi_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
-	int ret;
-	unsigned char buf[32];
 	struct digi_port *priv = usb_get_serial_port_data(port);
 	struct ktermios not_termios;
+	unsigned char buf[32];
+	int ret;
 
 	/* be sure the device is started up */
 	if (digi_startup_device(port->serial) != 0)
@@ -1117,13 +1098,12 @@ static int digi_open(struct tty_struct *tty, struct usb_serial_port *port)
 	return 0;
 }
 
-
 static void digi_close(struct usb_serial_port *port)
 {
+	struct digi_port *priv = usb_get_serial_port_data(port);
+	unsigned char buf[32];
 	DEFINE_WAIT(wait);
 	int ret;
-	unsigned char buf[32];
-	struct digi_port *priv = usb_get_serial_port_data(port);
 
 	usb_kill_urb(port->read_urb);
 
@@ -1180,14 +1160,12 @@ static void digi_close(struct usb_serial_port *port)
 	usb_kill_urb(port->write_urb);
 }
 
-
 /*
  *  Digi Startup Device
  *
  *  Starts read on the OOB port.  Must be called AFTER startup, with
  *  urbs initialized.  Returns 0 if successful, non-zero error otherwise.
  */
-
 static int digi_startup_device(struct usb_serial *serial)
 {
 	struct digi_serial *serial_priv = usb_get_serial_data(serial);
@@ -1276,7 +1254,6 @@ static int digi_startup(struct usb_serial *serial)
 	return 0;
 }
 
-
 static void digi_disconnect(struct usb_serial *serial)
 {
 	struct digi_serial *serial_priv = usb_get_serial_data(serial);
@@ -1286,7 +1263,6 @@ static void digi_disconnect(struct usb_serial *serial)
 	usb_kill_urb(oob_port->write_urb);
 }
 
-
 static void digi_release(struct usb_serial *serial)
 {
 	struct digi_serial *serial_priv;
@@ -1318,8 +1294,8 @@ static void digi_read_bulk_callback(struct urb *urb)
 	struct usb_serial_port *port = urb->context;
 	struct digi_port *priv;
 	struct digi_serial *serial_priv;
-	int ret;
 	int status = urb->status;
+	int ret;
 
 	/* port sanity check, do not resubmit if port is not valid */
 	if (port == NULL)
@@ -1361,7 +1337,6 @@ static void digi_read_bulk_callback(struct urb *urb)
 			"%s: failed resubmitting urb, ret=%d, port=%d\n",
 			__func__, ret, priv->dp_port_num);
 	}
-
 }
 
 /*
@@ -1373,7 +1348,6 @@ static void digi_read_bulk_callback(struct urb *urb)
  *  It returns 0 if successful, 1 if successful but the port is
  *  throttled, and -1 if the sanity checks failed.
  */
-
 static int digi_read_inb_callback(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
@@ -1451,10 +1425,8 @@ static int digi_read_inb_callback(struct urb *urb)
 		dev_dbg(&port->dev, "%s: unknown opcode: %d\n", __func__, opcode);
 
 	return throttled ? 1 : 0;
-
 }
 
-
 /*
  *  Digi Read OOB Callback
  *
@@ -1463,10 +1435,8 @@ static int digi_read_inb_callback(struct urb *urb)
  *  the port->serial is valid.  It returns 0 if successful, and
  *  -1 if the sanity checks failed.
  */
-
 static int digi_read_oob_callback(struct urb *urb)
 {
-
 	struct usb_serial_port *port = urb->context;
 	struct usb_serial *serial = port->serial;
 	struct tty_struct *tty;
@@ -1474,8 +1444,8 @@ static int digi_read_oob_callback(struct urb *urb)
 	unsigned char *buf = urb->transfer_buffer;
 	int opcode, line, status, val;
 	unsigned long flags;
-	int i;
 	unsigned int rts;
+	int i;
 
 	if (urb->actual_length < 4)
 		return -1;
@@ -1545,8 +1515,8 @@ static int digi_read_oob_callback(struct urb *urb)
 		}
 		tty_kref_put(tty);
 	}
-	return 0;
 
+	return 0;
 }
 
 module_usb_serial_driver(serial_drivers, id_table_combined);
-- 
2.53.0

