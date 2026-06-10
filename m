Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9176404BCA;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097766; cv=none; b=DjIUjYfWwuPxfDbp/DSrN9di0dI0l+34sBBVOoBBF0x9NgQ93AHXJHlq63jGpq4VtH74Z4mWGqB/jMD6tgSGVmfDPrUORv2BU5EUEOSJ4BzBKCFnkO7GJgh0b9bSbeV+ipeSixYFj6bKCURUgAMlf9FUeml9eN/RwE1Qhc4pZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097766; c=relaxed/simple;
	bh=A65Vnjuo7WoO4p7ZbGhIXhRbfTYYYOTPlZ59C6BcZp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9giQMANVyMm5PYeJTEdLAxkK6LodLTKfypx5jEr3dxsOnBxf1GWFwe0GVd0rB4o0ZO70LiYqIwfm4yut5X49/4kEb5EC5ucWN/euVpppHBlo6k+Qfo90mI+FLUCXXgUWcIRG7zaGOf1kb79JlXpJTnhwPkM+h7Xg3zyjlWPQsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIvo0sb0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIvo0sb0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8881F00899;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=jhwumNO1dUk+nZ2o2pUbro/cYPhNwpS4ZS8piHN3fpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CIvo0sb0xK75ycMIgEqI1XDY+Tv7FmFI0xV8YtHtiqoNBO2aI/kYxqMkYpRviKqRf
	 2wGa1PUsz8ZYXBu813xILZncuz0WDGZYmnf3wDx96DEeVCEin5sal5OjO6XsDR19cY
	 XGMq3xNm2yF1erP9UR4ZmsI4gooHHh3C/o4Xh9avkRERHq3NVbpbO6X4wxF9sy+tX8
	 m/RWaAOMMd7NqYJ39PrfgtsHTGFouz5XRHdsmNWHVCgYTUUf3qMEojWqDhc0Gw/ysT
	 eTUs8aDCMG+/yyqO4Q2D2IkdB8+KBNu45nJz+RWjWUDDDxfdJVfoCx2CkIq7iUuwKa
	 uTGPXeOMKP2mw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001UfF-1n0p;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] USB: serial: digi_acceleport: clean up xfer buf length expression
Date: Wed, 10 Jun 2026 15:22:30 +0200
Message-ID: <20260610132232.356139-10-johan@kernel.org>
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

Add the missing space around operators in transfer-buffer length
expressions to make the code more readable.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 6db07fa56a17..e89e12264f57 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -445,7 +445,7 @@ static int digi_write_inb_command(struct usb_serial_port *port,
 		/* len must be a multiple of 4 and small enough to */
 		/* guarantee the write will send buffered data first, */
 		/* so commands are in order with data and not split */
-		len = min(count, port->bulk_out_size-2-priv->dp_out_buf_len);
+		len = min(count, port->bulk_out_size - 2 - priv->dp_out_buf_len);
 		if (len > 4)
 			len &= ~3;
 
@@ -871,7 +871,7 @@ static int digi_write(struct tty_struct *tty, struct usb_serial_port *port,
 		priv->dp_port_num, count);
 
 	/* copy user data (which can sleep) before getting spin lock */
-	count = min(count, port->bulk_out_size-2);
+	count = min(count, port->bulk_out_size - 2);
 	count = min(64, count);
 
 	/* be sure only one write proceeds at a time */
@@ -893,7 +893,7 @@ static int digi_write(struct tty_struct *tty, struct usb_serial_port *port,
 
 	/* allow space for any buffered data and for new data, up to */
 	/* transfer buffer size - 2 (for command and length bytes) */
-	new_len = min(count, port->bulk_out_size-2-priv->dp_out_buf_len);
+	new_len = min(count, port->bulk_out_size - 2 - priv->dp_out_buf_len);
 	data_len = new_len + priv->dp_out_buf_len;
 
 	if (data_len == 0) {
@@ -901,7 +901,7 @@ static int digi_write(struct tty_struct *tty, struct usb_serial_port *port,
 		return 0;
 	}
 
-	port->write_urb->transfer_buffer_length = data_len+2;
+	port->write_urb->transfer_buffer_length = data_len + 2;
 
 	*data++ = DIGI_CMD_SEND_DATA;
 	*data++ = data_len;
-- 
2.53.0

