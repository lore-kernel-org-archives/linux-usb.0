Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781900;
	b=i7M6na8V18gIC1wkOOlB1zCBzBPyPJILMGH5IEKy1IlC8ws4HrlvYUekAgWf5l8SiW/u
	 XgPVFrvW8z+us7CbzEtZaVvn+kbqpgK7fmBo78v72Y7ixwZGx6DOKCa6fAOMsmwIgbyRH
	 VJ6Kiiwn++Sm0/XLyWm7OCZvbkf3Zhf/x4QgVK0kKSSRgtPk4v18EB/n9KpLAwkoRCrvc
	 L/HaIHZTcyU6TF4mbbCGYFqMYuqrekjLW+paREqvHFh5gdKvDEOtcGaqsX91y97ZMjibe
	 MSOciOCvS8MaqG2IkcFPTx4GoGGWpPsBXA4BrF+TWNMX3LO7gKmE+uqgZWDMiNXdjew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781900;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cDHHHjQT3MdAdaNPbUtyuDnG6uc2wvRmGRIuEqcdjNA=;
	b=m1GYGOi+jtTYO5MQAuvMvIxVkV+OolR53Fu7pnN+Z/LiYZH7egUBBHy7O8scGZVF5KTo
	 ItNRFZ1qcC7PHRFsYjII+k6VMQv2hgHdh3Twi94CqHlWZcmHNNOR/zHy4H8ELZqU5VQtb
	 2vwRmnbWLFtBmk2M98q35oRfcGCiwnvoy7VjxCLL6m4A9CE/WCW01riH/tDyuP1wL0Fa0
	 uGfhw3FEyzTd1y9mf4ZpuuKmoF8kxnERCjUSxCZDUuAf9fuGXe5hE8qTVN3y5Fc6B29tn
	 L0214qk9kaElIqP5QTDp7SYQW7uUc4G5rOTYH6jjJIza2NL4s7Pvfe58amutPiPu8ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QrFtdLJE;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0F606A323
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 12:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D0F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QrFtdLJE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795781901; x=1827317901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y83nHAqgj2jQFR/wVjv1SRdNIPRr3uxlMziKA8f6Xn8=;
  b=QrFtdLJEo5RHArm1+hPf9vynhKqP3VuTdkBA6QSsKPUb1IQFOFiHoVpz
   yoq7HcCjeIkc1XEBRRD5VJeSMVwAE/saeT0zkJMeZXHT0H0oI6hXWbhi+
   YQh3K5ScxgqqKINMGkIR2yX57dbAyUgl40pLoHo/RCi+6ifFXXRJ9FDc7
   +8xTof79Lto1Anlmv9moG90qdDeGBqYvJ8cUcj2JpEeDn9qrhqm3McIpz
   nPSJ6eaFe6BpALjvEM/OXQU+g+g0baylvv31XgYK+XYZLL5zd+Dzjlv13
   mqArLYWUF3sSA8LdZxgUS10Kc/H9rY21pB/ZFfHWnPTGv5gVTl/5Z19LA
   A==;
X-CSE-ConnectionGUID: Uf2CBz5tRAmKl8ixOVWz8w==
X-CSE-MsgGUID: 2CRHGXJ9Qb6YYEgBFTcEkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4577869"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4577869"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 04:18:21 -0800
X-CSE-ConnectionGUID: 74ZxyP4HQJeOfnFBNZDx7w==
X-CSE-MsgGUID: z6T1JQ1ETfqkC1ycm3/HIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12270676"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.45])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 04:18:19 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/10] usb: xhci: tegra: Fix missing semi-colon
Date: Fri, 27 Nov 2026 14:17:52 +0200
Message-ID: <20261127121755.281420-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127121755.281420-1-mathias.nyman@linux.intel.com>
References: <20261127121755.281420-1-mathias.nyman@linux.intel.com>
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

From: Jon Hunter <jonathanh@nvidia.com>

Commit 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
updated the Tegra XHCI driver replacing the HC_LENGTH() macro with the
FIELD_GET() macro, but in doing so dropped the trailing semi-colon. This
still compiled because the comma operator joined the assignment with the
following polling expression. Replace the comma with a semicolon to make
them separate statements.

Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 1a14aea58b0b..5fbb09d2a1ae 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -995,7 +995,7 @@ static int tegra_xusb_wait_for_falcon(struct tegra_xusb *tegra)
 	u32 value;
 
 	cap_regs = tegra->regs;
-	op_regs = tegra->regs + FIELD_GET(HC_LENGTH, readl(&cap_regs->hc_capbase)),
+	op_regs = tegra->regs + FIELD_GET(HC_LENGTH, readl(&cap_regs->hc_capbase));
 
 	ret = readl_poll_timeout(&op_regs->status, value, !(value & STS_CNR), 1000, 200000);
 
-- 
2.43.0

