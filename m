Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5FD367F45;
	Wed, 15 Jul 2026 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124879; cv=none; b=rZG8/CJyj87enNyv+JBsWyMAqjyDZr1Za6OteAKFY0xxjR6pOFNDbVIgRSlrZfKsni1JKbpPhEIgXzBuNHJ0vE2KRHm9o8LH5UABtZhGExiVuE6zYaxEBvEmAckBxoFUTb91PsnpLb4JXFt6i7i1kG2q/f7Y6mDXbSv+71og3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124879; c=relaxed/simple;
	bh=MY+Weu3OElAh2SzxqR/XCg+ldoSXv3wpuINQxF3bKaE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MsLrAplzm70VtCDm6xuoKl5ziH2F4HrX1GHsNzMCVmfeL5JuQlLEwbN+iT4xjnYF2jYrHFM4I9gsLi4adybEWYN2oMlTDwMRzvGlbZFB+jC5PEpsJbor7m576c3McVyWZRdrOiPyYL15wxd+uyPl9Vcb5ixl3gBic5JSmTMH9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0004-musb-da8xx-v2.eml (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAAXI0HKlVdqF0ACAA--.2591S2;
	Wed, 15 Jul 2026 22:14:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] usb: musb: da8xx: depopulate OF children on teardown
Date: Wed, 15 Jul 2026 21:57:50 +0800
Message-ID: <20260715135916.24417-4-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowAAXI0HKlVdqF0ACAA--.2591S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4rGrWDJF4UXrWDKr4kZwb_yoW8Ary3pr
	WUWa4xKr4q9F4Yg3y8Gw45ua43K3WfK340kryxGw1Fv3y3XFy8WFZ5JFW0vFsrAFyrCa15
	trs8Jaykua98uFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDpnQUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

da8xx_probe() populates OF child devices before registering the MUSB
platform device. If the later MUSB device registration fails, those
children remain registered. The remove path also leaves the populated
children behind.

Depopulate the children when MUSB device registration fails and after
unregistering the MUSB device during remove.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260616005819.11232-1-pengpeng@iscas.ac.cn/
- keep the existing of_platform_populate() error unwind target, so both
  labels remain used and the patch does not introduce an unused-label
  warning
- limit the commit message to paths where population has succeeded
---
 drivers/usb/musb/da8xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index 4209f43..0c098a4 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -577,11 +577,13 @@ static int da8xx_probe(struct platform_device *pdev)
 	ret = PTR_ERR_OR_ZERO(glue->musb);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register musb device: %d\n", ret);
-		goto err_unregister_phy;
+		goto err_depopulate;
 	}
 
 	return 0;
 
+err_depopulate:
+	of_platform_depopulate(&pdev->dev);
 err_unregister_phy:
 	usb_phy_generic_unregister(glue->usb_phy);
 	return ret;
@@ -592,6 +594,7 @@ static void da8xx_remove(struct platform_device *pdev)
 	struct da8xx_glue		*glue = platform_get_drvdata(pdev);
 
 	platform_device_unregister(glue->musb);
+	of_platform_depopulate(&pdev->dev);
 	usb_phy_generic_unregister(glue->usb_phy);
 }
 
-- 
2.50.1 (Apple Git-155)


