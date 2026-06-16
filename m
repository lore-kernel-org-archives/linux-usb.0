Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9C042847F
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604569; cv=none; b=RABulDdacv9lE7Po/KLZPYDf0CmbGEYSONdE6RIWTlyMHEQ383saUEU469pcFr9XPdoKlQRwtUh3cSOPmROosgC2o4zxzQfk5tnHBVtGbykIIlDc3lxgSs7ENH1Wbt3gcbicQbNDVnoYCo4Zq3P52nRUpndKczvsG73/bLmKvh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604569; c=relaxed/simple;
	bh=IUUsGwobzcniZre4vEWzl3ULq7x8Ph+3GGRJlOe0678=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nm5Qao9IszIMt8oEtXKqgtwAwIwkR8tn4XaWRv/dWyH5fvI2anSiT6alXggboVWOlu9OUgEJg7zxytHUkypWQasd9qrZ7+Cy9L5EOYDopbLVrNUcr3wI1YFKlKAj8pIdlzCilD/gI/XIL306Mrl/wlfiCf/jBXJHTjOgONP6VpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnogtTZu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnogtTZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781604567; x=1813140567;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IUUsGwobzcniZre4vEWzl3ULq7x8Ph+3GGRJlOe0678=;
  b=GnogtTZugZAGoEM0KuSJRqw31o7MjcvnyLR6BAfRcwfza8SRArM7cuOe
   fOIzNLX3FYi3WFNd8yeBz3n2EirVKgzzGN3Fy74+lUwdDKCX19edS3Mo2
   flNgT6H3HdiQXJPcnUnNdGAGz/Mp6V241yxZZ8NUEl26m1c2dkHU55FX8
   nI4GF4YdvTXHnj6XygSwwyFGJ14UMmTmjnxORiVYqkhe7Rdjrr2NSDWlg
   CbNr53rYiHEbJIMqQkKa5CAOu/acpV/6WKcFS/UPFWzE3xqKhEf0y+Gch
   dPh/EvNWNp/G+dGcHMnt3PXfZWVFk6lLBy/CUaOUYGKI5kQk83UGB9CYR
   g==;
X-CSE-ConnectionGUID: DzwfgtvbTamwkLd22Q/w1w==
X-CSE-MsgGUID: Vr+dlnfHQL+2gXxKedrWaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="93482931"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93482931"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:09:27 -0700
X-CSE-ConnectionGUID: fT4M1qdARsepq8y45AuH4Q==
X-CSE-MsgGUID: 5CC7r7KwT/Sc6OZ2EBGc5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="247599730"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.156])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 03:09:25 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: chaitanya.kumar.borah@intel.com,
	linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 0/1] xhci fixup patch for usb-next
Date: Tue, 16 Jun 2026 13:09:15 +0300
Message-ID: <20260616100916.2234205-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

Second try, added Reported-by, Closes, and Tested-by tags

This is a fixup patch for the xhci DbC patches in usb-next.

This patch was originally part of the xhci DbC series going to 7.2-rc1,
but I decided last minute to drop it to let it mature for a while.
It enables runtime PM for xhci with DbC enabled.

Turns out the series going to 7.2-rc1 is flawed without this patch.
It introduces a locking issue that this patch resolves.

If possible it would be nice to get this included to 7.2-rc1, or if it's
too late, then to rc2.

It passed the CI test that discovered the locking issue.

Thanks
Mathias

Mathias Nyman (1):
  xhci: dbc: support runtime suspend while DbC is in enabled state

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  2 +-
 drivers/usb/host/xhci-dbgcap.c                | 60 ++++++++++++++++++-
 drivers/usb/host/xhci-dbgcap.h                |  3 +
 3 files changed, 62 insertions(+), 3 deletions(-)

-- 
2.43.0

