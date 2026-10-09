Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C5C3546DF
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558999; cv=none; b=Lr6PcCj2GSkn8VU4pBmfpdxHO2SIFJZdvXCD0qhqBNaIrJzzQyTk9dlFSH20n8/zUrSsqSJCcq4bURT/Oq1nUppMOhuAPsrCSPMRDcAboAJMht4oYZTsLbKZbhZjOKFoqGjcJ7UflcZI/WMHpErJBt4U45xHy9dSPaI88Ge5YqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558999; c=relaxed/simple;
	bh=m1Q9j2wYbdrbST4nFR6wsD5TxMtDGBFTX0oA5olbTtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ady5X1CUoaIAsUuYTitJ9x5nCbkUBNPEF5DLAaQU4odNh60NEkeyFYwU6oEwLSEuyUrx5Y9C4BlI7T8beV7gl9nT6xlLhqmBYsquSMMp8mslagP2f3bNetLnqKXmXdwu5RkYCsC7rNciSP2my2gFhzEBJ3Y224cKyMfiK2h+wbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipluKXRy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipluKXRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791558996; x=1823094996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m1Q9j2wYbdrbST4nFR6wsD5TxMtDGBFTX0oA5olbTtE=;
  b=ipluKXRylOuKiEpd8xw2Gt4I+AU0jljvpIcsVN/ZAnp/wsOB9iLRqPLe
   US4yvsBRv9K42V4xBicFHtvsoCnLYgYGEvYbEJPCK7x1LBQ4p2+CErNs/
   wYU/2/aYXABSf99fAnwuYbQWUvP7JA+nd6uEMJ8kqG6RQzQFYIE3f6cqk
   LY3lB9JCdmzyiRhD5wDoEDYIggwNk2HAVmf7JzrQcSYHLHRUGqQ6J10kJ
   uATOI8gchvc720zlFkHZMNUOeSCofJXdeAZYuFJfPhpDrqCr5wDcqjGpm
   9zyT2H+1PR2AS27Wkwvg0yc/5JtdelS0V6MVD6hGDUQMpMmrOqlAnmOgS
   Q==;
X-CSE-ConnectionGUID: kwSpQmAETiyx1F17tstpbQ==
X-CSE-MsgGUID: KUNSxe9xTdqZm3c2HPTPeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="351656"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351656"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:35 -0700
X-CSE-ConnectionGUID: u1G/nP35SEu6a523NpOxmQ==
X-CSE-MsgGUID: dS+7z4o+RFaP6LkdzDIg7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="650025"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:34 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Henry Tseng <henrytseng@qnap.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 01/11] usb: xhci: return an error if the host is not halted
Date: Fri,  9 Oct 2026 18:16:14 +0300
Message-ID: <20261009151624.618967-2-mathias.nyman@linux.intel.com>
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

From: Henry Tseng <henrytseng@qnap.com>

xhci_reset() returns 0 when the host is not halted, without ever writing
CMD_RESET. Every other path that fails to reset the host returns an
error, so callers that check the return value are told the reset
succeeded on the one path where it did not happen.

Return -EBUSY when the reset is aborted because the host is not halted.

Signed-off-by: Henry Tseng <henrytseng@qnap.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a9e47e178c28..2af6a7b91e55 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -195,7 +195,7 @@ int xhci_reset(struct xhci_hcd *xhci, u64 timeout_us)
 
 	if ((state & STS_HALT) == 0) {
 		xhci_warn(xhci, "Host controller not halted, aborting reset.\n");
-		return 0;
+		return -EBUSY;
 	}
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "// Reset the HC");
-- 
2.43.0

