Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE473F23BB
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945341; cv=none; b=qEpD7XMDzvRU2wf4DjIwFRhqew8ouTTMYcbJmmHNXIs9HflIK4K4l1bVeUcL8pyRHcgE+8Y+OdfkeP+K5PUQH/tjIRX2Ajnkv0DNDs5O3W9EVS3tH9zRpxPMeG2FSxI/HDAidwv2xixaBJOhYVrPVON/QoXHx3yR6NXmcj8dSbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945341; c=relaxed/simple;
	bh=CC1I8A0g5ryeTNIPYNRkfYT1ctp/4W6LumSH2gdkO7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jF5UevTn9/768eG9Lqut8bRr5jYcBnme9Ym9c3d2itQRq86pJoMypqPI6mu3OF9dXDbNO/BoijsFm2gnXMLVBAvY42HFfnP5HBsq64guxVp9snv6usVqOim9dBoDG9ANcWPocbEEC6qWVtfUAyx9821VsprOKGvcfY/sKfaNyQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Zb7i/LhY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Zb7i/LhY"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c89636920a3so1591171a12.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 05:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783945339; x=1784550139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7vlwcyYZljM0igSykkOYX1j9W69gTakFBnqtWeMcKU=;
        b=Zb7i/LhY7m2Jyj0d6dOQao/k4S2lfxFRN7745PpW9CeEwevxqFUOpW9fmjCl/QdpY4
         HqWXYvshxzFhy0aHtgGY133Ca+nxxZH2KFYTxqrF1gLIy8ERJHX5fSU+bF5HIr1oVNuq
         oZZL+iu0baTBUVnGFkKbVd0rAw3IcijJlFfxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945339; x=1784550139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7vlwcyYZljM0igSykkOYX1j9W69gTakFBnqtWeMcKU=;
        b=LTR9PNs1Opls0oAuRNpQApskbCFX+nkCE6bVg1brZsXJAZTx8n/DiNWB+3Tkn5/pBT
         6Pt/VaypUUHko6bnx+cQprsmtp27Pr9aExF3t20h0YuAvCo6r+tC+LAOybZ8q7uaQlTI
         K7mJMyXLWPKWkMH1KAz94dDcgqBcugn8GqBnE2qEJRGUMDKirXPgRRMdRxVFooqUP9Gy
         vMSQ2Yv8DDCrXRXjC0jv19wO213ZabhrPwCSBiZZO3u9iVvGy+N7GBEN4QKHIfPaS/oG
         zLb4a3r0uoMLcnnnL9LIY3aIK8VqZJNcBD2LUTbi4FPMh0WmjYD+f71tfKVBACzlxxzt
         hwVA==
X-Gm-Message-State: AOJu0YyhOss1l7S+ssQlhkGeh9a4PNoawX3ASvBd/jQ7oEnV7fBwA5nl
	4QGV3YB6crVQba+Npu6BZiSHKf/vCEOFR2T6VqNCsX9C2mtVD4yxAWcHcKPphWEPov0=
X-Gm-Gg: AfdE7cnvEdHTYazuy3VnCwI4viMU9hVRVsMgWRmoe0ZJLZi8jJV/eim8HTbZL5q1vf1
	tgqw2IZ5g5V0y9AldrBdi7/C2xDgAH7WUxXpr3izC25Ntsea+GFK4HXYGq+YfujcYwx2jTYL275
	pQ3npbgpsankCxZbn2YMY1JjYgTwtuI94SdVVcDuqZzt6MNPK29DLvmyNjG/paOe7SDL3Mel+E1
	rOY0GtIVD4pRklC8Bn7NJq6XWXhom7nu87tmP7ZbJggbZmAFsQw8DJVf+Gx8KUxnVVUZUKvmlzh
	wM+bMa4gNoxYV3/C/DY5Gze+sATWUr2P2x6klQV4R6t93cEQo1HoQqQ2pOVjT4Fnpd2KuTx+Llv
	fmuQzRu1cm+0n6Zjl85VGSPBNQbacxDjhoncZdC1T5A+HD95jFFTu0Ni674cGwZ1cV5tcaocAXn
	WyzeOI/sPUELK+LjPo27kzr3MCbQ==
X-Received: by 2002:a05:6a20:9190:b0:3bf:79d6:f063 with SMTP id adf61e73a8af0-3c110b2642amr9523074637.43.1783945339191;
        Mon, 13 Jul 2026 05:22:19 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm8126216a12.31.2026.07.13.05.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:22:18 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [RFC PATCH 1/2] usb: ehci: Add option to override ehci_readl()/ehci_writel()
Date: Mon, 13 Jul 2026 21:22:04 +0900
Message-ID: <20260713122205.1350933-2-daniel@thingy.jp>
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

There are EHCI-like hosts, like fotg210, out there that should
be able to use the shared ehci code but can't because they need
to override some parts of the ehci code to work properly.

Let ehci_readl() and ehci_writel() be overridden first.
This allows the ehci code to be used with hosts that need
to do special dances when accessing their registers.

The change is hidden behind a boolean kconfig option
so that the extra function pointer NULL check and call
only happens when a broken controller is enabled.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/usb/host/Kconfig |  3 +++
 drivers/usb/host/ehci.h  | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index b3b1ec696bf5..8c88354e91e5 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -362,6 +362,9 @@ config USB_OCTEON_EHCI
 	  USB 2.0 device support.  All CN6XXX based chips with USB are
 	  supported.
 
+config HAVE_BROKEN_EHCI_HCD
+	bool
+
 endif # USB_EHCI_HCD
 
 config USB_OXU210HP_HCD
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index d7a3c8d13f6b..f592cc26e494 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -258,6 +258,14 @@ struct ehci_hcd {			/* one per controller */
 						/* us budgeted per uframe */
 	struct list_head	tt_list;
 
+#ifdef CONFIG_HAVE_BROKEN_EHCI_HCD
+	/* Overrides to fix up broken implementations */
+	/* Broken IO */
+	void (*ehci_writel)(const struct ehci_hcd *ehci,
+			    const unsigned int val, __u32 __iomem *regs);
+	unsigned int (*ehci_readl)(const struct ehci_hcd *ehci, __u32 __iomem *regs);
+#endif
+
 	/* platform-specific data -- must come last */
 	unsigned long		priv[] __aligned(sizeof(s64));
 };
@@ -762,6 +770,10 @@ static inline unsigned int ehci_readl(const struct ehci_hcd *ehci,
 		readl_be(regs) :
 		readl(regs);
 #else
+#ifdef CONFIG_HAVE_BROKEN_EHCI_HCD
+	if (ehci->ehci_readl)
+		return ehci->ehci_readl(ehci, regs);
+#endif
 	return readl(regs);
 #endif
 }
@@ -788,6 +800,10 @@ static inline void ehci_writel(const struct ehci_hcd *ehci,
 #else
 	if (ehci->imx28_write_fix)
 		imx28_ehci_writel(val, regs);
+#ifdef CONFIG_HAVE_BROKEN_EHCI_HCD
+	else if (ehci->ehci_writel)
+		ehci->ehci_writel(ehci, val, regs);
+#endif
 	else
 		writel(val, regs);
 #endif
-- 
2.53.0

