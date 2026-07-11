Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C8228136F
	for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783781375; cv=none; b=c0oXYK5eFnefti4uC4VP5Qul+zUf8UYmo2EZzBd5sWduCWHfo3yk2fDDB4S6K5bW8r0sefv8mreTkHxjBBZd/NST/eN1XqIl11VfRMgjQP65cu9LnhkcFsY5l+Sjj3rCTeGHipHwusG3JLO0hyxvHLd2iCxqPxy0BTt77ZYctc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783781375; c=relaxed/simple;
	bh=fm0yQ7z4cnq8Psghzyj7Wh2yTahtrMVPopS+qH6d5fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3Xt2BEfkN+pDI8CDJIcDNtUM4Me4lylELuqNEFC99SF0FMe3Mqz0ONx2f34IsGIcWddJ0eGrqOf2U2qeCwl4KxdUzXmpzuRi7R11uElGQBmPYHPU20SYa6RJCpY7uCKMxd40NuzdT7tzomzLteDy/62GgNnRJzVuxk4Jesi9FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtQR2QiL; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtQR2QiL"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cae1a3a744so12388345ad.3
        for <linux-usb@vger.kernel.org>; Sat, 11 Jul 2026 07:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783781373; x=1784386173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8dbFaTe/STEdFp6CIG1R/5lJi6txXpb8oJ97mPl3Po=;
        b=FtQR2QiLg2lkrLahVnpplmZttMLrN5PNdTxazbiyHPTfWwxsyrfR/3OvUvgBjiozGp
         Mnn2mTXmBwMcU3NHwnuPPdozVpTiM2TTaUlVYgWavhsDtvSojPwTad8RNTk6MB/Z/jbk
         9QyZbP/EJYh6DTtQbXJZrcKy1MGaYbSY5blO6k9dabtu30q3ej/1kmX2ewBBA1xvLjBI
         q426BlZjd/tiQGRYmDMKNjBUDIRQOLtub4OdaLzlkq1MPez8e5J44YRstPHgF5sITb5K
         ve56wicjVPAfDGh7mX8DwZx1PdtSxjbLjUqk2JwUJF1Y2Gd9CDMbJMe8jN9YjjoQ5xVD
         3iQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783781373; x=1784386173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8dbFaTe/STEdFp6CIG1R/5lJi6txXpb8oJ97mPl3Po=;
        b=Pr/wmhtiqqJIoN30SvigtcEMaLQB6garZTTEiDQIsry0ZLR2FcnYtTQfRRX5HVpjXN
         gUKj4dYgt4seD1VN5D7dlKFVIp0SKFIRmZwcYgMdVb4SgC7of75pnt+JOX3aofD0ni5L
         zr0zU0ujsZHSERJ7XrLNcmTQihFrD22GNIJus4p/9tKqksjYQ6ndZVRNtDyEHup4Grol
         NrNdbm1M6gKzDocLON0Qsz3YHUOsgWfy6aPRUkoPMcQHjGe0p1d1ZzwN1hM7iQ7jhfLc
         26zL1p5jE3BoK1pslvmsC1SOhkrIJowxjwYrDOSLpJx6VtFenUOeO5dFosOTpAE0yo26
         k87A==
X-Gm-Message-State: AOJu0YzA+6GPRVE5t1oD0jzzHTu31sftvlxSsL1CznVxYs8L44AXiXIQ
	RkqAp5lY+2RLmF51ERCwENH687Su/IuncFYcwMufmC+zR8sbP1jrlbqs
X-Gm-Gg: AfdE7cnd+5n9Ida7oUnyfl9HHKtrCEfKF6aGPF6HghP3wzfPVWMSNAl/tBGFdDTI7t0
	SSxPLccWFFHkvMt4qrdhZeSAEQQVrGmOpG0z1X5HbTxqNGMecrxZbx9RxwkRD6dCeVrA1bjpw9c
	CR//ZzZ/JfbyNE11J5oKYCW0hjgsPuzo/3Xv5jHXkiHiL9dSs4ZROT8hmh5jgQnOz8PlYL7JdpB
	t7rzroXDgliE0xC+ZR+iLKo2aBRcvCiGer2YVjJQHYz8PZXtECD+O4CmSn/YB0lIf1Dwko5MF4/
	z3Qg6yLa737AywVPcttwFZ5mX5zhpKvRkFVBMtQByB2QlqQSaFrESFF3Zw2gdUrQQCWja+UG3Cw
	JS+6kUPEjTWQS7MfCBpO7oVtzyVaPUJ8nrFMsEGXuWb/HOjxjnE7PJgvNmb7A4AP9K4hNfVFJIC
	ljVxlXeAR6a/x6j7G2yPxVuOGh2edsQHRB
X-Received: by 2002:a17:902:e785:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2ce9e7941c5mr33965035ad.4.1783781373215;
        Sat, 11 Jul 2026 07:49:33 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a55:d1c4:9324:e872:b3bd:74cf:7935])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm73632475ad.53.2026.07.11.07.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 07:49:32 -0700 (PDT)
From: Yuhong Cheng <ceohunk@gmail.com>
To: castet.matthieu@free.fr,
	stf_xl@wp.pl
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuhong Cheng <ceohunk@gmail.com>,
	syzbot+3d45d763d18796f97412@syzkaller.appspotmail.com
Subject: [PATCH] usb: atm: ueagle-atm: fix use-after-free in uea_upload_pre_firmware
Date: Sat, 11 Jul 2026 22:49:18 +0800
Message-ID: <20260711144918.402-1-ceohunk@gmail.com>
X-Mailer: git-send-email 2.46.0.windows.1
In-Reply-To: <6a42df07.854d4ab9.360e1d.000d.GAE@google.com>
References: <6a42df07.854d4ab9.360e1d.000d.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a slab-use-after-free read in uea_upload_pre_firmware. This is because the usb_device is passed as context to request_firmware_nowait but its reference count is not incremented. Thus, if the USB device is disconnected before the firmware load completes, the callback accesses a freed usb_device.

Fix this by taking a reference with usb_get_dev() before calling request_firmware_nowait() and releasing it with usb_put_dev() in the completion callback or if the request fails to start.

Reported-by: syzbot+3d45d763d18796f97412@syzkaller.appspotmail.com
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

