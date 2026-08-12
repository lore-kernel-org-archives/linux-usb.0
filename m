Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD346EC73
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 15:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549065; cv=none; b=lfP3OwBpmw5NHssax82bqB7zUgb+iyUJnsTmRtOeoDgCQoGIYreL1c1jBp0JSO07zDIRQey+BrB5GwCs8A7ANG1DdgdmaM3GnLwz+TJ7HNCAOloGXu9fPswQQOeaxojT1ZVQ53HPkY6S51X6d7yZ5jhLux4/FKjyR9d3PZ/pSFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549065; c=relaxed/simple;
	bh=x0XfJfYYmm0lZckHiSTrULL19u0GEKu1sJMJbH7EwyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L79N44Ap2GPcHyTUCsZOKqOzR0J7edcS/ZXT/W00ddugJOw17gH5SO2KCIXR/gnYh6RT++z9QHjPFG+OT6At8kaPXHwmziN7pP3ipe0cJvnDym5qP9Gks11wNfsUmaRh6CHrxXpiM0k4FLcVnfLrZqM67ZiCaal8IkuxvnD7Lu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrrC1HmZ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrrC1HmZ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso567069a12.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 08:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786549051; x=1787153851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzIk5I7OqDCOAhpxa2DhuDUN9BeeRjYb7EQC4Ahia0I=;
        b=QrrC1HmZN6IrpLqYYU5rze5CrqRza0B6Q1jGXWudWqkP2FUxzrG8r+9hFsH0Jgg+5b
         LCkAmwas0ctHmlZQOVnBy+X49Rw8X8C97PzaPp5colJ/kE1LVTc9tMFODKH9uYRc4MT8
         cvS4in5cCcI7ZRGeodsNWcobmKJvfF3QAmiJpq+7WKz3zeo8cM4rAgJezvZ6s49xD9xN
         9o4HWoEjnpUvXDlcu6Ba6Dno7VUn/jV/bxDR0nIACo7y/9/+YAW/AdjbrzMTdv70GM46
         /JBwE0Fo6CZ4bdWblbeHmd+7zr9F3SxCmMZe/qyaIY9hqSXgF5v6BQRLFI/YMws2pe7N
         Eejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786549051; x=1787153851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzIk5I7OqDCOAhpxa2DhuDUN9BeeRjYb7EQC4Ahia0I=;
        b=f/XXGWmQRJQX+KkxFoazD0Qh+PTYcDmCgu8HyDg19y47Wz68ELeOn66RA3WbktkToB
         9Hk9bmWDpUggYPDrC8UPsylJwZpwk8Nwx+MkTuNF0sxHVlBN9T2sc8nEscrbhNmc7IuM
         y1SQZdgZIWgDBvgNEQ0/JuDdOU/5g6uI4Hv+NIuNoSh2yCcnax3S+aPhPkZ6S/Jf6N4+
         yd6WFy+J9N/jmKsxRRIUUcfOvQ33SbzNqhdqonYRrrcXzAd06OveANA0kjLvFa1+kptM
         M8iw/CR+Qu7a31tpCdYSiZhjRXXAOhjAJJdamlDLmdHm6NRNUBdQE7x8Q8Rck3XEfIty
         sWPg==
X-Forwarded-Encrypted: i=1; AHgh+RqSrxicYuA7/rigoG9Xx7OXyqVYj5UGVeO5rUOfYH2McNokAQt3gxgSHNFMW8XBZjFxi1udW8/1ZLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDyuc8HPvk42gWqD+pyTZGkr7fn1603Ax2PbCa/z1nxgNKwep5
	OeyVty3Hz5loZm1L3z5yf/XG7gZVoPDvMo8rFYIB/LtGHBLrcbFquvk=
X-Gm-Gg: AR+sD10b15cgwTZL6b5NpJzMCMUTUowMrXn332Mu4Kp03w2vzVzsXmPBM1MsEVGQ1ue
	4lE05SQOLzTF+ouK1V2vjZ5TddZ1WRFtRqhciZJDWexK/NPzUBYh1xyvJPrVBkXrHzhSk9Drxm3
	LfU3Buf1e351hZBMmI9sQkAdDaJVqLnZ76E2pXSPNY57OpWdz5GTt9q5AxOYRo9VAgyMRXpB62E
	1PtPIIAevPyVMwQH0798/sjpJ1uQZJeg3XEcVz2ksZm/X6axBejfLbb+ZmbKfHDy+Oi5mVQGtlZ
	tYFJeJJwdOXQSz6X3iPrxQyzGUTbptznCpyraRfVVC4Rl0E1oEv8KnJiB7akpPuLcfv+mY35CuE
	S8Eu1jUN9CejcFfIeRyK08h1Tn6sUgX0YxopwiUMdju438TFDG5Ze3VKT4CAbo2XK6e+q6muw4j
	qkku0PU7UeNHOoK2ZK2Vxi4L0Q1dse1QJcgdzSo/Zkwvw84cPyTBqer56H8tGK8HIhcnAAP/VQ9
	TtiB0JK+Sum10Z2Iyyd0Xs=
X-Received: by 2002:a05:6a21:150d:b0:3c4:3112:3b with SMTP id adf61e73a8af0-3cc3f72cd3amr7342179637.18.1786549050749;
        Wed, 12 Aug 2026 08:37:30 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([14.97.72.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf361d292sm19712760eec.3.2026.08.12.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:37:30 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andre Eikmeyer <andre@negmaster.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v7] thunderbolt: Add device links for Apple T2 NHI
Date: Wed, 12 Aug 2026 11:37:14 -0400
Message-ID: <20260812153717.1345-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ice Lake Thunderbolt NHI That are only on T2 Macs. The NHI and its
associated PCIe Root Ports all sit directly on the Root Complex
with no upstream port. Identify the tunneled PCIe Root Ports by
their PCI IDs and create device links back to the NHI so that
PCIe tunnels can be re-established after sleep.

And on other Thunderbolt NHI's, like Titan Ridge, the default method
is used to add device links.

Co-developed-by: Andre Eikmeyer <andre@negmaster.com>
Signed-off-by: Andre Eikmeyer <andre@negmaster.com>

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
Changes in v7:
- Used pci_lock_rescan_remove to prevent race conditons.
- Fixed patch format.

Changes in v6:
- Used for_each_pci_bridge in Icelake section
- Removed has_apple_t2_chip as its not required now

Changes in v5:
- Used Icelake root PCI IDs for detection of root ports instead of TRP

Changes in v4:
- Limited TRP check to T2 Icelake systems only
- Optimized has_apple_t2_chip check
- Included pci.h to drivers/thunderbolt/tb.c
- Used __free(pci_dev_put) to avoid label

Changes in v3:
- Fix build errors with non-x86 machines
- Used __initconst for apple_t2_devices
- Removed UEFI_QUIRK_SKIP_CERT as its unused now
- Used IS_ENABLED(CONFIG_ACPI) in tb_apple_add_links for the T2 part
- Removed !bid check to remove warning with -Waddress

Changes in v2:
- Used a less generic name for has_t2_chip
- Used DMI instead of PCI for has_apple_t2_chip to avoid PCI problems
- Initialized ret in tb_apple_add_links

Link to v6:
https://lore.kernel.org/all/20260730223435.2874-1-atharvatiwarilinuxdev@gmail.com/

Link to v5:
https://lore.kernel.org/all/20260727211807.1223-1-atharvatiwarilinuxdev@gmail.com/

Link to v4:
https://lore.kernel.org/all/20260724164641.2239-1-atharvatiwarilinuxdev@gmail.com/

Link to v3:
https://lore.kernel.org/all/20260721063412.11588-1-atharvatiwarilinuxdev@gmail.com/

Link to v2:
https://lore.kernel.org/all/20260721054506.11871-1-atharvatiwarilinuxdev@gmail.com/

Link to v1:
https://lore.kernel.org/all/20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com/

 drivers/thunderbolt/tb.c | 49 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952..2534c6378000 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
+#include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_data/x86/apple.h>
 
@@ -3305,16 +3306,62 @@ static const struct tb_cm_ops tb_cm_ops = {
 static bool tb_apple_add_links(struct tb_nhi *nhi)
 {
 	struct pci_dev *upstream, *pdev;
-	bool ret;
+	bool ret = false;
 
 	if (!x86_apple_machine)
 		return false;
 
+	/* Identify the tunneled PCIe Root Ports by their PCI IDs
+	 * on Macs with Icelake NHI's
+	 * and create device links so that
+	 * PCIe tunnels can be re-established after sleep.
+	 */
+	if (nhi->pdev->device == PCI_DEVICE_ID_INTEL_ICL_NHI0 ||
+		nhi->pdev->device == PCI_DEVICE_ID_INTEL_ICL_NHI1) {
+		const struct device_link *link;
+
+		pci_lock_rescan_remove();
+
+		for_each_pci_bridge(pdev, nhi->pdev->bus) {
+			if (!pci_is_pcie(pdev) || pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
+				continue;
+
+			switch (pdev->device) {
+			/* Ice Lake Thunderbolt 3 PCIe Root Ports */
+			case 0x8a1d:
+			case 0x8a1f:
+			case 0x8a21:
+			case 0x8a23:
+				break;
+			default:
+				continue;
+			}
+
+			link = device_link_add(&pdev->dev, &nhi->pdev->dev,
+					DL_FLAG_AUTOREMOVE_SUPPLIER |
+					DL_FLAG_PM_RUNTIME);
+			if (link) {
+				dev_dbg(&nhi->pdev->dev, "created link from %s\n",
+					dev_name(&pdev->dev));
+				ret = true;
+			} else {
+				dev_warn(&nhi->pdev->dev,
+					"device link creation from %s failed\n",
+					dev_name(&pdev->dev));
+			}
+		}
+
+		pci_unlock_rescan_remove();
+		return ret;
+	}
+
 	switch (nhi->pdev->device) {
 	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
 	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI:
 		break;
 	default:
 		return false;
-- 
2.43.0

