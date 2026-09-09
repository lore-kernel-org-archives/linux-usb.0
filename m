Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15AE54A7E1
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958742; cv=none; b=ucx5jdIQ4xDlj1EkYYCGNaysBmcZ3mgYk/7x1rojyF8FpDJWNwJQr7AXhGKCxan4vsVepSrzzTIzgTVwx+s8Fdvdf7Ixv29mBc1pFhJS83w6mPQ/wTO/AQ5PgKXhR6kQsUGmBZ6r9eCK/s7OlPpwarwXzM71R6sRWGZEIBeevIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958742; c=relaxed/simple;
	bh=USnoT3hH/D4Z2P0IIDu1mlw/u6U3rEXT3E1Rlc7udYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQjitFWtwuwp6CzpzJ0CPSZt1WJDHN4aaN6vJDntmfNLbDfSr+mwEAJvk8duHu3z9pUYahtMSb6DZTk8UGiX8eOPL4s6mF6HG4HjwktYpq2siCHITiKLHPMXpJOO77AbdCHLAFAg62xWrOjo1/mawytc5b1o04QgVNMsQ+7Q47w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjmYfU1s; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjmYfU1s"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so37310441cf.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 05:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958736; x=1789563536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GITBy/+Z9DbHL563jv/EXEtgk9s5rq6PvccVk/UfC6A=;
        b=KjmYfU1s9qHYSA0ktj6mjyWF4gX3CZz8djcxLMin4Xy3aLYojkGvD6jhAnCLZuz0UJ
         r4vBBrVkJtbhZbbf08FN7TLhlte57odY1x+NXX46K3wlENAFSnRoAJaUEJocsZAOxz0f
         inUEqEbBNM9nXTcr292/V8/NElU6D19sWkFnm1XP8bPy0kcbsGXS+AWeXZX4H3x3BC5P
         H+rgjPuJadjj87AIVaDLTP8wRGuZDIoRqnTWNkaM9+NCy7LUkA+x0Y2WWzOPz7twRoxd
         4A4FizmXs/aXLGO2BVUsI+Zy9DEZslJT/1huLCm02FpniZk/twR499b0F7XrhMFukS5b
         vNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958736; x=1789563536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GITBy/+Z9DbHL563jv/EXEtgk9s5rq6PvccVk/UfC6A=;
        b=SK3N/gc+xtslWSmQSabdgbC8UdrSPOkDI/ymc/mWeZcsHWwSuONuwapQHZkKqjooaN
         7HO9H+2AqxhZ6teyRigM3AvzD/kXlDktPTyjBQtlw9jBM5l8b3B267ViVtM2fSAJRFvg
         b7c85qENJvwNvusR7HhEHtGLE4dkBeJ499oNJ6+FVtISAG6nJxgzheKEUhcfOw56tfPi
         YYiPu3rQVlqk3Mxw7JavHy7qNnHb00zgoCSRxx0wZV0FF0noSdI2S7oygcYr599TlOxP
         GYgoQmEKUmp0cAhseYG/pT1tqS8TyYhh5l7UqyBQCT4m5RykRtWbsyjt5Kq6nQA3L3kS
         CYPg==
X-Forwarded-Encrypted: i=1; AKwUvBwkrcZx64TBsaIrcvHP1o5BO+XI6gj44+CwWPP3pNFS9IQZFf4zCby1Ln5qRdUABNIMpNv/Lrot+Z4=@vger.kernel.org
X-Gm-Message-State: AFuF++m+EAhx3crLGqiaPJu3EIWQjprWvmHj3huK1J1t1EBUUb+yBQJJ
	P45zxQolKhr4/uGgs9n/ARcCtXS3+4sGXkBCk9sqMmJ2cF3TN9iYYV0u
X-Gm-Gg: AYBFou0UXtIO9+yXSj1/qCO+QmsAZrSenSzC9S2lrrGTG5crtX2rGKiKJYgdgU9/Ric
	/KkM9dZPxVMub8V63vHd1B9JJ5zEA0rb9BXkSy9iLvv4eQUFzjmYyq3jL6YdY4wZaL+ODPda1lr
	E+hwx3zqVR7zNfbMTikf+0y75JVHSbFD5ELI1pJIgrfIiXn2kxcPsRhdr41ugW2/sN5Y3e0vjoF
	cJE3XRYIFRtZ7gUzdFq3lJ3L5I7b5dQozCwBwrSOuLWGebgZELAKiCSERdguHI4Ubz54pS5t6bQ
	mzo9QD3tHmDBB5x5pOxT+6LCbBheQdNYH64yLlGRM5YGgy1I/4mcEb1r6X0cLNHHGXRj2LlOTX8
	5GPfOABab7KZF9RazsG77716LSLbphth1rhmVXcyBq6NthM/VBvQiB+6nE/QWz6vhtqajJpUrp2
	lhPWSJ6JTRTe7AE8HKbUOjzNBiLT8JuPbfmGsKpGcJA5QBusZsZtVK5BTTd6jdswAAx+8f1dpsc
	nDQArVXTn+527P4GQvK7dklbBG/c887JQ4jKrT2CrEv15rEag==
X-Received: by 2002:a05:622a:1dcb:b0:530:aa4a:993a with SMTP id d75a77b69052e-530aa4a9cc4mr32587241cf.41.1788958736195;
        Wed, 09 Sep 2026 05:58:56 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a803:6c49:659c:692c:9416:2f0d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53080ce82aesm82437691cf.31.2026.09.09.05.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:58:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	parth.pancholi@toradex.com,
	francesco.dolcini@toradex.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] usb: xhci-pci: Put PWRON_POLARITY on a defined state
Date: Wed,  9 Sep 2026 09:58:42 -0300
Message-ID: <20260909125842.528340-3-festevam@gmail.com>
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

Currently, TUSB73X0_PWRON_POLARITY is set when the "ti,pwron-active-high"
is present.

However, when "ti,pwron-active-high" is absent, its status could have been
set previously by a bootloader or by a previous running kernel.

To make the state of PWRON_POLARITY deterministic, always write it
when the "ti,pwron-active-high" is present.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/usb/host/xhci-pci.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 75aa679f7d79..833c55c3213a 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -684,10 +684,16 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	dma_set_max_seg_size(&dev->dev, UINT_MAX);
 
 	if (dev->vendor == PCI_VENDOR_ID_TI &&
-	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0)
+	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0) {
+		u32 pwron_polarity = 0;
+
 		if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
-			pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
-						       TUSB73X0_PWRON_POLARITY);
+			pwron_polarity = TUSB73X0_PWRON_POLARITY;
+
+		pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL,
+					       TUSB73X0_PWRON_POLARITY,
+					       pwron_polarity);
+	}
 
 	return 0;
 
-- 
2.43.0

