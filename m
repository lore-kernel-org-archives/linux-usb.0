Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0012D4071C5
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945344; cv=none; b=YDY1/i7rsYx9swTg70VOPq5pmYCT7mrOheLyXyNQUbJ5r0mDa22gOqoe/dMcoHNr++TN8pOH+yxqFsIDgeGDlxMaLUFhS821cdHbbhMf48R77ldCzT2gZp9FCJ/+CXDaPLE7YCn4YHkkBDsfC2YVIqYyUj1MX80VEQpq7SXUKpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945344; c=relaxed/simple;
	bh=eoJTAmX9AWXfkTF4kLIHT8w3C6GUQLelCr2YllhbyRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O/8VfnwAgGl68jlRwdDrKq3jvS9XjCRaVYwiD8HP5BtltaNMRl4+udwnf7QRceOnv39DVEpUffpkc08pQXYGgU0GKnX9CUDuo1bEg5mEUhjvvZJ4iyXh4QrtLn0jbtZQizzcb5xDYLWpCkN6CMk1Of1oe73qHaMQvjhf+uP0Gck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=JDSYCe1H; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="JDSYCe1H"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso27427135ad.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 05:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783945341; x=1784550141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRr+JXgQmTo2U7vmzb7T4qvb4h5XSF+nEYAqLJoq5Zs=;
        b=JDSYCe1HPPzZAof3gDwkQtVU9wLKZBDRmLdX2k2MvtXAU9T37c9zOxZtgK+CD4AFo8
         6OKtYrQT7TS9JvrK2LTB2iW2Bww6GSgTPom2CcVC9GlIKseJJ867eVr2OLmJm6dYfBuu
         vVUztEnj8n8JD/JLsi0UiCLZPYRXx14nP82v4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945341; x=1784550141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRr+JXgQmTo2U7vmzb7T4qvb4h5XSF+nEYAqLJoq5Zs=;
        b=GFdwMhsorV8EqAWTg+IpJqwvbeZNy+MGZTtBp/d385lJmRaYlSNTsKoOx/RVds0qgd
         dtNZHebdQEUxOTaoszuWkM8bV/aQUqhLzTSK3LXyPCM8LW1C9SN6wkR/WFDtWtmXWU/p
         N165KTVpm+OAvpyNxLF9ZqUHZ0lfOvzdJfwTQV0tENJCl7RKxPyGj1GknGWOdpvLpjRY
         AJ/z+lZLLC6h44bs4FSMg4gLjRDfG25HcWOM974ufqjxSrsGCBJVCnz8kE9TgNhCglIb
         2/BKvNK/ixzHUYFpk+MXqwTThzvwKTarHRnElptXIoSlzHWb4+g7YoDRfOaqZnS5h0Vc
         GTqA==
X-Gm-Message-State: AOJu0Yxm1TB59yUuYR3EjQZXDPss7G/B8JKuswBzlR0kiBo5yeWWh0Sd
	Wj9xMZ7vQwFcFk1vHx5m0T3Jl/8Znfc739zZdTFvvcvIErjN9hRXn8FpB3rO74crSa8=
X-Gm-Gg: AfdE7cnL0AFIDtPKLaISSrWKdAhz9WsSkWtCqR48gnMaJqiHlwWS1C1z9kGxADIB3Cy
	EagAzrJdib61Au4sN6LggmHCrPHugeANi7O4l1+QRLLw3Z5JAXVEfbfY+sPUUm2nsD38A51cfCX
	w0XS390kMKWlxLT8X/vcziTncyko4A7Wb/kTwF9OEugKY2+gpy+ksm3gTyfAaq9PCixvSeclrvX
	6bGvgFfO+GqGf4oik0j5BF+fea4ayDAL9PC8qQe3MCmpgLbkeApPYS3/1AaPyJcoEraY1JhKIht
	dUp3TJjPsJXLfhcV4dqCAyKxATIDpIxRJSJBa2XbS41HJY1yTIPeL6V4WRxR6ezGSPDrh8SH5mM
	sSZdRgWA/HBr3NDVgq+jlBpZDrvBbue0USOs4GacIbDaLM9Ekc6PYJhbw+lQw9mXRcbMOUA9iZC
	KgS94VE9ucm8QjBU89NY1XVvMXUw==
X-Received: by 2002:a05:6a20:9595:b0:3b4:7eb0:47aa with SMTP id adf61e73a8af0-3c1108c1ef5mr9418636637.25.1783945341167;
        Mon, 13 Jul 2026 05:22:21 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm8126216a12.31.2026.07.13.05.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:22:20 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 2/2] usb: chipidea: use the generic ehci_writel override for i.MX28
Date: Mon, 13 Jul 2026 21:22:05 +0900
Message-ID: <20260713122205.1350933-3-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713122205.1350933-1-daniel@thingy.jp>
References: <20260713122205.1350933-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Palmer <daniel@0x0f.com>

The EHCI core carries an imx28_write_fix flag baked into ehci_writel()
that special-cases the i.MX28's need for a swp instruction when writing
the EHCI registers.

Now that the EHCI core provides a generic ehci_writel override hook,
convert the chipidea host glue to install its own writel via that hook
and drop the i.MX28 special case from the core, keeping ehci_writel()
free of SoC-specific knowledge.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/usb/chipidea/Kconfig |  1 +
 drivers/usb/chipidea/host.c  | 17 ++++++++++++++++-
 drivers/usb/host/ehci.h      | 19 ++-----------------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index bab45bc62361..5bada84943e2 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -29,6 +29,7 @@ config USB_CHIPIDEA_HOST
 	bool "ChipIdea host controller"
 	depends on USB_EHCI_HCD
 	select USB_EHCI_ROOT_HUB_TT
+	select HAVE_BROKEN_EHCI_HCD if SOC_IMX28
 	help
 	  Say Y here to enable host controller functionality of the
 	  ChipIdea driver.
diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index ced6076a8248..820bdea5da12 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -117,6 +117,18 @@ static irqreturn_t host_irq(struct ci_hdrc *ci)
 	return usb_hcd_irq(ci->irq, ci->hcd);
 }
 
+#ifdef CONFIG_SOC_IMX28
+/*
+ * The i.MX28 needs a swp instruction rather than a normal write to the
+ * EHCI registers; provide it through the generic ehci_writel override.
+ */
+static void ci_hdrc_ehci_writel(const struct ehci_hcd *ehci,
+				const unsigned int val, __u32 __iomem *regs)
+{
+	asm("swp %0, %0, [%1]" : : "r"(val), "r"(regs));
+}
+#endif
+
 static int host_start(struct ci_hdrc *ci)
 {
 	struct usb_hcd *hcd;
@@ -150,7 +162,10 @@ static int host_start(struct ci_hdrc *ci)
 	ehci->caps = ci->hw_bank.cap;
 	ehci->has_hostpc = ci->hw_bank.lpm;
 	ehci->has_tdi_phy_lpm = ci->hw_bank.lpm;
-	ehci->imx28_write_fix = ci->imx28_write_fix;
+#ifdef CONFIG_SOC_IMX28
+	if (ci->imx28_write_fix)
+		ehci->ehci_writel = ci_hdrc_ehci_writel;
+#endif
 	ehci->has_ci_pec_bug = ci->has_portsc_pec_bug;
 
 	priv = (struct ehci_ci_priv *)ehci->priv;
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index f592cc26e494..616b01314bfe 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -218,7 +218,6 @@ struct ehci_hcd {			/* one per controller */
 	unsigned		has_synopsys_hc_bug:1; /* Synopsys HC */
 	unsigned		frame_index_bug:1; /* MosChip (AKA NetMos) */
 	unsigned		need_oc_pp_cycle:1; /* MPC834X port power */
-	unsigned		imx28_write_fix:1; /* For Freescale i.MX28 */
 	unsigned		spurious_oc:1;
 	unsigned		is_aspeed:1;
 	unsigned		zx_wakeup_clear_needed:1;
@@ -778,18 +777,6 @@ static inline unsigned int ehci_readl(const struct ehci_hcd *ehci,
 #endif
 }
 
-#ifdef CONFIG_SOC_IMX28
-static inline void imx28_ehci_writel(const unsigned int val,
-		volatile __u32 __iomem *addr)
-{
-	__asm__ ("swp %0, %0, [%1]" : : "r"(val), "r"(addr));
-}
-#else
-static inline void imx28_ehci_writel(const unsigned int val,
-		volatile __u32 __iomem *addr)
-{
-}
-#endif
 static inline void ehci_writel(const struct ehci_hcd *ehci,
 		const unsigned int val, __u32 __iomem *regs)
 {
@@ -798,13 +785,11 @@ static inline void ehci_writel(const struct ehci_hcd *ehci,
 		writel_be(val, regs) :
 		writel(val, regs);
 #else
-	if (ehci->imx28_write_fix)
-		imx28_ehci_writel(val, regs);
 #ifdef CONFIG_HAVE_BROKEN_EHCI_HCD
-	else if (ehci->ehci_writel)
+	if (ehci->ehci_writel)
 		ehci->ehci_writel(ehci, val, regs);
-#endif
 	else
+#endif
 		writel(val, regs);
 #endif
 }
-- 
2.53.0

