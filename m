Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA925F99F;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227345; cv=none; b=tl/7fAH6DFJ3UTzsw48QdEdYEVu4G+kGdH0+P+rUhiDAdZTdSZ28IpTwnVhKrjYaSKjJ7hNXRHccAUKgttSSI1oflDdi/Jc+GS8XjzdI6b8GMo8n0c71pDjf6yTMwnoD2miOHbVsIBn6HQCv3Py+AB65hf4mEOO1MbZmIGA6pZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227345; c=relaxed/simple;
	bh=UY770FAbyI7hFRnO3rtrVZR401vio3KE1YRktmKbGWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEfSoxr6dLn7faFQ7tvZlDjPIUk2lS2Hx+CHwSJjL4I6Rt42tarVRy5fcY54iqQuaP7fSq+epZWADpozICFM3uDQkWMtzDKPQFPpgy1JaiRKgG7XsNOdytc9HHkogr27aIu5e/b2cAo6AsCDeiQ7nREQ3tb+BjbGQ9HjAcpx6os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RY1zT8WB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RY1zT8WB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A481F00A3E;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=kMgwH5HONMjxOcq9wa3CYQB2oXaplTV8+dyRSjX6nR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RY1zT8WBKkAAOaCuEJLnsm4eOHjZCM07MStv+xcwONgNaf4vnhxo8rlg8VqvPNOxn
	 x0CQhUEazj5Tbfc8beYM3mv2E5khX+vdWZVYRkQD7E0RNFjbLOQoIXnBQDG1vnXfPD
	 zF68yQUkyRbb9+t9eNRNqzJTiFFtybPEjmZL0oZZwFybk6qd5s12eL+x/RRfjD/Z2b
	 DO8ngQHqqrQ+1WNo8AM5mFlezW5aMgbUc9Ius8sk9KLL2sFP3LtSH+W4rO1Lx0jV1w
	 9npeFk+KNNX1NPhq54T6AtZKapZI8fPSFVyMgdh97x2oCuQCBBKWsKbBwROjYG/QaX
	 iibtef36lU4Yw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001JuS-1fur;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 10/12] USB: serial: digi_acceleport: clean up xfer buf length expression
Date: Tue, 23 Jun 2026 17:08:24 +0200
Message-ID: <20260623150826.314727-11-johan@kernel.org>
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

Add the missing space around operators in transfer-buffer length
expressions to make the code more readable.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index 8c21c669c1a2..f7630fdcdceb 100644
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

