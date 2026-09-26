Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5A3815DF
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439944; cv=none; b=NC3x0y1eqYy2HPyNqgHbtC8EViwFvFOWbtGL6sR5GKlTEd5uVEmW268dr5ov7vi2V7H8f+GQwiHRf42thzBCkgvj98zrtg1+V2vjZKDNP8pEClrAt+j2mp5JnZN4i2eOCgQQferRx/vGDtSTNIE/RUh0LFsSJoZUjzdi3LX+BOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439944; c=relaxed/simple;
	bh=KHu6n6nF7r8HoMbgICyqgJcdR6e9Uz2lwSDzo87ed9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nr/8l/e1BQBZ/G/78sAJ+aRBI/T4LczCiRiqugPsRuyjvsds9B1FdgnYsL/CMVAbLqRiy+057mzmVGqYTVmctyOc6mxFqIDJwKt8nEYCh+jmtr5kyVhtqEtxGp4Odq6oEQtojcZh5ow46shRe0UDvLsjBX3W07hThQxywy+/mfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4kt2Q2c; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4kt2Q2c"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so212033385a.1
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 09:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439927; x=1791044727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yxGw90+JpYDU2nxs8d7bIbWjyZdBY1QVcTsJVhZ3GNI=;
        b=m4kt2Q2c5pA1VSj4Zp8vqILDOQM+yQ+cnrNu8NJp6OocUIsaYs7FwpS7tP9KoHdEun
         RtALTZ7n0s1REPOLxwcIyTHIJ0kad6Yn3WUJj/FMM7DjZ28QIW9fj9FnXAjfWbZr2kGe
         cUETHvyp+/Tn5VJ2RIGbHE/sWA5oppZCcc519Ila0rAykWXmweIg1HjpXsm3pf6e/KQi
         bzRU9tr2YbvT1crVSQub336JREZB7a7J28w8X7q21RlNl3WIL6bZrTYDkQZljLH2Wh+W
         0u44pTlP13sXqwYOMS1+gVmIzBtH+Fs0aoY2+Y5rOdjuImsoo9VWQjeArhoDXqutk0ls
         6kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439927; x=1791044727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxGw90+JpYDU2nxs8d7bIbWjyZdBY1QVcTsJVhZ3GNI=;
        b=RWBuXXOaMsbvatXAS7ZR37G/guMW/UcHqG04oxxxJdh66v04kxBZjkE9t6Kzme7sM6
         uMmkKNq7Ft3XSrFGgMYunvBwFVTX7d4ObUkovRrZnbLvzrKHJAYMOJvWgYIU+3zM87cC
         YCrKdpFpXpPp98SLquGty0xt2V6w8lLxOtk4fQzMRD1GKEAzV7fUmxX0HiwriGpKZD3i
         yBKyclLd24siiBaLXFZroSizExRwjxqXva/lZGTN07n8R93czuTBfe4Uw7ry/7aIVkvM
         d3hhFEEvE9ycHhXIoZ244ag3QdKHJv1FjMzH/snRN2JOOWFOu8UBA1fDy9irW7qzmDyk
         WzOg==
X-Gm-Message-State: AFuF++mtpcN/PZXQ0tPNiPtTFxYumlWDbIjCJiyK4/hgWxfvlW71qrTA
	3JHiSYN5llxVFaRLL//SRTafJ9anIdQdq1P7a706UjLp4Akp23/Lb3NZ
X-Gm-Gg: AYBFou38Eqnct94H87VHgj3Lx3/1fYTDRvwT2zSqMwzSJeCWv5UvKWGVTlfwEeqE0NJ
	uoGlnmcCp4Ym408EeOHJzwibboahl+b5R/cvaqvQfFSuQh2nIGp4ccHCMaGUntQF058L4krNkXd
	xLRLLASSotBR60+l2Wo2VMwMP7oULD/Yom7a8CJq/Jspy+wcM14dl+g0Cg7lpt7tFOT8H064pUp
	d9S9MJ7JR6JQ0rjV5ufHB/D0jIhO1waaJY/tjTxq/rZAHFQp+sOMIcPYvz7nd7261MtXQ7gfa5q
	7yYz9yeQIEohA/53i5obOSu6Ri/1JsuIVQnLtFIVcYzdfj7V3esjsw/cyKhs8quIpNKfne0uuTW
	H29i81JEWhdzAyKHAsC2WUz+jBpfjjWC3Igi5SEVxEN2Fwrnk5Gc1d8RELd6MX6SzutdYzJjKF/
	ES1ceATYcmN0WCyAitsESr8zMoDPWAfDyCYQi3+x4Ph+pc5DkZXB2gKU+e9k5FMCb8vWoaOerUf
	Y9pVMuvKihCd9hyw7tF3dZOqMPPKUgWn0+yiFyowzFAu16I2Q==
X-Received: by 2002:a05:620a:4492:b0:939:2c5c:7977 with SMTP id af79cd13be357-93c43c75a3emr1115967985a.20.1790439926593;
        Sat, 26 Sep 2026 09:25:26 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430ecf80csm42110476d6.49.2026.09.26.09.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:26 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: pch_udc: fix typos in comments
Date: Sat, 26 Sep 2026 12:25:23 -0400
Message-ID: <20260926162523.25335-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling mistakes in comments and kernel-doc found by
codespell.

Assisted-by: Claude:claude-opus-5-5 codespell
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/usb/gadget/udc/pch_udc.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce28210f..e8ad452a852f 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -53,7 +53,7 @@
 #define UDC_EPCTL_F			(1 << 1)
 #define UDC_EPCTL_S			(1 << 0)
 #define UDC_EPCTL_ET_SHIFT		4
-/* Mask patern */
+/* Mask pattern */
 #define UDC_EPCTL_ET_MASK		0x00000030
 /* Value for ET field */
 #define UDC_EPCTL_ET_CONTROL		0
@@ -73,7 +73,7 @@
 #define UDC_EPSTS_BNA			(1 << 7)
 #define UDC_EPSTS_IN			(1 << 6)
 #define UDC_EPSTS_OUT_SHIFT		4
-/* Mask patern */
+/* Mask pattern */
 #define UDC_EPSTS_OUT_MASK		0x00000030
 #define UDC_EPSTS_ALL_CLR_MASK		0x1F0006F0
 /* Value for OUT field */
@@ -110,7 +110,7 @@
 #define UDC_DEVSTS_ALT_SHIFT		8
 #define UDC_DEVSTS_INTF_SHIFT		4
 #define UDC_DEVSTS_CFG_SHIFT		0
-/* Mask patern */
+/* Mask pattern */
 #define UDC_DEVSTS_TS_MASK		0xfffc0000
 #define UDC_DEVSTS_ENUM_SPEED_MASK	0x00006000
 #define UDC_DEVSTS_ALT_MASK		0x00000f00
@@ -132,7 +132,7 @@
 #define UDC_DEVINT_ES			(1 << 2)
 #define UDC_DEVINT_SI			(1 << 1)
 #define UDC_DEVINT_SC			(1 << 0)
-/* Mask patern */
+/* Mask pattern */
 #define UDC_DEVINT_MSK			0x7f
 
 /* Endpoint irq register */
@@ -141,7 +141,7 @@
 #define UDC_EPINT_OUT_SHIFT		16
 #define UDC_EPINT_IN_EP0		(1 << 0)
 #define UDC_EPINT_OUT_EP0		(1 << 16)
-/* Mask patern */
+/* Mask pattern */
 #define UDC_EPINT_MSK_DISABLE_ALL	0xffffffff
 
 /* UDC_CSR_BUSY Status register */
@@ -162,7 +162,7 @@
 #define UDC_CSR_NE_INTF_SHIFT		11
 #define UDC_CSR_NE_ALT_SHIFT		15
 #define UDC_CSR_NE_MAX_PKT_SHIFT	19
-/* Mask patern */
+/* Mask pattern */
 #define UDC_CSR_NE_NUM_MASK		0x0000000f
 #define UDC_CSR_NE_DIR_MASK		0x00000010
 #define UDC_CSR_NE_TYPE_MASK		0x00000060
@@ -296,7 +296,7 @@ struct pch_udc_ep {
 };
 
 /**
- * struct pch_vbus_gpio_data - Structure holding GPIO informaton
+ * struct pch_vbus_gpio_data - Structure holding GPIO information
  *					for detecting VBUS
  * @port:		gpio descriptor for the VBUS GPIO
  * @intr:		gpio interrupt number
@@ -319,7 +319,7 @@ struct pch_vbus_gpio_data {
  * @ep:			array of endpoints
  * @lock:		protects all state
  * @stall:		stall requested
- * @prot_stall:		protcol stall requested
+ * @prot_stall:		protocol stall requested
  * @suspended:		driver in suspended state
  * @connected:		gadget driver associated
  * @vbus_session:	required vbus_session state
@@ -332,7 +332,7 @@ struct pch_vbus_gpio_data {
  * @base_addr:		for mapped device memory
  * @bar:		PCI BAR used for mapped device memory
  * @cfg_data:		current cfg, intf, and alt in use
- * @vbus_gpio:		GPIO informaton for detecting VBUS
+ * @vbus_gpio:		GPIO information for detecting VBUS
  */
 struct pch_udc_dev {
 	struct usb_gadget		gadget;
@@ -846,7 +846,7 @@ static inline u32 pch_udc_read_ep_interrupts(struct pch_udc_dev *dev)
 }
 
 /**
- * pch_udc_write_ep_interrupts() - Clear endpoint interupts
+ * pch_udc_write_ep_interrupts() - Clear endpoint interrupts
  * @dev:	Reference to structure of type pch_udc_regs
  * @val:	The value to be written to interrupt register
  */
@@ -1064,7 +1064,7 @@ static void pch_udc_init(struct pch_udc_dev *dev)
 	if (speed_fs)
 		pch_udc_bit_set(dev, UDC_DEVCFG_ADDR, UDC_DEVCFG_CSR_PRG |
 				UDC_DEVCFG_SP | UDC_DEVCFG_SPD_FS);
-	else /* defaul high speed */
+	else /* default high speed */
 		pch_udc_bit_set(dev, UDC_DEVCFG_ADDR, UDC_DEVCFG_CSR_PRG |
 				UDC_DEVCFG_SP | UDC_DEVCFG_SPD_HS);
 	pch_udc_bit_set(dev, UDC_DEVCTL_ADDR,
@@ -2569,7 +2569,7 @@ static void pch_udc_svc_intf_interrupt(struct pch_udc_dev *dev)
 	dev->setup_data.bRequestType = USB_RECIP_INTERFACE;
 	dev->setup_data.wValue = cpu_to_le16(dev->cfg_data.cur_alt);
 	dev->setup_data.wIndex = cpu_to_le16(dev->cfg_data.cur_intf);
-	/* programm the Endpoint Cfg registers */
+	/* program the Endpoint Cfg registers */
 	/* Only one end point cfg register */
 	reg = pch_udc_read_csr(dev, UDC_EP0OUT_IDX);
 	reg = (reg & ~UDC_CSR_NE_INTF_MASK) |
-- 
2.53.0

