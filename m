Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570587;
	b=ybSaXnsu9O57bRl1yyiBWxFpz0JXu/cVW0FXeTQGUxhcGKIPioAOvkzqiCHGKrF3cafy
	 t0bLnZD4i/PwvfYjJAIvCX0GtlytX/TT/5euFGCnqSvYKqt7y8gYW5vetpOwsSgCo/dTR
	 SMjawLjiPNCH9fQCwhMJKb/pvnEpezzOasQw37dBX30mQgvgt2GniLqHpcZtAI1VMyVMS
	 MAErg3YwNHs/uXtVD34JrlobP89a8zkMvCQbNPqPqqBb7c6IPs/FGeaTiZZYvHLiTy13S
	 +HlrWfrJbHpCKRIAf3Pc4pp9JYP4QwfpoyuQM6BXFzNNigeyNlFc+kqmqGXgYYRBxbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dyq0bclsckjYVnS0JlHhV8g17P1KXdlbb5EV1M6XIV0=;
	b=atfXBMzPsOA2j9w/kzEzPc2sUL27ULU5YPKqt2dSnqXuNZjiAfJE1Bmxqu2T0yD3Tol9
	 pNoQ0W5aaKJo9+POCWbReOzAhmO1Zom54OJp2ldwVifbe/OoIFkRkktK64cqLcIkppvf2
	 /o7pgNfz3VlEeisu7feCZAToeyAcL9CpFC9Oyj0SsuLOMWa5hvXcjtdIHEpDPX0h0UOQx
	 M0CEJpo9Bq5T03v8ak/VkiKR7sSZCLlStJPpU4CtZKOPBMDXL1B/BWKi2KHrT4P/1msjy
	 JMliWRXnqHfmEHAH/RgwLzvl7d9b4mVgmtHsN9SFDJgGdpDK2Gm7tORlDS4binjwV5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Scmfd3Kg;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D599606A31B
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D599606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Scmfd3Kg
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8b20a899fso2407505ad.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792570585; x=1793175385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyq0bclsckjYVnS0JlHhV8g17P1KXdlbb5EV1M6XIV0=;
        b=Scmfd3KgHp3BcI/NS6KhzN0AwLp8EUSvkkX2OHcGIT0OwnncSyw+cblKbnCk9hEOYG
         HbNOotnUP9LDc/pJFgCECHK4JmkzWLrE95qwMHDq5MPGAncasy4NNhxLpp5CyltUdIsW
         wG/HUbxaB2HyGTrsCha9fF0TmX5PIcrOsbyb572fr4+Q2kjjY8MH28GvTxPnqs1P/aH/
         /LsupJqR71ONvZI8kCIOmFprFBeHRbXbEPuNZFqTLLLyAWnnadJr4P3S+vhLczyClZz3
         GUznoq4ltg+ClhAQXZwV98NgoMsbS3j0aCOco2HGw0VLLCH3ooL+ihDX6b/QvAhaXPiO
         vFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570585; x=1793175385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyq0bclsckjYVnS0JlHhV8g17P1KXdlbb5EV1M6XIV0=;
        b=hUUglDf3EbZ61Hzgp8WKEktXTAX5BUDuWUGLuXx97/jxxUc9JxZQQRRO77CCar8S2/
         wDCLGI6Y8K780fHlUp6uR9dn6WfbaxX4mJB4kGYDvGyTEe2sf9oS+5lgTe7vuuXjuHeN
         MPkWIKVLR+WxlXXCo9dVaAdPVjTvpZcxvAM+NSCdQGhPqa8g7wwwem7/FrluM//wFMbg
         J1frX6/IbutFXvQ2LIZtK0Ukwf0UPAu9NPQRRfEoJL5wv3Xi9gc7FoRKA9PXSUuFBEvr
         q+jih0hyjCCW9nI2zjSEoUmmkdcgL/zqjGRLrQOBxLt1SXCdjg/AqbEwua4RBsxUpwos
         xrdw==
X-Forwarded-Encrypted: i=1; AKwUvBycJrWG4ruaCiLDufKkyOAuCChQep/MOO2c2z3fJ3fKB9j9pcPIHuwXzb0iQz15m2rYE4MKLJC/0Tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZRODkInqyol4P0EBEMIYCPx6XXD39H9FSLQWHk66VpjF6P0ok
	mShfRW4a62dT/uLMNn4Jc7kKW277Pfx+6UuzUqKEL/DK3nBVQXzCL4Fb
X-Gm-Gg: AYBFou0AOnBDJdZaJYEYwQG1silr9GuSYXKuNLYVjC65L/FGtvyyy6wJjbkXN+7KUrp
	qPH/6EeShdiHedmSzDd+yjb0liyu6rVw5lJ4MAV4kvMcjaZRYNn6XUfYOybWDB9Ndq4hKXXo6tH
	NVaZFBmLYY0dHm0F26+bBmnkeY6efyGN6niCB2xhoy9IGiqXtGyanMNZsgdHWbX7WkNm2rUrW5W
	ocTd2MaUKQV3Mb4GMOn741Mgr6OU/3J+8U3ZHXF06PXVkVoZtDz07hCgVpX6wlAV7JeApz/BKo2
	NIjE+wkiRJ87HFUDoHTlg3xSZlsiPL5u2FoN9+0aJyETl3HtheGy95RClPtqW40wH5BV/sCzCmQ
	uCMkjrtEBw+QBmkQNvsSRdZOs749u8aZXHmCC2VHKdwl7ZhyoYGABnH9DPaRUM4xuzsqwcMpQTC
	nC9v5bLOz0p79Hgnn7YhYXAEp1SiATSh+NIM/scGJXQlzT0AyrSKiMEK+hwPrUBL/BgO2ApD3GP
	EVNx7CyQzUtNizVg1YCLFSTJZMhs4EqDdVqkw4Takk2v5UWH17g3ei2ffU/rlZsdDyyn2sxL0wd
X-Received: by 2002:a17:903:2305:b0:2e2:f379:82b9 with SMTP id d9443c01a7336-2ea4402ba77mr9477575ad.61.1792570585345;
        Wed, 21 Oct 2026 01:16:25 -0700 (PDT)
Received: from LAPTOP-GHDOQM75.localdomain ([112.217.167.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4536ddsm8000765ad.43.2026.10.21.01.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:16:24 -0700 (PDT)
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
Subject: [PATCH v2] usb-storage: option_ms: bound probe-time bulk transfers
Date: Wed, 21 Oct 2026 17:16:16 +0900
Message-ID: <20261021081616.89976-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Option device initialization path issues bulk transfers
without a timeout. If a device does not complete a transfer,
the USB hub worker can remain blocked while holding the device
mutex, causing usb_device_read() to hang.

Use the timeout-aware bulk transfer helper for the transfers
in option_inquiry() and option_rezero(). This bounds the wait
for each probe-time transfer to 5 seconds.

Tested with the syzkaller C reproducer under QEMU/KVM. The
patched kernel repeatedly progressed through the USB device
initialization path after approximately 5 seconds without
triggering the previously observed hung-task warning.

Fixes: 32ebbe7b6ad4 ("USB: usb-storage: add filter to "option_ms" to leave unrecognized devices alone")
Reported-by: syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7317196294d50d6e55c3
Signed-off-by: Lee Yongjun <jun85566@gmail.com>
---
Changes in v2:
- Reduce the timeout from 30 to 5 seconds.
- Move the dependency note below the --- separator.
- Remove the extra blank line before Signed-off-by.

This patch depends on Hongyu Xie's pending v3 series:
https://lore.kernel.org/r/20261001123135.38831-1-xy521521@gmail.com/

v1: https://lore.kernel.org/all/20261013132033.4352-1-jun85566@gmail.com/

 drivers/usb/storage/option_ms.c | 38 +++++++++++++++++----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/storage/option_ms.c b/drivers/usb/storage/option_ms.c
index 7c0b05a36554..d844fcaaf3fc 100644
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
+#define OPTION_MS_PROBE_TIMEOUT		(5 * HZ)
 
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

