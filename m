Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAF52745E
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785581330; cv=none; b=XA6bU0Iz0bD7h6fhfkQa/c6vKSobzr2DV/5+5SyB0WuG/a8oNbA3nOiu5me5jPeCmGGqQxW6pOTl23ag0Xn28f1/SgbyImBc8U+RxMKc/wxQUtRq7vUaCHSdYbbPPd5puobVaLnGt0NXBpBIXdK2enjOvZjLvC8Idl14joeb7Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785581330; c=relaxed/simple;
	bh=wtDSZ5mp5Wvt1kWFT21QCDzbA3vFoy0pmDjMyVRSB7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZp3i02pvXje3fNhBInj765iSRBcjWlO50OPRxWxTwsY8ZDG7cwTNKIQK8zvL0dxhhvBIjyi1E58951+KsvL2Ur9MPJIQFnMH+eQTbMnnsgQWA+RJJ7yoCZ+SS5tm5ECnqsDTs5Q2KO9pRHXFDpC1goW3xPmwRL7bsufoowgNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRbRMY0z; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRbRMY0z"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1250000f8f.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 03:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785581326; x=1786186126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vGQePxgnH3gJYAYdtUPdhKdx3RT8nxQFNw+xvKDts8Y=;
        b=bRbRMY0zpC3j/1FHVChHum1cFK8Qc8oi1V034LvSW4bCh4d71jYxxnIcUuDuITSuhd
         KiWvmgowWMT92OPCpkbpXf7diC1EnDHRwXLuIJDPShQdY1xTio7nJ6ZJEtWcWE6E65NY
         lwL+9y7kru/6BgcBShKX4R8xi46nhG3wx5gu4095+CvlQDq3sSqn68vrOWHClRHftTSN
         IC3N1PpdpdzNrvDqUm0cOitk462X+TuJ2oRu8tpd5rXf2ZQ9iXpCIijBHUrTkPlaauwd
         ZcoSF5vt+SiDsL/OvWRhMnHBMg/Gv36ai+z/qogoHKOso/39ofHOwJHnaXEDvjIy/lib
         b4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785581326; x=1786186126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGQePxgnH3gJYAYdtUPdhKdx3RT8nxQFNw+xvKDts8Y=;
        b=VcO6dXB5PMnqhwl/aY/cTKaxs+pNcHm10dYW7sicSL/T2zbYuobfAJhtnQyQdJ6CiU
         cjL+A9UQ9w3wh6xYRWGi1IHmsXj8E2PI2Kzltr7MhdGs7ADWxH6tSPkLmY63nXLvSoJS
         t51Hn5xGqni9Z0VhgZMvHTSmBt884xyzXKzIGu/EKDAv0cqOy1x+9KstN8cuaNC7D0Qz
         h3wfsyQ/Km8Yslf1UOTJYgUZgR99MnXzURo8dW1FSeKQg0YckXEyaO2D8MEvvIrYv7qf
         wOxfavMlbk1gcXCkJED8G6BSWwD7uWss3HozncZSLky1Cwa4EZZOtTTZc1Wo0J8vb62Z
         QQkg==
X-Gm-Message-State: AOJu0Yy9A6Kob7X4BghoF7Mx/+8rhNtIx7sBbqF3DjPhn/YrIYO8Rmig
	dG75wyIjZgjZWO5dUkTVqJBSJSaZVp8ypt44c5rvKFUxMUwWhcp3iRVWq8RUj2jm+E7wQA==
X-Gm-Gg: AR+sD10i09oHhrQFJ+RSq6Sl8o1se3Dl3+o9iGc7wuDj8afqWbBRWFsqrw/Su3Ks/G9
	YMEjNyfoypJNqbOYtSsBxeLtw96XBrD+pZrVKHSRa+ChMaK4gQWIjJta78NOCieIlxE2y2LRuuL
	eRuE2aONDTja81pe7rLNG2mDIudUpe+RU0DDVl8+Rl0CdHknuHcsCdAZmvFctn8u9QTG1G65XBm
	zEPUr+calwnDyCpo0mAECbcs1VFNlqTRSSpn7AubgIOh0S4r+SxUqCXhs5goYUlEn7mc8acC9Ui
	ClZlB8WjLpGaQ6fK4h9iYfdaBWb1O9HySaSEhBmcVXhL9CUVosB0NncQRscOOGQUxtvJDtM4UaE
	PnRxAlOiXGkaUxHDkbc/i3Bub5Ef3JpYn5Kn8agwOPmaStNnMcHWY5dj00Y1Qij1wbnRtfag/sH
	oJkLWMNe78gUUDVM+JjkpjeHe7ORt9nO53tCsscv74WfRHayzoNgVebqpz12T7I7OJ2VGowW9U
X-Received: by 2002:a05:6000:230d:b0:47f:6dcb:3737 with SMTP id ffacd0b85a97d-47fd72fa279mr7289305f8f.29.1785581326444;
        Sat, 01 Aug 2026 03:48:46 -0700 (PDT)
Received: from debian.powerhub ([2a0a:ef40:e13:1601:a8d:2d:6c37:dbbd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562667sm15154551f8f.24.2026.08.01.03.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:48:46 -0700 (PDT)
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: [PATCH] usb-storage: Add US_FL_IGNORE_UAS for JMicron JMS581
Date: Sat,  1 Aug 2026 11:47:51 +0100
Message-ID: <20260801104751.277572-1-chris.bainbridge@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling UAS results in a 30-second boot hang when using a JMicron
JMS581 NVMe enclosure (specifically SSK 'SHE-C325 PRO' with a WD PC
SN520 NVMe drive).

Fixes:

[16.603548] Bluetooth: hci0: Device booted in 26690 usecs
[46.617796] sd 0:0:0:0: [sda] tag#28 uas_eh_abort_handler 0 uas-tag 14 inflight: CMD IN
[46.617859] sd 0:0:0:0: [sda] tag#28 CDB: Read(10) 28 00 0d 28 fe 10 00 00 20 00

Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
---
 drivers/usb/storage/unusual_devs.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
index ac22fa318734..26f3a5809712 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -2184,6 +2184,13 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_BROKEN_FUA),
 
+/* JMicron JMS581 / SSK 'SHE-C325 PRO' NVMe enclosure */
+UNUSUAL_DEV(0x152d, 0x581d, 0x0000, 0x9999,
+		"JMicron",
+		"JMS581 NVMe enclosure",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /*
  * Reported by Alexandre Oliva <oliva@lsd.ic.unicamp.br>
  * JMicron responds to USN and several other SCSI ioctls with a
-- 
2.47.3

