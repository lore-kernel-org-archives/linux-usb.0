Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1817E3D668F
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333918; cv=none; b=CZ6ggUSBjzCKZuv78Dmn0yVXIuo1XdHA9+4ld7BVFN2fRjiO3m/RqnmR7tYSFAvirEDWLwCdVgT1dEvw0OcYzdKuUIgV2OWxpiE8vZRPAW5KpeISG5kjgeRMqIqBtsqC5BJaQ5NwP1xisCfOPKOrbh78DbPx9GxA1rPi7HgiAAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333918; c=relaxed/simple;
	bh=NzNRVwVjsWTD8UVC1actwGWsyViFrlnqg11fylj0BqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=faWzAyPs28Kf+aFjes9rwJz4dtO8TOwFWl9N2icED1/Barc7Qujx3KS1cRrm9V1pR07FpSyD6rvjpgLM+PE97bFBZEj9GOKEHxhNn6hbM0r+X11bXw76g5s+OXAZuxiN2eAQ0TwNaTyFmYrtZoD/kTF11IbmP6zuCWx1cqF50cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCh44ljl; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCh44ljl"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48b0584ad71so785299f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333915; x=1792938715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z4DinWw4y4cul7vchZoeDhjRTd9lXiDvj9Lx77xpfpw=;
        b=iCh44ljl9foPqJFmFdKS+4TuNkz5IRohceZN/58qzCgfoYFv9PfHTqv16BCzAFGDm3
         lGgQgSIy2UJ9wOjWuy0It3ogudT4zGH+JE0AyHPEAokdV7hLwerYodSfyz3KEaUl+cBB
         u4hK7L/z1Usbz4xxh+ymmofBWdQ6BVhplSqPo2wiABCqlOQWOjUzNA4W/nHh5x5nrgbJ
         twoXL9Vw7HtbbqWjS9ZMOZbeoZQHLbIAyn8kHN5kg95xsLW83nXcXaIG/qarHS3iecdO
         6DQ3qkLKKhHXJnh2Y+SjQ0zhJwvLwnbTgreb9ktPgio+Ahu2yeHxoqVBIr876ton6IJe
         XVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333915; x=1792938715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4DinWw4y4cul7vchZoeDhjRTd9lXiDvj9Lx77xpfpw=;
        b=UmbCEqepnewGiMwF6HhKt7ioammpU8z3wok9cn515LH/hGQkPEjwqnSXsAElwzi5WS
         v081hUzgGq4gioboSagvgP2e/OxdCPOsdK0fnxXlTlc/YsS2QL4RQKnDsRzbQMD/9wFV
         5uyeMQ4p+6Y0k9CVlsnskg7btRKDiewxzcXhjiWbIKuO5NkuM410y5O4xFex6uAFDARI
         8a9FwDRXsLw0ovfFmSbAIMb7i5ZDVcYikUE0sCEA0ePDOcgOi99vu+YYJBV+8VKRQw70
         CMk/dhE8M3O/ScTWwQyjJ8zcOqhYA/bTOROqCbKFFsjLU35eMMDIH6ptYRNdiCo5GwVm
         1MdQ==
X-Forwarded-Encrypted: i=1; AKwUvBztOU473jMIGQNqEWey3r2/VFyj+e+Rhss6JUC2QmCPKHtz1kT9OPVPeHGRCu56IfhREy/PZjuOlnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPmNLzOgILHJNGnT1UuaPARIirKfGVYwrGKyoK32ZMCol8vjRi
	bbhgpO1Jere3lJBxvhwhHLLNJq+Sw0hPcAlm2tFMYzeioLbwFYOh/F9XC2VLgEzIfg4=
X-Gm-Gg: AYBFou0V8ZLn0+/PqymN4IKAhOXD8F9nyvi8e4pV2XkTCMw43OLHeHKe3yhsb5KbZJD
	74FQzkOTLcuEBp7kNFyDWUQp0njn3CZHiJZ0w5oEVAP2pLnUuLlEIqVjQYRAgXh74AurC6Hhf2d
	RoPxMHtCLaAiKBDCtyQtOCqma/vx6HqOw8K+mmtMaROQAykJJtYgjTBIi/a7NQabalOw9y53sg4
	wB2Vund/ApgMEcss3RcqbPhYvhLTFll7QlDzJBdO3mVIEbQ3yNXIahGIS4FsoM4unQDSw8/cka4
	/MQs1PJirOMeb5cUB5ZWa3GV4z1Qll7ijOj0LOnsbJAlbT2u7Yzrzl3/j30jMM9GbcsyxaGBPAw
	VOJAldFCu93bPFPMTPKSn/PH8qsc5sraxPfXsBjU9iGNkbaUz4bYhiCx132enVW6xU+lvzohrMD
	SUuhYZzR8NPFaEMknqEzT5S1qe0YeppA4xbW9qTwurL1/uDC5+FIqEh/iP2lJf+UPSt8eyFrnYI
	CsfhseGS933jtHN8YfpaJmrH8nhitf0hOva
X-Received: by 2002:adf:f28a:0:b0:48d:ffe7:e883 with SMTP id ffacd0b85a97d-48e07fab956mr7309333f8f.46.1792333915122;
        Sun, 18 Oct 2026 07:31:55 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a72sm18823645f8f.4.2026.10.18.07.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:31:54 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH] usb: dwc3: qcom: Defer VBUS override update during system suspend
Date: Sun, 18 Oct 2026 17:31:26 +0300
Message-ID: <20261018143126.3978-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwc3_qcom_set_role_notifier() updates the VBUS override in QSCRATCH
synchronously, from the context of the usb_role_switch_set_role()
caller. The glue assumes that role switches only happen from a
freezable workqueue, but that holds for the dwc3 core's mode switch,
not for this notifier: the UCSI connector work, for one, runs on the
non-freezable system workqueue.

On SM8750, when the USB cable is unplugged while the system is in
s2idle, the UCSI connector work for the change runs before the devices
have resumed. It switches the role to USB_ROLE_NONE, and the notifier
accesses QSCRATCH while the glue clocks are still off, before
dwc3_qcom_pm_resume() turns them back on. The access does not complete
and the SoC resets. pm_runtime_resume_and_get() does not prevent this:
runtime PM is disabled at that point and the device is still marked
active, so it returns success without resuming anything.

While the glue is suspended for system sleep, only record the VBUS
override update and apply it from dwc3_qcom_pm_resume() once the
clocks are on. Apply it after the core has resumed, since resuming the
gadget enables the override and the role switch is the more recent
event. Serialize the notifier against system suspend and resume with a
mutex, so that a role switch can't race with the clocks being turned
off.

Fixes: 21188e8d6d75 ("usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend")
Cc: stable@vger.kernel.org
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Tested on SM8750 (OnePlus Pad 3; the board DT is not upstream yet),
v7.3-rc5 plus board patches, with the UCSI connector work still on
system_wq. The test kernel also has local ucsi_glink and qcom_battmgr
changes that make a cable plug or unplug wake the system from s2idle,
similar to Jishnu Prakash's ucsi_glink patch [3]:
- cable unplugged during s2idle: resumed in 2 of 2 runs; without this
  patch the SoC reset in all 6 earlier runs. The switch to
  USB_ROLE_NONE came 14-17 ms after the start of the resume, during
  the noirq phase, and was only recorded; dwc3_qcom_pm_resume()
  cleared the override about a second later.
- cable plugged in during s2idle, s2idle with the cable connected,
  and unplug/replug while awake: no change in behaviour.

I have not tested this patch without the wakeup changes.

The UCSI side is discussed in Abel Vesa's RFC to queue the connector
work on system_freezable_wq [1]. This patch is needed either way, as
not every caller of usb_role_switch_set_role() is frozen during system
sleep.

Faisal Hassan's SA8255P series [2] also changes dwc3_qcom_pm_suspend()
and dwc3_qcom_pm_resume() (the wakeup argument becomes a pm_message_t);
whichever goes in second needs a small rebase.

I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result and ran the tests on
my device.

[1] https://lore.kernel.org/all/20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org/
[2] https://lore.kernel.org/all/20261010053246.2991984-3-faisal.hassan@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20260722-ucsi_glink_wakeup-v2-1-b43dee56df24@oss.qualcomm.com/

 drivers/usb/dwc3/dwc3-qcom.c | 67 ++++++++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..2997479988c7 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -10,6 +10,7 @@
 #include <linux/irq.h>
 #include <linux/of_clk.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
@@ -85,6 +86,11 @@ struct dwc3_qcom {
 	struct icc_path		*icc_path_apps;
 
 	enum usb_role		current_role;
+
+	/* Serializes the role notifier against system suspend and resume */
+	struct mutex		role_lock;
+	bool			vbus_override_pending;
+	bool			vbus_override;
 };
 
 #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
@@ -561,27 +567,40 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
 static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
 {
 	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
+	bool enable;
+
+	guard(mutex)(&qcom->role_lock);
 
 	if (qcom->current_role == next_role)
 		return;
 
+	enable = qcom->current_role != USB_ROLE_DEVICE;
+
+	/*
+	 * Not every caller of usb_role_switch_set_role() is frozen during
+	 * system sleep, e.g. the UCSI connector work can run in the noirq
+	 * resume phase. The glue clocks are off then and runtime PM can't
+	 * turn them on, so leave QSCRATCH alone and let
+	 * dwc3_qcom_pm_resume() apply the update.
+	 */
+	if (qcom->pm_suspended) {
+		qcom->vbus_override_pending = true;
+		qcom->vbus_override = enable;
+		qcom->current_role = next_role;
+		return;
+	}
+
 	if (pm_runtime_resume_and_get(qcom->dev)) {
 		dev_dbg(qcom->dev, "Failed to resume device\n");
 		return;
 	}
 
-	if (qcom->current_role == USB_ROLE_DEVICE)
-		dwc3_qcom_vbus_override_enable(qcom, false);
-	else if (qcom->current_role != USB_ROLE_DEVICE)
-		dwc3_qcom_vbus_override_enable(qcom, true);
+	qcom->vbus_override_pending = false;
+	dwc3_qcom_vbus_override_enable(qcom, enable);
 
 	pm_runtime_mark_last_busy(qcom->dev);
 	pm_runtime_put_sync(qcom->dev);
 
-	/*
-	 * Current role changes via usb_role_switch_set_role callback protected
-	 * internally by mutex lock.
-	 */
 	qcom->current_role = next_role;
 }
 
@@ -624,6 +643,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->dev = &pdev->dev;
 
+	ret = devm_mutex_init(dev, &qcom->role_lock);
+	if (ret)
+		return ret;
+
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
 	if (IS_ERR(qcom->resets)) {
 		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
@@ -756,6 +779,8 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	guard(mutex)(&qcom->role_lock);
+
 	ret = dwc3_qcom_suspend(qcom, wakeup);
 	if (ret)
 		return ret;
@@ -772,17 +797,29 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
-	if (ret)
-		return ret;
+	scoped_guard(mutex, &qcom->role_lock) {
+		ret = dwc3_qcom_resume(qcom, wakeup);
+		if (ret)
+			return ret;
 
-	qcom->pm_suspended = false;
+		qcom->pm_suspended = false;
+	}
 
 	ret = dwc3_pm_resume(&qcom->dwc);
-	if (ret)
-		return ret;
 
-	return 0;
+	/*
+	 * Apply a VBUS override update from a role switch that came in while
+	 * suspended. Do it after the core has resumed, as resuming the gadget
+	 * enables the override and the role switch is the more recent event.
+	 */
+	scoped_guard(mutex, &qcom->role_lock) {
+		if (qcom->vbus_override_pending) {
+			dwc3_qcom_vbus_override_enable(qcom, qcom->vbus_override);
+			qcom->vbus_override_pending = false;
+		}
+	}
+
+	return ret;
 }
 
 static void dwc3_qcom_complete(struct device *dev)

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
-- 
2.43.0

