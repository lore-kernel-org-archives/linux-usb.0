Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4406FAA
	for <linux-usb@vger.kernel.org>; Sat, 16 Dec 2023 03:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1h6OsDVj"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6d265c1d8e8so1025955b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 19:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702698221; x=1703303021; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MJ2mISBcTBUnQo3gMwCpghdZw1VZrVIIe2xs3t2Tvxs=;
        b=1h6OsDVj2qvIwx32zTRf8Hvna5Z1o1nzGposLVdt7898uhM0XlIP3jCs6BVUsgM18O
         Y2Aka99/VfVQhwvW8fGDRiPsarNM8ZEhDLpzKcfXDIBOBSTpv1gsi1Ebtqd1dEPMUuUB
         Jr+SZtqNUbMti2bLarKoE47eMHJssEAewFIGQsxlgVxPhatK3++xPA4n578UH+wrzFDH
         0gZMOlLaTZ9mZtzzRKwbH0/3qVtV0F/JoNl4sWfVcN/g7ZgBCZMaKVT0Yt/67R96xiM+
         NUpfQo6h8MDu1PLwdegcflrS0EIigyGDkfeLohDPDSsIK3ZqU+gFiT0hKNWCJgq+yiQL
         QQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702698221; x=1703303021;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MJ2mISBcTBUnQo3gMwCpghdZw1VZrVIIe2xs3t2Tvxs=;
        b=VSCE0GHZgEcX9xpJdu0/rww+EMMsZXzPZ+yDJKPpc8e/hK4u6hmFcyS8cYmFHwytPb
         /UOJUDLSheqCu5cEHfSRfpA3sJJtFokfu4uUOgJ+0AUOB2FYzztzu/J5qKZXcNPrZUne
         cz9pxcXPSXu4CbHgsoUSyRCtQBHvv2ggv8f5fEedMJS4cyc00CJQ1csWvBVlXwDU3+IH
         SrHu4iJrrRtk54vqsNa3j53cW8jmBTPHPp1pSNKFOmJs6NgKxKeMClWBzJVjXtAOLF5P
         smbzkfwpfNUSuRSQ/fHb9dXeJPfx3fx0q4J+KXUmavh10Il1vww6JjPitxbo4rEsy7Kd
         hc5A==
X-Gm-Message-State: AOJu0YyxfTp1VnyVbAxFNsd964kJn+LI4xwrUX0Xki7N6SHYOQi0DHrf
	WC3ZgFG5p9ZbmBmnFWCO/pyTIZzhLtQ=
X-Google-Smtp-Source: AGHT+IEZ3UotmDAsP3MqxR43N33J7D5VebnajIIvPoWQOdyiE3op914IY6KCzLf4La2eSpzWKhGer//pcOo=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a17:902:dacd:b0:1d3:9d94:3300 with SMTP id
 q13-20020a170902dacd00b001d39d943300mr474plx.4.1702698219736; Fri, 15 Dec
 2023 19:43:39 -0800 (PST)
Date: Sat, 16 Dec 2023 03:43:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231216034335.242168-1-badhri@google.com>
Subject: [PATCH v1 1/2] usb: dwc3: Refactor usb-psy init
From: Badhri Jagan Sridharan <badhri@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, raychi@google.com, 
	royluo@google.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Badhri Jagan Sridharan <badhri@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Move usb-psy init to dwc3_populate_usb_psy() so that gadget can re-use
it to retry setting up usb-psy when null.

Cc: stable@vger.kernel.org
Fixes: 6f0764b5adea ("usb: dwc3: add a power supply for current control")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/dwc3/core.c | 24 ++++++++++++++++--------
 drivers/usb/dwc3/core.h |  1 +
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b101dbf8c5dc..a93425b9c1c0 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1495,6 +1495,19 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
 	dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
 }
 
+void dwc3_populate_usb_psy(struct dwc3 *dwc)
+{
+	const char *usb_psy_name;
+	int ret;
+
+	if (dwc->usb_psy)
+		return;
+
+	ret = device_property_read_string(dwc->dev, "usb-psy-name", &usb_psy_name);
+	if (ret >= 0)
+		dwc->usb_psy = power_supply_get_by_name(usb_psy_name);
+}
+
 static void dwc3_get_properties(struct dwc3 *dwc)
 {
 	struct device		*dev = dwc->dev;
@@ -1510,8 +1523,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			tx_thr_num_pkt_prd = 0;
 	u8			tx_max_burst_prd = 0;
 	u8			tx_fifo_resize_max_num;
-	const char		*usb_psy_name;
-	int			ret;
 
 	/* default to highest possible threshold */
 	lpm_nyet_threshold = 0xf;
@@ -1544,12 +1555,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	else
 		dwc->sysdev = dwc->dev;
 
-	ret = device_property_read_string(dev, "usb-psy-name", &usb_psy_name);
-	if (ret >= 0) {
-		dwc->usb_psy = power_supply_get_by_name(usb_psy_name);
-		if (!dwc->usb_psy)
-			dev_err(dev, "couldn't get usb power supply\n");
-	}
+	dwc3_populate_usb_psy(dwc);
+	if (!dwc->usb_psy)
+		dev_err(dev, "couldn't get usb power supply\n");
 
 	dwc->has_lpm_erratum = device_property_read_bool(dev,
 				"snps,has-lpm-erratum");
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index efe6caf4d0e8..6c65d76e6fe2 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1526,6 +1526,7 @@ struct dwc3_gadget_ep_cmd_params {
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode);
 void dwc3_set_mode(struct dwc3 *dwc, u32 mode);
 u32 dwc3_core_fifo_space(struct dwc3_ep *dep, u8 type);
+void dwc3_populate_usb_psy(struct dwc3 *dwc);
 
 #define DWC3_IP_IS(_ip)							\
 	(dwc->ip == _ip##_IP)

base-commit: 51920207674e9e3475a91d2091583889792df99a
-- 
2.43.0.472.g3155946c3a-goog

