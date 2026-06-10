Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE55C3D47D9
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080938; cv=none; b=YaxeiuFdjuLCdMhxhD0zAQeT26eww0BL5vLfYTNYhQv/Pcmp3jfActUnpQhlskS/Gn1DvUJTNeNMZDdGP5E03eANsj8/7CTK9WnLoQ3xpGfVzAoEWPTUBvgJH43+/zQ0AQI9i5ficXqWytWqTmGzeECOoeySCGoyyZPymA+23c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080938; c=relaxed/simple;
	bh=eYDsSekKvQ+9HqNvE0wh4Qv8KZgHot5fG4txdifkhHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFBVVvcw5Z9Eae6YMDsWpDaJuflghtcPks5RNcV/DlAfrXSTSO7l0x/WhWeScTcGhee08NFI3Qpfla1soXhwteroVde4IeMLyal9lvn8nscs8Lfw0ftplydc3UMVbgVq4oC+PhwBGmIF826Zc1f7612v4uB3J5T4GI2M5CtVLyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fBqFRxxw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fBqFRxxw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0aa420401so50161535ad.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 01:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080936; x=1781685736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTmbH1zLjGPBws1HWPEepttRsufOS8aO88js0ToljD4=;
        b=fBqFRxxwPfwrmt8r4XxXl1Ar1hlbSKVWm3NyDy5xK1tiVN+znJN6unsf7jQdX//I8u
         yWUjc7GiSMJWNpI7QuARLwaRsV0uzJhrgDp/RMFbdtWZL4N2qdPOeMyXViGUZwxT5SBP
         wVZkyW6QpJY86GGP8B0rQ2/Gdp1bHYr3Ds1m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080936; x=1781685736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RTmbH1zLjGPBws1HWPEepttRsufOS8aO88js0ToljD4=;
        b=jKwJUMI2p/u7212NbCl7sD26WvzchV6SKo43Drt9SqeGbBPf7cYd/2al7VsXpIoq4Q
         kWpLVUek7Y2fFuseYJ8UIsi/Yq1W8lGEBmPHj96UgpTY0zRnM/YzJjYVqPpC9gz3a6dk
         hogI/5x98dIXrp09dP04PyBeOpw/3KX3pYKghYbXsdG5gwjIzzymynUc4M1meMF6u7G+
         3p0fk5DPUEtnHSt1TG48feHo81ub2gWsVjT6cDzXAdSQY1o2Ut3oCGcbFZyLeiHcLNRC
         1ro5UAdWKdkNcFuigqHmqBzxocY26Ncgdqi/qNmgY6G7cmSKNCdmqligIpLz+erCZxhN
         MD5g==
X-Forwarded-Encrypted: i=1; AFNElJ9NCx3iemFUhPoNBOUC0QkgC3XbPmjD6zvOP+kCfXvicF6aqi0mMMxawbtZoUsykVop3BkG/TSDGpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxS+blNQ+wyicYUL+QPPXl0QFcXupMYTz/18k7U2uDt6bjCPft
	Q/uDV7QWPve04esJNekaNDq/hhNt8q/hyvy7otoa8kh46Z67xulBfipqxysfMlfnfw==
X-Gm-Gg: Acq92OGFSbvyzyCzBw5m6PrqHzK58bO6gC7GrtrRXMATV3bjtyrS/v+U2dJbrTsoSO5
	yNNOPMswpfyeOoqcAWCjOVZxLm4B0ESxjom/Z6BeSeJJmos2cEnR8juOoL9dv5wI5lDWJdBpMcQ
	9Fdw+WiKAOgpjmPIg6n/owLQt/z1t3aFuGDi/sfRZFPTz9Q+MDa24A5OYng4mLot66yropDLmmb
	+eX7sTvBLiw3c52WEVjv5OnCCqmcecvPK7ZG+zM4e7cKfpWrfYt9Tfo6cGWqxLkKoW7YnugpxKu
	VD4WuBMOTqfqpv9IUaSFgLsRGfD79901H3geTtzfi8gQxl/cJo6Lax473kfMp/la1gTy8bvs+ok
	MtztaiiCXB2J3SEnKgcMNKEai49hms5wrEVrctN+UxIRG2qLVHK7ICYrIGfmDbM23Aae1DTQfQ9
	ZjeR9C104jj5ChlRSaai4OAa4BJsHF4f96TOzGLbGwRhxElpojH8fBsA04Uwrc2ikIQ3ejXT0Sh
	Twtel9+iFBO8kajaw==
X-Received: by 2002:a17:903:1209:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c1e810b983mr261933095ad.19.1781080936358;
        Wed, 10 Jun 2026 01:42:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:16 -0700 (PDT)
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
Subject: [PATCH v2 13/16] arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
Date: Wed, 10 Jun 2026 16:40:47 +0800
Message-ID: <20260610084053.2059858-14-wenst@chromium.org>
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

The MT8192 Asurada design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller. Also clean up the
pcie controller node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 65 +++++++++++++++++--
 1 file changed, 58 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index fb4d92750770..901240384a4a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -318,6 +318,41 @@ usb_a_u3_ep: endpoint {
 			};
 		};
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
+					remote-endpoint = <&usb2_hub_p4_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &afe {
@@ -671,19 +706,19 @@ &pcie {
 	pinctrl-0 = <&pcie_pins>;
 	memory-region = <&wifi_restricted_dma_region>;
 
-	pcie0: pcie@0,0 {
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
 		device_type = "pci";
-		reg = <0x0000 0 0 0 0>;
 		num-lanes = <1>;
-		bus-range = <0x1 0x1>;
-
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi: wifi@0,0 {
-			reg = <0x10000 0 0 0 0x100000>,
-			      <0x10000 0 0x100000 0 0x100000>;
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1206,6 +1241,14 @@ pins-bus {
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
 	mmc0_default_pins: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
@@ -1773,6 +1816,14 @@ usb2_hub_p3_ep: endpoint {
 					remote-endpoint = <&usb_a_u2_ep>;
 				};
 			};
+
+			port@4 {
+				reg = <4>;
+
+				usb2_hub_p4_ep: endpoint {
+					remote-endpoint = <&bt_ep>;
+				};
+			};
 		};
 	};
 };
-- 
2.54.0.1099.g489fc7bff1-goog

