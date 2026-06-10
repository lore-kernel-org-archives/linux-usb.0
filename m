Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4408409108;
	Wed, 10 Jun 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097768; cv=none; b=CIy+hd6BoYFcoWWRJ0s0n856vWIVG7TsAFKQn3T9O8i0C2D7KQhBid8OuBc74kjZOCaR5ChXcpm210lcJTBL8pQgP1fxF0wvmwhuk7IYxUp+dAkgG8My1G/VC3QyKmwWjF0J9o9RiP+iEZsqgDv6L5IUEhKASdrwCPwPdafMhoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097768; c=relaxed/simple;
	bh=oKeRmQHmSusvVDzqLA6rW3m1/Ayn9aS7Z6HqbePpDnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsBfAPFPQ4yZ/RSiAb1jZMF6Qk89S1lmCTAjzRLYLmoZgXAt6qzQvBXk48UTjjVES337skfXPgazXc3/b8HppmpH6xZvV148jrCcRNhhARfa9wABB00fkK/EdJsL7hsauNnkB0zvtVJJeHbBclWAl6L0i/jWWrbMVaJtKzwNF3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjefWZ5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjefWZ5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5181F008A4;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=TCSJAF/gBHSfQtqjmDFjs5JbtUVNFJ6qwPI7uA37xyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bjefWZ5oYYnE06RItNiav9tXO5AAir4oxtHdHeYNvABUOgYxe5aucm1iwK2PgV4NO
	 xcGaCOQ6moO0uB8Q57hbN07AwNzap7qoD8sLSFzxD0hzFKUf1ngw6k6/gondZtR1P7
	 tWV1cvvBjh8MLbpFOhEKg6yAQUGk6TKrmwoeiO4Ithtw9c5vZSCY7erE4dvO70ysir
	 QRqEb+Y4S78WEERtkFCjp64ZiE2pdSoNhmtdd/35uwh2Yq4MqHn7VWDBjNKvlBG0fe
	 +ap/GCQ+9w/rrN7Q+CHyU80KXfzMIhuLQ/+52nLwfzKNQyQbgvXlfS23L2R+ehl0Xg
	 cIRlJmIZAjvFQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001UfB-1i6q;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] USB: serial: digi_acceleport: stop OOB I/O when not in use
Date: Wed, 10 Jun 2026 15:22:28 +0200
Message-ID: <20260610132232.356139-8-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610132232.356139-1-johan@kernel.org>
References: <20260610132232.356139-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver submits the OOB read URB on first open of a port and does not
stop it until the device is disconnected.

Add an open counter and submit the URB on first open and stop it on last
close to avoid wasting resources (e.g. power) when the device is not in
use.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 100 ++++++++++++++-------------
 1 file changed, 51 insertions(+), 49 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index e14cf133808f..efa853a57bb2 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -176,10 +176,10 @@
 /* Structures */
 
 struct digi_serial {
-	spinlock_t ds_serial_lock;
+	struct mutex open_mutex;
 	struct usb_serial_port *ds_oob_port;	/* out-of-band port */
 	int ds_oob_port_num;			/* index of out-of-band port */
-	int ds_device_started;
+	int open_count;
 };
 
 struct digi_port {
@@ -226,9 +226,7 @@ static unsigned int digi_chars_in_buffer(struct tty_struct *tty);
 static int digi_open(struct tty_struct *tty, struct usb_serial_port *port);
 static void digi_close(struct usb_serial_port *port);
 static void digi_dtr_rts(struct usb_serial_port *port, int on);
-static int digi_startup_device(struct usb_serial *serial);
 static int digi_startup(struct usb_serial *serial);
-static void digi_disconnect(struct usb_serial *serial);
 static void digi_release(struct usb_serial *serial);
 static int digi_port_probe(struct usb_serial_port *port);
 static void digi_port_remove(struct usb_serial_port *port);
@@ -281,7 +279,6 @@ static struct usb_serial_driver digi_acceleport_2_device = {
 	.tiocmget =			digi_tiocmget,
 	.tiocmset =			digi_tiocmset,
 	.attach =			digi_startup,
-	.disconnect =			digi_disconnect,
 	.release =			digi_release,
 	.port_probe =			digi_port_probe,
 	.port_remove =			digi_port_remove,
@@ -310,7 +307,6 @@ static struct usb_serial_driver digi_acceleport_4_device = {
 	.tiocmget =			digi_tiocmget,
 	.tiocmset =			digi_tiocmset,
 	.attach =			digi_startup,
-	.disconnect =			digi_disconnect,
 	.release =			digi_release,
 	.port_probe =			digi_port_probe,
 	.port_remove =			digi_port_remove,
@@ -1034,6 +1030,43 @@ static void digi_dtr_rts(struct usb_serial_port *port, int on)
 	digi_set_modem_signals(port, on * (TIOCM_DTR | TIOCM_RTS), 1);
 }
 
+static int digi_open_oob_port(struct usb_serial *serial)
+{
+	struct digi_serial *serial_priv = usb_get_serial_data(serial);
+	struct usb_serial_port *oob_port = serial_priv->ds_oob_port;
+	int ret = 0;
+
+	mutex_lock(&serial_priv->open_mutex);
+
+	if (serial_priv->open_count++ == 0) {
+		ret = usb_submit_urb(oob_port->read_urb, GFP_KERNEL);
+		if (ret) {
+			dev_err(&serial->interface->dev, "failed to submit OOB read urb: %d\n",
+					ret);
+			serial_priv->open_count--;
+		}
+	}
+
+	mutex_unlock(&serial_priv->open_mutex);
+
+	return ret;
+}
+
+static void digi_close_oob_port(struct usb_serial *serial)
+{
+	struct digi_serial *serial_priv = usb_get_serial_data(serial);
+	struct usb_serial_port *oob_port = serial_priv->ds_oob_port;
+
+	mutex_lock(&serial_priv->open_mutex);
+
+	if (serial_priv->open_count-- == 1) {
+		usb_kill_urb(oob_port->read_urb);
+		usb_kill_urb(oob_port->write_urb);
+	}
+
+	mutex_unlock(&serial_priv->open_mutex);
+}
+
 static int digi_open(struct tty_struct *tty, struct usb_serial_port *port)
 {
 	struct digi_port *priv = usb_get_serial_port_data(port);
@@ -1041,9 +1074,9 @@ static int digi_open(struct tty_struct *tty, struct usb_serial_port *port)
 	unsigned char buf[32];
 	int ret;
 
-	/* be sure the device is started up */
-	if (digi_startup_device(port->serial) != 0)
-		return -ENXIO;
+	ret = digi_open_oob_port(port->serial);
+	if (ret)
+		return ret;
 
 	/* read modem signals automatically whenever they change */
 	buf[0] = DIGI_CMD_READ_INPUT_SIGNALS;
@@ -1071,10 +1104,15 @@ static int digi_open(struct tty_struct *tty, struct usb_serial_port *port)
 	ret = usb_submit_urb(port->read_urb, GFP_KERNEL);
 	if (ret) {
 		dev_err(&port->dev, "failed to submit read urb: %d\n", ret);
-		return ret;
+		goto err_close_oob;
 	}
 
 	return 0;
+
+err_close_oob:
+	digi_close_oob_port(port->serial);
+
+	return ret;
 }
 
 static void digi_close(struct usb_serial_port *port)
@@ -1137,36 +1175,8 @@ static void digi_close(struct usb_serial_port *port)
 
 	/* shutdown any outstanding bulk writes */
 	usb_kill_urb(port->write_urb);
-}
-
-/*
- *  Digi Startup Device
- *
- *  Starts read on the OOB port.  Must be called AFTER startup, with
- *  urbs initialized.  Returns 0 if successful, non-zero error otherwise.
- */
-static int digi_startup_device(struct usb_serial *serial)
-{
-	struct digi_serial *serial_priv = usb_get_serial_data(serial);
-	struct usb_serial_port *oob_port = serial_priv->ds_oob_port;
-	int ret;
-
-	/* be sure this happens exactly once */
-	spin_lock(&serial_priv->ds_serial_lock);
-	if (serial_priv->ds_device_started) {
-		spin_unlock(&serial_priv->ds_serial_lock);
-		return 0;
-	}
-	serial_priv->ds_device_started = 1;
-	spin_unlock(&serial_priv->ds_serial_lock);
 
-	ret = usb_submit_urb(oob_port->read_urb, GFP_KERNEL);
-	if (ret) {
-		dev_err(&serial->interface->dev, "failed to submit OOB read urb: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	digi_close_oob_port(port->serial);
 }
 
 static int digi_port_init(struct usb_serial_port *port, unsigned port_num)
@@ -1198,7 +1208,8 @@ static int digi_startup(struct usb_serial *serial)
 	if (!serial_priv)
 		return -ENOMEM;
 
-	spin_lock_init(&serial_priv->ds_serial_lock);
+	mutex_init(&serial_priv->open_mutex);
+
 	serial_priv->ds_oob_port_num = serial->type->num_ports;
 	serial_priv->ds_oob_port = serial->port[serial_priv->ds_oob_port_num];
 
@@ -1214,15 +1225,6 @@ static int digi_startup(struct usb_serial *serial)
 	return 0;
 }
 
-static void digi_disconnect(struct usb_serial *serial)
-{
-	struct digi_serial *serial_priv = usb_get_serial_data(serial);
-	struct usb_serial_port *oob_port = serial_priv->ds_oob_port;
-
-	usb_kill_urb(oob_port->read_urb);
-	usb_kill_urb(oob_port->write_urb);
-}
-
 static void digi_release(struct usb_serial *serial)
 {
 	struct digi_serial *serial_priv;
-- 
2.53.0

