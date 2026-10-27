Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111488;
	b=fbJbYkXiKvy1clUB3x7X+J2rPXONoalAmjyPTkaqiBKfmJMsRftTe/RzaXWkcCh9vnYP
	 9CPrmvD1UH1F5n9B0YO7PF+weRTV5i4UqfQkgjneGj7AVq2tfSNIiskzUpzhx32k7wzz7
	 9L1UnHgJdTk/V8y8sNs+g6QLQw+gYB4iy6w/BFafVcwhMEs3duToQALQf7mXJLO0b0TVt
	 VO7v+RKe7aY3WuXw/TIwPe5Y1X/LHleTBVIrCU6cgfYZN8Je/oFgGkMq0fT40Qd+PRVVL
	 Hek1b3cOxrUKA4EpX+n2EMnPlHKP36v5NsZU9hoRoHgMgeOSB+cRdPD4WqOyZHJcNNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111488;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=2ksAIlSFPDVWfTjVAHsZTIFTFYt5xOLVM8YGTIXyM2U=;
	b=GOnVkAU2TyRutJ1/IKdXhtE5YRaZzj5RUERSvQuTTdt6KnxqG6i1c3uPqdpVa2DwFwQr
	 ow+esWKV8a+yoSKwosYtLq7mG97ncD+fEAc+qvti1NiLJDXN6lMejFFVRPa4QVnG0aomW
	 UB1ugCK1u0N6YBhp5QeXN+UFc/jxcH9iwflXSLKlOC7OTvj6pZf1ffdk4U7oWbxEtc6H5
	 3Vj9YR0NkuEXLxbuO4L/eBXrRTa15eBVoROVOVm6YptMwIwqPao7VOqFq3rqro3xOijLc
	 bD3FJkBYAsV34y2VALthYFNNTxP4hxl+t+a8weVSD4+EekOqm71M6GkRUJYdJBBG1Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ewXGg+x8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EC4606A31B
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ewXGg+x8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7B31F01828;
	Tue, 27 Oct 2026 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793111487;
	bh=2ksAIlSFPDVWfTjVAHsZTIFTFYt5xOLVM8YGTIXyM2U=;
	h=From:To:Cc:Subject:Date;
	b=ewXGg+x82Pa7mL63y4h5+DnZgiYgUhuzEGfFLoPOhjCeygPzhcTA7bIkwIQ/35r42
	 UgSjJbZYYvyhp6OMS3wiL3UNLMD3AlhcrGcFO9zcfNRGjkh5Ewejt+8B8L93N9FXVK
	 PHy4I9f2i6lNv3LiOUxlKaI1LZ1+th7hiNI6gmYM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: johan@kernel.org
Cc: linux-usb@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: serial: oti6858: fix the teardown order in close
Date: Tue, 27 Oct 2026 15:31:26 +0100
Message-ID: <2026102725-congenial-profound-99ee@gregkh>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4076; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=dekFuF/qzXNS/b3Rlmmu64RfPN1VHBylrv3D7wGgf+M=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPtu4V0AldoaKh/bGMw0RU8y/rTbZpatMuWYm9EP0lt cvEhimyI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACbi9phhwezm77PO+St66fza +HKZwq5G9f8T1zIs2P9X5wP/27r5xo/j7grp/OhNCOhoAwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

The driver passes a baton around: the completion handler of the
interrupt urb either resubmits the urb, submits the read urb or
schedules one of the two delayed works, and the works and the bulk
completion handlers submit the interrupt urb again.

oti6858_close() cancels the works first and kills the urbs afterwards.
An interrupt urb that completes in between schedules a work again:

	oti6858_close()
	  cancel_delayed_work_sync(setup)
	  cancel_delayed_work_sync(write)
				oti6858_read_int_callback()
				  schedule_delayed_work(setup)
	  usb_kill_urb(interrupt_in_urb)	/* not in flight */
				setup_line()
				  usb_submit_urb(interrupt_in_urb)

The port is now closed with the baton still going round. The next open
fails because the interrupt urb is already submitted, and if the device
is unplugged, oti6858_port_remove() frees the private data while a work
may be pending or running.

Poison the interrupt urb first: that waits for the handler and makes all
further submissions fail, so nothing schedules the works any more. Then
cancel the works, after which only the bulk urbs are left, kill those,
and make the interrupt urb usable again for the next open. Don't print
an error for the submissions that fail with -EPERM in this window, as
oti6858_read_bulk_callback() already does.

Fixes: 49cdee0ed0fc ("USB: oti6858 usb-serial driver (in Nokia CA-42 cable)")
Cc: stable <stable@kernel.org>
Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Johan, another llm-found patch, seems sane, but it's not exactly obvious
to me if this is real or not?

 drivers/usb/serial/oti6858.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/oti6858.c b/drivers/usb/serial/oti6858.c
index c6364e8ff71f..005fe19c3cd4 100644
--- a/drivers/usb/serial/oti6858.c
+++ b/drivers/usb/serial/oti6858.c
@@ -248,7 +248,7 @@ static void setup_line(struct work_struct *work)
 
 	dev_dbg(&port->dev, "%s(): submitting interrupt urb\n", __func__);
 	result = usb_submit_urb(port->interrupt_in_urb, GFP_KERNEL);
-	if (result != 0) {
+	if (result != 0 && result != -EPERM) {
 		dev_err(&port->dev, "%s(): usb_submit_urb() failed with error %d\n",
 			__func__, result);
 	}
@@ -300,7 +300,7 @@ static void send_data(struct work_struct *work)
 
 		dev_dbg(&port->dev, "%s(): submitting interrupt urb\n", __func__);
 		result = usb_submit_urb(port->interrupt_in_urb, GFP_NOIO);
-		if (result != 0) {
+		if (result != 0 && result != -EPERM) {
 			dev_err(&port->dev, "%s(): usb_submit_urb() failed with error %d\n",
 				__func__, result);
 		}
@@ -561,6 +561,13 @@ static void oti6858_close(struct usb_serial_port *port)
 
 	dev_dbg(&port->dev, "%s(): after buf_clear()\n", __func__);
 
+	/*
+	 * The interrupt urb schedules the works, and the works and the bulk
+	 * urbs resubmit the interrupt urb: keep it from being submitted until
+	 * all of them are gone.
+	 */
+	usb_poison_urb(port->interrupt_in_urb);
+
 	/* cancel scheduled setup */
 	cancel_delayed_work_sync(&priv->delayed_setup_work);
 	cancel_delayed_work_sync(&priv->delayed_write_work);
@@ -569,7 +576,8 @@ static void oti6858_close(struct usb_serial_port *port)
 	dev_dbg(&port->dev, "%s(): shutting down urbs\n", __func__);
 	usb_kill_urb(port->write_urb);
 	usb_kill_urb(port->read_urb);
-	usb_kill_urb(port->interrupt_in_urb);
+
+	usb_unpoison_urb(port->interrupt_in_urb);
 }
 
 static int oti6858_tiocmset(struct tty_struct *tty,
@@ -826,7 +834,7 @@ static void oti6858_write_bulk_callback(struct urb *urb)
 	/* schedule the interrupt urb if we are still open */
 	dev_dbg(&port->dev, "%s(): submitting interrupt urb\n", __func__);
 	result = usb_submit_urb(port->interrupt_in_urb, GFP_ATOMIC);
-	if (result != 0) {
+	if (result != 0 && result != -EPERM) {
 		dev_err(&port->dev, "%s(): failed submitting int urb,"
 					" error %d\n", __func__, result);
 	}
-- 
2.56.0

