Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6633FF8BC
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477923; cv=none; b=nLEElQj8zdNTRZqN0QA6bQKoQijMaDgIsd28SoUDkCqrtQsmk0P/9gOFO+TSBBciAeYjPIPU+85jbl6KWUxMs4ZBm+oMlXuKID7YR5UuG/W9ZGtTqPENtwyd6o5m73rS+hYSDMXuGnLe9hwUqrcRayU2jF4QvsF+nH8T9ImuJ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477923; c=relaxed/simple;
	bh=6uEFOyrCJ0YiX3AYrHKvWep8iOLJ9Aj1imy2zvMPg0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNesjoTU9Cm3/tDx5PHqNnkAF0IakbbhSZBkgnBYHelgqbWn1dmb+arM3ug/xgvt5Dbx13YauVC26thz+Zy1dvvn29w7lvu2EJle3JFwZg5Dda86yO3/BVqX45jGvugRgz4VrZiDDMYnXifMoXCTvHMlbzzbbHP6pIWmovF8a48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=no+bd5O2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="no+bd5O2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477922; x=1812013922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6uEFOyrCJ0YiX3AYrHKvWep8iOLJ9Aj1imy2zvMPg0M=;
  b=no+bd5O2pRsmapF2a1tdpPVuHYe9txfi9M7sFpWOxEtAEAmnU9fY+/JP
   8gFmG+w8QLlRyz43z9n8QfGWBGK8xcpjcUqSkghZU9zMT2USdx7CtlCEG
   0jspfyugUtmuIUrItFJbCrbbiyklXaKpWtqc32bt3wUsU/fuwX4MQpZfl
   37KmKeWBTlCRdf89bbyzrU+SOxna1MI8BeJwfvl33+pQNuuqXuzX1HOJT
   +Bduuf7fcxaJIaIklYq+MYmdi8z82St+wKmrXNz+0WJdd6gPrJ7OPaj4T
   yUwSLsZzJ2WW2USshdjMd47c0fs2tovhKaesC+k4qgMcWaMVBBbHglxli
   g==;
X-CSE-ConnectionGUID: OZMsRDxFSb257jMZgnfbUg==
X-CSE-MsgGUID: rTlTV+3+RF+fH/wWEj8J6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657567"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:01 -0700
X-CSE-ConnectionGUID: QXrlYzrCR3OyahrVoveoTQ==
X-CSE-MsgGUID: dxW/7v3nRhiIi8I0zHPYpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281889"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:00 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 07/15] xhci: dbc: Fix sysfs ABI Documentation for xhci dbc states
Date: Wed,  3 Jun 2026 12:11:24 +0300
Message-ID: <20260603091132.1110849-8-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
References: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading the 'dbc' sysfs file won't return the "stalled" string
anymore as "stalled" is no longer considered a DbC state since
commit 9044ad57b60b ("xhci: dbc: Fix STALL transfer event handling")
in 6.12 kernel.

Remove it from sysfs-bus-pci-drivers-xhci_hcd ABI documentation

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index d10e6de3adb2..98a8376a83d2 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -22,7 +22,7 @@ Description:
 
 		Reading this attribute gives the state of the DbC. It
 		can be one of the following states: disabled, enabled,
-		initialized, connected, configured and stalled.
+		initialized, connected or configured.
 
 What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_idVendor
 Date:		March 2023
-- 
2.43.0

