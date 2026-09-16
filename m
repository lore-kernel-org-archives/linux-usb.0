Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDCF509EFA
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 14:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568140; cv=none; b=VHBg6xlY2Jbhxka+F79b2eyshlKEVsn7pk6VFnDaafzGVqyaMyjKeB0QFcTGScoaodgNoruQ0u/Q+r3uSrneck4NNyvTQRWiRW51l3WEo0yZsfdKHrWyoG1ex+cBZA9HjbUhwQBOaFoqhMChLpe2b9x2h5ZBkNPOxCmqMF8w52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568140; c=relaxed/simple;
	bh=7if2FqvRucrgwXBgYyfQTVvEm38pAnjvHw/skMGlrpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZvNZxNKVbfjzyu+SdfBJspyc7CAFzbA5yq8dGcoopEooa90emnuT6xBYzXcqTkam3rdP/3tp1KRLxxDaylj7dQPRI1oidiXnhJYauRRy0UeRGt2WsxGM6PTlQ4ZlobgbkVRpIFUCyPkcm9neb8hCICqB1Ues7JKZD0eN8aoFmGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzWLwkyE; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzWLwkyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568138; x=1821104138;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7if2FqvRucrgwXBgYyfQTVvEm38pAnjvHw/skMGlrpg=;
  b=KzWLwkyEfppG5A9n+k4027cs1Zlg6TedCznd0kSAnuI70gHc7s02qbFu
   WUjwNuF3nGilm1Kbnz4utDMgPaGrmatgWH6Wg9afS49DMl4etOU9qZVoP
   APdgYa6ZiD4vyOg2qWbWYIlM7I+9CCsO6NAiN2/67Z0D3Y/P6vOY2TaHh
   w7gY+O0LDATSRQFYsnA1RP6UAvt3HXs/F3xSm4/pgvtmITsZYXEbbKWNJ
   rE1pRGYlpayfRQy7F6xNUcC0DMyqI4uQ07RUVU4cwt3TVLNoRybG/bu6q
   /gR6usw//Vh8kOHsbE//obiTrSEmZuRFxzOgx8f1xR9+pSuwaI0W4vhJH
   g==;
X-CSE-ConnectionGUID: X9aseMMUSi2MqDIgLa6Exw==
X-CSE-MsgGUID: 2H13kyjvR9SAc4WuVrMfFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="449889"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="449889"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:15:37 -0700
X-CSE-ConnectionGUID: +lyllg+LTamMw5Gyxjnq0Q==
X-CSE-MsgGUID: 5+DZ+W7SSOyf2d4vnKG2Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296838622"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 16 Sep 2026 07:15:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 0252999; Wed, 16 Sep 2026 16:15:36 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH v2 00/20] usb: xhci: rework xHCI Port macros
Date: Wed, 16 Sep 2026 16:13:49 +0200
Message-ID: <20260916141409.629621-1-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework xhci-port.h to standardize how USB Port register macros are
defined and used.

Field macros are restricted to describing bit masks only, while the common
FIELD_* helpers are used to extract, set, and update field values.
This removes custom helpers and consolidates bitfield handling into a
single, well-established mechanism.

Other changes include:
- Renaming macros to follow the xHCI specification.
- Relocating USB Port macros to xhci-port.h
- Updating bit field comments and format.
- Adding missing bits/macros.

Why are there 20 patches when many make similar changes?
  The series is intentionally split to make review easier by keeping each
  patch focused and manageable. If preferred, the patches can be combined
  after review.

Niklas Neronin (20):
  usb: xhci: replace bit shifts with the BIT() macro in xhci-port.h
  usb: xhci: rework Port Speed macros
  usb: xhci: rework Port Link State macros
  usb: xhci: replace old Port macro prefix
  usb: xhci: rework Port Indicator Control macro
  usb: xhci: rework USB3 PORTPMSC macros
  usb: xhci: rework USB2 PORTPMSC macros
  usb: xhci: rework USB3 PORTLI macros
  usb: xhci: rework USB2 PORTLI macros
  usb: xhci: document USB3 PORTHLPMC register layout
  usb: xhci: rework USB2 PORTHLPMC macros
  usb: xhci: update port register bitfield comments for consistency
  usb: xhci: rename port register macros to xHCI spec abbreviations
  usb: xhci: replace magic numbers with Port macros
  usb: xhci: update PORTSC aggregate macros
  usb: xhci: consolidate PORTSC RW1CS bit macros
  usb: xhci: relocate all port register macros to xhci-port.h
  usb: xhci: preserve RW bits in xhci_port_state_to_neutral()
  usb: xhci: improve xhci_port_missing_cas_quirk()
  usb: xhci: use neutral helper when resuming ports

 drivers/usb/dwc3/host.c         |   2 +-
 drivers/usb/early/xhci-dbc.c    |   4 +-
 drivers/usb/host/xhci-debugfs.c |  23 +--
 drivers/usb/host/xhci-hub.c     | 301 ++++++++++++++------------------
 drivers/usb/host/xhci-pci.c     |   4 +-
 drivers/usb/host/xhci-port.h    | 299 +++++++++++++++++--------------
 drivers/usb/host/xhci-ring.c    |  25 ++-
 drivers/usb/host/xhci-tegra.c   |  23 +--
 drivers/usb/host/xhci.c         |  30 ++--
 drivers/usb/host/xhci.h         |  65 ++++---
 10 files changed, 396 insertions(+), 380 deletions(-)

-- 
2.50.1

