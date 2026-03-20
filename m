Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92595355F3E;
	Fri, 20 Mar 2026 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000927; cv=none; b=mQojp50WTQOGOE0fNWF4/McTnqfB724MKoIOMKObkWrKLwWjHzuXhPWwSq2r08Bx6X8eDfrDEAizSwdbGUoLOz8JkSDwFobMOx+usv55lR1YWQ5JZnR5yfLACSWnzThHlurti6AC6mm1mekDekJnUC4yy6xe2bMr6POFZROo0JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000927; c=relaxed/simple;
	bh=Y4KLepPin77y9WzoHrLak4rnnvcszM8PrtI+x1uLbyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sHi9aHxHUR+opbHRErkdA8wXJt//ZFT9x0xY5LgVjLGCTpHF+XnDNd1MpIFU0WeoTWyNBW/svNteS+uNIqlziokga5BUMVfAM9ErJWk1Dh9q1H5HcZ5MNFuP9WXQAakaUfwZiFITwNvLPkPequzlBjXjRpkvRql8M1siQEj0DBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37b2f4e4f;
	Fri, 20 Mar 2026 18:02:01 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Fri, 20 Mar 2026 18:01:20 +0800
Message-Id: <20260320100120.1343629-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320100120.1343629-1-amadeus@jmu.edu.cn>
References: <20260320100120.1343629-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d0ab1db8c03a2kunm090bbcfb1f2c71
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUlJVktLHkhOQhhCGR1PQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0hLSkxLVUpLS1VLWQ
	Y+

Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
through a controllable regulator. Add support for the optional
vbus-supply property so the regulator can be properly managed
in host mode instead of left always-on. Note that this doesn't
apply to USB Hub downstream ports with different VBUS supplies.

The enabled and disabled actions of the regulator are handled
automatically by devm_regulator_get_enable_optional().

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..bd281fde5ce0 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -12,6 +12,8 @@
 #include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb/otg.h>
 #include "glue.h"
 
 #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
@@ -69,6 +71,20 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
 	return 0;
 }
 
+static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
+{
+	struct device *dev = dwc3g->dev;
+
+	if (usb_get_dr_mode(dev) == USB_DR_MODE_HOST) {
+		int ret = devm_regulator_get_enable_optional(dev, "vbus");
+
+		if (ret && ret != -ENODEV)
+			return dev_err_probe(dev, ret, "failed to enable VBUS\n");
+	}
+
+	return 0;
+}
+
 static int dwc3_generic_probe(struct platform_device *pdev)
 {
 	const struct dwc3_generic_config *plat_config;
@@ -210,10 +226,14 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 	.properties = DWC3_DEFAULT_PROPERTIES,
 };
 
+static const struct dwc3_generic_config spacemit_k1_dwc3 = {
+	.init = dwc3_spacemit_k1_init,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
-	{ .compatible = "spacemit,k1-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
+	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.34.1

