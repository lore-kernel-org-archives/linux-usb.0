Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F3D43CECA
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477929; cv=none; b=u95iwwMNqCRzqpKP+D8vhOa5TnyUwwOYB+lPcc9cWG/Ut4JCmmAusKL2ZaHM9jvHKt1NVnOA/WvDk5yioHI/HV71flxPj8Kf1ffb3KbK9wKWU9FbwYOGhgC+s5hzp5MNR2xlxAQTbFqarV9RJDtwFjEVPDITe24oZQdZDY5BBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477929; c=relaxed/simple;
	bh=zqnWoGSzNA1RFE9HTsjBEBAXRw7mQKmlQRGkcqfgzDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSPufmSHmJurQoitgycPNH3qV48B6HSwIEPEiOi5u719+TnsuQ2Bz7jtzkGqsgBYcu74VqV1zaJNbTaCMrikeOvEmZigDBef2jGpkmjGa7Qoxhz40pUuy+zhpikRQl+R5scAM63HFybxQs7zqn6rD6FZVi0HepJDBDTdunNsoBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DvebKgIG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DvebKgIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477928; x=1812013928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zqnWoGSzNA1RFE9HTsjBEBAXRw7mQKmlQRGkcqfgzDI=;
  b=DvebKgIGhmNvPh3q/MPCF+oYsXn5X7xkEKMy08iXgXtVqb+0Kb2kv3VZ
   +PhDF7oT0MgyfS8cxzraU9ZJUCodGhHzQylNDHG/+2Okmx+15OrJHqv1G
   HWWV+nsnltannt9vc7SfFgTHI8+Ti7ZtnpF1Qo+eEnkK6bX4JO1yU3N47
   /BvnS7Ty/StIIKzT0rrZeAAeuCute9AiCGdhhWa3vV3YgwrXT9s067O3f
   NxrzXx34p1Tng8glKwJcCg01z+5SP2aXxmFjPRzU7AtDfUCDCQ0PqmrtH
   9rj2d3rt4yZ3f75HS2XCtiIvzWodO0/fNT/vGv/p8XVC16Q/IMXbb5dU0
   w==;
X-CSE-ConnectionGUID: 0mfZscUtQnqUUf3UiCqMhA==
X-CSE-MsgGUID: UsoGoHdiRSG0IlB6J60WkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657605"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:08 -0700
X-CSE-ConnectionGUID: d0t9xV9fSwK64uLOHx7Uvw==
X-CSE-MsgGUID: YWiu5fIqRVaMbBwQaVTmQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244282004"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:07 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 12/15] xhci: Prevent queuing new commands if xhci is inaccessible
Date: Wed,  3 Jun 2026 12:11:29 +0300
Message-ID: <20260603091132.1110849-13-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
References: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refuse to queue a new command on the command ring if xHC is marked
inaccessible with the HCD_FLAG_HW_ACCESSIBLE.

HCD_FLAG_HW_ACCESSIBLE is set and cleared in suspend and resume.

Also print a warning if xhci is being suspended with commands
still pending on the command ring.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 6 ++++++
 drivers/usb/host/xhci.c      | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 608b6f3ec9f6..83209db29962 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -4332,6 +4332,7 @@ static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			 u32 field3, u32 field4, bool command_must_succeed)
 {
 	int reserved_trbs = xhci->cmd_ring_reserved_trbs;
+	struct usb_hcd *hcd = xhci_to_hcd(xhci);
 	int ret;
 
 	if ((xhci->xhc_state & XHCI_STATE_DYING) ||
@@ -4341,6 +4342,11 @@ static int queue_command(struct xhci_hcd *xhci, struct xhci_command *cmd,
 		return -ESHUTDOWN;
 	}
 
+	if (!HCD_HW_ACCESSIBLE(hcd)) {
+		xhci_warn(xhci, "Can't queue command, xHC not accessible\n");
+		return -ESHUTDOWN;
+	}
+
 	if (!command_must_succeed)
 		reserved_trbs++;
 
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0bf0446b4c87..0646fedf2042 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -992,6 +992,10 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 	/* step 1: stop endpoint */
 	/* skipped assuming that port suspend has done */
 
+	/* Check if command ring is empty */
+	if (!list_empty(&xhci->cmd_list))
+		xhci_warn(xhci, "Suspending and stopping xHC with pending command!\n");
+
 	/* step 2: clear Run/Stop bit */
 	command = readl(&xhci->op_regs->command);
 	command &= ~CMD_RUN;
-- 
2.43.0

