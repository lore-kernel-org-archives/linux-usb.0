Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0307D34041D
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 01:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597918; cv=none; b=SasAXQXGHaqlCL3MKnm7K7P6qYkXM0I51tDbR4AH7HnISMNHwvNMm8kSko2jhsJEiY7P54bQQWKnBJtEGqK9GEfmRj+E1H8NLfl8PNvyP4CKQb/bF5hYI/E84LNq3/MdPG0gDGqL7842jufBh3o3v6bT/I/8g9x0LoL0r7vLzmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597918; c=relaxed/simple;
	bh=w7k2tepgYeiN6lwEqKcgIkX4DEvmboULI8u7i4YTMIM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=hAABGdoc9I/5VgNPp11PLRuYIfhWmlAZog/UZqbAdwHthRWkUNKldtiJglSTRgVzq5JqqDnYFP6o9XB0sIvv0BKMXN5f7rNHjzvFnFzallTBMAjB+qzxCdtHtdfJ5yRG64EuzNJfjQfaIGsSI4PyPQNjrkj8QkYolGpOHrBiHRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=oYKjzYpC; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oYKjzYpC"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260721013832epoutp02bffe880a1b474cf9dd991da0d679a41a~EKlimNWcA0229202292epoutp025
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 01:38:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260721013832epoutp02bffe880a1b474cf9dd991da0d679a41a~EKlimNWcA0229202292epoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784597912;
	bh=tb2687/SppZtq8rBlYE9zy+H+1g+pc7Ssfr9YS1zbNQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=oYKjzYpCpN2f1XryN1zx7Bm5Fk9JnbVRTjEPW/bU9zPPqNaCJIi7OhqG7cvchOjmx
	 v1Y+PafEI9rN/WZTFpuRhB/vKpR2IB3CXnK3uUoqZAX+0MRVbN9+9xLFJ3Dmx7J5b8
	 cuJUaRfhdnrRfPP2YjxPdt4JXjDMzrVoPNNXhDOc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20260721013832epcas2p3fc2a96eaaa13f6bee3d5e0bb310894b0~EKliKrIxj0665506655epcas2p36;
	Tue, 21 Jul 2026 01:38:32 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.206]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4h40Qb5YYfz6B9m9; Tue, 21 Jul
	2026 01:38:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20260721013831epcas2p18cc80c836585f3b38f718881de13cf92~EKlhWU-2C0992809928epcas2p1B;
	Tue, 21 Jul 2026 01:38:31 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260721013831epsmtip29cda3af607b6dd8ecf55f96a39f37e4d~EKlhUFiGS3002230022epsmtip2T;
	Tue, 21 Jul 2026 01:38:31 +0000 (GMT)
From: Daehwan Jung <dh10.jung@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list), "dh10.jung"
	<dh10.jung@samsung.com>
Subject: usb: gadget: u_serial: fix stale req->dep panic on
 disconnect/reconnect
Date: Tue, 21 Jul 2026 10:35:09 +0900
Message-Id: <20260721013509.2327242-1-dh10.jung@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260721013831epcas2p18cc80c836585f3b38f718881de13cf92
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260721013831epcas2p18cc80c836585f3b38f718881de13cf92
References: <CGME20260721013831epcas2p18cc80c836585f3b38f718881de13cf92@epcas2p1.samsung.com>

From: "dh10.jung" <dh10.jung@samsung.com>

When DWC3_EP_DELAY_STOP defers ENDXFER, giveback of -ESHUTDOWN requests
arrives after gserial_disconnect(). These stale requests then accumulate
in read_pool via gs_rx_push(). After gadget exit frees the old endpoint,
req->dep becomes a dangling pointer. On the next gserial_connect(),
gs_start_rx() queues these stale requests onto a new endpoint, triggering:

  WARNING: CPU: 0 at drivers/usb/dwc3/gadget.c:1990
  request 00000000e6e350a5 belongs to ''

  Call trace:
   dwc3_gadget_ep_queue+0x158/0x1e8
   usb_ep_queue+0x60/0xe8
   gs_start_rx+0xa4/0x128
   gs_start_io+0x128/0x254
   gserial_connect+0xb4/0x14c
   acm_set_alt+0xa0/0x114
   set_config+0x22c/0x384
   composite_setup+0x37c/0xc7c
   configfs_composite_setup+0x5c/0x88
   dwc3_ep0_interrupt+0x6c8/0xbcc
   dwc3_thread_interrupt+0xa0/0x1284
   irq_thread_fn+0x48/0xa8
   irq_thread+0x150/0x31c
   kthread+0x150/0x27c
   ret_from_fork+0x10/0x20

Fix by discarding -ESHUTDOWN requests immediately in gs_read_complete()
while ep is still valid, preventing stale reqs from entering read_pool.

Fixes: 937ef73d5075 ("USB: serial gadget: rx path data loss fixes")
Signed-off-by: dh10.jung <dh10.jung@samsung.com>
---
 drivers/usb/gadget/function/u_serial.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..a8f5b0a6df51 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -459,10 +459,22 @@ static void gs_read_complete(struct usb_ep *ep, struct usb_request *req)
 {
 	struct gs_port	*port = ep->driver_data;
 
-	/* Queue all received data until the tty layer is ready for it. */
 	spin_lock(&port->port_lock);
-	list_add_tail(&req->list, &port->read_queue);
-	schedule_delayed_work(&port->push, 0);
+	if (req->status == -ESHUTDOWN) {
+		/*
+		 * Discard shutdown completions here while ep is still valid.
+		 * Returning them to read_pool after gserial_disconnect() has
+		 * reset the counters causes stale reqs (with req->dep pointing
+		 * to the old ep) to be queued onto a new ep at reconnect time,
+		 * triggering a req->dep != dep WARN and kernel panic.
+		 */
+		gs_free_req(ep, req);
+		port->read_started--;
+	} else {
+		/* Queue all received data until the tty layer is ready for it. */
+		list_add_tail(&req->list, &port->read_queue);
+		schedule_delayed_work(&port->push, 0);
+	}
 	spin_unlock(&port->port_lock);
 }
 
-- 
2.34.1

