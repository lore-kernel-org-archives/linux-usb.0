Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF0A33EB06
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558999; cv=none; b=je1kmr3Rdqvjh+B68a3wg6S1PsYQgZ+UKb/z+gmKGkudiNbT8mlhcLchdr3/KC5a9kFqcid3IXdm93wjBgZXTMCZDShUd50uW5PoFfpvKMIZ4/DbONxPR0aOxRf1Goq8DzCcSHNGNVtpWX4dDjH9rWf8FFyVx9rvXP86nGu4WKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558999; c=relaxed/simple;
	bh=NbpWUm/8Ha5j5FdKHYoZQmiLTlQA5/PG+iSU+2tLwNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJLVNY4tqiQgXdtuke85NKhBigsjTOoYDruVaGH8WRzsvatXwRI8Y5MB4yID1yycZubKaXRj//RbVoj3YB0XHN0MEvLt3tcMrjdqdanshrX3PpRo6yPgoTYN5jPT45OP/f0X6lqNqEXNFbbOWeFvQdXTO7eMWLNC4VmO1nF0nko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EM7pTNGN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EM7pTNGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791558997; x=1823094997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NbpWUm/8Ha5j5FdKHYoZQmiLTlQA5/PG+iSU+2tLwNI=;
  b=EM7pTNGNk9dy1gGE/6Si7dP93SLqP7embBlt8zZAA0/2MVeNjFfA2ZPP
   P22P+sYxA69cWvSIcj5u4x8ec/Udo6okPeHzOL9PbDp9ubrTpfiSd5icw
   GxOHg9zn6vGm0uS1EOfr+AHUipA8Eoh9PkqvNK8bg8a7tGCMFFpxiOYRI
   L0NAvU806c3vtZ82IYY9Zq2vZXYX6vU2Kl3A/ptmpIo2/IeFU1VEsJGzy
   DF0XyhHvIrWClaYo1hlT7HIdDB3BWxJ+ymm9PzRSWbMyPSMVRMTpxBllB
   JZC6N9O3BP3iSfa7RiJPpxzZopoJeAGuAlHTHWtZQn+HTHPy9iIuWXQ0U
   Q==;
X-CSE-ConnectionGUID: lB0YhO/sQ/mgqFbSfvdYQg==
X-CSE-MsgGUID: dU6luua/SB6Y5q3AploJWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="351660"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351660"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:36 -0700
X-CSE-ConnectionGUID: zRMExFbJSU61ot9WunXwTQ==
X-CSE-MsgGUID: 94u3Zg2kREiQcWU1N9cXEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="650029"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:35 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Pedro Fonseca <pedro@fonseca.com.pt>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 02/11] usb: xhci: Unlock for command abort polling
Date: Fri,  9 Oct 2026 18:16:15 +0300
Message-ID: <20261009151624.618967-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Pecio <michal.pecio@gmail.com>

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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ec278a9f9540..82dd93c2afdd 100644
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
2.43.0

