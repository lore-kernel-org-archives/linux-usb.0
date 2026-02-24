Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BEB30ACE6
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771916517; cv=none; b=nzuOfk8bC8XFiRAnLCzx7ou9Ii08Fp8ISVzMF2wlGrlJyPMBHsOyljEugd3pGOwLKBYB4c5tWPa6GKv6G/BUVedetElos0qemdekKfQcoOybHG9vglOcW9Y2rmDfAo0Sb7trTkwixq0ipImT29rO9yYqlGkNf30+JRFPEyAS6I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771916517; c=relaxed/simple;
	bh=OK/6qDvX3VbI4iiB3hsRjXZNgdaOQwtRHeYQ4xN7fvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxuczXukqvt7sABAW8rX7EpwjrcDL7vlygGfyabUDwCPVEv8+FZCSTKYlefOcHc/GVJ9NgY+twxCpURcp4UZxjVTFoTerLu36laKtwFI9lRseY7MPlXKKYHQvnB+BGrulXxgUvhpnVpZ9LSMm45MmUDQTPNFC3XmY9rV092b0GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHOaY1D3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHOaY1D3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771916517; x=1803452517;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OK/6qDvX3VbI4iiB3hsRjXZNgdaOQwtRHeYQ4xN7fvM=;
  b=QHOaY1D3V3a+5WhZ4nBJZqjCqJ3UuSit3wRJpVOK/TTNKGkRjZ875dEd
   fcsTZPYpBG01tQrZS6gVHyKWwDpOoUk0UNrDLZvtmr6pg0IRrPRORDVPo
   A7ViXDs1+WauaXlFMtNrlt94GtP7o2WeppMvWzLIg9hxxXZR+Ti7Cn6ZK
   c1Y1Xh8VPdjgxRkt2Pd8boWfW23YBU4SniuOQQtu6aciWJXcNTRX71cGA
   sK5/kTCPY31KHueGl88rx1NAw7H+BPKzauoVwIYMjVVlVMZa4tTbcrIvw
   0z35HZgb6voCxVta8o4L8IOpiSUg5r5192mCY9U1bdxJmCgA+rjuH2LGF
   g==;
X-CSE-ConnectionGUID: /KQcbJo6QqSqz8Esvq9Wjw==
X-CSE-MsgGUID: QstGZSmLTbGj+B2EMfIeaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72627995"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72627995"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 23:01:54 -0800
X-CSE-ConnectionGUID: 9VPa4xb/SBKAan6Ay3nDyw==
X-CSE-MsgGUID: mwUG2ZZuSpuSoQU1eXObRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="219313082"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 23 Feb 2026 23:01:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 86C8895; Tue, 24 Feb 2026 08:01:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/2] thunderbolt: Disable CL states on older Titan Ridge firmware
Date: Tue, 24 Feb 2026 08:01:48 +0100
Message-ID: <20260224070150.3320641-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

There is known issue on Titan Ridge with older firmware that makes the link
unstable if CL states are enabled. This series adds a quirk that disables
them for older NVM firmware.

Rene Sapiens (2):
  thunderbolt: Read router NVM version before applying quirks
  thunderbolt: Disable CLx on Titan Ridge-based devices with old firmware

 drivers/thunderbolt/quirks.c |  7 +++++++
 drivers/thunderbolt/switch.c | 30 ++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.50.1

