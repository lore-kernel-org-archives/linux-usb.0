Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3C63F58CC
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961642; cv=none; b=RiE45jmOgqjq9ZCetI/xMBjpGPtKGBN5twi32mHoNprpXQwufcvQ9RI776PU9RusRwRgT0HN5TAEHaxuFCfRi61E2FWSKSRTMORGr6orP56D1ufxV1Hdt6im1FcZwtR735T9byOScUaT5eybtHekHKm1l5viM1w6bdVhdPDAiOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961642; c=relaxed/simple;
	bh=BQeOtHX8JKFhSCx/4yjh48tm8Y/d7nJcm2eNGyOeD98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J021McXFi8bohpnBYQhhqH4tBKqD65mIAQglT+3Him3npJ7WS7QdMW+GkVurFL0Dpav4noW0zJ0t291BefDgrMKjNwJXIFWZ1w7WUQ7+lVjQHuOF1wOXafrKllBwaPNQQTaaz1nydHnK1LnmOkdg68VK+lnvEa5kjjGiqNLtBpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceL0gmY9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceL0gmY9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce98cb8165so28870605ad.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 03:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786961641; x=1787566441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OO8kLLqET3++net7VSnmwLLKqFHxZc7VFGA6foQQzvg=;
        b=ceL0gmY9eXYPA5s2DJYGVkhLOkYCpXBjWVv2Gyagnx3oYtQT02ZNnrdKGhLQAdblOS
         3YYL/FsemzkKqTRED/45+QqZOPDhPhxlJme2K94qBjbKRmpt1gdD2eue5U4IDcQk4h4C
         Te5s6nIIOAx2SBpLM0DqsaYwqq2p4vwqgUnD+uLbKMbyieoDw7cP+fX34jUAhV+2GquF
         S5CqE8hQaPhIhR38I+4bAUf0W6saRla5b64DueS9JYhbxY2Jxp/Y6NU6JvFC3NLBTcyH
         4ggH0AL8kwyOmlUSvYtdcpLhmHz9Dd8S3OCtrYEvZn8XTHWcq11fnc3ULq9BhrG86xj8
         frAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961641; x=1787566441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OO8kLLqET3++net7VSnmwLLKqFHxZc7VFGA6foQQzvg=;
        b=JKIdq0tUTJ6T4pIsHwvnbLp6N7XkWf3KpF1wQ5YBFPYsGNRgCIKe84n254qtmdvutk
         5OAm82cg/IbRswTwFfppPlyMh8f/6d5KsGQqqQljE7qmJn3IcAuW2dHLe849wMnKefe4
         0eU4RLHh0C0mH8wdqRezqRqyWDydO44WwdfWQT2pZlau3IzUea+e3fV3kI9b2H761o7Z
         k9t97VlLvf3dU71LQjUB84x8GhyTBq/y9qTv3xXQIOhzfcUQM5ZIiebdqbReQuESMhtC
         CYA3HtPGlDEhP00Js67QVTXJ+iaOa1ER31leelFrZzzsaT/ZPL00ajMcYXpJHn/RQoY5
         Rbig==
X-Forwarded-Encrypted: i=1; AHgh+RoQ7u1/Dg+kihI6OOhRD1OXTPMkpO7ipQA8je9x0/3OC5pMaDrJCQdS3tdT7K8O4l8opAoNvtQqVfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CadRqhn2/pG27oGng5qoYxo1CRfNl1waGVEbG9xxtHFA2Etw
	ynsRkTrz0GV3qzdSHyTwqwsB1UhnBw+Z+esZM82xgJoFG98UkQ1WgAI=
X-Gm-Gg: AR+sD11UEEETGAJI+MNPoo7dDeq/l3/JRgj9simn+aqcAeHLoLWrdATHdyRmQrI66qw
	+XMCqguaWrt1U77KsXx8c56Nbqc1FQd14r2nxQIYwXK0ys7E6xXzYbOVcEjVR2/tigx7lMWtLJ7
	EReH2CppAGOQCfXVtqkMGIPySZ9Kk81GMisnKfMJeUIZhPMKjLLgP5ieD3cZEWAr8brLG6OtRVp
	361mTFNXC0ha3adN0Mo/rtu88blIwBq6sfmFE74mjRuo3LM/QVq1Jz+qxrx0ap5xkSTDhgDytJ8
	ffbsQWl0JukHFEkxHUvyZqGo5nAZSjCjlJnUM8ErvCceKfDK9Y7UaI1FUktly6pM1KExrqVPqNb
	Pqb6nUWIyPn3qhalJAoBlvY6wrG1yNZyF0XkpsNqx8PSrcw+J6INTkRxAxJ5TrxLYcDkum61KOH
	Fda8PamCqftxWtz2/CdxZ4G7/ZbdP2Dxr7IScbPWOv/NaaFGgMyabji83emDshxzN7zvqpwjjon
	A/BLcVKPQwoBMrbmf7ogPNihN5V3Jn/BQ==
X-Received: by 2002:a17:902:f64e:b0:2cf:70d2:da7c with SMTP id d9443c01a7336-2d37f77fdfemr329758215ad.12.1786961640676;
        Mon, 17 Aug 2026 03:14:00 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([27.59.94.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326761d3539sm4864117eec.0.2026.08.17.03.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:14:00 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Alexander Fischer <alexander.fischer@kait2en.org>,
	Andre Eikmeyer <andre@negmaster.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/3] thunderbolt: Add device links for Apple systems with Icelake thunderbolt
Date: Mon, 17 Aug 2026 06:13:24 -0400
Message-ID: <20260817101329.1517-4-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com>
References: <20260817101329.1517-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ice Lake Thunderbolt NHI That are on some Macs. The NHI and its
associated PCIe Root Ports all sit directly on the Root Complex
with no upstream port. Identify the tunneled PCIe Root Ports by
their PCI IDs and create device links back to the NHI so that
PCIe tunnels can be re-established after sleep.

Tested-by: Alexander Fischer <alexander.fischer@kait2en.org>

Co-developed-by: Andre Eikmeyer <andre@negmaster.com>
Signed-off-by: Andre Eikmeyer <andre@negmaster.com>

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/thunderbolt/pci.c | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index af3a7a9ba..8c0e40fb9 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -492,6 +492,47 @@ static const struct tb_nhi_ops icl_nhi_ops = {
 	.init_interrupts = nhi_pci_init_msi,
 };
 
+static bool tb_pci_add_links_icl(struct pci_dev *nhi_pdev)
+{
+	struct pci_dev *pdev;
+	const struct device_link *link;
+	bool ret = false;
+
+	pci_lock_rescan_remove();
+	for_each_pci_bridge(pdev, nhi_pdev->bus) {
+		if (!pci_is_pcie(pdev) ||
+		    pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
+			continue;
+
+		switch (pdev->device) {
+		/* Ice Lake Thunderbolt 3 PCIe Root Ports */
+		case 0x8a1d:
+		case 0x8a1f:
+		case 0x8a21:
+		case 0x8a23:
+			break;
+		default:
+			continue;
+		}
+
+		link = device_link_add(&pdev->dev, &nhi_pdev->dev,
+				       DL_FLAG_AUTOREMOVE_SUPPLIER |
+				       DL_FLAG_PM_RUNTIME);
+		if (link) {
+			dev_dbg(&nhi_pdev->dev, "created link from %s\n",
+				dev_name(&pdev->dev));
+			ret = true;
+		} else {
+			dev_warn(&nhi_pdev->dev,
+				 "device link creation from %s failed\n",
+				 dev_name(&pdev->dev));
+		}
+	}
+	pci_unlock_rescan_remove();
+
+	return ret;
+}
+
 /*
  * During suspend the Thunderbolt controller is reset and all PCIe
  * tunnels are lost. The NHI driver will try to reestablish all tunnels
@@ -514,6 +555,9 @@ bool tb_pci_add_links(struct tb_nhi *nhi)
 	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI:
 		return tb_pci_add_links_discrete(nhi_pdev);
+	case PCI_DEVICE_ID_INTEL_ICL_NHI0:
+	case PCI_DEVICE_ID_INTEL_ICL_NHI1:
+		return tb_pci_add_links_icl(nhi_pdev);
 	default:
 		return false;
 	}
-- 
2.43.0

