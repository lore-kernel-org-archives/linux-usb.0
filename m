Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E5353A892
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952337; cv=none; b=KrBsGQZtgtzGrBU8CxcZUAkVnsUjt+AkZOYahldtS/O844qAlYyYjWEtGrGbbEA0SrYNCQd4tqPg8Hm2mgpOrw/p2cfxaa6/1JwIR9LLIte9WCIu0lXhS6/CnV7vCQqATVmM1qMshXUTKYpu2g/apWtuPI7mYRUCIFgF0CDxBAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952337; c=relaxed/simple;
	bh=r9JNAl6n7b6goKy7O+1nFdP12rAqZ+XtFEqljfJePWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMONr/Lbn3LhbxecpmedL3CBywpCpN8voh7Kg7YvyL9Cy7uCpxWJLFXTqkexBKJbe5vEfLhK11Bwd3fvD4Gc7QqhIWQUyi9CyoD23V6coGzd5a4vb2HyPg16g4gL0zPfpTTGK1YavDXW5ehSshi72qPenRrmBb1avs7UQPjniw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exK5jgTM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exK5jgTM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788952333; x=1820488333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9JNAl6n7b6goKy7O+1nFdP12rAqZ+XtFEqljfJePWY=;
  b=exK5jgTMNGW1sBVO+H1iocBgsMgdP4tVqqDSQZR1PUJYP/vdTV1dAs5t
   cXemK8+H3NdLwe1lfEhVrNrOIF50CIDbaKWVYxnJXSfPCivq+URjq/Wc2
   KwOiympCtUuMBTAhlgSaicDKCgevTDbUPsspydcqNCXDgfm6qlReuNvoY
   GLVDBicnE2ZGbg7gnf69JBYeXagnBC+AQ5Alt+elr18b2PzS5sfZtROgw
   0h4SinMa/HYBxraztKOTRcUPEy2Z/MQzcmRWl+CnCk6uEP8Pvk/ErepyJ
   Tu9dZvObA3Sb3WtbiMVbuID6Dtb++fuYWuEMTmMqQ2tqpJK3eVrdFkhVC
   A==;
X-CSE-ConnectionGUID: V0J+HTdKRha9fTq3CUdHMw==
X-CSE-MsgGUID: NKYGJj/XSJ69g6iiFN0ogQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="76933659"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="76933659"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 04:12:11 -0700
X-CSE-ConnectionGUID: uk/JEB0ORseTXH3WwevtvA==
X-CSE-MsgGUID: /j5mvFJgSGG3d32+zlAwWQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 09 Sep 2026 04:12:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C3C2899; Wed, 09 Sep 2026 13:12:08 +0200 (CEST)
Date: Wed, 9 Sep 2026 13:12:08 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt fixes for v7.3-rc3
Message-ID: <20260909111208.GL106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc3

for you to fetch changes up to e6df180e976fd08673214bc1305a46a8536aea9a:

  Revert "thunderbolt: xdomain: Notify peers after enumeration" (2026-09-04 08:28:47 +0200)

----------------------------------------------------------------
thunderbolt: Fixes for v7.3-rc3

This includes following USB4/Thunderbolt fixes:

  - Fix various issues around asynchronous DisplayPort tunnel activation
    when there is no graphics driver doing doing the capability
    exchange.
  - Fix potential NULL pointer dereference when XDomain connection is
    removed.
  - Fix use-after-free when control channel request is canceled.
  - Fix lockdep false positive.
  - Revert a commit that causes XDomain properties ping-pong.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------
Fedor Pchelkin (1):
      thunderbolt: Fix NULL dereference in tb_remove_work()

Mika Westerberg (3):
      thunderbolt: Fix KASAN reported use-after-free when request is canceled
      thunderbolt: Use separate lock class for each ring
      Revert "thunderbolt: xdomain: Notify peers after enumeration"

Sven Peter (6):
      thunderbolt: Hold a router reference for each allocated HopID
      thunderbolt: Make the DP tunnel activation callback mandatory
      thunderbolt: Fix domain reference leak when DPRX read is canceled
      thunderbolt: Don't access a DP tunnel after its DPRX read was canceled
      thunderbolt: Mark discovered tunnels as active
      thunderbolt: Tear down inactive DP tunnels when the domain is stopped

 drivers/thunderbolt/ctl.c     | 63 ++++++++++++++++++-------------------
 drivers/thunderbolt/nhi.c     |  5 +++
 drivers/thunderbolt/switch.c  |  9 +++++-
 drivers/thunderbolt/tb.c      | 37 ++++++++++++++--------
 drivers/thunderbolt/test.c    | 58 +++++++++++++++++++++++++++-------
 drivers/thunderbolt/tunnel.c  | 73 ++++++++++++++++++++++++++++---------------
 drivers/thunderbolt/tunnel.h  |  8 +++--
 drivers/thunderbolt/xdomain.c |  1 -
 include/linux/thunderbolt.h   |  3 ++
 9 files changed, 170 insertions(+), 87 deletions(-)
