Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05201498926
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635082; cv=none; b=NXFxEWLGk95q62vT0AGwMJEJ2z3hH48EL+j2jNbQajvEP3kJZQXZ7SSYWp0fi9tS/RDIuN3CLD/+R1AQyozrK+9HLvYqPSfUPAi9R3C+DZadyglgpMR892KNawR8hRMYH/8kZszQS8/6Siiu37cHfocxT1/gY2uQ4g5JQlkj2gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635082; c=relaxed/simple;
	bh=3rW0FIh5Qi1uVudHeWDWJr15FOaU6OrMH6TAaSAzS+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDKTZ+Eq9mbYIZRtQLWfoe4eRYN7ccBi8hQdz0LH5gyqYLJpWkDCKvdwMn7Yv0Mhv9vKDHGnkaOUq/Y4Dt1YomdXOtCL94MqSwcAE+lsoh2xrgiD3z12W64t7SanhBUT9Rmm1I3ZIpAuWvXn1OnJIag0jzfa53hnDDPDlRJ5jps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxcbkA5y; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxcbkA5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789635078; x=1821171078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3rW0FIh5Qi1uVudHeWDWJr15FOaU6OrMH6TAaSAzS+A=;
  b=TxcbkA5yGtFuumSjYwJHynRDt+U9e0lajLHX1lSYD8h8vXgmKrsK1dBV
   d3D3M3xMUquzRPG1ErdbGaYGAfoJiDH5Siy36+bwz8RPyzh6ypVX3S5kx
   /8ge2rHd0gI0BKLts/f27+UOZDP+fNG4nzk8gsZe+Oi1JgaLJZi7TiHwC
   0N8CvBDynrya24dn8WWH3A1fPd9v776ARjUc2JSOdlMzOZvACdluSlriN
   y9yHHLBq8YRANZk/n9XRaYz6HzAEq/S1zVaRMeWUBmttOFyEwJ4KXErJR
   BDdbZ90XiXo7Lo2bMpRMIQFWbe5A82tpi3owCUb3DFctR0QDshVA27aem
   A==;
X-CSE-ConnectionGUID: FfM9f0VrSWW48pIY0uX6lQ==
X-CSE-MsgGUID: hQMVeUhOT3K7u4ebH7UVQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101380754"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101380754"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:51:10 -0700
X-CSE-ConnectionGUID: DDOYhYWkRdikjyfPnj6MXg==
X-CSE-MsgGUID: NP3z13FWRhKWq61J+kedCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267432235"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2026 01:51:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 227D4A2; Thu, 17 Sep 2026 10:51:07 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Anurag <anurag@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/5] thunderbolt: Fix sideband register access in usb4_port_sw_margin_errors()
Date: Thu, 17 Sep 2026 10:51:06 +0200
Message-ID: <20260917085107.1022445-5-mika.westerberg@linux.intel.com>
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

The READ_SW_MARGIN_ERR (RDSW) completion payload is returned in the USB4
sideband data window, but the location differs between standard and
extended error counters.

Standard error counters are returned in USB4_SB_METADATA and fit within
a single dword. Extended error counters require 4 dwords and are returned
in USB4_SB_DATA.

Add conditional logic to select the appropriate register based on the
dwords parameter that corresponds with error counter type.

Co-developed-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Anurag <anurag@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index fe1b061f7055..c9b3931c45ed 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1836,13 +1836,16 @@ int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
 			       u8 index, u32 *errors, size_t dwords)
 {
 	int ret;
+	u8 reg;
 
 	ret = usb4_port_sb_op(port, target, index,
 			      USB4_SB_OPCODE_READ_SW_MARGIN_ERR, 150);
 	if (ret)
 		return ret;
 
-	return usb4_port_sb_read(port, target, index, USB4_SB_METADATA, errors,
+	reg = (dwords > 1) ? USB4_SB_DATA : USB4_SB_METADATA;
+
+	return usb4_port_sb_read(port, target, index, reg, errors,
 				 sizeof(*errors) * dwords);
 }
 
-- 
2.50.1

