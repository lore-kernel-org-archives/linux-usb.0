Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD8E31AA9B
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216215; cv=none; b=cd8vINQCpNeyJSKC4m6eo2410rBm4D9bMNvCCtlJuBPLoGMvqRKbTlozs4j1SMDt/Nymb2RnVunLQV6IkH1xEmRPhOVZp2oca1C6qQDrlenrebVUdRB/oEcypwFhmzrHeGCcvg6VLvRDA3PzGdgytHF5JFLSy5NjNU1QI5SPxRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216215; c=relaxed/simple;
	bh=JTTNAvhgs9kj/J4KYbo9JLwQMm1WjtYwsJiTk37d8Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OtLJQTylCvlAKUd11Qqj1Rg44b2+xZDxiK1X8/0mqqylvjpFqKu5VT+947jFTHsAfTpkNI2Rk6ri29SbeGsNtPLCgFNCDZc0KUYpBEMnJ+Qr9xjl9cFtXGGrw8Jd0uhOJnJBrtlVQAqn+4b/rKKzxtxzHqUpGALwmRVV5nl/Sh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3YOCveh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3YOCveh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779216214; x=1810752214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JTTNAvhgs9kj/J4KYbo9JLwQMm1WjtYwsJiTk37d8Pc=;
  b=Z3YOCveh05xnsZ5DcX84SDtK1IDbEPXbjr4zQn98utcc1XWNzz/jN66N
   b54rK4p5XCiV4UffzHkuY9Mp4me7Tr29rVrpuX5BwPoNGAdYHW73nsVCX
   1x4LvvS3P8CfhY5pngkebpq4V/neKrvbGuwUJeSSh/gOlXIm7zNyxuaBK
   fNSgY6O/cvXAAl3XPjWJVmG8tlOMJ9SRptdtbEW5ExN3B7YiOqQ4nWs+J
   Hsw9lbdKFs+Noj6MJlGtYkkmYHF23avA3x7C9erFOvHvPMOsaf0m1OiR1
   aMZF6IvGBwuSYwCVy/FEaAst417/ZfvNaqqjoKs0wl+Bmy/zRu4MnnXO5
   g==;
X-CSE-ConnectionGUID: 2ZhcZGrbS1i3IITVivkqWA==
X-CSE-MsgGUID: pL/XIJiZSqmGj3gpaOar9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102783835"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102783835"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 11:43:34 -0700
X-CSE-ConnectionGUID: 1YNnqKNcTKqdEwGz505qkA==
X-CSE-MsgGUID: nw89qX6kQNOsrQXa/CdvSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263633783"
Received: from pooja-nuc9i7qnx.fm.intel.com ([10.80.169.153])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2026 11:43:33 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	heikki.krogerus@linux.intel.com,
	Pooja Katiyar <pooja.katiyar@intel.com>
Subject: [PATCH v8 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Tue, 19 May 2026 11:45:11 -0700
Message-ID: <cover.1778798352.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements support for UCSI SET PDOS command. It provides
interface to send message out data and update source or sink
capabilities PDOs on a connector over debugfs interface.

Changelog v8:
- Rebase onto v7.1-rc3

Pooja Katiyar (3):
  usb: typec: ucsi: Add support for message_out data structure
  usb: typec: ucsi: Enable debugfs for message_out data structure
  usb: typec: ucsi: Add support for SET_PDOS command

 drivers/usb/typec/ucsi/cros_ec_ucsi.c   |  6 ++-
 drivers/usb/typec/ucsi/debugfs.c        | 31 +++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c           | 52 ++++++++++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h           | 20 +++++++++-
 drivers/usb/typec/ucsi/ucsi_acpi.c      | 22 ++++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |  6 ++-
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  6 ++-
 7 files changed, 123 insertions(+), 20 deletions(-)

-- 
2.43.0

