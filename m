Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B842E40911E;
	Wed, 10 Jun 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097768; cv=none; b=p2ZUjWuadMxDm7fHNC4u1YX5smOIseIhzrFG4/mpVtkh79OiHaqhlDJNUac7CkYv/AV33ffNnE/GMHpmi3Kqn3C8kqmbyieb0SUHISZyYZWLfqFlXPlqJ8VDuniIr+KaQ1wupyIHIncHhKjpjWLYjTXwbS1tQlyyRX8xY7TYIiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097768; c=relaxed/simple;
	bh=lpiPW3kAUVSqa68+xljULaT4b6XyIY+EjlGJNSCQmFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkViNG+pw3jzH3UdHC3P2+2fL6C5odlqNbEHeayKGbsObUmhk7VXDEHxFa7PRDgEwgm3JA9x+mZsb03l0G6Fe5bp8jFDTKSoi+JR670a4AOTeqw5+hZlfP7NNaXGrl9ooexpcA3SKPUHy2+hRamIdNjpCYtyhJDhW1kPjGVJHtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwXje7Hv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwXje7Hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968411F00A00;
	Wed, 10 Jun 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097765;
	bh=P29tu1ikCSOp45VUJk7Gu1l3h3xOT3si/kq0cjaYnDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IwXje7HvWlrndXoUpzUMdgn4W5ISKhtlp4Lj6x9j1K8phhJj/EJfEWuXaol1aLoid
	 hv3xkNiNQGkwX5qWYwzS/Qfb7PovQMubXR6GIAIrgLr7BCG10iGfJ+HdLxa5HmQq7E
	 qjivM2eQQMNYoahYcEop/DSdnG5lCDoi+7A2zNnyasCJIpu5O4zDoajwB6sOuJ/vlH
	 KbiHBcw5WcLTiigpvigXuMGZkhIsV3i8sIT6fXSz9t/ix8STAyvCUqHTqkrmhN9TZz
	 3UbtwzZUdU0czLGe+3LUk0ILN3v7WQYy58j2IDmv7bV1bEASAIqjzhRjmY2b9mHZNy
	 K/AGjfOOYrA2g==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wXItH-00000001UfJ-1pRh;
	Wed, 10 Jun 2026 15:22:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] USB: serial: digi_acceleport: clean up write completion
Date: Wed, 10 Jun 2026 15:22:31 +0200
Message-ID: <20260610132232.356139-11-johan@kernel.org>
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

Clean up the write completion callback by adding a temporary variable
for the transfer buffer and using the pre-existing urb pointer while
dropping some redundant casts.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/digi_acceleport.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/serial/digi_acceleport.c b/drivers/usb/serial/digi_acceleport.c
index e89e12264f57..9fcb53eb82d8 100644
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

