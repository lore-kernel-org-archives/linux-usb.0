Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C900404BF7
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736250; cv=none; b=uqG/Gvj51Krx+WqpaTpxC0e0eQD6tioxv4s4XFd793TUTw56MrariIR8KOrTJZRSjJqapkkZoDbnbor+rNWtzKX3JRf38uMhRGbfy+rI73RAxLbyLAA9apDTnsS/I4aVPYtph+zmEmi+XHjTh6MRsrewxh6ExChADR1Gu6vWKUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736250; c=relaxed/simple;
	bh=Ys3Xu+69BHzNMnI/H1obvV6MbeoYgxXQyy7pB/TDDRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfQ1zW+8THilWIucxdcMNApWT7AjlD+lBJfWfEYSsyIoL676JtsX1iv2lgJpwp6INBtCvji1RZikbk5n1/uwLQZtsXfeV4siTQ4kTyxre8o2NygsfuMW5MLEXnv54Vw+C0ABrK4fRWWMQamsMMArWbDyh5tPc6ih4B8p+E6F9Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwiZg2bq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwiZg2bq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782736248; x=1814272248;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ys3Xu+69BHzNMnI/H1obvV6MbeoYgxXQyy7pB/TDDRg=;
  b=CwiZg2bqAnnBFHpK/470xUnY2uhS9QW6D97PwUv4KaIruAwjyHXD07X/
   GhskMYC4bpO94xw1cA5clYQwLMV0FDr7qm9UOP04iDHjRDB6NVuLNoJaz
   ZIYQtUCygn6Xmb1hVMY+TiuBda/IClJWBE2TTRy/H2x2CCRz7qXjBDeMA
   HhHxIEnUkxeFpuxhFY5QgedrhbVHzfuQxF2v4Da1wlsINroM6EiXDSlQM
   gut+EHCIKkhrdAb7Fc9HDEuUGRTfSnapkDL58zQPchE1boySrM6PHZOxH
   klBgxbawMWAczmB3APjW2dXtWrWgtNghBRqhI4j4rvgTcQozX+NqBhEvF
   w==;
X-CSE-ConnectionGUID: UaEoRK5YTjiMt0op+tcwAA==
X-CSE-MsgGUID: BQxcMpuIQf6xj2ie2hfo4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="70943943"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="70943943"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:30:47 -0700
X-CSE-ConnectionGUID: 4tllXYy8QrSNLOFZj90l5A==
X-CSE-MsgGUID: PXrXWmJpS/2ShYlSZiUjyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="252081261"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.241])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:30:45 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <linux-usb@vger.kernel.org>
Cc: raoxu@uniontech.com,
	michal.pecio@gmail.com,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 0/3] xhci: avoid futile stop endpoint command and host teardown
Date: Mon, 29 Jun 2026 15:30:28 +0300
Message-ID: <20260629123031.142133-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is an attempt to avoid stop endpoint command failure
leading to xhci teardown with messages:

xHCI host not responding to stop endpoint command
xHCI host controller not responding, assume dead

Series is based on a discussion with Michal and Xu Rao:

https://lore.kernel.org/linux-usb/D9BA02889D046D23+20260617100957.2888108-1-raoxu@uniontech.com/

A Renesas xHC host with a device behind a disconnected hub failed to
complete a stop endoint command immediately after a endpoint soft
reset and restart. Michal had some plausible theories why stop endpoint
command issued immediately after endpoint restart fails after disconnect.

Many of these cases can be avoided as xhci driver knows the rootport
link state and can avoid futile transfer retry and recovery on link
error or disconnect

I don't have a easy way to reproduce this myself, all testing is
welcome

Thanks
Mathias

Mathias Nyman (3):
  xhci: include all root port children in recovery prevention on link
    error
  xhci: prevent endpoint recovery after roothub disconnect
  xhci: avoid xHC endpoint changes after disconnect or link error.

 drivers/usb/host/xhci-ring.c | 50 +++++++++++++++++++++++++-----------
 drivers/usb/host/xhci.c      |  9 ++++---
 drivers/usb/host/xhci.h      | 11 +++-----
 3 files changed, 43 insertions(+), 27 deletions(-)

-- 
2.43.0

