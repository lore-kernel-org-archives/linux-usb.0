Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376621;
	b=nAc4+ndFtj3qHYohZ70LXdzYjq9v15dONzJoCR8r7MD3R2oStZ3PqlACa+D2a0P/I3+N
	 cxWhV/znaN5XS6Rlx2pK1VQTCo/80hO7YT5chGIIVpXMcWm+PCMQVp3jAPrKhbP/voSyJ
	 RGKc/iuCj++5mQrvidWXIuYLp+RfzBIVL/7V3SbmAJ7it10WpIjHj5HiH+k9dG8+RUAZs
	 5knqpV1THpcvtxysE1KEGYEJU4GRx3+M8UhAP2ehJkE+YDBoOpWIqBmMKOfpvScBWeoZe
	 Flt1HPnAq/ZxEcKHTxf3w57wBTvq8R0UFd0Uw3z+2Y7OoWzzboQK2VwNqbO5ujs7aJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wit1oMqBgUZguWTeUkrhLstN01zhTlUg8QuqFOi5XKw=;
	b=wHCsFHdS5NSC2wrjbsq8zblIHmdRAlHQ5oH5N+QGd0M1dcT7E8t1/XvPiD0Ndcg4j6ay
	 NlSQ/4Nhrcwdv0A2Epr/3E41JjRon88/+uXnKkIytsWndtVwoZuvsX7SUm9ZhcmrGWSj7
	 evDZt9/c2gb9+97uEf44kf4dZ3m1j6rtc8hb/HSjlOUOQY5QJfY/0GqcLf0T2l7RjMEOn
	 B7DoUdEcgaQ+XcR1UXVLCzBh121dn29CYpKbw5ibI8aghzh1e9XJ5tilPx4NWQ3BGsdBJ
	 jQ0AG2+J2Yik6Qbdq9pyROrwCqYhVRCsTAyt/MwhP5dqhbCIHbkzRaKlVsCudAkc3aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAqQBKoA;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26760606A32D
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 05:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26760606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAqQBKoA
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e95bd1c14cso25639145ad.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 21:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376619; x=1794981419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wit1oMqBgUZguWTeUkrhLstN01zhTlUg8QuqFOi5XKw=;
        b=MAqQBKoAzm4JhwG+TDVdZv8i0x9xYsPLOzX3jV6yyEyoyLS5iG53kvKl3h4OswOhV3
         7EEyMgPuLC7VuF7/2/mPD1UW84hAqEElY79LYbQXeB0Cu1yR3t9vgfPzBPy6KvviuCyj
         hrWV/sTfjkIijX6Thg+yCPWR8YvYePeAqbcFSSBmYU132nq9vVJCHrq3rNAeVFzUnMZo
         lQ4/UtMmNBNVo/X03Fyt6Zd9RCsI++x6h27k4K8euqd2YrbhC0AZ1J/O1vaIAHjwtcm9
         x2DG7hYSL4M6VutREIokUaVdoZminmHlafQWRr+MNRc41jjSXOINAqP968yoWlCTDBdL
         OAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376619; x=1794981419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wit1oMqBgUZguWTeUkrhLstN01zhTlUg8QuqFOi5XKw=;
        b=IBLQ5tJgFTpt/SUOqK7GKv3pRGJBeJUBftBlycI6QpC8/HQFRqyhDnNXSjAwzcJkgU
         lYD7OWeh+ECSDxIjnyiIlTOiplf04Y2mKThzMnJHx5StF0DkfQoQHWM0Hz/a2uDnL0jd
         Cp61e5zqOn4llS6TiTSHwvB7zKHOB2REjAe8XJsuXElhGcZATfMtnktdQVx6l+4K+E1y
         XwTADMKnE4YqQL5bf0bQ6Z5cUikR/jXpmzCptn7wUe5/Z4tVLsMmzb49NOgJ8jvyeKGT
         dxcn3F/mmo1G0l4+dlYVf43c9Y6Mb37z1aL2aisp238/lE9GTNCSifwuul9MuaDGCooE
         DiDg==
X-Forwarded-Encrypted: i=1; AL+hErFaM3W11hm+86ZJTF7G39MoWkXjD6ZjYNnwCLRhZ69CFF30u98+HRPc9AcRKkddqyepaArszDlcl/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/HOlfsMzCFgjXmVky89ZE1aNyoMrclryclex/ryIX0rNT8k0M
	BKhsZGThYwqdpBl+qMI9WhIUqSAH7jWEu+5ae9XsX8zDBJO2BTcBbMfI
X-Gm-Gg: AYBFou218IJfK3lrChTg5i9SRYmkR5b5KyObDbE5WkAPT6xNaC3HQrAIIXFJfSgocfv
	gH/T6Z39ywOv7szdmjM2vFK9tk7/Mi9QhFkZl8lO3t/ApKUH1745Yy6GA+HOqBkq050A0nMOw8B
	3HOvl10soWCsm5wbwFXBJP0MHvyLn3b3oMzjHcq0z4tZUyjfCe+Bw0qSjnzXM/NvjmKwTKYZ2gV
	b+J9KtK5U1eEKZxqCiNy3I8ppuNySru1knrFmbO5r1LuhDSSQ+k7os+V6BKh1jnRKuSd7KC5ab9
	svTOiGRj028Vf8sLpKA3X5Zofo7y/5jZW8NY/3QpQEwBawCIngUjD0zvQ2whUoLUxV1JFjVMqm5
	36xUfPKgllL/1bRx1eUNx7CgU5ycFCw8Pc2CdmgFSwx0DuzUwT8jBQldFqzyXtxCdflJZrnzbe8
	4mCRPlLzuuQJobX/KTLTEg2dJmnP5LMfNUA1sBFEZi5RvUqlNoW67Ij26BWey2dp1sXjVOTMTqj
	mRqSnJ9syt1Tpnwjl3JWxoLCD9zbikzZmz0WUWeAJrJTwo94yzt0PgxumsboYfClS18Q0m5iBr0
	i5EdU57jjgH1V7rKdGIfBzjcOVM=
X-Received: by 2002:a17:903:1a4d:b0:2e9:4175:3079 with SMTP id d9443c01a7336-2edd775fea4mr18178705ad.21.1794376619395;
        Tue, 10 Nov 2026 21:56:59 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a43768sm17021535ad.6.2026.11.10.21.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 21:56:59 -0800 (PST)
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
Subject: [PATCH v2 3/3] usb: dwc2: Add USB DRD support on CV1800 series SoC
Date: Wed, 11 Nov 2026 13:56:18 +0800
Message-ID: <20261111055628.183891-4-inochiama@gmail.com>
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

On CV1800 series SoC, it has a problem that it enters the role switch
with a persistent Session End Detected interrupt. As a result, GOTGINT
bit 2 remains set after write-one-to-clear accesses and prevents a
normal boot.

Keeping the BVALID override asserted in host mode avoids the observed
interrupt storm while allowing host enumeration and device operation.
As the BVALOVAL field is device only in the datasheet, this change is
added as a quirk.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/core.h   |  3 +++
 drivers/usb/dwc2/drd.c    | 29 +++++++++++++++++++++--------
 drivers/usb/dwc2/params.c |  1 +
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 298b418e6859..52ac64f67f41 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -357,6 +357,8 @@ enum dwc2_ep0_state {
  *                      case.
  *                      0 - No (default)
  *                      1 - Yes
+ * @force_bvalid_in_host: Set the BVALID override value to 1 in host mode to
+ *                       avoid persistent Session End Detected interrupts.
  * @power_down:         Specifies whether the controller support power_down.
  *			If power_down is enabled, the controller will enter
  *			power_down in both peripheral and host mode when
@@ -460,6 +462,7 @@ struct dwc2_core_params {
 	bool reload_ctl;
 	bool uframe_sched;
 	bool external_id_pin_ctl;
+	bool force_bvalid_in_host;
 
 	int power_down;
 #define DWC2_POWER_DOWN_PARAM_NONE		0
diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 3dc194657e82..3df63c0b88d8 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -28,10 +28,13 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
 	gotgctl = dwc2_readl(hsotg, GOTGCTL);
 	dwc2_ovr_gotgctl(gotgctl);
 	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
-	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
+	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+	} else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL) {
 		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
@@ -45,18 +48,26 @@ static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if A-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_ASESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_ASESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_host_mode(hsotg) && (gotgctl & GOTGCTL_BVALOVAL) &&
+	       (gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
 		return -EALREADY;
 
 	/* Always enable overrides to handle the resume case */
 	dwc2_ovr_gotgctl(gotgctl);
 
-	gotgctl &= ~GOTGCTL_BVALOVAL;
-	if (valid)
+	if (valid) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else
-		gotgctl &= ~(GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+		else
+			gotgctl &= ~GOTGCTL_BVALOVAL;
+	} else {
+		gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL |
+			     GOTGCTL_VBVALOVAL);
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	return 0;
@@ -67,7 +78,9 @@ static int dwc2_ovr_bvalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if B-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_BSESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_BSESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_device_mode(hsotg) && !(gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_BSESVLD)))
 		return -EALREADY;
 
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 091bfcfef753..16db9c3c1991 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -222,6 +222,7 @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
 
+	p->force_bvalid_in_host = true;
 	p->otg_caps.hnp_support = false;
 	p->otg_caps.srp_support = false;
 	p->host_dma = false;
-- 
2.56.0

