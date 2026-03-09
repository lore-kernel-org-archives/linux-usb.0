Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1197FBAC
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773061328; cv=none; b=bAnCao66jbn0SsdNRkUhMLd5PrbR+TRrV8yS8QmKjmt3Wk22w4Z+bi/yUKZ+LC49pNKI6AnADM+Om9gatwoaSWFWCkQ/qlAcJwwuAKPbqVesIiJhLMNuB7gXb1yDncYAlnj5woV5SAIWhVikUNmhFxHvJKs0cGACVlwTSjiBHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773061328; c=relaxed/simple;
	bh=ALyK2tDzOq69vZFtTRTy7/ixCtwbIJysr7ZFSKwKjc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EnQsmwqT4gjnJddZIMwkeSj+v1q87kEMgfbsrV4GqgBqlV3gohNw7KbsfxsgfL6Jn61r4/CBlwS0Ox4/iWR3XoeWRiN1y88T6TpPK9CfMMDuqzvwlZ5hhIq0HrCq6/lc/elh6ZXEgJFMSGrcTPeUnVVcwC/l98QTjJ8VA09vyKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNMhND+Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNMhND+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773061327; x=1804597327;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ALyK2tDzOq69vZFtTRTy7/ixCtwbIJysr7ZFSKwKjc4=;
  b=nNMhND+QJPV0zIUvL6vwco+qX8Dzw68TRvDXwulqYlEY0yUwyWSbAoXC
   vTPrj40w900vzwlPPjQwmULcmIwAOYkGDji4dWJ2/tsPKhZxeH9AmU2Gf
   3ArtcSCt4ivZOE8iOFrwV57btpxhkH+pZHbAdKOIzKwuuurPc7OW0DcJ1
   nsgDEwzO6JaKL2xZ8wQEEvcU5COtDW840ZpetuYm/gd+c87nfy3lo+Yux
   /gfu9NKATFJI2yzzPinEdholCFe4YQ6s7/N9a9HL5q1KG8x6rEanPVs8C
   IHiaKMY2uEQbr7qYLRG3E6/Rf+fltKkyM+Dq7V91+vaDb5y6XyrhRIRBE
   g==;
X-CSE-ConnectionGUID: 7SqVXiDARsaHuYyCPSft0A==
X-CSE-MsgGUID: GwyB6kTiR5irW95aaonb3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73960244"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73960244"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 06:02:06 -0700
X-CSE-ConnectionGUID: o0IXng2wTZyUV+YMKLo1hw==
X-CSE-MsgGUID: HxjO/fVzSGKIgIbqcvUKOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218958292"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2026 06:02:05 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v1] usb: dwc3: pci: add support for the Intel Nova Lake -H
Date: Mon,  9 Mar 2026 14:02:04 +0100
Message-ID: <20260309130204.208661-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the necessary PCI ID for Intel Nova Lake -H
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 6ecadc81bd6ba..6c1cbb722ca85 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -56,6 +56,7 @@
 #define PCI_DEVICE_ID_INTEL_CNPH		0xa36e
 #define PCI_DEVICE_ID_INTEL_CNPV		0xa3b0
 #define PCI_DEVICE_ID_INTEL_RPL			0xa70e
+#define PCI_DEVICE_ID_INTEL_NVLH		0xd37f
 #define PCI_DEVICE_ID_INTEL_PTLH		0xe332
 #define PCI_DEVICE_ID_INTEL_PTLH_PCH		0xe37e
 #define PCI_DEVICE_ID_INTEL_PTLU		0xe432
@@ -447,6 +448,7 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, CNPH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, CNPV, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, RPL, &dwc3_pci_intel_swnode) },
+	{ PCI_DEVICE_DATA(INTEL, NVLH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, PTLH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, PTLH_PCH, &dwc3_pci_intel_swnode) },
 	{ PCI_DEVICE_DATA(INTEL, PTLU, &dwc3_pci_intel_swnode) },
-- 
2.50.1

