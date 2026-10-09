Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E536167E
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558997; cv=none; b=PWsPcdSpHOxaT4BuSMUIzofUEBovAmOfx2+8YUoLK9R6Dzb3DxEnXSLzfJoB/mCdW8rcz+VogpftbyYpatDw8BzhEaxto93XPkHl99M4j0ZVPUJhh/f6DCfp1px9rAVz77iSHUUXKy8oRatDscNgsIzES92izmrtKQqBp9K7pU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558997; c=relaxed/simple;
	bh=zDZbHQuGZWPOL/JqpwZX/SEhpU91jZO3FXHWHwphO2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIIL3QE5pU//GjJQNCGWHwYfKtPHcxjWlaHsMT6Wun9+GUdOv+zLjn7/ZwsLY6GefMEnzLqzuzzT5oYjhOO3++BEa+x5JiPxxHZdPZePATt5jOlsTY102dh/tkGlKBoMtbQc5uWSEvTMjZcSwy3DpDMVkStHWS5yA9+VdDnU0Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHnD1qgX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHnD1qgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791558994; x=1823094994;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zDZbHQuGZWPOL/JqpwZX/SEhpU91jZO3FXHWHwphO2g=;
  b=jHnD1qgX3jDtoMk/B9yUJA52bRPWEMptbxZiHGExiZJk1SGFZRxAnuYG
   922V1UyJFzvuBfHyafc4ldB83m8IBLXo1XV6YFKCoiCTqfTh+CwAeEW14
   lF00cXDto4ZtMz5LH/18/ZnSZii7Eon1H+Zm4eBqO49uVlYTjYKcsn1gM
   5BBNDVnmwzLCoZLpnxy75UHAlY++ApDvCy87Fgd48O6mcmPcan4pa28Z2
   LuwHmyx/aBPp17M+4gsNWLc86MkAZ53eF183QqXayOSLuzkpXw1RCon47
   P1wQJs+m7o/bYXwkrZtnZycwJuN97QebEsw3tBvxP6Mvl1qYAj5PWIXpr
   w==;
X-CSE-ConnectionGUID: vPFNRhqQQ2a1QD8j5ITSZQ==
X-CSE-MsgGUID: 5y/qhPmlQ6StP93oMNG2iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="351653"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="351653"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:33 -0700
X-CSE-ConnectionGUID: hJYxYu1ITe+BwHE/rFiY6w==
X-CSE-MsgGUID: dxEMAvSFRla1557plw/fdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="650023"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 08:16:33 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 00/11] xhci features and fixes for usb-next
Date: Fri,  9 Oct 2026 18:16:13 +0300
Message-ID: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

second attempt

xhci improvements and non-urgent fixes for usb-next.

One series by Michal to improve transfer event handling, otherwise
smaller scattered patches for dbc, and generic xhci cleanups.

dropped the following v1 patches from v2 due to sashiko

[PATCH 01/14] early: usb: xhci-dbc: Handle out of bounds xhci-xdbc capability
[PATCH 07/14] usb: xhci: sideband: fix ring sg table for sub-page TRB segments
[PATCH 08/14] usb: xhci-pci: Add TUSB73x0 definitions

Also changed my own Signed-off-by email to @linux.intel.com instead of
accidental @intel.com in some patches.

Thanks
Mathias

Henry Tseng (1):
  usb: xhci: return an error if the host is not halted

Hongyu Xie (1):
  xhci: check device notification type before forwarding wake event

Mathias Nyman (1):
  xhci: Prevent invalid vdev dereference during sideband unregister

Michal Pecio (6):
  usb: xhci: Unlock for command abort polling
  usb: xhci: Guarantee URB giveback on Ring Underrun/Overrun
  usb: xhci: Don't set the skip flag on non-isoc endpoints
  usb: xhci: Shorten the TD skipping loop
  usb: xhci: Rework and improve the TD matching and skipping logic
  usb: xhci: Fix bounce buffer overflow

Sang-Hoon Choi (1):
  xhci: dbc: lock the minor IDR on registration failure

Zain Aboobacker (1):
  usb: xhci: fix typos in comments

 drivers/usb/host/xhci-dbgtty.c |   2 +
 drivers/usb/host/xhci-ring.c   | 247 ++++++++++++++++-----------------
 drivers/usb/host/xhci.c        |  27 ++--
 drivers/usb/host/xhci.h        |   5 +
 4 files changed, 145 insertions(+), 136 deletions(-)

-- 
2.43.0

