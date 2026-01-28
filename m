Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01F1C6B4
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606157; cv=none; b=MXV5Qrr8nv1fPG7KoeBn6jG56Zl7sLrOc8pJxSfKjTjh/USle7TQSPVNa5gp7FsZCKJNEOAEcrxk775+aU9g+hOaf4q5aeeS2j8BuuQ1Qu35KD7WguXEaUYkBKnjlsDcFqn3eNFkt324Nq7arT97YoBaWZcYiqUYZtaU+TaqyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606157; c=relaxed/simple;
	bh=s7/YvYEC+CDv0O7yb/gVB2UStaRnfhT/+o2cvCdCyZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuN8eGPZtc/uD1aNfFWSkw3w8lwfWltxWzPuTZt0sSb8aeJn6SN3jtxsYqQjTY+Nv7A5GWVpy+B3vp2UlhhaQayjoP02aq/aRpugfiB9NGxMg6CgA8/hhIt+N2p7GlaRBWMnL2UKisfDHHRoEugejzRyS9yr7/4kiVrA3uAG/8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmySARuv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmySARuv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606157; x=1801142157;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s7/YvYEC+CDv0O7yb/gVB2UStaRnfhT/+o2cvCdCyZk=;
  b=NmySARuvaEGxexykGumXo8czDDif2gSa5qulMkaYHM15jwoG1OFCVtDB
   E7VSWh+rF0SEEp4GAn2YVs2/ZFu0KKG9YlhkoY68aSLadPBUbSUEpNQxX
   dLkWrS2YGy90TEHrdqAC6/Vd3s6BDe190u3XRXFDdKDr8odbLfxi/WD7L
   DSr/qEaTwfNpk9vro7crOQRQ+YbEc4QSVsoXqoO6Mc6xxxO+NAGicSmpq
   BA/WzIcYA04w0aYyxE+0VEe66BMPPhGYbsYddf9ijQ6QKJSz9edMKee8M
   Z7GTY274z/GPDaMR5HAZH7wEHkCr7OV7+vO8dhIxzNlJz0M80Cbl2tY9h
   A==;
X-CSE-ConnectionGUID: e4jBKHIaQeyGpV/8SZ7RcA==
X-CSE-MsgGUID: DxQg+LWxRdOjJNGyYt/iPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70981629"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70981629"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:15:56 -0800
X-CSE-ConnectionGUID: TdZu0SP7T2iWaRx63fasqQ==
X-CSE-MsgGUID: kbtkoHuES4Kcbq5KMJp0Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="213240592"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 28 Jan 2026 05:15:55 -0800
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id E172F98; Wed, 28 Jan 2026 14:15:53 +0100 (CET)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 0/2] usb: xhci: simplify interrupter handling
Date: Wed, 28 Jan 2026 14:15:02 +0100
Message-ID: <20260128131504.124322-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the interrupter type explicit in the driver, simplifying the code
paths and clarifying intent. These changes make it easier to add support
for secondary interrupters.

No functional changes are introduced; behavior remains the same.

Niklas Neronin (2):
  usb: xhci: move Primary Interrupter IMODI setup
  usb: xhci: add interrupter type

 drivers/usb/host/xhci-sideband.c | 1 +
 drivers/usb/host/xhci.c          | 9 +++++++--
 drivers/usb/host/xhci.h          | 8 ++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.50.1

