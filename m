Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7624380FE5;
	Wed, 17 Jun 2026 08:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781685367; cv=none; b=WfXKsWdz5wfgyqBj3hAkTCUTCwoA51is0ZdKtdAvXCw3FQAsBjW+rALMcqeSLc/WhKZaHplJAiXVwIvbN9Z+Tlc7bmc9F8hf9wuCaHQmt9ozt3vffoAJ622wxZvd7DBhMYVti4tpj67+VFgiDCCDY0Bg4Y3y+oNbOLihZshWuBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781685367; c=relaxed/simple;
	bh=rFk9Dz+OQl7pCrKzNhGH3W4iJyugBYla2kbVlG4ZwIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oS7mIxxJuZqBXgJL8vjmgurqom6qPa3fINTn2sTR6D2GVCF5OV+YRQ9b5yYtja5qnbEQjeX9XM56RqJoO0/u1OUPGiBQ6XznHLJWjrVkhLVk3XIDRNY97DSQ2wwVp62Hw1eNeqaRYC4VEJXy5P1ldMd8t2J8rGp+sC0wbbtX3VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=fcrTt2WJ; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="fcrTt2WJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781685306;
	bh=9e+TqUpkTXuK1EcikghW+cE29+U9fhClyyDN9ZFVYOg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fcrTt2WJd1rxRqGv+cLSGKcKvTZF28hOyPMIHlGDGekb9b+3v7l3tvdadYw5eBsEC
	 HfhADRy6Djv+l0bfWqlefT+9q34cVZZcKO43lARkTY1J+Ghx6feAmmzFuaaNtCtI1v
	 ZanKT1d9dCLHpSA7+SkqCv6rygdIffDtvY8JnOeg=
X-QQ-mid: zesmtpsz7t1781685302t483993b0
X-QQ-Originating-IP: gz6fZEAQ2pZjnrBt6+SWmcxKBgudbZ/TbDk3lOABZik=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Jun 2026 16:34:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6232479303334653688
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] xhci: pci: Disable soft retry for Renesas uPD720201
Date: Wed, 17 Jun 2026 16:34:54 +0800
Message-ID: <EDCDD0E72ED38009+20260617083454.2764851-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: ONcd5u+FjiuQiw/9lD4CG+A5F19PfQ023l5w8lfB+dglllwBqfvBLGAI
	YAa3izJ2MWgfi24/afMw0+V3ECC4AhasuQXtU6mcgwSShH9Cpt59qI2hYiBh11PE67wnGiq
	Qrn3u+Vre5V/1kvoQ9ry/s2rchACCE32s69C3W9j8ZbCepCYydE07T12FqqqSW23JlBcCEf
	XT099fKSg8sLECiGYuD1iRuw3LPnpkhLvYMR5SYDMFoUs/xvVYhnhiA3UzRueEcMuGFBbue
	9q5dv+MEuSqVmU6xCI35ZXhpv3wABZPohQY8COwuvvfN2uaQaBMZryXwLWxfOCqi25qP6wD
	4V0MEm0u3UzpyZf5cd6wgUtIgP7xtwV9CB/HvXM/+UW/BqvbUX2wI+Q8pMmH5jxbFcy8Z7I
	76ittAMFzGXBO04SocMjAxwXZs/kQmhxRSMyV/SCFq4FnyZmlV/dmCxj0vhFp8FU0P8YbBB
	9eIzWScSgViYYlKGUFheTexFfhA/UgbNNXvk12nvIJDvr2oHvY9ooefRzxHqFIQJ4oGkCzh
	3SENpGgcSDqvwuen60VQw4FMDBTSG8LanKww2fwswqW1BMRDNVCN7axc/b4DrWyTPIoaiQI
	IwdRTYvuolqhxkdQXbGYc9DAd6kuKVGAuRfC07DiqstoqOTuemZmrTO7TvEaETWIvvNXtMN
	+NoS35mktuubVHs606RlVxb4shJ0u3fWfjnpS6c4nxOatzs19SqZaUDcZp1zPv0mdNCPXyf
	bke+jQp3ZWRO2yLMkbITypDdxFLIcGFHn6dyyw0y26odbkq26in6P6iyXLpypzjma6JNfwt
	ooI0wjRMJHGhlnNssGyPUtFtYJbcCRnZ4P0qVVIaAbzh0ITQ5Pk1Fx2fMthsY8IVz0YYYSd
	WGnDTP7vpTyR5RzuQJeQfqTCDQmSFI5D3Pz+V+Ajl4lZP9+v/8yFoLKBGhenW+yAGFa4muE
	TRt3CH+ssU3mVU6S2v+4+KtgH0EmDuVNmH6J3BhqnPvi6RtwkXM8b3b+OgmJw53t98N6v9D
	Zy2qqFoY+uQWUF+7mHPcyHHCwokvaenuvmdbPpmshzAzX1wkU/rM9zzpj2lPg=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

The Renesas uPD720201 xHCI controller can fail to complete
a Stop Endpoint command after a transaction error on an interrupt
endpoint when soft retry is used.

This was reproduced with this setup:

  xHCI: Renesas uPD720201, PCI ID 1912:0014 rev 03
  dev:  USB Ethernet device with an integrated Genesys Logic
        USB3.1 hub, USB ID 05e3:0626, and a Realtek RTL8153
        Ethernet function, USB ID 0bda:8153

Reproducer:

  1. Plug the integrated USB hub and Ethernet device into the
     1912:0014 xHCI controller.
  2. Let r8152 bind to the 0bda:8153 RTL8153 Ethernet function
     behind the integrated hub.
  3. Bring the Ethernet device up.
  4. Hot-unplug the device.

The host reports a transaction error on the RTL8153 interrupt
endpoint, queues a soft reset, and later times out the Stop
Endpoint command while disconnecting the device:

  Transfer error for slot 8 ep 6 on endpoint
  Soft-reset ep 6, slot 8
  Ignoring reset ep completion code of 1
  xHCI host not responding to stop endpoint command
  xHCI host controller not responding, assume dead
  HC died; cleaning up

The Renesas 1912:0014 controller cannot safely use the xHCI soft
retry path. Set XHCI_NO_SOFT_RETRY for this controller so
transaction errors use the pre-soft-retry recovery path. With
this quirk the same hot-unplug test no longer times out the Stop
Endpoint command and the RTL8153 remains usable and stable.

Fixes: f8f80be501aa ("xhci: Use soft retry to recover faster from transaction errors")

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..d70c6a6a64bb 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -427,6 +427,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
 	    pdev->device == 0x0014) {
 		xhci->quirks |= XHCI_ZERO_64B_REGS;
+		xhci->quirks |= XHCI_NO_SOFT_RETRY;
 	}
 	if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
 	    pdev->device == 0x0015) {
--
2.50.1

