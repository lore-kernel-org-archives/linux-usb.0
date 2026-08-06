Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0653A356773
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026092; cv=none; b=AjEG9i4LGjj6r7OTkiC2j6Fnbrip5DzqW2L7LFhofxwfcrTEtA43yYvDXCx8LM3zB0cU9h2SNpe9F23KMEUvrUIL4AHMMwrN9aR7Kzhzpz1Z00k9T9OxmAekOW/qzNoatsmpyNnAjt8Yjqg7CR71QWBMI01jLR/cTt0oavb5wuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026092; c=relaxed/simple;
	bh=8WvDzx5Fp/WxSNy0+O+tuSU079TDhgdsLoH4hQusEZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ThULkmxaUE9jqASqdxUKyA31s7MoUNCvsyHjsR4hGhkW500pHWQqKrYytoSjSvEXruy/Z77J4LC6IFD3awQ4/dDR99iuY7S4v3jiovhOPF8m06nDxLxk6LSWLgQcDRFRgBl5eWT22XTL0lTB+MjbM+MF68ciuwx93hVrgR3aVuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnwz2+7Q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnwz2+7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026090; x=1817562090;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8WvDzx5Fp/WxSNy0+O+tuSU079TDhgdsLoH4hQusEZ0=;
  b=lnwz2+7Q8MfB9IZRlgpmB6jZT12b0AnpMagGC5KJmFupzZBf2OtkdjT7
   m5yJkanaSuzuBHcreqM4k858YgI4HZqcUrRozBCpriFyaiPa0TCdWlZME
   Im/1Ew2AOEQgXQOqw2eF4SSkcYveRlsLiITTVcL0ch4fR95fsmHnoJvfE
   S4I2ytt7McQhpGUVD88tvX9JgxpUJnI0QpO5coAi564vd7fmCPYj1PP2s
   VCXTKXWcBckwN7BteJ0gIlPaSvC4jgOrxobv24L8QIGYU+4mTuV29Tlnf
   gC26H2weITBOHLLQmOC+oxINmtjScF6pjRT7+V1R97jR3r2jhg0ULUBcp
   w==;
X-CSE-ConnectionGUID: Uf3GW+KVS2aiMskgjmAHSw==
X-CSE-MsgGUID: R9jJcvabSfmHp9WDBj6naw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268101"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268101"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:27 -0700
X-CSE-ConnectionGUID: 6DqyOCbWQJaM8Iq8sCN/xQ==
X-CSE-MsgGUID: lPYQfUSYQJSJW7M9pWbWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500329"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:26 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/17] xhci features and fixes for usb-next
Date: Thu,  6 Aug 2026 17:20:56 +0300
Message-ID: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

Several xhci improvements, clenups and fixes for usb-next

Thanks
Mathias

Breno Leitao (1):
  usb: xhci: bail out of setup if the controller is inaccessible

Lucas De Marchi (3):
  xhci: dbgtty: Fix unregister on tty_register_driver() failure
  xhci: dbgtty: Fix unregister on tty_alloc_driver() failure
  xhci: dbgtty: Drop extra call to idr_destroy()

Mathias Nyman (6):
  xhci: fix frame id calculation and checks for isoc URBs
  xhci: Set frame ID field of isoc TRB when starting an isoch stream
  xhci: include all root port children in recovery prevention on link
    error
  xhci: prevent endpoint recovery after roothub disconnect
  xhci: avoid xHC endpoint changes after disconnect or link error.
  xhci: move dequeue to next valid td instead of past cancelled one

Michal Pecio (1):
  usb: xhci: Handle bogus TRB pointers in Missed Service Error events

Niklas Neronin (5):
  usb: xhci: standardize multi bit-field macros
  usb: xhci: use 64-bit Addressing Capability macro
  usb: xhci: remove redundant function wrapper
  usb: xhci: remove redundant 'xhci' pointer from endpoint struct
  usb: xhci: replace Unicode quotes with ASCII apostrophes

Semih Baskan (1):
  usb: xhci: Handle USB3 port events when there is one roothub

 drivers/usb/dwc3/host.c         |   5 +-
 drivers/usb/host/xhci-caps.h    |  41 +--
 drivers/usb/host/xhci-dbgtty.c  |  25 +-
 drivers/usb/host/xhci-debugfs.c |   3 +-
 drivers/usb/host/xhci-histb.c   |   2 +-
 drivers/usb/host/xhci-hub.c     |   6 +-
 drivers/usb/host/xhci-mem.c     |   7 +-
 drivers/usb/host/xhci-mtk.c     |   4 +-
 drivers/usb/host/xhci-pci.c     |   4 +-
 drivers/usb/host/xhci-plat.c    |   2 +-
 drivers/usb/host/xhci-ring.c    | 492 ++++++++++++++++----------------
 drivers/usb/host/xhci-tegra.c   |   5 +-
 drivers/usb/host/xhci.c         |  43 +--
 drivers/usb/host/xhci.h         |  21 +-
 14 files changed, 344 insertions(+), 316 deletions(-)

-- 
2.43.0

