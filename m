Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90743F5BDB;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097766; cv=none; b=IvE4J+Hsy5PRvKEQsZS+JyJ2jIoIJLM0wPDJt3gbft/3phyWrU73DXif4y0ULPn/JKnfYYX70F7Lr5JSkUYm6ARM8FDuKV5qzCD58g9ghz5MxCsPf83JwoVRGuBL0pO83DQ3EfTc1ZpP0b70n4V01kMaF7Y++//EtYxqzjEOmmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097766; c=relaxed/simple;
	bh=hjlOQZ+SRXLZ37csZtWskwYTeIY5IF7ZNAvJg8K1drs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDvE6O4KdJGLPe79LKDld1bPn6qGj8CjXKoj+TjZSEuFfzhsjEaB/St1KKEOEhQlD7YHjXsBCSyiDCc+wfIuhlhd73cpJCUq9skfXD6fGq3Mzz5agstR5EPThV/PV+IW5gtyZfrRKxvNh/rBQgqK/4XyKTqjiu1is7qEkEPsPQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1ID5sIR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1ID5sIR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6167B1F00898;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=TOD9DQ+tTBwG4DrSNl3qFl/rNy7K0e5jrU9nTO6biOU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c1ID5sIRVDXNXySSG7Nr54t7SncaVkKrZW9Zn4sj2h8Mz3UhDlKO1II07Bl8sK+zi
	 fEEmne7HATBzd7RuRM4cQsOKFB30UgekyZuBkutKuJjqzWwsbevGPCxh1Gu/pz6q24
	 rfTgqQOkB6roupN1ZGoVa6pCrMavpDC4QLp3OyhyHF41LG0i53dI758vieXaveTQ42
	 bnp8ghn8seVvTq4bbkcz2oZQqLbvrJqcpLrdbTzARpg1o0NUXIreVwMKxT0dhb+hkh
	 yTChkLXi2uJSU8g/g3gGLtvTJf1mYa7eXTwiiQuNwBZ3SAwMKEuNkkJ1vJjjUtmMhK
	 W7vLSqmXHBLHA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001Uf5-1aZd;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] USB: serial: digi_acceleport: add oob port helper
Date: Wed, 10 Jun 2026 15:22:25 +0200
Message-ID: <20260610132232.356139-5-johan@kernel.org>
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

Add a helper function for retrieving the OOB port to replace two
convoluted expressions.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 7195a63da8a1..80b8863b7942 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -350,6 +350,13 @@ __releases(lock)
 	return timeout;
 }
 
+static struct usb_serial_port *digi_get_oob_port(struct usb_serial *serial)
+{
+	struct digi_serial *serial_priv = usb_get_serial_data(serial);
+
+	return serial_priv->ds_oob_port;
+}
+
 /*
  *  Digi Write OOB Command
  *
@@ -366,7 +373,7 @@ static int digi_write_oob_command(struct usb_serial_port *port,
 {
 	int ret = 0;
 	int len;
-	struct usb_serial_port *oob_port = (struct usb_serial_port *)((struct digi_serial *)(usb_get_serial_data(port->serial)))->ds_oob_port;
+	struct usb_serial_port *oob_port = digi_get_oob_port(port->serial);
 	struct digi_port *oob_priv = usb_get_serial_port_data(oob_port);
 	unsigned long flags;
 
@@ -504,7 +511,7 @@ static int digi_set_modem_signals(struct usb_serial_port *port,
 
 	int ret;
 	struct digi_port *port_priv = usb_get_serial_port_data(port);
-	struct usb_serial_port *oob_port = (struct usb_serial_port *) ((struct digi_serial *)(usb_get_serial_data(port->serial)))->ds_oob_port;
+	struct usb_serial_port *oob_port = digi_get_oob_port(port->serial);
 	struct digi_port *oob_priv = usb_get_serial_port_data(oob_port);
 	unsigned char *data = oob_port->write_urb->transfer_buffer;
 	unsigned long flags;
-- 
2.53.0

