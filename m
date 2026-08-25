Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB84D1531C8
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787678046; cv=none; b=V7siuRXtaZNHk3OSPy5r5dXWBK+1G3GATjBMENTp7+ruk5oBb9d4HYdpvlvICsNNBGIdqJcl4pB4DDKlkxHR/iAHP8IDTzc/OUe6A3gf1SUYQIYRXF2/UhvfatkO+KGgmWGEKPaCByWiqDKE35TgKSbL2cUh/+FF/0db6PG7d2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787678046; c=relaxed/simple;
	bh=OpUMRyvqO2TDh2Ehviw+eNrQLEvp9w5X8kjywsJwnKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzdPMRJK13Q2jQG/vhxNv37/C1ytdZjGNqKbuPPDu+193QB7CaqU+n3187nQGgUUgyNm0KRQs/Exsr+YCi5kFbD2jm5H+ldwDpRs2kGaDQHQT8+2G5Ti3nW8O1OoR7NdonOlcHYiq4xo/PaYV9yz7V5kuGsCNtltJ2CAu58ulb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kbmr7+V5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kbmr7+V5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8487214ad2bso113289b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 10:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787678044; x=1788282844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zoBAAmieSvGKn/+PaDydAv9C08pg8BuNAhdnqlHhZz4=;
        b=Kbmr7+V5uPLxviMFdv6Pczrh+v/Tl8QWZC3mfX3fc7+QTpL3cYzbSgyQjm4MaEtMdU
         ulVXYQ3XF00guvsbuz8EXG2pbjqLV9rNfUBY4JfK1qzWCnfzN+njoz1BhsPxNMKgvRn2
         dnqOJFdTGGLsVXhqMU9p/9uuY/OJ0xvI9t3vNwEi8roT2IJe1IUudTsqt4+lVXOwUOyQ
         69j4yV9JrJTRUvJB0/TFpS296S3nIH3R32f4dGVWwEfymLj62sG4e46e78jJvzot/Pi/
         wNhLEdmtBtFbRhV5ib6uZ9tRIJcEqoSwPTvGAkes6SMkCmOqPbl7yTnst42a7SZchqWT
         bYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787678044; x=1788282844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zoBAAmieSvGKn/+PaDydAv9C08pg8BuNAhdnqlHhZz4=;
        b=qU/ICnn71HInH/YfS1y7kU85dh5iMWfiR4x6OpI0qXwB/etbPYD8burrvIwSot2oo/
         NkI4fR2FLsZFOvNA64EU3RfiqJ9/8ERWkEF1eV2WhytMpWV6HjxGqMdoOWDDGl6mo1oc
         UDBtgA+QlOEUGLmV+3C/szjMaY4ARHvmj+4CrgHqGn5KU5ZAhI1ac/3zu+VjZlV4k9Hl
         axuD7sVD1t7+sF+4TDAqLj82m/CQt0zkV+fWfoPRIH77CsCJaXSVm+whH5i6q0JRWrzp
         g3e6snU8cXUo0SLd2ZpK7klOoyeg4SUG4RXNCk9ycQdhYJEItf+4l9fVjKTAVn64jbyw
         hPqg==
X-Forwarded-Encrypted: i=1; AHgh+RqeQodwZxOSpgEUfq25Vg7PbrGfqnyYmmgv9vmoPQ/6p/I+fgHA/c8XrEk9/wb0E/XldVvHEKRA08g=@vger.kernel.org
X-Gm-Message-State: AFuF++kTWxIFbMzja8x5H2fzUZw+Qtjzgxh1Scui52tIv1c2/eLsd7DI
	RH2MK1rZmuu7rhWXj+hMqQ3dShzvsz/ng8CTlkyDvaFNV/X/r700EKw8
X-Gm-Gg: AR+sD11RdPYy6C4GMCj5Y76/US+f3VMxNO1i5tSI9wQoHlJTaru6tHOZStrO5UaJ0V5
	P5RbTYG13DhJh7Lm2U/u96fp4LWPebBZebSPB9180vsdg1DMCSk70ut8yWH8WYVvO/PA9pUVKDV
	68S6SaStzRREeEF0Kf9roD1pILZsUmvoEk9uz970VQJLUZB4xgQOgynoK176JL/F7YSpExCVjHM
	9DkP3cBhXvvHsFXGDs28/aYmgDI8nH1Yn7G5SKh8BdsdbeAF/1bqDfc2QJ5ASICX7Lsoo6nsB9O
	tPwBoo63dglrPmvGo8ZlUHFl1nysmLQ4l7VCMKTp+00de5rK12X3GZ7CHOxzu7SQ2ciEXG6q6Ev
	4gM+2ovI2LhMxWMA51u/mtw53GVwlL6e39/XBjKN309CG8vevnl9+eWsjIGd0q6UJHEGGx9wNrO
	cpa59BNyMyMlRozRbMXfYXHXC2eoo1rrmTaGUiYoIr2h76rk3qjcDeS6sHteZAXI1GWbsx3MTYs
	FRGtWkOyb+rWIpKjkgrSYLjIbNS+0ORFQ==
X-Received: by 2002:a05:6a21:497:b0:3c0:278c:6a31 with SMTP id adf61e73a8af0-3cd9129966bmr18069644637.11.1787678043727;
        Tue, 25 Aug 2026 10:14:03 -0700 (PDT)
Received: from localhost ([2409:40c4:13d:8046:4d30:e4cc:47a7:83a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20095sm664742c88.6.2026.08.25.10.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:14:02 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: stern@rowland.harvard.edu
Cc: jjy600901@snu.ac.kr,
	brauner@kernel.org,
	eulgyukim@snu.ac.kr,
	gregkh@linuxfoundation.org,
	jack@suse.cz,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mjguzik@gmail.com,
	viro@zeniv.linux.org.uk,
	stable@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH v2] USB: gadget: fix NULL pointer dereference in gadget_dev_ioctl()
Date: Tue, 25 Aug 2026 22:43:43 +0530
Message-ID: <20260825171343.459630-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gadget_dev_ioctl() reads dev->gadget before acquiring dev->lock, but
dev->state is checked after acquiring the lock. Therefore a concurrent
bind can change the device state between these operations, which can
leave ioctl with a stale NULL gadget pointer and causing a NULL pointer 
dereference at gadget->ops->ioctl.

Read dev->gadget while holding dev->lock so that the gadget pointer
and device state are sampled consistently.

Cc: stable@vger.kernel.org
Reported-by: Eulgyu Kim <eulgyukim@snu.ac.kr>
Link: https://lore.kernel.org/all/20260824113510.1141236-1-jjy600901@snu.ac.kr/
Reported-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
Link: https://lore.kernel.org/all/20260824113510.1141236-1-jjy600901@snu.ac.kr/
Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
Changes in v2:
- Fix Link tag pointing to wrong bug report.
- Remove the unnecessary NULL check.
- Reword commit message as per Alan's review.

 drivers/usb/gadget/legacy/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
index d87a8ab51510..12819e8c265d 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -1251,10 +1251,11 @@ ep0_poll (struct file *fd, poll_table *wait)
 static long gadget_dev_ioctl (struct file *fd, unsigned code, unsigned long value)
 {
 	struct dev_data		*dev = fd->private_data;
-	struct usb_gadget	*gadget = dev->gadget;
+	struct usb_gadget	*gadget;
 	long ret = -ENOTTY;
 
 	spin_lock_irq(&dev->lock);
+	gadget = dev->gadget;
 	if (dev->state == STATE_DEV_OPENED ||
 			dev->state == STATE_DEV_UNBOUND) {
 		/* Not bound to a UDC */
-- 
2.55.0
