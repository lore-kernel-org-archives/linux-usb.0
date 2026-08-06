Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C0E175A5
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996381; cv=none; b=BInKWrAp3bwjcBhW53FKc9Dz841BgkyYv+Nfig6CGadRh+mT/fjG+EZh7dqxEXQkJj7DwMfoRfZCTCfY0IbvN9XDAbERYd+t4UH2BXx1PiI1/qYvlsdl9xoG+BGf2mRNlmtXxY6rS2mOdQDL2aVzVzndMQu1hddG3oNhEnA7/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996381; c=relaxed/simple;
	bh=xsrTge3eWwPPq308AUwT/LxDk8fxpDPLDRp3sqCjaEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dDZKzIVPWl+MjwaiINqPnWyjV63jIm4R/RDQd0pJu81karSh2p2ksc/eT2phsO3UX/GmW2zBsQ+0KvDfmb6eOpEpqxfR9VSHhaNDuuwNbV6otOIMzO6E2qZgSMpBN/GjWKCSE5jw3rgSoTu9Yjrg9+ngZ8zJyNdQPT4WZJLTJ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=TnjF48To; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="TnjF48To"
Received: from LAPTOP-99KJFSET (unknown [36.153.54.46])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48fb94a23;
	Thu, 6 Aug 2026 14:06:11 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] usb: host: ehci-atmel: stop clocks before releasing HCD
Date: Thu,  6 Aug 2026 14:05:57 +0800
Message-ID: <20260806060557.1747-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fd5add33f03a1kunmf64ace83289325
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEMeVkhLTh0fGk1MSEoYSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKTkhVTk9VT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=TnjF48TodI0UM6Ent6KhPkPvq60fAo5GUq4k1IDbtyQ6zpPaqbtHcvBZ5zpoq60tz2LsoY7hSBs/Lu7jJQ+4hswBMrAolt6uksuMXYEmHD5YT+8oQzDUEQlI+6BnqfAMX1xP6H7LZ5+tck/aQJl6kNg3hgNJgzKA1QoPUYHRPj0=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=nL86Otcun7yyb1ytBTWGfmqSL8gl/fJkNRzwafPytk4=;
	h=date:mime-version:subject:message-id:from;

usb_put_hcd() drops the driver's HCD reference and can free the HCD and its
private data. The remove callback then calls atmel_stop_ehci(), which
obtains that HCD from platform data and dereferences its private data to
disable the clocks.

Stop the controller clocks before dropping the HCD reference so that
atmel_stop_ehci() cannot access an already freed HCD.

Fixes: 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 series")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/usb/host/ehci-atmel.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
index 65747270fd88..bcd56f888ec9 100644
--- a/drivers/usb/host/ehci-atmel.c
+++ b/drivers/usb/host/ehci-atmel.c
@@ -177,9 +177,8 @@ static void ehci_atmel_drv_remove(struct platform_device *pdev)
 	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
 	usb_remove_hcd(hcd);
-	usb_put_hcd(hcd);
-
 	atmel_stop_ehci(pdev);
+	usb_put_hcd(hcd);
 }
 
 static int __maybe_unused ehci_atmel_drv_suspend(struct device *dev)
-- 
2.50.1.windows.1

