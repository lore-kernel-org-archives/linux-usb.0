Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221EA3C3432
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167115; cv=none; b=i3Zw3jLWyA+Z0n5miPpz2pAUvdwzIwNjTB81rXKUqTMwgxcZxFuwu+x/shrx49lISTcpPfGJTczQj6jr+/ODjEc2Fjd5o1wyj2khCEpdfMb4+yeR3jU8YyVa1hltouLNvwPX1+TTLaKGj4GmAj6ICHjxnpdnlMXG4/KDQcmJIaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167115; c=relaxed/simple;
	bh=tf2FXPoDovNy0iaaOBjxz9zzYyDO0c9q8q6UUk0q0Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O9EZhNRC3k87nUfdSNulTcluDYvq3z7PgooAAigolpyCwbV/NnPIjFa3ff96iS14xYw/TGDDHPJAmLPLzQNHgxGuy+D1j4xu4X/Ghrli8vtRm1N7ca5suIxwRy8YqrXOQzjVbWD5wOdkodR/B1IHgOzhtm2ZZRtzaHesxS1aVrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJ55sPID; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJ55sPID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788167115; x=1819703115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tf2FXPoDovNy0iaaOBjxz9zzYyDO0c9q8q6UUk0q0Pw=;
  b=gJ55sPIDlNA41YaX9VvFeq6qrFjLV0BLcuzOVsveVV/UK/4YhML8aDJ0
   yOJjM4nXuojr3phfBNixfigrGfiRPOcy24AaFODevWx9QtkyoNE7/YRYz
   vWO3Ugl3beFhrqPowrSFJAgzpoWIWGAkYSncTnDAkleanEZdIDk/2Zi+I
   GjUSkMSdC3n+W/RITiI7psizcf446dRl+CO/j4EGtjxIfvCedSD0v9dFS
   NeWP+v3YU2X0ddwg82Php7rlw6F55DmWH/fvQv/Lj40rbekYjqG8gyATb
   gwKdvzvZKzcmzYJiQifxtG1vsGrbHQ33/6C8zFAMK+5NWarP6CM18IKtq
   w==;
X-CSE-ConnectionGUID: kFB/1Qi2RMyh0gRXnBXyDg==
X-CSE-MsgGUID: aCxTqv7IS3aWPFR3+5NImA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="105944712"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="105944712"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:05:14 -0700
X-CSE-ConnectionGUID: JpgRNqjCSTmQI8vwAnY3pQ==
X-CSE-MsgGUID: wjszMCQdTNSwwTIv7VFBhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266941542"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.13])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:05:13 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date: Mon, 31 Aug 2026 12:04:45 +0300
Message-ID: <20260831090448.95644-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

xhci fixes for usb-linus on top of v7.3-rc1

kernel v7.3-rc1 has a xhci regression reported by several users making
xhci unusable for them. So far at least QEMU and Mediatek MT8173
users are affected.

The patch by Chen-Yu Tsai addresses this.

The two other patches are also nice to have.

Thanks
Mathias

Arthur Gautier (1):
  xhci: fix lost bounce buffers on TDs spanning several ring segments

Chen-Yu Tsai (1):
  usb: xhci: Fix HCS_ERST_MAX conversion

Michal Pecio (1):
  usb: xhci: Fix isochronous scheduling regression

 drivers/usb/host/xhci-mem.c  |  2 +-
 drivers/usb/host/xhci-ring.c | 43 +++++++++++++++++++++++++++---------
 2 files changed, 33 insertions(+), 12 deletions(-)

-- 
2.43.0

