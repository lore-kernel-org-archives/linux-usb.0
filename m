Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6B63D75B8
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080934; cv=none; b=dxBbkj/HE7qeUYj2k+8z9yUQvz5UTUz1W+OhW6n1Ctkh52Z7E1Kh/35gSIL5atYaeUmSGYpCs4ujaIv/C0UYV/uvkZDDczl+ZAj2MoAQ97Sdahbc+VBYy2VxGgwiWppk2UFizcm8LWXDCxml8xCog8LFD0L0zvCrdq9rRjl4qWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080934; c=relaxed/simple;
	bh=rV73mlDiXmF5Z2ojMFBLCM4SIkcjQtW4k2nOaQI0FbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jc9jpfphf4A1pgnJQ0Fls0zMUxQZSU4qMcnRP3Laj5Yq6YsYQm7D26GZBPIn5fHbjyffaLSuZ2WropKqqJMrhxRGxW0T33TuC9xoTL+CCRQoFjaa/QOzZJk7no04l/VNnYSeSJTUkAedrFaWC+sP1yfksY1fXqxc/lXtj+f1DSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=efTq5iDM; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="efTq5iDM"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36baec934b6so4233789a91.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080932; x=1781685732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=;
        b=efTq5iDML1g52IvvhY/ADbNH6pZM77yKZG+t9DvZiKu5le5iL76Cwkkr0r7V4qko/u
         WWhadTOTUFzHPYzPEjdrTZRirUkCMoosKIMYT2q1P3GQ8bWfm+BcBFQzgBOGqwl2bbI9
         JJfQDBFC721l5aVnrqRigQKpA5u3KquA9BHh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080932; x=1781685732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=;
        b=nMMGTBuXga3DiRWOd87xiVOYsq6FxbQ7uXpEE+kiIV8iJ6BsdVN68O4HH8HFx8A5zn
         MLlvjcYT32DxgfntFXXktBWuETFF6nCer1e+ynr9VxERTvcqSgCG49tBmVZFwoY+GGs4
         RJcUpkEVRMjvaX1gK6VomNCzpLgsgeDkfR+qrMIlFMwYoOjLXOMUvHlO7PH9E2ICwmHv
         cyFaKGofiWbFQ15D3VMfbtK7SjxhDQmFnm3oJCz2E1gUzV2GK0VZg6Cqmo0apBZep5rf
         G7PtzXppw369/zLVxSajBSrJUnn3ZHTiWSXL/FtR4fyLLLz53mWwvrccihz6dX8MITKK
         13EA==
X-Forwarded-Encrypted: i=1; AFNElJ9O4Zl8st3uBhVdn/XDWcA5Z+I3Nqot/KzZLb//avueE2JwStw5lFqZWIy8IcFYVMSNoYCPRzq1c/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUwMAA/AwMAABIvM33aclVV929ND5Be64aNcIxLlS1KBTHPFy5
	ZmXe1eoOl4vzGvQ7dg8fqLtPZ4WzgKmkIgRW4FlhlPsVgXsyOTqx8q3kVEfO7lD1uQ==
X-Gm-Gg: Acq92OEAcZBVj3C70Io0cqx/lSmKwLlGiC7t5mXFX918mwK9E+69TU6AzJpsDipWglq
	50rdZIfuM2qMCvGCcc/FbHNBj0xs2uGROPtXzaQR6nn/zb1mh9vnj+5fnJUjy8UN2EEfw9uFMoz
	q1H2n/w2uHqutaPpv4y2GN2yb6J0HNjlOWttlVTdePTNSVkEf0OaRAlncZ7XE+qKtqaT90MgCjY
	qAOMBrQN1ogNPQHtITkNsnrm8TgbbqxegmOMHu3VRe1/sqyt+Tbgbyue/6i1wOpOozVTYoiiyBt
	FW3WE/4iNBZZ7+mugrpaws7S6z62c0vowTTv/xypkFvLObl7IlnJdz8+W6BZajr3F5bSxXGnibd
	jyf31XPmOQVzpcdAfdAIBQUK84SBYkOEmRDkTPM6O7K48DDVTXGAtiX3xbcuAuZxO2Ok78/Q8Tk
	uUatvfUS4kJ4dIKHcRhUSkyCn5gtcRdPNI043tPzpmpc9JUsVKKv/ke7yg0tf+9MrsYfgaLdsK6
	t8GRX75yFhyO5b+BQ==
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr217649415ad.7.1781080931995;
        Wed, 10 Jun 2026 01:42:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:11 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 12/16] arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
Date: Wed, 10 Jun 2026 16:40:46 +0800
Message-ID: <20260610084053.2059858-13-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT8192 Asurada design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index b7387075cb87..fb4d92750770 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -292,6 +292,32 @@ sound: sound {
 		pinctrl-24 = <&aud_gpio_tdm_off_pins>;
 		pinctrl-25 = <&aud_gpio_tdm_on_pins>;
 	};
+
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&pp5000_a>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_u2_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p3_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_u3_ep: endpoint {
+					remote-endpoint = <&usb3_hub_p3_ep>;
+				};
+			};
+		};
+	};
 };
 
 &afe {
@@ -1702,11 +1728,53 @@ &uart0 {
 };
 
 &xhci {
-	status = "okay";
-
 	wakeup-source;
 	vusb33-supply = <&pp3300_g>;
-	vbus-supply = <&pp5000_a>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
+		peer-hub = <&usb2_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb3_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u3_ep>;
+				};
+			};
+		};
+	};
+
+	usb2_hub: usb-hub@2 {
+		compatible = "usb5e3,610";
+		reg = <2>;
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
+		peer-hub = <&usb3_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb2_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u2_ep>;
+				};
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.1099.g489fc7bff1-goog

