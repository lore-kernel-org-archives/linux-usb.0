Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36493D8104;
	Tue, 23 Jun 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782227347; cv=none; b=RURSJIBglkSymDWyd2+Mezk5ZJ5JxoqToF97EWBJ5vCdEV8voCmnLwZuMAvUQCiKS8nWM41pPZRBBZ3QryH0JHUZquGYjl2qsVvCnw+5Vh+ftE2IR8iRP3wOVtTO+zXQEfcfXu+qEffyWd5yVEhNj7BM5AnKLhwd1CxYDoFH/Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782227347; c=relaxed/simple;
	bh=UnL3lyPCjquQpfEOmtJZzJnvJCmo5qsSyZ4u8nVReac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIsCZCLI/ZZscmqw7Zbd/52lAvBMzb37Cy+B3PE6rmM3mQgsV9Wlcqn7WZ7XzVYyGsXMLn2psxy55eKTS1N9p9DrHqAxoMZaFBoc4IrzORvN1NPmuW45W0BINygyAjMFaJIQuyfsXZGqOvRgWLcMNvObE3hKszVKQR/l8BfFuyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItG+Swu6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItG+Swu6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FBB1F00ADF;
	Tue, 23 Jun 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782227344;
	bh=jb4w0w4Rql2CJUIxrjsoAJ618a9fdVLKRATT6nL1PJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ItG+Swu6/OHo6Yb2YD2J30Mw/KR/nt/lzKRngrocLNEMJTvz43MyxpR7TGCOIL8QG
	 gBqdLTOLpIIcSTh05W3eVcJ9LG+0u/iUATF6Ne8Odph1sUFkSLW5QDwe6TsDQiONSD
	 N/LyCa0ed3HZS8OZqTixbgpyHXFTCq1wkW/2jWsmkBagas+lWVg3G04+M9QP8cOdQW
	 eDfuzj/HRJN24JVccIk56ZxDCKzAUtpi0TgzpdSodCX3rMOSEVADYafSGk0HBcWkHJ
	 X5RxV9qc/CEEJpG3ZVdZYgDSX/PlmIHrUgr/5CcpLnHDLEGFL7dx5eRVAEADTetzn/
	 b0w3Zg9YHssug==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wc2kI-00000001JuU-1iRS;
	Tue, 23 Jun 2026 17:09:02 +0200
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 11/12] USB: serial: digi_acceleport: clean up write completion
Date: Tue, 23 Jun 2026 17:08:25 +0200
Message-ID: <20260623150826.314727-12-johan@kernel.org>
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

Clean up the write completion handler by adding a temporary variable for
the transfer buffer and using the pre-existing urb pointer while
dropping some redundant casts.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index f7630fdcdceb..6a557fc1ad85 100644
--- a/drivers/usb/serial/digi_acceleport.c
+++ b/drivers/usb/serial/digi_acceleport.c
@@ -936,6 +936,7 @@ static void digi_write_bulk_callback(struct urb *urb)
 	struct usb_serial_port *port = urb->context;
 	struct digi_serial *serial_priv = usb_get_serial_data(port->serial);
 	struct digi_port *priv = usb_get_serial_port_data(port);
+	unsigned char *data = urb->transfer_buffer;
 	unsigned long flags;
 	bool wakeup;
 	int ret = 0;
@@ -955,15 +956,13 @@ static void digi_write_bulk_callback(struct urb *urb)
 	spin_lock_irqsave(&priv->dp_port_lock, flags);
 	priv->dp_write_urb_in_use = 0;
 	if (priv->dp_out_buf_len > 0) {
-		*((unsigned char *)(port->write_urb->transfer_buffer))
-			= (unsigned char)DIGI_CMD_SEND_DATA;
-		*((unsigned char *)(port->write_urb->transfer_buffer) + 1)
-			= (unsigned char)priv->dp_out_buf_len;
-		port->write_urb->transfer_buffer_length =
-						priv->dp_out_buf_len + 2;
-		memcpy(port->write_urb->transfer_buffer + 2, priv->dp_out_buf,
-			priv->dp_out_buf_len);
-		ret = usb_submit_urb(port->write_urb, GFP_ATOMIC);
+		data[0] = DIGI_CMD_SEND_DATA;
+		data[1] = priv->dp_out_buf_len;
+		memcpy(data + 2, priv->dp_out_buf, priv->dp_out_buf_len);
+
+		urb->transfer_buffer_length = priv->dp_out_buf_len + 2;
+
+		ret = usb_submit_urb(urb, GFP_ATOMIC);
 		if (ret == 0) {
 			priv->dp_write_urb_in_use = 1;
 			priv->dp_out_buf_len = 0;
-- 
2.53.0

