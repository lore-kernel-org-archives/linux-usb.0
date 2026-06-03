Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6237C907
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477913; cv=none; b=tIrFCiKa1wwAaQ4mmxfP0rjAEfFS0K3B273mXVO5YxlapTnTBs4XErVOuyfqoZ5vA26JmQN7jRc4/YfcSY9NWuTOoP6dEVLbXIFnKDdG5l2zzxGswKpL+96sJkpg9Y5H9iPSwmDKV6q/WWcqULIK9h5ELBoYpc1NtksuQR+wBkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477913; c=relaxed/simple;
	bh=yqZ8W8wjEwAendyyeDQpN0HGaQNJoxZiy9yfKsRgvPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PYibU1BVOk2r0pvOOgA1d3rV+kcWdSBof7Hjbsly+Qa7AYKJRjlI+AjuhqpZHZ2nBHtTUlfApV9yb+sI95Is8YRJJIg6kNR4MCWeYuoVRxwy6kgrcW0HLr3FJ8dnShkzOnYyB6Wf1VyLZ02nULEuk+GugF8SLp6jlqtynLpvZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pjfsj9ca; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pjfsj9ca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477912; x=1812013912;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yqZ8W8wjEwAendyyeDQpN0HGaQNJoxZiy9yfKsRgvPE=;
  b=Pjfsj9caeJV/oeHAFQUS3tg4iOMGLQ30Iyxutq3QwUxMIp0GZI3Yn/nt
   67bLhODELkGErOAQz5T8BH05RuPpgVUkLIrUTzTCpN1D0C/jxVQQ4ScYL
   O6vHUEwAoc0QzpKHOy9PRC4g0wRjlPhHQBbej3ee9RXuG34h6CbuMxP6u
   br4btd5kkktfUGZ5K39J8paALI/F+/VkYuTZqYrDARQR/q9iMlGxvdBfh
   zJOfy8dgExqjGyGCznKhXmh0O5dts9hReWITjT4cu4PCOtuADjsMLSxLy
   xHgRlGeQSMgzoDewXY1LPHTGxUWLb9KUwNzM3y3YgHJGGYU2e9WndgAin
   Q==;
X-CSE-ConnectionGUID: EK0/vRaZSuSr6M1Xdl4Ubw==
X-CSE-MsgGUID: SE4kZVQ/SNGz3rl8FaCMSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657512"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657512"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:51 -0700
X-CSE-ConnectionGUID: oMgF54uHQEmmHP/k0BvNXg==
X-CSE-MsgGUID: ZPV3RvJxSJaoI/nYXM8L+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281764"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:49 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/15] xhci features for usb-next
Date: Wed,  3 Jun 2026 12:11:17 +0300
Message-ID: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg

xhci features for usb-next with generic improvements, cleanups,
refactoring and some DbC hung state detection and recovery

Mathias Nyman (6):
  xhci: dbc: Fix sysfs ABI Documentation for xhci dbc states
  xhci: dbc: serialize enabling and disabling dbc
  xhci: dbc: add helper to set and clear DbC DCE enable bit
  xhci: dbc: add timestamps to DbC state changes in a new helper.
  xhci: dbc: detect and recover hung DbC during enumeraton
  xhci: Prevent queuing new commands if xhci is inaccessible

Michal Pecio (4):
  usb: xhci: Simplify xhci_quiesce()
  usb: xhci: Remove skip_isoc_td()
  usb: xhci: Remove isochronous URB_SHORT_NOT_OK handling
  usb: xhci: Improve Soft Retries after short transfers

Niklas Neronin (4):
  usb: xhci: remove legacy 'num_trbs_free' tracking
  usb: xhci: refactor DCBAA struct
  usb: xhci: allocate DCBAA based on host controller max slots
  usb: xhci: allocate internal DCBAA mirror dynamically

Stepan Ionichev (1):
  usb: xhci: fix typo in xhci_set_port_power() comment

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |   2 +-
 drivers/usb/host/xhci-dbgcap.c                | 144 ++++++++++++------
 drivers/usb/host/xhci-dbgcap.h                |   3 +
 drivers/usb/host/xhci-hub.c                   |   2 +-
 drivers/usb/host/xhci-mem.c                   |  60 ++++----
 drivers/usb/host/xhci-ring.c                  |  53 +++----
 drivers/usb/host/xhci.c                       |  23 ++-
 drivers/usb/host/xhci.h                       |  29 ++--
 8 files changed, 177 insertions(+), 139 deletions(-)

-- 
2.43.0

