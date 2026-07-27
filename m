Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21523536B
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 04:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785126589; cv=none; b=b5VTjnQsFLP+6sQxH9rOZXZdedmcHqKTryU0yKqw58dgP9lSGGtM0SLIRK9r5jNV9wMGZJdxRWEXFqSzuCGgn2VrNF3nt+rGqFUmzIc8VRtbBaGwK56ypW26yqzPqzRecr8ZtdKmlQ6TlnzWzcKyW4rk7qkblw9AMcKL3m0LlgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785126589; c=relaxed/simple;
	bh=qBGU5tRLXr+5YsZ6lY+vyXGVFXfeqqkL7LJihgUba+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=LkwFsXAxcol0kmJVALSC862nWhvCi6+1QpGjnYNOOAvtD1UOknehyxZfjFfSWsY68eHHrmhF4qPaj3FwdwaMLe+xEdl1J/BO747F0U494iTMkyYq8YIrgi6OyRGixV6EpnsMjpi5Ggud12TCLKsBP7mfejY5cBNm8HIX1U36lIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZB+PNz+A; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZB+PNz+A"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260727042938epoutp0277f0bfbea9a7fdf97a9a36aa7086c7d6~GCyoydkn92916129161epoutp02c
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 04:29:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260727042938epoutp0277f0bfbea9a7fdf97a9a36aa7086c7d6~GCyoydkn92916129161epoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785126578;
	bh=+fSTYk9eOZb0xUQcronkAIQvyHxQKalFx+Vl2tTlL3U=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ZB+PNz+Ar40pwD7x8US/cpCvrUyTmWNATazEfZo+AWci2nUPKis6otVqJp272E05m
	 DPjsRwJO0MgYkNv2DloyobQ4fSq2V/fIVj5qVP84XzgnQ6ogcGkK+9pvT0K2rNYVrA
	 Ky6zPbFzDc/DOPSZReifDVj0lqR4BJyhqbIdW4tg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20260727042937epcas2p4413d7f1f152a3924e3f3aab2329b76e7~GCyoh4Nnr2368923689epcas2p4P;
	Mon, 27 Jul 2026 04:29:37 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.203]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4h7lxF3mW2z6B9mF; Mon, 27 Jul
	2026 04:29:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20260727042936epcas2p3840418498fba2940af27bd4f34b3dd05~GCynj-8Fb0221502215epcas2p30;
	Mon, 27 Jul 2026 04:29:36 +0000 (GMT)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.81.221.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260727042936epsmtip1e3a4e692db5242a59f3c8f6cf2ce2368~GCynhvXjM1003210032epsmtip1K;
	Mon, 27 Jul 2026 04:29:36 +0000 (GMT)
From: Daehwan Jung <dh10.jung@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list), Daehwan Jung
	<dh10.jung@samsung.com>
Subject: usb: gadget: u_serial: fix stale req->dep warn on
 disconnect/reconnect
Date: Mon, 27 Jul 2026 13:26:32 +0900
Message-Id: <20260727042632.1726391-1-dh10.jung@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260727042936epcas2p3840418498fba2940af27bd4f34b3dd05
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260727042936epcas2p3840418498fba2940af27bd4f34b3dd05
References: <CGME20260727042936epcas2p3840418498fba2940af27bd4f34b3dd05@epcas2p3.samsung.com>

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
Signed-off-by: Daehwan Jung <dh10.jung@samsung.com>
---
Changes in v2:
- Correct the name of author
- Modify commit subject (panic -> warn)
Link to v1: https://lore.kernel.org/all/20260721013509.2327242-1-dh10.jung@samsung.com/
---
 drivers/usb/gadget/function/u_serial.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..97ee1b9cb065 100644
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
+		 * triggering a req->dep != dep WARN.
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

