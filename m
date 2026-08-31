Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BBB3EB11C
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170431; cv=none; b=akmVkzmubvBKXw96fE99a1zbTWdyvuo0MqRmh1KOsXh11PGWIiLDCo+Tu9+RgrkmbRRRBVxzCpuISTVUXvVOlOr7lcyA73583b0oHUQ4i6QkFoHc+cbHmGbxUd7ju8DIIl8K6iN6Qd5Naea0csqDeZ3PBppkMMOqbf6KFAN8N6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170431; c=relaxed/simple;
	bh=Tf6c1iQhRIBYbxLlF3C4BBnaDXNUqfbfiV993vXQXsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNVWLwAMKR+I2Fz2wx3CWs0T3dka2oOPVg1nzNIsB4N63J4UlKV5gOGl4SVWFap7m+akahVHcVBbrOk3s2RExAkD9+OUxAVJr9azBOa6ezALxz8t2oXGrX7UyliB+knWn285RIbjHZ0WZP81lR1K8C+Vzh1B2/6epZdsEfDwmXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKt8wOjP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKt8wOjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170430; x=1819706430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tf6c1iQhRIBYbxLlF3C4BBnaDXNUqfbfiV993vXQXsQ=;
  b=fKt8wOjPhem/ngVLPgHninE+GDUPqK4kTCpIcmJtVp1wQ6J1FaJMAgsa
   0zdFp1im+NSKd9ikpLZyBXDoyK3MmNsZ+Q3gMVg7VJXZSAw+l7xMmV37i
   3sAs7Y8wEMd1NzXY31MzV3mps8A9a5NVMjLO7c/gQrb3l/qvllZabEDsH
   74xyklNxSVaoZfoH0Rd0gIhk1iLphqGvZ0NaSOS1YJ0DKYXOxkoBphInS
   2eBwpmQinq8wJ0puV8HFvwSxudoa4wThpyMOrukvFiiJQ19GA5lZxEmx5
   Fst0+5XBEOfwySfcmcAc+gOvkCI6oLRvKff0FiBF3mwfRY7OrQfm1dORd
   A==;
X-CSE-ConnectionGUID: EU0fhSauTJqkGCCBm7yORw==
X-CSE-MsgGUID: vbz5AL1PSD6QxKlK1lDrcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106096915"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="106096915"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:00:29 -0700
X-CSE-ConnectionGUID: aBIwwgq7TTaPsE45qAcpPQ==
X-CSE-MsgGUID: HId7DQEfQjWnYrzGg6a+FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292257175"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2026 03:00:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 505239D; Mon, 31 Aug 2026 12:00:26 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Alexander Fischer <alexander.fischer@kait2en.org>,
	Andre Eikmeyer <andre@negmaster.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v10 2/3] thunderbolt: Add device links for Apple machines with Titan Ridge
Date: Mon, 31 Aug 2026 12:00:25 +0200
Message-ID: <20260831100026.1783663-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831100026.1783663-1-mika.westerberg@linux.intel.com>
References: <20260831100026.1783663-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

Add device links for Apple machines with the Titan Ridge thunderbolt
controller.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index c9c50004a6ac..996a8ab3cfb7 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -168,6 +168,8 @@ static bool nhi_pci_add_links(struct tb_nhi *nhi)
 	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI:
 		break;
 	default:
 		return false;
-- 
2.50.1

