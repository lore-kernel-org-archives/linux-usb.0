Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A093EAC75
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170432; cv=none; b=UHmzrpMOdt0tfmuRDr9TUTUH1iFAwNwvdh+KO6MpZrEC6bUuJCFqLqd9pab6KC36eQMnnmRhSneQ1ezJJrMj3fLBSCidMTD8ksGiRu7pgdvxfBzlYGBpiU32fQ8/Al+4AqEBuQuQR3zv4GoCn+h9ufspBr5TUls6Y4b6+SFRkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170432; c=relaxed/simple;
	bh=XUjYO/diUMGNAiXUTjP2uIkw61h+uk5+SocZQovg2aU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CY4Kcc2NaNe6yz8hDGm/S3Xy/R2VdVt1QskmSu5mb9+uQ3eVZSJXoJS8YbwRdgNJrrEB8Ah0L3naTho3EOa+q8hW+6hQW1Se2+doqmAzgGlilfeqWsRG4haZ0WHqPu5F7hMRn4bokrTue1Sp+lNfBpxd1hDbq2dnGcQpQgwxV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhxHpDQM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhxHpDQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170431; x=1819706431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XUjYO/diUMGNAiXUTjP2uIkw61h+uk5+SocZQovg2aU=;
  b=HhxHpDQMZRCepbjDlsAT0XL9c7aqT7zbdUOeCmdlu5VTEqFvZp5fyWpf
   ZJt0brU8DC1VifKJDJsyR+15pOHiSb7MpemBROyGqa5fBhNFPG8mrX10Q
   xoGBAnf3qFT4PfwcCe6gDtyYBN7pMaXZ5voCXFOiyAkUWaWWCWvaeHCqu
   qCF+AJ1MCXN85iDpbfc9pMiQKSfERu+DO1OvDBkXCMhS3vYiUcyF91Vj6
   UNzz5Kw5HLtRP6Yf6gyNVIJ/Ppss+kN3ungohEQqxXFTkY/cWoYfY9OZF
   e5HcFwW18gMrfa7oac9P/zOee4BbMRyCg4kECbMhZo/e5sExoRx4bhQs4
   A==;
X-CSE-ConnectionGUID: Po0LegVxTTSNuKW+jyLnrA==
X-CSE-MsgGUID: OCy+jy6cS2+PTiM3Tg6Fiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="106096920"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="106096920"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:00:29 -0700
X-CSE-ConnectionGUID: sOEUmJ7sR3WszRoBkdFmzA==
X-CSE-MsgGUID: A5pRRnWjRP6+sbQe4lxI4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292257176"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2026 03:00:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 53E179E; Mon, 31 Aug 2026 12:00:26 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Alexander Fischer <alexander.fischer@kait2en.org>,
	Andre Eikmeyer <andre@negmaster.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v10 3/3] thunderbolt: Add device links for Apple systems with Ice Lake
Date: Mon, 31 Aug 2026 12:00:26 +0200
Message-ID: <20260831100026.1783663-4-mika.westerberg@linux.intel.com>
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

Ice Lake Thunderbolt NHI that are on some Macs. The NHI and its
associated PCIe Root Ports all sit directly on the Root Complex with no
upstream port. Identify the tunneled PCIe Root Ports by their PCI IDs
and create device links back to the NHI so that PCIe tunnels can be
re-established after sleep.

Co-developed-by: Andre Eikmeyer <andre@negmaster.com>
Signed-off-by: Andre Eikmeyer <andre@negmaster.com>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/pci.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 996a8ab3cfb7..e40d4d6af071 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -521,6 +521,40 @@ static int icl_nhi_resume(struct tb_nhi *nhi)
 	return 0;
 }
 
+static bool icl_nhi_add_links(struct tb_nhi *nhi)
+{
+	struct pci_dev *nhi_pdev = to_pci_dev(nhi->dev);
+	struct pci_bus *bus = nhi_pdev->bus;
+	struct pci_dev *pdev;
+	bool ret;
+
+	if (!x86_apple_machine)
+		return false;
+
+	/*
+	 * On integrated controllers the tunneled PCIe root ports are
+	 * directly under the host bridge.
+	 */
+	if (!pci_is_root_bus(bus))
+		return false;
+
+	ret = false;
+	for_each_pci_bridge(pdev, bus) {
+		switch (nhi_pdev->device) {
+		case PCI_DEVICE_ID_INTEL_ICL_NHI0:
+			if (pdev->device == 0x8a1d || pdev->device == 0x8a1f)
+				ret |= add_link(nhi, pdev);
+			break;
+		case PCI_DEVICE_ID_INTEL_ICL_NHI1:
+			if (pdev->device == 0x8a21 || pdev->device == 0x8a23)
+				ret |= add_link(nhi, pdev);
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static void icl_nhi_shutdown(struct tb_nhi *nhi)
 {
 	nhi_pci_release_irq(nhi);
@@ -530,6 +564,7 @@ static void icl_nhi_shutdown(struct tb_nhi *nhi)
 
 static const struct tb_nhi_ops icl_nhi_ops = {
 	.init = icl_nhi_resume,
+	.add_links = icl_nhi_add_links,
 	.suspend_noirq = icl_nhi_suspend_noirq,
 	.resume_noirq = icl_nhi_resume,
 	.runtime_suspend = icl_nhi_suspend,
-- 
2.50.1

