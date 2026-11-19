Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108758;
	b=Pnw9ACsUJU0UNuwduFPuM8csIrL6EPe80UFMMDedvKK9+hQMrxQeMdB7Oa6E9MKC94SW
	 n38/9A2gFkvFm9nU5eTsREqHBvNZyk2BIt+QvCF8+b3KNRt+wYhyXdsusrqs5/g5CESK2
	 MOFqgBA/Ke+g2JqBbccvp4gZZEZrS9qOXA5KF1KpiYA6AgLF1oOuvTYsPAqaBnDoWJAgV
	 kE+JYVGxKs7uQqs1KY2ODR6uQmwG6FYsQP78QMPkM8tdHCcSduBd1uyQKTfgsHCZf8Zz5
	 DDr0jA38YhP/xU2NEZ+OxDp1INwUAoN1KS0mSIfS37jXfrEx10kHd5p2YgVssgvPXXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8ei3kkOf36ry4df2eSeYGi5TCj/b6BdRBnxBn5V8rdU=;
	b=JBQrLW+IOkc8BRE6qcNIEdRfOdQTECRzzNDVUqcvU+ksBImrTZfac78spGbn8yotwXWO
	 pM+4Cs8bCxaOW1C/xmushW5ax2tvCTEspETiEsEfnnB8JaBoMsA+Zyz1UPoxEe8C3226x
	 sp22siXIMO8Gi+yzu27W+CnfH4Bw+TlO0uHiMYMEQhjXuL3WYrk76zh5lbu4YL9U3IAsQ
	 4B26q4fFlJSTHoJ4gSUxQeYqMHlSvPqju4jtovDq40+KAcmf6+UlKu1biNGHe1aXn0JMR
	 0rlzBi3hoCS2QFk0SUrAY8Y6PRl4Vk4LByc3ERkpwKXHZdVREi510KqvwHbruWrlKXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ky9vOatS;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDBA60A2600
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDBA60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ky9vOatS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108758; x=1826644758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7AExgEoZT2ORh2BdC4eE1sp6WXrKVQh4BVPBRuOnQpc=;
  b=Ky9vOatSXNIM8fP5x9feLdEcuao/ydrQ5OzegVuRnuwomgSjITnrmq1y
   KyLPO7A8tf2jG2MeW6jRfLJ9f1EUBFqiIh2OgC07Tx4HgPJ4sLYnC29Vl
   bZN4i5Ur/Kc/SmID9iJoOZtsjgRy1NRAjlN0YDB8xcxAA8XXyc6AMFXNU
   oPueBd9+YuqilHNlhAYX9/Al7OU2RzUS9GTFXzpQ4RpfxhxvHxQw3GyzF
   VpaEqEdG/RjP0M1MyU00egDO8xEZcEovDQ1J+TYfeiTMBE7L34D7Pi7cY
   q+7gHP3vfl0EYFDBBpiOnXQ4igY+iGj9Q1Wj1f7KwMYN8hDtnCU8Ib68g
   g==;
X-CSE-ConnectionGUID: TTKtwSd5TuCSeFxcPrZSXg==
X-CSE-MsgGUID: s3JMNTcIQC2Zjg32cue3Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3958997"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3958997"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:39 -0800
X-CSE-ConnectionGUID: HHjpuB6KQ+mqXVH59AGXZw==
X-CSE-MsgGUID: chsk0FydS2iwjdUdsyTy5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10381735"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 09:12:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0AB8EA2; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/18] thunderbolt: Re-apply Alpine/Titan Ridge flow on resume
Date: Thu, 19 Nov 2026 18:12:19 +0100
Message-ID: <20261119171232.1616316-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mika Westerberg (Intel)" <westeri@kernel.org>

Alpine Ridge and Titan Ridge both require special flow to get the xHCI
enabled, and CL0s working. We do that when the PCIe tunnel is created
but forgot to do that when we resume from system sleep. Fix this by
applying these after the PCIe tunnel has been re-activated.

Fixes: 30a4eca69b76 ("thunderbolt: Add internal xHCI connect flows for Thunderbolt 3 devices")
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/tb.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 3c4903adb687..6a11d686bdf1 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2315,6 +2315,21 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
 	return 0;
 }
 
+static void tb_pci_post_activate(struct tb_tunnel *tunnel)
+{
+	struct tb_switch *sw = tunnel->dst_port->sw;
+
+	/*
+	 * PCIe L1 is needed to enable CL0s for Titan Ridge so enable it
+	 * here.
+	 */
+	if (tb_switch_pcie_l1_enable(sw))
+		tb_sw_warn(sw, "failed to enable PCIe L1 for Titan Ridge\n");
+
+	if (tb_switch_xhci_connect(sw))
+		tb_sw_warn(sw, "failed to connect xHCI\n");
+}
+
 static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 {
 	struct tb_port *up, *down, *port;
@@ -2345,15 +2360,7 @@ static int tb_tunnel_pci(struct tb *tb, struct tb_switch *sw)
 		return -EIO;
 	}
 
-	/*
-	 * PCIe L1 is needed to enable CL0s for Titan Ridge so enable it
-	 * here.
-	 */
-	if (tb_switch_pcie_l1_enable(sw))
-		tb_sw_warn(sw, "failed to enable PCIe L1 for Titan Ridge\n");
-
-	if (tb_switch_xhci_connect(sw))
-		tb_sw_warn(sw, "failed to connect xHCI\n");
+	tb_pci_post_activate(tunnel);
 
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
 	return 0;
@@ -3239,6 +3246,8 @@ static int tb_resume_noirq(struct tb *tb)
 			usb3_delay = 0;
 		}
 		tb_tunnel_activate(tunnel);
+		if (tb_tunnel_is_pci(tunnel))
+			tb_pci_post_activate(tunnel);
 	}
 	if (!list_empty(&tcm->tunnel_list)) {
 		/*
-- 
2.50.1

