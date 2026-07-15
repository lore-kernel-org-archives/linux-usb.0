Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FDD3DEAC4
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105705; cv=none; b=XjhQ/jrjMkqGrkRBW+N8Vc53CAkDIWKe5rqBFtvPp3YbBzCiTocQv1SqBgPbf3eb3icHBbpuq68rwMxrwaObOyZA9Lc9UbrAc+wE84dMRZB1doF8R1tV24596dtQTGuWzjCQOn/sBDE7aI6hjeYBAh/FTqm1XvwohtimMELIOKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105705; c=relaxed/simple;
	bh=y3WhF+SuyleAojl6FwQNCSw5fjhd9v1zDhHyaW9zvKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBH5ER2fTGUU5aAUQuW/8K/gvYj4FvMQ/6OmE7lddVaBtI7yM6qINDFKsgMwPIlRtgkdcxYp3OkujSBux4aoPRubFA6y1tVokjbj27/tinZc9XyQn8W5VsZNiCh4SGteXbEBsAFf0JQSIQRCEwuJvnHhejKazY/wk7wRTw0JyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U4KiaC8Z; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U4KiaC8Z"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1846802b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105700; x=1784710500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=U4KiaC8ZHcotD1jLJItMvlRs1LXy3siwlGpuWwcVjaYsH2uPgbxhrljMsmmnnTdrr1
         7RfAyNcwK2WRn6W4J6jlrEh23rCKQsvuExVUc6LwyJLCH9L3hkelsyQsM7v+GW89vtSy
         VOPwlU3gDFh+6S1Id18vmddoN/2FGNbbNfknI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105700; x=1784710500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=eThz5I18hUM2yz1mNk4MllZNhW5erdec1DGDWd08erFXjP/l6xtxw2PshvRopHaZGy
         3WbNcEsAEr0ykrdUovGqA54lSbGe7HN0ckQgHzMUxMJNxxUmCaaokN2hY1FgIxsvsrxE
         ILybZIDYfqhkbdEmqpqwdxHp/cLTdNskjIhtq8KP7XTJOGon7SeCa08cv14f8vv97vnZ
         Ii0wFxJXL5Ojj5zHVevvyS/3IHHzrBQ6BNolmcQTrO/Wwz10BZi0EHOAMMcti9wG3xW5
         ckE11K9desr9Aay8qDicTaI6F/JmEeXUGx1qCRk8DjsUqghtujawzMM0nF292O05wkTC
         a/jw==
X-Forwarded-Encrypted: i=1; AHgh+RrZaC2jsFi6s3FMSiPR7Zg3QakwcVnLvnbU+YPT5atYb7OyjDsV6HeosnvTGCV093DQtep+bAM2AP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGRpBtdeDWd1PaZpSKi0D3UOp838tCCW0jjkWvgiCFeYT1HOK
	31FHroCnEeaUAXsiGTnGyPGcGSpylX9XL79JV6S3GV4UQv+RJYjYEZlZ31+Vk/5yyQ==
X-Gm-Gg: AfdE7cmzRI1FbMP/UBriRZUTHcHsG+MrpY5+KUv3TM0r9Kv4NFNa9IhECNAFH4GNLf9
	V2iRGKfgsq/bHM5blJMoXDBRePlmGHeAJW5Zv7w/ppui/IxMPaE9+5eS6sH9faAu8FrPujNrlIJ
	QNsJ7gccq2bzH93nhfflRM/RNRQ0Dcz+fsgFXVvaAhR8DBpGujMD/qhtivrwlkt5DYi9BiYtdnW
	rycoLOsLw2ouPywRx6FIP3/0n12ZL8o5VttwZF8FPzEoYaaTa91CAAWj1jvVHMloJfaDE981dFz
	4LSMTDbmmvFJD7cAcb6ctYltXonnsn7mECO5ugF/j9Bn6MRRMyrWq2PSpzGaYOii2zKq3OMw677
	zEVmIY3KtOk1Zs3RgS7TqENlSLTgppBdLFUBMhiuhiOGBtpDkqhukkNl/65SoCGalopVT2EkmHV
	yTHfObCOP3rZOKhfOTVYRbvifu3b9afMvjJKZE4BPoljb7cAEwt6w+e0oguQmf09jbWwXDpw==
X-Received: by 2002:a05:6a00:3928:b0:848:2f58:e1e9 with SMTP id d2e1a72fcca58-84870790b80mr18374319b3a.36.1784105700341;
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
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
Subject: [PATCH v5 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Wed, 15 Jul 2026 16:53:39 +0800
Message-ID: <20260715085348.3457359-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
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
index 40cdb63b5333..47010090d3b6 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -973,11 +973,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5434,7 +5431,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.795.g602f6c329a-goog

