Received: from cvsmtppost31.nm.naver.com (cvsmtppost31.nm.naver.com [114.111.35.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58653FAE19
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 06:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354667; cv=none; b=WZBn8vbOzObL9ORM4YUFJ+xzLKs7qnhrVUKd2N8AAnc56FiHg3OSnv/EJ7I8Uzr5NmQu6SBo51zNG4889jwZrGhkNxTAcjmWiOXZGoU0BflqnTBlzsG7fjC8AxuNVuEkZF/CeQHrjW0rL2T24RPolvLxjbzqUTeZrEvE+NjeUL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354667; c=relaxed/simple;
	bh=/PMM7+voCbmOVJt4V56BuGc4oRxoY4wP3e4H4QzJ6zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uc9manug2C5mLMY2EPusToShiWBm0QR8hD2DRjSaloXzVWwBi3CGzLn22964GGs9THTrYexwPOZtnI8djOK51DrTgjnPkZ8KVCbnh5W8sJHk+4b4TRfjGtP5kzc51n8fxdJ8PHWqv3nFqFJQQhgmhOMCkYt+rQdQBw/i+T7GvpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=P4Xbj9wX; arc=none smtp.client-ip=114.111.35.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="P4Xbj9wX"
Received: from cvsendbo010.nm ([10.112.20.44])
  by cvsmtppost31.nm.naver.com with ESMTP id 1q5TBfM0SD2IE72a2CVUEQ
  for <linux-usb@vger.kernel.org>;
  Wed, 07 Oct 2026 06:30:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791354657; bh=/PMM7+voCbmOVJt4V56BuGc4oRxoY4wP3e4H4QzJ6zI=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=P4Xbj9wXTO3ErpZRCjcKqhHqc1lv7Oait1H3CWYQYxfJxDAHysaNdEfumLerwE2uf
	 ICdauPN7NqsOO7hlesYxdT6ex1RUVvqP9otKxHZh4ZikMbC4kAv5u8NzbKd+PoypFk
	 8iPRHfsvDjeWe201qoGh0eayws9CCBnA1mEvGGameyl826hZSiL29Jkb0SztEryDFW
	 VTjnomoczpTNINsnx+z0nY7FCWf3W6SAp+kRoIEN1zmWiXgWFtTZ+F8Ch5OaPNQCGx
	 pGBsQ23SjglsMd/6gqRDfjWaugPBSulnccZNfSfbO8EmqsmFA1Rd+w9+YTi7lqyCEM
	 MsxNWbqJTmPbA==
X-Session-ID: P+119-2HSLCHWnn4IMn8Xw
X-Works-Send-Opt: OPFwpzGdjHmdKHFOMr39Ko3YKHmdjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: XqKZKqulFqJZ+HmXFxUZ+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp012.nm.naver.com with ESMTP id P+119-2HSLCHWnn4IMn8Xw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 07 Oct 2026 06:30:57 -0000
From: Sung Byeongchan <tjdqudcks0424@naver.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usbip: vudc: snapshot endpoint state under lock
Date: Wed,  7 Oct 2026 15:30:54 +0900
Message-ID: <20261007063054.26374-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v_recv_cmd_submit() finds an endpoint and records its type while holding
udc->lock, but then drops the lock and rereads both ep->type and ep->desc.
The VUDC timer drops this lock around gadget setup callbacks, and
endpoint disable clears ep->desc under the lock.  A USB/IP host can
therefore race an ISO CMD_SUBMIT with endpoint disable and make
usb_endpoint_maxp() dereference NULL.

Copy the endpoint type and derived isochronous maximum packet size while
the lock still protects the descriptor.  Use the snapshots for
validation, URB allocation, and pipe setup after unlocking.

This was found by source review with AI assistance.  The production VUDC
and UAC2 fixture panicked in two independent boots without a diagnostic
kernel change.  The fixed kernel completed 5,257 race attempts without
an oops or panic and preserved the normal and serialized controls.

Fixes: b78d830f0049 ("usbip: fix vudc_rx: harden CMD_SUBMIT path to handle malicious input")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
---
 drivers/usb/usbip/vudc_rx.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/usbip/vudc_rx.c b/drivers/usb/usbip/vudc_rx.c
index 51bb70837b902..276f645734484 100644
--- a/drivers/usb/usbip/vudc_rx.c
+++ b/drivers/usb/usbip/vudc_rx.c
@@ -91,6 +91,7 @@ static int v_recv_cmd_submit(struct vudc *udc,
 	int ret = 0;
 	struct urbp *urb_p;
 	u8 address;
+	unsigned int maxp = 0;
 	unsigned long flags;
 
 	urb_p = alloc_urbp();
@@ -115,17 +116,19 @@ static int v_recv_cmd_submit(struct vudc *udc,
 		goto free_urbp;
 	}
 	urb_p->type = urb_p->ep->type;
+	if (urb_p->type == USB_ENDPOINT_XFER_ISOC) {
+		maxp = usb_endpoint_maxp(urb_p->ep->desc);
+		maxp *= usb_endpoint_maxp_mult(urb_p->ep->desc);
+	}
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	urb_p->new = 1;
 	urb_p->seqnum = pdu->base.seqnum;
 
-	if (urb_p->ep->type == USB_ENDPOINT_XFER_ISOC) {
+	if (urb_p->type == USB_ENDPOINT_XFER_ISOC) {
 		/* validate packet size and number of packets */
-		unsigned int maxp, packets, bytes;
+		unsigned int packets, bytes;
 
-		maxp = usb_endpoint_maxp(urb_p->ep->desc);
-		maxp *= usb_endpoint_maxp_mult(urb_p->ep->desc);
 		bytes = pdu->u.cmd_submit.transfer_buffer_length;
 		packets = DIV_ROUND_UP(bytes, maxp);
 
@@ -139,7 +142,7 @@ static int v_recv_cmd_submit(struct vudc *udc,
 		}
 	}
 
-	ret = alloc_urb_from_cmd(&urb_p->urb, pdu, urb_p->ep->type);
+	ret = alloc_urb_from_cmd(&urb_p->urb, pdu, urb_p->type);
 	if (ret) {
 		usbip_event_add(&udc->ud, VUDC_EVENT_ERROR_MALLOC);
 		ret = -ENOMEM;
@@ -152,7 +155,7 @@ static int v_recv_cmd_submit(struct vudc *udc,
 	BUILD_BUG_ON_MSG(PIPE_BULK != 3, "PIPE_* doesn't range from 0 to 3");
 
 	urb_p->urb->pipe &= ~(PIPE_BULK << 30);
-	switch (urb_p->ep->type) {
+	switch (urb_p->type) {
 	case USB_ENDPOINT_XFER_BULK:
 		urb_p->urb->pipe |= (PIPE_BULK << 30);
 		break;
-- 
2.43.0

