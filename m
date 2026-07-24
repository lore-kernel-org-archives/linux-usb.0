Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281543F1678
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 08:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882693; cv=none; b=pPc7O6PrbJjJxu4jNnKmrsbWCOvQAVUi4ZVTZj7IIrTqfV/TU3NDNvSu9Qg5BKNg+doj5eku7Oy+7l5p2WCJkaF+D1q0DF99UdmUSXL/jd1+ZLJ4UDML08Zhfd5ZF3SnKkkb5cldcY0M6Nl8mL2kVQrshPRE6O8AyrHGibNEmbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882693; c=relaxed/simple;
	bh=DyEec2Z7+FSSh+lvskH9h+/zSvQpOnJC1n/aL86DbdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jr61hOhX9ZrskOSC43IpND8QJG6xg7zGeSg1OZg0x65CGQpIsCDn9XVZeV/ebZ1rmM46MKdAbh/oR0CpoJHlBGewW70G3CrQB1Rf0rrM9xDZpUiKYVEzUrNXlYROlE/BykOIqQsNera9lH3Z/1TncHhg0Okdm8IGX3d2AZf2H8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ncvlba2Y; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ncvlba2Y"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so151763a91.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 01:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882690; x=1785487490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=Ncvlba2YNu3OM1Xj6EntAJVtCNguGJud41Y1ZLDetGb0xnij4xGqWytxDzmF5/rv93
         xfM42s+nITAVn0EHuFPgGj2FR3VEUqYFEgQDSJsNampMxHOCGH+yifOzBNIgAgxj5wWE
         U7bo7o1FdFjTOaBBOKbKpAgutiIKVw2LoPI54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882690; x=1785487490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0rgL0VJ5kE0g1GPB7mxKos5pVHLgytmLF2hovXGdFw=;
        b=Rp4teXfF9eYhIoPnv79KdKmTG25rviHB0Ha39+wF+6Uf+CvrL3a+I8TpRna23DJH6k
         VxvXJjOsWP8QfDpiKKjX+cyB67fsUgVfHGJh1yH1Gd2zYrvn6nZ+sPmMK8tjL0ces/nT
         Q+ONfIynJc0dksQ/Jyc2JiJgJMXOMx3G2+0TMEJ/bGykYLlg1LtyR98d3lQK5rIaOvVJ
         +DkDborFUNn36lxfBdeXBU+Wxa/O/1EwQM+UOQF3hch0Ir1/POW04IyMljlXY4WgGGl3
         ouvaUZAHaOR2KIK6nKDjkF75L3j45H55e3kQyH0wg0azk1oQ3yGc86hBqdcovVume1sX
         ONvg==
X-Forwarded-Encrypted: i=1; AHgh+RosKEcw20jv7BEwDljJNTLk1JgZrkSCR1p4eXsEuNdhEI26m83ZrPAYtXzgafvTnH641Sm1z8Fz9nE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ySrP80IXCBY7tkUOSsQjlc7vJW7u+CWBmu+WsRMXO1lLx+SB
	Jxmu5WxkInglsDA5OOdl7b3K1blmNkIEdrRi7z4nRzO5bAJeCAsz88oQzifRxxperQ==
X-Gm-Gg: AR+sD13wMRZ4DP8XY2mZ/X95SLpPhCrwQurtIZ+pLo2ilIaOeX+Jy7f117UuKDm09J2
	247j5zcEv5BWW1ptvnYB65v4/D489PSWCTgRZ5fILOLbnOqAC3gRxN9iil5JaYv6AEPIrNdyYoG
	T2spuTLC+tAyRkKZwfAh+Ww/YBrM99bnywfsoOu51CaseK+SoshvMXnp0ouGzI/sPiu4dzSD5yL
	YvedWogAyl2SNIDOQR5lKsmx1WY63Jx3JruEmngvBXK00pmpw8x4/aCEy8SvIXoNAzuo/WB+24P
	iEhXATwpaLtTKmJYnC3cpD7H0iKRAQCV0KbQIh9eAD/AhQW7B9VA9sIz0tM0WC9ajyl5d/dvyLs
	62fn2e0m652qnzRDFVhuuzlSGAKli9cSPU+zsuNTnDC1yVlLMQLv1/LjIEZoSrsRP64YwykOYDf
	SBDVgMkBv6+s106JCuuPb9V9ZaBDmcsUcbVwobaCxkl+pdUpTmQjBBvFfRHBM=
X-Received: by 2002:a17:90b:2750:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38ec6637d1amr6239942a91.31.1784882690591;
        Fri, 24 Jul 2026 01:44:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri, 24 Jul 2026 16:43:18 +0800
Message-ID: <20260724084328.3943997-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 6671b5e45191..a5c5038e1604 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -976,11 +976,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5437,7 +5434,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.229.g6434b31f56-goog

