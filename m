Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBA7301012
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 22:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464954; cv=none; b=pS4byeiwfaB6fn6fTSwcpaTt4X2u/Fpq/qtrnXRZSyuTDAcjkXM3O/gyIdPp2DThCywGYcq2hAjoBKVasWzUQskGLmWRBwGCoaTPiNLHDCKS06sed3tdYpsI38Tc6lx0NLq5PiNI8gqB9d3P0uo0FqYDSpO/Kf98dOvA42MBjXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464954; c=relaxed/simple;
	bh=QqBdShCphMOIiAFsvEmtr6uApDHdf5y9v4waUvnbBcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/PqP8TOhrWPYyzCX7q+mIoZamUvoyw6eu0fnXhz1dpSnflKsxJnmYfwVq8brasVZOH3m9mPjnaJq3uJdIzsaLeiGBsUrB3JBeiDSUnAxG9MpsGKy9M+qDZc1TbpL4n1tvEcTLSGJBUDNSv40uHK44PkwhXGcpXCc5N1XGPexF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUUuGsD5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUUuGsD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769464952; x=1801000952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QqBdShCphMOIiAFsvEmtr6uApDHdf5y9v4waUvnbBcE=;
  b=OUUuGsD58RZQuXzeHgBzpgKWgtmhIG97Z12Ak6Ov45jlHaVwR9KCjQky
   ffnOQG57uz5/WOStxoEWry+DqoEAoboA4A7R9Uiy9mqSS1e0DpkLbcUK1
   qo8JIspkt0tbz/0UF1Q6tU9RSF6nUf5cycWunVdV6IvwVIF/4f86Y20IQ
   2ej2odvUrg3Rw7VK06juLbnfeMOo64IDXoamgw1vnx+BtGVffgAsxHVdi
   6cXm5yEo4wUCHGCxHEYb7Re31Of9H4wqEnU/7nXOZeyI5GmR+cN1EBrt5
   gErnqdK8TOgs657sZosEkhijQjgRjtDZvJznCz9926Tiob7MNlbx+jpGS
   Q==;
X-CSE-ConnectionGUID: cZ92ItZ1RvurJlfXuFSJBw==
X-CSE-MsgGUID: AX77CgPkRHqyrbwIlm0d9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82019767"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82019767"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 14:02:31 -0800
X-CSE-ConnectionGUID: 3Yiu5eImTyub1Ag7UqEs+w==
X-CSE-MsgGUID: UKx3rklaR1G93ToMUZEtJw==
X-ExtLoop1: 1
Received: from cdjpc409-it.jer.intel.com ([10.12.50.120])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2026 14:02:29 -0800
From: Gil Fine <gil.fine@linux.intel.com>
To: andreas.noever@gmail.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: gil.fine@intel.com,
	linux-usb@vger.kernel.org,
	lukas@wunner.de,
	Gil Fine <gil.fine@linux.intel.com>
Subject: [PATCH 3/5] thunderbolt: Verify Router Ready bit is set after router enumeration
Date: Tue, 27 Jan 2026 00:06:04 +0200
Message-ID: <20260126220606.3476657-4-gil.fine@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126220606.3476657-1-gil.fine@linux.intel.com>
References: <20260126220606.3476657-1-gil.fine@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB4 Connection Manager guide specifies that after enumerating a
router, the Connection Manager shall verify that the Router Ready bit
(ROUTER_CS_6.RR) has been set to ensure hardware configuration has completed.
Currently, this step is missing from the enumeration sequence.

Add this check to follow the Connection Manager guide more closely.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 5 +++++
 drivers/thunderbolt/tb_regs.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e7faa203b782..11e8c1dd3090 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2641,6 +2641,11 @@ int tb_switch_configure(struct tb_switch *sw)
 			return ret;
 
 		ret = usb4_switch_setup(sw);
+		if (ret)
+			return ret;
+
+		ret = tb_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_RR,
+					     ROUTER_CS_6_RR, 500);
 	} else {
 		if (sw->config.vendor_id != PCI_VENDOR_ID_INTEL)
 			tb_sw_warn(sw, "unknown switch vendor id %#x\n",
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 71bed02a6974..7e65bc9bcb12 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -216,6 +216,7 @@ struct tb_regs_switch_header {
 #define ROUTER_CS_6_WOPS			BIT(2)
 #define ROUTER_CS_6_WOUS			BIT(3)
 #define ROUTER_CS_6_HCI				BIT(18)
+#define ROUTER_CS_6_RR				BIT(24)
 #define ROUTER_CS_6_CR				BIT(25)
 #define ROUTER_CS_7				0x07
 #define ROUTER_CS_9				0x09
-- 
2.43.0

