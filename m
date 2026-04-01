Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928B535AC25
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775069934; cv=none; b=s3oXFg+jbu8G4QRplx3UoAqUR1GrwPzdXyITi7NMeYXqt6XKjoG3dIFI3tDKsQF6JVmJ6Ccn+pxxKqJiWnkekce2wmJecNvtlpwQAoKbRagjEWaQlVQ/1z7zAm8vnfqIv0/mjcxDJXizzVRXGIDdv130JFpbdHomLWE5Xo2rAlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775069934; c=relaxed/simple;
	bh=0kS+2FUd4NdnhaN3k6PHg1Pz1WH4rowDGLOdaQ0M8qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tdyId0oVK0qYnZjZnuj/f8tQCBC8b5dR2sa0ihx+VlQNjkSSIlhoney/cYxpRnxQG7Tb7PzqITuR4XdKHCpwXqh3KWmB1gGfvGWkjAAU4mAIYHumbC4TIHE4xVYVG3KqoX19g52ngIOn+AxQpLlmrEvonrmMdkdpnqzcRw5/yDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJtmFe4d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJtmFe4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775069934; x=1806605934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0kS+2FUd4NdnhaN3k6PHg1Pz1WH4rowDGLOdaQ0M8qM=;
  b=QJtmFe4dU/7yqO3RNqyfCj/JkUEbkMzUP08U4WjaXdVg8gk1eVWjO9zR
   YAPrzKB/R0whzToiCqqcfKQ921xrzCrrgSzZs3cHcAZmmi/nb8v2RVsGK
   Dei9SesAoKF1Fg+lnCTrt6Z8do1W2HvBdnFhc9F7auaxNlnYp3jX+coZ5
   OLkoIPdib5nbaw0V2jsz11I1sKoVwbtcMMPmcPyIYInxrez+AVAceE2yf
   RaBSl+lZ6Cja6DfKPcnUa5fH/B9i0zUxeQqWPs+EOk536QJMQZta3iea9
   q7bUVi328XmKwC8u43y5E9aW9CrOafQhZzNUrenlF3Y53sZUNUVSqJ2If
   Q==;
X-CSE-ConnectionGUID: 2TgoSI96Q/CEu7v/nIsYwQ==
X-CSE-MsgGUID: zZTFnSN1Sxuj8jNbPLdsiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79975577"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79975577"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 11:58:53 -0700
X-CSE-ConnectionGUID: 5gkUJWKARaKG/IN8SEkNhQ==
X-CSE-MsgGUID: Z+40GeSxS+WQ42yeOn8qgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226744454"
Received: from pooja-nuc9i7qnx.fm.intel.com ([10.80.169.153])
  by orviesa008.jf.intel.com with ESMTP; 01 Apr 2026 11:58:53 -0700
From: Pooja Katiyar <pooja.katiyar@intel.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan@kernel.org,
	asutosh.pathak@intel.com,
	pooja.katiyar@intel.com
Subject: [PATCH v7 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Date: Wed,  1 Apr 2026 12:00:41 -0700
Message-ID: <cover.1774994425.git.pooja.katiyar@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[Resending with linux-usb@vger.kernel.org added, previous send
 missed LKML]

This series implements support for UCSI SET PDOS command. It provides
interface to send message out data and update source or sink
capabilities PDOs on a connector over debugfs interface.

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

