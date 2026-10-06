Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F58A3B961F
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 12:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791289249; cv=none; b=HgSRmtfM6G2tQeY5+1HeVseTrwuUqy1P0tRc0WrIuSQ8O9MBFXMWU82GULlzf5L5qBJEjCy4cykpHC13wKrMfQMxI5EjZbzf3CXiHoyiwJjFdyT2SFR2VtbHfn+SzE9AEQKcddArjVqlMrSNTGa8BTIaI3tWDeODb2Ewd5Wgq1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791289249; c=relaxed/simple;
	bh=vdUmccOSaqIY1zySst89RaBYA4d81D+Sz2IJwFkeFZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AS169WcL2lCxFdhE3Ox1M1yg/4aPqOwHrTS3DqmCphNqQ5RruT6DepZQICIKm3NmzrA9XdZFFot8r1JFeys3v7ocSwoGHarzghdtTeTaVc1XVKfLVYryv8G6yTW5k5z93o3iwQ0m0+vZraH64+oZazoNhx86NMnRKETAvFSOK/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTBaFCNa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTBaFCNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791289247; x=1822825247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vdUmccOSaqIY1zySst89RaBYA4d81D+Sz2IJwFkeFZ0=;
  b=QTBaFCNa1zPWzlccY3z+/I/Up1N2TL5gcrXmRSnw5gNTJVQiFMxj4Q52
   Z16lkjXjT5Ldc3OK8D1Bsm/hFgOd4tE7Q7wDDSI6eXNx6Hh3mU4i1IJBw
   mMrJ1nJFKZiq7JEEXQm7qCmz+0+y++q6os35Py4mrZVFQFDPsnqBvJ1/R
   1dVPIvRQGIq3prjWUtygjaoaT62oXWRkVlElvvqOMhIflgVj/ni0g/WA1
   Jq2XsB11c1VUar18QIgv9/04Qkkbmt18cEEfne0pzFPFskv8mrx6wrMiu
   kLTwP7/mqeCNXB+sLQPoPkEhN9tMZLvbgc0HYhSispIruxs9vCRjmTUqa
   Q==;
X-CSE-ConnectionGUID: DTY9vb0fR0OGLz8Yl/brwA==
X-CSE-MsgGUID: N0Zu40DTQ02C4XS+kcT7og==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="117493861"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="117493861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:20:46 -0700
X-CSE-ConnectionGUID: H1+y6Cx/TuOBv3jnF8lSzQ==
X-CSE-MsgGUID: AyjKrwxrSr6u1pWMvjAfbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276256858"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 06 Oct 2026 05:20:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AA0EA99; Tue, 06 Oct 2026 14:20:43 +0200 (CEST)
Date: Tue, 6 Oct 2026 14:20:43 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v7.4 merge window
Message-ID: <20261006122043.GQ176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

[I'm sending this one early due to an upcoming vacation.]

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.4-rc1

for you to fetch changes up to a93a8e3200002f0c345fec4c340390e9a60aabc7:

  thunderbolt: stream: Make read return framing error to the userspace (2026-09-24 06:46:06 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v7.4 merge window

This includes following USB4/Thunderbolt changes for the v7.4 merge
window:

  - Add quirk for ASMedia controller.
  - Add device links for Apple machines with Intel Ice Lake and Titan
    Ridge controllers.
  - Thunderbolt networking improvements.
  - USB4STREAM improvements.
  - Add support for extended error counters.
  - Minor fixes and cleanups.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Anurag (3):
      thunderbolt: Make software margining error counter configurable
      thunderbolt: Fix sideband register access in usb4_port_sw_margin_errors()
      thunderbolt: Extract per-lane extended error counters in software margining

Atharva Tiwari (3):
      thunderbolt: Move tb_apple_add_links() to pci.c
      thunderbolt: Add device links for Apple machines with Titan Ridge
      thunderbolt: Add device links for Apple systems with Ice Lake

Fan Ye (1):
      thunderbolt: Stop waiting on a path pending bit that never clears

Haotian Zhang (1):
      thunderbolt: dma_test: Tear down DMA paths before stopping the rings

Hemanth Selam (1):
      thunderbolt: Fix typo "forwared" in comment

Mika Westerberg (12):
      thunderbolt: Allow batching of descriptors
      net: thunderbolt: Update ring indices only after all frames are queued
      thunderbolt: Do not WARN about already disabled interrupt on polled rings
      thunderbolt: Clean up ring interrupt register indexing
      thunderbolt: Use shadow copy for ring interrupt mask
      thunderbolt: stream: Use polling with RX ring
      thunderbolt: Write descriptors in tb_ring_poll()
      thunderbolt: Add tb_ring_poll_pending()
      thunderbolt: stream: Do not hold the lock while busy polling
      thunderbolt: stream: Check the Rx ring before task starts sleeping
      thunderbolt: stream: Improve CLOSE handling on write side
      thunderbolt: stream: Make read return framing error to the userspace

Pengpeng Hou (1):
      thunderbolt: Require complete DROM entry headers

Rene Sapiens (2):
      thunderbolt: Define number of dwords for hardware margining results
      thunderbolt: Add extended error counter support for software lane margining

 drivers/net/thunderbolt/main.c |   6 +-
 drivers/thunderbolt/debugfs.c  | 126 ++++++++++++++----
 drivers/thunderbolt/dma_test.c |  10 +-
 drivers/thunderbolt/eeprom.c   |  23 +++-
 drivers/thunderbolt/nhi.c      | 222 +++++++++++++++++++++++---------
 drivers/thunderbolt/nhi.h      |   2 +
 drivers/thunderbolt/path.c     |   2 +-
 drivers/thunderbolt/pci.c      | 113 ++++++++++++++++
 drivers/thunderbolt/quirks.c   |  18 +++
 drivers/thunderbolt/sb_regs.h  |   2 +
 drivers/thunderbolt/stream.c   | 285 +++++++++++++++++++++++++++++++----------
 drivers/thunderbolt/switch.c   |   4 +
 drivers/thunderbolt/tb.c       |  78 -----------
 drivers/thunderbolt/tb.h       |   5 +-
 drivers/thunderbolt/usb4.c     |  10 +-
 include/linux/thunderbolt.h    |  47 ++++++-
 16 files changed, 702 insertions(+), 251 deletions(-)
