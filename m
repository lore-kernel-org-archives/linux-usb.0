Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2F9351C25
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 23:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783984386; cv=none; b=l7XVz8Q9+XWnt/vCjSF3q9353grYz8iZkBlktQv5qyJ0tOQxJNQTwKjtotUNwUFOwxQDKuijFdAEHW6WOslVN0jC8Ifx2OQRA+ZuKr2LckQtlODQ7A+s59QmxkG9YfmQN29rOVMI9NkJnOHm7fhstrAHnT/g9rRdxS4AP5JkHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783984386; c=relaxed/simple;
	bh=D+9DxGA9152fq3R64B5ifYMqljUSrXKhB8lJk19OIbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c9dC5Wm450DLFLc+NdkTypV3shGfk2mmV4bgys8eMZ+hjVJe9fi4UGSA/xnuxU6XdtPyzWwhmAsTy38wNAmEXowTa1E2/SRwYmTrVyvjnECp1k0/7+CTGVOFls5Y4tWiOVrMKAyayZ4ri9s7RvoesVxHM+gxNsnFBX+QtTzuRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=og4tZ1u6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="og4tZ1u6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad4170e8eso42685945ad.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 16:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783984385; x=1784589185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4frmzDud/t/Oc/bcsYFoHimfeTx60ofYbikyBifGLs=;
        b=og4tZ1u6Bt5gd9k/ZFZCNS4WYtPxf6PnClrg6/KkczbAl0qeMjT9nfGjYOzoDlBLoD
         vhGdgADvJ2jyrXj3Vg0bCe23ZbTOoxfR9IyLHxWZWifp1tjT/59CAKF1wh5GVRQNfNuU
         x572hiIIacBJrL+tPutPYowBUAyNtPOvGldMLCaBUe97lYcJvf0u6iV/OnBoB6sVUBio
         6Q+YenJyyiFX4EPOHRK6lq9zUQNZ4ZueB13eJOdHGctqwWVAR8X3EIna3Up1ZLeS6Cq5
         nisxmR+y8u58nzeOM51TXp+U+IOlE+fKZrHtIQjVnBxovS6vbOvb8+j089Ixr/4jsqQK
         xN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783984385; x=1784589185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4frmzDud/t/Oc/bcsYFoHimfeTx60ofYbikyBifGLs=;
        b=OZxlrXTtn/Ru2ZSdDQjDUEkhgPsKGY+Kgv2vl27yGpcvCgNBzxNS2hk8ddH9XJsPQ8
         a5Pig7zQMHuN5tBfaSefRCBKiirD0wVL/jCNohE1k+9+G5Wyi+0AxEBo3ha1QjrGvh3R
         gltoFDs4zAVrVGdzRDec6T0HK68Q96wDGoUF5ov4fRbia1Zrue+1oxZdviYVafPz7lQu
         4TFK16YZlrEAunIFjsVV1RbUFnPoeitUub+a48XD/H86ajJlftbdQVui6MBUYMtDKC4f
         jUcyhn3SvVG+OGlbmub9vdoxBSwT0VJ9xmgcHEzO3QuEh5bJL6oOoszlUUB8phaokKBV
         +gVQ==
X-Gm-Message-State: AOJu0YylXS4kpEvRwzOgT6P79e7e2UdwE9Fxx/I2w1y3iqxg2jyafAle
	vL0+1oujmEoQUI1hYm7iHTS8J1BUXyFrdTb2MK55xMw6OzmZ9CWcEh5V6RbNQQ==
X-Gm-Gg: AfdE7ckZoM40aZxBAyJezwCCIkiR6t0CoAV4UAuD4xDNvtmnzS41q/ZDz6Km22WhqgV
	cWeJXOOZxyLA9/e+47lpECNULsuijw/OI/XrkSmHL3//ShoSG5BXB8iHi1FYIbCIsLg9nhkoIg0
	K15fxxz7088yoEgB+snck5Dj5UHe3QIngyY38KwYy2imURbUQ1ffocJ9zqmfTOZmxe0kdgxzKkV
	/da4KTdnxSQevS60Pd92avtNTEkAT+Kz8dlGGqCHHg/e6fP4cmtpkkUUBDqF8McoowpEhqVJC3l
	4Wuod1GoxmmezwLaUkaJEnc0iNT6Op5//6z2kM8fdmnPxLXEgBlA6Ivmcg24KRK/mcMPxATOTxH
	+n6CGudK6eKb/bEg2WabPaKLygWf+TNrrGEyokkW2kIVooxaJh0ZJYrZeOtG+dUEhHt48SsztFK
	kIHUkUHx5RFSKOVHBRNIQmL+WNSz7RHvbxxmYpGzmV81Qtq04e8cYSGdTm4Q8G5+acejXpMYUrw
	tbwxSiNyJfeW0gc79MF06T+MyWUOAWZvReopjpSsfCvG/E0sgRGtfAypTY8z1synw==
X-Received: by 2002:a17:902:d98b:b0:2ca:75b1:e1e5 with SMTP id d9443c01a7336-2ce9e79f444mr103871895ad.4.1783984384697;
        Mon, 13 Jul 2026 16:13:04 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb73asm106234995ad.17.2026.07.13.16.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:13:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] usb: ehci-ppc-of: use platform for irq and ioremap
Date: Mon, 13 Jul 2026 16:13:02 -0700
Message-ID: <20260713231302.1076740-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded of_address_to_resource() plus devm_ioremap_resource()
sequence with devm_platform_get_and_ioremap_resource(), which looks up the
resource and maps it in one call. The helper returns a pointer to the
resource, so update rsrc_start / rsrc_len to dereference it, assign the
mapped address to hcd->regs, and use a separate on-stack resource
(ohci_res) for the unrelated ibm,usb-ohci-440epx erratum lookup rather
than aliasing the returned resource pointer.

Switch IRQ acquisition from irq_of_parse_and_map() to platform_get_irq(),
which only retrieves the interrupt the OF/platform core has already set up
rather than transferring mapping ownership to the driver. Drop the now
unneeded irq_dispose_mapping() calls (probe error path and
ehci_hcd_ppc_of_remove()) and the now-unused of_irq.h and of_platform.h
includes, keeping linux/of_address.h for the erratum block's
of_address_to_resource().

Behaviorally equivalent with respect to region reservation: the prior code
used devm_ioremap_resource(), which already reserved the region.

Built for PowerPC (ppc44x_defconfig + CONFIG_USB_EHCI_HCD_PPC_OF) with
LLVM=1; drivers/usb/host/ehci-hcd.o (which includes ehci-ppc-of.c)
compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/ehci-ppc-of.c | 47 ++++++++++++----------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/host/ehci-ppc-of.c b/drivers/usb/host/ehci-ppc-of.c
index 8063b9d3aebd..457d15da40a3 100644
--- a/drivers/usb/host/ehci-ppc-of.c
+++ b/drivers/usb/host/ehci-ppc-of.c
@@ -18,8 +18,6 @@
 
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
 
 
 static const struct hc_driver ehci_ppc_of_hc_driver = {
@@ -96,7 +94,9 @@ static int ehci_hcd_ppc_of_probe(struct platform_device *op)
 	struct device_node *dn = op->dev.of_node;
 	struct usb_hcd *hcd;
 	struct ehci_hcd	*ehci = NULL;
-	struct resource res;
+	struct resource *res;
+	struct resource ohci_res;
+	void __iomem *regs;
 	int irq;
 	int rv;
 
@@ -107,39 +107,30 @@ static int ehci_hcd_ppc_of_probe(struct platform_device *op)
 
 	dev_dbg(&op->dev, "initializing PPC-OF USB Controller\n");
 
-	rv = of_address_to_resource(dn, 0, &res);
-	if (rv)
-		return rv;
+	regs = devm_platform_get_and_ioremap_resource(op, 0, &res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	irq = platform_get_irq(op, 0);
+	if (irq	< 0)
+		return irq;
 
 	hcd = usb_create_hcd(&ehci_ppc_of_hc_driver, &op->dev, "PPC-OF USB");
 	if (!hcd)
 		return -ENOMEM;
 
-	hcd->rsrc_start = res.start;
-	hcd->rsrc_len = resource_size(&res);
-
-	irq = irq_of_parse_and_map(dn, 0);
-	if (!irq) {
-		dev_err(&op->dev, "%s: irq_of_parse_and_map failed\n",
-			__FILE__);
-		rv = -EBUSY;
-		goto err_irq;
-	}
-
-	hcd->regs = devm_ioremap_resource(&op->dev, &res);
-	if (IS_ERR(hcd->regs)) {
-		rv = PTR_ERR(hcd->regs);
-		goto err_ioremap;
-	}
+	hcd->regs = regs;
+	hcd->rsrc_start = res->start;
+	hcd->rsrc_len = resource_size(res);
 
 	ehci = hcd_to_ehci(hcd);
 	np = of_find_compatible_node(NULL, NULL, "ibm,usb-ohci-440epx");
 	if (np != NULL) {
 		/* claim we really affected by usb23 erratum */
-		if (!of_address_to_resource(np, 0, &res))
+		if (!of_address_to_resource(np, 0, &ohci_res))
 			ehci->ohci_hcctrl_reg =
 				devm_ioremap(&op->dev,
-					     res.start + OHCI_HCCTRL_OFFSET,
+					     ohci_res.start + OHCI_HCCTRL_OFFSET,
 					     OHCI_HCCTRL_LEN);
 		else
 			pr_debug("%s: no ohci offset in fdt\n", __FILE__);
@@ -170,14 +161,12 @@ static int ehci_hcd_ppc_of_probe(struct platform_device *op)
 
 	rv = usb_add_hcd(hcd, irq, 0);
 	if (rv)
-		goto err_ioremap;
+		goto err;
 
 	device_wakeup_enable(hcd->self.controller);
 	return 0;
 
-err_ioremap:
-	irq_dispose_mapping(irq);
-err_irq:
+err:
 	usb_put_hcd(hcd);
 
 	return rv;
@@ -196,8 +185,6 @@ static void ehci_hcd_ppc_of_remove(struct platform_device *op)
 
 	usb_remove_hcd(hcd);
 
-	irq_dispose_mapping(hcd->irq);
-
 	/* use request_mem_region to test if the ohci driver is loaded.  if so
 	 * ensure the ohci core is operational.
 	 */
-- 
2.55.0

