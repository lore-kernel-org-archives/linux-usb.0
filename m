Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFB13D6462
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477921; cv=none; b=A2StdAxAD8Ucc9FVq8cEg2fPidbqoj7QoH1PuYYq4RRZK6CykpFA+zywDGRBDYHGcYNF6Aipa8bkHUEXphNL5SLbtbX83pLw+8v9wovz7KW4vEjZUQugJXydlJ1nymXtYEv4VJYoZ6uu28xwAE7OkFj0q+n3RSxp7x9mB1uzLmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477921; c=relaxed/simple;
	bh=AaATnVZu69/69AKrXRqaEgNPtiTzQS9fBWm0K0wL5Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NEfdF55HsMck9akJOQZTqiff0DwyutKbCq8SC8Atdezwq+TSTy+JiacGPVumbQOLru+CXHJskLUQfJPq9K9D4VQNpqkFXYOX4iuULULw2E0W/j5Os/Le0FtMumndZF4t60jV5feFTp0+S7BwcJS9LAPjuQl347B2FAkvAWpc3kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNi2ECHn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNi2ECHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477920; x=1812013920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AaATnVZu69/69AKrXRqaEgNPtiTzQS9fBWm0K0wL5Dk=;
  b=ZNi2ECHnDwYz9gnNtmhYfIjpnQZtIzWQ13ZXGJdhMgsWCve3WK7YDZQq
   EFNhQRS9uUYiWGfQUW8EPsmEklqpMm3aBbuluBCkR15UYXPewZm/u2Cbq
   khQVljwCnxqxA5eZrlQLKMCAPPm8y8RiuBSCQHbNnBXQqGYATOGXMfTgh
   2ugHDTGes7T8HQnc8RbkKZeTK+T2Htf3gaYjYWI9FeSqRpL9ktUkDpid5
   z/3PTTRoTHVcCMa79mBwUZ3C0jjTTyWMmMrgHNSaENMDyh6i+/sXlW/U/
   sx3C60/w+luOpRkjxWJ9czUWY1EywN1CndD2lHSVRMkmLt/uzKWCkHA/e
   Q==;
X-CSE-ConnectionGUID: B25dQbb0ShKz4q18txaq2g==
X-CSE-MsgGUID: 7TKaI4AnQAeUlJw7bD4HxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657563"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657563"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:59 -0700
X-CSE-ConnectionGUID: dvYFZA8tSpqtyECW12QzDA==
X-CSE-MsgGUID: zj7eIaHhSYCYtdQgpc523w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281869"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:59 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 06/15] usb: xhci: Improve Soft Retries after short transfers
Date: Wed,  3 Jun 2026 12:11:23 +0300
Message-ID: <20260603091132.1110849-7-mathias.nyman@linux.intel.com>
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

From: Michal Pecio <michal.pecio@gmail.com>

A short transfer is a successful one, so reset the error count.
Otherwise, endpoints which always complete short are limited to
three retries per endpoint life rather than per URB.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-ring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a5342d49a65b..608b6f3ec9f6 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2516,6 +2516,7 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->status = 0;
 		break;
 	case COMP_SHORT_PACKET:
+		ep->err_count = 0;
 		td->status = 0;
 		break;
 	case COMP_STOPPED_SHORT_PACKET:
-- 
2.43.0

