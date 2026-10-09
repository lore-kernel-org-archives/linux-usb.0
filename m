Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB7E43E9CB
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539935; cv=none; b=VfVSntj6AUWBMbIUDFK/UuVnJURDK9/TIvaflPzCQNCHtW5e8QJMIi4A7pSG9ykz95PehqZ8LQsJ7eyYr8YA3FwQ71usauqQTa10+9/6txLi4caP1kuoDDYxneZV4L49c2YMsAi/4Foih7OQo5/O/iWfOAZFr0+3JECnk+m8PDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539935; c=relaxed/simple;
	bh=iyTp4jq1RzOS3hHfGQb8VkRNr8VZiBtXy3FudOTwZuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lJN+Ms8dgOdCEuY47ZHusE9F91RSdvzFwyTqyGnym8xqyNKxTnMFOXOeeFGToceVZSpPlZDpdNIpkd5DBkuRQb8ylBizvSva5biB8i/8KOGIDhqQfqNubHu/rEYme/2GhHj6hU6Ef1oTsyo5/LtDBMzTEtTw2lkvy+7nQfuLdkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1cvjbBd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1cvjbBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791539933; x=1823075933;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iyTp4jq1RzOS3hHfGQb8VkRNr8VZiBtXy3FudOTwZuo=;
  b=B1cvjbBdrNT4p2tdHJTZmzlCTos3L+kcy72/jmTdpS00lDj716Nu2SD5
   m/JVtw7tJvOvxkRrIaB+nXPEHBGPPvRVB/ASBICYPfPaieMOheIh3QP2V
   W83MMq8hl10eRov8fE5PpUY2Rr1GSUs+lUdmPzEFkvHzqiQYFXKG1qVl2
   7rYXV91fkPmT+fbpl1DFlVItleOKtOAOBd2qFJnKdtT2RAT0tw4AEiA4R
   El9rfzpILvnas5J4WuO97UPu3qbeA98fxm/GTmyfS+uoWYhB9bMVU7Rfm
   hHnwOezQyyVYRJ6WjfabSDS64hhat5wNuX/izab/LLrBQIKDwoGu4cwQk
   A==;
X-CSE-ConnectionGUID: Ra0wko5WQxy1gW0IL/+YVA==
X-CSE-MsgGUID: 0QgKo/H+QTSPzZe/EDnQlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="224091"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="224091"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:58:53 -0700
X-CSE-ConnectionGUID: 8mkWnvnqSoWd/X0Zo2FdfQ==
X-CSE-MsgGUID: bH5RuTZORYqrqpkebd0aAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="613307"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 02:58:51 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/14] xhci features and fixes for usb-next
Date: Fri,  9 Oct 2026 12:58:20 +0300
Message-ID: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

xhci improvements and non-urgent fixes for usb-next.

One series by Michal to improve transfer event handling, otherwise
smaller scattered patches for dbc, early dbc, sideband and generic
xhci cleanups.

Thanks
Mathias

Fabio Estevam (1):
  usb: xhci-pci: Add TUSB73x0 definitions

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

Umang Jain (1):
  early: usb: xhci-dbc: Handle out of bounds xhci-xdbc capability

Wesley Cheng (1):
  usb: xhci: sideband: fix ring sg table for sub-page TRB segments

Zain Aboobacker (1):
  usb: xhci: fix typos in comments

 drivers/usb/early/xhci-dbc.c     |  81 +++++++++-
 drivers/usb/early/xhci-dbc.h     |   1 +
 drivers/usb/host/xhci-dbgtty.c   |   2 +
 drivers/usb/host/xhci-pci.c      |  11 +-
 drivers/usb/host/xhci-ring.c     | 247 +++++++++++++++----------------
 drivers/usb/host/xhci-sideband.c |  57 +++----
 drivers/usb/host/xhci.c          |  27 ++--
 drivers/usb/host/xhci.h          |   5 +
 8 files changed, 246 insertions(+), 185 deletions(-)

-- 
2.43.0

