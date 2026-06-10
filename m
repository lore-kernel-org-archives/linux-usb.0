Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B838D409117;
	Wed, 10 Jun 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097769; cv=none; b=tF3OlPeUZpG7f8WaGNXE7R4z6A2hambNefp6C3Ps0m1lnXDe2ylNNVOnc6PP+4YacUtIrRxxmc4qKwqvPDYTMUPBdM4PQi+rQgvSi+//+dslcCW8zBXdRr8q7fxeL8embuMMmnz9P3Q2SKIIGnSzKJYn8AI5aFQ3selGSQbmI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097769; c=relaxed/simple;
	bh=sDksaZbQlsyras5++u3tibR2wIezZ0ZcvsfbPv4HQxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uIs9VCI2/7q9bEGXkQqX0VYSkY8hS3tOHCPaQ8WJ3g1WdsIjR4iMSG5ce0y8Pv7+TXg8ayLoBvD3YVVXUd3egBxHEo7wdU+H+ICszBVjC2aSymzbq8rtgPsL9gwJznW0LrGXCfoPAc8X0G+KaJS6f0dMO1s7i0ziiEbJUphVxXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rh9LH3A8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rh9LH3A8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDE81F008A5;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=GDFO7REEhVuOtV0awlV55qtzdX+5Tn3RqW97Nq+OptU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rh9LH3A8XbZT7nrEADEmZrCg4mjfRmtmRPOsVqPY6G915O4kbIdvbruKWdKrxHUV/
	 oz9/BebstUs4sl0+oUQbKxlP/tmVPs5LQLrI38JX3orGlwnfAyvhHGKgsxdBiSJvl+
	 n7vzKVo3dNvZZSH0Cn0CmXxrKKcd79/vVapUqoyxt2Um5Q21bqa+w+7TSfl4+sMoQA
	 6rEegdqQQvfJ1T7z44D5lVHWOdyQO6h7He8/odgTLMD58/f3Esxnp/WEdyqXux8eNr
	 WNPdR8t580mt3z9bYMXGCNmJyWLDHxu5oUcGQiAKLZjZg0Zi4TtMqDc+UiCNqe4O0b
	 OV6NW0RrSQInw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001Uf9-1fbe;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] USB: serial: digi_acceleport: drop redundant driver data sanity checks
Date: Wed, 10 Jun 2026 15:22:27 +0200
Message-ID: <20260610132232.356139-7-johan@kernel.org>
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

The URB context pointer does not change while an URB is in flight so
there is never a need to check for NULL on completion.

The port driver data is not freed until the port is unbound at which
point all I/O for that port has been stopped (and I/O is no longer
started for a port that has not yet been probed).

The device driver data is not freed until after the driver has been
unbound and at which point all I/O has also ceased.

Drop the redundant, overly defensive (and still incomplete) sanity
checks from the completion callbacks.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 40 +++-------------------------
 1 file changed, 4 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 7a198c4a9e28..e14cf133808f 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -942,28 +942,12 @@ static int digi_write(struct tty_struct *tty, struct usb_serial_port *port,
 static void digi_write_bulk_callback(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	struct usb_serial *serial;
-	struct digi_port *priv;
-	struct digi_serial *serial_priv;
-	int status = urb->status;
+	struct digi_serial *serial_priv = usb_get_serial_data(port->serial);
+	struct digi_port *priv = usb_get_serial_port_data(port);
 	unsigned long flags;
 	bool wakeup;
 	int ret = 0;
 
-	/* port and serial sanity check */
-	if (port == NULL || (priv = usb_get_serial_port_data(port)) == NULL) {
-		pr_err("%s: port or port->private is NULL, status=%d\n",
-			__func__, status);
-		return;
-	}
-	serial = port->serial;
-	if (serial == NULL || (serial_priv = usb_get_serial_data(serial)) == NULL) {
-		dev_err(&port->dev,
-			"%s: serial or serial->private is NULL, status=%d\n",
-			__func__, status);
-		return;
-	}
-
 	/* handle oob callback */
 	if (priv->dp_port_num == serial_priv->ds_oob_port_num) {
 		dev_dbg(&port->dev, "digi_write_bulk_callback: oob callback\n");
@@ -1268,27 +1252,11 @@ static void digi_port_remove(struct usb_serial_port *port)
 static void digi_read_bulk_callback(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	struct digi_port *priv;
-	struct digi_serial *serial_priv;
+	struct digi_serial *serial_priv = usb_get_serial_data(port->serial);
+	struct digi_port *priv = usb_get_serial_port_data(port);
 	int status = urb->status;
 	int ret;
 
-	/* port sanity check, do not resubmit if port is not valid */
-	if (port == NULL)
-		return;
-	priv = usb_get_serial_port_data(port);
-	if (priv == NULL) {
-		dev_err(&port->dev, "%s: port->private is NULL, status=%d\n",
-			__func__, status);
-		return;
-	}
-	if (port->serial == NULL ||
-		(serial_priv = usb_get_serial_data(port->serial)) == NULL) {
-		dev_err(&port->dev, "%s: serial is bad or serial->private "
-			"is NULL, status=%d\n", __func__, status);
-		return;
-	}
-
 	/* do not resubmit urb if it has any status error */
 	if (status) {
 		dev_err(&port->dev,
-- 
2.53.0

