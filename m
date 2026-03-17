Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639E3E9299
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759373; cv=none; b=G4QLGgw0GyYFqrUHENdPbEPe+/WgIL+5UQEH4JkR1l087AoB+X/hBAQxpggNd5H4oYcroLta/7qpXMFd2v9wi0O9qh2nTxrhTC0eiimIKdYS9pwznRMWvMNdJ6RDefBoBZ3qktbvMSvNW4dB1zjwzd0pOBe8prPrYpNtKPKjFuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759373; c=relaxed/simple;
	bh=kIJt4YzuW7XIks3CsJPfsyQxlBby7/h/9BCwpmXEywA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUBcw+BtXUDU1n/zxoWnXW1Lxd1DuFdM1J8ZT3t0A6OcebQNSTc3Pgc3Lr1XKn6/9USZ1oXJCiVl+VHpA4YdcoXPyQMcV/n1sWmkAdAUeIL8FPLCN5imWXEnS90uUm/dsbKvN+GiWKWcHU8qLZ2wWEM22/7PQU6Ho4+lwNYcIkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0U1LewA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0U1LewA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773759372; x=1805295372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kIJt4YzuW7XIks3CsJPfsyQxlBby7/h/9BCwpmXEywA=;
  b=I0U1LewANQ2ZgpsSOTInI3flKh0bE1YWTcO3c3RZYzExLylObbU6oda1
   McSuzruNyxwX7xgSpNLZ7/sTq4SCFXjyy08DsH27mSYl4CQ8FFmX0MxVg
   7u0kvaF6L5TDyTK/m4Jxo6lcHP6u25GH+Apo3i3oj7RqDHM56qbomSKU8
   31DOzW3JYyi9OvDZxPVITHnIwDNYv6xcoc8Z2cvvmrlyzx2K1Rmtths03
   F4WJG5gmXyAEv95HKbtPM1S/hjnG3LBQONM5HaI5foj+SQDrqSCjmoWjS
   Wb/c4WiAmReOQZkpBIsBxCrOQ/pgJxZl30T/BzG7lqKSFpidTkhhayjnN
   g==;
X-CSE-ConnectionGUID: cD6JhtKjQByTQMQ8+k8fjw==
X-CSE-MsgGUID: ShIUnBlqQpexttyIvnw3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85491168"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85491168"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 07:56:11 -0700
X-CSE-ConnectionGUID: CI8fmYlART+cZ8Ypn+S/zQ==
X-CSE-MsgGUID: gP2U95qDSLWgRu9zvUYJSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="245312679"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 07:56:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 274F89B; Tue, 17 Mar 2026 15:56:09 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [RFC PATCH v2 2/9] usb: xhci: relocate Restore/Controller error check
Date: Tue, 17 Mar 2026 15:55:37 +0100
Message-ID: <20260317145544.2076387-3-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317145544.2076387-1-niklas.neronin@linux.intel.com>
References: <20260317145544.2076387-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Restore Error or Host Controller Error indicates that the host controller
failed to resume after suspend. In such cases, the xhci driver is fully
re-initialized, similar to a post-hibernation scenario.

The existing error check is only relevant when 'power_lost' is false.
If 'power_lost' is true, a Restore or Controller error has no effect:
no warning is printed and the 'power_lost' state remains unchanged.

Move the entire error check into the if '!power_lost' condition
to make this dependency explicit and simplify the resume logic.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 810905b824d3..a04b1365bb6a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1140,16 +1140,13 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
 			spin_unlock_irq(&xhci->lock);
 			return -ETIMEDOUT;
 		}
-	}
 
-	temp = readl(&xhci->op_regs->status);
-
-	/* re-initialize the HC on Restore Error, or Host Controller Error */
-	if ((temp & (STS_SRE | STS_HCE)) &&
-	    !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
-		if (!power_lost)
+		/* re-initialize the HC on Restore Error, or Host Controller Error */
+		temp = readl(&xhci->op_regs->status);
+		if ((temp & (STS_SRE | STS_HCE)) && !(xhci->xhc_state & XHCI_STATE_REMOVING)) {
 			xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n", temp);
-		power_lost = true;
+			power_lost = true;
+		}
 	}
 
 	if (power_lost) {
-- 
2.50.1

