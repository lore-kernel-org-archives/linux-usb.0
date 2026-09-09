Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44DD5581FB
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958733; cv=none; b=B5sRsttdUg4a0wEuLskIcm6gcDeaJo7l9hWpQSQNXeAOzVny+1BgED9PZ/i2FjFQ0PeNc/U/AC2mBETw2LurPFmMKr9oAOfEKEoREcl98xcx+K+IggxwaWTcDRiwCAuEfvAJmAHgUamnTXfw89YTCMU8oWDDwiv/SVKXmE9Q7a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958733; c=relaxed/simple;
	bh=CJauxnu2a5R//TL11/ZLXrK9vwFs88TYfWh8SfJsqoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WkInfW4E5Qg6qi2qU/bePpVZlR+FexXUq2iMUELiyuKb5z15Qbuvd7Vrj1LJExHT9DvesKJ4eR6uxczDrWf7JUmQLZQ6e3sfG4+4ZEj394R9JNVkZ2oZsZo0LLEH6l1IRz/sVgk6mEW3lUiXkYELxTroD4qoUd3ViHpONWC9p2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPa8feXO; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPa8feXO"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53016020b2fso95638721cf.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958730; x=1789563530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQZeX57AKn7cO35dqKJ6qXLJqAiuo0J1KANy4PLROlw=;
        b=bPa8feXOfmDUeWs1JvjN3VbjUOXeTfF4ZCixOBgQA8A4HR79bLmUEBjHFKo+jsEk+7
         z7tw/8gp9ElLu1tLw0XmMK5iSIp7BkLE6BzcCP0cTuhE1HUTKSGpMbk4zX1reUxOK79O
         QswHoXQAUClS5scZgfo6FWoz7ewq4eITHZP+tJN4JYo1eRSfVWxrzXx/3uaRLVzAKsdO
         X2IAqc6XAs3gm0mgSPDdtpJ1IkMUlAZuqy0JslCusEEqJHrnIQg1AwfgLF/MMTCp19Xh
         sA+u2o/baLjjYGDq5rXoKOzgl8R2oO14JbCiwk9/3/QaLOzusDFP0cKhh3/GTQ5ZkuVE
         W3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958730; x=1789563530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQZeX57AKn7cO35dqKJ6qXLJqAiuo0J1KANy4PLROlw=;
        b=K6OzL6WZ8/BqCbSOnYwt81MV4zSU6P0FvdN2Ewx3WzwdV2fly2baaY028ouBGyB65q
         nV47LqVht9kuMMsE5+nNs01CK5WvdBTZjEjRkQQ5Zd1Pd9VbyrrDqxHpG8hb1zNxUKIR
         6lJbQBSCcf3rRfNsCMpNVOT0UJTW1C7ACyMYRFp1dF5bUGKAzKn58yzQJ03n6cXXJiGg
         kmD0x1yKfQ9h0GRFlFxldzzKrovLN/tjeDvcjdFxKikvTlS7NjmfqMbfqPtA/yCuife7
         g6hflvchyluFkw68Qaos/Lm3CbQizBL650mrSlLtVx9Ywc0qG2nmx8TYIgyQJp7Z3sfr
         wNGw==
X-Forwarded-Encrypted: i=1; AKwUvByzT7E+Jo1PUV445EIaV5MUSMpsqz8+vW1xCOm35YVbNSxZEjYHkwfcS48WPtkhr47gFXzM4b/BS2I=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ5xusw2EdyLCCx+UWtB1HmKuK1o+SWSk7kFy7e4uO2KYcsvl3
	472SCty39CE2fohlHgg6R17vsaGqL2zAVP6aRELV7OxFtgN68l/UTHNc
X-Gm-Gg: AYBFou2wHZ5l3XPH0c8MP81QxOBp3zdUuWaLlTgzqCBhhY1kqCkzKHHvz48LJ3gbD+U
	JLs7qQL5VcxpeRQVmvK/lABIjm7XGoTu/HpIapPsRU+2zjGGCJG8e0LEeWb9wYgHdYj9256pgZo
	IMb0wAk0UBi+SChc87eFZ0ajxyxCGBWOWuV16RuXPWld5nfYBYH5WW0Tc8GNB/gcmxe++3r2+JO
	WguC9/YWPX0ATijlQPkIh85d9s2sYfcwx/Pzcnb2LibKhwZJhXdOop2fR+YCsOyCD4w4I0rjAkJ
	WBpixDbC1cfyvqSRmOrBU+5AeHQA7n9a+DIQ7FFCG1CPIkYadC8KEP6FVEB7BfkxqzxHserzVAK
	SHdojEOaLKISrX3mZvN9MkI7XJD6gpaEmDQRyP3/L0dE3nzeDa5Nh5RGJFg/nCmHDfHuGiZrXnm
	aISlXPoAOFRXmQ4nw/vNCQStEiWGP5i14JjrkGCCgqdgtE5HaahG5RX3lI5/z1ONWEmf2jU+zF6
	fmWNYvV1GrEz0uH3de9NLbB10d6YhMCb+5p548HUVbjnJAY
X-Received: by 2002:a05:622a:2613:b0:52e:2d19:b27f with SMTP id d75a77b69052e-530546cff50mr415133481cf.19.1788958730279;
        Wed, 09 Sep 2026 05:58:50 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a803:6c49:659c:692c:9416:2f0d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53080ce82aesm82437691cf.31.2026.09.09.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:58:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] usb: xhci-pci: Add TUSB73x0 definitions
Date: Wed,  9 Sep 2026 09:58:40 -0300
Message-ID: <20260909125842.528340-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of hard-coding the TUSB73X0 PCI ID, USB_CTRL register address
and the PWRON_POLARITY, introduce definitions for them to make the code
easier to read.

No functional change.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a8889081ae82..c580e0b86011 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -28,6 +28,9 @@
 #define SPARSE_DISABLE_BIT	17
 #define SPARSE_CNTL_ENABLE	0xC12C
 
+#define TUSB73X0_USB_CTRL			0xe0
+#define TUSB73X0_PWRON_POLARITY			BIT(22)
+
 /* Device for a quirk */
 #define PCI_VENDOR_ID_FRESCO_LOGIC		0x1b73
 #define PCI_DEVICE_ID_FRESCO_LOGIC_PDK		0x1000
@@ -95,6 +98,8 @@
 #define PCI_DEVICE_ID_ASMEDIA_3042_XHCI			0x3042
 #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI			0x3242
 
+#define PCI_DEVICE_ID_TI_TUSB73X0			0x8241
+
 static const char hcd_name[] = "xhci_hcd";
 
 static struct hc_driver __read_mostly xhci_pci_hc_driver;
@@ -479,7 +484,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	    pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
 		xhci->quirks |= XHCI_RESET_ON_RESUME;
 
-	if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
+	if (pdev->vendor == PCI_VENDOR_ID_TI &&
+	    pdev->device == PCI_DEVICE_ID_TI_TUSB73X0)
 		xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;
 
 	if ((pdev->vendor == PCI_VENDOR_ID_BROADCOM ||
@@ -678,7 +684,8 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	dma_set_max_seg_size(&dev->dev, UINT_MAX);
 
 	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
-		pci_clear_and_set_config_dword(dev, 0xE0, 0, 1 << 22);
+		pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
+					       TUSB73X0_PWRON_POLARITY);
 
 	return 0;
 
-- 
2.43.0

