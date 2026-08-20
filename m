Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066183AE191
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 06:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205930; cv=none; b=FwdlnvTN6a3RxapLKY9yj8HcW6FRwtYJQ3fDTzsoqJyhXm4boXwUGBNiccVnNQMs+XbzM4Hdq/SSSptPTByCgrydevy3KeBytpRjNnjIiuvWuFbzgtYNKXJrvD6686NcjnkwVBb0MT3FqWG1jvUqGj0fguKTAqcWtp4lmcQEatQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205930; c=relaxed/simple;
	bh=eYK1djFVTbyqKFaZU9HtFwqYRLhPnK5ncij6Xl1RjbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qkheaK5EdY7wn1yE92hkBCGLcQV4IlUzNywJK3sLHadFuZBrAPUjAZ+SSiincJLuRZkL8OnNv2zZUQRmTdJyXXkmFOTJyRKWLw1MRHT+zGfNad3KDTRPKiw1KPfh3WKuZ8oOw5VhlcDO+63Pbd/H+B8bk8pNcYxEkq7cWi3U9yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbYdsK8S; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbYdsK8S"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so2876326a91.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 23:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787205928; x=1787810728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EGmjeRO6ukc1KjTPIP5eSBiXKh14r6c1DZEAoUG4O8=;
        b=YbYdsK8S9KY+FiqanagLfMl4ZwEvVWVAbFFNMTVD4T8lv8iWph+ilD0nEAOJ0346Th
         WBNRYVWZZIMhDhWjQjU17Xw3/4ZzPrAvTPa6ESBFLOyKz48aeg/latjXMTjgC0cWSDnH
         zWgX7dH9CiK+/8B+Uz3LoHCxzj2FQpP4uGzbe46ERxjmgqKqkXrPegbGXZ6sowcZSiBb
         zroUccGw6pUYOeHLlx2OnFG7LRM2AfezTQFnaF3n534ayf9JP/uGqz26d9LIqai5Olup
         fmNwN07SPW9I6UINvw1a6Tt4q/NOT5TsJXEUus9YS3VbCD3Ll0rf28EfQmmWRRhUcrqU
         FQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787205928; x=1787810728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2EGmjeRO6ukc1KjTPIP5eSBiXKh14r6c1DZEAoUG4O8=;
        b=rPqDKKg7u9SkC841jZzDLLf+fe2oB7fGrWw2O5cR2qQRzCq1HTMndCHtpV7MbB1YG0
         s7ovNEHiWXIcx6SHyqE+TVWVBrGkcwp4/S7wYQtTE5ndgos1sIe9TSbnSbpVuIFcpymp
         QytChABBiQYI1ahCvq8FfI5nLcaXvzU4zwk63tLtJ4ZAop9pV24X2MrXWj7eXc5Cca7X
         t1KpAczdsZMwoDwlijx0QJfOBBxvDG64iAKYEBxdrmqgGWOxcn+pnW2nbl0ExwfgInJ/
         W+b4wKOl9zEAjEbyIxJeyzdOqcwFnhdLRiIaLxJfcHQBZDs9EWJ7bdAeDtWYHeDgY8r6
         5Kng==
X-Forwarded-Encrypted: i=1; AHgh+RpTdnBSKMXEgvKAmOqUyjUgHx3GG+eNyUCKva5O0q5v24iwEpjDLTb0xGTjDkAZZyXkyc7chc3r+nM=@vger.kernel.org
X-Gm-Message-State: AFuF++mvlyu3l3TuMRd1USRkb8nnsMNOmPZHLOIvgVScE5eL9USXvgZW
	+90b0gNUwDRcZsMTeREsqlOLiwggfBKxwOIIHniXdlOAKnUo5FPIwwIb
X-Gm-Gg: AR+sD11wUkumIdZd50ErLDWkS0iYHV79M5Q3rLC7H9DKqzkRcWZ3vJ3PV2r+h3eFQOF
	k2dzEXocDwa2mTuXaJlS0hA4P2Bn6VNTlbGZvqYuWYXaXcMrlrlmiN2+U6GiJPvad2btZPFLMpk
	xKsMIpT3QGWDAzOApFeLwGPSYpMNzjyu+cgOeGLjZgccjY0VuN256da73Ro5bYXx8klB5hzDqTe
	zR4Uc43IMkLHlTBEs0yi3Gt4DECdr+VaQPjd2Ano/JXiJ9h+PvcC56zbL+cA0kjVx5+FK5oqCBI
	iuO2tFTGCnX4zyC35XfwbKlhwFMAZEyE/Y+Ujj18IBcS/vsoLjULrEvwYv7wEx06f5HfEeCsHkU
	A6TXwwZXL7ilCRj0R08iVPImCdwFZoXO5dfeVp7N5XnY+ny93IyS6+AvkYRKDQFs1mqUI1DzyRi
	z9N/feeM9uIbxr+V14E0j7QWs4eeeqXK4lvDRQ1zGgdg1JEAaVF5/ZyXM7AayN1KPio5oCxsEDL
	eCxi0bpDlOJPDdJ8wM=
X-Received: by 2002:a17:90a:e7cb:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39580aa5106mr19132702a91.5.1787205928192;
        Wed, 19 Aug 2026 23:05:28 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm13274417eec.24.2026.08.19.23.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:05:27 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Subject: [PATCH v2] driver core: avoid klist_remove() on unattached knode_driver
Date: Thu, 20 Aug 2026 14:05:23 +0800
Message-Id: <20260820060523.55087-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820055502.49963-1-khiemtranzo532001@gmail.com>
References: <20260820055502.49963-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_driver_claim_interface() sets dev->driver directly and skips
device_bind_driver() when the interface is not yet registered, so the
device can reach teardown with dev->driver set but knode_driver never
added to the driver's klist_devices. __device_release_driver() then
unconditionally calls klist_remove() on the unattached node, which
dereferences a NULL klist pointer in klist_put() and crashes.

Only remove the node if the device is actually bound, mirroring the
check device_is_bound() already provides for the driver core. This
matches the existing guard on knode_bus in bus_remove_device().

Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
 drivers/base/dd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223..4154b4499 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1354,7 +1354,8 @@ static void __device_release_driver(struct device *dev, struct device *parent)
 		device_unbind_cleanup(dev);
 		device_links_driver_cleanup(dev);
 
-		klist_remove(&dev->p->knode_driver);
+		if (device_is_bound(dev))
+			klist_remove(&dev->p->knode_driver);
 		device_pm_check_callbacks(dev);
 
 		bus_notify(dev, BUS_NOTIFY_UNBOUND_DRIVER);
-- 
2.34.1

