Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.111.35.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520329;
	b=ZZWYIvfujPYZliYvhj0hhQutP5DQ1Q68XBgNBmLSbAdL6RtVPCMZgDDLKm/i5xkc6UAR
	 YkJi0zb/xaeOaT1dBzzK5BZ6CDMYWtteHy7pnrWmiOCHnkuLwVFKPM2fBziiZKOV33rZD
	 gi+ySMlRWw+qovxtlq7sJR3RY8/5FkX5weE1uGwYihzvI73F3lfX3yn3EozBkupVQvFVp
	 U65+H6sFjOyeNveBjQPu2JpGFFhSOlmS4DzmLZCCQdYXwZwlV9LHZaHwOLbhAABDyNoTF
	 KEDgib2Ft6fVAyZs1fIyuRYZ0mdyB/WdtLx77r6glCiPdls5AX2l5w5+pnfjQdJYppg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520329;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zc0NCiRRYaEvZwGx0TD0KGo2/sLKzuC08cHKJKz2igQ=;
	b=D/R96pdAHSsaE/ZfOg5SEN3+z+0YYugh4Iix4a2rWRSRah/ULjeH3DMzRjgLpsKnfL47
	 cU99PnxZ7jC79ONgHdnaU6jimxKPfxNwTLIh6j5XUQ2KqFGNeY35+pKxRHdMq9DHKrAjP
	 Ryi4o4V2ZbFTWczFCRlEa1ufOEWZ4u3zd2Av9cQVQFkxktp0s4YF+Ybe7ag6kqMl7Zab0
	 XVJaXewUgaNDqTfac8xpLX5sZCkMC+eijJa/LvCt81SBl0pwq1nyMJ7QQtHY/scEQ4D9q
	 LNdv2Y++GK7sBpXwxP+Zs0zpFkfVi3kgZVu0/u8sH7Mh78TvTpu7Oub55kjAnoLHUHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=nf4ZBggo;
	arc=none smtp.remote-ip=114.111.35.38
Received: from cvsmtppost29.nm.naver.com (cvsmtppost29.nm.naver.com [114.111.35.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADED60A260D
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 18:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADED60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=nf4ZBggo
Received: from cvsendbo029.nm ([10.112.18.60])
  by cvsmtppost29.nm.naver.com with ESMTP id BZR9nQe8SIC58UUIfoIt1g
  for <linux-usb@vger.kernel.org>;
  Tue, 20 Oct 2026 18:18:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1792520321; bh=Si2wnvGKZHvpde8Ibi0U3k1MSj248XO5/ColScK9RFQ=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=nf4ZBggoqAsKzMhmNS1u+Bs8nZMSXuDw+OnEHgiHmWkfShgjwOpXymAe9bV5oRuyi
	 gw3wXSzMS2Idz22znfBvDbk6ofsxDzhjrW2+jg1conaBoTwKY5nt55Fqm348eVfikt
	 63KX7yWOw/FYOVn5RUHyI1HtA26/0SRzFrAOWsk3JXGx7vuCA7+1WE5JuyeJRFMqQw
	 DIiyqTVwSkO8xW/g6m8rv3IhhroFbnO8R5A48cy7WsU6amFTC2Md4PyGnKx84TpiSo
	 4Hal5sVpX5ydMl59TkVQHFJi5E6d2SusL+PCYWs+Xv3UMg1s5G7RcvuDqChmM1Zrux
	 Na6RBIqacK8Gg==
X-Session-ID: GkjKPebkSiOPk+-B-AL63g
X-Works-Send-Opt: OPFwpzGdjHmdKHFOMr39Ko3YKBmqjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: fqn/FAUlFqJZ+HmmKovX+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by mvnsmtp02.nm.naver.com with ESMTP id GkjKPebkSiOPk+-B-AL63g
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 20 Oct 2026 18:18:40 -0000
From: tjdqudcks0424@naver.com
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-usb@vger.kernel.org,
	Sung Byeongchan <tjdqudcks0424@naver.com>
Subject: [PATCH v2] usbip: vudc: reject submits after endpoint state changes
Date: Wed, 21 Oct 2026 03:18:32 +0900
Message-ID: <20261020181832.461892-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sung Byeongchan <tjdqudcks0424@naver.com>

v_recv_cmd_submit() looks up an endpoint under udc->lock, but drops the
lock while it allocates the URB and receives the payload.  A gadget
configuration change can disable or disable and re-enable that endpoint
before the URB is queued.

In a timing-controlled KASAN test, one of six unmodified baseline runs
faulted in the inlined receive path while reading endpoint descriptor
state after the descriptor had been cleared.  The other baseline runs
also showed that a submit could cross the endpoint state transition.

Give each VUDC endpoint a generation that changes on enable and disable.
Snapshot the generation and immutable parsing fields during lookup, then
recheck descriptor presence and generation under udc->lock immediately
before adding the URB to urb_queue.  Reject a stale request with
-ESHUTDOWN.

The parsing snapshots avoid unlocked reads of mutable descriptor state.
The generation check also distinguishes a newly enabled endpoint from the
old endpoint state even though both use the same struct vep.

On a KASAN build at ff47652a4b66c067c765a7ad464d930b5a9367cc,
normal enabled-endpoint, serialized-disable, and disable/re-enable
stale-submit cases each passed three independent fresh-boot runs after the
fix.  The stale case returned -ESHUTDOWN without a sanitizer report, and a
following EP0 request succeeded after bounded reconnection.  The touched
source is unchanged at 0c2669a9f4a1d607e7591ae50ccf3c432a0aff08, where
the patch also applies and builds cleanly.

The demonstrated impact is kernel/service denial of service.  No
controlled write, information disclosure, RCE, or LPE was demonstrated.

OpenAI Codex assisted source inspection, test design, patch drafting, and
evidence organization.

Fixes: 79c02cb1fd5c ("usbip: vudc: Add vudc_rx")
Assisted-by: LLM
Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
---
Changes in v2:
- Correct the race-specific NULL dereference description.
- Document the production-path reproduction and timing-sensitive baseline result.
- Explain why generation revalidation closes disable/re-enable reuse.
- No code changes.

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

