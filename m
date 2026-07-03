Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A33AB291
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076650; cv=none; b=PoplCi5/oEFOckNRw3S+5douENR2t+xtlexfNHGbfX+Cd408W7C/ZYKy6GAyXPmbuB4Hfz42G1vUo4iCmPWR3LgVD2FkzI4ULWwsL9zRXXypZGu6y4tavxaQi4b5/t5oTaxaRwY3PqyuFqdesBONJQhwX81vWGcgpw5yTbwaxYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076650; c=relaxed/simple;
	bh=kfKxqCT0AnFtztM5LFloMbjAp374Nxm9lZYgvpDSr08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKTi23sAEiPQINihUkNPqSXk2RrVH09eEflYPKyPGvCmNoAjP/vt6wSqrPK9LVpayv1zPIdZlQUN9BQRtuunW5UywOSnELYUEfDRVuBqYjfxPHlObS9tAZ/5DpeyURknF0VUBLkf+smVmRShWd+OHdnLpT8qUYB8125De9xFx4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O+y53hif; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O+y53hif"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ca265d6ca1so4872075ad.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076647; x=1783681447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWC74RHfH35yZoE+4T5JHX8GhXugEkV5aHendXMIUrQ=;
        b=O+y53hifkvRjzCdB1Ewt4af9ZOm9SggDwvEJcCMPVVHKv1yp8Gbw+cRAFQico/sdvB
         hNaBm97fEzqrTz3tgnzTaz88hYMd3i0/OXT6/quW1A71tbzXOy7TiyxZx934zPiQhWHA
         mGEHwld6RTwBIzuxi4JDKIsosRAdGgEZg21LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076647; x=1783681447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWC74RHfH35yZoE+4T5JHX8GhXugEkV5aHendXMIUrQ=;
        b=NEczuFTbJxx0+olUkHq6j/IDJFWKHDCf8uVjk1Mt0EJ+9HmeeWXiO7guOvoiwMUfWl
         d1IF9PoTB1/+zCeMKBmaVSwEU+oD7duiw4YpS+NYq2aXiZt0k6VjJUAiEezSO9Pou90t
         GY7jjyy1IH+ZOJkj4/Ttd/YwfyEI9BYmYuMVs314kR3kfUEO9HHX1Jf5YJv2KltXKUM4
         OZ5iO+0f/4eaaQR3MOxkF6vdTj72jc12LDBZb3eD4VCvtFCnLbyfUFFLe1g2UpWJnk1h
         BzLUgc8260qeuNAt2eOZSz+v6H3zDz8ZTgo3HIutL20c+oKYsg4Ruw4PB16JLBbHlm99
         eQbw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9SOa9fVaPJjA74N3L5JgM2ukTp0P7NR6Igyqgg9KIDQiMWws12ue2UOnCKBvJgGqKigPo9gEoE6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXTI/5a/HpeWyEt/QaT5ayQbe2B5DViluH2956KmgwbGRTuVo8
	4/nBUhIqoute+NYzOd9qxoLHFkoTBfx2EtwI8fKStj8USd7P7UFea6uP7MVJLWj4fA==
X-Gm-Gg: AfdE7ckMn0jlegFagyIi/twamfKYAFVurph4+l5MXVfLrqNVghk0jUw/QbyTubXwHyq
	UIdzzO6q+rQzsJvK8O0qc7vDOqtLkwJ4VtHnnfwGIsGYlIlIk5aTOCdz9iJT9aaQdbndc+vB7N+
	GGV4Lh9ggjlLdS92l1k266S0mYG23Biu1u7p6eiXipfzWxBjvMbhxFXS1qGkiEw9LuIknDzK08+
	uqVwzw+eHjqb7Fp/zycx1BKFJXt9u8nYtBjLDIkutKN/wwF2p/2wO2SVKVI+M8Ut0CPKaKOxjei
	3YPF2soy/LXFfjWUvH8M4EMJV901/6kfgTaqbwNUPVCo9dOuPpDxo7aExBuShPkfyxJ5O99wtug
	D+6NTksEWeS3Blwm4ib6mN3eeVdg51JludUwbIMU+rF/N6GpWWG52V5wn3ey0/O8SOeTmaORlCM
	r+0wk1bp9Ef7YeXxjLTrmfx3q5NM5WQPNutjQSe361Y6rF0ihyAQ6MeZj2rkQU1ehLLT2olA==
X-Received: by 2002:a17:903:3b88:b0:2c9:d27b:af11 with SMTP id d9443c01a7336-2cacacc3ccamr39740205ad.11.1783076647262;
        Fri, 03 Jul 2026 04:04:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:06 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 07/13] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri,  3 Jul 2026 19:03:08 +0800
Message-ID: <20260703110317.1283411-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index da0a4cc8e15a..8ae97e8c26aa 100644
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
@@ -5452,7 +5449,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.rc0.799.gd6f94ed593-goog

