Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064105;
	b=KIpSAROeDi8c5KBP7T0TEeajiOud3rPe9VBka1pJXEsdfMhESrs87sLt917wWD24CvIU
	 cKv0LqPvS6ISeK8M+cQ7gV3t3whpmvQsn9NRMkdEvsnEg6DBEbi31tFC3oA5TaxZun2dP
	 eenf8XxvUhf5gZ8EgeSOp1AWc/4DptHfvAw5+VS90GycRj4dSt2bXxM58wizqfESd8vfd
	 cxyieclZJEaS6IVHHhF4nwMVjyRZ02v4q1cjShyIlW7ucwWO6MpodMoFmiPvD5KWAXWND
	 AlvoXehjVJAUuLmDniA0dU61esS88mtdK18aPfYN39kXkLCT9eg1DkDWBI8Nd+xS0Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=rWQx9VY8cR2DvJ7+DHW9RafvsbBO51tt7dAAOJXSTAw=;
	b=eM/oYxGFggKEKNfQrqarZSbRbOlw0jsVqhYKcQniiDwsKgtcn5O0yvscxWG/dzssJeEL
	 zHq3ur3SzgWbf+rJSQEh/eqJ/WBsSu3sLEyMoouxxuCoE2pBhHjNUmerhO+z8LFckj4P0
	 Gs37X8gd7ar3aVmx9r9x5OvXZEzw2hOBWOuYUbrxb7a/NRxfsOyYqFxFdXA8yVw4qP3CI
	 vdyKcThTLP3qPnw/xspmZ1SEV2ySq8+OZh3KPj7wpb4o8HiJ7uKA4c5MSXKbchz8tLbem
	 Y0IG043qnAGnTdcYfsq2wiHl3rAYFO91jRJk/BUm8EzNhQIjWbe9G2bC5HlezeekSRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fy2DEXGO;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB1606A31B
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 01:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EB1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fy2DEXGO
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so41705235e9.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 18:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793064103; x=1793668903; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rWQx9VY8cR2DvJ7+DHW9RafvsbBO51tt7dAAOJXSTAw=;
        b=fy2DEXGOY0KW7ImdHWYGqCc3PAx6ZinfeX3WaX9ixRwVpMFQYQJcP0AUIv4s/3kV7U
         raUEgk0gsL62pL1E/d0Q9+8lWWHgttbMDnzLbIRlrAs32agga/y5IAdTrS5dnqGXWVvB
         oblpYYXBxehQwRWkwfbtToCCOXUVgt5n/3mM8txKteFnO9gKSplzTskchbr4X+7vm1x7
         JUab69ZweQXWu+orV3YKCoE5OamvaCoWP9Hs1SzLGLZkCwH53HeMXG4PvdrcZJNU8NRw
         ejew2yvSIdAe9nX6KsBGoB0DmhibQcOqnFPceumLQ59Y7eLq309B07MSQxiIGxgGLshu
         OwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793064103; x=1793668903;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rWQx9VY8cR2DvJ7+DHW9RafvsbBO51tt7dAAOJXSTAw=;
        b=XDAo+2K1L1CRkf0y1UimryARo1UHaNkuh3PeBuDE5de7zHgxB8fgNpjQogjpnoGykj
         ZcMVfHz/MJ2dk3xUtirZuJIVBKmB4s5LikyveJWxP1IlwgufHvX0E4p5FTHlmQWpoiR0
         8rBjzpB/wP24U1uXt1fOTVVekhuaa4ZECYiVF38rOoj8KLSEfgj+0AbWjjs6R4Nk4Or2
         qqC7WLoaMjsiXRNBKOnofNAs6ni7jAgNzot8wbHgXoIeiC8Zdc5e8xWB/HRCIe0wUR6t
         q15RxCrI47PqJfBdr9EPJQf6aWPtzjBsbOAr4K9PQ35WwMjb3+74+xWzZXSASHI45haG
         h3Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwfg9uqIjgdKluj5PIzYoto259D6KWgxIGZAtcxcDA5MFdlWVksp/VWDHKmDQDVntrJZ/Id3NhdIt8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAjEgNKwhnl1bTsNcGi5fRbqzHlmpTevh7A9WmJ4QhWTK9ND8A
	diw9IjO8Vv1f5kTVNsU95GYvVBpXfMXJEZ/FGr7bG22WRWO5CAbxclGIudIT8oYD9TE=
X-Gm-Gg: AYBFou0/Q9NjkdL/m9InlzBmEKJEqIn6TDZxmAoh09C8odeMNLEPmu0UzWSD96UTDd3
	CIFEzTAOqXJEzTK1cBerWa12YlV+YsuUW9Jlt64BE9ua1oQydPnhDyt7YXqovs0qeyBO4wXAS2C
	UToNF0KW4kJhkTe/+SaVACbRsSawsaNrCtS0EVownMUKTizML0LPFMkWA/OwU2berBuIChY9Rs2
	FCtgTSDE6tGXGqpamTA6jLzyPA1/AzTcfDQPDdNMZYn47N9NU+GVGcINAQGx6n2aYtoGGZeqX2c
	wMcQdW5pQn9dWDoYLMhGo4vYeQFqQdI0NWRJdimTOtWuREIhc8lYDzgMnqIgMjySdpv2yjopoJ5
	OoC8Z4X/J6mKhdzWCrVMLQ119PFflTwlc3z/3uhuQzzpEMK0gXG1QEZD+W7TWTY/RwRvZNwNOwl
	3xf/TE2g+shfO7Oet3QXeiZb2QMBPY5Qb9Gkw0iMhMT8Neiosb+WOK++XOT967dVWkaAB98YwsP
	FtQwdbFljZnDnqCeHa6KJ4dR4N+C0NWQoJV/W6FSaJ6TE4arVmKOo3I2FnPGHMBZ12QRG1iwEop
	d3BW2mK0LDqs03S3CfZmYXA0FCag6lW7KgjS2oY=
X-Received: by 2002:a05:600c:4e43:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4a64d6ba846mr84362775e9.31.1793064103398;
        Mon, 26 Oct 2026 18:21:43 -0700 (PDT)
Received: from [127.0.0.1] (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08dcbfsm153270855e9.2.2026.10.26.18.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:21:43 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
Date: Tue, 27 Oct 2026 01:21:42 +0000
Subject: [PATCH] usb: dwc3: qcom: Restore UTMI PIPE clock on resume
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTvQicSCVxEXNvljR2gtmUaF0
 rub6vJbvLeSISuMzs1KGS81fU4VcmgoDLfpDtZYTa51J2ldx/EdjlyWUTnDygj2KXkvvSBKpJr
 NGUk/v+Xl+reV/oGw7B/ati/nNQk7dAAAAA==
X-Change-ID: 20261027-dwc3-utmi-resume-5ff551b1ed1d
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Manu Gautam <mgautam@codeaurora.org>, 
 Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Filippo Falezza <effeffe99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793064102; l=5275;
 i=effeffe99@gmail.com; s=20261022; h=from:subject:message-id;
 bh=GvluqYDhhYQr8wvM6LTH8W6K1E9SiSzkvOIai5qx5+Y=;
 b=AdyArBgtFbMjZvpLXC3d7HU+jrDiX1Q7dqWhd6M3TsoWvH+xVTRatoqweFuilIRK6ap4ASmTi
 L2oYpc1dVnWDm3n/P4GJpqQI3/5yt0gYI9sO2/YbX/0vcvlS/Nngs3c
X-Developer-Key: i=effeffe99@gmail.com; a=ed25519;
 pk=7PPwl4QILojrh+ATB5QOpvXVmmoxaxyLQhrLRLWEL0I=

Boards whose controller has no SuperSpeed PHY set
qcom,select-utmi-as-pipe-clk, and the glue then programs QSCRATCH
GENERAL_CFG so that the core's PIPE clock domain runs from the UTMI
clock. This is only done at probe.

When the SoC reaches its deepest state in suspend-to-idle (CX power
collapse), the QSCRATCH registers lose their contents. On resume the
core is reinitialised with its PIPE domain unclocked, and the gadget
does not come back:

  dwc3-qcom a600000.usb: failed to enable ep0out

The link stays down until the driver is unbound and bound again.

Remember the property at probe and select the UTMI clock again in
dwc3_qcom_resume(), after the clocks and interconnect paths are enabled
and before the core is resumed. Move dwc3_qcom_select_utmi_clk() up so
that it is defined before its new caller.

Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
---
Hello there,

this fixes USB peripheral mode after suspend on a Motorola Moto G 5G
Plus (SM7250), a phone with a USB 2.0-only port that I'm bringing up on
mainline. Its controller needs qcom,select-utmi-as-pipe-clk. The first
s2idle that reached CX power collapse broke the gadget: "failed to
enable ep0out" on resume, and USB networking stayed down until I
rebound dwc3-qcom by hand. Rebinding works because probe programs
GENERAL_CFG again, which is what this patch does in the resume path.

With the patch, the gadget (NCM plus ACM) reconnects after s2idle, and
the SSH session over the cable that I use for testing survives
suspend; the phone has run with it on linux-next since 11 October.
The other boards that use
qcom,select-utmi-as-pipe-clk should benefit as well, but I have only
tested this one, in peripheral mode. The legacy glue driver
(dwc3-qcom-legacy.c) has the same probe-only programming; I left it
alone because I can't test it.

The patch is on top of usb-linus (6b4b543fa187) and builds with W=1 for
arm64.

I wrote this patch and drafted this note with the help of an AI coding
assistant (Claude Code). The testing above is on the phone.

Thanks,
Filippo
---
 drivers/usb/dwc3/dwc3-qcom.c | 45 +++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..6334ca7ba30f 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			utmi_as_pipe_clk;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -335,6 +336,23 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
 }
 
+static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
+{
+	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
+
+	usleep_range(100, 1000);
+
+	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
+			  PIPE_UTMI_CLK_DIS);
+}
+
 static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 {
 	u32 val;
@@ -388,6 +406,15 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 	if (ret)
 		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
 
+	/*
+	 * The QSCRATCH registers lose their state when the controller's power
+	 * domain is collapsed during system suspend: select the UTMI clock
+	 * for the PIPE domain again, or the core can't run without a PIPE
+	 * clock ("failed to enable ep0out").
+	 */
+	if (qcom->utmi_as_pipe_clk)
+		dwc3_qcom_select_utmi_clk(qcom);
+
 	/* Clear existing events from PHY related to L2 in/out */
 	for (i = 0; i < qcom->num_ports; i++) {
 		dwc3_qcom_setbits(qcom->qscratch_base,
@@ -419,23 +446,6 @@ static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void dwc3_qcom_select_utmi_clk(struct dwc3_qcom *qcom)
-{
-	/* Configure dwc3 to use UTMI clock as PIPE clock not present */
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_setbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_SEL | PIPE3_PHYSTATUS_SW);
-
-	usleep_range(100, 1000);
-
-	dwc3_qcom_clrbits(qcom->qscratch_base, QSCRATCH_GENERAL_CFG,
-			  PIPE_UTMI_CLK_DIS);
-}
-
 static int dwc3_qcom_request_irq(struct dwc3_qcom *qcom, int irq,
 				 const char *name)
 {
@@ -680,6 +690,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	 */
 	ignore_pipe_clk = device_property_read_bool(dev,
 				"qcom,select-utmi-as-pipe-clk");
+	qcom->utmi_as_pipe_clk = ignore_pipe_clk;
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 

---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261027-dwc3-utmi-resume-5ff551b1ed1d

Best regards,
--  
Filippo Falezza <effeffe99@gmail.com>

