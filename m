Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C274486BA9
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635080; cv=none; b=O1KTuZwm0jBQyHYWh1VGmEHMuURFq/Y8YRuQWo/quBh5RZrNRLTy3vH5Ecs2lvJFB9QI3sc/nrgPNtVWPqtxkhX8zklRVhKsBHqozgdUv7Hg/9flb9q9iEHMTIRIKGTVkRqaB3BZ9mSCTZVr96b2CrUIOXMdu+Y00Wlo4478z9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635080; c=relaxed/simple;
	bh=vJX337qFbK8niuIgjY5whVJ4FPJ+EQ8BTRoqWDl32g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ItcWNJY2OM7d+TanRWvLEsBreK7at8YqtqkcHI2JBkr2TnAdmDIb6r9tsl0grgmwBHdr0HaRk02e6llx3yHDJrtMTM94m7qrLg0bV8hoXwJCJtXcdcbxaIcSBP/TArQtxN8XqUvObIXo481gTn3Mue7IrVf/zz9/hnZ3rIJAP5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYt+RKPu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYt+RKPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789635076; x=1821171076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vJX337qFbK8niuIgjY5whVJ4FPJ+EQ8BTRoqWDl32g8=;
  b=bYt+RKPuKmWWh2Yw9vDqXgb2CSki3958jQEaWEbFFlhHX0yEWlm3/sNL
   3RVvd4984V0EffLO5orfypoHqtcrCLiMyla8Vx/LZv4aMCjTObeQBc9FS
   IvynYChDpLrKrRjSUt4x+HYhpDnvqEwwI1XsLF6tlwM6h+64J5MNe12gi
   ugIg+hwig0EnzgJyC72p27j9o7o9SEmSmSYE8uVCrT/SqrI8T8ix76+Pa
   f3E+DqL+mdFTUr2BkdGAS5w/QSDhd3O99TFfgnpX4n0r4mL+M0B6wqCIi
   zNJ50jut4ivqCKSL2WKtVv2/RGSOMKkTrn9Mjdzix+i8oe2+PARAV0yMJ
   w==;
X-CSE-ConnectionGUID: gJwFbUzJR+G2dcXuJK7bpQ==
X-CSE-MsgGUID: MI2b6FFpSIqKv0XgnKFsCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90052614"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90052614"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:51:12 -0700
X-CSE-ConnectionGUID: zCUXXPSwTm+O+E5IyAtBQA==
X-CSE-MsgGUID: GdBz/yqKROWAn0y7mqDdMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270369693"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2026 01:51:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 25B5DA4; Thu, 17 Sep 2026 10:51:07 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Anurag <anurag@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/5] thunderbolt: Extract per-lane extended error counters in software margining
Date: Thu, 17 Sep 2026 10:51:07 +0200
Message-ID: <20260917085107.1022445-6-mika.westerberg@linux.intel.com>
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

From: Anurag <anurag@intel.com>

USB4 defines two error counter formats for software margining:
- Standard counters (USB4 v1): 4-bit per-lane values in DW0.
- Extended counters (USB4 v2): 16-bit per-lane values split across
  DW0 (lower 4 bits) and DW1-DW3 (upper 12 bits).

The existing debugfs logic only reads DW0 when checking for errors,
which works correctly for standard error counters but only captures
the lower 4 bits, missing the 12 MSBs if extended error counter is
supported.

Read and combine the full counter values from all result dwords
before evaluating whether errors occurred on any lane.

When running software margining with "all lanes", determine which
Rx lanes are actually active and only check those:
- ASYM_RX: RX0, RX1, RX2
- ASYM_TX: RX0
- Symmetric: RX0, RX1

Refactor the error counter extraction into a helper function to
improve readability.

Signed-off-by: Anurag <anurag@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 68 ++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 12 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 43de2938d1e4..ccefc5dd1ded 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -1160,9 +1160,34 @@ static int margining_mode_show(struct seq_file *s, void *not_used)
 }
 DEBUGFS_ATTR_RW(margining_mode);
 
+static u32 margining_get_lane_error(const u32 *results, unsigned int lane, bool extended)
+{
+	u32 error_count;
+
+	switch (lane) {
+	case USB4_MARGINING_LANE_RX0:
+		error_count = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK, results[0]);
+		break;
+	case USB4_MARGINING_LANE_RX1:
+		error_count = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK, results[0]);
+		break;
+	case USB4_MARGINING_LANE_RX2:
+		error_count = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_2_MASK, results[0]);
+		break;
+	default:
+		return 0;
+	}
+
+	if (extended)
+		error_count |= FIELD_PREP(USB4_MARGIN_SW_EXT_ERR_COUNTER_MASK, results[1 + lane]);
+
+	return error_count;
+}
+
 static int margining_run_sw(struct tb_margining *margining,
 			    struct usb4_port_margining_params *params)
 {
+	bool extended_err = supports_extended_error_counter(margining);
 	u32 nsamples = margining->dwell_time / DWELL_SAMPLE_INTERVAL;
 	int ret, i;
 	u32 dwords;
@@ -1170,7 +1195,7 @@ static int margining_run_sw(struct tb_margining *margining,
 	if (params->error_counter != USB4_MARGIN_SW_ERROR_COUNTER_START)
 		goto out_stop_or_clear;
 
-	if (supports_extended_error_counter(margining))
+	if (extended_err)
 		dwords = SW_MARGINING_DWORDS;
 	else
 		dwords = 1;
@@ -1191,17 +1216,35 @@ static int margining_run_sw(struct tb_margining *margining,
 			break;
 		}
 
-		if (margining->lanes == USB4_MARGINING_LANE_RX0)
-			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
-					   margining->results[1]);
-		else if (margining->lanes == USB4_MARGINING_LANE_RX1)
-			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
-					   margining->results[1]);
-		else if (margining->lanes == USB4_MARGINING_LANE_RX2)
-			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_2_MASK,
-					   margining->results[1]);
-		else if (margining->lanes == USB4_MARGINING_LANE_ALL)
-			errors = margining->results[1];
+		if (margining->lanes == USB4_MARGINING_LANE_ALL) {
+			if (extended_err) {
+				/* Extended counters with all lanes: check each active lane */
+				int width = tb_port_get_link_width(margining->port);
+				unsigned int lane, max_lane = 2;
+
+				if (width == TB_LINK_WIDTH_ASYM_TX) {
+					max_lane = 1;
+				} else if ((width == TB_LINK_WIDTH_ASYM_RX) && margining->asym_rx) {
+					max_lane = 3;
+				} else if (width < 0) {
+					tb_port_warn(margining->port, "failed to read link width\n");
+					break;
+				}
+
+				for (lane = 0; lane < max_lane; lane++) {
+					errors = margining_get_lane_error(&margining->results[1],
+									  lane, extended_err);
+					if (errors)
+						break;
+				}
+			} else {
+				/* Standard counters: all lane errors fit in results[1]*/
+				errors = margining->results[1];
+			}
+		} else {
+			errors = margining_get_lane_error(&margining->results[1],
+							  margining->lanes, extended_err);
+		}
 
 		/* Any errors stop the test */
 		if (errors)
@@ -1209,6 +1252,7 @@ static int margining_run_sw(struct tb_margining *margining,
 
 		fsleep(DWELL_SAMPLE_INTERVAL * USEC_PER_MSEC);
 	}
+	params->error_counter = USB4_MARGIN_SW_ERROR_COUNTER_STOP;
 
 out_stop_or_clear:
 	/*
-- 
2.50.1

