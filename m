Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E55E5464D;
	Tue, 23 Jun 2026 07:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199948; cv=none; b=ZEuN896DF1PQfvxbXuG9JWlSL1LO54w+QHviv/2xtM0KSiTxQdGhNnXo7HCeGlnqt2XB3LXXHxXUYjXAr9MxqYVEHhSnaPXkS5j/DR7XoeMyeeH4JSKm4QyMrSyMI1P6rzq82qk2ghHQo7rjkf/OCKbG96s+GF/ckS0+LVnUiwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199948; c=relaxed/simple;
	bh=Z7NuXLL85AKklKVTgfKUJYQzTHVgy3BYHiLHX8RTyac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X4d+dRkpQVrTiVijKBRNELZ5oH6HQem+6B9di/yFEpKbToJu0FtPJKbYq9L8qQ0wJW5DqTCW99x0PjtcEYQmdR1QJYg+qY9Q8kPWyCMR1V9ply4QrCe1ibjC1+IrJMdTb++O7KsoAwe60aV0ABYpsTqHTx56J8xAnbg4O+3woCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=n321BFaC; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="n321BFaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	To:Cc; bh=X70VlmlGWG7EgShrtCroZrXKuh8lOUgyTfGh9Rs1ALg=; b=n321BF
	aCmRZ0nAaX6WaES2KHDXPWUJONGupsX9piTGlSoJDLwIzGAnyY1cLdQzB1kpDiwq
	dZdSjWPf68k0MiG/dxZzpI3HrBlkW89fUzeLNdFnFRqa/99kGxe/JAmdi8UKcJBE
	XwY+v421Y1uJVBjG1QSGcYQRCRsgrjBYEISj4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkOiNjpq_noMAA--.13997S2;
	Tue, 23 Jun 2026 15:32:50 +0800 (CST)
From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
Date: Tue, 23 Jun 2026 15:32:02 +0800
Subject: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-xhci-via-dma-fix-v1-1-3f12c81a1cf8@ultrarisc.com>
X-B4-Tracking: v=1; b=H4sIAHE2OmoC/yXMyw5AMBCF4VeRWZuEosGriEXVYCQuaRFJ03dXL
 L+TnN+BJcNkoY4cGLrY8rYGpHEEelLrSMh9MIhEyESKDO9JM16ssF8UDnyjLmTWlWVFqsgh3HZ
 DYf6STfvbnt1M+ng74P0Dj1LN4nQAAAA=
X-Change-ID: 20260623-xhci-via-dma-fix-c563b889ea54
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>
X-Mailer: b4 0.15.2
X-CM-TRANSID:AQAAfwAnEkOiNjpq_noMAA--.13997S2
X-Coremail-Antispam: 1UD129KBjvJXoW7JF43JrW3Aw4UZryxuryDJrb_yoW8JF45pF
	s8Z3W8CrZ5tF4fW3ZIk3WxWF95A3W0ka48KFy7Cw1DKrs8A3y5GFZrGw45Xa13uw4kZw4Y
	vF1kKr95Ja4kWaUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	c7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU1nmRUUUUU
X-CM-SenderInfo: x2kd0wp0lquxxhqjq3powut2xlvfhudrp/1tbiAQAHDGo6AssAEAAJsK

The VIA VL805 XHCI controller (Device ID 0x3483) fails to handle DMA
addresses correctly when they exceed 0x1000000000 (64GB). On systems
with large amounts of RAM, this hardware limitation causes device failures.

Add the XHCI_NO_64BIT_SUPPORT quirk to restrict DMA addressing to 32-bit,
preventing the controller from receiving addresses beyond its hardware
limit.

Signed-off-by: Xincheng Zhang <zhangxincheng@ultrarisc.com>
---
 drivers/usb/host/xhci-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 039c26b241d0..99c2dc3cebfe 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -448,6 +448,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_VIA && pdev->device == PCI_DEVICE_ID_VIA_VL805) {
 		xhci->quirks |= XHCI_LPM_SUPPORT;
 		xhci->quirks |= XHCI_TRB_OVERFETCH;
+		xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
 	}
 
 	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&

---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260623-xhci-via-dma-fix-c563b889ea54

Best regards,
--  
Xincheng Zhang <zhangxincheng@ultrarisc.com>

