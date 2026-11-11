Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376613;
	b=dmYMqQbn2yKOL97kxlZGKPlhm8EbHCx+QzMR0z4vMSEmR0psotSWuW4KtM5sRbIjoDcx
	 dew6H5RD8N5Mrrcw9AZzvM2hSYua5OKrEwRVttlIJcKp1M6z4Ogmtm/NmevO/wKO29VhJ
	 ES0f/WRRen9Z1EHk90qjCWvTgtH7cZR1/qN4J2GLGuXeadbmc/cONbvEhaLS6WB6RExdf
	 laU3OPMNKP9CtuiDTNMg7cOv3jBh0c1nAdj/WabqYRqVwEbDVG2RRz6JxLscP5udcTDp5
	 bwdvf/fLOCXv8vvgu9s18XR7dqeDwpLeUKhMsmWtwP3LylFLdOuFaCNkGa5H1wdmcSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
	b=Faq6HV78TlB+tQV0fnN5tyPEiHnmllrz3qGjJuljoC/ZTCUKbn+kunUMlhQ+7X9OIUF8
	 +ZvlzxZ2qEAFtna1x28ZE4zG4WJdgSuXjgmCYIhPwjQiPsKU0rFbzMZPZ3HPUIiqJ2gGK
	 BO8qHZ8CPbnAV3HDMMq1vuFfwgQn1pd6vjyXwcobY4UD0uY9M+A5XSzRBExdfAFzZRzQF
	 NxQY8Qz/azvUqsT/7sAxwbYN4bbe2YGufvDlDF0I2RB1F4gyZMPfTIY25epPwSlNkqM9U
	 PoIKZrhM1KYg7NRfhvRU2KEVgTpYoJ97SHYlL6BO+Xv0ORrqQIOHozob020Jokf/YBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vRjqI5/h";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E70606A332
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 05:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E70606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRjqI5/h
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b2382bf051so1661959b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 21:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376613; x=1794981413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=vRjqI5/hclABu2QBc8ugqYu29kWFKF471I54hASrrOmzpvUosM6GGhNNOXKwSf2Rny
         otPaF1vhAv9F+Gqd4sQ7S89YwToXCBeTAZMyk7BQmytpZTRmeOSWnbcbzrwG8URDFd9V
         i0UrPQfxnDQkd0p+x8T2aUS2qMrN/StcvQbd/J3u86cftty1Zi0lSXlqD3cwdjt0bUgu
         KTuprj0iNZlK1UDK153M2wgq55pqMLP7n7agORZIDonftNX3d6AXXOVeudTlwtgAYMLU
         +lOuSsxD8CX/bLnhQAM5vrxT26CX5AGUUaO9sVdE1OxuTIXqEVYqS7C0u1VXNoSMm750
         2pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376613; x=1794981413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=1XqxUon7LFq3CpqS3ZL5E8VyUgsmOjt3GMorbFW1zYd5uHkAM7qxDnJ4Wtf5NCdlZH
         1rAveLRMe+ue477/4GL7OMEnXRGkfeXrxwh7Q+Cd1MzRbtIhTyUL2k/2fg8aSxyO9mi2
         GwHs7mj1LUiOEYUUkESpy8cuPaD+jKTHXJl5wxqcmpHOcKArieeeAQ8c3mpBMiP7595a
         GRGb//PQ8I0gL9Vn4JDsn5JbHC5b5eOdgyCXEXzCKN0yvYen8m66iqra0ibLF1n2gETY
         nrjwvFbTzJZ+q8bLZoKQ5qxrJf2hVuV05j+muv3r3drPzsBL8e5nZDiztrh//hRlq2gb
         I2gg==
X-Forwarded-Encrypted: i=1; AL+hErE1y4VnvYfRA476i3/o1gDXPo9Zk6lUAyy9NXhdLkNlpzDjrrJoHK5Kmrkb7VYJMz6yHP+prE9a58E=@vger.kernel.org
X-Gm-Message-State: APuU4Z90H0kLotXW2xgKIg+r1FA/+HqyttQhAmhXX5xVo+bcDmK4pZu4
	xLugFmk1ev0iRFCCBUihV2d23K2inqBDxUaYbLyR5X7iJ6891r7aWr3T
X-Gm-Gg: AYBFou1RTQDQ7DeNjoTzEmzSDn6Tl4a2CpCqKESyUx4jZ8wyAXMI+t9J/Inf2BkRXin
	5rPY+9MEiJimXTBy3UvUBRcmvxX2LKs11nkTfvMRv9CSmJZUr2ciBqaKzkYyrEQDaDcMzd50CPH
	4xOHkeRnk7h3FjxPO4Ampwm08TlDmANMhK5eRuw9Ln7Zj1vCPRyr/qhHx9RnSO3BnrPQPW9GQtS
	idwL5TbiY0k+aklqi6L78Y3Zf5Wh9AZHUWEG48Ic39hdCBGFgDNpHFDxxMYbAnexfbAUFWJs3nB
	unv11S8wAoQ7HQrorpm2qLARb7/QAvkbLbPEOhN0ql5+4Wan9PE4w0bHHMs4JWYuFQkAlXuJbt+
	9dMDbkieA7H+siQ/S/gV+1hq60xOe1n1NhspPY46uL2nHngjl+RlWcpRQcAptRlPxKARjlnGunx
	48ka2YhxagVGTbirSjcWKwo7ZcabAzNNij+xeDTqOt83cQdUUD98NKcAdK9AuB14VIZnbvwx4Du
	KCKUgIzncJ+/kgCfGxhW8Mo60NQm1Bpc4/cH4oXu8yONvuTbz47uGinpxmIs+G3QX573KDNUlHe
	OmF6z0vPr2rsFt8LZ86643YOVkM=
X-Received: by 2002:a05:6a21:648a:b0:3e2:1656:b7c7 with SMTP id adf61e73a8af0-3f2fe3d46dbmr1571001637.58.1794376612581;
        Tue, 10 Nov 2026 21:56:52 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d695905sm1393894a12.11.2026.11.10.21.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 21:56:51 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] usb: dwc2: gadget: honor pullup requests in core_connect
Date: Wed, 11 Nov 2026 13:56:16 +0800
Message-ID: <20261111055628.183891-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111055628.183891-1-inochiama@gmail.com>
References: <20261111055628.183891-1-inochiama@gmail.com>
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

The connector ID work initializes the peripheral controller and calls
dwc2_hsotg_core_connect() even when no gadget driver has requested a
connection. After a host-to-device role change, this clears SFTDISCON
and lets the host enumerate an unconfigured gadget.

Check enabled in the connection helper. So the device will keep
disconnect until the controller is ready

Fixes: 510ffaa48eac ("usb: dwc2: Initialize the USB core for peripheral mode")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05fff0..5c8e85493289 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3664,7 +3664,8 @@ void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg)
 void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg)
 {
 	/* remove the soft-disconnect and let's go */
-	if (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD))
+	if (hsotg->enabled &&
+	    (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD)))
 		dwc2_clear_bit(hsotg, DCTL, DCTL_SFTDISCON);
 }
 
-- 
2.56.0

