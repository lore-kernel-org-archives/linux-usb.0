Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B92D49CF36
	for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2026 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791209529; cv=none; b=V8GIhO7SPEqLDncqhJrzZr+gDnEvgLrPgax6P60JY3sMV7M2ODO7c3hXO88hkMApUbcn6nqtKd1Nwu9BScEiqPhG731VPKvfx0xH3iSwXJLE6GLBmQdp7MOmFWMuU0tkHlVX9T6wli8KTFn4SJCJ0LcJvBKQGclp559IiJiZKtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791209529; c=relaxed/simple;
	bh=LWoqwo8OPOF1pqAPY7zk58MStnc+PQK6YDQKYR9dyZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZ/G0BNwM5+5Yks2yYXHZkUNBgYJXUxTpNqBNaipaohrAf2YP3S/jYCJZ5rPY/KNaAzSkRZQ+Y905FZUDXutk7neDBNfrmREZPReVVg2tvpG6muskDMdSjzxzMy5XO79ic7Je5MZGYZzHmMJzjkB8/jon8gaXOoSKHPcbB4Q3/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwuWHU5k; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwuWHU5k"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7c0632898c9so520093137.2
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2026 07:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791209518; x=1791814318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHtTy9lDcxvA2WiCWTCjZ0Fyc3K2ZxTW6s38+wxLTi4=;
        b=mwuWHU5kndioTalq9PNtE4D/GV/RjW7pIwTT1MmWMozvkjNlkK4Kb/SY4r6jEpuce/
         oun9iIenAeiG5/HY+j2FXIRlpxDv5rFA/ihM0AphYRoVj7RE9o2RXPBfnndaJ3cijOv/
         V9bqRZ6Cen9vcLFoVcasLaQRlVSxYdXPc2rvXDyzqdVQHIdfFLBNw/zFqZO0UATi0kib
         jlQs+vygiPeamj6YjoldTf4dgQhfoM+OiXoKlXOeykQYmPRgClUNCNf8SnO+97Tlpjf6
         J165GXwaX4KwB4Lg/hWYFkJ3aDe4PghOCTVxYIdlKtS5nVG/qLPIZPT4sTQBU1dpYMbB
         bBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791209518; x=1791814318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHtTy9lDcxvA2WiCWTCjZ0Fyc3K2ZxTW6s38+wxLTi4=;
        b=22Hx8wim7jYJEeyFOFQ0cXpP/2xihWdxAa3Ml+TwjCBK06usx78SN1WCgu5SnIiLt4
         C0iaurZPRrF9Un83nB4vTGEY29ThKF0UhcthxJS0NpfZNiP8mfgEeo9LRCR+23L/3nXx
         Aq4kSBxgwFhzUeGz1iikzu+nYUe4wtnVT7u7qsgIzKAPj7xb3mlSD3nExHTu3Ch6VQpX
         YCfzid1ssddJ1rKHsu10WHjXW1aW1/0OWDQYHq07xl1kS6TNuqcoEqfXgcf8EBZxK8AL
         ztiRoYxzw/LcLdQcVIBVM9ZLevF3CmQFUMbN+fRdtUMOIfTnIuK1c+SRARtZxE1n77+G
         Ityg==
X-Forwarded-Encrypted: i=1; AKwUvByTgzYNkJ/LuQudjy521032CSBzckdsCW/X1A+j8pAxS0gqlzNaplIZimz5U/zR83QESi8j3Br7ePM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAqLbP2PSgHXCyQG6chBbr+RT6WBi3RWgGEMAOQVIgmmG6WgYm
	bQvY7F3bLbV4ZHEzGhSZilZfA6STPX6UkPMwJqFrgZzxAbbrVr2T1G8S
X-Gm-Gg: AYBFou1PVgpJsfb6WPHuQFw0S1HzRO01MZaG3slpyjXvUIJ6ClmsRFmQnLYYb7vfl6q
	qEWpPOmqA5GaQFMtYpBKxQTPPFg6CzKWK5Yw6/qgw0cytAJB8vKgGzCyei23dsDVV77oWbXWY0W
	CxSsa4egW5bMJwfKiCIm/+dxUdbvdZZxPC2qwLD2XTmtC9IrhfyvQtp5txNlzdZls3dT8Q4ufD6
	MAt7I0lp7LCWa+fC6qhm5Wf8PitXa7U/aNr7QbaEiyy89ye0sfer4bnZ4gIdZQMsFjmWI+xtesj
	8cBJ/y+V+q/mkCFv5Je+s6k2Wg+UsNycJ4VlkOKjVHotLd5pr1oGC4FbTWzHMCHRvPqXKBZ/KRo
	w1kLUPUJ7/kVRmpy4bV7GKfj6ud3NmH1htXB8S/VA73Vq6Cb/lQH5mpTFbfdvF4x2727ErRC1K0
	05fMUvjtRqVZFcc9MBSh1o4RppXlNPwtciuHisriThJBRZaBrfd5hIwCyy5Jcp9dRbuNitea/wk
	0epqmey8c4WsOUE/qWQneQiMpHkIOXYKcuJt9eV360b8so=
X-Received: by 2002:a05:6102:5785:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7c0f64a940emr2234582137.34.1791209518432;
        Mon, 05 Oct 2026 07:11:58 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:a591:442e:c8b6:e423])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c100026109sm10033161137.9.2026.10.05.07.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:11:57 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH RESEND v2] usb: xhci-pci: Add TUSB73x0 definitions
Date: Mon,  5 Oct 2026 11:11:41 -0300
Message-ID: <20261005141141.385414-1-festevam@gmail.com>
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
Changes since v1:
- None. Only sent it as a standalone patch instead of part
of a series.

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

