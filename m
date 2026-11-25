Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630283;
	b=2b7W3sZREccqvnyx632JzNQbATVHaz0hobMD6mVrZETFfQaTBjiRLJe7xTCsl51/qygT
	 8OHMpWx2+zZpE8uwSMY/5P7bpLzsc/jhMnVwXhxCbIhERJZuxNo5PaL3LzioWZzyho1yU
	 njIFZlWf+PGuyveSr9MoxM6DT5q8d0Ux46emOCJU2CRVRtoUoJZuM5I/FiW8HN/L1PpCN
	 k/EBQm4XKfOuLIjyxLkYT52WGu/S2YXDM1KlMbw949wci5ZH9gNxaOx09lQJo6CKP8+UN
	 SzWWbnpvGw7JvX9mYbldHupiBG+0HkvpAVe+8ojrvrvRN2TPI5y/9i2uPhNdPb/GXWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=clm7bwFO88Id836QUNrg2tu/p/zHm8L/3QNnlwp6L6o=;
	b=Tij4DXvWCS/asOWTB25ywAddpg0PQgi3D3jnoDizH7uKnE9wHYsWGF4r7p2HGL0RM3YU
	 uJJqgdSbhHT3nkM//QWgo182sNsHmPL8DUT0Bvz1Jou/fDbJA0y27x3Te9zi339KCebkB
	 lTcO3MX0ItICFLcKGStOWEi9PuW1zY8EsrxfJxiwDtdTO5V9h1ojym2o7Y4Uc+K6+1Qu9
	 haaVg/DLyJzaCddg6A7ajop3zuB5hqFh+qqZJCwG/wwrMwuENzTpOSnyuHhGVK8wjYzB0
	 r2NyFhwkHcf1sxE51Jg4dfScVkRRwIpGK0p0xp3LbQUhijkTVQANDNcsKcov4KBoCLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4hOoaxc;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C67606A686
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 18:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5C67606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4hOoaxc
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386cf1041cdso1957877eec.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630281; x=1796235081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=clm7bwFO88Id836QUNrg2tu/p/zHm8L/3QNnlwp6L6o=;
        b=n4hOoaxcxW1l1mGaEW5zL+ZF0JLabEWqwn/4f4IArB1SEQwE4rhel+b0mID7pfFGIg
         p+eD4O21MA8JE+HcVAWjFCbEh6lyUIfF53nW/fVVS606Hu4H5Sts3JS1yNOVs9kcDuzM
         JzMeaOOb9O0VlegsDQT91P/VmmXPzc02n9Sv4U2vhZXB6Nd72fkV4/ShmqaDxklNoCKO
         CElXIbHPJz8Bqu+bQ309uJv83wV5AZBk9gLIv52/JErHhuIsFXlI3WaDNrSlbRUCYZ9X
         nusfI92IHoKmHEAGFb7c94YMgPYahj7qyYtA3dlSEZyThpEI/zp1r0TD7O/tdQHo4693
         sx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630281; x=1796235081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clm7bwFO88Id836QUNrg2tu/p/zHm8L/3QNnlwp6L6o=;
        b=EdUgxCUVraudLfwDCUYbEx3xoImFGZXc5y2ZmC9FcoW0MTkMbxN1wY0ncEWbmVqcVN
         hU0IUm2lYOmLEACAAKFoPPsF08qgS3PKnktIR6Piu7tIoJKY7Z8mi5vT0MuV6YARhrNc
         fbBuxQvWyPOCQRcj/Tmeg/aVJGPtuXFXn2FHNk6xz64ZoKdsMPJsJ46k5sLVGigxlt3q
         URFrAxHP1ky4QT7Vmq3EHO951ALAJ01UwdZfZh8ZcLv8Ra0KgiQERgEL7JrAAmftr6NU
         o3IW1u9iSlIyRazn2McaTmnEyxlg9fPwkOQ8V0uZ2eQyLR0PJ70rPCwrRuSXKugNUBTH
         Qjfg==
X-Forwarded-Encrypted: i=1; AL+hErElsQ9WNY6Gu3B2KFu4jOVZNfdIu+FhCPPb0ZHj9YFdulfH96XZvPPuCnQTedp1Gk+nggY3yulhibM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q5M6588G2ae/nNLfE5rAncakCFbjtFinjWP7tCpfAaund8QBH
	uDVnRXc4/+/eNnW+RBTevYwQXG0x06yPeA3jX9Mg4Q99RXTZnRp8R/y9
X-Gm-Gg: AZFdTZdDWfH8eWP19leSPgyXe4O+GRqIzTjGGtoKULwQkPxR0v2Mex9/01760dt4dEd
	hwzUPPKI0uY0pDUAo6qMpOd61HkYeZKSfNv6w86r+gdES/ZYuJ40jog3l0z1dWfUXcR2h1VD8Jf
	O3CcC0BDkhT4015d+HzqP2dnTn4YPyHy8hmEbdBGBSRVg+w635MQj99ciLkT8/SQtwD0IBwIkjt
	oiAAEtBBP77OeHWtNnFATZAdcoDjWbqieC7MGOjy1nXwV2mfAiDprDObk5qzO214OGdScAxwtEU
	lIkppUZp6vyi+V07H82DMJ+DAO3nXCJ3dP4UdBBWASuLxUcXMn0GzKomtspUuUYWptuE16IX0pO
	TKw542x8mGm32wCgUCr8J4vzFIf16GDedorJ0Xl2CR+U2mWDd/+noYMI2+jcMwcMtd7RmBQa91x
	eh50fsl2xJ52OxYNsN26XKdH9arYyfG/JebuEcqs7u0L8wfqoC/o3GBEsYGDs72Svp33plZLV6Q
	j7kX2leqiyf3SrmQeNeaTUGBmDAH67UXgmfnewAJE+a9iu7w+c16RQwrVY80JiJfoRoJr8t8dey
	ZExVZqD4xWxUhTG69TmnXIt0d2U8DEQgK5l2JA==
X-Received: by 2002:a05:7301:714:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-3856fd5e4a4mr19351158eec.24.1795630280795;
        Wed, 25 Nov 2026 10:11:20 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8549:f8b6:d936:b4fc:15f9:5ee6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm49229984eec.8.2026.11.25.10.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:11:20 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: aiyengar1990@gmail.com,
	mathias.nyman@intel.com,
	xu.yang_2@oss.nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: dwc3: tell xHCI that it lost its state when the core is powered off
Date: Thu, 26 Nov 2026 03:11:16 +0900
Message-ID: <20261125181116.121-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

dwc3_suspend_common() powers the core off for system suspend
(dwc3_core_exit()) in OTG mode (DWC3_GCTL_PRTCAP_OTG), and in host mode
when the controller may not wake the system or needs a full re-init. The
xHCI registers and the state saved with the Controller Save State
command are gone then, but nothing tells xhci-plat: xhci_resume() takes
the "state intact" path, writes the saved registers back and asks the
controller to restore its state (CRS).

xhci-plat has a flag for exactly this, power_lost (commit 668cc6bc1178
("usb: host: xhci-plat: allow upper layers to signal power loss"), used
by cdns3), but dwc3 never sets it.

On a Lenovo Y700 Gen 5 (TB323FU, SM8850; DWC3 + eUSB2 PHY) with a USB
2.0 hub, a USB 3 flash drive and a Billboard device attached, and USB
wakeup disabled, s2idle then broke the host controller on resume: either
the controller wrote to an address that was not mapped

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
    iova=0xd85e7c300, fsynr=0x3d0011, cbfrsynra=0x40, cb=13
  xhci-hcd xhci-hcd.2.auto: WARNING: Host System Error
  usb 1-1: hub failed to enable device, error -108

or its command ring would not stop

  xhci-hcd xhci-hcd.2.auto: Abort failed to stop command ring: -110
  xhci-hcd xhci-hcd.2.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.2.auto: HC died; cleaning up
  usb 1-1: PM: **** DPM device timeout ****
  Kernel panic - not syncing: usb 1-1: unrecoverable failure

With wakeup enabled (the core stays powered) the same setup survived
every cycle.

Record that the core was powered off and pass this to xhci-plat as
power_lost from a resume_quirk, so that xhci_resume() resets the
controller and the devices are re-enumerated. Unlike a static
XHCI_RESET_ON_RESUME this only applies to the resumes that follow a
power-off; resumes with the core kept powered (host mode with wakeup
enabled) and runtime resume keep the restore path. Clear the flag once
xhci-plat has read it, so that a later system suspend that fails before
the dwc3 core is suspended does not reset the controller.

Fixes: c4a5153e87fd ("usb: dwc3: core: Power-off core/PHYs on system_suspend in host mode")
Fixes: f09cc79b4b33 ("usb: dwc3: add dual role support using OTG block")
Cc: stable@vger.kernel.org # 6.15.x
Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v3:
- Add Cc: stable (Thinh), for 6.15 and later: xhci-plat got power_lost
  in 6.15 (commit 668cc6bc1178)
- Add Tested-by from Arun and Acked-by from Thinh
- No code changes; still based on next-20261111, applies to usb-next

v2:
- Also set the flag when the core is powered off in OTG mode with the
  host role active (Sashiko [1])
- Clear the flag once xhci-plat has read it (Sashiko [1]), instead of in
  the host branch that keeps the core powered
- Drop the comment above the resume quirk
- Add a Fixes tag for the OTG branch
- Rebased on next-20261111

Testing, 30 s RTC s2idle with wakeup disabled on the setup above:
without this change 1/1 cycles lost the controller; with this version
3/3 cycles reset the controller and re-enumerated all devices.
OTG mode (DWC3_GCTL_PRTCAP_OTG) is not tested; this board switches
roles through usb-role-switch and never uses it.

host.c now includes xhci.h for hcd_to_xhci_priv().

v1: https://lore.kernel.org/all/20260929130252.869-1-26rote@gmail.com/
RESEND: https://lore.kernel.org/all/20261112114053.412-1-26rote@gmail.com/
v2: https://lore.kernel.org/all/20261112141512.1840-1-26rote@gmail.com/
[1] https://lore.kernel.org/all/sashiko-outbox-211064@kernel.org/

 drivers/usb/dwc3/core.c |  3 +++
 drivers/usb/dwc3/core.h |  3 +++
 drivers/usb/dwc3/host.c | 15 ++++++++++++---
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 372737f47..1ddd860e1 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2572,6 +2572,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		if (!PMSG_IS_AUTO(msg) &&
 		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			dwc3_core_exit(dwc);
+			dwc->xhci_power_lost = 1;
 			break;
 		}
 
@@ -2608,6 +2609,8 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 
 		dwc3_otg_exit(dwc);
 		dwc3_core_exit(dwc);
+		if (dwc->current_otg_role == DWC3_OTG_ROLE_HOST)
+			dwc->xhci_power_lost = 1;
 		break;
 	default:
 		/* do nothing */
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 267c922ca..4bc94bb07 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1185,6 +1185,8 @@ struct dwc3_glue_ops {
  * @suspended: set to track suspend event due to U3/L2.
  * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL_SUSPHY
  *		  before PM suspend.
+ * @xhci_power_lost: the core was powered off for system suspend; xHCI
+ *		     must not try to restore its state on resume
  * @imod_interval: set the interrupt moderation interval in 250ns
  *			increments or 0 to disable.
  * @max_cfg_eps: current max number of IN eps used across all USB configs.
@@ -1440,6 +1442,7 @@ struct dwc3 {
 	unsigned		wakeup_configured:1;
 	unsigned		suspended:1;
 	unsigned		susphy_state:1;
+	unsigned		xhci_power_lost:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b..0cb6e64d1 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -14,9 +14,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/bitfield.h>
 
-#include "../host/xhci-port.h"
-#include "../host/xhci-ext-caps.h"
-#include "../host/xhci-caps.h"
+#include "../host/xhci.h"
 #include "../host/xhci-plat.h"
 #include "core.h"
 
@@ -78,7 +76,18 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
 	dwc3_enable_susphy(dwc, true);
 }
 
+static int dwc3_xhci_resume_quirk(struct usb_hcd *hcd)
+{
+	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
+
+	hcd_to_xhci_priv(hcd)->power_lost = dwc->xhci_power_lost;
+	dwc->xhci_power_lost = 0;
+
+	return 0;
+}
+
 static const struct xhci_plat_priv dwc3_xhci_plat_quirk = {
+	.resume_quirk = dwc3_xhci_resume_quirk,
 	.plat_start = dwc3_xhci_plat_start,
 };
 

base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
-- 
2.53.0

