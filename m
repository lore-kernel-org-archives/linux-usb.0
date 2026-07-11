Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFCD232395
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783780998; cv=none; b=kjXItuapSPDFGH+vG/o1EQQzwfqvapUgjIejEpb+A40vAm5Q2GgBAJwHx2krg4evwYTdJbQRyHB/q3UDrOBxyHg2jLJEL9mzTCQOsv/qJ9xQGGTmm6qA+zpTjIa3F4I7QNDYS2IzR1Gdx2JBxldnapUrVLq7clvWjk1K/RwHdmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783780998; c=relaxed/simple;
	bh=LJki9Gw5Fm/A5qmGEAyzobNH0PCLwcGq1UPV0wpyHMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tzZlG6yolL+/couHzfDOkE3LFRk/IWxIZbqzYKE+W/n00TomWVkk6j62OrNRcXzISwv92Y6dzLCs9O0fM6ar1dnaO4D8DJfYK5x/aMaxTC5UzHBC8bv347mkf6+bfB86PQCo+MuIMunGIiULNPwofn6aM3VE36vhSS8QfR8gOm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kp8/uT62; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kp8/uT62"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceb096e675so2425965ad.0
        for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 07:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783780996; x=1784385796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NrmJ+0bq+1sY9p6nXxTAfxMvIH+K5N5pqOqXO5agSrg=;
        b=kp8/uT62lJJia3uEplcluZyuGWYoWSG/qN2uhWURxXfpCBHoHQvJCrGEmTsMKh7IID
         1KZAegYHzqECefwEUIYV0ZSSw6HTeVJbGO0EPMRQAXW5a5Ywghnsf9UPzr0dJjlq/FtC
         uYdkGgRnw4kgCIGvOWVz2xUWMM8+lY8LN0Yl6OLyJYrEQlgfnbKTO71lkTL2FTzqTUG5
         4W96LXd/16672y7F1aUuMbNbuMRcE9iAN+YKfIM9C7CkhkAtfMdD9zOXY6QHVwFcLl7h
         eR4W1ai+OzdpcIoeJ3Cmki8gKCEK9ykE91AFlY3rumFBhO3rbiJ7rZbdOrzWySruDfV/
         mvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783780996; x=1784385796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrmJ+0bq+1sY9p6nXxTAfxMvIH+K5N5pqOqXO5agSrg=;
        b=gvb/iu00Tzjhct2SIrHp2LddTQlwL1HmI68ja7VwcWxgtcqbShxeYCqTe+t2a/vnCc
         tHZdxsjFlR/Z55BdfToxaRgl2NovJ9U+Cyk/jN8e32+yXBmYoPjDdD30YO1W5xBrwyQ4
         EwmxkiC6minTsGX1nBZUiZRKlzxijqPGKVlULBdCs1yxK+5YqrKl/pTIYQXLG8sqaFEz
         ERqsQvmQgksq7Dl4Iqp6/bpWN4Q6bxATLvKtC7wptjNDagX/qAyudN6T4iuw4/at30cR
         d6PsUqMMkZrWyEII9v5Y6Fr2f+4UKLDddKxsMBGYaqzEcWdOD5yyk0ti+7vx8VQoJfVV
         eVDg==
X-Gm-Message-State: AOJu0YwVwqjQBNe8uPdh+4eXJ4N5E6ugTlE4gres82TIram3EL84TeMX
	DRNqCjp2uvna+KMLcOjPwfR4ekg7BYzVwQXxms9syP4TUa68yMpC9Ymh
X-Gm-Gg: AfdE7clkZ1Q1Y6CnFTCsyGtMiFXSuWRdgTmLoz46YayDe0vgCZglhKFuTjtNjl8aOAu
	SMcyEHrIfnPu7YHVbOkoh4lt+oS2Uco+B/THVc4mjvifMrr9FEF1k2o8Ie6A/z8c95ZfH3OIsiq
	AIyCG08/RKg+zjIAKMCViu4jgzUQLDJ70fU3J3dz9hkXXFDFmKPVEA69SW8dnPGTNiofzD4cyCt
	aJZHjlcV+5mjcq0DhhC6q21TlG704OPExRIQNyR0VhRjuJUrQD6dQ5vsR6VCPyRDMesAwYlUWvf
	bB2I2O2iakSkGzENP2CRhIgISI2kRNfVExKH1n1/wAL9AgEvGW9dDdCcpSZrgmCXj6uiO84nLlw
	WeFoVh8HwAskOwPBWsUpkoKP0kmTHKu3w3UjUmrkiryi7Amjdy6SWYEO/u/ie2bFS56ELclevSP
	YY8lKbg12qFsqr1xO0Dc8qn+XpMe72y/pl
X-Received: by 2002:a17:903:f8b:b0:2ca:a284:a136 with SMTP id d9443c01a7336-2ce9f1608e4mr33187265ad.42.1783780996395;
        Sat, 11 Jul 2026 07:43:16 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a55:d1c4:9324:e872:b3bd:74cf:7935])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm75661525ad.39.2026.07.11.07.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 07:43:16 -0700 (PDT)
From: Yuhong Cheng <ceohunk@gmail.com>
To: castet.matthieu@free.fr,
	stf_xl@wp.pl
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuhong Cheng <ceohunk@gmail.com>,
	syzbot+123456@syzkaller.appspotmail.com
Subject: [PATCH] usb: atm: ueagle-atm: fix use-after-free in uea_upload_pre_firmware
Date: Sat, 11 Jul 2026 22:42:59 +0800
Message-ID: <20260711144259.1124-1-ceohunk@gmail.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a slab-use-after-free read in uea_upload_pre_firmware. This is because the usb_device is passed as context to request_firmware_nowait but its reference count is not incremented. Thus, if the USB device is disconnected before the firmware load completes, the callback accesses a freed usb_device.

Fix this by taking a reference with usb_get_dev() before calling request_firmware_nowait() and releasing it with usb_put_dev() in the completion callback or if the request fails to start.

Reported-by: syzbot+123456@syzkaller.appspotmail.com
---
 drivers/usb/atm/ueagle-atm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index d610cdcef..eaf2f2d3a 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -663,6 +663,7 @@ static void uea_upload_pre_firmware(const struct firmware *fw_entry,
 	uea_err(usb, "firmware is corrupted\n");
 err:
 	release_firmware(fw_entry);
+	usb_put_dev(usb);
 }
 
 /*
@@ -693,13 +694,16 @@ static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
 		break;
 	}
 
+	usb_get_dev(usb);
 	ret = request_firmware_nowait(THIS_MODULE, 1, fw_name, &usb->dev,
 					GFP_KERNEL, usb,
 					uea_upload_pre_firmware);
-	if (ret)
+	if (ret) {
 		uea_err(usb, "firmware %s is not available\n", fw_name);
-	else
+		usb_put_dev(usb);
+	} else {
 		uea_info(usb, "loading firmware %s\n", fw_name);
+	}
 
 	return ret;
 }
-- 
2.46.0.windows.1

