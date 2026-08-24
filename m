Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3F33A6B85
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 07:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558399; cv=none; b=R05Ao69T3A4AfcFNmVTvlvCzAf5E9OGcq2Y2td9ibfp52iGY13yx3WVL1L/3+++aK/cPLOt9sYNBhdfy5tOuV8ycnEO0eUW+tslRBMpfwd0NDOSxT7kPJPsKcyDNi+rt571aqkCNerAdGNXI5cS+dpKLH09+7RNcEuqHlgiigcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558399; c=relaxed/simple;
	bh=+aUQRaCJEiOlOXPCqhnqzr2GzBTvKrS5uoneUccI4pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uTkh2yFgyb+VKkv7gYUQ3gmzk1XmLL/2NpQct1lPcE/flqZi0N4LTCx/NxvY22MvycNCzkbzQWInxbyFVSc5kIthfMh8t4m9JWMBrvvcdhUM0Q6BwKO7MwETgOtFVxGRPuM+Aatsm3SLA0D7PgofzStpPnS2dM7Hpc53g48z4DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AulkzfBx; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AulkzfBx"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso474174666b.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558389; x=1788163189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WttKNsbulNL5/elFBjAMNMa3KXVDrXB8+BjVRa3s9Y4=;
        b=AulkzfBx7W3CRKwgjgfhSTAqtZOVxbWsgTisYfefgHo12nPOuGQfk0e3xOcgDYRlVM
         HyBgGGR8SmRd5npnByxerOiACw25aGR06upTFR36TYXE0FArId8+Ld54zWeqeWTbSjkV
         3snNezq6+pj9qQNjl/n6UgIIIUFacPVUH1Uge6gz+z/KNyOSiE68bYccfzwlhr3QVtMq
         nLMMPmfeXiZhdRYAKIxhVtzQJLlePE28bMRBC4OcV2uCaZ5RmNJii2HTLSQxrHWttkqZ
         U/ipenfVxtqZtCNvqQJUJp5qur1jxAMqCDJdeogfVWtwl97F0Dh3tl13Izhad18bD4iQ
         iZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558389; x=1788163189;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WttKNsbulNL5/elFBjAMNMa3KXVDrXB8+BjVRa3s9Y4=;
        b=hzeAI1RcjKgvvTQjidQeEC4U+Hb79zrV/1wLGYRERzaLO/gD9hHlVYRPsy5EuH0ZZE
         rnynNS5sAag+TOvPKUwNYl4zZYlEtYTCkWx67IF5AYRVnh7PEbDwA63lp48iqfGgQiyP
         LLlJldAjmMFVFpFtB7KB8KBmZRgmk1f5QNRnwaPB6gHRcbQYD8Ns1oXk16DAylpWDVnH
         6+6+2wR941Fg/Jp9Hs6SSfm1jxjiYNc+YRK904TEXYV3Not4KX5LGxMz2PN0Rt2ATYun
         xQbaNnZDASVN2fjkoYH69A+e5XpzX6TZ+AUSaTKsjrVwqn5yPx4j6WUfKU8N2lXFlx1j
         JNRw==
X-Gm-Message-State: AFuF++kd6E7U5CZD6miuUB0/mS/bq7rS0StFYZTtf+kPCnPUeyBEVjgU
	DZbJFjIBaCOZBKI+cmsgFCPw0M7wsC+35SOUGfPMHd5hgc9Ugn4kGsz3ml/LjQ==
X-Gm-Gg: AR+sD11UNnGoYhXc2rcQvIHKs7OPehehuf4Ojg+FGZM1OUpIudP56098zsz7Jr9omRa
	epmObT4Sgux0i4EYuZxpQgEbjisjLDBhQ9P4MHmdE3mjr0XaFrvzw3fmmdBfE4an0SeAOJQlpBk
	kL/BPvocXnzAJB8RrN3JP+GiixHildsIigqbgj7RZKPXX/H5S6gi3ArGtz/s5sH0x2dlRdFZpgn
	lvjDZ0L60yrJdLxXqDulyZQEVycdDapoqRdcq2ZecvQohD6YVSIEuyAW6x41wvLsEeDrOfQr67C
	mshD/TOPY3l4PFrnvg1LFcIG7YTL23GVXxIlff6A43XqHWe0Cp+/r4rGOUzkGf8FSFHeDMU/bSC
	wHAd5yHR7otfnlBOKMdW+SWl7jhSJ3QEv5c07Rqf4FLEOQMoQFbxC8z5f6nl3KrBfKq72FlKPZu
	KgiL8EzgQaYhLwuwCqA9/Q2ZzuXN3ZdLPoFsFquTgbab5gCBZokYPygwOPAh6nyINukJg=
X-Received: by 2002:a17:907:8b8a:b0:c05:b9db:68cc with SMTP id a640c23a62f3a-c2469f7b668mr2755707566b.0.1787558388709;
        Mon, 24 Aug 2026 00:59:48 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629a901sm1262228266b.25.2026.08.24.00.59.47
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 24 Aug 2026 00:59:48 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:59:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Pedro Fonseca <pedro@fonseca.com.pt>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Unlock for command abort polling
Message-ID: <20260824095944.1c8335fa.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xhci_abort_cmd_ring() requests abort, waits for the CRR bit to clear,
drops xhci->lock and waits for the Command Ring Stopped event.

The CRR wait timeout is 5 seconds as suggested by xHCI 4.6.1.2, which
means that if the xHC fails to complete the operation at all, we poll
with the lock held and IRQs disabled for several seconds. If any other
CPU tries to acquire the lock, it will spin likewise. IRQs get delays,
drivers log errors, tasks freeze, it's a mess.

So drop the lock earlier, before waiting for the CRR bit. It should be
safe - the sole caller sets cmd_ring_state to CMD_RING_STATE_ABORTED
before calling us, which will prevent others from ringing the command
doorbell and interfering with the abort. Queuing new commands during
this time poses no danger, and if the command we try to abort actually
completes concurrently, existing code already needs to deal with this.
And in my testing it does - it's trivial to trigger this on ASM1042,
where Address Device can't be aborted, but it completes as soon as the
offending device is unplugged, including during abort attempt.

Note that the lock still covers reinit_completion(), so it won't race
with complete() being called by the event handler. And works are not
reentrant, so another timeout can't expire while the lock is dropped.
We will configure timeout anew when restarting the ring.

One other difference is that now we also drop the lock if abort fails.
This too should be harmless. Commands queued during this time will be
released like any other pending commands. If the aborted command does
complete before we regain the lock, it's a waste, but not regression.

Reported-by: Pedro Fonseca <pedro@fonseca.com.pt>
Link: https://lore.kernel.org/linux-usb/16f65081-5a3c-4c30-9811-9017796a3373@fonseca.com.pt/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

This has been annoying me and various others for years, only the latest
incident is listed above.

I expected a nightmare of race conditions, but after finally taking a
serious look I think it really is quite simple. It helps that the lock
was already being dropped and existing code seems to handle it fine.

 drivers/usb/host/xhci-ring.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 8b0c27d6f12d..44a0f89110a1 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -494,7 +494,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	struct xhci_segment *new_seg	= xhci->cmd_ring->deq_seg;
 	union xhci_trb *new_deq		= xhci->cmd_ring->dequeue;
 	u64 crcr;
-	int ret;
+	int ret, completed;
 
 	xhci_dbg(xhci, "Abort command ring\n");
 
@@ -521,25 +521,27 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
 	 * and try to recover a -ETIMEDOUT with a host controller reset.
 	 */
+	spin_unlock_irqrestore(&xhci->lock, flags);
 	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
 			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
-	if (ret < 0) {
-		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
-		xhci_halt(xhci);
-		xhci_hc_died(xhci);
-		return ret;
-	}
 	/*
 	 * Writing the CMD_RING_ABORT bit should cause a cmd completion event,
 	 * however on some host hw the CMD_RING_RUNNING bit is correctly cleared
 	 * but the completion event in never sent. Wait 2 secs (arbitrary
 	 * number) to handle those cases after negation of CMD_RING_RUNNING.
 	 */
-	spin_unlock_irqrestore(&xhci->lock, flags);
-	ret = wait_for_completion_timeout(&xhci->cmd_ring_stop_completion,
+	if (ret >= 0)
+		completed = wait_for_completion_timeout(&xhci->cmd_ring_stop_completion,
 					  msecs_to_jiffies(2000));
 	spin_lock_irqsave(&xhci->lock, flags);
-	if (!ret) {
+
+	if (ret < 0) {
+		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
+		xhci_halt(xhci);
+		xhci_hc_died(xhci);
+		return ret;
+	}
+	if (!completed) {
 		xhci_dbg(xhci, "No stop event for abort, ring start fail?\n");
 		xhci_cleanup_command_queue(xhci);
 	} else {
-- 
2.48.1
