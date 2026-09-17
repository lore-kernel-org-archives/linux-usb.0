Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F6648FF74
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635087; cv=none; b=FavLmzz5ZfQrYmQbvO+/bBd5+voPU/TqwJdvUstA+88UdPIzaN59VYbQAPSttBogRo1Y/UW239+UdPdRl2ZHNgFj6DEkjlLY61pUCf/5lU6XL+74mfzsBfEwSXdLa628Gp/xlv+OnUTE1/pWedb/yW2vVIu+vGEKTCXH0bK8TTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635087; c=relaxed/simple;
	bh=VoqdIT58j9xNuChkdRvBqxyYdyKAiqj34MnbHQZZjIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saSMQtETLffAjv2Sia1XbmoZ7JxuHcPQiVinUz1vJJbLMHjkXkbdYWdi8Qi6OFn1vsnJ3hGxoGls30tZ3mNq4Lry61xkzAqzL+7nIQL0f2HJSiQnpZXFuwTvNCWYJHS5OLxgzcbOT4o/CMn2bMSWrOAl8HiHek3yXwy1hEq1B3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jExYmO6O; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jExYmO6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789635084; x=1821171084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VoqdIT58j9xNuChkdRvBqxyYdyKAiqj34MnbHQZZjIQ=;
  b=jExYmO6OxG4W+eXZaP1tLg1FlKOWKHbCU4Mn17pZBcNXtn8tmBqyhDzO
   RZFhu1suzEQCVtpaubtnIlkewco6xW7kd2+7NPS+a/Ej5CKNsl+9cNzXf
   XdQH420Z0UXbP7gXLJe3pa7+6nd5OViAmRjvvgj12OFuFfjaxK2+jHnnm
   rqnzSv52ESCTBivH6HNX+1X3NvtNUlo2nF8vm8nBDI1XKk95LTdQPvwFY
   JoUcySfRS+A4V+LGrObj2cXIlXNtSqCBk0vSuVFyfi7PsfFphgpkWfGpp
   0h8SHCzlEXd43fcQyRdP/ZNSDgvsYwSF0XIMNMQBnWAEGsxSRN4e+R1Ha
   g==;
X-CSE-ConnectionGUID: KV/aF0gwQ7+ARXP5bOt3AA==
X-CSE-MsgGUID: xj75MW27QvyL5i7eNFw2Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101380758"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101380758"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:51:10 -0700
X-CSE-ConnectionGUID: /r8WuQR+RlGAb3bvogrb8A==
X-CSE-MsgGUID: w4YBRfIMTHq4OmMpCe0RnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267432238"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2026 01:51:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1F7F1A1; Thu, 17 Sep 2026 10:51:07 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Anurag <anurag@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/5] thunderbolt: Add extended error counter support for software lane margining
Date: Thu, 17 Sep 2026 10:51:05 +0200
Message-ID: <20260917085107.1022445-4-mika.westerberg@linux.intel.com>
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

Add support for software margining extended error counters. Increase the
results buffer size to accommodate the new dwords used for extended
error counters for RX0, RX1 and RX2.

Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Co-developed-by: Anurag <anurag@intel.com>
Signed-off-by: Anurag <anurag@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 34 ++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/sb_regs.h |  2 ++
 drivers/thunderbolt/tb.h      |  2 +-
 drivers/thunderbolt/usb4.c    |  5 +++--
 4 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index ea80354c410a..43de2938d1e4 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -38,6 +38,7 @@
 #define COUNTER_SET_LEN		3
 
 #define HW_MARGINING_DWORDS		3
+#define SW_MARGINING_DWORDS		4
 
 /*
  * USB4 spec doesn't specify dwell range, the range of 100 ms to 500 ms
@@ -496,7 +497,7 @@ struct tb_margining {
 	unsigned int gen;
 	bool asym_rx;
 	u32 caps[3];
-	u32 results[3];
+	u32 results[5];
 	enum usb4_margining_lane lanes;
 	unsigned int min_ber_level;
 	unsigned int max_ber_level;
@@ -614,6 +615,11 @@ supports_optional_voltage_offset_range(const struct tb_margining *margining)
 	return margining->caps[0] & USB4_MARGIN_CAP_0_OPT_VOLTAGE_SUPPORT;
 }
 
+static bool supports_extended_error_counter(const struct tb_margining *margining)
+{
+	return margining->caps[0] & USB4_MARGIN_CAP_0_EXT_ERR_COUNTER;
+}
+
 static ssize_t
 margining_ber_level_write(struct file *file, const char __user *user_buf,
 			   size_t count, loff_t *ppos)
@@ -703,6 +709,8 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 		ber_level_show(s, margining->max_ber_level);
 	} else {
 		seq_puts(s, "# hardware margining: no\n");
+		seq_printf(s, "# extended error counter: %s\n",
+			   str_yes_no(supports_extended_error_counter(margining)));
 	}
 
 	seq_printf(s, "# all lanes simultaneously: %s\n",
@@ -1157,10 +1165,16 @@ static int margining_run_sw(struct tb_margining *margining,
 {
 	u32 nsamples = margining->dwell_time / DWELL_SAMPLE_INTERVAL;
 	int ret, i;
+	u32 dwords;
 
 	if (params->error_counter != USB4_MARGIN_SW_ERROR_COUNTER_START)
 		goto out_stop_or_clear;
 
+	if (supports_extended_error_counter(margining))
+		dwords = SW_MARGINING_DWORDS;
+	else
+		dwords = 1;
+
 	ret = usb4_port_sw_margin(margining->port, margining->target, margining->index,
 				  params, margining->results);
 	if (ret)
@@ -1170,7 +1184,8 @@ static int margining_run_sw(struct tb_margining *margining,
 		u32 errors = 0;
 
 		ret = usb4_port_sw_margin_errors(margining->port, margining->target,
-						 margining->index, &margining->results[1]);
+						 margining->index, &margining->results[1],
+						 dwords);
 		if (ret) {
 			tb_port_warn(margining->port, "failed to read margining error counters\n");
 			break;
@@ -1450,18 +1465,30 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 		u32 lane_errors, result;
 
 		seq_printf(s, "0x%08x\n", margining->results[1]);
+		if (supports_extended_error_counter(margining)) {
+			seq_printf(s, "0x%08x\n", margining->results[2]);
+			seq_printf(s, "0x%08x\n", margining->results[3]);
+			seq_printf(s, "0x%08x\n", margining->results[4]);
+		}
+
 
 		result = FIELD_GET(USB4_MARGIN_SW_LANES_MASK, margining->results[0]);
 		if (result == USB4_MARGINING_LANE_RX0 ||
 		    result == USB4_MARGINING_LANE_ALL) {
 			lane_errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
 						margining->results[1]);
+			if (supports_extended_error_counter(margining))
+				lane_errors |= FIELD_PREP(USB4_MARGIN_SW_EXT_ERR_COUNTER_MASK,
+							  margining->results[2]);
 			seq_printf(s, "# lane 0 errors: %u\n", lane_errors);
 		}
 		if (result == USB4_MARGINING_LANE_RX1 ||
 		    result == USB4_MARGINING_LANE_ALL) {
 			lane_errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
 						margining->results[1]);
+			if (supports_extended_error_counter(margining))
+				lane_errors |= FIELD_PREP(USB4_MARGIN_SW_EXT_ERR_COUNTER_MASK,
+							  margining->results[3]);
 			seq_printf(s, "# lane 1 errors: %u\n", lane_errors);
 		}
 		if (margining->asym_rx &&
@@ -1469,6 +1496,9 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 		     result == USB4_MARGINING_LANE_ALL)) {
 			lane_errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_2_MASK,
 						margining->results[1]);
+			if (supports_extended_error_counter(margining))
+				lane_errors |= FIELD_PREP(USB4_MARGIN_SW_EXT_ERR_COUNTER_MASK,
+							  margining->results[4]);
 			seq_printf(s, "# lane 2 errors: %u\n", lane_errors);
 		}
 	}
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index 5391502a4b87..b801f3a694be 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -59,6 +59,7 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK GENMASK(18, 13)
 #define USB4_MARGIN_CAP_0_OPT_VOLTAGE_SUPPORT	BIT(19)
 #define USB4_MARGIN_CAP_0_VOLT_STEPS_OPT_MASK	GENMASK(26, 20)
+#define USB4_MARGIN_CAP_0_EXT_ERR_COUNTER	BIT(28)
 #define USB4_MARGIN_CAP_1_MAX_VOLT_OFS_OPT_MASK GENMASK(7, 0)
 #define USB4_MARGIN_CAP_1_TIME_DESTR		BIT(8)
 #define USB4_MARGIN_CAP_1_TIME_INDP_MASK	GENMASK(10, 9)
@@ -108,5 +109,6 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK	GENMASK(3, 0)
 #define USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK	GENMASK(7, 4)
 #define USB4_MARGIN_SW_ERR_COUNTER_LANE_2_MASK	GENMASK(11, 8)
+#define USB4_MARGIN_SW_EXT_ERR_COUNTER_MASK	GENMASK(15, 4)
 
 #endif
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 4373336d9425..bbb5b290168e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1439,7 +1439,7 @@ int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
 			u8 index, const struct usb4_port_margining_params *params,
 			u32 *results);
 int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
-			       u8 index, u32 *errors);
+			       u8 index, u32 *errors, size_t dwords);
 
 int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index);
 int usb4_port_retimer_unset_inbound_sbtx(struct tb_port *port, u8 index);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 5fd4fe070f25..fe1b061f7055 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1826,13 +1826,14 @@ int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
  * @target: Sideband target
  * @index: Retimer index if target is %USB4_SB_TARGET_RETIMER
  * @errors: Error metadata is copied here.
+ * @dwords: Number of dwords to read error counter values
  *
  * This reads back the software margining error counters from the port.
  *
  * Return: %0 on success, negative errno otherwise.
  */
 int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
-			       u8 index, u32 *errors)
+			       u8 index, u32 *errors, size_t dwords)
 {
 	int ret;
 
@@ -1842,7 +1843,7 @@ int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
 		return ret;
 
 	return usb4_port_sb_read(port, target, index, USB4_SB_METADATA, errors,
-				 sizeof(*errors));
+				 sizeof(*errors) * dwords);
 }
 
 static inline int usb4_port_retimer_op(struct tb_port *port, u8 index,
-- 
2.50.1

