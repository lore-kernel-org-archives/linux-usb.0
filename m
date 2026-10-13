Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042F503BDF
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897645; cv=none; b=j+mpGeWowJUAQOyAw6sTOWsvjfHkYh4ZudI6mvelHJ1PznKQAeYEh1Dp6Ldu8HIxdL32TANuZhai3XGJujN/H6LBhXzeA28wnYaxnlQzhAzaPQiK39yBDz5Biv4XU7fOow0spJO0pQThKaH1mNiNvpZllFDIFrTUHpIdtvybNMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897645; c=relaxed/simple;
	bh=1b7RjkHu1NHryYwqfJSYjFf+f+PvPogAP5ONubhaPv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sD3Me+ubPBkzbaGIQ3qbeAZpRAJ67sv1tRT+P5pbmi2+agy+dvCR04jhEEjG2SCnw00eAK87QJgdaAb/IdXMSM9DG5/NCtzkoKniJmFV2oj4K7H+NEdXKJds2GtqOITxyg55S17tqHuujuQuy3wCgRsbZCVWxiRhgeHhkSXdrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dK3JLAhe; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dK3JLAhe"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1109583a12.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897644; x=1792502444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oucrOI+RjDzXO+WWFDlUFwxllDCPTfTMpJAlcrSAe9s=;
        b=dK3JLAhe3FbYnUYWkcAYJfGuA8qqXpZnayFFL1ZwCK3vdjbr85qXQv8s/CkuC9Qc+h
         fI2VxjLfyannDI0NJ4IFB7WcZwdD8iBFAnZsszju8E1ZMvwZOpIJQ2oDyWUV3R9X/zSK
         E5lHu1Eo6rC37v9p6CfQFqPjJYtjztKA06zakg9J3r29f6KGSo73V5x0ijhaHRZtqcsr
         E1Gvr477N7P+JxBEWpD99VnrkJvejHmRZu6/4Fy3U9w+uGAgKUYzgMjXED0aIjookZS5
         OWRcaakCJF08NXnj1+HSH1YWEswnvqhfVwFfNncOgc4yBgzl6um+PKLYwiRItYnYIgm2
         BUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897644; x=1792502444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oucrOI+RjDzXO+WWFDlUFwxllDCPTfTMpJAlcrSAe9s=;
        b=yK4+gy3DvcpC+qH8u4xZj2LPRHy048FF8gxQ4paMi94wTtOffOXIYYHJEm28AaulOS
         MlTW6Air9A9kIAojfNVQmXtUBKriUYTLWzmI9FLqxmIrIciWESAHODXQzkdIPh9bSTh4
         Ho7zM8SU8OKSpt/E3UqXQdhFQndDGq//4FfrXFWIgaHoR2vD4KtqH2iFdWf3P7Seoiq8
         XxSUeNs9l1ntqRxYpG+7vgQCz6TCAzXtiTMvIN1dsiku7V38Y9u+EkGlsz/nQQ/Vw+Py
         en3dvXsYaqRCfxJ/FLLcDIKg087+aZIKkXYV3kjNtSMyV2+pqNmQ7ZxvOL5uN8Hw/U93
         eEzg==
X-Forwarded-Encrypted: i=1; AKwUvByvni2qw/ZFjPS+vF7cjHCAlGYQdXr3cb2d9kvzd2qjzRgslr9TIB1NXgN65Wgx67SAp9QViHl/1Xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp5UdsmjyH/E07sOH5RKVz1+dPHdz7viD4pIUQvY7y16fG6Z++
	dvEzs+3pbPHO4AcNNRRbcNS6pXuSA95683JSZ/+2UnGTWwuqU3LAPXCN
X-Gm-Gg: AYBFou3bn5tj61krEk9H4kirXR1UAm6/uIs+Qnxai6W+TBCB7kwCFqvv3tmKp4usYs8
	OTXUvKZNdixHTtaGAgiV0e9awdc3ly3sukMN0jnfdMDzNd5yhNr4vvATwDbWHFxwXVXDil+nWeC
	Ai9MfjOq+khkRnuKvbAjVFLtXuWAJLJpiZzfQdqvGxs2Dr+TQ09VZ4EugsvPOJB6k5CvkFdHZte
	VICGLnYAFgh1xHR7yCrg4KX21fliUY08liWruEuL5vEct6BOTuFmvGu1cTTydPW4vYTBZDl3MxB
	59zQR+cIAEcCz0FesaTl3HV2qFBNYt7Qa2tcSGz85AjvWxKioG7+STYOOJOK7ULlSoT+yYfttn1
	4dlmf/jZSDI+xLc0yzXPhmWyfL9Qq+k0fC4cinhpezaRJWR2sPd/tQWyo3pHSMF968af9CT3NwT
	RKHhQgJArDxzVkTmU01EpqbhqZP4IQBh+ZuYYPNqKRX0ll1aiGneJx6qoz6nw2hQsp1PIkbXfrT
	VvSegNOhOGTYnitNAslT4yiWnHQm8o=
X-Received: by 2002:a05:6a21:a02:b0:3e0:eae8:7525 with SMTP id adf61e73a8af0-3e16bf147bfmr10340143637.64.1791897643702;
        Tue, 13 Oct 2026 06:20:43 -0700 (PDT)
Received: from LAPTOP-GHDOQM75.localdomain ([112.151.126.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3cca5a6sm4938316b3a.31.2026.10.13.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:20:43 -0700 (PDT)
From: Lee Yongjun <jun85566@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: digidietze@draisberghof.de,
	xiehongyu1@kylinos.cn,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com,
	Lee Yongjun <jun85566@gmail.com>
Subject: [PATCH] usb-storage: option_ms: bound probe-time bulk transfers
Date: Tue, 13 Oct 2026 22:20:33 +0900
Message-ID: <20261013132033.4352-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Option device initialization path issues bulk transfers
without a timeout. If a device does not complete a transfer,
the USB hub worker can remain blocked while holding the device
mutex, causing usb_device_read() to hang.

Use the timeout-aware bulk transfer helper for the transfers
in option_inquiry() and option_rezero(). This bounds the wait
for each probe-time transfer to 30 seconds.

Tested with the syzbot C reproducer under QEMU/KVM. The
patched kernel repeatedly completed USB device initialization
attempts after approximately 30 seconds without triggering
the previously observed hung-task warning.

This patch depends on Hongyu Xie's pending v3 series:
https://lore.kernel.org/r/20261001123135.38831-1-xy521521@gmail.com/

Fixes: 32ebbe7b6ad4 ("USB: usb-storage: add filter to "option_ms" to leave unrecognized devices alone")
Reported-by: syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7317196294d50d6e55c3
Assisted-by: LLM

Signed-off-by: Lee Yongjun <jun85566@gmail.com>
---
 drivers/usb/storage/option_ms.c | 38 +++++++++++++++++----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/storage/option_ms.c b/drivers/usb/storage/option_ms.c
index 7c0b05a36554..1f3d984d6932 100644
--- a/drivers/usb/storage/option_ms.c
+++ b/drivers/usb/storage/option_ms.c
@@ -10,6 +10,7 @@
 #include <linux/usb.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/jiffies.h>
 
 #include "usb.h"
 #include "transport.h"
@@ -18,6 +19,7 @@
 
 #define ZCD_FORCE_MODEM			0x01
 #define ZCD_ALLOW_MS 			0x02
+#define OPTION_MS_PROBE_TIMEOUT		(30 * HZ)
 
 static unsigned int option_zero_cd = ZCD_FORCE_MODEM;
 module_param(option_zero_cd, uint, S_IRUGO | S_IWUSR);
@@ -44,9 +46,9 @@ static int option_rezero(struct us_data *us)
 		return USB_STOR_TRANSPORT_ERROR;
 
 	memcpy(buffer, rezero_msg, sizeof(rezero_msg));
-	result = usb_stor_bulk_transfer_buf(us,
-			us->send_bulk_pipe,
-			buffer, sizeof(rezero_msg), NULL);
+	result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
+						    buffer, sizeof(rezero_msg), NULL,
+						    OPTION_MS_PROBE_TIMEOUT);
 	if (result != USB_STOR_XFER_GOOD) {
 		result = USB_STOR_XFER_ERROR;
 		goto out;
@@ -56,14 +58,14 @@ static int option_rezero(struct us_data *us)
 	 * Some of the devices need to be asked for a response, but we don't
 	 * care what that response is.
 	 */
-	usb_stor_bulk_transfer_buf(us,
-			us->recv_bulk_pipe,
-			buffer, RESPONSE_LEN, NULL);
+	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
+					   buffer, RESPONSE_LEN, NULL,
+					   OPTION_MS_PROBE_TIMEOUT);
 
 	/* Read the CSW */
-	usb_stor_bulk_transfer_buf(us,
-			us->recv_bulk_pipe,
-			buffer, 13, NULL);
+	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
+					   buffer, 13, NULL,
+					   OPTION_MS_PROBE_TIMEOUT);
 
 	result = USB_STOR_XFER_GOOD;
 
@@ -90,17 +92,17 @@ static int option_inquiry(struct us_data *us)
 		return USB_STOR_TRANSPORT_ERROR;
 
 	memcpy(buffer, inquiry_msg, sizeof(inquiry_msg));
-	result = usb_stor_bulk_transfer_buf(us,
-			us->send_bulk_pipe,
-			buffer, sizeof(inquiry_msg), NULL);
+	result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
+						    buffer, sizeof(inquiry_msg), NULL,
+						    OPTION_MS_PROBE_TIMEOUT);
 	if (result != USB_STOR_XFER_GOOD) {
 		result = USB_STOR_XFER_ERROR;
 		goto out;
 	}
 
-	result = usb_stor_bulk_transfer_buf(us,
-			us->recv_bulk_pipe,
-			buffer, 0x24, NULL);
+	result = usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
+						    buffer, 0x24, NULL,
+						    OPTION_MS_PROBE_TIMEOUT);
 	if (result != USB_STOR_XFER_GOOD) {
 		result = USB_STOR_XFER_ERROR;
 		goto out;
@@ -112,9 +114,9 @@ static int option_inquiry(struct us_data *us)
 		result = memcmp(buffer+8, "ZCOPTION", 8);
 
 	/* Read the CSW */
-	usb_stor_bulk_transfer_buf(us,
-			us->recv_bulk_pipe,
-			buffer, 13, NULL);
+	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
+					   buffer, 13, NULL,
+					   OPTION_MS_PROBE_TIMEOUT);
 
 out:
 	kfree(buffer);
-- 
2.43.0

