Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111377;
	b=IZ+/taTkuOL3GdRuekcpTjsvvZCHvEx4HT4zssRpi5snrDwuOGNFK0XlPRs7M4SJfb71
	 X1UVr+qYBA43X5DdhbLTREUhfSFqf9KizQbNzk/9Abmaj1lPHjaAH6F6bySGo2qO+r7yf
	 V723Vi/n0b69NTEk2AdHJksupgKyiG4inBfYzmcJeSm7NNwImuO2nBITvmGfTMQAmGWlz
	 nUS9ZSMfzj8U+o4b8fGFpT+vqGBX2vTc9/YMr32obyw+zrBhPysUXyemYOqq/ISHlbWBF
	 wA/Gs1AIOvaeeRwiPWrmQjBCwFlKei9GEyMSkiBnWCmwJyeYL3FL4uZBCQbd3yNlIiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111377;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=m9amcDJbZ6P1vlU84pbyhb1om6ivbKUqCyCNeun03Zk=;
	b=t4Iytd73mbR5dHFpScmS/w+BSdqoEhsEWhKAxbxdwDfDZh63G9a+nS2egTg6K63eazWo
	 SpSLDWO0uSYsNpxGWkR/oZIGvfwj3CBX8KufnTNHMyTzL4XIZ627lmt+e2+FlX6GRTVIM
	 DhzU1CYW71xylAg9oCZaGGWM+3GBfRSLSMCeGgBL1IHRJRgRuFOxKOL2HUM4c49KMs/Xn
	 IsSV2YzImTWFKWbUsxM53gfQOrSw8IuMc9JulyG9rkxa7An6Xz3K6IhlDhh1fPKraG1L7
	 i0DEYk3n9mC7820bPAtxfEf87/e85EQXoJmHyg0TWRsaPj0ChTOnifGc0fyovDo33NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pOFP712L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0CC606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pOFP712L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DC51F01825;
	Tue, 27 Oct 2026 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793111376;
	bh=m9amcDJbZ6P1vlU84pbyhb1om6ivbKUqCyCNeun03Zk=;
	h=From:To:Cc:Subject:Date;
	b=pOFP712L+nTAuRKGApJM45brO20O3ZhMC5zrW3tq3IDM+hlA5+ExvetjaUQAks71L
	 +iEgzaVGSymXuBlIvkKkehpf6hl0tsFUp70mGVms56owTqrvWvEdvX9naj96KJcrzJ
	 1bd2Xay2TF1zyMrBCiGniSbhjUo4p55d+tlw+yGQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: johan@kernel.org
Cc: linux-usb@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: serial: garmin_gps: queue the device reset
Date: Tue, 27 Oct 2026 15:29:34 +0100
Message-ID: <2026102733-prayer-drainer-56f3@gregkh>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2686; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=4z8vlvWNs7PG5XpBiNFNhgwPsS8sO6+vZQ9jopDt5Oc=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkPtvpuKc848vjY/HeFZcnHMnIvHYtPWfCT59O5zIrbz bplPfU/O2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAi66IZ5hc/0os4ELJqg0Hf osvtju0yvGcE+xkWLH7u9vGwzfPySS53P0SbCnI96rf8DgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

A private packet with the ID PRIV_PKTID_RESET_REQ that is written to the
port makes garmin_write() call usb_kill_urb() and usb_reset_device().
Both sleep, but the write operation of a tty driver must not: a line
discipline may call it in atomic context, synchronous PPP for one under
a spinlock with bottom halves disabled.  In addition usb_reset_device()
has to be called with the device locked, which it is not here.

The reset also unbinds the driver inside the write: the disconnect hangs
the tty up, ppp_sync_close() calls ppp_unregister_channel(), and that
spins on pch->downl, which the writer holds.  The CPU is lost.

Unlink the URB and use usb_queue_reset_device(), which locks the device
and resets it from a work item.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Johan, this was sent to me, but I really don't know if PPP is used for
this device to talk to the port or not.  If not, this isn't a real
issue, but if it is, then maybe it is?  I can't tell so I'm tossing it
to you :)

 drivers/usb/serial/garmin_gps.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 8020149f5658..c2b29a7a6674 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -818,10 +818,9 @@ static void priv_status_resp(struct usb_serial_port *port)
  * Garmin specific driver functions
  ******************************************************************************/
 
-static int process_resetdev_request(struct usb_serial_port *port)
+static void process_resetdev_request(struct usb_serial_port *port)
 {
 	unsigned long flags;
-	int status;
 	struct garmin_data *garmin_data_p = usb_get_serial_port_data(port);
 
 	spin_lock_irqsave(&garmin_data_p->lock, flags);
@@ -830,13 +829,10 @@ static int process_resetdev_request(struct usb_serial_port *port)
 	garmin_data_p->serial_num = 0;
 	spin_unlock_irqrestore(&garmin_data_p->lock, flags);
 
-	usb_kill_urb(port->interrupt_in_urb);
-	dev_dbg(&port->dev, "%s - usb_reset_device\n", __func__);
-	status = usb_reset_device(port->serial->dev);
-	if (status)
-		dev_dbg(&port->dev, "%s - usb_reset_device failed: %d\n",
-			__func__, status);
-	return status;
+	/* This is called by the write operation, which must not sleep */
+	usb_unlink_urb(port->interrupt_in_urb);
+	dev_dbg(&port->dev, "%s - usb_queue_reset_device\n", __func__);
+	usb_queue_reset_device(port->serial->interface);
 }
 
 
-- 
2.56.0

