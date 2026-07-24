Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C0B3E95A4
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882731; cv=none; b=FjAdUghlPwTIsI23CjqAIpOieaFOPRlE+uerdbnXI8e5RVHbTEjUOQ6rrup03BY0PAg45DCIvwRSZ7N9L+ODMvm/dIYKVIr+oOJ8SBG02mHB4M7Q1SQ259RBsge8D819+ib+rs+PFFYF9hdljvAV2eOg/gZQJ809zOnhl2xgcQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882731; c=relaxed/simple;
	bh=mNpG544f4x3HV+KP/4A0iAH5FCpy/+89CTapAoZKNGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onudN11+qP2yS3bAUlyL80dsE5+VrL6Glx2VFHREd3n2rn5GWqWOVVfeM7jMlv9Szp+WDJ5hnoaCNFJAMfIIL0KehfluTkR9CsC5kfZFm0GBDw2Rn9HMJzQGs5Ln75yydYhpdIEyy9Qw6yelmByCquuTDV3tqgGud5aB3yATSWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j6xxCHeZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j6xxCHeZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso167986a91.2
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882728; x=1785487528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yabl9CFEsxsu5a/1yJNSCfa/j6/qqQrQ3CInFfZaiRc=;
        b=j6xxCHeZXbNDEEKhJlJKtEL2IBzxDezAX+JJ0JwcGaGvUlpqLNB3ywgYSNrYuDdUDf
         zxygXdeFoQNGqWLI8V3ezxpsnqYIZMAFXp8ve+Ept6GbhLVPLROTrqgaz+ZYnb/w/CEA
         IFKFd8AIwfKmUyEbgx5BqmG1s7+tY65s/r8oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882728; x=1785487528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yabl9CFEsxsu5a/1yJNSCfa/j6/qqQrQ3CInFfZaiRc=;
        b=p73QQuaocZXu6BCV+Z2bcnZomMHcp1SjmyHgS3CT+dNLXNhHXakOJFaMG33xg7Isz7
         /995yQa9H0zrLI3ivX2YG7iPilYSke2eyy/EA9Xuwiow9kHBkT2z7p9gyZHSF2qsYuEr
         QINUM7WZbByyTHhXYjADGSVecHWa7CIZ+Eikcwc8Hfmgqt3Q5P/5UGmU79YbsRNidO5P
         HPsYefm6Za1+hyr6NK7FjQflFSBWKa9Ue9qRJc5hPXeuD9dLJ4ejYnBZo9E1yyXXQlKF
         FWPHXqYOFTJAOTH290we39W15Z/sx8DsyCPyEXYgR3MczoIXvZLiMJ3ON9PtXp0Tw8F1
         L7Vw==
X-Forwarded-Encrypted: i=1; AHgh+RpOtL9/TLwYgsv8+4zyXBbxUMukb6unwMqtM2bOOSM5hpEEm7DYZhlqaWgan3Tcu1w3N+nVUcLZlHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgcC1aPHFLcvKMZtX3AsEWYWOJ+PCyqSjjNxH/dHhQb528TT5q
	6cvByQioRh2t/cAEN763M6sWmkUB4oOP3u4XeOKKLJO6sNlc36amtVmvzBqK148jZg==
X-Gm-Gg: AR+sD12+scqp6QCzEGEkc3Eda7SRNmRoYcRvtZBG5aYrryCJYX8UYfdMKsNAQYiL7Lz
	x8KXz9zyDZ8h2H9rooSnwjC5eKiSl+nisplQB7qkI+82//9Y+NjISaDEWT8WmMMdMTvCasXRSg0
	3t7ifFI6dUA/lrSKB11FXh2y9ZUqgscigXCobQdiuX4LT+cBEYiCNJTOMrVvBWbJ/Y6tgtMQnUn
	FwGHK5U6OqacgbdnmNasecZRVkn1zOXivZWSASBFY3xi92Tfi4pd/sydUxV3uEskIXMAX96cjyZ
	wzVmakGwr86YpPIzzHo+CbA5S8TuzUaWZRAHxGblnM//P8ZWEBXHBvc06UWAEXnnIZOakJrnjTP
	nlcn/yj/Fr57Hg8fqMDIhH4RKzUmAhy16RwIgolSsToMX7THHnBDpDUc2TCvuEmwrtg3uXf/7RK
	xEdpoeFrqog9vWxyLtgmYko4GNDpythEUAD8QCR/wU7ng1KHdt8T3izPZRKyWLde8MHJiZBQ==
X-Received: by 2002:a17:90b:38c8:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-38ec642bd98mr7208354a91.13.1784882728495;
        Fri, 24 Jul 2026 01:45:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:27 -0700 (PDT)
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
Subject: [PATCH v7 16/16] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot
Date: Fri, 24 Jul 2026 16:43:25 +0800
Message-ID: <20260724084328.3943997-17-wenst@chromium.org>
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

The MT8188 Geralt design features a chip-on-board WiFi/BT solution. This
is a M.2 E-key WiFi/BT board layout directly inserted into the mainboard
design. The connections to the rest of the board are almost the same as
if it were a separate M.2 card. The only addition is the PMU_EN pin on
the chip; on M.2 cards this would be tied to the primary power source.

Model the chip-on-board WiFi/BT solution as a M.2 E-key slot with PCIe,
USB and auxiliary signals. The PMU_EN pin, which enables the internal
power controls and regulators, is modeled as a regulator fed by the
pp3300_wlan regulator. Since power sequencing is now correctly modeled
using the M.2 E-key slot, drop the "regulator-always-on" property one
pp3300_wlan regulator. Also drop the comment in xhci2 saying "MT7921's
power is controlled by PCIe".

Also drop the voltage range on the pp3300_wlan regulator. This
"regulator" is just a load switch and does not provide any regulation.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 92 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index dee946309121..73b5c0fdeae6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -88,13 +88,11 @@ pp3300_z1: regulator-pp3300-z1 {
 	pp3300_wlan: regulator-pp3300-wlan {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_wlan";
-		regulator-always-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&wlan_en>;
 		pinctrl-names = "default";
+		/* load switch */
 		vin-supply = <&pp3300_z1>;
 	};
 
@@ -161,6 +159,17 @@ ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
 		vin-supply = <&pp5000_z1>;
 	};
 
+	/* PMU_EN pin controls internal regulators and power sequence */
+	wlan_pmu: regulator-wlan-pmu {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-pmu";
+		enable-active-high;
+		gpio = <&pio 145 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&wlan_pmu_en>;
+		pinctrl-names = "default";
+		vin-supply = <&pp3300_wlan>;
+	};
+
 	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -195,6 +204,39 @@ adsp_dma_mem: memory@61000000 {
 			no-map;
 		};
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie1v8-supply = <&mt6359_vcn18_ldo_reg>;
+		vpcie3v3-supply = <&wlan_pmu>;
+		w-disable1-gpios = <&pio 13 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 14 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &adsp {
@@ -659,6 +701,22 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
 	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
+		};
+	};
 };
 
 &pciephy {
@@ -1002,6 +1060,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO13__FUNC_B_GPIO13>,
+				 <PINMUX_GPIO14__FUNC_B_GPIO14>;
+		};
+	};
+
 	mipi_disp_avdd_en: mipi-disp-avdd-en-pins {
 		pins-en-ppvar-mipi-disp {
 			pinmux = <PINMUX_GPIO3__FUNC_B_GPIO3>;
@@ -1174,6 +1239,13 @@ pins-bus {
 		};
 	};
 
+	wlan_pmu_en: wlan-pmu-en-pins {
+		pins-wlan-pmu-en {
+			pinmux = <PINMUX_GPIO145__FUNC_B_GPIO145>;
+			output-low;
+		};
+	};
+
 	wlan_en: wlan-en-pins {
 		pins-en-pp3300-wlan {
 			pinmux = <PINMUX_GPIO12__FUNC_B_GPIO12>;
@@ -1417,10 +1489,22 @@ vdosys1_ep_ext: endpoint@1 {
 };
 
 &xhci2 {
-	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
 	usb2-lpm-disable;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			usb2_ep: endpoint {
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.229.g6434b31f56-goog

