Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931F642A165
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635075; cv=none; b=DmZLdlQ3dp2UUhmTbG+u5waYtJlxHvvb+HQrRFO3A+IW7wLx92OtRvewiyx1O1whRPVej//Xm34llbjbIrDo8SCEbK3elIMq/TAmJPK2526qzMRZw3TyoQoo6oSrUFGD+KBPYSKTayI2Cf8qwyUUGlekkiiAs6XISs9toFpfrDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635075; c=relaxed/simple;
	bh=ROC8ybcWcj42dMVfYYv3KLVqq6pKjiimEWw+isie3LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FykqMjXm796E4kfdD7i8tvWZ7JTrPPVpzgxHqkmJ7aahnHnO0E7NCRe3vBuQwQwOHAHHt1RbBtVBVG+8wPPnh8JWxk3PSDo+D65OpahHeFPdir2SGAhZ5ljFWXcr1C9+MFkPov1Q2ItUEiSRERSuw0f+xXtz3+izEm+p4Edv58Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jhAaLocB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jhAaLocB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789635072; x=1821171072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ROC8ybcWcj42dMVfYYv3KLVqq6pKjiimEWw+isie3LM=;
  b=jhAaLocBY4h8453u/8ODzrDCvzN9FmNMxV5kiHKwz65BdygaAzrGPEHT
   Lbw55nf34eaofJ7jdeUWrsnDIcfecq2+buXkpR9jNVOzvH322RpfVJm8V
   gM8iTy5WQ9qJ7nIh/8qF0WFhovMFFxy7+qKeZb3xDvv0k0/YFMOvzTMRu
   C+0dC3r69/VzRnqjqqOc9MyMRSGeztrO4HP5KFD/kkaGNlso4UEFtA6Kh
   TpkUPBBPZTnfxD5Cy8LioeAJ2Thf0uSh1PIP/Ret+jFdI+Mfi9c/qxIq/
   XNAm948AQ+eJwu+ldnogyoj/yqsXPBRS6lXxZQ34nKr99riKpUumVBJjV
   Q==;
X-CSE-ConnectionGUID: 2pYsbrgLTDi3DVn4876agg==
X-CSE-MsgGUID: HN2MT85SR1WPfO6E4ETTsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90052604"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90052604"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:51:09 -0700
X-CSE-ConnectionGUID: bUm5lABQTN6OAEmf1uHAJw==
X-CSE-MsgGUID: kBhqvCtsScqpPgCv5C2DiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270369677"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2026 01:51:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1C1B79E; Thu, 17 Sep 2026 10:51:07 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Anurag <anurag@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/5] thunderbolt: Define number of dwords for hardware margining results
Date: Thu, 17 Sep 2026 10:51:04 +0200
Message-ID: <20260917085107.1022445-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260917085107.1022445-1-mika.westerberg@linux.intel.com>
References: <20260917085107.1022445-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rene Sapiens <rene.sapiens@linux.intel.com>

Use a defined size for hardware margining results in preparation for the
software margining extended error counters which requires a larger buffer
size.

Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Co-developed-by: Anurag <anurag@intel.com>
Signed-off-by: Anurag <anurag@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 730916f62d39..ea80354c410a 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -37,6 +37,8 @@
 
 #define COUNTER_SET_LEN		3
 
+#define HW_MARGINING_DWORDS		3
+
 /*
  * USB4 spec doesn't specify dwell range, the range of 100 ms to 500 ms
  * probed to give good results.
@@ -1307,7 +1309,7 @@ static int margining_run_write(void *data, u64 val)
 			    margining->lanes);
 
 		ret = usb4_port_hw_margin(port, margining->target, margining->index, &params,
-					  margining->results, ARRAY_SIZE(margining->results));
+					  margining->results, HW_MARGINING_DWORDS);
 	}
 
 	if (down_sw)
@@ -1429,7 +1431,7 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 	seq_printf(s, "0x%08x\n", margining->results[0]);
 	/* Only the hardware margining has two result dwords */
 	if (!margining->software) {
-		for (int i = 1; i < ARRAY_SIZE(margining->results); i++)
+		for (int i = 1; i < HW_MARGINING_DWORDS; i++)
 			seq_printf(s, "0x%08x\n", margining->results[i]);
 
 		if (margining->lanes == USB4_MARGINING_LANE_ALL) {
-- 
2.50.1

