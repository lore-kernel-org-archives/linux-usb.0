Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2793B8BDA
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477034; cv=none; b=OaglycYXe8+VzLillIZV3Jl4248yMhQkdv0jtZf5dxLa4KEsYyTzdmgz75v+BKY5Ij3SEbLXm0Ni7DV9GV2gXZmqFUyOvshv46DDGDZGHpsjl1FQwyhM/7fbyjykPvrSC0YcAjrEihOHm1Yzvc4oCfrwWA/aBm4A/OkoowEC4MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477034; c=relaxed/simple;
	bh=oqb8nvlmmS3V1q8DiP4hXJCF9W9ruyOD2JpBI6MRZaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=brZWhnw4Jaxb4h009gkx5Y/K8QhZ4TU0HVlUG27/7UBDEFp/IOGfq/OgbAwFAbKJ7Uzlj7uTIYC0RtgQwuFk1jyS/vjiuGZJezxFtVbzGVV9FbMRsnkEKfDElVbfYIjek5J+eeAvRfzypWuHWcFi3dPEQcFRl5q2UQWM2tYM9ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U18zBuLn; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U18zBuLn"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so1401483241.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789477032; x=1790081832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L1JcDlshcJnjTO9t6bNJvx2l7c6AJb/4TmbKI6h+KKo=;
        b=U18zBuLn5Rbn7oZ6ar0E/kAW8p9VpgPj7hxgxSxntVl8HqDoLbUDHYZDIvwxUyW6z6
         1M6WQQsYViajEf/NayrzSSACOEMWDqSoDx5UuYVm5JEwQrc5xHIBNdHwlA9ceIoDieLa
         fbcV6QN3VL2jA/8bYp+FGrAeNtz7ujjTO/wvbQ1Kn5t7ROCEbSAbvp/MgnaSy81wmRh4
         jotEnw1UOJaMmketpKW4uM4nBbpD6QIeWErZ47YC3+msAgW3lp1CgmK1huM+dkDDfLAj
         Ufvn7GiSxw++BKBKtmcfYqwJtLfrNmbf2EZcOafLBNxi5vfgul0kHrxt+L7wxyWqNx3U
         CikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477032; x=1790081832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1JcDlshcJnjTO9t6bNJvx2l7c6AJb/4TmbKI6h+KKo=;
        b=sQ79mDr9SA/HBuHOxeis/Hdw7koQhkhT/5rfK29cLRFmiauQoPcJEuj9269URYzq2u
         17hUoz6fsUCAWTKtuTQZORcIlMLe4zI2FF2cTTD3Utcv/C4avzaJ+xP9Ynb7DeMvGMsW
         Jcox9JKCi7pid9XFNa16AhaYK/9LAVTNJJr+TQMJe7aQCDFapAtMYmnb0XTs0L/J3nHl
         2ZLpQw2j6r1TqGOllqV6w4yRVDiZXi986OoJ/3mTcUdAMSUZPh1YY+RaA1QHKuTCf/X/
         3WcJrUGUVhONeukcJP+Qo9shdpnhR4YBQxVJan1imeCa13iiz/pb2qlk0Y0RH8ssxU6P
         RFcw==
X-Gm-Message-State: AFuF++mHtBRt3293ZoUtjwmn5VIHEyboYN+BkJymxj+zhDz0ktK0Hz6t
	u7URhIkZw0LEXGdW+Vf+7I2TKaWg9W3VYYQP/VP33rix+zX8eh4aSM0H
X-Gm-Gg: AYBFou0FrzCZh1NCZkDX0T8QDMQBK+1gPY1PzLsxUaaKDOuRxj4br62U1ZoegT/63wF
	pA0SeqqmmmvL0OJqnfrjOW8jJfqIJbzbeD5DvkqfzZ4SZHLQt+Zfwhlh/wYw67lPSyOR2+oopnm
	EF1bzzQJVKV1QMAp9NWekvSVYPfNH2NoyrFIesiE+hgfiKTAgKG4x4zK/4qkGxFPghW0D66UBLJ
	Jkze5myV/UEknhWwOQSEo5pPpCBMYcY2ksmivYEKy0O8YM8KdEqPtIgxq73E4DubmgFLnnUqFUp
	eZoYeERVLYbjT5/Owh3D/NB9op8vDq+Gacgem5IjLe3edHeDVTyrqPUAhTNDu4SzQkvHDXGnAyL
	TsasmzUNNDld6/94MLl0puV45w/tOp/WKtcp2SPL0LUfmmf5Tbr+Lfxq8PZAhfKmMvdx8EZV+Al
	jsBCcVuHibRnWUMEtDUSp3oXlWAyKYaLlnyLJht87zhcL7/2CEAChu84Wd6orRMIxU
X-Received: by 2002:a05:6102:d89:b0:79a:62cf:2a50 with SMTP id ada2fe7eead31-79b58495f25mr7239387137.7.1789477032124;
        Tue, 15 Sep 2026 05:57:12 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf149sm13113951137.4.2026.09.15.05.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:57:11 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] usb: gadget: f_printer: use the active RX list in soft reset
Date: Tue, 15 Sep 2026 09:56:57 -0300
Message-ID: <20260915125657.2849779-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

printer_soft_reset() tests rx_reqs_active in its second draining loop but
retrieves the next entry from rx_buffers. If rx_reqs_active is non-empty
after endpoint shutdown, this operates on the wrong list and never removes
the active entry, leading to list corruption and a non-terminating loop.

Retrieve the request from the list named by the loop condition.

Fixes: 25a010c8c1a5 ("USB: add Printer Gadget Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 drivers/usb/gadget/function/f_printer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 1857d78611..e3dc5d810a 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -940,8 +940,8 @@ static void printer_soft_reset(struct printer_dev *dev)
 	}
 
 	while (likely(!(list_empty(&dev->rx_reqs_active)))) {
-		req = container_of(dev->rx_buffers.next, struct usb_request,
-				list);
+		req = list_first_entry(&dev->rx_reqs_active,
+				       struct usb_request, list);
 		list_del_init(&req->list);
 		list_add(&req->list, &dev->rx_reqs);
 	}
-- 
2.43.0

