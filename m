Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66937434E21
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635079; cv=none; b=Ms1nwkOB5h94zP+oGg1E/9aTAPZXva58QyuaqbGZoGD0ie44HDUasKWo3OqhoSBviVyoE59UhceTLui1J2/xHWa3C2KEr53mSc9JLbsY+mRTen5aHzv69Nj8OPBxoulI0VWCCRTyV34zbBIaBzwqp1yR42/9GieVgB1McFVzBQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635079; c=relaxed/simple;
	bh=QJEoE79tWdK/CGWfeE+LKsW1edUv7GEPwNFcaMhzuEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WHBPz/k4pyfXf7ijipbvBQvfrHYIRVERI6e4WRWx2fm5rMK2a43MpxAZcE8CdAvz5Y5atTwKFdVw088gEvh5E+Qns2PyCZ0Cxu5QfvvoDUgp+xs+YnMW1jaWYXJBemEUsEd7zjX692FHFpTvaqX/9hZrWPHl11LGUcCGeAkB6ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZM1Gy5J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZM1Gy5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789635076; x=1821171076;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QJEoE79tWdK/CGWfeE+LKsW1edUv7GEPwNFcaMhzuEU=;
  b=PZM1Gy5J4HPE3gCmx3Oj8a8fatQa0unyQ8pdLeueQhOljnAJinnN8TrG
   GUrdspalrFj7QufDfQlPdp8n2aYP4Z1452YyASuYDKzOiQlIjgD/iu1eo
   yqrb2zoO6G35P4ljiz6tZAVu11YrfScu5hTreq9nlSpZKnDIszlmyc99a
   Kz9XpCpSzD3pTUasX5yTR5HQCLKlbC/4hnQp44rxQUnqc7roQJdx40LGh
   5oF+b3XVfCQuQ4t2RcwzvJBLGIHHfWbU0Lo7A7km6zQQSJoNxD4nY6hcs
   4VJdxfk8cJD2W4rT8j/ICoOv0qmCJzUhOIVMRcuMM/AdqEz2JDjVR6INA
   g==;
X-CSE-ConnectionGUID: J8rqq7iISMG+Tt+t4MQMYg==
X-CSE-MsgGUID: 14Lg3lT3RtKhYlEqak+N/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90052607"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90052607"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:51:09 -0700
X-CSE-ConnectionGUID: 8MxxO6wTQ3+17Ec5G6SDvA==
X-CSE-MsgGUID: 9yIS1kIRSm2m3OeNjLtg0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270369679"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 17 Sep 2026 01:51:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 16EA09B; Thu, 17 Sep 2026 10:51:07 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Anurag <anurag@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/5] thunderbolt: Add support for extended error counters
Date: Thu, 17 Sep 2026 10:51:02 +0200
Message-ID: <20260917085107.1022445-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

USB4 v2 introduced extended error counters for lane margining. Compared to
the USB4 v1 these are 16-bit (vs. 4-bit in v1). This series makes them
available for debugfs software lane margining.

Anurag (3):
  thunderbolt: Make software margining error counter configurable
  thunderbolt: Fix sideband register access in usb4_port_sw_margin_errors()
  thunderbolt: Extract per-lane extended error counters in software margining

Rene Sapiens (2):
  thunderbolt: Define number of dwords for hardware margining results
  thunderbolt: Add extended error counter support for software lane margining

 drivers/thunderbolt/debugfs.c | 126 +++++++++++++++++++++++++++-------
 drivers/thunderbolt/sb_regs.h |   2 +
 drivers/thunderbolt/tb.h      |   2 +-
 drivers/thunderbolt/usb4.c    |  10 ++-
 4 files changed, 113 insertions(+), 27 deletions(-)

-- 
2.50.1

