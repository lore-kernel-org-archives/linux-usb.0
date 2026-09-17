Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E95492E28
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635089; cv=none; b=s4P1OExv3NpK02HujLLzDrEkK+V+0xoeZur/QYKifjNunbV6469TPmF1DzN0YVE22gxWZ5Sk1mtwZDS2Zga1tI3FE31d6FTKWH1Gjf8fexcUw+FoZ2r2iZROckcI6fN4QgnMi5MgD+nqqWkUNiBk7bssekVAZkOl8XTk5OA/Cgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635089; c=relaxed/simple;
	bh=0jFRhxu3tbuUDEhgAlzNvzlfssgfKaNlRXPe2fr0D/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGaxPODTnyYSPkehleJy+T5430TJjkn9CBE6THl7LTW0HvIOOfSZ0wVoZsTqmtmXSVJW4Mp5NUKtcu0K/m2uRJ+gvPGbSIpdbfxpyQCsuC16s2Zx6YAVajNJ9DCffPCnxNCpIC1RJw1u44CdPpo+Ugh1ST2thSTzQAylgr3Nj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXtM9BxG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXtM9BxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789635087; x=1821171087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0jFRhxu3tbuUDEhgAlzNvzlfssgfKaNlRXPe2fr0D/I=;
  b=fXtM9BxGa/5uf+OmUM2JcvNmyB8Zyhne8HYoftifWaMhWm8FlXebx3U8
   Vf0R6Ljl26bePAKc4sbME+PWOJI4kPtCg73GKdM2ug78R0MN+UCrGnUUV
   uIZxgl6fSizn7uBPTJIElaDozQ8fLgjqHkfx7MycUxJYzwiMFLOMXdOGk
   xFtd3mLLXX+Dm+IVc64oIBjyUFfz82KRXrGDixu9xHTbijKavA04HvFHv
   RJk395Zk1ntl/PxOKmPtEpB1jV6wIlFseyMNEvAVFUrqjpZgqsNi7MNgh
   Xpf9IXDpYQmLESES8wJp7cVD3ycqLWSx+R9GNlihWhcxCcezU2v1HMb2Z
   w==;
X-CSE-ConnectionGUID: pWX1BqwYR6mkbBmHMGKmSg==
X-CSE-MsgGUID: seOFvUWmQOCFIotSscdYSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101380761"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101380761"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:51:10 -0700
X-CSE-ConnectionGUID: VC2FIFVmT2SoW58ZR/Emmw==
X-CSE-MsgGUID: wTnfGLFpQHWGNRtmxN5wGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267432240"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2026 01:51:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 190B69D; Thu, 17 Sep 2026 10:51:07 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Anurag <anurag@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/5] thunderbolt: Make software margining error counter configurable
Date: Thu, 17 Sep 2026 10:51:03 +0200
Message-ID: <20260917085107.1022445-2-mika.westerberg@linux.intel.com>
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

The debugfs software margining run path currently initializes the
request with USB4_MARGIN_SW_ERROR_COUNTER_CLEAR, which implicitly
clears/enables counters every time software margining is started.

On some host-router/firmware implementations that enforce PHY
interface for USB4 (PIPE) margining control, CLEAR and START are
distinct operations.
- CLEAR resets error counters without starting margining
- START begins margin testing and error counting

Make the error counter operation configurable through debugfs
error_counter control instead of hardcoding CLEAR. Additionally,
only execute the software margining sampling loop when the
selected operation is START; for CLEAR or STOP operations, execute
the counter operation and return immediately.

Example to CLEAR error counter:
cd /sys/kernel/debug/thunderbolt/<ROUTER_ID>/<PORT>/margining
echo clear > error_counter

Example to START error counter:
cd /sys/kernel/debug/thunderbolt/<ROUTER_ID>/<PORT>/margining
echo start > error_counter

After configuring error counter run software margining for changes
to take effect:
echo 1 > run

This aligns the debugfs behavior with the USB4 v2/PIPE expectation
and lets users explicitly choose between CLEAR/START/STOP.

Co-developed-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Anurag <anurag@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 6e9080e7bcec..730916f62d39 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -1156,18 +1156,23 @@ static int margining_run_sw(struct tb_margining *margining,
 	u32 nsamples = margining->dwell_time / DWELL_SAMPLE_INTERVAL;
 	int ret, i;
 
+	if (params->error_counter != USB4_MARGIN_SW_ERROR_COUNTER_START)
+		goto out_stop_or_clear;
+
 	ret = usb4_port_sw_margin(margining->port, margining->target, margining->index,
 				  params, margining->results);
 	if (ret)
-		goto out_stop;
+		return ret;
 
 	for (i = 0; i <= nsamples; i++) {
 		u32 errors = 0;
 
 		ret = usb4_port_sw_margin_errors(margining->port, margining->target,
 						 margining->index, &margining->results[1]);
-		if (ret)
+		if (ret) {
+			tb_port_warn(margining->port, "failed to read margining error counters\n");
 			break;
+		}
 
 		if (margining->lanes == USB4_MARGINING_LANE_RX0)
 			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
@@ -1188,14 +1193,13 @@ static int margining_run_sw(struct tb_margining *margining,
 		fsleep(DWELL_SAMPLE_INTERVAL * USEC_PER_MSEC);
 	}
 
-out_stop:
+out_stop_or_clear:
 	/*
-	 * Stop the counters but don't clear them to allow the
+	 * Stop the counters or clear them as per the
 	 * different error counter configurations.
 	 */
-	margining_modify_error_counter(margining, margining->lanes,
-				       USB4_MARGIN_SW_ERROR_COUNTER_STOP);
-	return ret;
+	return margining_modify_error_counter(margining, margining->lanes,
+					      params->error_counter);
 }
 
 static int validate_margining(struct tb_margining *margining)
@@ -1272,7 +1276,7 @@ static int margining_run_write(void *data, u64 val)
 
 	if (margining->software) {
 		struct usb4_port_margining_params params = {
-			.error_counter = USB4_MARGIN_SW_ERROR_COUNTER_CLEAR,
+			.error_counter = margining->error_counter,
 			.lanes = margining->lanes,
 			.time = margining->time,
 			.voltage_time_offset = margining->voltage_time_offset,
-- 
2.50.1

