Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842752;
	b=hHc6oqxyBKIrfLzSeOLsg2giSYLSxAd1+xIfYCGcI8R55bOq4OdjuaKTfZCLj3F+xwpI
	 XMACOAnpqEH6sQ1M1+6XoHYslx8vnF7F/DLMwfQfHZzGEqP2p4LS09/8QD6H8j+e69Krn
	 Wb6yYKxJmJdXMElA1Jkpzzn3zt3d7aH3HB4pHVz4GViXxkc/na04BOi5WE0vo01b9Isrk
	 1UlMpf1JIzyhwznPvS6LTPHbftdz0/FAC6FV9LSntu5Ph4TPLdmSv0QTbscPEnGRxh2XE
	 nRhcgocRvscu5sSV4cgBvgyHLbufy+0vb0VHIP6cszkTRxeLYsbtoXtMPyQAwMWFSsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AW0iDiDhPw3HeIJ6Qu71m8tTntH56Z6IEED1Lqi8fUo=;
	b=YKl68mOQCltZ2E4WCEGvDkg7fiP+trJDcmSlAPvSUUyM5Np243ZE3QTjCs4lvc/hCBCb
	 lM2pkm9RSLHOd9OLqj7FaYDIMgNbOtEbbcnFkm6Ou16yuaDBX5nFidUetMWSbvrtfZzYp
	 wFijkfC58Txn2d4X54e9ivInIHervAWPS2FWLYySshkZ51Hf+jAPEAnG3oV4qy597udnF
	 iM9rYDXuBe6QQvLKjrxoZvlUb3nWMN20njux97a2WzE2RUU5lLeNTR7HYx5Ocy6KoTv2S
	 1lpA713gYvPdpaqG6tyis8a2GLHkcKqxwuTiOQZjfnLiDPf3QA118AdHzthdTYmBoqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bBjEvhib;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368BB606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 11:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368BB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bBjEvhib
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-313bab9cfe7so302044eec.3
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842751; x=1793447551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW0iDiDhPw3HeIJ6Qu71m8tTntH56Z6IEED1Lqi8fUo=;
        b=bBjEvhibJdRdn3Noct7rmn3EONm1dVpRAyq95BwvIWi8wdzowrhCah0aG0FUif8gNw
         8OPZpCMhdB6slqTRFJB7kO/5SikM8K/X/pjrKnrTCJuTxbA6DMaPPOuPpGV3epTbvlM2
         GSdAqn7+G+xMgXUImktrF49tZVZJcC8qula4fDXsWxFHuFqr5nyONHYzD5Og2QPWAQyq
         3uNqw5hksdcm/6IcKJylKaffZQkI8QD/7q0igHZ3dd0yZOpvT3DEW+NYWb3mtgfxgrzD
         3KLAjlM7YPht5dor+Ode+Vy9Oo9TTfYhQmiuqELyTAFHtMsB4+cWETcPuSIf2qhI2FQ0
         5c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842751; x=1793447551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW0iDiDhPw3HeIJ6Qu71m8tTntH56Z6IEED1Lqi8fUo=;
        b=iFa8MDemy86hoQUFctBbyS5+00jPPoocBGfWUzSKZsYXMzl7e4GEnBGKS3k6JV3yE0
         c2zLM2iasnXilKk98ZIi1PhBzrWSv6Sai7RUanSb0mu+YV1HKE+DdtnKNTC19Vxln1iF
         bTDYAygiXycMDelD7bXYeyUE/dIwIToqSUHbI5zbt6OuebMMeTTwoevUf5KdjL3we8si
         kkrnP8+4sNq2X7ongbO8SfNsEqXp1cFhJmXnoYGpB+WO5LQzPqpOCOpUU4nOQX8KAd9U
         HpPORfLH1ZREq1CCvCC5ofKVcsVuz8Sw5qiVOD5Y+SWwA41N+25muQRDJ4TBzzlMfg8H
         Yo5A==
X-Forwarded-Encrypted: i=1; AKwUvBxHymYVI71l6rYrIkfvTh87vkAdtKi+Zx/p3tyARqzhvdYyV8dIn7M4tU5MXQfh0P59ozpIun/c01w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfaGGr1HKceJkLg1a257z6NBvDaY9zr1xhXeU9gcAE3oaX+def
	2s7ex6FPWE+oB+FxOgqGkR9DBcZZIRpynZuwbExLwP3+PxR7yNYXLFg5
X-Gm-Gg: AYBFou0EaKmS0PYlTF58k18U2/m3qBvZTrDL8Mwt0GcapJcTiQxjz3eGzNl6BneJ0Zs
	jIC0UTU4qdNiCxhXz8SCj8AkaBc8FVzWAC3l/P6gYpayZYbRWcLbgSLyRkzOuSZjQSx7aTWoznQ
	13EKlNU2ute2D73L5tSGWuMxJsFZh9yenyCcCh9lB+22KTp8RWkPVYYiCVp+0+47Ia6NCJ/pTAz
	f+He+sNOFyBx9b5hH4UsUG5QSVeMzC9s19VJ1swb8Yu2vGMgY7XcgL4tevjMJXyXuo7ypzRzmVk
	ddUhFbHWFGgvzMBcToaA3RC7Nng6ZlF75FAEHAN9SrxAblBUZN4gOBv1Se2VyuPx9u3w/7POdHR
	m5Hs4LSrmhi+gwYBDLkKHo9GVk+WwY1oOJ/UweWvOlXkhP8Bf+ayfTi6WbjXcxZ/oj6EYDSp9Tr
	mEBEfei7kJfpjFyE9Pr1R6Tc1RXGI/XtSDD0FExRlvh2pfkNHkX04t9L0/5SF3Uuesk/tC6a2Gw
	6YN1VLsy+l83Vi3kkQTgPeUqy26LnaNYufRSXkHq4aT/UhZXNV3DvN2Sb2H9AdgnWOjlIz1K50P
	MYIctsPefBfhjRant2MJpgsEltAFmP4BGtwDB7E=
X-Received: by 2002:a05:7022:4582:b0:190:e602:c769 with SMTP id a92af1059eb24-19933e0f4e9mr4773490c88.1.1792842751119;
        Sat, 24 Oct 2026 04:52:31 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ea25sm6367060c88.5.2026.10.24.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:52:30 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] usb: dwc2: Disable gadget descriptor DMA for Sophgo CV18XX/SG200X
Date: Sat, 24 Oct 2026 19:52:20 +0800
Message-ID: <20261024115220.823159-1-chenyou910331@gmail.com>
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

dwc2_set_cv1800_params() disables gadget DMA (g_dma) but leaves
g_dma_desc at its default, which dwc2_set_default_params() takes from
the hardware capability. Descriptor DMA requires g_dma, so
dwc2_check_params() rejects the combination at probe time:

  dwc2 4340000.usb: dwc2_check_params: Invalid parameter g_dma_desc=1

The check then clears g_dma_desc, so the final configuration is
already correct and only the warning is spurious. Disable g_dma_desc
together with g_dma in the platform parameters instead.

The gadget parameters are only set up when dr_mode is "peripheral" or
"otg". All in-tree CV18XX/SG200X boards use "host", which is why this
has gone unnoticed.

Tested on Milk-V Duo 256M (SG2002) with CONFIG_USB_DWC2_DUAL_ROLE=y and
dr_mode = "peripheral": the warning is gone.

Fixes: 63aa7ab955e7 ("usb: dwc2: add support for Sophgo CV18XX/SG200X series SoC")
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 drivers/usb/dwc2/params.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 091bfcfef753..6941705e426d 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -226,6 +226,7 @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
 	p->otg_caps.srp_support = false;
 	p->host_dma = false;
 	p->g_dma = false;
+	p->g_dma_desc = false;
 	p->speed = DWC2_SPEED_PARAM_HIGH;
 	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
 	p->phy_utmi_width = 16;
-- 
2.43.0

