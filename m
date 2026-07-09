Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650A840861E
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591102; cv=none; b=M6stgcdIGLBkmnuw4USIvGipWLsWDZdmRtWaqjIHqt0ifmpwcLq1JG/QuJBE2NUEW2mE9Ju3+siggGQZSpuFwLplSsKLDqFQ2WTcZnP5yCxraNPoeCdPmAA2tTuFAVs5+t5ic0MboaqFKY1IfRclvKFauQQHM4SqLuZy4sSUzjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591102; c=relaxed/simple;
	bh=7Id8aIDDawUTH+Vp/qv7geyMCxiyF2kG5OxwY8VhiPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhXJRW9zRmn3WhPLag+xMwL8Jliul/dMh1onbcWCNPOSGT1FnfR5sfrBw65nZ12ncsPRu+7pfDJ19gtnueXP+6Ju98mK/Fi2VD1uNZo7OtDmh9vyyY+my8p3jgx39gbc+Ulogg+auoIt4HpG1Cqf9C65zxZnoo1XTeXJ2HFNjEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KSX4DIYv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KSX4DIYv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so10390335ad.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591099; x=1784195899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NOayELjm3/+NeKg/MUGc6Z0GBz34hjktNSI4aLdsWw=;
        b=KSX4DIYvdXr0E4Hiuh5F79zRFeAR+8NErThzozoUr22068snis6HRCLT0GkSRMEdSv
         u7TLDsPKJAVGYxCtAQJAAx2LRt6OUzyKOTw2uIJQmiOvSPubkRH57HIJgXfHHBH9II+O
         wkaYX5FT6YksniRTKUH6JdHhT2Yma3yGWcqIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591099; x=1784195899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NOayELjm3/+NeKg/MUGc6Z0GBz34hjktNSI4aLdsWw=;
        b=HIcKsN8efW2cC+3YKNWX8eobLGsrOUNdV91NUkhQZmYIDwU1y7GwFSmVwprPI6N+H2
         THee3I94ycIC4kGyJ43g2c43KT6HtU0Ujza80hCHQUpVlMk8h2XdcPgaS7AtNEgAT74O
         sauCreAyx/blLDADTdNMvkRjVzAVZYgLknXetm49ay3cvhUu7wxCHPeg/JSqmCoGXjFS
         eOAX8kaqsqd/8HCXve6MMPW8bTqfUVuaVgNqJGhdDsgykHC7XST9yLI+zgGBwlbj5TYP
         DQw7cikY81VMGGsdSAFgSLK3SNPsocTte4kcabFW6vz61hs8RwsiIZL/H90JlBECS/J1
         +XiA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+VRgQV1VkYAjMKkNYPM9QVgmFFAqUOvJwrRve7kcZSgtXkke1i2u0KfbmQ9joxa+levDUXFo3c7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIAkcRuPXu14tq00yoUaS8iEdMTdi/P+BDsQKngFYJTNyvyr9C
	jEC2oHehk6wNmUTpnk9H7lG5pJT7vQrAB775XPHeUYFbCIef94w+mvqXzMOsaspwmw==
X-Gm-Gg: AfdE7cmO1ntXoNHgQY9yGScYCNZV39+fqQen3kTSKOSVvOoklPtgatUY+ab0LSubCR9
	qOH1SZxj46sQUEfE6iR9+UNCWzUbmnFGRHBPBFz45ITKJ2UfUn/SjEmaK88tq5CN1JI7ncfZhlj
	+1R0+vQEd5ThtIbeNEXvdBncCGR4BnN+HWyEyQnZFd+UMsHPUO0cyQdDrU977fiRQ4I6Cxro8Vf
	271u/u63mweEGwQwmO9Hh50/R9rg4aiko4OjmV4YQIyy4mhA4CzyEqW16yUvQl5X3u7qB6K2REr
	sCFTlwJiNstsn589GLq3tWXT9cG9Kn2HAzO2SoHID1Vcbh3SUYU1zlktu61CBieBs5yOpDN6cde
	nkGikKBD7tYuxMTCLuGZR1V2HE6y0MeaQ+Ilb8N9+6nB/vsvOwY3YHPr7UATI4KsdOcTBd5yUN+
	ElIgTTvt4y9K/Sj+/ZRIUTkrBsVpA97iEFzQWKJXo8oueVU/Sf0bQoJAewoKRdrjCBB1d2gRiDs
	BTyct12
X-Received: by 2002:a17:903:1247:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2ccea373170mr66966485ad.18.1783591098706;
        Thu, 09 Jul 2026 02:58:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:18 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v4 08/14] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Thu,  9 Jul 2026 17:57:13 +0800
Message-ID: <20260709095726.704448-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
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
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index c7fa73673582..369280a217cc 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -975,11 +975,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5436,7 +5433,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.795.g602f6c329a-goog

