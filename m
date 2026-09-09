Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0025B559C98
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958738; cv=none; b=s/ZP0h13lPBCQ+a7ozJIasv5pgN4SNh20JYz/uhBUpGzQjqhPW4V1Djn1bfOqJm7NFx0w3wZFctU3fjQBYQNFIZrA2ZFNUNQ0d7i9mZliB2A5GmaG8b6AUZmLmAakKxkfLrHT9YRtp9U8t3wQlJMHWTXJBLepKJtlxcMgSZ58FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958738; c=relaxed/simple;
	bh=Ehj7zLlK3IfN6pnw/eyYNZgW+/YW90hhvAnEI+YxU0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apYxHvE2rwpok59zJRAbWh00iIRn52n45wIr1D+R8vYPeLB3DwhzrBwSwliI30F/Z48M/NWQ8XIeRGJWmAIduWNQ5Frrp99EUK/TTSJMF9VZ2Ia5eA2eB6eNKYjeD9rJ8M3w6H3QyiJcoM15ELdGRYRAJPJ+MgjSliisEoqBSk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5Rx3nrz; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5Rx3nrz"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5303932c4f3so27362651cf.2
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 05:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958734; x=1789563534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGf+TQPcMmYbjIbIQ5HUtK4yD4oWM2UxXWXNQQ2nbIg=;
        b=H5Rx3nrzEwC7bdcb8YdQnZ4pWtS0Su7nqnu8oY7aeB7RlZOXlFzlthVdnYOVUt3SdG
         55hMO8NZuFx7aCkySGttJJ0KWelmm8L+cEHB1haVZKYZrLTf0abFZ6/WhASQq7AAif1a
         hsB7xf5kPUVyf1PFFtQEg4vqgf0sGezt/xULg3HYVoM+4Qcx41KmU9TiBjrNLX20Yiba
         c7lHFhIGp14Jx0tNKnafQcQEqmFPXhX6sU2exFTaY+thAjjV50TFhlm8/ucgyZNHcqW3
         UTUaD0x7wt1Ft4aT9/ORIj5lsA9wF1OiH0uP67RJKV9coEJgM6qbKUUXbXpkIFM5/cxK
         9RFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958734; x=1789563534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGf+TQPcMmYbjIbIQ5HUtK4yD4oWM2UxXWXNQQ2nbIg=;
        b=MP55NfjLaLhsKujTXpoMO3soARSSZBq0V48mSHr4Q0GmUwChPXd55w9vTWfHymInGL
         qBc7l7coa7tMm9npYQB+/pBoG3qHhEUev07V/ly2tndjGLz5qqatFauaNbUEtqpC5AMn
         oHD4P+5OD7wJhfgl6GOGoC9+kH33Di/MezCOWlyz41zbyUJq0kGrIkOuCTk2LP8CF2kH
         MXmktr3sb7qY8cNM9+ycKfv4MS88qBb+Iqdx3R38j4X94Z+/pDuZPS74bhtAV15aHoIX
         UV8DCg6k9i2zB4rr2m0c+plOJqntF0dbmJ8Lo/oOoc+CK3/TiUD4Y4U00DwMX7kj0NZZ
         tZ4w==
X-Forwarded-Encrypted: i=1; AKwUvBwkZJjuNU8jOOdUu1Zdint0XRoP50PS2AokpSRrdGgmSMNvJyaP2At4K0xjKdWJubX2vn7Fc6X4wTI=@vger.kernel.org
X-Gm-Message-State: AFuF++nT63jnnV1oEpC5gxegLjtNHjgTE35TnxA3yBM2PqPj6hV8tfXY
	RhRAk3B9l1HaTFMBRuASH0RrJEZuldrtnRRgDfHdZvC19VwiDShJ2Q65
X-Gm-Gg: AYBFou0/kUUc4O9SG8AYuXg1q7liD3fx1hVfdVfbfPZIm2nC1/kzeUUibWiri6kzWCp
	H2KwmxYaJEEA/XTAdf8nJSnxFQ3dtsN4AU7uM1eQeD/znyGirxeIZ8XUJwh4rP+TLuhoz040TNH
	ATBGUm0eTlBaJW61Yc6j+Ra3TL49NabFt3SaYT2WyO3H1/omUTphdQY+kigMANxUSyhrq5j13Hs
	artLJ3y7lL8/XOb0mmJRvVphmoAPtTTkvFyU3ikQDOzjvWHKaSj/djxdGtpGkbuL67ZuRZ8GSve
	RG0j8Wgq1msreGf8BAI3SV88CLIswXE9tJZcQWCKDyamklUZl16TPoAAazgHAWVQXYi5Mb3BSRM
	R0630DwzjK1+z9HTyvOXi7rNf9TIHHZLkPn4+3TkMoYuR17Pu7MScqFaeYb7kRkFUbqkYP84aCZ
	TB/U9EvpsaPfycvWLZ1LyO8Fx5ljNuoqQGwsjqdE1Hbjp3ukFcIZzY0vX01vhNiT9ZJVmaZycfM
	LyvCXR9gDzxUjPbuSI1rsczl5rVOnrqwJpBr64bJ8qwhGxQ
X-Received: by 2002:ac8:5913:0:b0:52d:74ac:6ff1 with SMTP id d75a77b69052e-53054955026mr417095391cf.25.1788958733207;
        Wed, 09 Sep 2026 05:58:53 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a803:6c49:659c:692c:9416:2f0d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53080ce82aesm82437691cf.31.2026.09.09.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:58:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] usb: xhci-pci: Add run-time check for TUSB73X0
Date: Wed,  9 Sep 2026 09:58:41 -0300
Message-ID: <20260909125842.528340-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909125842.528340-1-festevam@gmail.com>
References: <20260909125842.528340-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "ti,pwron-active-high" property is only valid for TUSB73X0.

Protect its code so that eventual specific TUSB73X0 register write applies
only on a TUSB73X0 device.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index c580e0b86011..75aa679f7d79 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -683,9 +683,11 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	dma_set_max_seg_size(&dev->dev, UINT_MAX);
 
-	if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
-		pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
-					       TUSB73X0_PWRON_POLARITY);
+	if (dev->vendor == PCI_VENDOR_ID_TI &&
+	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0)
+		if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
+			pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
+						       TUSB73X0_PWRON_POLARITY);
 
 	return 0;
 
-- 
2.43.0

