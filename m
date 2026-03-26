Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC66D3CB2E5;
	Thu, 26 Mar 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519232; cv=none; b=cRLqla5KXycSwpbOKcOTAMnFM7un+GpSgzE5StCHy4HkG4CSHB+zRgGrmFt4VxiC3xIMwXeHFVbfp3JURA+28zKOrkahStoN6VtHGEiX6Y0jkH5/9OoeZYtZMLy6UMrFfzKH5KEESWnZ55NtwfdBEcb00BRzb/olA/1bwQiSwdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519232; c=relaxed/simple;
	bh=A6B6kork2804l4UPj6XY1tqmpucgrketuWPpPSNm1ss=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lsaq6OHCOvCEf8WtQqffnLwd7SVFERKvNQApA4ft0IHbM6JkptjOON6cmOd6EXqzK2vg91/FFQRIiRjLjdAHCF+A2eYM6uUT2HzRBGYsxPO8wO0jGiohzchIJdd2W1pkNVqCdG5+AdopW9pDaKEGgBURxTiXvJ1TvIrnG46emuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [116.25.95.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38672f751;
	Thu, 26 Mar 2026 18:00:19 +0800 (GMT+08:00)
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
Subject: [PATCH v3 1/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Thu, 26 Mar 2026 18:00:10 +0800
Message-Id: <20260326100010.3588454-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
References: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d2996769503a2kunm60643231383ea9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGhkaVksdT0NNGUtIQhhIGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSktKWVdZFhoPEhUdFFlBWU9LSFVKS0hLSkxLVUpLS1VLWQ
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
 drivers/usb/dwc3/dwc3-generic-plat.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index e846844e0023..64f5e9f20663 100644
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
@@ -201,6 +217,11 @@ static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
 		       dwc3_generic_runtime_idle)
 };
 
+static const struct dwc3_generic_config spacemit_k1_dwc3 = {
+	.init = dwc3_spacemit_k1_init,
+	.properties = DWC3_DEFAULT_PROPERTIES,
+};
+
 static const struct dwc3_generic_config fsl_ls1028_dwc3 = {
 	.properties.gsbuscfg0_reqinfo = 0x2222,
 };
@@ -211,7 +232,7 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
-	{ .compatible = "spacemit,k1-dwc3", },
+	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ /* sentinel */ }
-- 
2.34.1

