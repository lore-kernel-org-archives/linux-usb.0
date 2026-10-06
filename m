Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DD048F836
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 15:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300287; cv=none; b=Mlh5TjTZjfMIR59vESFOkCCHQ5/AoiUGN5N92GFWkOfjwaBlAX7Rf42cBX7olnv4QljBSPZ7N46/XjQ+iERi0hcfvyfXorH+qJmSZql4CcYG4cVLh3nUpESl8DQFZEqMCCYCE0oc0hq1xsJnqnm/vxerT2gMxk+yd4ycM7HwFX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300287; c=relaxed/simple;
	bh=FIdWHUm/n7tbBfP2ZvPsG4ksTrQBaJ21CumWP6LqZKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePSwxVBAFE+v6g9IGkcJiUa4ffXJ5Yh4Kq4y5LnXDZViWITi4gjDJsECS7qNJWtlUaHpS9DinyWiOSctsklhkyrLuabWP7rL6HKM3rgQRAcSqg+3qgBqDyti9us1mMG7dvQZGwSqcyEnMr4P7LoqTTIQaTYc0n5iJ/bl/zm6jd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYIU56g4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYIU56g4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791300287; x=1822836287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FIdWHUm/n7tbBfP2ZvPsG4ksTrQBaJ21CumWP6LqZKs=;
  b=kYIU56g4ql0kq4NgwTaIUOGXJH2G0AnfSqeCt2/r+vuW9jZQVrNl0Vnz
   feS9YMj/wRcQYjJtVLyEi1m2jRxTRYPZwYnulUYkYt8sIp8NKqNH7uNbp
   UmPXQ1cChMkgIwTrkSoFYbT81H9aLMfI+JWe0hnKVGwkcC0/2BJoZRJQC
   M8UutGzC82L0SkInJY9Z5FTMsVNJd5ebXKp2oesoQYH22mWydKZY4cqaa
   VGwCHPjO/ypJTKrtaj+J4yipQrGUtOgjme+JsaAR9mqmJlwL3PQlo9VQS
   2e+GmwGk6vlD5QLC9EjqLgT1+wzHP/BlO11KdETh6qMje3J3n+XYSimXW
   A==;
X-CSE-ConnectionGUID: yfw84wjNR/+JGf1hwMjmIg==
X-CSE-MsgGUID: 0Z+zWf6mQlirnG1ej/cz2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="32777"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="32777"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 08:24:47 -0700
X-CSE-ConnectionGUID: 8M6JPRDHRVCM6owRDwqCDw==
X-CSE-MsgGUID: eQ5cfxDKTumQFlPYYU4q6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303454866"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 06 Oct 2026 08:24:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id DF5E89E; Tue, 06 Oct 2026 17:24:43 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 4/5] usb: xhci: correct variable size conversion
Date: Tue,  6 Oct 2026 17:24:26 +0200
Message-ID: <20261006152427.3735383-5-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variable 'ctx->tt_info' is defined as a le32 within the 'xhci_slot_ctx'
structure. Correct the conversion by using le32_to_cpu(), ensuring
proper handling of the 32-bit 'tt_info' variable.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 724cba2dbb78..f88f320811a3 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -392,7 +392,7 @@ DECLARE_EVENT_CLASS(xhci_log_slot_ctx,
 	TP_fast_assign(
 		__entry->info = le32_to_cpu(ctx->dev_info);
 		__entry->info2 = le32_to_cpu(ctx->dev_info2);
-		__entry->tt_info = le64_to_cpu(ctx->tt_info);
+		__entry->tt_info = le32_to_cpu(ctx->tt_info);
 		__entry->state = le32_to_cpu(ctx->dev_state);
 	),
 	TP_printk("%s", xhci_decode_slot_context(__get_buf(XHCI_MSG_MAX),
-- 
2.50.1

