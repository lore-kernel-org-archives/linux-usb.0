Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B3C397692
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772663814; cv=none; b=blzp6vyzkcK1jNZQGFHVLCirW8Qxhlj6Q88bW5BUnpO36AnLYdvQg7nxSf52QibCBY9/10LzmB3oKHAIDu1qZLDEL/kc05EaZriNYLqtza9v6JwSMERH7ln4/X4HlE2LRj/U80ueN0aoRpVjEYhBR9XSzUQm6H8srlV9tSMBIJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772663814; c=relaxed/simple;
	bh=paAv0E/5K53TvhL84GH5FKFLlwAbkn3AE+a/N13tbFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qjBoxjPCJ5dB7mlFGzOEvFu13ZhlOO7YVlvDitAL4vXiKmFu72dcjc8Vi34sXAWBB3cyHzwdMGysvTqbB6hoqZ+sc7JuteFudl/Jukcz5U7KjS58NoM+GgIjcpNMQHExTCTcTZpajaRw/aXx7R3H0cr4GFlGMAlrSs7HxQOiG3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VB1rrzkJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VB1rrzkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772663813; x=1804199813;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=paAv0E/5K53TvhL84GH5FKFLlwAbkn3AE+a/N13tbFY=;
  b=VB1rrzkJycjeNsD6YgNdOnSOFt8zhYWzqKuEfo7MVsa7a7eDY0dqbZUY
   DeIVUQ6VhEzccizLIoLXjHo5JQkWJtjs63eIqSIkolwdZ6hdqCiCe7R5m
   rpp2b6xz8DyIgLZMqVCBrnf/TfETw0S2OR6oTwAJ6FaUz+YAbfwCfw7J1
   B4TicDVNlYxqL363I7kpeMvaTVRvsaVMmAbsr+me8G5oX30BZuIgKpb5A
   iNl6Z0CQ2mzf/2SqicXTlE+QLjWBQG3XVL5ziQ0yuZqb0zekx7T5Gz63D
   tqDSCBqRguWWT9jX67Mx2MFuml8LY/7fHwRXkvnVLWg+qzwVVUkEPkMlb
   g==;
X-CSE-ConnectionGUID: GQyG8guVQay6vojtV5PX0w==
X-CSE-MsgGUID: bEiKYyZeQ/WHBHvdPimiIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72938929"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="72938929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 14:36:52 -0800
X-CSE-ConnectionGUID: 01BxS0pSRJuRe1R7aMHsqw==
X-CSE-MsgGUID: 959NWOfGTEaCpRDmbBgbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="223148883"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.245.180])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 14:36:51 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date: Thu,  5 Mar 2026 00:36:36 +0200
Message-ID: <20260304223639.3882398-1-mathias.nyman@linux.intel.com>
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

Three small fixes sorting out a memory leak, null pointer, and interrupt
storm triggered in rarely run error paths, or in debugfs reads

Thanks
Mathias


Dayu Jiang (1):
  usb: xhci: Prevent interrupt storm on host controller error (HCE)

Mathias Nyman (1):
  xhci: Fix NULL pointer dereference when reading portli debugfs files

Zilin Guan (1):
  usb: xhci: Fix memory leak in xhci_disable_slot()

 drivers/usb/host/xhci-debugfs.c | 10 +++++++++-
 drivers/usb/host/xhci-ring.c    |  1 +
 drivers/usb/host/xhci.c         |  4 ++--
 3 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.43.0

