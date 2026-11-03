Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713869;
	b=BBlLuCqyLdy2QCLxxT8L0vb9Mz6dtx8EoLUiTTuvh71G9zONRi89J1pBBK8PPvFtk1Xx
	 /rbOL2vUto5XaRR63TD4miRczqlrDfmHijDntleWwH9TnZa0yTu0PLrz4SU3yxqxWPMTb
	 Ktzp4ozGzUGQcDLHFjcczjMC8IwlHGncqZXI3seX0Y8+Uoe/tM2IPNnV0by79FJ8wxNUt
	 Iw0NGqnBkxS4v+RI8LsLSUpD9jtcu/9X9L7lKoaJya4VSC2QVFLhANG4quBDvpC2rSee9
	 kpM4gN2dPZrdGMaC59ZRf3IIO1WkzuuRtUdYwDcIMkv+a1mz8znUuD9N7r8wVSI7gnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9z34kyHsqcQjct+Y1n3MAhMWsz+lKhJy1hwGc9qwvQA=;
	b=r85GjQnKbquD9Kz5+br3jY01cnSYBmZj8CYGxGGFM2rIW9YFAxzdXSvfQJQRF6ZRQU8C
	 rI3yHlPnCBxc/VQs3xbZb89wW2URGeDVt2T3JdG9RHaMYtxivMSvrUhYq8OVhkE97grne
	 2O7XUyymcNMMUNKeM0UbEXaY7nCV1OTJCB6nN5wX3bGF1Ye7UaEWX2AFNlZwNvCiLtxp1
	 Hk188tZi7NgjQkFJjVZSMtWEklE6xJwMmywPTKO0qYB1ZoFjMPRUo5ltg2eyqkWBFTjMu
	 Z9LH0/Qe6UnM6nUMqQzo4xhRqikM0MY4qJ54sYTduRVu2pvGSPJIx7y2vBKw7uzmyHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJ2JC93G;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FBE606D827
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 13:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FBE606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJ2JC93G
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1adbf62dd31so4588359c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713868; x=1794318668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9z34kyHsqcQjct+Y1n3MAhMWsz+lKhJy1hwGc9qwvQA=;
        b=SJ2JC93GUl99cCOk+hy6Oo+iIc2nMh57sAUbFVl0gwdfBABQwgrISdygYgGQxC6hEi
         dJa/RyTTZE06vcJkB3zwSv4LCnSTcz15OtXjqR5sRXYEdMAQ2WyewQiLSTCZ4g8cUA4t
         /xSGjAPl/WQsXXn33HuQ1HuF1dav6NNnAgODjS0CjVFQ+CcSf4bU9qWiZNcJ8YybyQNy
         Ipluw98k+J7O3lZIaZIE+/E0Fmmgxi8RmOikoZvUKz9tn+MEWX6AVXOg2Tiv4CFxZ93A
         Pp+RB5LCc2zz7lMgLRu4Nbl4CvHbtRXvdw3Yq6apPn6IjnmEzMkX+D3rbggXUWOQczur
         b82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713868; x=1794318668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9z34kyHsqcQjct+Y1n3MAhMWsz+lKhJy1hwGc9qwvQA=;
        b=TyLtIAmYFHsPob/9PuRDkK0xL2fkpeRdGQw2riFsg/tHUZH5vhXn3arwNOy8vcMP/P
         M/kKozxTcm5XNXylrZJTcJVbopBlWWXmKSEl/WeDX8J9H8S/5LdPLX57b3YLhuzgbEh0
         EJL5aJ3SBcT/kkXSs+jSWF4a0Qo7qeXUNQ7g/Ljvx1DbMmA9i8fUeqC6D1Xi8VahZeAl
         Y0YyBpDM8DISaVBhA29NszsjHV9Mf6/Q2TBu+7oSV18aHRPXCmmQ/98EkIziu83VkzX/
         SO0MopVthEEc0fyl5Gi7gR0kEZKDURrkeSlhHLdijltdbACff7iqeyfDpLtl9eElXweJ
         WSsQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+dTQaUPIVykmv3Qu6UQSBlLRMHx8DNDLm7Qj2bp6DHOVrlaxRBsRwBJAXp49/zvEJGmYiRxEK2qI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eapR568L1oHf9NsHJn8eqF7lzcb/wLRXC5FNU9yQXJshZKH5c
	lMrQPiu//uXw9AVliZG8HU/32HEHYloyh10g0+hc9ncKQBMmnnBn+G2L
X-Gm-Gg: AYBFou2rpY1eXgBoTs4KSt9CRkz7Kzezpq2OYapsbY9O5lj+PCs3iHZ4aww6drOblQw
	o6aSDA/SMloxzUqFB2uNc/ztley8oIVBmi/wJ7/nfZUs6Ju3osJXYQdnQmvf+4PanH34UAhgzH1
	JFDZYdjxqq7YT1j31+qJPL/c9oeGAJCAiVhIaCy/9P5CfC7fX4ydwFXjasMFVYAkRJgNyhLya5l
	h3JqxpGPYvAiIUkeZzNctGmqIzZdluzj+dgeVlXcxwdjfTQcA5vO60BqeQKoYAZ9Au3KSg4fnCY
	Bafbgfg/MPhOk1ZdXRx0gs592fDMPwYAldjxfuu1/EwtaV25nW8pD9FwFdyIqzzqX0u25lNMFBY
	yFu6wK9qr5Ygbz3tjzDGXxhUlKJcNeT/EeNfuI4jZykbHHxyWyijDwvyO4pVwa9EwAvOP2cc31O
	QW94SPm3+3afjpWUs3of9qYTMfkvCGAPhC/RBKq7cE6EG8i5OfzRYyD43wo6lgkUsyiT6UBUDTr
	mT+NmbqjShVYkx/Tt6qL4xwva5hTm8NaA57EO2LZWZqnCJQ1PL+xJj2+BBdQwRZLkA1C/sIQZcH
	LqdWDSh1yIhmYbtiPPwPiqPtEtLo8dfwQkV4Xl6S6CrJ
X-Received: by 2002:a05:7022:ea46:20b0:1a6:53cc:7454 with SMTP id a92af1059eb24-1ac5d4b2ad9mr22027765c88.27.1793713868119;
        Tue, 03 Nov 2026 05:51:08 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:07 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only modes
Date: Tue,  3 Nov 2026 22:50:56 +0900
Message-ID: <20261103135057.1682-3-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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

With DisplayPort pin assignment C or E the QMP USB3-DP combo PHY gives
all four lanes to DisplayPort and powers its USB PCS down. The
controller can still run USB 2.0, e.g. for the hub of a USB-C monitor.
Keeping the pipe clock branch enabled, as commit f546912bcac6 ("phy:
qcom: qmp-combo: Move pipe_clk on/off to common") does, is not enough on
Kaanapali. The next xHCI reset in this mode times out ("Host halt
failed, -110"), and USB stops working until the cable is replugged.

Register the glue as a Type-C mode switch when the node has the
"mode-switch" property. Select the UTMI clock as PIPE clock in DP-only
modes, as "qcom,select-utmi-as-pipe-clk" does statically.
typec_mux_set() calls the switches in the order of the connector's
ports. Port 0 (HS, the controller) comes before port 1 (SS, the PHY).
So the controller switches before the PHY powers its USB side down.

Go back to the PIPE clock when a USB state follows the safe state. A
change of pin assignment while DisplayPort is active keeps the UTMI
clock, as the PHY keeps DP-only mode then. The PHY also delays its
switch while DisplayPort is still powered, which the controller does
not see. After a very quick replug the controller could thus use the
PIPE clock while the PHY is still in DP-only mode. This has not been
seen on hardware.

The mux can be called while the glue is suspended for system sleep,
e.g. from the UCSI connector change work. Then only record the state
and select the clock on resume, before the core resumes.

The mux needs the Type-C class, so depend on TYPEC || TYPEC=n as
PHY_QCOM_QMP_COMBO does, and do not register the mux without it. With
the arm64 defconfig (TYPEC=m) this builds the glue, including
dwc3-qcom-legacy, as a module.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2:
- Switch back to the PIPE clock from the mux callback, not on a role
  change (Sashiko)
- Keep dp_only while DisplayPort is active, as the PHY keeps its mode
- Defer the clock switch to resume while suspended for system sleep
- Depend on TYPEC || TYPEC=n, skip the mux without CONFIG_TYPEC (Sashiko)

 drivers/usb/dwc3/Kconfig     |   1 +
 drivers/usb/dwc3/dwc3-qcom.c | 103 ++++++++++++++++++++++++++++++-----
 2 files changed, 91 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a413..282f366de9af 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -132,6 +132,7 @@ config USB_DWC3_QCOM
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on EXTCON || !EXTCON
 	depends on OF
+	depends on TYPEC || TYPEC=n
 	default USB_DWC3
 	help
 	  Some Qualcomm SoCs use DesignWare Core IP for USB2/3
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..71b0402f0ae6 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -19,6 +19,9 @@
 #include <linux/iopoll.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 #include "core.h"
 #include "glue.h"
 
@@ -81,6 +84,13 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			ignore_pipe_clk;
+	bool			dp_active;
+	bool			dp_only;
+	bool			utmi_pipe_clk;
+	/* protects dp_active, dp_only, utmi_pipe_clk and pm_suspended */
+	struct mutex		pipe_clk_lock;
+	struct typec_mux_dev	*mux;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -419,21 +429,72 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
+static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom, bool utmi)
 {
-	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
 	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
 			  PIPE_UTMI_CLK_DIS);
 
 	usleep_range(100, 1000);
 
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+	if (utmi)
+		dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+				  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+	else
+		dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+				  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
 
 	usleep_range(100, 1000);
 
 	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
 			  PIPE_UTMI_CLK_DIS);
+
+	qcom->utmi_pipe_clk = utmi;
+}
+
+static int dwc3_qcom_mux_set(struct typec_mux_dev *mux,
+			     struct typec_mux_state *state)
+{
+	struct dwc3_qcom *qcom = typec_mux_get_drvdata(mux);
+
+	guard(mutex)(&qcom->pipe_clk_lock);
+
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID) {
+		if (!qcom->dp_active)
+			qcom->dp_only = state->mode == TYPEC_DP_STATE_C ||
+					state->mode == TYPEC_DP_STATE_E;
+		qcom->dp_active = true;
+	} else if (state->mode == TYPEC_STATE_SAFE) {
+		qcom->dp_active = false;
+	} else if (!qcom->dp_active) {
+		qcom->dp_only = false;
+	}
+
+	if (qcom->ignore_pipe_clk || qcom->pm_suspended ||
+	    qcom->dp_only == qcom->utmi_pipe_clk ||
+	    pm_runtime_resume_and_get(qcom->dev))
+		return 0;
+
+	dwc3_qcom_select_utmi_clk(qcom, qcom->dp_only);
+	pm_runtime_put_autosuspend(qcom->dev);
+
+	return 0;
+}
+
+static int dwc3_qcom_mux_register(struct dwc3_qcom *qcom)
+{
+	struct typec_mux_desc desc = {};
+
+	if (!IS_ENABLED(CONFIG_TYPEC) ||
+	    !device_property_present(qcom->dev, "mode-switch"))
+		return 0;
+
+	desc.drvdata = qcom;
+	desc.fwnode = dev_fwnode(qcom->dev);
+	desc.set = dwc3_qcom_mux_set;
+
+	qcom->mux = typec_mux_register(qcom->dev, &desc);
+
+	return PTR_ERR_OR_ZERO(qcom->mux);
 }
 
 static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
@@ -615,7 +676,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct resource		res;
 	struct resource		*r;
 	int			ret;
-	bool			ignore_pipe_clk;
 	bool			wakeup_source;
 
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
@@ -678,10 +738,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	 * Disable pipe_clk requirement if specified. Used when dwc3
 	 * operates without SSPHY and only HS/FS/LS modes are supported.
 	 */
-	ignore_pipe_clk = device_property_read_bool(dev,
-				"qcom,select-utmi-as-pipe-clk");
-	if (ignore_pipe_clk)
-		dwc3_qcom_select_utmi_clk(qcom);
+	qcom->ignore_pipe_clk =
+		device_property_read_bool(dev, "qcom,select-utmi-as-pipe-clk");
+	if (qcom->ignore_pipe_clk)
+		dwc3_qcom_select_utmi_clk(qcom, true);
 
 	qcom->mode = usb_get_dr_mode(dev);
 
@@ -698,6 +758,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 			qcom->current_role = USB_ROLE_DEVICE;
 	}
 
+	mutex_init(&qcom->pipe_clk_lock);
 	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
 
 	qcom->dwc.dev = dev;
@@ -715,6 +776,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_core;
 
+	ret = dwc3_qcom_mux_register(qcom);
+	if (ret)
+		goto interconnect_exit;
+
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
 
@@ -722,6 +787,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	return 0;
 
+interconnect_exit:
+	dwc3_qcom_interconnect_exit(qcom);
 remove_core:
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
@@ -738,6 +805,8 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	if (pm_runtime_resume_and_get(qcom->dev) < 0)
 		return;
 
+	if (qcom->mux)
+		typec_mux_unregister(qcom->mux);
 	dwc3_core_remove(&qcom->dwc);
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 	dwc3_qcom_interconnect_exit(qcom);
@@ -756,6 +825,8 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	guard(mutex)(&qcom->pipe_clk_lock);
+
 	ret = dwc3_qcom_suspend(qcom, wakeup);
 	if (ret)
 		return ret;
@@ -772,11 +843,17 @@ static int dwc3_qcom_pm_resume(struct device *dev)
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
-	ret = dwc3_qcom_resume(qcom, wakeup);
-	if (ret)
-		return ret;
+	scoped_guard(mutex, &qcom->pipe_clk_lock) {
+		ret = dwc3_qcom_resume(qcom, wakeup);
+		if (ret)
+			return ret;
 
-	qcom->pm_suspended = false;
+		if (!qcom->ignore_pipe_clk &&
+		    qcom->dp_only != qcom->utmi_pipe_clk)
+			dwc3_qcom_select_utmi_clk(qcom, qcom->dp_only);
+
+		qcom->pm_suspended = false;
+	}
 
 	ret = dwc3_pm_resume(&qcom->dwc);
 	if (ret)
-- 
2.43.0

