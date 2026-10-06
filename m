Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB5748F836
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300275; cv=none; b=t387d+VJ3KON5Y0PKvBLJg3RKywEznihgrmz680Gfygqp5gWB+7+BcGrdDX10OtObxiZF7HrnsovsuBkjEun6wzo2jPJZ8/UL5e5ybDmDyAL5i7NpWduk5XaB5KQt4Dj/7P+yPlzBkoH/ip7a5WUBwmrscZ/FXJ1FiIix0P06Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300275; c=relaxed/simple;
	bh=bD6y5W4xKbq6oCnfbfXcWCSF/LiiQDcuFovBSxfCXno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qd3QssJJZJ++M0u+y9TZkQ3svCT6Qwb7DRLZr7UeicJjR+JYg0XjJu8+qFNkcj8lnN3UW31UxmdC2q+LYiOKOJkmXTTggU/JkOqz+jLt7jLoRRE3He3X3sNSMpud6swIxCTH56MlPRxUusVeNB584Vz2MBZm2EfYoQwa5RQUAH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RK45Q2kJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RK45Q2kJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791300273; x=1822836273;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bD6y5W4xKbq6oCnfbfXcWCSF/LiiQDcuFovBSxfCXno=;
  b=RK45Q2kJaLMgRbAY9Q1GK6zeq78By73TmHNpsDaRwzxXPzV6Ai7Qcc/o
   paTAe49iZqzfLCQoH92pouhb00VuPEhhVG37EWAExw5Hdpkv+Lyi7/oBG
   pt5VVKFUCuHWwrh766/FeMHRKHHJgaq+eJkKQ6NB9PgOAUhHB7B/xeFNI
   f1ZGQo8t1HJkt0cjR9i9TcG7ViJr7T6Zw6amAaavjhDEQkJdXVGhX5BaZ
   qC+ZtF0G8gqKAWcTZQaSSHpODYaj2c8XBKglr0sM3tBXTGTh2j6a8X952
   44Zn4h2z5Zf/PtHB4Uh10H2sN4euDeomQlTTHKTnWkYoMPTbHL+mQJGOr
   A==;
X-CSE-ConnectionGUID: bZCZTfghQp+nH/7y8AgvCw==
X-CSE-MsgGUID: CQ4030pHRSuVcYFNpgePpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="117513764"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="117513764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 08:24:33 -0700
X-CSE-ConnectionGUID: pSSpC2WmSISoRInBf3Ahcg==
X-CSE-MsgGUID: j5UVx8ViTqij9crVbLGHYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276707023"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2026 08:24:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 86B7F99; Tue, 06 Oct 2026 17:24:30 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/5] usb: xhci: bandwidth accounting fixes and cleanup
Date: Tue,  6 Oct 2026 17:24:22 +0200
Message-ID: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains a small collection of xhci fixes and cleanups.

The main fix addresses a regression where software tracked bandwidth
information could survive hibernation resume after the S4 resume path was
optimized. This could result in incorrect bandwidth accounting when devices
were rediscovered after resume.

While investigating bandwidth accounting, I found a few additional issues:
* Fix endpoint resource accounting on virtual device allocation failure
  for controllers using XHCI_EP_LIMIT_QUIRK.
* Remove a redundant TT active endpoint update during virtual device
  cleanup.
* Correct an endianness conversion for a 32-bit slot context field.
* Remove two unused xhci structures.

Niklas Neronin (5):
  usb: xhci: clear stale bandwidth data after hibernation
  usb: xhci: correct num_active_eps accounting on allocation failure
  usb: xhci: remove redundant TT active EP update from
    xhci_free_virt_device()
  usb: xhci: correct variable size conversion
  usb: xhci: remove unused structs

 drivers/usb/host/xhci-mem.c   | 22 +++++++++++++++-------
 drivers/usb/host/xhci-trace.h |  2 +-
 drivers/usb/host/xhci.c       |  6 ++++++
 drivers/usb/host/xhci.h       | 12 ------------
 4 files changed, 22 insertions(+), 20 deletions(-)

-- 
2.50.1

