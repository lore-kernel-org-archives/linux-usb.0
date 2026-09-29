Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD587522EE2
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687009; cv=none; b=OR1svV28LkKCXcPyMBmtSCQpWjSDEUyWxBdrEVdSdIZ30zixa+n4UnjYEtLE9Km2gOmV4tmrl8RQdBHpUHzB0SKTYkuedfo1EyFdigxtbatYIpai5Fi1J+iXfYmmZKoiy+OGEx65HsZ773NpYiaLDFf3VsjtK6baOJ+YIyBydrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687009; c=relaxed/simple;
	bh=IAYH+IaTox1P8zI77W8XVFbna4pbqnPAASvwPqSKLDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iEsIspWbazmH4j1PVqgsecIdJDVv7QFQdnn8SrBSaQFeh30Q7FZmTOnPOol3MjqLD+X+kMQj63byiXOovA9FQ9CFVxiP2bLg+A2gwun2pB21tESIYBIDsmjABMrVKVbvALerRTaIVKNMe3c/WhgIQ1o+TjdGHb5TP2EkbBc0fRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cxjejo5f; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cxjejo5f"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-88582e2153eso527351b3a.2
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687007; x=1791291807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fSdwgUrr0/1ZCcUnfZQZEK8ye+ZadlMRbe2X+DY5a2s=;
        b=Cxjejo5f8ak2HLUYd4eMPlxREjWgSETlljTeL1xRFqh6AIRmGeLUmK//mlOjj8NuHc
         bjInY2kb6+3mJPSQSH9fv7/npV+ICYNum6AdEzKe/GRLmA8Of8iaTSeYnCV7D+cKQ0iL
         ikHlk6ROQMPXm8VbmmP68UBlN8pHEwFvzLQjhQsCro2ClcMAifIb+j7XfTSmgiXhkWDS
         Dui5HO64bPLArW+1levIISw7YHoKvSnrLjgoWp6KnO+t5VUXgNGxVgKJRLDEHPlgEDrI
         DVVu5cXrPLfV1aQaY4wpZou7/UMYsmRGhFCGdVhXAJ7p8OflhzYq+nNAnGutKTwX+z9x
         wR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687007; x=1791291807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSdwgUrr0/1ZCcUnfZQZEK8ye+ZadlMRbe2X+DY5a2s=;
        b=Zr5F3acelCTXCPWqKQbT7ghEotRf8Tk2l8FGPTE40YCx+4Yo6UPTXvrcGZiSukGbXy
         13rcLlDUk6utZHYhaAWVTJ9Smul7y8kR+yUL7OlpR6yhMvO4iODfFm1VbbEUNEkJ+VMK
         EypuJwzrkVv10A9lOkMwLZDqH9/jFF1ZULvw4tALXRgrl1FB0X6MOmHuqVm4BAC7rG8B
         8wG9zIf40Wm0+1UOn26jo3zJShJZm5UDc+CoedACN434uyv5GqC4lnyO2gCCRhCU9ZH8
         YSegpQuPdHMmGlX5WiM/E9IiI/e+tKr3HS7tkY5ee6TF+bIp6xuOwWuQcGACm1CWUAcm
         FQAw==
X-Forwarded-Encrypted: i=1; AKwUvBznoEu5mCquUYwp4teMlkdIJ4B2y8UFCDF+r7qiRFgU/a259oO8eAXtTb0SgOjo+YhfpeQ3/kvCLKo=@vger.kernel.org
X-Gm-Message-State: AFuF++nG/fvencoxlW3PTBXkZxBkjUhXIokJtXX+qpAzwqUTwnUkCVto
	FDzno3x9Q1X3yzBWpBOL35/H9o4YnUJPrxI7Q8/ddFZOnqqSp85Ya/47GMVMX2s4
X-Gm-Gg: AYBFou05VMcQ0pg01UoJKD/nd26PUI+BsHdfiSUHFaRkEFLLrLXGgGVbkm1yz6EUX/A
	lJ+g5DK/wdtA/totySV7OMzbnb/j7jC7NeTkKSo9MVYIpZ60Xi5yQ3QtZbELjGjcm4SobVCUW2M
	Aao87DZaMozYtfpLPSW+/OCuVTq0i+GNP0gPftCORePgmKtSizDA1h8Q8D+m95ir3Dlq0tPRMsE
	uQ6gYqNbGMOU/UcB+JcNqxiDl0uF8HYEYVQaCSODBuIyPglmo6jT3mSbaR+D7UD2UU5h50zgqyg
	K2xp/P2HpHrYfyv7Nax+rBGQv9UdnTqz8Uc4ScyLQM9/jrXE5EV5deDB3AUVcrGXkx+cLH55akR
	n4SqPS3lUh0k7FtMnIIUliILkM5HOJIOwrxHqChvklaICu+rEm0m3a4DZn0FzjdiXR2W3S5o6BT
	oMzCJyPpECFEEWDeWU987HVwpgrgqfTv0K9ekR2sZFm9NFfnILTIiZwmrgabDsHTJsucdYjff8h
	g4RplV7xOBjtg==
X-Received: by 2002:a05:6a00:c30c:10b0:880:5fe5:a81f with SMTP id d2e1a72fcca58-8805fe5ae2dmr6746460b3a.11.1790687006766;
        Tue, 29 Sep 2026 06:03:26 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e106710fsm839306b3a.17.2026.09.29.06.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:03:26 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joonhoe Kim <26rote@gmail.com>
Subject: [PATCH] usb: dwc3: tell xHCI that it lost its state when the core is powered off
Date: Tue, 29 Sep 2026 22:02:52 +0900
Message-ID: <20260929130252.869-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In host mode, dwc3_suspend_common() powers the core off for system
suspend (dwc3_core_exit()) when the controller may not wake the system
or needs a full re-init. The xHCI registers and the state saved with
the Controller Save State command are gone then, but nothing tells
xhci-plat: xhci_resume() takes the "state intact" path, writes the
saved registers back and asks the controller to restore its state
(CRS).

xhci-plat has a flag for exactly this, power_lost (commit 668cc6bc1178
("usb: host: xhci-plat: allow upper layers to signal power loss"), used
by cdns3), but dwc3 never sets it.

On a Lenovo TB323FU (SM8850, DWC3 + eUSB2 PHY) with a USB 2.0 hub, a
USB 3 flash drive and a Billboard device attached, and USB wakeup
disabled, s2idle then broke the host controller on resume: either the
controller wrote to an address that was not mapped

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

Remember that the core was powered off and hand it to xhci-plat as
power_lost from a resume_quirk, so that xhci_resume() resets the
controller and the devices are re-enumerated. Unlike a static
XHCI_RESET_ON_RESUME this only applies to the resumes that follow a
power-off; resumes with the core kept powered (wakeup enabled) and
runtime resume keep the restore path.

Same kernel and setup, 30 s RTC s2idle, wakeup disabled: without this
change 1/1 cycles lost the controller, with it 3/3 cycles kept all
devices. Only tested on this device.

Fixes: c4a5153e87fd ("usb: dwc3: core: Power-off core/PHYs on system_suspend in host mode")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
host.c now includes ../host/xhci.h (for hcd_to_xhci_priv()) in place
of the three xHCI headers it used, as cdns3's host.c does.

 drivers/usb/dwc3/core.c |  2 ++
 drivers/usb/dwc3/core.h |  3 +++
 drivers/usb/dwc3/host.c | 20 +++++++++++++++++---
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index fd5c2cd36c59..b5490b9a8474 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2572,8 +2572,10 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
 		if (!PMSG_IS_AUTO(msg) &&
 		    (!device_may_wakeup(dwc->dev) || dwc->needs_full_reinit)) {
 			dwc3_core_exit(dwc);
+			dwc->xhci_power_lost = 1;
 			break;
 		}
+		dwc->xhci_power_lost = 0;
 
 		/* Let controller to suspend HSPHY before PHY driver suspends */
 		if (dwc->dis_u2_susphy_quirk ||
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..1aa898b343e6 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1172,6 +1172,8 @@ struct dwc3_glue_ops {
  * @suspended: set to track suspend event due to U3/L2.
  * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL_SUSPHY
  *		  before PM suspend.
+ * @xhci_power_lost: the core was powered off for system suspend in host
+ *		     mode; xHCI must not try to restore its state on resume
  * @imod_interval: set the interrupt moderation interval in 250ns
  *			increments or 0 to disable.
  * @max_cfg_eps: current max number of IN eps used across all USB configs.
@@ -1420,6 +1422,7 @@ struct dwc3 {
 	unsigned		wakeup_configured:1;
 	unsigned		suspended:1;
 	unsigned		susphy_state:1;
+	unsigned		xhci_power_lost:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..c7143a8e3e32 100644
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
 
@@ -78,7 +76,23 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
 	dwc3_enable_susphy(dwc, true);
 }
 
+/*
+ * dwc3_suspend_common() powers the core off for system suspend in host mode
+ * when the controller may not wake the system. The xHCI registers and its
+ * saved internal state are gone then: tell xhci-plat, so that xhci_resume()
+ * resets the controller instead of restoring registers and asking it to
+ * restore a state it no longer has.
+ */
+static int dwc3_xhci_resume_quirk(struct usb_hcd *hcd)
+{
+	struct dwc3 *dwc = dev_get_drvdata(hcd->self.controller->parent);
+
+	hcd_to_xhci_priv(hcd)->power_lost = dwc->xhci_power_lost;
+	return 0;
+}
+
 static const struct xhci_plat_priv dwc3_xhci_plat_quirk = {
+	.resume_quirk = dwc3_xhci_resume_quirk,
 	.plat_start = dwc3_xhci_plat_start,
 };
 

base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
-- 
2.43.0

