Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C36B14AD0D
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789349442; cv=none; b=lETgaduYngyXn3XwKJv796qjLNAmGYVQnV8Kp9VuK7LKfv03/eGaO3Qmd6TFP0GwUOXeYzo6nM9ReENulCmKd45xsGm0JppOksfMibyyYY6wEyNYeX5mVgvmpPt83HRKTt/ps+6AEVzTgkqc093+erAXR98W+G/B0YzBGPNrCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789349442; c=relaxed/simple;
	bh=x2YSwtGWkoi8vtL/lIbsZM8/SJRylBmyWKVvTPqiEoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FU08Tju/hxBJBKpxbNJaCY0fUeXYs7y0ubcG9WaeZA/OVogTKH13KyfQbrv1C54LJIHWKe5HTiS642DplALOtpktmfX5Hk7svg+IbJMJX1vAXaF7GmWJeAjPebAUjCzXKCeqliDVlY3HSccA0+QQfeVjfHoYhkn2ZctPsl/uX3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K45z+sqc; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K45z+sqc"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1542592a91.0
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2026 18:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789349440; x=1789954240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mcnz/anIni8O7yQ67/BZn3naBRVhXN1aoBOwdzqDEUo=;
        b=K45z+sqcnBgA4toaafwf1ghtkPFEUT4NJRBIV90JSd3LrXPgdR7EAO5cQIPET2bHU5
         3/IAhEf7gCo7SzS9yCoKFvK65K4EqRJWod37JEr73kR9rqj5pSdLqflAhzLGXLBFenkN
         jQzsqYgZk12W/YZLGwvXEQNyed0StvB2EvImotyRhhn2f9k5bwNELnMuR6WAaPFMUksz
         FlFM682OA/RpV5UUzsSmvrHTAc6e5nu1jFULTH253OXTPtZM9fdD8oU57dlbYUngsKXO
         w0mQXmF/mupTxZ5FDsU88hexv3VMDiRWO36g5FsowchfhopdZtJuSsuV04uKeI1dyyhM
         FfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789349440; x=1789954240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mcnz/anIni8O7yQ67/BZn3naBRVhXN1aoBOwdzqDEUo=;
        b=RZ0GlK27ehUL5aIDH3M7yNkEmA9m7axlTQ9fmYjGg/pFs2PWcdm7LqiloSvQdS4Uga
         2l13lzgE1FMQH/Pl/FDF5mFT1o6+yLO+XrTizcOtucRvU+sI6JV3qBv/OXcyVHqpxOsf
         Z5JCKlkAZlFmN2PHmIKBEad8wdM3tA77szaqX3AzSSD6OCSZqGh/4OdNXnp8EP2ybdfm
         0mg1xt9MRgLekr3ygTfQHMtF9wyTsjvmE3IhjXi+hmBH3ijBA650ZLngLfWU3nPO0deH
         vC+GnSFmp/krtkVfTWUOU+KnRFXSL8BYerRLBwWpHBbSMm9L5i+Pz79p4nEB2uinL0ow
         KV0Q==
X-Gm-Message-State: AFuF++lEaAAwuXDZwuKpMF4TINszqR0I/pARoem/y5dPR+h1IHm/aocT
	Qr+9SgTiWVEHuvg7uONthTSLm7hvcswdjzyQfMzrXN+0RyUVDRgARTTA
X-Gm-Gg: AYBFou0RJP/Fl3s+H8kCKpvu9znLfXA8SHFJtN8PyQV2VH6mqDePBnsGE7730sXfupr
	IA8dW4wN69EXAUSktMpxdwqMxv9VZFvEG3WYX0dL7ku9QkQBSy6EShirdjqDDKzu77mTgnR3wSB
	gtBXKfxmBakKaZkxF6GpRZYRzHlHp5J7K+STeeEWHoE6vsA10OQb7WUfCa9phOlHbO9xxpwzYjP
	FG89Y5CpvYJZ4bF2B0GdtC/hjSFqzbnn/jbVC7UT49/SptEqPu1+aauDW2X1RtKshtvVfUC07zU
	TCWqHRYzd4Qnk38VKUTEYhkWlQ5bvsR2ynmvpKyQv4DL1qwKFwrZnb52ZTtPhLz1QUIWynAMVBx
	XhqoMuLZoSppUerzBdbUN3dccNV9J9W8cwfMq3aC9zZo7zH/eq19tGgppbRsTsJMZ1u6lbjbGKo
	igwe97cxDHJGRm8/cy++a7yUQHAduhuOvqu2+mkIpllwZGIk4+xr3jvrKe96UM7wSoWcaCcgDSS
	NnvAHyyOb6S00K0r3UN+w+JSM//MFvgyvWBsj9LgTol3GIvhRHsyy/5GatDZlDYA8hmJ2hBH27i
	dAQ=
X-Received: by 2002:a17:90b:1d4e:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39debfa4b03mr1210528a91.10.1789349440495;
        Sun, 13 Sep 2026 18:30:40 -0700 (PDT)
Received: from kic-machine.localdomain (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm39627135ad.3.2026.09.13.18.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 18:30:40 -0700 (PDT)
From: Kuangyi Chiang <ki.chiang65@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ki.chiang65@gmail.com
Subject: [PATCH] xhci: Fix HIK camera control timeout on Etron hosts
Date: Mon, 14 Sep 2026 09:30:33 +0800
Message-Id: <20260914013033.3938-1-ki.chiang65@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Control transfers to the HIK 1080P Camera (2bdf:0280) can time out when
the device is connected through an Etron xHCI host:

[   48.363671] uvcvideo: Found UVC 1.00 device HIK 1080P Camera (2bdf:0280)
[   53.465662] uvcvideo: Failed to set UVC probe control : -110 (exp. 26).
[   58.585653] uvcvideo: Failed to query (129) UVC probe control : -110 (exp. 26).
[   58.592967] uvcvideo: Failed to initialize the device (-5).

Testing shows that at least 125 us between control transfers is required
to avoid the timeout. Limit the workaround to the affected Etron host and
USB device combination to avoid changing control-transfer timing for other
devices.

Perform the delay before taking xhci->lock so the existing state validation
and TD queueing remain in the same critical section. Use udelay() because
urb_enqueue() may be called from atomic context and cannot use a sleeping
delay.

Signed-off-by: Kuangyi Chiang <ki.chiang65@gmail.com>
---
 drivers/usb/host/xhci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 5c759ad..925716a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1648,6 +1648,16 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 
 	trace_xhci_urb_enqueue(urb);
 
+	/*
+	 * This camera needs at least 125 us between control transfers
+	 * when used with an Etron xHCI host.
+	 */
+	if ((xhci->quirks & XHCI_ETRON_HOST) &&
+	    usb_endpoint_xfer_control(&urb->ep->desc) &&
+	    le16_to_cpu(urb->dev->descriptor.idVendor) == 0x2bdf &&
+	    le16_to_cpu(urb->dev->descriptor.idProduct) == 0x0280)
+		udelay(125);
+
 	spin_lock_irqsave(&xhci->lock, flags);
 
 	ret = xhci_check_args(hcd, urb->dev, urb->ep,
-- 
2.25.1

