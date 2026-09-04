Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8344229B0
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511354; cv=none; b=aIBBYqkvoQSl2Q1DMgPZ2NdRZUJxMwh0aUpUMU/Lx658rcwm0Vj9jrtfV+UFoxlEB5tWmVHomM2Hk1KBonOZCHNzOFXxc88xCquAuZa0tqYhP4HO9v0pw6NZJGSCh7OiJYwiwFNrQcXgYWmHO4T7OJMEIesqyh/NcPKvvnLUNRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511354; c=relaxed/simple;
	bh=B7Lu+PyhQKrwbSeiWnA/FCibSLvQ75jT0I67pSzcZQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmRmXDBY1c/QUXBSs1IARL0X/dcsSY7EqpE3XCItirY/7fKtbdi7SPSNF8Q0HAvTMyKEgGPXWPbtGJjVsEhjpACG+v1M3ttA1l8rMcmQH5MGeMUbDb/0E/YS2eny3Rk8IwwKteF5/aNEcl5KFsciYHnoFoCgu4Q+5wxn3MLf4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h+g1pKBE; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h+g1pKBE"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381b831d535so1190883a91.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511352; x=1789116152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=h+g1pKBEmSf20QLY5llg49jgQylsjtbjFvxfP/fbBHy4rESg23r/liAcIo5ecMNYYA
         Z/FSNmOWFnd01kkoitWsqbWItWzuQgyEUEmMNTsvksJdk2SVFDLxWPkXZ+D4kfaIxFtC
         nRNKUdCW0bNipWdS7AzycmJwEy0AxLgkBTVzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511352; x=1789116152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=qPCAkjc4hoYCrfU2yV3jqcMD3nNgjuGDiOFeSf658MTBcFbukWuAgSkwYK/IV/Feif
         CQdMgsm4zpoEwBguTVtN0o9zr9d4AJm8w5M4iSpoTYnKGupQYJkC2ps22F8CQji3Ctqm
         Zq4RP11KXy98JEmiWgHrxAswE0ksUQN84avDdkWrm9aFsTzd9+AR1dbxHFV8JITaJuLa
         S0wiNc3cpQQy1B3Ob2uywpdiQ2UqjBPj6h/4pxG6x8kWwgQ+8q1zCrGoyRvbJ38eYDJt
         j8ceNKg5M+UNb+w4qvUakWkZ0WExjg7qWFpeN0M+MZI/K1Ps6lYITfs93uVEo8GITzAA
         fnaA==
X-Forwarded-Encrypted: i=1; AKwUvBwG16wM3h9Vol9wmhartZ4IO4/WHzm82ZfWtglLxwwsIHZHKtfzs5Xr+gtamjJ0th5x99TDBGIdE2k=@vger.kernel.org
X-Gm-Message-State: AFuF++mjIdFSWlxF8ck4sBkBGJZ4oqIFVrJDnTilReeWz+1LxDn4ev+w
	cWyVfQhMpYpt2hukGMLVZZNntwAivgs9e/R0yCqfNINsQztuFR0JWRGTvsaS4SNfjQ==
X-Gm-Gg: AYBFou0EHsRoiiueZdwyrgh9X4CLOg+sOy+6Wo1YMF63DAG6o8ca30bGzRnXBlD0eRt
	8ptdJJZnCM0+A1MWqGQXGJvVsbKh2GTpfiyjge+O/Xpm4EyRljQeqhG4IM1irqWf7p7mT2JzCeO
	7ZhMLw3tWuJ79MH9BSgqsiWCihDOhl5Sm/np7+0Vs3fVyLft64wmgJ/TbFTvGchuAal2qOqDZBW
	MqQczVIkKhjJitAaqAQyH/DuNQkktPyepdEzXShboT79WayXidk+lKgakeHKiMDqGS1g4rDHSUk
	N+MjMvDKLreQtzhGW+YOlCVMXlYg/dmKe1pJY81m7uswKZHp+/yKGXn6Vyc4/J3Cd5yz4+JJCHS
	CSiSNCSGupmn79dN9EynnCyh7ObFAhWxvR+v+pJ7kT8WEZ6NPV60UHNN7/OfD7pRnHY6hjWNuB1
	e+TCYZn+PL/vVBVzw6BfePclrkOU8jHwa0UXWTVZicURZE4BfpUwy6Hc/x2qGPcn6ueUofSUBg7
	eN3Pe3+hVtWbH9N+VGtf3sP966+gACh1yJfk8Y5yk1h
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr7387796a91.18.1788511351714;
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Fri,  4 Sep 2026 16:41:43 +0800
Message-ID: <20260904084158.1341550-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..16e03ec8d1ab 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.979.g7e5102b832-goog

