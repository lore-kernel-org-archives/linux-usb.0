Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E51B6D08;
	Mon, 16 Mar 2026 08:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648022; cv=none; b=j7CCu2eZhBAaqwcW14eYitjUcBCic6UUls/s+3zZ8WJGqaSkbQ6aj9Ro6khp6FvyTIxZXUbI46fKinWxsEfY1RilGDbGdoLY8OvS1SFZi517Tx5mQwlxcMs907iWL924vTKtMb4PDWRKC7k2o4N3GZTOsFamOvdSMP1/OSmKwqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648022; c=relaxed/simple;
	bh=nA1hNX7RMF9BhK/4FLzAfTVCK8P9ZbrAkp6+REA1GqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UUi3dfwLAjM5sBK9U8Gq3fWN3CIBGccJXhXoC5IJ++3U/q+Hzt5L2VzzwHzjvoROX/SH1tMTOt6jb4NzqzorWUSPCO6tUJCq+MOAM1ahY8MF20h0glP8H3gObMjM1E9ao/wWiYerASGHl4E5/0r4O1SuhO4/UTl0ZzeEFKgK5Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [116.25.94.199])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3714cc931;
	Mon, 16 Mar 2026 16:00:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ze Huang <huang.ze@linux.dev>,
	Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Mon, 16 Mar 2026 16:00:00 +0800
Message-Id: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cf5a8d34903a2kunm97eee50df009b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUIeVh9KTkkaSUxKHR9KHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJCWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0NMVUpLS1VLWQ
	Y+

Some boards provide USB VBUS through a controllable regulator. Add
support for the optional vbus-supply property so the regulator can
be properly managed instead of left always-on. Note that this does
not apply to USB Hub downstream ports with different VBUS supplies.

The enabled and disabled actions of the regulator are handled
automatically by devm_regulator_get_enable_optional().

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
The vbus-supply property has been declared in spacemit,k1-dwc3.yaml
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/spacemit%2Ck1-dwc3.yaml#L71
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..83b4e4d69ba9 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/regulator/consumer.h>
 #include "glue.h"
 
 #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
@@ -113,6 +114,10 @@ static int dwc3_generic_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get clocks\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "vbus");
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to enable VBUS\n");
+
 	dwc3g->num_clocks = ret;
 	dwc3g->dwc.dev = dev;
 	probe_data.dwc = &dwc3g->dwc;
-- 
2.34.1

