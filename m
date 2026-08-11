Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A63BE155
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464146; cv=none; b=FY1dMOjDvT7JNdww3lltOuSa2X7widaUgKs9JwvQmIYuZWh0b8e0Vn5esIRGFj7sMlpSZDkdhrJDFA6FGep0x38MnvtkBpqoHS+daqa3Y8HITMPXsNnG+tT4Qgf7iz+RwMvmF7D7GnYwwLxUeEeNssg93lm1hZ+HWonvzrronew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464146; c=relaxed/simple;
	bh=ibA3N4naXcwQ7FSrp+/HhRESL8Wumq1H1Kkn6Gvv8rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Uwg98LSUMCz3oothW15erosUcWCHBim6VDuNeLf2jtDGX3FzxbmC2aEVFJqjqG2c3/mz6c00YoTDpGmQCjdYsycGHI+XLjLJ7mDc7Zflqa/qXKsbLkyh9AzOHZ2Fn6eAImMHVEqEvmGQST1kzbDZBLB2DdG3kWrVkWiMvwAuaf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6f5SkUB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6f5SkUB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so45906955e9.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786464143; x=1787068943; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YKuVHmWubrbchLov+8MIAEOBThpmNeGt+J3QgdJT/U0=;
        b=c6f5SkUBpihR4Dm9iJYLXhKIOmBP1JDr/Y0qK5Pnf8oVDnPzYRnvsPWSywgISyhKFT
         WFZQTtVg3EEMfONhtNHR+OkW6FGakvtFMbLpdJueIRmOpMHrckVkcw6LYRgkbSUkrB+9
         yWg/Z4q5g0ysqXy4ldNEOc3gTqhG5UiY3PS+VeaiCCCVjyK+Z1W+TyVAWTV1OvkM4Cph
         OdGiMgWVdeN7mJVpVb+AQuARgpkImzgOlsyZJz06j6beidPLUBWFVzcBM/dQLzb8wOTY
         Ho9bHH/z6ODk6zAZKY0WWRkQXDp2V/oMtJlD6Y8bcmTccV0a0J0WXzauDlXpz8OCz9gr
         94/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464143; x=1787068943;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YKuVHmWubrbchLov+8MIAEOBThpmNeGt+J3QgdJT/U0=;
        b=W6RRGSyzQ49UXt+Cy3OO6Ug+aZaiy1Uv84e1dtCYkQUjBwlS0zyANPauJXK1iNLtyN
         E2CcG9P8in9SK4TyVg/NBzEWsjKZ234BbHw/XZ5Nn60oOKulgyqYQqHpG+2b/kBPVlI4
         CYUT9V2g23YvLlJlkerLKbUFTqB1k0OgZ4ocGM/gXJAd8RUNA+6+bA1DG4tLYcvfSzis
         dCQq+LPVGA/oDMPXnwCXhPVdaBv7+vtSDwF5GgGsr/9WxKba+MwXoPO8k9fR8ZJsPr3M
         1MWvPKbK7wfic5hIn1TivLEeEZYOTDygxZpr15lfKxcWX08MAekS9+9ppi+TNEDSR5iG
         l+dw==
X-Forwarded-Encrypted: i=1; AHgh+RpoJx0lvO8iJwu51FRR7qA5jZelSMiO2X+jr0ge8WWvbQIE8H1svecvhXJPNomFBj6t0NqQzeepqqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8bVWnlSa671NpUCqETZMbR6Qi7KF2BP9oye27L8ule+IbShRL
	sWJ+4PHLbiI0gAiEzPQOsHM2DHm9HdCVXHPAHaZ/fkR9axYVNXYsBQrE
X-Gm-Gg: AR+sD12+Fdd6aKxgUbsG/qMaQLaWpjxw5p8XtPOe76zip8nXgQFY4mC44dviha9m0rW
	RILzVTCdOCSnQCazxDWsZssuOlpJ9GDIZ9QBf+xaoGjP7lV9FPzoPQs5gG6YI4C3VafV62Hklbf
	9qz8FLXK+U2jrgUUGtBEfRCgc6Jl+YznJz7Ta1uMm8girolSECiFiR0Tc/4pGDPQhf6iNGpcJpg
	SuOk3BwbfBGZNbgfkNnE0yNHydHPT7WTTE78do/zLO/Tm+L1Sn3Pice8QIFUU55YAoOBDgyjdkX
	WNTSdNaG1ALxMGR4GIagP8x0DbXjrpqM0sOo/CQguQ0riNfYIa1koQYHOpfpRVdpsXj6rFQih9q
	fLFC0AWkavpa237KDxRSLtzjEOI/RBQtXf5LfAU7HM64eZmwBjchzqXWoUH9QxQV4q6TGS8Zh3J
	GB6TsVcjsOvWKP5iCmlFkrkvl4AepV8szWGBjdXUYcv7FfSxg7iEkbNwJliZ5B3Lz5ATEj3g4so
	LgzgujKWuPSsUnDkbYkLFm7kuyxqb3kWB6GAWYp40+Rg30XCyx2uw==
X-Received: by 2002:a05:600c:3f0c:b0:498:162a:dbda with SMTP id 5b1f17b1804b1-4997a603293mr24435845e9.5.1786464142779;
        Tue, 11 Aug 2026 09:02:22 -0700 (PDT)
Received: from valmpani.valmpani (cgn-195-14-219-6.nc.de. [195.14.219.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf917csm2297195e9.13.2026.08.11.09.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:02:22 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Tue, 11 Aug 2026 18:02:03 +0200
Subject: [PATCH] usb: gadget: pch_udc: don't call pch_udc_remove() from the
 probe error path
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-pch-v1-1-f79801c1cd91@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHpHe2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0ND3YLkDF2zZBOLFONE8+SkVFMloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0AHaRbaWcAAAA=
X-Change-ID: 20260811-pch-6c48d3a7cbe5
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@ti.com>, Mike Frysinger <vapier@gentoo.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786464141; l=2932;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=ibA3N4naXcwQ7FSrp+/HhRESL8Wumq1H1Kkn6Gvv8rA=;
 b=54dc0DOWz3VR5GBJaayo3jdS/qX5IaPAMOTT8bPXOxO4NOFhbd1KqchgerXeSyNcFOohmRH9r
 JvQ/xY/WjdxDcld+YvRBupDjnQWLi9O46i4clV4jx6WKuQH0RIuajGT
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

Probe error paths go to finished label which calls phc_udc_remove. It in
turn starts with an unconditional usb_del_gadget_udc(). If probe fails
before the gadget is added then we put a non-initialized kobject
(gadget.dev) and a WARN is triggered in kobject_put().

  WARNING: lib/kobject.c:734 at kobject_put+0x252/0x640 lib/kobject.c:734
  Call Trace:
   put_device+0x1f/0x30 drivers/base/core.c:3880
   pch_udc_remove+0x47/0x510 drivers/usb/gadget/udc/pch_udc.c:2986
   pch_udc_probe+0xcc6/0x1130 drivers/usb/gadget/udc/pch_udc.c:3109

If usb_add_gadget_udc() in turn fails, it has already dropped the gadget
reference, so the extra usb_del_gadget_udc() is a double put.

Split the hardware/DMA teardown out into pch_udc_cleanup() and call
only that from the probe error path.

Fixes: 0f91349b89f3 ("usb: gadget: convert all users to the new udc infrastructure")
Reported-by: syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=3e2e533aa1b2a75525e7
Tested-by: syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com
Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
 drivers/usb/gadget/udc/pch_udc.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 0a6886428739..5704aff2b09b 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -2979,16 +2979,8 @@ static void pch_udc_shutdown(struct pci_dev *pdev)
 	pch_udc_set_disconnect(dev);
 }
 
-static void pch_udc_remove(struct pci_dev *pdev)
+static void pch_udc_cleanup(struct pch_udc_dev *dev)
 {
-	struct pch_udc_dev	*dev = pci_get_drvdata(pdev);
-
-	usb_del_gadget_udc(&dev->gadget);
-
-	/* gadget driver must not be registered */
-	if (dev->driver)
-		dev_err(&pdev->dev,
-			"%s: gadget driver still bound!!!\n", __func__);
 	/* dma pool cleanup */
 	dma_pool_destroy(dev->data_requests);
 
@@ -3016,6 +3008,20 @@ static void pch_udc_remove(struct pci_dev *pdev)
 	pch_udc_exit(dev);
 }
 
+static void pch_udc_remove(struct pci_dev *pdev)
+{
+	struct pch_udc_dev	*dev = pci_get_drvdata(pdev);
+
+	usb_del_gadget_udc(&dev->gadget);
+
+	/* gadget driver must not be registered */
+	if (dev->driver)
+		dev_err(&pdev->dev,
+			"%s: gadget driver still bound!!!\n", __func__);
+
+	pch_udc_cleanup(dev);
+}
+
 static int __maybe_unused pch_udc_suspend(struct device *d)
 {
 	struct pch_udc_dev *dev = dev_get_drvdata(d);
@@ -3106,7 +3112,7 @@ static int pch_udc_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	return 0;
 
 finished:
-	pch_udc_remove(pdev);
+	pch_udc_cleanup(dev);
 	return retval;
 }
 

---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260811-pch-6c48d3a7cbe5

Best regards,
--  
Vasileios Almpanis <vasilisalmpanis@gmail.com>

