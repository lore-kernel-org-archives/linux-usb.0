Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B7237267C
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 22:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785450897; cv=none; b=TTB38SFXE5meSJ01jiXSM1JqZpT9UAFlVIxAh8+m576AjKh4QlYFanRk1hdE4tDfukY5N+38kjtymJgzLlrnixHZLdsiJzRcGAyUGrhlCfZlBqS42X7zgRUevDQ41dZWr0EzbiUfRs8sAZ8pXSK4+OVMQNxqUxX+CuJNGDQwD44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785450897; c=relaxed/simple;
	bh=fX+6pkMX/W45v5AWJzh/xbfzKLl70LphLmyCsByYtYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TIS+g3kC8ya0qIlK5oWpbyWs+6RoemsSV0wU0kwbO9w30+qPhP3g5mnbacDX0rX7BqCygKwrK1CCNadV+UTNFhaZh+G4AHHuGE218XSz7uUGGoaVnXRLpxgTf/9Mquek67wH+9D6au7QefHVMnYBe8ln9nl4tA7OZ/SYG0HNvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjuBGepS; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjuBGepS"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c999f162c9aso198690a12.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 15:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785450894; x=1786055694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kmlw9fyosGZdf2BNWt4ws0mLj8YjVKrdloEGzRsMNAk=;
        b=kjuBGepSIs6f7w04cF2YWo4RRxz+fGsJEnr6/o6pGxBIO4eZHWqbkvT1wUsee5dHfX
         8fhSwDkwfsfZtQGv6gizpOSJ4+HVtfE0ooQJdHul/g34BgecFN1gIRHS53AN5v1QWPEO
         I3VtmkTzlHSxRu3BDCHuwET6Nnzvrzxd2Pf4rBmWNr5HFctc121fZQXP4q6LlZvCugh9
         p2PwVH7g/eeVg4V3P99If2whUthws0qsr1nil5wUbVWFrlhZB14vPW9jjCroewEt0JVb
         2avhGzZ6YcnvesgK7S5j55i2ZZgSE/ZGs3dm7SVK3/7lsmW0DH/6nibGtS/1AFlGIT+8
         oEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785450894; x=1786055694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kmlw9fyosGZdf2BNWt4ws0mLj8YjVKrdloEGzRsMNAk=;
        b=h0hIGgj/+CT4sfZajh3KAdoVBPr6Tjx876n+sODIT7ZSMrs2qNRVqy1W/dP9FTC2yq
         OZT64DnRmkhSDvRySC2QVivCmk7ENJr395vhi7TZHMp2TGFi2u8RQiGq+lA+GbZsScvO
         sbMNPgLl7h7moIpmKXgWGeV+EbFNLvvBqdf1FThUoStks43mpWCbkMo2hgbWTm63qQLz
         J9IwZ+mR34bk8vGTh/yUZbmby+UYry+oIl7vvJ9sLUIX3/NnEVxtZbeOrY8TF+nrQsfT
         96jJJ9agiuiyPA/tfaJ4nryvBFK9uXTTcyAnAqLDpFYIjmhxwh/upSNZHd5EVXGecw4y
         J5aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rod1SamOGuDxRFME1GFue/66Syriwr+ZE7R2tQDf5ajde7SXLTvGbLhilNWelzA2xFL6tz9aKjcp+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrwaKI7fD/kz2HzyC5mQzY10Kw3xj7vpB3vSLhWPZ2jgf/lQlR
	Lt5spinvTxgtul4aKdUsEguG7VvfkbewceMDwy6HF4mhc3WrdwMQU0c=
X-Gm-Gg: AR+sD124tNPZGOr7Ftr8JxDsc/2xY/mhZ4sSsn9z6lAUiZOvOU/9YxTP4JXquXPzGEJ
	4y1m4Nah2w3oCdaC8uCUqripbdyYH87e/yxdcZouk6uX7/1rvgdZSoO5uVlgu3nEg/P7/TUI/Uq
	ZX8+ufTk7agOdtjMv+I+2Y0B3wzkrk55OSA9WfzGvWvkePpE3tQSiaoEnjiCnBbzwOV2ep+r2Xx
	3fkvUyelWBgqQumMqpNqd95+4l008E4T/cnQ9h4A42D2ShQLjw+niFo3/MHKR+BpvZJnkNuemOJ
	qijC+wa9SOcaw++jR4uOto+sqwJe3ikJg004JH28CWeeE9hqxArHeN0iW35zxDdhuaBxBFdweR6
	9zR4lYRyiFQYtNiw+ymZvKN9EtPlUUvVoNpuiS4BY+nfmc0bIJS1o+BPI3prlFEw9xVCrnfi7D1
	mcD0+MrKVJZmuMreP7nrZe2NchCFVqrhu6I3mbxJJYZINrht6I31oW2kz+DLyIIO/PIci92jDer
	ETE228oV5HIQePF1eLzXwNutls=
X-Received: by 2002:a05:6a21:3391:b0:3c4:397a:69b8 with SMTP id adf61e73a8af0-3c90d425340mr2161402637.21.1785450894427;
        Thu, 30 Jul 2026 15:34:54 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([106.221.78.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc6936sm23692181eec.17.2026.07.30.15.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 15:34:53 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andre Eikmeyer <andre@negmaster.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6] thunderbolt: Add device links for Apple T2 NHI
Date: Thu, 30 Jul 2026 18:34:33 -0400
Message-ID: <20260730223435.2874-1-atharvatiwarilinuxdev@gmail.com>
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
---
 drivers/thunderbolt/tb.c | 44 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952..d6efc822ebd5 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
+#include <linux/pci.h>
 #include <linux/pm_runtime.h>
 #include <linux/platform_data/x86/apple.h>
 
@@ -3305,16 +3306,57 @@ static const struct tb_cm_ops tb_cm_ops = {
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
+		for_each_pci_bridge(pdev, nhi->pdev->bus) {
+			if (!pci_is_pcie(pdev) || pci_pcie_type(pdev) != PCI_EXP_TYPE_ROOT_PORT)
+				continue;
+
+			switch (pdev->device) {
+			case 0x8a1d:
+			case 0x8a1f:
+			case 0x8a21:
+			case 0x8a23:
+				break;
+			default:
+				continue;
+			}
+
+			link = device_link_add(&current_pdev->dev, &nhi->pdev->dev,
+					DL_FLAG_AUTOREMOVE_SUPPLIER |
+					DL_FLAG_PM_RUNTIME);
+			if (link) {
+				dev_dbg(&nhi->pdev->dev, "created link from %s\n",
+					dev_name(&current_pdev->dev));
+				ret = true;
+			} else {
+				dev_warn(&nhi->pdev->dev,
+					"device link creation from %s failed\n",
+					dev_name(&current_pdev->dev));
+			}
+		}
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

