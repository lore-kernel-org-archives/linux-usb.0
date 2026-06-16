Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D78D2F8E96
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781597388; cv=none; b=BQMqOs48tz3vl0rtMg79iBbqGiWjQzBfDhsfieMzCreK02yxJkW19o6o4V7RzypvcjWIg66ZgdsBvOlhiXmJPSB/fpgGFXFnQY4XxqDpKX8QWJdlTzPBREyBsSaH3DvX5H4WNUjFjewjAeHo5K9lv3zY732/A48b7Ff9zPrWCYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781597388; c=relaxed/simple;
	bh=a9Zsrrbax08JtG9l8UlgwrXKgDbqD6eN2218ZU5cqJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4QkjzDy76it3ZjsI+/xV6PSvmAzoJtlZlIKTfJxkV5K9Ojm6rKUPUPYOYlwTxMya3Yid+3lIS9GO8HeEh6dIeYAsU3AFdemT+wxgrrysv3I8pkUyDbYWYd9kGZldSbmB9aIAlNvI0Jn8k2vJdLFGyLzZ7TZR1Xu0PfyXBEAS4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgKcs7S3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgKcs7S3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781597387; x=1813133387;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a9Zsrrbax08JtG9l8UlgwrXKgDbqD6eN2218ZU5cqJQ=;
  b=JgKcs7S3wGmCUNHDHWJ4V/GbmCQdxBK/x2XrOjA/i/N+NSyqtjQvCmk6
   DX/qhcD7+W914JCkzcWb25K4pvr9am5t9teuwf9pekhre/whbuw8df7kV
   wtc+kxRs8MNr3z0L3ghsd0zeyjbZZyKL/h38Vfit+N5lheW4Dcsxkz0Fj
   lL24/5bMYM6fyRjJY4G9nHsOp5QmGsTqGbefzwsZwIynorZ8BlT2ixquL
   Hesof/NctQGL+MNpqOdOmCFrqcuVkXPBi0uoh8uYWzOZnayF13G0o52Tz
   VHiG+K/BDRZIOwJTDWGMF+QjZd0wQ1WWW1H5vgdMIf/Cgnunu6UqOQ1Kn
   A==;
X-CSE-ConnectionGUID: JBqNcmL7SdiOLFsFZilEwg==
X-CSE-MsgGUID: zLKXsCyDRJeyNcxGJIsrNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93737614"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="93737614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 01:09:46 -0700
X-CSE-ConnectionGUID: hfSuH6NjTlu4hevuvzU4kg==
X-CSE-MsgGUID: arMaMG1+Tbqzjjv5dW97vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="247568285"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.156])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 01:09:45 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: chaitanya.kumar.borah@intel.com,
	linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fixup patch for usb-next
Date: Tue, 16 Jun 2026 11:09:31 +0300
Message-ID: <20260616080932.2229237-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

This is a fixup patch for the xhci DbC patches in usb-next.

This patch was originally part of the xhci DbC series going to 7.2-rc1,
but I decided last minute to drop it to let it mature for a while.
It enables runtime PM for xhci with DbC enabled.

Turns out the series going to 7.2-rc1 is flawed without this patch.
It introduces a locking issue that this patch resolves.

If possible it would be nice to get this included to 7.2-rc1, or if it's
too late, then to rc2.

It passed the CI test that discovered the locking issue.

Thanks
Mathias

Mathias Nyman (1):
  xhci: dbc: support runtime suspend while DbC is in enabled state

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  2 +-
 drivers/usb/host/xhci-dbgcap.c                | 60 ++++++++++++++++++-
 drivers/usb/host/xhci-dbgcap.h                |  3 +
 3 files changed, 62 insertions(+), 3 deletions(-)

-- 
2.43.0

