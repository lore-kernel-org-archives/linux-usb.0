Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DFC3D8100;
	Tue, 23 Jun 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227347; cv=none; b=U88+XR+NfWT2CpryNwHOm9aTgWXCWanqj1K9ujeMrEz0VLCbq4HFdaH0wlijhIouk/RaRTd3WE2Ev+U4c0BRbEHTNq4gn9XQFCkhv2KplxQFSmmKlISMAFwS0wG1ZOfz4lVbascTjDI55nyS067X7IOUPihxEWEtebFC+NULeF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227347; c=relaxed/simple;
	bh=sOu7y0ASewDsmrQvFuBx1U08agskcncadoMnKJpdPWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqhRXCXYPcZL4FackuOVLvJpovDNlyY0Lpl3L5Kr701ZCxdVzUbawDwSh6iBhB55kzW2erlGPqTTR7koJGZ1MFqQ+Xy0JwDG00t038Xwhpcd8xj+PKHIIMTkJi0yvS1rgoUDqqWlLuBvpPtq8u8GZW6gJofbH5gAIw+k8zR9oWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMOFZgST; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMOFZgST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9DE1F00ACF;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=L4GJWrFAX9hQCqcQAvfTnCj5aylAg/kMbBbi7HUCda4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DMOFZgSTppZwhWPDHh0mrUq5nKtgH8+aRoyy5LnRvpGcial/IasEpYHoIu+prmYuC
	 0BDIUzgJZqa4jhncJdshB0k91w833Q7ji4V1iTYMvPcKNjILob3PbUhFqLgtXJuBti
	 h0LghWVjq/bHeaxnmZSprDYmvaLaxQJw4oHuoHOHZODsO2L/8C4r+Yt2OJw6UTv9Y+
	 5zTpR6nS2j24zSoY8jLuuX6R9hnrtber6Jjj7EApcfwsx5BwFddWxhwoS+V2LtITWZ
	 udkv0rB6GZQOBLPbggZ9Qg5NamansGhfPzwTbj8Bixa73kPnwN4HYkvRIhViGu8w7s
	 jrSOggF+XLhug==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001JuH-1Ttv;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 05/12] USB: serial: digi_acceleport: add oob port helper
Date: Tue, 23 Jun 2026 17:08:19 +0200
Message-ID: <20260623150826.314727-6-johan@kernel.org>
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

Add a helper function for retrieving the OOB port to replace two
convoluted expressions.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 7a52600c09b1..ae4807455dc0 100644
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

