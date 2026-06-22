Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB03546D7
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132655; cv=none; b=WelOrQqakWlKy+nBKTVrUlGXwZG43HDHK6q/SQrOYzBje98MtfWtme3S5wgSuoL/mUT5pIM8ib9aCcjGV/H0sOcT8rsZdqXB9DbiYNrEWC/FdKz5CtzvkXgoVHqCq02B9pcUOdlj1UtAdYzbxqb7ZJ3Fz+yhooqNocPJH+TLf5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132655; c=relaxed/simple;
	bh=bHzHEipgVoyBRyX2ynPaWW+ImLplX3HM2h/iS7yIDMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XcnftL4qSgRgW99RPVY1K6iioSSbp98kLD8Q0CZIo4LKF1iNa35pwe6775LT7pBw77h3lSJxfuq3qc8Jw+SmIsXDYmW3f8chg9uLkRb7TJ6sPjqhSYjBXtwcNxnBlxrIDjvb9liV+p3U6C84KWB/UUnXq17VFvWI/0a7hTv7NZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PL3HFLXs; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PL3HFLXs"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so3375522f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782132652; x=1782737452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VLLr5EyOH8gGg6bkLYFw5CLPo8V5jKDBCqSICrOTJIw=;
        b=PL3HFLXs9sRzM4NPA5xEAGHOwn69MCOagQZh1EgXRXwhl5gbogS4aTlbRlTUuIp2Ek
         xho1lI/ETGwpJxyROfALcU7hwbNkEADA7xOohXsFA2/RlcQ5d9aoBOUuRfosgY+2WZdq
         QObN4p4Kn16q4Noxm8F9cX2WwuAC74MVyQdoBkOV6/fc4/SSosazVXrtxodBeENRN2ym
         0h4vm4n0cy4a23Rrja+4GxwYtuK0y+UcbogazvsMBzRCNCOHvYtA8KhY+7FX5aEsorOG
         4dOPnjbrj3Ozl/sy9ZHI+CqC3GwrAMwYre7raMq+P/ljNsUoVqNnyfGyxqv3i5rfltU4
         4ElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782132652; x=1782737452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLLr5EyOH8gGg6bkLYFw5CLPo8V5jKDBCqSICrOTJIw=;
        b=O2Hg6U3FCAbBAZBN/tP+n1Mpo4WnWrK2rdNuLsXbpDdm8rdCmBWltrS3PHR6LiUCJJ
         bD9RDXgY6GXWGZsre/cLszKKPWz22/Tfh9Kux/Sxkeuf0A17fB8Unavymmh3+YnpUbH4
         2UxT29KY8xE6RhkRAG8CXxXDTJf0X069MiDDYaaaQV7kK+G4MNythQC6O2vvy80PEQaE
         /oCwvs6CyXVFpeChxl3xcFlHcmCEBhA7NGmO03TaN/oBBaNY2zTeFI2nQEFCuhxJsD/s
         g15UJG51ffyzrmdkw1aLrS3J1k5tceY5sJCKfu8FW4dCZ5p0zqVzLaFoB+E0bFpYEt2K
         xTKA==
X-Gm-Message-State: AOJu0YxTBB09/+koIr8V1LvkPiDoNQMTyFob8WTzKQqLIWWyXFJM7x10
	M5fNxHY8OqBeVzrL7r+4AU4rVwK23HIK9+VZ88dvbQ3is8VAolZCuvMa
X-Gm-Gg: AfdE7cmkYZCUe/DIMQ4JP/OGpd57gCKGq6K19ktWLQOVEqc11vfQPd4QAaW3Ucz0adx
	ZWM8wYTUYGUMmnmHzc7pXB3xB3WcXrTQ4KyF0bonWEfbsqLdq3On2eYqC11OCFs4SDCIyYKcLuP
	tm4pYFcMHixkTO1KWQTY4eAQdCejgIR62XtLA3PmDj3WYtngwI1ZRP/qYOgEIebujmOB8pPmL0A
	nvMOCYb67XGF0tcVOyKCcT3a+i5CUXwMhU6s7TBuQqXMgqJHsTiLtCv+/KuBYNDuS08Yh8iQ24/
	rRn10R3oQ52PqZLZgjhYs7vPuowEkWS0VydgbIt40lxsoe4kTbOlbreLwwW/HRtjkFizO6TVrts
	2UAx9uv6Y/LWWGtYVzlpqg7CsdoDO09QeK8KzjBjILwyVnFoT+hi3emeOXg1O1YSVJdYCFbuH5k
	AMKz2umq6vgR/xYfLbuJ23Cn+uAE6CRbp+TvjmzZKtB8cnwK8CZPRh50W/iEphhTviy2p927BR
X-Received: by 2002:adf:e010:0:10b0:468:e22c:3f1d with SMTP id ffacd0b85a97d-468e22c7d10mr5539669f8f.17.1782132651942;
        Mon, 22 Jun 2026 05:50:51 -0700 (PDT)
Received: from 192.168.1.39 ([196.92.41.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm25305714f8f.33.2026.06.22.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 05:50:51 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] usb: misc: usbsevseg: replace deprecated simple_strtoul with kstrtouint
Date: Mon, 22 Jun 2026 13:50:45 +0100
Message-ID: <20260622125045.2398164-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

simple_strtoul() is deprecated. kstrtouint() actually tells you when
the input is garbage instead of silently accepting zero.

Fixes 3 sysfs store paths (powered, mode_msb, mode_lsb) from one
macro expansion.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/usb/misc/usbsevseg.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usbsevseg.c b/drivers/usb/misc/usbsevseg.c
index 89d25fcef642..2c08d8ee7d86 100644
--- a/drivers/usb/misc/usbsevseg.c
+++ b/drivers/usb/misc/usbsevseg.c
@@ -154,7 +154,13 @@ static ssize_t name##_store(struct device *dev,			\
 	struct usb_interface *intf = to_usb_interface(dev);	\
 	struct usb_sevsegdev *mydev = usb_get_intfdata(intf);	\
 								\
-	mydev->name = simple_strtoul(buf, NULL, 10);		\
+	unsigned int val;						\
+	int ret;							\
+								\
+	ret = kstrtouint(buf, 10, &val);			\
+	if (ret < 0)						\
+		return ret;						\
+	mydev->name = val;						\
 	update_fcn(mydev); 					\
 								\
 	return count;						\
-- 
2.54.0

