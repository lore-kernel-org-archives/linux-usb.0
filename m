Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B8E3FFAC1;
	Mon, 29 Jun 2026 12:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736845; cv=none; b=TyLWbOUSomSH2GioQEDFzDExNn4n5INTnxDv4WPhiE3RBqXoahGDJlkr8z8IQ2FxGoYgiaPAjXWVWi1WFlkM0uOqj9X+adsEgCp1Fg82UXQq4IbZi8foTYrLc0ofIm+gAeaOefrFWBCNIWNuuBY/zn5d3iOcDkdEbGnTG6M0Rkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736845; c=relaxed/simple;
	bh=t+nDr07gdYTeaEMIPjEEUj/KXFVdT71WU/lxyMOPeyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t/bQHkzioANwL4Q9S+c/JHfz+ZlzB3Hg4syK7llbmrwut9eLGbWioby5Q2SMHol+xnNzgJpsVnNJDD9W07V+LtwAlJ1MR2kmvWnfBaPQkDZkwGe+Q3WaLXITcoJDKnpYZAE5A7rkLC6PIngC1xxtcy1Zh2CavWWynvNQZOkDVJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlXDYJGl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlXDYJGl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AFD1F000E9;
	Mon, 29 Jun 2026 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782736843;
	bh=o3w6UWgLJ050FwWo6p3grD2aDa4O5Nxo4lUubjCbEJ0=;
	h=From:To:Cc:Subject:Date;
	b=UlXDYJGlaWjJfSXk+Ypx+3hW0ZFb0JfSJKX+khZtoErd4T1C0OGBm4MHgcPv1J+9W
	 dYj288ZBUNTG4gNXDD6StGDCv60RhjlII3FzQAwQbZEobz1+7ocPAw2b5ebx1iEnYJ
	 Z9reW5AMfb7dSyevRBUh3zKwLbt/TQVyokSK8eVG79b7PTMuQBLLgfpzJAOgYVxOvd
	 qXzfN5ks7LpsRgWEM6oBwW80FWjiZzUlQHZssiLCvOCnuP0sKOEJ02dr9lQPh8iANl
	 jvcTb+zU0QHjRiOzfN8RZpgre9gbo1O8UfjCIoYxQt9D+vWIv2pBSvCYeS14DMIgGi
	 tGnTBueVelKDA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1weBI1-00000000PW7-2Nlm;
	Mon, 29 Jun 2026 14:40:41 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: serial: digi_acceleport: fix oob port dev_printk()
Date: Mon, 29 Jun 2026 14:40:37 +0200
Message-ID: <20260629124037.98072-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OOB port is not registered with driver core and does not have a
name.

Use the USB interface with dev_printk() that may involve the OOB port to
avoid log entries with no driver and a "NULL" device name.

Fixes: f9dfbebb8b39 ("USB: serial: digi_acceleport.c: remove dbg() usage")
Fixes: 194343d9364e ("USB: remove use of err() in drivers/usb/serial")
Signed-off-by: Johan Hovold <johan@kernel.org>
---

This one applies on top of the port registration series and the
preparatory patch just posted:

	https://lore.kernel.org/lkml/20260629123733.97892-1-johan@kernel.org/
	https://lore.kernel.org/lkml/20260610132232.356139-1-johan@kernel.org/

Johan


 drivers/usb/serial/digi_acceleport.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index efaafaf728f8..e6d14f7d106d 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -949,7 +949,6 @@ static void digi_write_bulk_callback(struct urb *urb)
 
 	/* handle oob callback */
 	if (priv->dp_port_num == serial_priv->ds_oob_port_num) {
-		dev_dbg(&port->dev, "digi_write_bulk_callback: oob callback\n");
 		spin_lock_irqsave(&priv->dp_port_lock, flags);
 		priv->dp_write_urb_in_use = 0;
 		wake_up_interruptible(&priv->write_wait);
@@ -1279,7 +1278,8 @@ static void digi_port_remove(struct usb_serial_port *port)
 static void digi_read_bulk_callback(struct urb *urb)
 {
 	struct usb_serial_port *port = urb->context;
-	struct digi_serial *serial_priv = usb_get_serial_data(port->serial);
+	struct usb_serial *serial = port->serial;
+	struct digi_serial *serial_priv = usb_get_serial_data(serial);
 	struct digi_port *priv = usb_get_serial_port_data(port);
 	int status = urb->status;
 	int ret;
@@ -1291,12 +1291,12 @@ static void digi_read_bulk_callback(struct urb *urb)
 	case -ENOENT:
 	case -ECONNRESET:
 	case -ESHUTDOWN:
-		dev_dbg(&port->dev,
+		dev_err(&serial->interface->dev,
 			"%s: nonzero read bulk status: status=%d, port=%d\n",
 			__func__, status, priv->dp_port_num);
 		return;
 	default:
-		dev_err(&port->dev,
+		dev_err(&serial->interface->dev,
 			"%s: nonzero read bulk status: status=%d, port=%d\n",
 			__func__, status, priv->dp_port_num);
 		return;
@@ -1314,7 +1314,7 @@ static void digi_read_bulk_callback(struct urb *urb)
 	/* continue read */
 	ret = usb_submit_urb(urb, GFP_ATOMIC);
 	if (ret != 0 && ret != -EPERM) {
-		dev_err(&port->dev,
+		dev_err(&serial->interface->dev,
 			"%s: failed resubmitting urb, ret=%d, port=%d\n",
 			__func__, ret, priv->dp_port_num);
 	}
@@ -1438,7 +1438,8 @@ static int digi_read_oob_callback(struct urb *urb)
 		status = buf[i + 2];
 		val = buf[i + 3];
 
-		dev_dbg(&port->dev, "digi_read_oob_callback: opcode=%d, line=%d, status=%d, val=%d\n",
+		dev_dbg(&serial->interface->dev,
+			"digi_read_oob_callback: opcode=%d, line=%d, status=%d, val=%d\n",
 			opcode, line, status, val);
 
 		if (status != 0 || line >= serial->type->num_ports)
-- 
2.53.0

