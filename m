Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5945438475
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 22:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783377400; cv=none; b=sbszEWz0J49CepMGTjlGgYBXkd/TZTqIrA28Vm1On8KA/urfu9Jb07gWU4MpRybdkEHqHnTTMFX1QT2sVvf09YVYfVkSRUhsAWl1BtiC9pF980bmyOs1HZMcz76eMaXHns+at1lgvpiwA7sLpGxA9BGTPt9QMfjSX4zCYd/AAhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783377400; c=relaxed/simple;
	bh=xV+HM88fLX3+DMVVR/NRocPTWh+YHaROvjT1IwX4bTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fRy9u2plNIKUrWMwzeC9Fs+9G6CON5d04A10FncMj3X+HYm8LDup1B2ik6k4sIadSXDu1/VpRwqozOVjP9TovD3bYY1s9PJiLFEVl7VzZqob6xSpcsUylDZeAVIxRRCDNhufs9aFCGtvKyAd2SBws2A2RCniZmLciAej0ZbBuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIZg8zVq; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIZg8zVq"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1936549f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 15:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783377397; x=1783982197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAJbvFky4pXbE6G3CrtVZQ+RGiAcp1hVwbCEVyEV8E0=;
        b=HIZg8zVqqE+wu662cMSih7rFJIqE57z6DT6nSpvNkXQFcH9Retg4yBCjCXWVybAX6j
         JKsBsYq3qJ/06m8wBklngOpoDKndjo5FAHZAqOKiWFODKNoEcqtyBcwG0/AXUjQyGxWh
         zRk4d08+ieyN30VjScX4i59KOhERWFiKKSE/8ZfMuCPzVXIUUSdPKf1KPhr//ooeNtiC
         AVHIl/XLut9LHi63pITN+/eVgc83mfeU8uOd7+3zfjeqz+FRYQZnwi7J+5OAEEkVi6+X
         /yEp0ix6B1aXgGlA36JJDmKzgfmodWXmu1/xjo9ggamacvNLY7BK7SIjuCLm16NRC90t
         O3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783377397; x=1783982197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yAJbvFky4pXbE6G3CrtVZQ+RGiAcp1hVwbCEVyEV8E0=;
        b=KnCstYXbNL6g1I8ovC8T8AAosBkWWaJTOFw4LorPXwiJ0N31LVxTM/h9t1OdlNu91/
         bHYdoKY/ScQURxuNZcGOtEHz3qlsXMpGCiGwVRiPJzEITmatymHl4Sk+CACqraqdWp9v
         yfY5hQY83qZM3vU7oVfO3ZqWn1hcE0T9IG5KKGJG7rJsNZb/LAf5CpAuMCGJ7xfaslFm
         kLJBMsNSgYEpcWG8A0jLRRXpKd1Oksrptfr3QEmQLzXdgIs/3YJxO8+XWPMVTIcm9QlE
         6OnAaKziGx20+hBbuYZhR3WIWo3AYwKRGfOuOHALiP+JsHj5nADKRQ5qixyyP6jhSqD+
         PcqA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2Z8osWnDy4SLzDp+8khBUohneCc4jvfZVWuLUdk5nUDWR662MkjKDrTtjubzxca6wH97xS5c4Sas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAs0X1UXZ3Ua1el3rqx7VsN3GA9OrpN4qTmVn0q+A8rD9CFjtA
	zI2YY061fpFl/3UsjcBkK+Z3ZOvmwXw6jRkLqFVB2yHFg9JAofqrg4aU
X-Gm-Gg: AfdE7cnb8MoZfcnlMgsrAvnLz9mhyk89K36bk4hOIG2NEY5pMfusT/Dl4R+iDpShZoV
	wY9fzAYZrAm1PVaeAT+Q9nU7OEpRc4U9av7jFGDFUPcgvnYjBf3irMCWPE+SqP/2LEJVoe2lYuv
	TCcfRBpEXtT/YT/6i+yoXvTevTiGNyzDcokF50cfrSdtEpOvF5QJtyklFeD2cEZH6d4Z2Gki6RB
	8k09LTwYb1vQ8d4LmQBtwK1dvjFNaspq9QWNsWvPnDSlPgRNTvIYcGvq5FjccLugubqog6oBnrP
	R/xXVaxU7+WjxKcnxDnI5kmY2BLf+gLEYexfHc9YsAcRxrMu4qJrqRsHw4u6w9tjae4XDFCCIav
	Izpdde0oDdDueEJvEohaxBGLRtOEQXj6dYvYYNTjVAh/uDEYLgNXzvXc9Vq8sFeav4FjqzTNDPs
	ctw6+t2YPm75Zm7saCv+iO67nZuYGVjlf32Oc+CHhOfux5CqQ+QkvtKSW+de6UIA==
X-Received: by 2002:adf:f043:0:b0:475:cd6f:720a with SMTP id ffacd0b85a97d-47de666af65mr1504971f8f.1.1783377397013;
        Mon, 06 Jul 2026 15:36:37 -0700 (PDT)
Received: from turbine.fritz.box (p5785b224.dip0.t-ipconnect.de. [87.133.178.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm27491387f8f.12.2026.07.06.15.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:36:35 -0700 (PDT)
From: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Frank Wang <frank.wang@rock-chips.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
Subject: [RFC PATCH v1 1/2] phy: rockchip: inno-usb2: keep peripheral-only OTG port active
Date: Tue,  7 Jul 2026 00:36:26 +0200
Message-ID: <20260706223627.113814-2-andreas.zdziarstek@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
References: <20260706223627.113814-1-andreas.zdziarstek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OTG state machine autonomously suspends the OTG port whenever it
decides no usable VBUS session is present. On the initial sample after
init, when a dedicated charger is detected, on peripheral disconnect
and on host-session end. It calls rockchip_usb2phy_power_off()
directly, underneath the USB controller.

For a dr_mode="peripheral" port this kills the USB gadget on any boot
without an attached cable. The state machine suspends the port shortly
after init, resulting in "failed to enable ep0out", ep0 start transfer
returns -EINVAL). The gadget remains unrecoverable in user space
afterwards.

Skip the state machine's autonomous power-offs when the port is
peripheral-only. VBUS detection, extcon signalling and charger
detection are unaffected, and controller-initiated power management
via phy_power_on()/phy_power_off() keeps working.

Signed-off-by: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 27 +++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 7d8a533f24ae..9b138b7aaeb8 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -670,6 +670,23 @@ static const struct phy_ops rockchip_usb2phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+/*
+ * Autonomous power-off from the OTG state machine or charger detection.
+ *
+ * A peripheral-only port shouldn't be power-gated behind the controller's
+ * back. If the gadget (re)binds while the PHY is suspended, the
+ * controller's ep0 setup fails and the gadget stays dead even when a VBUS
+ * session appears later. Keep the phy active on peripheral ports for
+ * correct connection detection.
+ */
+static void rockchip_usb2phy_sm_power_off(struct rockchip_usb2phy_port *rport)
+{
+	if (rport->mode == USB_DR_MODE_PERIPHERAL)
+		return;
+
+	rockchip_usb2phy_power_off(rport->phy);
+}
+
 static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
 {
 	struct rockchip_usb2phy_port *rport =
@@ -693,7 +710,7 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
 	case OTG_STATE_UNDEFINED:
 		rport->state = OTG_STATE_B_IDLE;
 		if (!vbus_attach)
-			rockchip_usb2phy_power_off(rport->phy);
+			rockchip_usb2phy_sm_power_off(rport);
 		fallthrough;
 	case OTG_STATE_B_IDLE:
 		if (extcon_get_state(rphy->edev, EXTCON_USB_HOST) > 0) {
@@ -719,7 +736,7 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
 					break;
 				case POWER_SUPPLY_TYPE_USB_DCP:
 					dev_dbg(&rport->phy->dev, "dcp cable is connected\n");
-					rockchip_usb2phy_power_off(rport->phy);
+					rockchip_usb2phy_sm_power_off(rport);
 					notify_charger = true;
 					sch_work = true;
 					cable = EXTCON_CHG_USB_DCP;
@@ -765,7 +782,7 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
 			rphy->chg_type = POWER_SUPPLY_TYPE_UNKNOWN;
 			rport->state = OTG_STATE_B_IDLE;
 			delay = 0;
-			rockchip_usb2phy_power_off(rport->phy);
+			rockchip_usb2phy_sm_power_off(rport);
 		}
 		sch_work = true;
 		break;
@@ -773,7 +790,7 @@ static void rockchip_usb2phy_otg_sm_work(struct work_struct *work)
 		if (extcon_get_state(rphy->edev, EXTCON_USB_HOST) == 0) {
 			dev_dbg(&rport->phy->dev, "usb otg host disconnect\n");
 			rport->state = OTG_STATE_B_IDLE;
-			rockchip_usb2phy_power_off(rport->phy);
+			rockchip_usb2phy_sm_power_off(rport);
 		}
 		break;
 	default:
@@ -838,7 +855,7 @@ static void rockchip_chg_detect_work(struct work_struct *work)
 	switch (rphy->chg_state) {
 	case USB_CHG_STATE_UNDEFINED:
 		if (!rport->suspended && !vbus_attach)
-			rockchip_usb2phy_power_off(rport->phy);
+			rockchip_usb2phy_sm_power_off(rport);
 		/* put the controller in non-driving mode */
 		if (!vbus_attach)
 			property_enable(rphy->grf, &rphy->phy_cfg->chg_det.opmode, false);
-- 
2.53.0

