Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B03CF1E4
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076675; cv=none; b=jhW20Wb+OR0c/9K6AKJGrrAM1Rm6ohTy1Benm7jXg+uNJBS7ZzgO1b//+67ceitfrB6NRSEU7hxREitZsh9plSN3ns1zPkmZgvCmwB1MCV8hAcX4kuii/VM4mGglvS3uP9WfYJ0Msgsvgn2iPqQ+Y33M2vbaxIxCD729qTYRsr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076675; c=relaxed/simple;
	bh=h2KtqdCw91jXcrcEtBdWKqxtEMrPwR1BFhKp6/mntxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWc6BOqJtdL8pj3BFYCABbhxOd3d4jrlpyCjPTu2XilwoaJj1SQHjABIS+YJCz9oXrl6/5AluieiO+zjMg7Q7isiYkB2zaYQ7vi+pc+7cFo18Bwl6ULSCAU8nxperrvMvp2dbGqEOLaARXCPBes08H3yPpXJ5Sdoopn7rkTNgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F/fb6+0r; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F/fb6+0r"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c8017e981fso4405155ad.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 04:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076673; x=1783681473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsnzo2At2D22M9h7H+DZqNmRRrbT1zORZI6ZvXqk3jI=;
        b=F/fb6+0rHG3WAe41QDmcv3rZlH7PGOltyMUV18ViBex56KL2rl5GUOMAi7lXvdeO1y
         3YGvrEmX/dfKWMEdK5W2S52masfORCql1v1R84UrYnl/Jqwchqy03mNYtZU/cVyTVv6W
         Yzu8805GaiViOOwXTmkCkMhQIoXSfHNGU6gFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076673; x=1783681473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsnzo2At2D22M9h7H+DZqNmRRrbT1zORZI6ZvXqk3jI=;
        b=WirMHXV134ZE5RksSuQXnuZEqy7926k+fr4+Q70zklzx1aPc1jlXorGOGQSec1aX2C
         yZPEG8CcufNpyFQ4EK87wf88EL6XRZhDcCyf72C+eUFy2L7X6XxGcpG+ZjS5b3NDLz5/
         IRczcrABX7b1Ub4e25Lj54B5QnjlkGWDbysVOqOItINgxtOiscwDFOWgE9iGDUbYPnGv
         DVkH7BH8hHsiFOmSRmWc9z+MDl5Dh2K2AbRBmw5lOJ9yNmWkAua25x6TD/UE4ap12d8n
         G63Mmj6XRiFzr8XPwR6v/A6zk2JeVe0YtKp6Pw+AsCSt8nMHg7UnZ7NDJ2IXWAJztV0p
         do9g==
X-Forwarded-Encrypted: i=1; AHgh+RpzGvw9yT7dKyKUTbDwRn14r19mI6WaOBU/ICgv4vmNGEer5CkpUZb2xgK1etqCswQ5P4CfGkqnf0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlNOHva3rh1Ni9+eRDhxunb0sLHHb5/BXXWaVQhjd/pHbYgy4X
	5qfp1dvJ7qJHtagoSMu7zllimgc42NuGgorngAdYMzq5BGc+GOhzlGLbtSHo4rKBrg==
X-Gm-Gg: AfdE7cl2Z14/lJBUBCjmEjDXPCUVpqzk/PAX4sSg93qGPFxIgHbTlyRNwSEgY5XMQmH
	08jsDqaVmmQ/9WpS2hMewEZPqQeG5OyTW0o58A5Kzn9dwnEHFH5n4obHqPCp45/LydF6PSrL+G2
	hhQ4pFK66hQG9brJfBhBcwbiKa18zQDrWRbAQD1wMTf/+DwaVnQVEG4qAO5nHd4DklzzQmxREQg
	nBxbBed+6NO/QWPaVSbVqGHgYvzDYdNS4asC9h/dn9RJhr2SwBd/4o15FdTvaB2g8bA0NsNY9C/
	Y4RKoq210ZuaDgg2MEwRK1AEifwbLS0DscLJ73o+hHi1lu/wGZIuk9VJpPBX4MdVUNraoSTBfO6
	4YU/RW3yaYXeCJfaWX6zTkIx3mppp8aGULsIXMNR38qZNr/4X43rgixb8c22tM0wyQsCTcFQ49g
	d74PeEVt9+z1f+X3SZqEyf5D6x7Y1900CMNzTkvsw5f942D2PZ1C2X3nuEwOCX7gAdgD6FDw==
X-Received: by 2002:a17:903:2987:b0:2c9:97a7:f540 with SMTP id d9443c01a7336-2ca9120fef1mr94980545ad.38.1783076673338;
        Fri, 03 Jul 2026 04:04:33 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:32 -0700 (PDT)
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
Subject: [PATCH v3 13/13] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot
Date: Fri,  3 Jul 2026 19:03:14 +0800
Message-ID: <20260703110317.1283411-14-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 92 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..8316dd41ba23 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -86,13 +86,11 @@ pp3300_z1: regulator-pp3300-z1 {
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
 
@@ -159,6 +157,17 @@ ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
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
@@ -193,6 +202,39 @@ adsp_dma_mem: memory@61000000 {
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
@@ -657,6 +699,22 @@ &pcie {
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
@@ -1000,6 +1058,13 @@ pins-bus {
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
@@ -1164,6 +1229,13 @@ pins-bus {
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
@@ -1343,10 +1415,22 @@ vdosys1_ep_ext: endpoint@1 {
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
2.55.0.rc0.799.gd6f94ed593-goog

