Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483654;
	b=4/dXooaL9SzH7Ysas/OAoA4Dblnn6RgPWJCm294o8V6FY16PRK7ot22aAHz9eio88CrP
	 HjMChJWa6aQP/ozH6VmcUl3/xhQcZ79kkZUkvdWEM4zYFr7JTbP2NNeLnXRgKsMmQWdKo
	 I0q5Tjxqlz4D+5t47nsuSIdcVpBjkLvw50ZQpnhjipcuWnZmW+oFBPZiXciJXgp5RlxS2
	 FyWj7SIKYU/JK3tROWGzVMLewDXJELry0/BQ8J+kItU85c9tBvQUpOdYryswFGuY4NJ62
	 fjJRoU32e6HH8IahJr6+FBGrDrb9EQ2zX6Eg/yvBeEU3hrjkpHpobgw599O2mlHBg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=psP075VygiyE+jYbsmS7+nA19joCBiTDNicdts2qbwE=;
	b=rrHuaaW4yuaZURYOyOosUbfOds2Z3jn4xSQmVTpIraqx+CpQALgYLQ8vDYSQN1gFwCTI
	 OgtmIVFf1k3QmIuSaPGvGAZL+9cOm2SzJnmWucz6RPgntTriYDydmoa05fwfGIDWudvOr
	 tYFv2/BLwbI92zK0bPbdfMVtfR/qtYj4H7irOkaiocoxJYjZsnb6ZK+L2o209eNjgQpfd
	 o3JIZWhkfUV0fCRfh0y5fRVwHD628FFnq7FB38/Klv240i3z23CRHBbjqI5Gsk+iwp8m9
	 9ME+KFGBLG7D0xtZByoprlFfTXBT8N9N/F5ycPH3J5/ZZWJRqKEP6JW9cFInQBilRYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpBRyLbh;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E4606A32A
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B8E4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpBRyLbh
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a3c08d6928so6881579c88.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 03:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483653; x=1795088453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psP075VygiyE+jYbsmS7+nA19joCBiTDNicdts2qbwE=;
        b=PpBRyLbhIi7Zg7x8s39UMu/YZ1Aiw+0WJDI6fbjzlQUHKim13duSFy1VzO8FJKaCPh
         nOFwcq13+61kBK/jSEjYOpCCKOwen1vVN6yVwxipOMz6mpmHxShrAyPEZxGQVSgxE03k
         UVlIZd8z97IYtineF/S7LnMcl/558wv8W+QsZZ7GH1w3llRkkINHTM+zdS493WMY1aJT
         W5lXoxYrGb4PNCYPLTehB8J9BPg4UwBdqTYlGTvnOv3UngjD1Qv79BhLCDf+5ZJND+oh
         mbY4cfrAUFDXLo1rPEvBpfoIbqqVv+4McvEAV15pJ8BLyAVK84Iy5i4HCxWf9AMOYupg
         voBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483653; x=1795088453;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psP075VygiyE+jYbsmS7+nA19joCBiTDNicdts2qbwE=;
        b=nRByIFWgThbAyXkZTqVNbD5a9KNkP1qn9+jpqz0HyYAc4JZEjxGaVNxkWnKSKciG6m
         dKVyDluVbYdInYWXhplQ7p7DUJ2EIsKTg6CJBiETNYWrJrRJ+lLKtZG/88oLz2BItRxX
         3ZJUFY89kMBfvVcxFq3Uw8gwin5KQJ11EY4poPtpdkRSa4Mz/1gn4pSo1hRob+7VmSCe
         KjCM1sQbX9O3OfGmyRrRZyYC++SdG+VDAZi6DBjrqhJn8QdG0IYgQ9QIBjI6mARSl+QK
         3U2cUPjp3y6Ya4p1Dg2uzzBMzOx8uxyr66iuHs3ufnI3ihGIH2R3hZtfHwS0hjjmdLzp
         eNBA==
X-Forwarded-Encrypted: i=1; AL+hErFtieX6tw7d498JguVjUPCePFRG9KzY+D7A1O43UlpEyKAG1tjhQRYFt7eEm6MBvi/BpXM1qWmWQfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gMDAHc1PR6Zet8ZqeUKyQCxbXdJsdVKkE9TPs7ifTJ1g7fHdM
	ULH5D9hsAqDh6cvzzx6auEyaiWydHxlsDCykB369peOeFq7XDU2wo9xDIkY18KO2Ck8=
X-Gm-Gg: AYBFou0kqf1XF0zevQxA1q1VhRjc2hce0VBwUC2XTxXQZ6nMdO69YcRpsn57VySCXld
	Z0azhdPgDcFmBg8QUZtwAtx2HKuQukXc4zp8dolvpL5jWIXO9NvMGlz5WG9V3+xfRR6ICSeROAt
	mNgg+DBX/8ywEWCCKMoomUpDVrnDgZZRub0OTeaZMLaF8hojZU7ayLWDxYytZrgJGXucxfX37yc
	PgHrww7ymLYgFOwvlcBT2zmMZvm+hdaFcDykPl9VHuK6NOrDJpj2f+QhsUP8N/fBkULfTcoW90S
	tzFGZ7ntlFwpCyNT8LsMmEH2eN0sLoUd6NCHRWR0cQM5uSwn+rTp0IGvKIk5xcdgiY5ji8VNDNX
	55M6mqSiwRhZuKu8EKEP4Nj700sBaA+UMEP1sFjRWSHNnAC2H+AwzH4E5C51jxo1Z7Rx5R43y8Y
	EwJj8h5ifyxX4ERJrY0A/n5gf3GGv6dFD2WerpJehe/HHnMMD3+rX8Oh6vJ7VRd7s4dTIEbEEGO
	St0I8UCXEdoBUBDqFBWs/0SJ7QwiZ4tXENrf9e99t6HOqf6e6QRj+Phe+bOdgo1DkOi77wWQ+ab
	msRE6xEs42KozSXR07FyaF9vqPt+NLFKvPwEFbP/mRGXeBnLbOB6oxLOe4Pi2TA=
X-Received: by 2002:a05:7022:3c03:b0:195:76af:b810 with SMTP id a92af1059eb24-1b3c08751d4mr3887106c88.25.1794483652883;
        Thu, 12 Nov 2026 03:40:52 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm8428478c88.4.2026.11.12.03.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:52 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: Arun Iyengar <aiyengar1990@gmail.com>,
	mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] usb: dwc3: tell xHCI that it lost its state when the core is powered off
Date: Thu, 12 Nov 2026 20:40:53 +0900
Message-ID: <20261112114053.412-1-26rote@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
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
Resend: no replies since 2026-09-29; unchanged, still applies to
next-20261105.

Arun Iyengar's RFC for the Rockchip glue builds on this patch [1].
On an Orange Pi 5 (RK3588S), with the core torn down for
suspend-to-idle, he saw no "xHC error in resume" in 10 of 10 cycles.

[1] https://lore.kernel.org/all/20261112-dwc3-s2idle-optin-v1-0-842e3f8413d0@gmail.com/

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


