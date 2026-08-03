Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED203750D7
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753858; cv=none; b=JIi08QTWz85IGt48gZ/CZFHlvPcPlsMSoye81c5iMvdk9sPXXxLaeZXlBq8MgTzc+nHin7QIVTPQu5nq2iyPmZCwxcw6aUzp3vHSAOfTUHM3vZw0k/XdrHJqRq1O1h2B6LAsoGc4lIZ9A/BdNt3i16dzP2aVjgoAm/HpTIayb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753858; c=relaxed/simple;
	bh=0BgSBKeWej1IeLvODe0mJpaFcBdCtFJAlZI/BJceZqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HXSBA3doTzh4K69Nufd/UJU3CWfm8ZBTJoMAVWizuF/oqx7fbFoVQ8i8zLP0vpS6eK75LT+mEQip0xxdzYThuspUEnckUUSx9o0x7WuXZbUfBJiOB5+zNe7swww94EE67AXb07nyJnQouNH5PrwFwG17wr9A0XVekrV2beIy8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bh0PFNj5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bh0PFNj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785753857; x=1817289857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0BgSBKeWej1IeLvODe0mJpaFcBdCtFJAlZI/BJceZqw=;
  b=bh0PFNj5yFgbQUq9LzjMoIGADdlOK94lbDsjQFgo1Y2LRQKJvuEEC9Gk
   V1oy5vfK4oPJRKPU6ZkUWtvxiSBVsbTjPPSKmP60y4iFPdChzD2aTUyz2
   Xow/F59tN3tlgC5cN/tgxsmLKFOe4q/mCgjLmX+RLboCwAH1o1Nd/Gcbg
   FXNFNd8dZu/D1LaqMN6LQU6eXIHIFxkuHu8EDzDLO2oWRD3CIozF0mSvm
   z0GVm6bPykf0POWqPkgky662sxWbLISs0vkmjDPtPBBnXaxPHF7WBRLtg
   JCTDNARsHiklXgJ2gxxE2Z0mveJ8cnCzbXR6pywMbJBFxKKVHFr0jp9B1
   w==;
X-CSE-ConnectionGUID: 9EH2Uw8HRhmxRpPbHdPJ2g==
X-CSE-MsgGUID: V/Gb7pNfRA2t0ofMz3+Fgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86369565"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86369565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 03:44:16 -0700
X-CSE-ConnectionGUID: MHWb+ROAR1mSIv/RGpAmUw==
X-CSE-MsgGUID: yOc+YgEvSTOdkPCcRuRhRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="261241455"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 03 Aug 2026 03:44:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 827AD99; Mon, 03 Aug 2026 12:44:13 +0200 (CEST)
Date: Mon, 3 Aug 2026 12:44:13 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v7.2-rc7
Message-ID: <20260803104413.GQ20844@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.2-rc7

for you to fetch changes up to 9cbc63400f7dc000adf898bbbc8208dfd93091d7:

  thunderbolt: Initialize ->domain_released completion before it is being used (2026-07-30 06:47:32 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v7.2-rc7

This includes following USB4/Thunderbolt fixes:

  - Correct DMA unmapping of USB4STREAM driver.
  - Fix indexing of bandwidth groups.
  - More bounds checking for DROM parsing.
  - Fix ICM USB4 router operation messaging.
  - Fix crash on ICM error path.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Bryam Vargas (1):
      thunderbolt: Bound the DROM dual link port number before indexing sw->ports

Mika Westerberg (1):
      thunderbolt: Initialize ->domain_released completion before it is being used

Xu Rao (3):
      thunderbolt: stream: Unmap buffers with mapped size
      thunderbolt: Fix bandwidth group reservation indexing
      thunderbolt: icm: Preserve USB4 proxy data-valid bit

 drivers/thunderbolt/eeprom.c | 9 ++++++++-
 drivers/thunderbolt/icm.c    | 2 +-
 drivers/thunderbolt/nhi.c    | 4 ++--
 drivers/thunderbolt/stream.c | 2 +-
 drivers/thunderbolt/tb.c     | 2 +-
 5 files changed, 13 insertions(+), 6 deletions(-)
