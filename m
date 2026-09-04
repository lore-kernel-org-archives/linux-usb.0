Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D5426EB7
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519362; cv=none; b=NWn2rbwK+Brt3gU/b4AnRLxuOy9+QtJaTDx1nuyGFEUHFckoEIzvUTXNGH1s7jDgHy0yK/OaA21Swq5UQz5y+JsYw5XDGkj6YxhWn3Nm8jSJ1iUEmK/jFYiwOal+eKkwlUMZF9GZqhOroEYsSaZblDjudmvLf8g2iSPz/KeV6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519362; c=relaxed/simple;
	bh=ZvWjXP9SQ6F7xBOna1ztMKNNzIZ8ubCD+ndNFz1ciyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sV+XDcUChbw02LPGG8s4TVs5bMCnMZ1p1OCGC5X1FtI0HfoP42KrvxG6PAliqufoXDZNUtzr/Xm0mAuIln5DsdQP86vp3qNwT+Bbk6RYQ2Vgt/fgbiMcsirVd3AWrTyQBJfRgo9c1cypR2Bn33KWMNnJgzjdMzUJAIS0FVL+tWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6mnOwDL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6mnOwDL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so722536a12.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 03:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519361; x=1789124161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2SDkRiYdFp13zqgvGKD/ii41aRHGwkv/AHP8UEqIJ4=;
        b=l6mnOwDLHEUUoCOtaZE4Hx27bNMfOzshDzUL7MomfThmv24OImsrYttM3pe0iLvKe2
         /vjGMFxDOFZERjMV3yQO4UymXTiknEjc7y/2qGElI8Ih1rcCLGAV4VjbXHfPTz+oRMvM
         mLGxGEoWNHTCUC/zkCpSNUZqdKTlNufoY3HLeMM9Bl+O1Euf4/DgCB0EFoTotmrvWQ3Y
         oNCrgga+jsrPo0DJNVEXCQHcMXWrwEjrQHmSvFOlJpmFkBDRhFfvumUPBe16UGlR6Ol5
         ao734+nuAbU1BIJhw6rxkJfhPzRw0EOba4Ol7IcAAfvk38yonX2runJLI3MaifAKkOug
         K55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519361; x=1789124161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2SDkRiYdFp13zqgvGKD/ii41aRHGwkv/AHP8UEqIJ4=;
        b=PXzKTVFZKEYRSDOILJiBNs46RgCEWBLZVtVQ/p3bbXvuiJNXMHcV3gLDo/++tvl8vi
         UEBJ7XZi7mTF3e6UJzIoRuYPKGxHNkvx4HgkjNn9/bCSuu8KkHrFzycwjNJJZZOC3PtR
         7EgrULGaQSDqYO7Fz4t45gwwAN+tvWlvNnmd4RlEAxAf6sHCQIwnGS1HbuC0vorCbbna
         GeZOaplcFA99bZa9c/PDTnH5TB0+llSZ6f4a7sGdFnrem7a+qfnDgkvDdjP86BJyhP07
         uVzocQb07Sf5afEHzIF6XmbHR6c4I4EFOn4DnRJTzqOev27SswpNkb5nctApROoI/rpR
         ARMw==
X-Forwarded-Encrypted: i=1; AKwUvBwm4nD+Iy4OR2KuGJVvz2klTmErIKTdcbDvb4vwsK/rpRJOIsSXXC3HpB3R4PweQhEEoKCWKUKb2zU=@vger.kernel.org
X-Gm-Message-State: AFuF++kLfwmc6sg7qXRkUfRvG7a7/zrqAV3PDiaA8PhMp5qv7fVSLsBB
	Av3KPiQaAa+g7Q2XoPDPt7pt9mTBGSiVlk0YC9oLWisopzNsDztOaJhH
X-Gm-Gg: AYBFou1IUscoYMwVIqpHrtWdbw0XcJlgX64Ied4kiLuuyjRPxn2fVLIrJJl7+SCFPPS
	o2caBTrIQR35sPW7Ujb5TfpaKUcO8pMWv/jHZQsGISBou6sr2PyeL1Y5+y0hVXJuduJGyu08Xfk
	Lv4ohSd4Z/g7CloZjH+FPxJMvcoksK1FjMK+1+DKojz5h9pldnHSQDBTshN8KRsLb7aq9zpLBXN
	3u2CBvarQze5rHTvWhij0pjGxVBfRz15tYa8zO6aQHdr49GctqSHGqP7rgpAnvtAMr91aVmqpKH
	YhnwUEE9MlFmbLBVoucVSkuC7jycGuCETmKr/6+PYLb6wAIYscTuUeDrDBzeZF3AnjRc57IAXOA
	8bCTTnPGfLzFDSCnSI5Z5z3lDyyK1JhKz46S0bzPMLEUEizxVknyQ9ApAR0uZb5wm3mi0nfbmDv
	votHhjhA8mZoWw+zJPViNGfRkqzF4H69Z+mr8A95CAvEg4oWVF8HOPUTS3TCz41GhVSbueEzbF6
	x8cKt7K8ZNrdEA=
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr8165885a91.16.1788519360466;
        Fri, 04 Sep 2026 03:56:00 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm5155621c88.6.2026.09.04.03.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:00 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc2: fix typos in comments
Date: Fri,  4 Sep 2026 16:25:53 +0530
Message-ID: <20260904105555.37215-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/usb/dwc2/core.c     | 2 +-
 drivers/usb/dwc2/core.h     | 2 +-
 drivers/usb/dwc2/gadget.c   | 6 +++---
 drivers/usb/dwc2/hcd.c      | 4 ++--
 drivers/usb/dwc2/hcd_ddma.c | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index f375c5185bfe..6a0135e06b00 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -173,7 +173,7 @@ static void dwc2_restore_essential_regs(struct dwc2_hsotg *hsotg, int rmode,
 	/* Umnask global Interrupt in GAHBCFG and restore it */
 	dwc2_writel(hsotg, gr->gahbcfg | GAHBCFG_GLBL_INTR_EN, GAHBCFG);
 
-	/* Clear all pending interupts */
+	/* Clear all pending interrupts */
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 
 	/* Unmask restore done interrupt */
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 767251aa1aa3..015a5fb7842d 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -334,7 +334,7 @@ enum dwc2_ep0_state {
  *                           (default when phy_type is Full Speed)
  * @oc_disable:		Flag to disable overcurrent condition.
  *			0 - Allow overcurrent condition to get detected
- *			1 - Disable overcurrent condtion to get detected
+ *			1 - Disable overcurrent condition to get detected
  * @ts_dline:           Enable Term Select Dline pulsing
  *                       0 - No (default)
  *                       1 - Yes
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 102169b40419..4f493601e728 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -658,7 +658,7 @@ static int dwc2_hsotg_write_fifo(struct dwc2_hsotg *hsotg,
 }
 
 /**
- * get_ep_limit - get the maximum data legnth for this endpoint
+ * get_ep_limit - get the maximum data length for this endpoint
  * @hs_ep: The endpoint
  *
  * Return the maximum data that can be queued in one go on a given endpoint
@@ -5501,7 +5501,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *hsotg,
 	dwc2_hib_restore_common(hsotg, rem_wakeup, 0);
 
 	if (!reset) {
-		/* Clear all pending interupts */
+		/* Clear all pending interrupts */
 		dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 	}
 
@@ -5550,7 +5550,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *hsotg,
 	}
 	/* Wait for interrupts which must be cleared */
 	mdelay(2);
-	/* Clear all pending interupts */
+	/* Clear all pending interrupts */
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 
 	/* Restore global registers */
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 2414291aa908..32ce38c7096a 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5656,7 +5656,7 @@ int dwc2_host_exit_hibernation(struct dwc2_hsotg *hsotg, int rem_wakeup,
 	 */
 	mdelay(100);
 
-	/* Clear all pending interupts */
+	/* Clear all pending interrupts */
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 
 	/* De-assert Restore */
@@ -5726,7 +5726,7 @@ int dwc2_host_exit_hibernation(struct dwc2_hsotg *hsotg, int rem_wakeup,
 
 	hprt0 = dwc2_readl(hsotg, HPRT0);
 
-	/* Clear all pending interupts */
+	/* Clear all pending interrupts */
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);
 
 	/* Restore global registers */
diff --git a/drivers/usb/dwc2/hcd_ddma.c b/drivers/usb/dwc2/hcd_ddma.c
index 994a78ad084b..703cda5a5895 100644
--- a/drivers/usb/dwc2/hcd_ddma.c
+++ b/drivers/usb/dwc2/hcd_ddma.c
@@ -963,7 +963,7 @@ static void dwc2_complete_isoc_xfer_ddma(struct dwc2_hsotg *hsotg,
 		 * whether some of the descriptors (frames) succeeded or not.
 		 * Pass error code to completion routine as well, to update
 		 * urb->status, some of class drivers might use it to stop
-		 * queing transfer requests.
+		 * queuing transfer requests.
 		 */
 		int err = halt_status == DWC2_HC_XFER_AHB_ERR ?
 			  -EIO : -EOVERFLOW;
-- 
2.48.1

