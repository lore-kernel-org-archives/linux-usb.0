Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942D3815D2
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350670; cv=none; b=JaUpH+kigSpmnR409UR9oz8TANCH6ULSlsDWTAGcHnOp9BU21pPpqL7DJivTIizhsTETWYs+4gioDJKi43iyRXMZwtTYhl/zXvJfa4ihc/I0GlCcH7UMHVhmitV1T6fpGot5idvw2Da5m1YDe4yugWPia2awkRBysmUakGEEvbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350670; c=relaxed/simple;
	bh=DC8hbtn49OkRdhMEpTeVtkgA5St46LFuImCP51O/Z7c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FPfsIQ4KNhYA26dDwdZ0Gt1L2vL/AGJxMry6ByeaBd0sbzNJeOpzQd3ar6OROKHbPd+NiCdpGOkYNYofP03c50z09g5vlbgJT0Eva/R6MauSuFtOQIWN74dstVQb+/uY7xZ88r54hFRrwqTySvFJuP1kO7+WmINcTfSjH4toemw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byTTlJHJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byTTlJHJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caea3f742bso42887855ad.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 08:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783350668; x=1783955468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YvJnbKtZ9JQUQxlIoTBWahfF5cHSq4G8K3OUqqfWB8Q=;
        b=byTTlJHJRNARRkFIETilzDPcAeEQBQdYdEGbm1zWeCz246q6JVUmemJSmgUxHJ1HYV
         L/DJWoQ+4BmB8YBclr6iQ6hA7IcfGSCKs0YKbOi4Yh8k5lFDeFAWBjIhSxMFWGaSxQEb
         juPtqICSIHXkyY6wdB4rrR51y6jIdMPHBwaT8v+YE/Leo7SEWm8xC+NC5T4bOvG1Eha5
         0zdjUg1JAQXbVVtYDgYyIhtmDGJZj0cPtNZssSZEYs+HjHFZ7CVoukcq6SodL8AXw6cw
         +irZhR7m4Prv+8sQzl2vTiAtzRiImqaI4TY4uap+4shgjJFPX/bZR4MTZfmDM3kOJKhQ
         rgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350668; x=1783955468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvJnbKtZ9JQUQxlIoTBWahfF5cHSq4G8K3OUqqfWB8Q=;
        b=AXZqw1a5xK0Lsw3jS2oy37Gd+wRSEKs38XcuthjBqgoqZVFE7ZiXdtLGA5tgcyEviY
         qh3ehpgHYS+4WBHQGQ9XPm6vTCuGlXfkYS6FbqL++qPcC6eIa3cOeHLIomrphDx/ZwRi
         RBsyfhp4PX40ba43h/3nFNpd7uSNBPR+rk8UlTKhm8o/ZNLof9RFVGMC370v/NgZS/fo
         LYES+1FRzwsoTkm0VI/RJoF1uVNSi9VHZLR9ncVVa0UhueMLlqddecrhIxRnoj0iLqXr
         13gj4/zWsCZLNlx54yCQv1HlY97tfrZzW5IPPtDjTXkhYIv3PmLrs4+Za9MnPgrFT4oh
         NSIg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+1UEMJH6WYZMOEv9KpDLasVEhG6hjE0a5oNnKP3n52w1mWKyF3+Wnv7LrUGEIoC+02VKMleGthq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV/rbvUPz8svkh/BrYUBmAeDm4f9thbDXFoFl3nPJ2Y4LN3ZKb
	6o3Ze5S/25eJ+XVIIQKX8B+kHNSsfzOb3r4hzypU/+ZyRUtygwuswHZSoRMA
X-Gm-Gg: AfdE7cn2/y08uOpZOVS0bJOZqz1u/mR7bchMrhYNzPuIGSe8e7IqxYygzgv8iUzJFxu
	cz+u+iI4/aVEotpIJFrK79m2Q0zHx1KpCIud/XuGuLz8U56RWO+irfi1b1vX05P7ihHLccz0cqL
	doj1SaNls0LK6assU53zOS/yZaFE+9z2RthS/EpLCMd3x3N1GrZrfKXUQong6ZpcS9FLgTsjgKI
	p6cJuD0V0/r2DkyxQj5137sRpxN0087cRfwzJUKPHFlaBP0MYxF3yYeTW10mp1PVXU2F1tOg0rH
	qfA7NoY1GbUqPn5k4uB5hTvQGQ4p3fCXxl0cZvNiOyPtLvGT2/af+GBqflTYTIGOy2nw4s3vka3
	QkEii4GiaWCAktNcwwWCtqIvkfQ79tH4n7j7yhAUDvhqMG74AKeeYTtQDdvQyqIAlkBrpA9XXo3
	ITaWgDexUv6dBt4n3QbBHGq01lT+5RC4sDpQD1T/GF98H0mN+gmjQqxqduAHOduSEZo1MTnvJjT
	l48H0PUyG6RP++Y5PV6VPSL1680y5ZW4GUZ8qBRv6VebO/PDA==
X-Received: by 2002:a17:902:d4c1:b0:2c9:97a8:8c1b with SMTP id d9443c01a7336-2ccbf183a00mr9819105ad.46.1783350668084;
        Mon, 06 Jul 2026 08:11:08 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad78a9f83sm52218885ad.83.2026.07.06.08.11.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 08:11:07 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>,
	Alex Henrie <alexhenrie24@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] USB: misc: uss720: unregister parport on probe failure
Date: Tue,  7 Jul 2026 00:10:49 +0900
Message-Id: <20260706151049.63470-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uss720_probe() registers a parport before reading the 1284 register used
to detect unsupported Belkin F5U002 adapters. If get_1284_register()
fails, the error path drops the driver private data and the USB device
reference, but leaves the parport device registered.

Leaving the port registered is more than a private allocation leak:
parport_register_port() has already reserved a parport number and
registered the parport bus device, while pp->private_data still points at
the private data that the common error path is about to release.

Undo the pre-announce registration in the get_1284_register() failure
branch before jumping to the common private-data cleanup path. Clear
priv->pp first, matching the disconnect path and avoiding a stale pointer
in the private data.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 3295f1b866bf ("usb: misc: uss720: check for incompatible versions of the Belkin F5U002")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Move the parport cleanup to the get_1284_register() failure branch,
  as suggested by Alex.
- Clarify the visible stale registered-port effect.

 drivers/usb/misc/uss720.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index a8af7615b1..bd099cd8c5 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -735,8 +735,11 @@ static int uss720_probe(struct usb_interface *intf,
 	 * here. */
 	ret = get_1284_register(pp, 0, &reg, GFP_KERNEL);
 	dev_dbg(&intf->dev, "reg: %7ph\n", priv->reg);
-	if (ret < 0)
+	if (ret < 0) {
+		priv->pp = NULL;
+		parport_del_port(pp);
 		goto probe_abort;
+	}
 
 	ret = usb_find_last_int_in_endpoint(interface, &epd);
 	if (!ret) {
-- 
2.47.1
