Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AED37B01A
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 02:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.147.23.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318754; cv=none; b=vASLGKRR/SIDjbx4W7fCVfy37/9gwBkxwkYgTInIHCbg3j+/4y0DwCHV4otLVp4rfGsKdzI8OIJge2YvsJC39PEjzYuXzmY5X+A0Qt3hxIE6buxe9lSz0fO4xPFqb6Mne3nF1c/LjcIlFsmti1pp8vdkLnUythWiz4WuSwQMjsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318754; c=relaxed/simple;
	bh=+DOTZt+pI31A1817AaaCzPVN5MLv6LUuwxHGo3nAfgA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y0cjFX4gZGhDHAofaj3lPgpdglVtuRB2REPvdqvlYNFE59YiFkfH/MZQTL4ZIshZnCvbj1RYWDdm01NDn8LcCCqbDuPcmFE9QZ22Ef7yMpJL4nc0KyF6RnLoRb1d3W+iqORX4MtNGnhPNfUlAFg9ymvHA8qUS6V0Y4Upvq2iNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com; spf=pass smtp.mailfrom=lge.com; arc=none smtp.client-ip=156.147.23.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lge.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lge.com
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 24 Mar 2026 10:49:10 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: juno.choi@lge.com
Received: from unknown (HELO solarsun-desktop..) (10.157.93.226)
	by 156.147.1.125 with ESMTP; 24 Mar 2026 10:49:10 +0900
X-Original-SENDERIP: 10.157.93.226
X-Original-MAILFROM: juno.choi@lge.com
From: "juno.choi" <juno.choi@lge.com>
To: hminas@synopsys.com,
	gregkh@linuxfoundation.org
Cc: m.grzeschik@pengutronix.de,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juno Choi <juno.choi@lge.com>,
	stable@kernel.org
Subject: [PATCH] usb: dwc2: gadget: Fix spin_lock/unlock mismatch in dwc2_hsotg_udc_stop()
Date: Tue, 24 Mar 2026 10:49:10 +0900
Message-Id: <20260324014910.2798425-1-juno.choi@lge.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Juno Choi <juno.choi@lge.com>

dwc2_gadget_exit_clock_gating() internally calls call_gadget() macro,
which expects hsotg->lock to be held since it does spin_unlock/spin_lock
around the gadget driver callback invocation.

However, dwc2_hsotg_udc_stop() calls dwc2_gadget_exit_clock_gating()
without holding the lock. This leads to:
 - spin_unlock on a lock that is not held (undefined behavior)
 - The lock remaining held after dwc2_gadget_exit_clock_gating() returns,
   causing a deadlock when spin_lock_irqsave() is called later in the
   same function.

Fix this by acquiring hsotg->lock before calling
dwc2_gadget_exit_clock_gating() and releasing it afterwards, which
satisfies the locking requirement of the call_gadget() macro.

Fixes: af076a41f8a2 ("usb: dwc2: also exit clock_gating when stopping udc while suspended")
Cc: stable@kernel.org
Signed-off-by: Juno Choi <juno.choi@lge.com>
---
 drivers/usb/dwc2/gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 834fc02610a2..e88683b1268f 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4607,7 +4607,9 @@ static int dwc2_hsotg_udc_stop(struct usb_gadget *gadget)
 	/* Exit clock gating when driver is stopped. */
 	if (hsotg->params.power_down == DWC2_POWER_DOWN_PARAM_NONE &&
 	    hsotg->bus_suspended && !hsotg->params.no_clock_gating) {
+		spin_lock_irqsave(&hsotg->lock, flags);
 		dwc2_gadget_exit_clock_gating(hsotg, 0);
+		spin_unlock_irqrestore(&hsotg->lock, flags);
 	}
 
 	/* all endpoints should be shutdown */
-- 
2.34.1

