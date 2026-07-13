Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0110D3D1718
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783984571; cv=none; b=hrHTUzxd7POTSsuoCe+QlWj9D1eG88MG38BrGR/i3d73n5T6Hy/8SiF38QlGekDNzCrJdZ0+yc2ez8kvotk1BEgTKo11vCr8yYJ53+2BmE+pB52iy05ovXB+D2MPhhatE70Er3JsGWKoAcIzNV+0vgFq80GZNbXxhrUmC5ICMYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783984571; c=relaxed/simple;
	bh=xi4XLb5qBsbOyGboUbhPURXcEV7axu9PupvEt5dLKSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mAvcoG+rq64eL3zJPvwy+EH5sgAPK8l4HTvhErbbuGJAiy6SvXjoIx2biBHzzAa8c8T3YgXtxeDNkA1jEIqH5CBXM0QJyWgoO8C6l/vXtP9DdBo0BBf/DYMQtEp8wDq/T1jyK6U8Zocks1SRDfO7FGzYytTS+dwQGlbAwkwVmcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWgBV4qg; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWgBV4qg"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca80d708489so270007a12.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 16:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783984567; x=1784589367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hW14DA5ad6cBBgJfRTqHvDQ+60aG/svK+L09SG/oC1w=;
        b=nWgBV4qgJM2RR2jIvToxutesvc0lOiJwNj8okjlgdZc52393iHteMriOqjLWBPA+kv
         GkwHmd39B5M8BRsXI7jCzXUlidK3XJYIAsIjdmV5OerIlUsj/Ah+csWpYjwHt2iagjkW
         PzEUMVBMNiDTx2aq1IZhWIIxVRN1W6NGI7ruhrITvXaGk4dPgFshEq5d/Cxg+CRmcUb6
         s5ZcxVWHs4deKdBvV20L2Fsp0ONuBIdBMUtxXcyZs7QX7HX7k9bBJIv1xmK6aqdHHX6W
         KQIsjvvexi5Bj25Go005+HDxftmupNbb6YldUu251dckKebMnAVy1Ze1TFTFXPov50sy
         2+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783984567; x=1784589367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hW14DA5ad6cBBgJfRTqHvDQ+60aG/svK+L09SG/oC1w=;
        b=S48zEwuU5t8IdwN3+kqYXEjvTGXdkfdLAkme1hGWDIhrhmsjIprAbxuYaDa6BWsSai
         VKU3qvZDCPxLOYzZ5FGl9QcnTtmd+JmNk2wiK5dDx+vnOmFruraRikyqDrH7mFlSoERb
         qVCBJYsrINevDfUJKu3mziYwKcWs6aQ6B5Av0Ez1j8w1LRfxr2BVANG/S1XrlBbnBI3f
         b4wiVKEmv50Nb5lvOeU2nbXfcmpeiLWuKe4EXRJxNKd1M3SfS8BLY0MUEdbLMo/Iiecp
         C3l/Zrn5deD2tN27DuixH0k1EC6B8abEF2L4VQ0Lvi0ZqMkCn3K7fP1vKZ2zJR9sfLw5
         CXQQ==
X-Gm-Message-State: AOJu0YyLEwWS5C8ysXkhCGdUpq4XpI/JdJLuyAYIn9dbjt/OVUqiihXy
	RMMUz7+LMp2wX2fdWk0btND4/iHXVD0kIdTwcmXMc0sqnhYbR4c07tK6CymeOQ==
X-Gm-Gg: AfdE7cm6RxGwPUjqWwcYf86yUW5jKfIfHAvV8BeR95ynWQNtapoTHli+xmKXI50NjfQ
	pXwWfFDd1/wnESmXn58tiVTJGDrTx3dE/C6hckTN5G0P+Vta27Fr9b1pN0TE3DKQxhTKBQSdLaY
	rfjGgQOp+26MLr423xBYeeEBLRzA/uXUP9G4huWQcVV+jodr14Tuj1wBw+qtWJB1qomOYqLob1r
	jouJjeLUjrUollhHF33UAaOKAy4PidP6cIZKj2LsL0u9j3pCRwDZZQd4Q6890VRfr81GV9yN2GB
	OAT3RmEQe7n+3AiGcY77+Dw1piF5JEDdjVmVaXOZxDonnOzcUDULnrR0+qF59dHByRqoYC8kVJK
	DS0xB0p0gNj5ijjfC7gsRlVwmg9dvpyFidrYsCL++O+xKfk5oBtv6qA3zvXqbFjGx3IYcHgOEsP
	gNYqc1T3jsmIlV1o2FLjpUhYes4EO/SSq5MmeH/pArfIBw3Pq6fhlq05AyjrA63ixnO9MjSezJ2
	kjWC4qiF4Fq9mAEoHxIUGoPISUsV7bULpWqYXzKDT4SS8tLyRp1k8BC7iZKRGtqHcABlY3B0+nI
X-Received: by 2002:a05:6a21:2d44:b0:39b:bc11:9ec5 with SMTP id adf61e73a8af0-3c0f093fbc7mr16423792637.13.1783984566492;
        Mon, 13 Jul 2026 16:16:06 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm8888835a12.15.2026.07.13.16.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:16:05 -0700 (PDT)
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
Subject: [PATCH] usb: ohci-ppc-of: use platform for irq and ioremap
Date: Mon, 13 Jul 2026 16:16:04 -0700
Message-ID: <20260713231604.1090044-1-rosenp@gmail.com>
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
resource, so update rsrc_start / rsrc_len to dereference it and assign the
mapped address to hcd->regs. Use a separate on-stack resource (ehci_res)
for the unrelated ibm,usb-ehci-440epx erratum lookup rather than aliasing
the returned resource pointer.

Switch IRQ acquisition from irq_of_parse_and_map() to platform_get_irq(),
which only retrieves the interrupt the OF/platform core has already set up
rather than transferring mapping ownership to the driver. Drop the now
unneeded irq_dispose_mapping() calls (probe error path and
ohci_hcd_ppc_of_remove()) and the now-unused of_irq.h include, keeping
linux/of_address.h for the erratum block's of_address_to_resource().

Behaviorally equivalent with respect to region reservation: the prior code
used devm_ioremap_resource(), which already reserved the region.

Built for PowerPC (ppc44x_defconfig + CONFIG_USB_OHCI_HCD_PPC_OF) with
LLVM=1; drivers/usb/host/ohci-hcd.o (which includes ohci-ppc-of.c)
compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/ohci-ppc-of.c | 44 +++++++++++++---------------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/host/ohci-ppc-of.c b/drivers/usb/host/ohci-ppc-of.c
index acd0a0e398a4..3a965b9c04fa 100644
--- a/drivers/usb/host/ohci-ppc-of.c
+++ b/drivers/usb/host/ohci-ppc-of.c
@@ -17,7 +17,6 @@
 #include <linux/signal.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
 static int
@@ -87,7 +86,9 @@ static int ohci_hcd_ppc_of_probe(struct platform_device *op)
 	struct device_node *dn = op->dev.of_node;
 	struct usb_hcd *hcd;
 	struct ohci_hcd	*ohci;
-	struct resource res;
+	struct resource *res;
+	struct resource ehci_res;
+	void __iomem *regs;
 	int irq;
 
 	int rv;
@@ -103,30 +104,21 @@ static int ohci_hcd_ppc_of_probe(struct platform_device *op)
 
 	dev_dbg(&op->dev, "initializing PPC-OF USB Controller\n");
 
-	rv = of_address_to_resource(dn, 0, &res);
-	if (rv)
-		return rv;
+	regs = devm_platform_get_and_ioremap_resource(op, 0, &res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	irq = platform_get_irq(op, 0);
+	if (irq < 0)
+		return irq;
 
 	hcd = usb_create_hcd(&ohci_ppc_of_hc_driver, &op->dev, "PPC-OF USB");
 	if (!hcd)
 		return -ENOMEM;
 
-	hcd->rsrc_start = res.start;
-	hcd->rsrc_len = resource_size(&res);
-
-	hcd->regs = devm_ioremap_resource(&op->dev, &res);
-	if (IS_ERR(hcd->regs)) {
-		rv = PTR_ERR(hcd->regs);
-		goto err_rmr;
-	}
-
-	irq = irq_of_parse_and_map(dn, 0);
-	if (!irq) {
-		dev_err(&op->dev, "%s: irq_of_parse_and_map failed\n",
-			__FILE__);
-		rv = -EBUSY;
-		goto err_rmr;
-	}
+	hcd->rsrc_start = res->start;
+	hcd->rsrc_len = resource_size(res);
+	hcd->regs = regs;
 
 	ohci = hcd_to_ohci(hcd);
 	if (is_bigendian) {
@@ -158,20 +150,18 @@ static int ohci_hcd_ppc_of_probe(struct platform_device *op)
 	* the ehci driver is loaded.
 	*/
 	if (np !=  NULL) {
-		if (!of_address_to_resource(np, 0, &res)) {
-			if (!request_mem_region(res.start, 0x4, hcd_name)) {
+		if (!of_address_to_resource(np, 0, &ehci_res)) {
+			if (!request_mem_region(ehci_res.start, 0x4, hcd_name)) {
 				writel_be((readl_be(&ohci->regs->control) |
 					OHCI_USB_SUSPEND), &ohci->regs->control);
 					(void) readl_be(&ohci->regs->control);
 			} else
-				release_mem_region(res.start, 0x4);
+				release_mem_region(ehci_res.start, 0x4);
 		} else
 			pr_debug("%s: cannot get ehci offset from fdt\n", __FILE__);
 		of_node_put(np);
 	}
 
-	irq_dispose_mapping(irq);
-err_rmr:
  	usb_put_hcd(hcd);
 
 	return rv;
@@ -185,8 +175,6 @@ static void ohci_hcd_ppc_of_remove(struct platform_device *op)
 
 	usb_remove_hcd(hcd);
 
-	irq_dispose_mapping(hcd->irq);
-
 	usb_put_hcd(hcd);
 }
 
-- 
2.55.0

