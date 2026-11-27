Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795805151;
	b=BLcEBsI6/P1L0osnD81QlBP8LAKWsGLMj1+Vw4OuyC91ppPRqizeXg+gkwcKR8Ci9vV8
	 OIwMBLVaWClfpmV/O6txgyLgGWD6YlUOsQoyVTq0Noco0nPqZ2rcCOM2iU8CthefEK9O1
	 /2Ay/T91WhEPBQNzrO7LY5M57jm4YiuGdYoSVDLR0JkC3C0w43Rl+xhyf5NFq8I5KhhvM
	 iScrvzeGZkypI/NnUs1AwBffd7xEobQ1YTS5ayEvjrLXpxbDsxhHuVthe3zCsh3thQ0S+
	 7090Rq51jHt2mzHUgmeZ1rsiHmvtVwa7E4E7rinVU/P7zKJSr/Cio+M+1wb7Z+eYFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805151;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=bpZHzeamICGAbt8+S9c/6KVQRSzuWQVBIRomFZXk54g=;
	b=gETtrPCPJPqAidOnSwR73rU5lAo/uj2jvpeTSjnARGFworgrIQoY+R3eJvQalsGBK5we
	 CH5vK66IMxEqH2wt5/iDZPytAphPdfOTN6rqma7S5uAnsH4qtHkZDMMC2FMEFIbFG7uny
	 0KYErZXL/rMynPJp+TxTjGORSaT0mjDisfrt06CrGckw40QCRuT43y3qMC2dnyqAvjTIM
	 +3bNWtn3nhy3Sa1FU53FzwUfZTlPDMT/5GRHa0IVw+HFNDWSlI3SxGuEoiI8gOhUeCX80
	 wqX1lkK3apamUOx1yoXWJG0EUV9osV2DqGZMT1o1RzciJthaPXhD7m/SelKYzSf43wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gapxwCYI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A667A606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gapxwCYI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02171F0089A;
	Fri, 27 Nov 2026 18:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795805150;
	bh=bpZHzeamICGAbt8+S9c/6KVQRSzuWQVBIRomFZXk54g=;
	h=From:Date:Subject:To:Cc;
	b=gapxwCYIfvbgJbSoFg+7lIrdCrndQs7DPcaBr16on2qvPIf/ClwDDKnKP8ofdDLcN
	 P1TLBfPTxr669vrga6Jf+3GIot7Dgg96j6GJZFt67aPba+cJBy3ENICvx41Q7kIpGE
	 H5xPfaGSroO4cIm66/rybEKgnDD2cOMnWSHl7PWjC3Am2p/S8v8FHDhliOUEE8FVim
	 EJURmbZp/3FNr33I/IhrbIjR5rjt6VKrUiZ0f1cLgf7xFT3X6/hYVMhR8wLWqwktrq
	 vTRURPf7Pc60USGSDkK13Lls7SvCt4/2ARcDEqU0QTJrgrCWAxjv9OH3nvN0hjrx7M
	 CUoRWRcXlYaPw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Nov 2026 19:45:33 +0100
Subject: [PATCH v2] usb: gadget: pxa25x_udc: Support combined PXA and
 IXP4xx builds
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-usb-pxa25x-udc-v2-1-4716d1f7af3e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/3XMsQ6DIBAA0F8hN3tNDy2mTv5H4yBwKGkDBqqhM
 f57U/eub3g7ZE6eM3Rih8Sbzz4G6ISsBJh5DBOjt9AJkFepiKjFNWtcyihvBVdrsCXdqEaTuus
 WKgFLYufLGT6GSsDs8zumz/lv9NO/1UZI6KwzbJS0da36J6fAr0tMEwzHcXwBPdZkPa0AAAA=
X-Change-ID: 20261117-usb-pxa25x-udc-71b464b169b7
To: Neill Kapron <nkapron@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.16.0

Allowing little-endian IXP4xx kernels makes it possible to enable both
ARCH_IXP4XX and ARCH_PXA. The shared UDC driver still assumes that these
platforms are mutually exclusive: it defines UDCCS_IO_ROF twice and stops
the build with "Can't configure both IXP and PXA".

Select the controller quirks using the running CPU rather than the kernel
configuration. Match both XScale CPU families and their supported
revisions, and remember whether the controller belongs to IXP4xx. Use that
flag to select the existing isochronous receive overflow bit and to keep
the EP0 status workaround specific to PXA.

Remove the IXP4xx clock API overrides so that PXA clock control still
works in a combined kernel. Leave the clock NULL on IXP4xx, which has no
software-controlled UDC clock, and rely on the clock API's NULL handling.

Drop the Kconfig restriction against enabling PXA25x and IXP4xx together,
now that the driver supports this combination.

Fixes: 2262f02ac2aa ("ARM: ixp4xx: Relax endianness")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611082010.e3nJgvr4-lkp@intel.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Fix the build failure when PXA and IXP4xx are enabled together by
selecting CPU quirks at runtime.

I guess I caused this problem by allowing for little endian IXP4xx.

Assisted by LLM.
---
Changes in v2:
- Rebased onto usb-testing from Greg's tree.
- Link to v1: https://patch.msgid.link/20261117-usb-pxa25x-udc-v1-1-fdfcec62d336@kernel.org
---
 drivers/usb/gadget/udc/Kconfig      |  1 -
 drivers/usb/gadget/udc/pxa25x_udc.c | 94 ++++++++++++++++---------------------
 drivers/usb/gadget/udc/pxa25x_udc.h |  1 +
 3 files changed, 42 insertions(+), 54 deletions(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 5142f70b6f3a..7ddbc2606686 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -126,7 +126,6 @@ config USB_OMAP
 config USB_PXA25X
 	tristate "PXA 25x or IXP 4xx"
 	depends on (ARCH_PXA && PXA25x) || ARCH_IXP4XX
-	depends on !(PXA25x && ARCH_IXP4XX)
 	depends on HAS_IOMEM
 	help
 	   Intel's PXA 25x series XScale ARM-5TE processors include
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.c b/drivers/usb/gadget/udc/pxa25x_udc.c
index 7e158ca73fa1..944b35755cbd 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.c
+++ b/drivers/usb/gadget/udc/pxa25x_udc.c
@@ -11,6 +11,7 @@
 
 /* #define VERBOSE_DEBUG */
 
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -137,12 +138,9 @@
 
 #define UDCCS_IO_RFS	(1 << 0)	/* Receive FIFO service */
 #define UDCCS_IO_RPC	(1 << 1)	/* Receive packet complete */
-#ifdef CONFIG_ARCH_IXP4XX /* FIXME: is this right?, datasheed says '2' */
-#define UDCCS_IO_ROF	(1 << 3)	/* Receive overflow */
-#endif
-#ifdef CONFIG_PXA25x
-#define UDCCS_IO_ROF	(1 << 2)	/* Receive overflow */
-#endif
+/* FIXME: IXP4xx datasheet says bit 2. */
+#define UDCCS_IO_ROF_IXP	BIT(3)	/* Receive overflow on IXP4xx */
+#define UDCCS_IO_ROF	BIT(2)	/* Receive overflow on PXA25x */
 #define UDCCS_IO_DME	(1 << 3)	/* DMA enable */
 #define UDCCS_IO_RNE	(1 << 6)	/* Receive FIFO not empty */
 #define UDCCS_IO_RSP	(1 << 7)	/* Receive short packet */
@@ -225,21 +223,6 @@ static const char driver_name [] = "pxa25x_udc";
 static const char ep0name [] = "ep0";
 
 
-#ifdef CONFIG_ARCH_IXP4XX
-
-/* cpu-specific register addresses are compiled in to this code */
-#ifdef CONFIG_PXA25x
-#error "Can't configure both IXP and PXA"
-#endif
-
-/* IXP doesn't yet support <linux/clk.h> */
-#define clk_get(dev,name)	NULL
-#define clk_enable(clk)		do { } while (0)
-#define clk_disable(clk)	do { } while (0)
-#define clk_put(clk)		do { } while (0)
-
-#endif
-
 #include "pxa25x_udc.h"
 
 
@@ -299,6 +282,11 @@ static inline u32 udc_get_reg(struct pxa25x_udc *dev, u32 reg)
 }
 #endif
 
+static u32 udc_iso_rof(struct pxa25x_udc *dev)
+{
+	return dev->is_ixp ? UDCCS_IO_ROF_IXP : UDCCS_IO_ROF;
+}
+
 static void pio_irq_enable(struct pxa25x_ep *ep)
 {
 	u32 bEndpointAddress = ep->bEndpointAddress & 0xf;
@@ -668,15 +656,13 @@ write_ep0_fifo (struct pxa25x_ep *ep, struct pxa25x_request *req)
 		count = req->req.length;
 		done (ep, req, 0);
 		ep0_idle(ep->dev);
-#ifndef CONFIG_ARCH_IXP4XX
-#if 1
 		/* This seems to get rid of lost status irqs in some cases:
 		 * host responds quickly, or next request involves config
 		 * change automagic, or should have been hidden, or ...
 		 *
 		 * FIXME get rid of all udelays possible...
 		 */
-		if (count >= EP0_FIFO_SIZE) {
+		if (!dev->is_ixp && count >= EP0_FIFO_SIZE) {
 			count = 100;
 			do {
 				if ((udc_ep0_get_UDCCS(dev) & UDCCS0_OPR) != 0) {
@@ -688,8 +674,6 @@ write_ep0_fifo (struct pxa25x_ep *ep, struct pxa25x_request *req)
 				udelay(1);
 			} while (count);
 		}
-#endif
-#endif
 	} else if (ep->dev->req_pending)
 		ep0start(ep->dev, 0, "IN");
 	return is_short;
@@ -756,7 +740,7 @@ read_fifo (struct pxa25x_ep *ep, struct pxa25x_request *req)
 
 		/* iso is one request per packet */
 		if (ep->bmAttributes == USB_ENDPOINT_XFER_ISOC) {
-			if (udccs & UDCCS_IO_ROF)
+			if (udccs & udc_iso_rof(ep->dev))
 				req->req.status = -EHOSTUNREACH;
 			/* more like "is_done" */
 			is_short = 1;
@@ -1830,7 +1814,7 @@ static void handle_ep(struct pxa25x_ep *ep)
 			if (likely(ep->bmAttributes == USB_ENDPOINT_XFER_BULK))
 				tmp = UDCCS_BO_SST | UDCCS_BO_DME;
 			else
-				tmp = UDCCS_IO_ROF | UDCCS_IO_DME;
+				tmp = udc_iso_rof(ep->dev) | UDCCS_IO_DME;
 			tmp &= udccs;
 			if (likely(tmp))
 				udc_ep_set_UDCCS(ep, tmp);
@@ -2230,13 +2214,8 @@ static struct pxa25x_udc memory = {
 
 #define CP15R0_VENDOR_MASK	0xffffe000
 
-#if	defined(CONFIG_PXA25x)
-#define CP15R0_XSCALE_VALUE	0x69052000	/* intel/arm/xscale */
-
-#elif	defined(CONFIG_ARCH_IXP4XX)
-#define CP15R0_XSCALE_VALUE	0x69054000	/* intel/arm/ixp4xx */
-
-#endif
+#define CP15R0_PXA_VALUE	0x69052000	/* intel/arm/xscale */
+#define CP15R0_IXP_VALUE	0x69054000	/* intel/arm/ixp4xx */
 
 #define CP15R0_PROD_MASK	0x000003f0
 #define PXA25x			0x00000100	/* and PXA26x */
@@ -2275,35 +2254,39 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 
 	/* insist on Intel/ARM/XScale */
 	asm("mrc p15, 0, %0, c0, c0" : "=r" (chiprev));
-	if ((chiprev & CP15R0_VENDOR_MASK) != CP15R0_XSCALE_VALUE) {
+	if ((chiprev & CP15R0_VENDOR_MASK) != CP15R0_PXA_VALUE &&
+	    (chiprev & CP15R0_VENDOR_MASK) != CP15R0_IXP_VALUE) {
 		pr_err("%s: not XScale!\n", driver_name);
 		return -ENODEV;
 	}
 
+	dev->is_ixp = (chiprev & CP15R0_VENDOR_MASK) == CP15R0_IXP_VALUE;
+
 	/* trigger chiprev-specific logic */
-	switch (chiprev & CP15R0_PRODREV_MASK) {
-#if	defined(CONFIG_PXA25x)
-	case PXA255_A0:
+	switch (chiprev & (CP15R0_VENDOR_MASK | CP15R0_PRODREV_MASK)) {
+	case CP15R0_PXA_VALUE | PXA255_A0:
 		dev->has_cfr = 1;
 		break;
-	case PXA250_A0:
-	case PXA250_A1:
+	case CP15R0_PXA_VALUE | PXA250_A0:
+	case CP15R0_PXA_VALUE | PXA250_A1:
 		/* A0/A1 "not released"; ep 13, 15 unusable */
 		fallthrough;
-	case PXA250_B2: case PXA210_B2:
-	case PXA250_B1: case PXA210_B1:
-	case PXA250_B0: case PXA210_B0:
+	case CP15R0_PXA_VALUE | PXA250_B2:
+	case CP15R0_PXA_VALUE | PXA210_B2:
+	case CP15R0_PXA_VALUE | PXA250_B1:
+	case CP15R0_PXA_VALUE | PXA210_B1:
+	case CP15R0_PXA_VALUE | PXA250_B0:
+	case CP15R0_PXA_VALUE | PXA210_B0:
 		/* OUT-DMA is broken ... */
 		fallthrough;
-	case PXA250_C0: case PXA210_C0:
+	case CP15R0_PXA_VALUE | PXA250_C0:
+	case CP15R0_PXA_VALUE | PXA210_C0:
 		break;
-#elif	defined(CONFIG_ARCH_IXP4XX)
-	case IXP425_A0:
-	case IXP425_B0:
-	case IXP465_AD:
+	case CP15R0_IXP_VALUE | IXP425_A0:
+	case CP15R0_IXP_VALUE | IXP425_B0:
+	case CP15R0_IXP_VALUE | IXP465_AD:
 		dev->has_cfr = 1;
 		break;
-#endif
 	default:
 		pr_err("%s: unrecognized processor: %08x\n",
 			driver_name, chiprev);
@@ -2319,9 +2302,14 @@ static int pxa25x_udc_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->regs))
 		return PTR_ERR(dev->regs);
 
-	dev->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(dev->clk))
-		return PTR_ERR(dev->clk);
+	/* IXP4xx has no software-controlled UDC clock. */
+	if (dev->is_ixp) {
+		dev->clk = NULL;
+	} else {
+		dev->clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(dev->clk))
+			return PTR_ERR(dev->clk);
+	}
 
 	pr_debug("%s: IRQ %d%s%s\n", driver_name, irq,
 		dev->has_cfr ? "" : " (!cfr)",
diff --git a/drivers/usb/gadget/udc/pxa25x_udc.h b/drivers/usb/gadget/udc/pxa25x_udc.h
index 3452cf54286c..45e02de18665 100644
--- a/drivers/usb/gadget/udc/pxa25x_udc.h
+++ b/drivers/usb/gadget/udc/pxa25x_udc.h
@@ -101,6 +101,7 @@ struct pxa25x_udc {
 						vbus : 1,
 						pullup : 1,
 						has_cfr : 1,
+						is_ixp : 1,
 						req_pending : 1,
 						req_std : 1,
 						req_config : 1,

---
base-commit: 90d6263e867be7089b3d3323bef8d2accd327c77
change-id: 20261117-usb-pxa25x-udc-71b464b169b7

Best regards,
--  
Linus Walleij <linusw@kernel.org>

