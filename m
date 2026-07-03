Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEDF3CEBB7
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076672; cv=none; b=Ei7oZu9orO5N2F+Xw7fVW9QVWiwjPF0xJabeGbTIJVBeBdGzMjJ/o5YaeWeuUgFKi4a/DOIZeyT8gR+bVK/0lSZgR+n7ATXiZNJkcmnXCJnhDEhiAnK9/niXsU8EAQrkBsZIgxCRZgmDbxF4KH+8OfDDflDdoeG5b0Ls0iKZjzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076672; c=relaxed/simple;
	bh=e3dvC7GoRiFIjE9/RFFzIWSZ9JOa2nwITKE1S/UptxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A9/ZfH5WYdpajkiWRT2EATZuIk5stmbwnUgGXlQwwL9zJZiZ+vt2wn2voSyfGpUzERXFdVBkK9wIBG2ymUT3rh1a4oXchEN8vUH2yXLDGrl1oD3dpaYfB4kB3uiXiPqeGjHz/PJchqim3TbhnHIlou1/QKK6uij+r6XwME7tA3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eKo5CCYd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eKo5CCYd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ca70925c25so4795685ad.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 04:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076669; x=1783681469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=;
        b=eKo5CCYdO/SByr2xw6S9SpnCIHoQ12uXhMxJTZAuMaCp3Znk3aMbISrXUhbAK2wV6X
         HWrmZbXexh126KiQF8wOMdnmguLpE3wTU3L3+1gjsvBdxOSfzSu+XuC9x0IxeLiUEim4
         4u3NmFB2NMFRiuyGwAvBUmPgy8N4ZhsMIqno0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076669; x=1783681469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=;
        b=frt7kiqyQDpesKaUW3qsF3tQq0k64iEAugsQ+j2EFEbYO14c79mddSKwSxv7zeQfRn
         AcHWFcZPpUph0hc4+AJTGA3aoxFAOLM5CVnDghZ1ETkENlwPujvsiiifj9qU8qldNH1h
         iyTWNn93//gap+ixownjoyjaBVn/awk8PhB3+5Q4T8Krin72EvMuA0ZTBtTXsvHzOoVF
         zw8EVdmTFVidp1oLpjGzD+dToq3g1sFRoLBhV1IzyKPkRSzMUH5XppnILLPdcN/FnJ60
         Js1VN3hyrZgAxHpCoNvDA8HdiozBFNmXX6qzZuW4lWMdI6+tuq5E6MUIrVTxHP5J2hUf
         wXTw==
X-Forwarded-Encrypted: i=1; AHgh+RqvoF0Bc7/HzQXWKG6Sj0S+dAYRuB7mDq6RD1ZDLVhxBw1TzXwVm0lQHCfmp03vZbUL7OgcxgmVpwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNfs1TX+MEMM7OHWwfvryAq/efyo+OUibB5Rf1luwDSC6PTReb
	mFoKSU+7hcFLd3IPhE/SsaVGrYlYBihG391JurneCiq2basn8wsEgqyi4C7WAQQzGA==
X-Gm-Gg: AfdE7clxtuxd4PxLEQCa17SplHf0CUsqTPa/FvLBhph9iPjflk9WX0qlU04XqXauy20
	PoT01aMgCaWL4xCL/WjXsKAu4Q7QQWh9EvuQum7JzvuI+KvOhx9EkfBfqgjUboMvlSJ5INORQ4o
	Bybxg9MlteeoQ/XSpuB5rv+T5DHGNrrrB9yMcU4otr16itJ2RMA6Z+2YMVJrMDqRM93l4Nkbrd+
	4eoUgxWr8BuPArKBT0248P+O+b1i5dEK7dq9qyfRSxR0GbY6G1bKkOyxkbkvS3RMEbKBJRMsCTg
	0DP+AZCiILrtOTlaLVs0ga59SxC24jE2Gw/bK9zkOByOoDKAY99nPfTugRuVClc+inta9AgfHig
	q4VcaXF2RqdpPQ4QVg4kdcJnv0rLSxEEWNc2zpDsI/G7GCKCEH/+5TOyL7YbAD+5DBD0B5v4pgl
	Zh5co4MM4plJbE/+cbr9md9WCfxgYzqnPzI9D9eHMRAG5vqwsmHVmDEt+dqKE7Xj/PAT6EcuLM+
	kyY9Il5
X-Received: by 2002:a17:903:19cc:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2ca911ddec4mr103561175ad.30.1783076668529;
        Fri, 03 Jul 2026 04:04:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:27 -0700 (PDT)
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
Subject: [PATCH v3 12/13] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri,  3 Jul 2026 19:03:13 +0800
Message-ID: <20260703110317.1283411-13-wenst@chromium.org>
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 +++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..8d4cc30d91e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -266,6 +266,47 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wifi_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie1_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				bt_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb3_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &adsp {
@@ -791,14 +832,14 @@ pcie@0 {
 		reg = <0 0 0 0 0>;
 		device_type = "pci";
 		num-lanes = <1>;
-		vpcie3v3-supply = <&pp3300_wlan>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi@0 {
-			reg = <0 0 0 0 0>;
-			wakeup-source;
+		port {
+			pcie1_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1085,6 +1126,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1685,24 @@ &xhci2 {
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&pp3300_wlan>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.rc0.799.gd6f94ed593-goog

