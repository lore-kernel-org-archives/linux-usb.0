Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781889;
	b=0TpEdF2IsUKCCD5wIx9b+Z6CxzIoqHyvx/2/kyvp/21vvnvkx0N1fJqhdZtINwKFVa8S
	 uThjJk3MWG9sSObR03Q8sCEYs6l8eySlvTx2Dsv4aMOK+KLNIlhYEdrOjmf1ZjWLaZHJR
	 f48ZOvvxWVPW1a+BBzG+C8iXDaDgPRBOvEI59HDO4rBopCVop71/zZEjSLSykS74q1ccF
	 jzVgLSZtKjXbFILFdmzrqZsXXUcCGlBdVyH89o8MtR+jCfjwzmw8S5cGeN0YS2ZhDWUjS
	 cc0T/ThzFN/3ZHq1EVcRid9K4kJba6G/xrdBzz8X7zY1dq5YlEPuyRwNRMDrxpXLF3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781889;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XphaCiIRjPJOAfh+1UJaEsL/BRjkK6ImI5bKCGhm3KU=;
	b=selg7CydvlGeKsvlrLauj7C60cjp20xuRo5MnJrf/2erh1fggooolNK6y8Dls5ieaMZx
	 Y0S9GPvTatjWKPFlEyz6MJ5oGsGSxBoyCV3zzRBrrSxOBRpWpvocK9/sCsAWsVfyW91pO
	 MUaeCYku2090anLPEEZN30VqwI62ulLIkZ9mvJg0D7B28IcakYsUCL672zXlH6KlsMDJO
	 Fv3hAjUoUAZe+eCB6dVoO21naYCiY8Su5yO/Pj70as5ZXB5nQzICwfe9aff7X+Wnj5Cav
	 iCZMWWl7cxwTZzW0Lk48ugJOlomrAmK3pOY1IXFSI5qMjcQLuQcbSyE9nHWgR+gx9MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WxPUtbQo;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2465606A31F
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 12:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2465606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WxPUtbQo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795781889; x=1827317889;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Uaq62mbb5tx0rskx2UDYxpvSbjnJil7ABrFqzVZuF5A=;
  b=WxPUtbQoOzocTb/VrnclGxe7c13H0MZiPOd+iS9CylpCVORhALj/5/Fx
   vSpoT9GivsHhqFlJ99GEGqBzY4ZVQxM7wjlRXYqB6yZL3lMlneb8/GlvK
   8aA3rsAVBg8JR57IkFtdSHVpawLmvwNz3ySOAleYbwFpXup3f5mTf5Ofw
   eQRVf1DU0+HszwfkrolGpRnnvA8G5fp6JPEVMdKmyhJDQzDfFfwCT7yR7
   iiUer2D6vyA6ZouHaFcu6tKh1Py1CQs6Q/Kob6R3LscPZw3x1vuFo9R7K
   laTd1FrchyoMsoyk/ZGeq4wxgsTbyomO7MoG+g0fqKTdWewdzaq8/5UEI
   w==;
X-CSE-ConnectionGUID: pZUoq62rSy+Dp3BRsKRykA==
X-CSE-MsgGUID: 2lfG6lKjS6OM7Yr1R/5FNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4577834"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4577834"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 04:18:08 -0800
X-CSE-ConnectionGUID: GvfVRKNDQXGeewqdfuuyoA==
X-CSE-MsgGUID: K5os+bdGRo6MofccvEvKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12270662"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.45])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 04:18:07 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/10] xhci fixes for usb-linus
Date: Fri, 27 Nov 2026 14:17:45 +0200
Message-ID: <20261127121755.281420-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Hi Greg

A set of xhci fixes for usb-linus, many are related to cases where
a usb device is reset as part of re-enumeration (retry), or recovery from
failed resume. These are fixes like the sideband use-after-free patches
and xhci ep0 context mangling fix.

Some generic fixes like avoiding dev_warn floods, and reporting current USB3
supported speeds correctly on a set of xHCI hosts.

Thanks
Mathias

Alex Kononov (1):
  usb: xhci: Demote isoch buffer overrun message to debug level

Chien Kun Niu (1):
  xhci: Give back URB under lock in xhci_urb_dequeue()

Jon Hunter (1):
  usb: xhci: tegra: Fix missing semi-colon

Mathias Nyman (6):
  xhci: check for halted host before accessing virt devices in
    xhci_check_args()
  xhci: Fix reporting incorrect supported speeds in roothub BOS
    descriptor
  xhci: sideband: avoid use-after-free of stale virt device pointer
  xhci: sideband: check virt device under xhci lock when stopping
    endpoints
  xhci: fix use-after-free for errors mid TD on empty halted rings
  xhci: fix NULL pointer dereference of rhub_port in xhci_urb_enqueue()

Michal Pecio (1):
  usb: xhci: Fix ep0 maxpacket update on enabled slots

 drivers/usb/host/xhci-hub.c       |  15 ++-
 drivers/usb/host/xhci-ring.c      |   7 +-
 drivers/usb/host/xhci-sideband.c  | 151 ++++++++++++++++++++++--------
 drivers/usb/host/xhci-tegra.c     |   2 +-
 drivers/usb/host/xhci.c           |  87 +++++------------
 drivers/usb/host/xhci.h           |   2 -
 include/linux/usb/xhci-sideband.h |   4 +-
 7 files changed, 155 insertions(+), 113 deletions(-)

-- 
2.43.0

