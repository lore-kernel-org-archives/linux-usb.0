Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F0207A20;
	Tue, 16 Jun 2026 00:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781571508; cv=none; b=SaJVQeHohb2EhJ5NygA7zOETHoZNL+C/ElOAAxwpGJe2uNt+Ofzl7jm8zKp7YrFwY4g8bwwehuNPvb7XsXNVVobAs3ayEdzaxg9HICs93715gBSwqh2z4ZhXogXNTWbk4CjMRP05caeD8PM6RJxf35g22toV2855noWLX+IPb9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781571508; c=relaxed/simple;
	bh=IqT9bD9DnwcjIcb+qgpb/NIWh/XQZFHVk4jIXnG6xM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n3SfJGrJPNQgLYo+W+C1qCkqaUa9PaLaSwqZye/IagPdVasFU4cDnVm7vO/2uA1Bo5rii+BPUD3TfrFsZf7u9nQSSsBLj/uJKrxeBLQqF0xdIvm5se65KHQlUQt2JDMx77ZOl2XVZrOcQHP4kaMDU3I1KbMn0IUiKpPri9jPoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowAAHINetnzBqFsXeFA--.7299S2;
	Tue, 16 Jun 2026 08:58:21 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] usb: musb: da8xx: depopulate OF children on teardown
Date: Tue, 16 Jun 2026 08:58:19 +0800
Message-ID: <20260616005819.11232-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAHINetnzBqFsXeFA--.7299S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4rXFyDKFW5Ar1DuFy5twb_yoW8Aw15pF
	WUGa4ftr4q9F4j9w4UWr4Dua43Ga1xta4jkrWxJw4F9345Jry0gr95JFW8tF4xAFZ5CF45
	tr45taykZay5CrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8-
	B_UUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

da8xx_probe() populates OF child devices before registering the MUSB
platform device.  If population partially succeeds and then reports an
error, or if the later MUSB device registration fails, the already-created
OF children are left behind.

Depopulate the OF children on these probe failure paths and during remove
before unregistering the generic USB PHY, keeping the child-device
lifetime paired with the parent glue device.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/musb/da8xx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index 4209f438ba18..af05c4bcb43c 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -562,7 +562,7 @@ static int da8xx_probe(struct platform_device *pdev)
 	ret = of_platform_populate(pdev->dev.of_node, NULL,
 				   da8xx_auxdata_lookup, &pdev->dev);
 	if (ret)
-		goto err_unregister_phy;
+		goto err_depopulate;
 
 	pinfo = da8xx_dev_info;
 	pinfo.parent = &pdev->dev;
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

