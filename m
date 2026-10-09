Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFA5468C33
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539937; cv=none; b=iMkzOQMgPK91Dv/NQZ9jmk7zlREtBbEoXBECq1WQ5emAUmaHcCyfdCUFHLrMDWsN5CUxb329zwEr5+ON1p8OazeMuPr7UfHZtsW4aaQkPtc5sAO4sAkA0hzZ9c3MnQOFlfMYbHRZEF72fMGWbNhx9RZzjrY3yO/nibBp7+gP2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539937; c=relaxed/simple;
	bh=m1Q9j2wYbdrbST4nFR6wsD5TxMtDGBFTX0oA5olbTtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kowXfRAwb/LS9lubtPRyOJRCB/CbKwSvLKS7YHhWOKOawulsRDkf2migHHpgtF6dOOU/EB0V+mICIfN0Qkb0MZrrzaTcZ/7IzK6viYReTSsqkcMmhtCm2tNKKEOFsltArEoLWN+j/XzOSopTktz5vtKgtjnLGXWvQ8qVrhJ/aNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7UIAuk4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7UIAuk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539936; x=1823075936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m1Q9j2wYbdrbST4nFR6wsD5TxMtDGBFTX0oA5olbTtE=;
  b=Z7UIAuk4rl1clP0oslSLao7tz6XENsAd51FZYtUgA0dfd1PwVVF5zB3J
   lVACLqz9oCnrBGxjC4cMVbJsUalDfGrHwsGtFtlG0pR2CeINJF50QwIwu
   rrhW9tOxmMfVNJ4WVtwW09TRXbmUnlV+tlce+WjZN2iN/kjwQGRXrctrW
   YdSVI28E1lA67qzfbPzHiWLtV3s+tAfzByMl5LPerjNbouadapYH1cHiT
   n1fKtUUKsqxULNBIw1U4+0l4Fwwq0zRsUfIXf5pcwrREQXdzUHobr5InN
   SQxo5+1zOtrbmAkdAAVbGH0w79dANxs31Z68SQjVixhMh64xNPW9We5Yx
   g==;
X-CSE-ConnectionGUID: nS0FX0eKSaeE9OFo6IxnHQ==
X-CSE-MsgGUID: hlmzP9BJQ8ehUt3RrrKmIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224097"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224097"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:58:55 -0700
X-CSE-ConnectionGUID: 06EvL8BcT2KlPc5TNuFOhg==
X-CSE-MsgGUID: xqFRhtcWQLalKlFKLjfHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613312"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:58:54 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Henry Tseng <henrytseng@qnap.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/14] usb: xhci: return an error if the host is not halted
Date: Fri,  9 Oct 2026 12:58:22 +0300
Message-ID: <20261009095834.561578-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
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

