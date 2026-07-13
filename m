Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B6533F58E
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939717; cv=none; b=ETTHG+BFgCpRlP7mf99kZuKT0bW8E9Lqzjdt8DYcn63l1ceYKnEFs4dnqlK3dcckEX2pqyCDLbUX2byMhm+sRCDPw0Fl6EYPJCBQ3JZuRdqnhvEs3T8yWn77Vrt++m/+z0Wdtr6zy2GxGW6477/sYhzVtz5LTpeEZxTnPTJ3Tck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939717; c=relaxed/simple;
	bh=46glTv9hB18vLvfKee/7idUPk7Web0iiiYEwVKvQMYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZB8O49AFlL9HGJCuY72FmFzGgpMdM0o3jfNGzGtrTIVpuwMMeI/9wR4th9HYQwHsPCfG83d+jmrTYQbh11kprp2N9WGwVnSu/3qHS6+sMBkzhUWqdvMMzqwn+88qy+UyEk2E6V2kWta+JxkmX2rQzLbO5hAHv7xfa97ihcMYAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFT1XsEm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFT1XsEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939715; x=1815475715;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=46glTv9hB18vLvfKee/7idUPk7Web0iiiYEwVKvQMYA=;
  b=TFT1XsEmMZOJPZJTk5MuRSG5+UfhlCk+Mfy8rq0nk4QMoOpVXJ8oWWEm
   Rtue6ofl/uszFhjoR0A0LFfO94SELM8/yd8N4glC4lYb0XKcyrgLXZ58Q
   v3ZhrSvdmL+vqSV85aF/dZyXs0mWj8nEIBZ9FyuF2uroxj2evNsCdjUrN
   8Zeo8QS5Ha5PZP8nFXA0a6jT1MUC0LTxUXUBi4G4A3FufYbpmZVUFQ5lV
   +8oly5CTuJCHAB6KeHsBHEoTzQLnHjTSHbdFkF9eimP4UHoj7hQAJ2FTB
   GaESw9r9SbXdK19eNTT8Zb/7716RfDszHcJf7V3GgGdX6gpPe+5Uu2js/
   g==;
X-CSE-ConnectionGUID: PmnBmTtBQ/WKQLT1JQjKTw==
X-CSE-MsgGUID: uZOeVRScTCiffl87GWO6AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96056999"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96056999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:33 -0700
X-CSE-ConnectionGUID: A1xLmkvLTf2axuQmJDRXBw==
X-CSE-MsgGUID: /WZ608pwSWW6isRUQmoLYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928966"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 5B38895; Mon, 13 Jul 2026 12:48:31 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 00/22] usb: xhci: rework xHCI Port macros
Date: Mon, 13 Jul 2026 12:47:14 +0200
Message-ID: <20260713104738.629612-1-niklas.neronin@linux.intel.com>
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
- Adding missing bit/macros.

Why are there 22 patches when many make similar changes?
  The series is intentionally split to make review easier by keeping each
  patch focused and manageable. If preferred, the patches can be combined
  after review without issues.

Niklas Neronin (22):
  usb: xhci: replace bit shifts with the BIT() macro in xhci-port.h
  usb: xhci: rework Port Speed macros
  usb: xhci: rework Port Link State macros
  usb: xhci: rework Port Indicator Control macro
  usb: xhci: rework USB3 PORTPMSC macros
  usb: xhci: rework USB2 PORTPMSC macros
  usb: xhci: rework USB3 PORTLI macros
  usb: xhci: rework USB2 PORTLI macros
  usb: xhci: rework USB3 PORTHLPMC macros
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
  usb: xhci: remove redundant PORTSC ops in xhci_hub_control()
  usb: xhci: move struct 'xhci_port' specific macro
  usb: xhci: rename 'temp' PORTSC variables to 'portcs'

 drivers/usb/dwc3/host.c         |   2 +-
 drivers/usb/early/xhci-dbc.c    |   4 +-
 drivers/usb/host/xhci-debugfs.c |  24 ++-
 drivers/usb/host/xhci-hub.c     | 360 ++++++++++++++------------------
 drivers/usb/host/xhci-pci.c     |   4 +-
 drivers/usb/host/xhci-port.h    | 302 +++++++++++++++------------
 drivers/usb/host/xhci-ring.c    |  23 +-
 drivers/usb/host/xhci-tegra.c   |  24 ++-
 drivers/usb/host/xhci.c         |  35 ++--
 drivers/usb/host/xhci.h         |  68 +++---
 10 files changed, 430 insertions(+), 416 deletions(-)

-- 
2.50.1

