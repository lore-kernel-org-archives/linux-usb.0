Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8B73D79EF;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227345; cv=none; b=dnr1HIM24HdW3zrHL+/80GTkYqQXuWFTZ4pF7rX9cNP+2v2/xWylCv1Akp1hsCPOIVcITJzyy/nNW0eXeAg6vYG4qE4lQHpoB41ficzV3cx9uOx9dsBK7+b9LXnohXuRBUfyAtw9AdqL4X4dgz8gvSBSvoG133GOnabSq6jHF68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227345; c=relaxed/simple;
	bh=SItC1j2Hi4Tma0LHN7dNFDDUjB3T9AHW0502vxBlyaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7jECLGqJKbvAJtuVIvZ1U0gJnu9mfSGctOAcTjc7RipEkjVVoPODA3BI019nZktG2Cr3bq6rEunxT21f1scULNpbNJFGsONytPBenR5KgcsF56IlrPnLYaS1i+47PhbTrU/w1LHK2umsa2vx5zdb6DBD3Q7zWi9LACnXV+r988=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VaNl+tRC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VaNl+tRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6858B1F00A3D;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=JfazaLZ+RJOWbGYUf+i2fcJEADcKqm6JTS5AT6ckAYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VaNl+tRCoXX3I5J3O8yUN7yfluo9+fEaxU/WrIO8QW3oXAzgSirhbiH0xcFQEzx/0
	 4vLM+sYpzcBemryCorNCwnbpskzNgXrdwfs+7dUhYA0DUbOnzFVNj4o3NNU99ukiHR
	 ZjpC6UYghkI7NlxXOvITVd/muUk+/AKtJhHNBZ4TMdkDnBNOP0IZhiPdTAjSWScuFp
	 Axnyq1VIwb0406QGi8CbYUQwN5UmkbmmUZmxhSoVtkit+IXC0wkjIqlpylRC4c4+UN
	 K9l8FPkT6lmKA7bF89LkHUCPr4GTo6+9wJEi6EIGNwq3XdOuVTKbp3AyNb6aas4DQx
	 I2qYlcq9erolg==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001JuL-1Yqc;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 07/12] USB: serial: digi_acceleport: drop redundant driver data sanity checks
Date: Tue, 23 Jun 2026 17:08:21 +0200
Message-ID: <20260623150826.314727-8-johan@kernel.org>
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

The urb context pointer does not change while an urb is in flight so
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
index 0dd898a96c33..64b3f42af981 100644
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
@@ -1292,27 +1276,11 @@ static void digi_port_remove(struct usb_serial_port *port)
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

