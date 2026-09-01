Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC79367B9C
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291076; cv=none; b=jC2WSxdvb8PXBbPSyRoqd5hU/jzas7wpL3C7YWViidsZ7Ex8Oof0tWcFlAn+qGaQS0inV+hm6YaZUFY+gr7qBDmjdD7ztQmOJGQBl8CXbyeP0XN9jqf3COK+ZuwbUvyUzYwo4Rs1IJwH+nFI2Dzekf1iAyboNBwR2R41oZDyh/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291076; c=relaxed/simple;
	bh=hpI/+dMWdbQELuJ+OW8AyUJGjGTY/aQ6ws4VVcNySk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOWMoHyL8rrvxq4L87qJfjvWAlK3d3IVaxtQaItbX66hUgzvtJrHMdQvec54NVnNM5CVjE9bBJBcLzlErlK1yfJ7WyKlUy06JXsBazLYMpwPyxgow3mHBqIAgfhmfrKbXy8c5KJYleC11kMQYTL5oS8qVDgNr/+qxGQPAxkzeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2k+ldwn; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2k+ldwn"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48436251906so327969f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788291073; x=1788895873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnnNmIUeZLo5AF/NInIz9CfUDkQ43y3yeC2yfkSkWEM=;
        b=B2k+ldwn5iCYtML7YoSzHNSVLCyGC3oLcUdNiuh2mu0FIJwx1+OsT52uHf/1pLb7L1
         vSpOfGSC3mgnS5KrsnLaSbQMEoqQW8htBJQUam230dzM4DDfJcomacoHsej/DlPqjsND
         l7wGmCRF8eqGToyMOQT6njdZYcwN421TKLJdXT7TIDKPBxyKyuEwwV2+gB2+4QW2DWOw
         UWsbm1Y/EdFHuU5Nl1r4eBoqFJdvLXP9eAJmYoD3wHk78LZbylVf+i0ctWUbjgL41sl6
         ywbz6kU555GfjaYKg5DZOm++uFPBNUccvk1azgBOkc/UKUcBoe76gJrUWSi/7QwXFXN3
         4jHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291073; x=1788895873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnnNmIUeZLo5AF/NInIz9CfUDkQ43y3yeC2yfkSkWEM=;
        b=A2drQtUgB6Hk2AORwWFnIoUqRZHmnucyygOsrK4aTNVy/YJ/dwdLnTGjrqRE/Re7V2
         294+1NlLu/8vRUQTt2oANH1GKuVRCBqj+MfE1Ot+RfEfmRpjK9BvkH/u1ssfmzZn9LCm
         sMPuZ8DsgMBGVKeZWnwqk9Oxsk/u+Xv9FzE+K2CLBNVzkpGZIOW4cur6Oog/nnER8/hB
         0kA/zyFvengCDj5/rzdV5a7+zk4wZk41zgFJtKxINC//Wnssz14VlZ5wCKx1nsFJk8MZ
         rH/dK0/MgWIYA4+wAu7cAATO+Cx+2vUTH3cIgmQbUUhEN/vjvBrOQDUA8ThwxPknAh3H
         Vl0Q==
X-Gm-Message-State: AFuF++nOs6L6y72O0Hi+sCw9scuxaT6jDCTLptN5up8fceu5yCNm5FEL
	S3QFOU4SSOltvyKvVdDvn+fudJZlVQNAXWhQajs83O/VsFu/tMsr18SUsRDT0gal
X-Gm-Gg: AYBFou35in3j6OLxtmK/NpTjvU1Lthe8IqL0o1oPdiqliijMtlh+v4b2VyRngQZwHD3
	7UoxTja70yrrKTc9uKcqQ36xqNvEhDrd7vz8YaBycZ3BgOdUr3tZjkeQ7WjvGwQcg5c/JdZu8sZ
	n/AAbniRtYKVrbQS6WgS8J3N4XelygY7gz7zjVNL45W9b380mkIwUg+yItInWjVXB8i98tkEMQI
	X4hPrafKI7+05S7RXaZphLCVFrpYF1QeSybAh8Cv5fOYd0eifo59VFET+uJrDX4s50b6+awjdzC
	YXw2ea59Yd7qRE5XssVRxxb05D3LeQMThgGuFthJ9RPtK85TBZJaFsyldjfNHx61MRc/n6nI4Zt
	5xVxaZkCiFFJfG10q1g4kWx8RBwkQ00plKaA/ewgWsWD1998dM3aAAeE8o8d+XmKUXX/aKm3x4b
	sUIL8nh2cIr15KOvFY0oB2nOW5E0nVftVAu4gRx05WQlEKXA7uQjglfDWZLwUYeD8jOsXQmnQj2
	ULYm+GkMbb7Jsf4M838zMU48wVIUpe3ZCdvJ4I33xAYqYkyjLqTSlG+knwQ5zvFKHXqpLIYsF9p
	kf/KYQ==
X-Received: by 2002:a05:6000:46cb:b0:47d:ee9d:90c8 with SMTP id ffacd0b85a97d-48440fcda0fmr16556741f8f.3.1788291073333;
        Tue, 01 Sep 2026 12:31:13 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e7315bsm1113106f8f.7.2026.09.01.12.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:31:11 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] usb: octeon-hcd: fail the probe when the USB core does not respond
Date: Tue,  1 Sep 2026 19:30:28 +0000
Message-ID: <20260901193100.1352110-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901193100.1352110-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
 <20260901193100.1352110-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the USBN clock/PHY setup did not actually bring the core up (wrong
board reference-clock configuration, for instance), every USBC CSR
reads as all-ones and initialization marches on programming garbage,
ending in timeouts or a wedge deep in the FIFO flush.

Read GHWCFG3 - a hardwired configuration register that can be neither
0 nor all-ones on a live core - right before core initialization, and
give up cleanly if the core is not answering.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v2: no code change; added the Assisted-by tag for the AI assistance used
    (Documentation/process/coding-assistants.rst).

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -853,6 +853,14 @@
 	 *    USBC_GAHBCFG[PTXFEMPLVL]
 	 *    Global interrupt mask, USBC_GAHBCFG[GLBLINTRMSK] = 1
 	 */
+	usbcx_gahbcfg.u32 = cvmx_usb_read_csr32(usb,
+						CVMX_USBCX_GHWCFG3(usb->index));
+	if (usbcx_gahbcfg.u32 == 0xffffffff || usbcx_gahbcfg.u32 == 0) {
+		dev_err(dev, "USB core is not responding (GHWCFG3=0x%08x)\n",
+			usbcx_gahbcfg.u32);
+		return -ENODEV;
+	}
+
 	usbcx_gahbcfg.u32 = 0;
 	usbcx_gahbcfg.s.dmaen = !(usb->init_flags &
 				  CVMX_USB_INITIALIZE_FLAGS_NO_DMA);
-- 
2.47.0
