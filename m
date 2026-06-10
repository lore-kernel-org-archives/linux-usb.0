Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2953D9690
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080943; cv=none; b=nu7XGZJww6blZ9Ekk+4eY0q0KWDi2bLhJ9Euq0LAxyAj/T2a6TycSLQi+uBSDH0E6YTgTTS5Bo/KD4V+vu1qZXoIlebAXNVRHVjQupOviSXNCNK1zrqJaw0bC8e6rXyK2CIA0WL0gfKKGqeGzIQEKv/eudXwyJzlDd1w18kAbxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080943; c=relaxed/simple;
	bh=H+EIMxj9juaYlu5/QAviV83PdweIQfdGFZaxQ6cEvGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQS0KihX61c+P7RFImf6x6AUUVaOdVzzCGh7JgUiulvW2H0sAPDnHEVMdRe81a7T3zKEBTVbAJnryUGRTZyHlTcVpJ87t+/gdsRB9GSwpypj/A1TJqOy9DCGij382uoiUc8HRU5TNqZFP/Ye1STOA3mB9YLuNuf+Q+dXzwIrxzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lb8JCM75; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lb8JCM75"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c3546924so43240605ad.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080941; x=1781685741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N3jX2N/52iyiNHpRxwGQULSKcGPzXu4/gET/t4pE5E=;
        b=lb8JCM75bQPAv45iIL6tkE4911aa+IJJPpcvd7IoLNfBWv0BEL8Z5tFzzDjTbNanuW
         aYlax1C5jsXYp3u3UlXSz8cHWXforBPz1n41/oHrrjBS+kI41X50Nr4UnOSKfdENcZxy
         6Gcy7+9QD+YIJRiXz16rGngZUMLa4Xgu4OPas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080941; x=1781685741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+N3jX2N/52iyiNHpRxwGQULSKcGPzXu4/gET/t4pE5E=;
        b=DwOJQsfUEUkYbnnQzG5EqBrIOYV4r5t4tpow9qVogFp9jV8H3xHkVdl+DQKyEAu3zA
         7K5msPqzMMljBl3ovTosUPwKyS2FilQhZxk0WMJvXT8JOzoLBHsWFjnYnu1CHRZrUCNI
         yUburFyBpU+BfcZ7WGnC2LOeZ1ZXseYnk3027SK1DsDxXPfko6/aK/Y8uOzHaX6E/mi7
         61EqOaN+uXLuywJewzSGBeUDHqs17I44Xkqe5Tq8HwE2VwlgHY/kOR+1FWbxbGBfcDVt
         JOYz6KWd0jGGgh8ya4gnZRdQk2TROL+Dn2Popn7fjQe3pwrg3HpvnDpjfJs0byfKrSOQ
         sqMA==
X-Forwarded-Encrypted: i=1; AFNElJ/6HV0dbnNlct9j6H5y/TjKpwxT5xa7xGeSsDt/5rS3k2zEaFnxBXYOSqvrUofh6JGgBmMWWYVG7Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgnT7oG4o1IpDMHdY1Gwcg3wv25yOX9hmyK2DmNaKM9hkdgNnG
	S7NCdXHktabnxSv9bLQmWp/7O56wXLeMzNJGVWvlmxzxHx27jzRPfkWo4FyH2yAAzQ==
X-Gm-Gg: Acq92OGt5PTwmCH7aZxA1duitHmFab/uWT2Mq6pL+ELwN9Dllntcz9UpzwtZcijeUTy
	HDQ7V5/DiT5aDq0xRpbeZ/duFF0RfAZIAKzILB9VE7I5gqixckaWpE5uTubX3aZnmrCYFQgmyF/
	cMZIrzCBqDs8FaAUqBswpMUmSfuzPLBFH2CioRWOYSEHRY0ICCebqHTieE/xKOydpJfDnYIjCik
	ZBcuzZePaN7HGBVx5vz/vgSPkUr+ilcyBJrlFhLTfHgYy1bwE1gP7VuHjxWUoPuRuAa/T65O0IG
	xhMFzgtTnm/S46sjkpm4DP5VCkWYK762avKZQEnirDiEfL3A90PVMVznzbu67cSOAdfIP70eZgt
	sW9GOrW8UMnjmxU6ZxgB6EV89+iSUc4XpEN20IBign+TxdONdA4Vr/zbcY4K00eVkRgR6eP7glc
	rdqRHNM9+W1ANJglAW0cY3BxOLqcyYvhpEsGdv30Fn/a76sOFNL4gd02ICtSHLkVSf8YlazbQS5
	CZGPimZXEMJSwlGnQ==
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr271721185ad.29.1781080940790;
        Wed, 10 Jun 2026 01:42:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:20 -0700 (PDT)
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
Subject: [PATCH v2 14/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 10 Jun 2026 16:40:48 +0800
Message-ID: <20260610084053.2059858-15-wenst@chromium.org>
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 74 +++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..c95a54de3567 100644
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
@@ -1085,6 +1126,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+			output-high;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1686,24 @@ &xhci2 {
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
2.54.0.1099.g489fc7bff1-goog

