Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119763CCFCB
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 04:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790830005; cv=none; b=WPTDMysXpIBIy2K3GK5RIlkAc84S1VZjjDNO5B5O3gz58m9BMxnryi9YCUX3fulzYP9PcZAYwlQJAm6+OX9XfvfzoHdd5643hnzQG2IUbw9ubVdYBT3ZvVB9UNJrRj/cLfolIom0Ip7AjCEzSz6+53srf7HmmcvHd0BlAsvUufc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790830005; c=relaxed/simple;
	bh=AnaIvH3WHmdRhjVNmulXoc+6MzWJGNzW5eiixj7lon8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJE3O7OUKiz6QH3IZk8nw/UsV0LPwp8X7geYvI9CU0WiSbcxo2KzJAxePV1sPcv3k841ZGOlG1IOSwVJUxcpTWLJmZBST+aMipmFNCCZ3Q7SDum4qi/8AMSi0+l1XEvDmC1LWyOXtX7rmppK3vKnpBDQGiOf2ywm12vZUobbvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=auyFW09A; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auyFW09A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790830003; x=1822366003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AnaIvH3WHmdRhjVNmulXoc+6MzWJGNzW5eiixj7lon8=;
  b=auyFW09A4DFQDcyygyKrjFcMVWmrXY7JJOI8OYAOrrYBFhiLn0RXuRV8
   fwkywWOGivyhoi2P3/xcH7utK+yQE47AhhNBlQcLDisdWpjCVnmgiWN6B
   w3p7aF711kZ1aWf7VPQaI7VjC2u48M/PnCRbOHFeefTkWdR/8zI3OvT59
   gqhglYVk8lGxCo1956YvGQJlHZSq0HxsNJXxD81Aa60n1G5ZMwLTG+2Z8
   ePYRReEZ3BRt6QEjtZjII1QSJVs5thWqs96GMcg/L29kaakBo1h7p3r2E
   b7Dh2uxsKI+oJeA4tw8Yp3FbOE52k81GWN1nJax93i/fD9hakXt5wXCTv
   A==;
X-CSE-ConnectionGUID: r+cvZcw9RySB0iXBoeircA==
X-CSE-MsgGUID: uu1/PZbIQxS9L8Dvms2kTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91439434"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91439434"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 21:46:42 -0700
X-CSE-ConnectionGUID: uRwC7vkHRRqwckDFo58AEw==
X-CSE-MsgGUID: ZUBlNiosSFi/Yerrh3EPmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="276003457"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 30 Sep 2026 21:46:40 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A8A3699; Thu, 01 Oct 2026 06:46:39 +0200 (CEST)
Date: Thu, 1 Oct 2026 06:46:39 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v7.3-rc6
Message-ID: <20261001044639.GD176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit e6df180e976fd08673214bc1305a46a8536aea9a:

  Revert "thunderbolt: xdomain: Notify peers after enumeration" (2026-09-04 08:28:47 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc6

for you to fetch changes up to 395e9f2967a7ac6898026e8f136c369805dc2fd9:

  thunderbolt: Disable CL states for the Anker Prime TB5 dock (2026-09-28 11:34:48 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v7.3-rc6

This includes following USB4/Thunderbolt fixes:

  - Fix XDomain property parser to reject oversized properties
    responses.
  - Revert a quirk that causes deadlock at shutdown.
  - Fix USB4STREAM to announce FMODE_NOWAIT.
  - Add a quirk that disables CL states for Anker Prime TB5 dock to
    avoid link instability.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Daehyeon Ko (1):
      thunderbolt: Reject oversized XDomain properties responses

Kurt Lieber (1):
      thunderbolt: Disable CL states for the Anker Prime TB5 dock

Mario Limonciello (1):
      Revert "thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers"

Mika Westerberg (1):
      thunderbolt: stream: Announce support for FMODE_NOWAIT

 drivers/thunderbolt/domain.c   | 26 +-------------------------
 drivers/thunderbolt/nhi.c      | 26 --------------------------
 drivers/thunderbolt/nhi.h      | 21 ++-------------------
 drivers/thunderbolt/nhi_regs.h |  4 ----
 drivers/thunderbolt/pci.c      | 23 -----------------------
 drivers/thunderbolt/quirks.c   |  3 +++
 drivers/thunderbolt/stream.c   |  3 +++
 drivers/thunderbolt/xdomain.c  |  4 ++++
 8 files changed, 13 insertions(+), 97 deletions(-)
