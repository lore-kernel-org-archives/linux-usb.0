Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336832DEA7B
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514735; cv=none; b=drVuQYkG9GiphQPt36YjcPFuw4H0fX/AiC7CUmslYhZxNeBPNm/8ALLMlf9UZVnHFAK4x3LT1PCIkMjcKKRQkwYqQ8gWD82RkVs7BaWV3jCRFqz5DcO4X1DT5KywGnFQ838mrI0RvuKdCZIpWz/fTGRQ9e5mrqdvpWM3r998btc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514735; c=relaxed/simple;
	bh=x0XfJfYYmm0lZckHiSTrULL19u0GEKu1sJMJbH7EwyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TreF83F4e+DvgZd7XQTp0Bzth3+tm8TqLpzx3dn5gg5/feXxJuA0Y9wenRgXFEiAHwaiHHbV/Qeh6tVInkCucOfJUwen03Dbeicv3mvc5cmVSRvJSZpCIssSrcrJ1i1RjPvkEQHq5Sk4BxLmx1PfxaOjqE0/j3Kk39/jWNdnoNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHNd5rsL; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHNd5rsL"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso641962a12.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 09:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785514732; x=1786119532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fzIk5I7OqDCOAhpxa2DhuDUN9BeeRjYb7EQC4Ahia0I=;
        b=DHNd5rsLK3ZgbPHPbbPElaE2Oh3UZbKzL9BQNpigBmC5O6dKgVOzmH3U89iOFF6c53
         8Ako3Sy6O8Jvp6dA2BGCfre51P0g4QT8JnOfnerKZWah7d1VRLeHHU2Fy+m9/p4BW45v
         4KSrfHVlDELCRKJBSojFM5awB98feN4i/PwKH/3Jd4MXG7atEggW6NokqU9OoyOPmFlC
         0zmqoe1zuxrPupnu3OvW9L61wKoFfVJBvWcZQfPEcC9enCibqtzp5C9AgndpFa3vlqD9
         ShXgmrF88dCqawaBZV5i5SsAFyFxgjjIJuoUlcEYFkDAv4hkHVZC9K9runR4+WfXz1e/
         fXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514732; x=1786119532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzIk5I7OqDCOAhpxa2DhuDUN9BeeRjYb7EQC4Ahia0I=;
        b=l8/WQVCPLO6Ynoks4UM55aKvb0N6reP5jRgUZKRvA8YLUJandYdMMQwj8WaYg8+gTR
         7CxJPHrU353quDeLPa4emLxhuM8G2cz+4pyimiNDAufYbdpBoMUFV3TG4NU6klIy/64g
         l3uh2m1mj1n4apcV+AHEQfg4ehxt5LsVtGeTaZpsnzEMJCLuoUkEuN6MQCIGjHRczeSZ
         IbgT0KbA5aK98dy0jOnkBu8Q39wbfL/jStkR4OsPEfxz0dkPl3BDuhnTzgRQ8+nWfHKm
         qkcKT2IasuPLn5HRNqc2Mo2D0x2fxBWmvYXgOAlHGPreVrmgbNgDzJVycXtFhfYOKi93
         HjtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoNOBHWgvrRXOz8szOVyxMfw4bwiAf/1C0W7rev4ydt1dXq3oGoNdFKJLtVA4JnzSY1r/hBUI+2WxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzqvihPm4tWBG5J0c3YCeeMZH8qtaJTC5BmKo0rXlNhsXF8PmC
	MuyiLgC3+WvbY2+RkIqDi4WerWxqHu3l7WJ/Ctvayggx+CMQ1uc9ZXE=
X-Gm-Gg: AR+sD11NLxpYf8FuyzubTzBhjt4irrh7QFnGmc9s8Ku9Lz8toY/vsa35Z0gGJjYz7ic
	Yvd5X9rfzaeGDm1yyspDGgqQpVYckNqsH6kuVknmi8Ow93M5UAzI1NLaP+S3mgyLRgiFNSP48vb
	KQa+CqW+IaxfI9WzqeUGop0eG/7LiLlrd7zkYZxoTvRZoHRC4wR2S873P6uggE+LphqmbUV8YW+
	MEIbLIPEFR7whsDHe7IDHmC0Zcki61G4KulxvVH0vUpddyZrgv3MkiaF1N9sv4/Cmy3lSDQ7Bh5
	8yLWGRdUTRmovZOk4lE789gMQSei+ry/TQ4nqZjs1QD7iQQrCs7U/nGI0FPSLw90Wka3TUJsjKD
	wsRzf+4VrycM0caYhqUU1iVP/xRrCSdSLo5WHEfblH+dvNeQot6fTNnQhm4kPeaM88JWNVrpTTS
	mtSIhRJPN9u6FUbvQZ4+QHLkn61S19N5nnUEC7Itlzw+ICgXQOgV/e7+uwO59F9YsONa8YlfZti
	HJJ9OvhRv3wY6Mw1n7a3j531LSA
X-Received: by 2002:a05:6a21:9098:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3c92a51aef2mr413430637.5.1785514732276;
        Fri, 31 Jul 2026 09:18:52 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([106.202.118.213])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e107sm8486940eec.27.2026.07.31.09.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:18:51 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andre Eikmeyer <andre@negmaster.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7] thunderbolt: Add device links for Apple T2 NHI
Date: Fri, 31 Jul 2026 12:18:40 -0400
Message-ID: <20260731161842.12636-1-atharvatiwarilinuxdev@gmail.com>
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

