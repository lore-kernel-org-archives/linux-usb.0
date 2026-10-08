Received: from mvsmtppost24.nm.naver.com (mvsmtppost24.nm.naver.com [61.247.196.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7B03B47F0
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.247.196.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484692; cv=none; b=G2aoZk8Xdq50e777vYqUQ5ZTJwv/ajoRrOts22FdOF/+dvU/yBGhGf/Zo2CM/RPuMZsGYBgo/fqtpUkl4RyLJ/7i88JChYrF1lL2AHIoFhkPSA4iMn+6p6CGTpajzFs8jv63MIQN9IBIVuluZu0R1oZRiTu0m6FZpvYaq4Zt6To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484692; c=relaxed/simple;
	bh=Ow6kx9LfuzvKL6P0C4e9jydQxe2Hj3S0s/JTt0I6XvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJSjv7ZTUaz2hX6QDXKRqVT4qNhkWovN478sgIw9CGGgKovdhQ00yUHb7P77dgNjupGgRP4/G+3mF7tZd+O+vZ4c6n+Tqw/QFx2bBbzZzd4Fv6GglG3UspQkWeb1aw/67zeUglrUtJIw7K5ohPl5Gs669e7joPJCLtqKJMp5pVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=p303IiBX; arc=none smtp.client-ip=61.247.196.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="p303IiBX"
Received: from mvsendbo14.nm ([10.179.40.207])
  by mvsmtppost24.nm.naver.com with ESMTP id j1y691ygTvG5Q1+insIKjw
  for <linux-usb@vger.kernel.org>;
  Thu, 08 Oct 2026 18:38:04 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791484684; bh=Ow6kx9LfuzvKL6P0C4e9jydQxe2Hj3S0s/JTt0I6XvA=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=p303IiBXUSn+/p4iPtGBZDRZbt8LL5x4iD5tAwTRlsA5xkFH4nz01wZUXKM1pvTq0
	 xhl5Hi19/DrSYHfxHYprpBeCyF4rtxIkD6lGrECIyzneXC+JozCFZe+uvxjPUP7HqO
	 JnanY2niQzw48NSUHHTYIxDZh0CV/CiPEl+W7pKghmQi5TwSWCqnxb6AH66xtiXT9G
	 X6djnTGYzP74guSRs+jX/qdumLznW9PO9q7qZ0lso/FRnwww9EzAUiWwKarsclFnjE
	 2GFE4tIX3vk/cYCnXsVWaR5kTEb8rKZkPZHNFTdy6fcC0i3UpslpoywUOoENQ16mv6
	 kBpDMnclat2fw==
X-Session-ID: qFurB7JoTT2hQdbd05hNzA
X-Works-Send-Opt: OPFwpzGdjHmdKHFOMr39Ko3YKBmqjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: sZY9FAulFqJZ+HmqaAUZ+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp001.nm.naver.com with ESMTP id qFurB7JoTT2hQdbd05hNzA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 08 Oct 2026 18:38:03 -0000
From: tjdqudcks0424@naver.com
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-usb@vger.kernel.org,
	Sung Byeongchan <tjdqudcks0424@naver.com>
Subject: [PATCH] usbip: vudc: reject submits after endpoint state changes
Date: Fri,  9 Oct 2026 03:37:53 +0900
Message-ID: <20261008183753.10231-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sung Byeongchan <tjdqudcks0424@naver.com>

v_recv_cmd_submit() looks up an endpoint under udc->lock, but drops the
lock while it allocates the URB and receives the payload.  A gadget
configuration change can disable or disable and re-enable that endpoint
before the URB is queued.  The submit then carries stale endpoint state
into asynchronous VUDC processing.  The confirmed failure dereferences a
NULL urb->dev while logging a completion error and panics the kernel.

Give each VUDC endpoint a generation that changes on enable and disable.
Snapshot the generation and immutable parsing fields during lookup, then
recheck descriptor presence and generation under udc->lock immediately
before adding the URB to urb_queue.  Reject a stale request with
-ESHUTDOWN.

On a KASAN build at ff47652a4b66c067c765a7ad464d930b5a9367cc,
normal enabled-endpoint, serialized-disable, and disable/re-enable
stale-submit cases each passed three independent fresh-boot runs after the
fix.  The stale case returned -ESHUTDOWN without a sanitizer report, and a
following EP0 request succeeded after bounded reconnection.  The touched
source is unchanged at 0c2669a9f4a1d607e7591ae50ccf3c432a0aff08, where
the patch also applies and builds cleanly.

The demonstrated impact is kernel/service denial of service.  No controlled
write, information disclosure, RCE, or LPE was demonstrated.  The source
reproducer and complete logs are available on request and are not included
in this public report.

OpenAI Codex assisted source inspection, test design, patch drafting, and
evidence organization.

Fixes: 79c02cb1fd5c ("usbip: vudc: Add vudc_rx")
Assisted-by: LLM
Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
---
 drivers/usb/usbip/vudc.h     |  3 +++
 drivers/usb/usbip/vudc_dev.c |  2 ++
 drivers/usb/usbip/vudc_rx.c  | 21 ++++++++++++++++-----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
index 5ef0e7d9b23ad..b2adc61f181cb 100644
--- a/drivers/usb/usbip/vudc.h
+++ b/drivers/usb/usbip/vudc.h
@@ -28,6 +28,7 @@ struct vep {
 	char name[8];	/* space for ep name */
 
 	const struct usb_endpoint_descriptor *desc;
+	u64 generation;
 	struct usb_gadget *gadget;
 	struct list_head req_queue; /* Request queue */
 	unsigned halted:1;
@@ -44,6 +45,8 @@ struct vrequest {
 struct urbp {
 	struct urb *urb;
 	struct vep *ep;
+	u64 ep_generation;
+	unsigned int ep_maxp;
 	struct list_head urb_entry; /* urb queue */
 	unsigned long seqnum;
 	unsigned type:2; /* for tx, since ep type can change after */
diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index 5ef88117965d1..e3800d5e83a30 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -250,6 +250,7 @@ static int vep_enable(struct usb_ep *_ep,
 	_ep->maxpacket = maxp;
 	ep->desc = desc;
 	ep->type = usb_endpoint_type(desc);
+	ep->generation++;
 	ep->halted = ep->wedged = 0;
 
 	spin_unlock_irqrestore(&udc->lock, flags);
@@ -270,6 +271,7 @@ static int vep_disable(struct usb_ep *_ep)
 
 	spin_lock_irqsave(&udc->lock, flags);
 	ep->desc = NULL;
+	ep->generation++;
 	nuke(udc, ep);
 	spin_unlock_irqrestore(&udc->lock, flags);
 
diff --git a/drivers/usb/usbip/vudc_rx.c b/drivers/usb/usbip/vudc_rx.c
index 51bb70837b902..3c459c7b57b5f 100644
--- a/drivers/usb/usbip/vudc_rx.c
+++ b/drivers/usb/usbip/vudc_rx.c
@@ -115,17 +115,21 @@ static int v_recv_cmd_submit(struct vudc *udc,
 		goto free_urbp;
 	}
 	urb_p->type = urb_p->ep->type;
+	urb_p->ep_generation = urb_p->ep->generation;
+	if (urb_p->type == USB_ENDPOINT_XFER_ISOC) {
+		urb_p->ep_maxp = usb_endpoint_maxp(urb_p->ep->desc);
+		urb_p->ep_maxp *= usb_endpoint_maxp_mult(urb_p->ep->desc);
+	}
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	urb_p->new = 1;
 	urb_p->seqnum = pdu->base.seqnum;
 
-	if (urb_p->ep->type == USB_ENDPOINT_XFER_ISOC) {
+	if (urb_p->type == USB_ENDPOINT_XFER_ISOC) {
 		/* validate packet size and number of packets */
 		unsigned int maxp, packets, bytes;
 
-		maxp = usb_endpoint_maxp(urb_p->ep->desc);
-		maxp *= usb_endpoint_maxp_mult(urb_p->ep->desc);
+		maxp = urb_p->ep_maxp;
 		bytes = pdu->u.cmd_submit.transfer_buffer_length;
 		packets = DIV_ROUND_UP(bytes, maxp);
 
@@ -139,7 +143,7 @@ static int v_recv_cmd_submit(struct vudc *udc,
 		}
 	}
 
-	ret = alloc_urb_from_cmd(&urb_p->urb, pdu, urb_p->ep->type);
+	ret = alloc_urb_from_cmd(&urb_p->urb, pdu, urb_p->type);
 	if (ret) {
 		usbip_event_add(&udc->ud, VUDC_EVENT_ERROR_MALLOC);
 		ret = -ENOMEM;
@@ -152,7 +156,7 @@ static int v_recv_cmd_submit(struct vudc *udc,
 	BUILD_BUG_ON_MSG(PIPE_BULK != 3, "PIPE_* doesn't range from 0 to 3");
 
 	urb_p->urb->pipe &= ~(PIPE_BULK << 30);
-	switch (urb_p->ep->type) {
+	switch (urb_p->type) {
 	case USB_ENDPOINT_XFER_BULK:
 		urb_p->urb->pipe |= (PIPE_BULK << 30);
 		break;
@@ -175,6 +179,13 @@ static int v_recv_cmd_submit(struct vudc *udc,
 		goto free_urbp;
 
 	spin_lock_irqsave(&udc->lock, flags);
+	if (urb_p->ep != &udc->ep[0] &&
+	    (!urb_p->ep->desc ||
+	     urb_p->ep->generation != urb_p->ep_generation)) {
+		spin_unlock_irqrestore(&udc->lock, flags);
+		ret = -ESHUTDOWN;
+		goto free_urbp;
+	}
 	v_kick_timer(udc, jiffies);
 	list_add_tail(&urb_p->urb_entry, &udc->urb_queue);
 	spin_unlock_irqrestore(&udc->lock, flags);
-- 
2.43.0

