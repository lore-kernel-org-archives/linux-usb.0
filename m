Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F4A2D5408
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 05:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785391046; cv=none; b=Y/Exh4C55nlEa5MO89a3QRsiLD64Fy6GFzHI7WdZYF/zg16Yiv9qRRmi7A9UdE0JrdV6TzNR8O46TE8ndTwZUJnbYSpzJuVEcjtDw3B2QLOeJ/kJg428aOsCZVNOCpgcNezP8GupjOmGnIekGffKEbAB1L/GlKeFlFLDqDTxaMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785391046; c=relaxed/simple;
	bh=cSbV9Z88p0LZrG1qDRIYp55N2LVYVHXDK2UL7LJ0//w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYHro+jmRbxK6BxZhzKA13oBBbXgnByVt5DKy1a3nJ772sqVsEOm/eDhV9fIR1WSwG+/fuKUQuQlzgTrz9dk/YOA8wj9+7McR5+V0PI/434wdpVtKbKwehXEZcJAmv7kcCvADBBFgakJh8ZJv/dxsqH8fah8P6oXhaxlNTYMD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkdWFBO5; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkdWFBO5"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb7926836eso973854a12.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2026 22:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785391043; x=1785995843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXFysptaTi6eZT57WCQhxnp9zJWHqVppMPQlTy9mI7k=;
        b=fkdWFBO56HiWxunb8ZpORCq35TJrjKZ8fpbDYaEgr/o2rQEac6xQ6MqbpTdO4Luugz
         CejMDPHciwxXxPoybI8FjI66vhVV6I1MRQ56C9twIo1PdWlkcOyG+h9zC93FpVApSUC6
         Os83T88Pgo2sHG2YriMaTugXJSS5DVMYEGPl0zyXZIZ/NkN9R7xFk658nAUWzm5+brhS
         7Z4IVLdhhy9SjLNwoauZgvC+oRrFkGsJjtdlHqACbFawE10FbX5p33Dn6+zTCGNYx8s8
         V1raXjl1v0q1olgRAD6fgz9D/L6fxiwJs3H7OLq/UWOpUK+Bbkpheawbuz9j2xe8mgPE
         DcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785391043; x=1785995843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXFysptaTi6eZT57WCQhxnp9zJWHqVppMPQlTy9mI7k=;
        b=Ui54kOvDZPC1qDC17NwY/qae6l37uA7ZmPTLqbEgfcZTq9GHrKak2ORUTACJiKX4x+
         cusp4dNj7RzH92iykr5nTN94iNiAzvKsBL1paUN1BPS4noN3Zh8v+U2lop1Bif8gXBlc
         jSM6fKWf+Kq6hS6e+2bcAcQelhttuIfXTz6Dkdjav0S2Tme6fRxzvirsIC4/U+VCd/Vy
         6Nbwebb9bKiVGmsKUGzUMhQYX4XjTHEPOOPEDFJ1lkZ/2kbE1jvT2EUMbGMDSuaXF0sy
         +0oLBjO+RHwrCvB5OjvdL6iP/9P4Ah0f6WHHhbm4FDe0RLPfoSRFjh5i2KO4/kDVcHM8
         8otA==
X-Forwarded-Encrypted: i=1; AHgh+RoEYbaEEwGgC2EvE0ea0cbpgSRbR/DGDPFJPmdzNOUjZCZuJabyaOof+gBqaWLex4pWBt1ZuyGWHV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0frAKN60FZ9u59nHXCObxgfuijKZn41y5LdOuwg3mIlM5clX1
	dHiySKBJpKwv06YOMfRsdNC9e3kaOk3JT+BViO3r2r10zA7chFzs256m
X-Gm-Gg: AR+sD12bw5TFnaxTZz6XqseqZbcE+J+EPw/8RI2lG0A36Quacjt8wrsSur5E/MvJtVx
	Ov6LI9jOGEgnfGDY07KmPrS7Vh0E5zoJpfDbsw6WyOIsQ1QYdJkmEL8Iiv80AblkfR0nur0EdHu
	f7C/7dQAgd1LP4Ih8RK1o2xzfekHPNpHfGkxeUO5NO+9LYsQ7CAFaEkHZl3mWOfdbSjOVBsvRFl
	TIEjAXSHhjXOPnQcwZ05Me8irSg2pMjRV2uY2mssh56FMsRQwIQ6mXmBoqPIcwSsX/Y9Un7meA0
	VdndSoi4ypTX2aChJfEz3hmC3qmxTq1Cvf7IjuzFv7I5TOJJNOkR8V1AQHkKBC9uOiictftTDxd
	hyhC7WlSbd3IZkN0v49W46y9OgyMwUu7o9FA1As+zMPpPmijHU+nb9EA8/BfHxBWXVB4AOAk9Z0
	eNfxTKVgCM3X1DMCPpcfTUSVL25vASgif5JoJshqdG2UQ3EQs1Z8QEy1TxhxyHtfA2bQ==
X-Received: by 2002:a05:6a21:482:b0:3b2:924c:566e with SMTP id adf61e73a8af0-3c9008b1116mr1170742637.36.1785391043402;
        Wed, 29 Jul 2026 22:57:23 -0700 (PDT)
Received: from Default ([2409:40f4:1008:1710:a945:87ad:2d3e:163d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d373c3sm16792167eec.23.2026.07.29.22.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 22:57:22 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: xu.yang_2@nxp.com,
	Frank.Li@nxp.com,
	panjunzhong@linux.spacemit.com,
	kees@kernel.org,
	jeffinphilip14@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com
Subject: [PATCH] Fix Null Pointer Dereference in uvcg_video_init()
Date: Thu, 30 Jul 2026 11:27:05 +0530
Message-ID: <20260730055705.13784-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvcg_video_init references video->uvc before assigning it
leading to a null pointer dereference. Fix this by assigning
video->uvc first and then dereferencing it later.

Reported-by: syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com
Fixes: https://syzkaller.appspot.com/bug?extid=8dcac923582c28505fd7
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
 drivers/usb/gadget/function/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 2f9700b3f1b6..cb532654b9b8 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -806,6 +806,7 @@ int uvcg_video_enable(struct uvc_video *video)
  */
 int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 {
+	video->uvc = uvc;
 	video->is_enabled = false;
 	INIT_LIST_HEAD(&video->ureqs);
 	INIT_LIST_HEAD(&video->req_free);
@@ -829,7 +830,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 
 	sched_set_fifo(video->kworker->task);
 
-	video->uvc = uvc;
 	video->fcc = V4L2_PIX_FMT_YUYV;
 	video->bpp = 16;
 	video->width = 320;
-- 
2.55.0

