Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88D3E44EA
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 08:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782462183; cv=none; b=vBRy5T4dRhsP+n9J1EGWrEXViuzRCMhxOw6MtpnIzLs1XUdZ873td5OaRcbZi2EhZohtsBJidPuLAYTarTJJKttncSw5k+/X1CVVnuw3zpDqrpmvAhaGYd2Z6xt/8ZLL5ICB2r56ZvK1qXmOshflUPZW06JI590MLMBEzwUus94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782462183; c=relaxed/simple;
	bh=W1w472VHFu9Kg4ZZoVNc2CTiAuOu/6asyIujO+CxZqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4w8sxdfBfZVZGeuM2EBVqnEM3u2oaqnIL85c5jlVeOlsGNhsEFZNQiP4ZTfN2M5qLdMjWxrhXldnAr/oYcy1uP2PqdPlK0hZUyR68ORUDyuMVEgLUG/VB2KsLMTTl5Yq3Dh3ieXgSkXQuaxf59k8UMVV6LEUR2UqxN5vmm9hFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B/mryCWJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B/mryCWJ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso7510745ad.1
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782462182; x=1783066982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV5yYAQhu5LuQKYBaN1uWFLZmyuh5tReudUkrHR0RRI=;
        b=B/mryCWJLs5RLcdO0YmLHIE++cbzQAy9u/mGHk2WcLN/XQatHGVLcEoNmmhZnhH670
         QZbVkaCUzqo2Wkg9xS3yRAzpDNDdWZSwujNWVX2bvWYqhJbMl6I0zvJsJeE1AvflyffK
         5ZSiEK95Hsg9hTebm7V0aVyjyTxn8hvmXLuAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462182; x=1783066982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WV5yYAQhu5LuQKYBaN1uWFLZmyuh5tReudUkrHR0RRI=;
        b=ksgaqAVTqNPnI26bN8wQwGz5ER9ipH3a+UsiTdhJcP5Bui4gUbqba+io3aut7zSglf
         Ux3hjJVXRoH3lhhQaReAuuhyTHSjiNR1b3eELCMa5dzJ6+PlJbCwLZz1b99lh1Cxx61H
         JVDHGYCgzaWGWySygxxtJ3IkiYL4nKcRzmQ6+Gf2ElnLgCm7RJjAU7BwuHu3vQ4vtuqe
         DyynQTa95xGkzb+a/hU3ZEAEWYvWGvmoUcXEDiy/0dT7DoXZEDoQvT4b3tdoK6PaWR76
         DR9StsXCBveQIKbihczsiBfkOMu3CXSCXBGtKce7I4Q+X8XRARvWwaJik0NnjdfCum2b
         bcrA==
X-Forwarded-Encrypted: i=1; AHgh+RoZETilvcZxmr3JK54zaplK2f553JRLKkUwZeoyQ2aZushVhfgkdH+GMqAe+PJE9fg0EVT07/YZVt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qSD17W91kfPI1C8DshNBYPCWRHDB8btUVbKMipeAsL8ymgHu
	oHqombeldGCsuWidiWY2xKYkkgNAKq2c2ZRGyg237l2Ix4vuxqQbEeMUXBvV7w1RhITFsXTVLYt
	Z7Dw=
X-Gm-Gg: AfdE7clG70sk3p7UM15p5+hUnwK+sTznu5ob015sGK5EnOD7ghOPhgJzAn6IdzRELrU
	kBwuMEcrqWeOx0HhXW8ZGzwNA6v4IWoIjuDM0d8+ruDXWOuNR0q6L+nBUc6OZJBTqLxnZYfrncd
	GQ6HrVV9Aji3hEKHCFgR/0enHY5y+r434n9rlc5ckeQImFrYHWv5py+nSq/x/WjBf5kS+DZ+/PF
	iWxK05uU6DbUenu5Lp3HzfeA/fH33cU2V9iD/aDLPNHkocKQpGhMw7mPkf0GlpOHV+AEtKsbk0h
	yXgO3VEdS5OUxE/VNjr3Wquymftm+uYZRL70hH8ch9Dl6ucf/1wwPEhYZFdXTpapfdXEjfBrHCW
	M+TtdjUV3q6uSVmIZ9ufTURPpa3kXJJ0HRvmpR1mk6IrQuLb/hykf9+4r+sy1aYq1boHNKQWR+g
	4ZVCX61wIbv8WOEoZ+IStEOkOILokEWCr4iXbIe9oFdymsfB8VTikUdrAHu91C0RbuZtVl1liu7
	G4udp4Wmg==
X-Received: by 2002:a17:903:1ce:b0:2c2:75c4:4b0f with SMTP id d9443c01a7336-2c7fc70a32dmr65200675ad.2.1782462181768;
        Fri, 26 Jun 2026 01:23:01 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:2593:3e55:e36c:f47d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dcc30sm34619185ad.66.2026.06.26.01.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:01 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: mtu3: allow system suspend during active gadget connection
Date: Fri, 26 Jun 2026 16:21:51 +0800
Message-ID: <20260626082218.2750459-2-fshao@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260626082218.2750459-1-fshao@chromium.org>
References: <20260626082218.2750459-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When operating in gadget mode connected to a USB host, system suspend
fails with -EBUSY because active peripheral connections block suspend
entry.

Fix this by restricting the -EBUSY check to runtime autosuspend
(PMSG_IS_AUTO). For system suspend (!PMSG_IS_AUTO), perform soft
disconnect to disconnect from the bus and allow MAC sleep.

Fixes: 427c66422e14 ("usb: mtu3: support suspend/resume for device mode")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/usb/mtu3/mtu3_core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 66dbfe1705d5..a40bf5bad2d5 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -1037,9 +1037,14 @@ int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
 	if (!mtu->gadget_driver)
 		return 0;
 
-	if (mtu->connected)
+	/* Prevent runtime suspend when active connection exists */
+	if (mtu->connected && PMSG_IS_AUTO(msg))
 		return -EBUSY;
 
+	/* Perform soft disconnect for system suspend */
+	if (mtu->softconnect && !PMSG_IS_AUTO(msg))
+		mtu3_dev_on_off(mtu, 0);
+
 	mtu3_dev_suspend(mtu);
 	synchronize_irq(mtu->irq);
 
@@ -1055,5 +1060,9 @@ int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
 
 	mtu3_dev_resume(mtu);
 
+	/* Restore soft connect for system resume */
+	if (mtu->softconnect && !PMSG_IS_AUTO(msg))
+		mtu3_dev_on_off(mtu, 1);
+
 	return 0;
 }
-- 
2.55.0.rc0.799.gd6f94ed593-goog

