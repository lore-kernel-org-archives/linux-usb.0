Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EF23D1CC1
	for <linux-usb@vger.kernel.org>; Sun,  4 Oct 2026 16:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132743; cv=none; b=gHp19Ho5DTy7brusYdBEcJa/tRuiAnClE6oRQ3/aa60O+ZBvH3x1kHtIXmDxbDbmKr9jXxLHp74tLEXHsGjA33Sjz1frjgE5pYgxCrumARjvAXqpBMvRF5YuoqucQ8YuJgVIH1oYObnXgMw5d1cCNRL6DeItlKaXZHvxBabestE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132743; c=relaxed/simple;
	bh=YsOWNf6k3c8k/mWCI04yyLmuoXVKeXFhCGr6HCib2RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOwBkQKBNF5Q6YvS9pYNfTDKxoh+DnQBIr2WnSg92jvyFhDyij1FKETxy4tihKzo3YIgwlWAJJbk+Bv+Z6kVfFya5j4J71RG8lzQd0SZlRdP6WR0u8S2lBqNM1zi1M9Dviaq4orlw3h/qYB++08LjCB5pndQfRuCaGVIDJlpntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYIYwySM; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYIYwySM"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01d89b23so413486f8f.2
        for <linux-usb@vger.kernel.org>; Sun, 04 Oct 2026 09:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132739; x=1791737539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFCgMSBeysJSZt2B7ifOkYjjdaDgVJLpazyx7TBo5uA=;
        b=ZYIYwySMMqmGTrj7LuuXmgtZX8ZTUzwPOtuegbm6lkB2hiMxBaWIpil6WBfQWOvWst
         9HiG3164afnZyqRAjRs2PIr6O97KAXy46ObaNdDS/6HFg0nrUqbdq3Ay04eITUHLgnSX
         eDphXpaPug3CXyKz8iRi6cwhq7Sa8sSxeSgEH5Y4J4gQUIHz4Nbv8h1zTGJDHPjEVWgs
         YJ0iIdezDcRCDVgUx7YB8I/da3fGlVBw7H8b2bKpV8fXMBzYgJn8etp40EcsxMe8j4zF
         OrQFHtUJIvvuERL3Tym1wW0W3BhU2U2A6g5Xvv7/7mCVKOJjL0TfpFvXe9y/dEGPJqE1
         eSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132739; x=1791737539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CFCgMSBeysJSZt2B7ifOkYjjdaDgVJLpazyx7TBo5uA=;
        b=D+nc+Ap25lvGdpK7kdQobgaG9vBasb4Ke7aNq8SFc8Y3o9vSOyDD8EhxyKo/hcWgTM
         eknslRBjqe83hL3/ERhLkC6953UemGJLFvrAaXBRglq6NxbMJ8CdByIJfemQEdjVDnUF
         d+QTz9+SoEqnSpVOb73aZxSIcPjRO34G9jpvZSe40a5Hcs0sCEgJA/Z1i8TXEEC7l5fM
         8cPwb7GVfJ7uowsexhzx24PKfB6Xp7o3h1dm2MrP8UfxMox3ftMJCp3s6Kr1uthVQ/FO
         xBd1aUWRjWHzRugy5FuhmaPUXlM79lR3U+25v5XGAad0UemT/Nuxzkc3NiycaglxRjUL
         hKeA==
X-Gm-Message-State: AFq9FYLtzFhqKCjfQUzGtYPeolrmEk2V/SDJKDpvAeZn9dcLfUncN8s3
	d+v8kmXvMpVOUVpTJNugOD4R3mCCR6p2mRnbJnMN9qODYjXf9nDsCHHL
X-Gm-Gg: AYBFou1ISZr8t3ZAswkn3uHQzDs1YW1INnidAje8E5lFmG6H/+GCB9o5/nfUpabCvFR
	XXYx/JESPEetwYvb5eKW6N+0U7CkDKQ1YutK5gxy0Q5OWxcvxAIqOSu+/bMSdgTN1KV30HgmMAQ
	SOrsLnykrNyCDydqIOIj8uQpnPhyKpybEehxm1gkBzuSBATWkQEaQs553JvCwjcCSQjOXlsSZri
	66fq6HYfq1WPg1dPiZM1hwJsKPS3boiWYg4aS36RjaPgRAuOyqpT+Nuko7IfRYQVEaQOx2+RZ43
	URfy00Rvlv7hgn52IIOwJ6xkle//Q3vrAzLdJ9hZYhPYIOmlrtNLiy0oy9ZHIo8SbXCwMyYwpqR
	Hzn7PnCoznd+5DlD/26NUrhDgujw4scIeC9/cBmQjKttAaGHdrXm2h4664M/Rxemy8va2XP3kK8
	tZWvp3LrvuTKHnHTNqvrnO9daIrxT0wFMT3uKBkMbijIjtjVHAJ2L37027xgwX0snpdVMFk6eMY
	cNz5BxVMIYIsM345pc=
X-Received: by 2002:a05:6000:2405:b0:48c:5306:c11a with SMTP id ffacd0b85a97d-48c5306c1d1mr5056623f8f.24.1791132738870;
        Sun, 04 Oct 2026 09:52:18 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm20902213f8f.37.2026.10.04.09.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:52:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jordan Viknar <jordanviknar@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] usb: phy: tegra: Disable internal USB sensing if extcon is used
Date: Sun,  4 Oct 2026 19:52:04 +0300
Message-ID: <20261004165204.205660-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004165204.205660-1-clamor95@gmail.com>
References: <20261004165204.205660-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jordan Viknar <jordanviknar@gmail.com>

The Tegra USB PHY features four VBUS sensors: A_VBUS_VLD, A_SESS_VLD,
B_SESS_VLD, and B_SESS_END. This allows the SoC to detect mode switches
and natively work with OTG. On some devices, instead of relying on Tegra's
own mechanism, some type of extcon detection chip may be used, which
conflicts with the native Tegra implementation.

Add extcon parsing from the linked USB controller. If such a property
exists, switch VBUS sensors to software mode and set their values to SET.
This indicates that the VBUS sensors are not required by the USB
controller, which uses extcon for detection instead.

This fixes all devices that have OTG mode set with extcon for Tegra20
(LG Optimus 2X P990), Tegra30 (LG Optimus 4X P880 and Vu P895),
Tegra114 (Nvidia Tegra Note 7), and Tegra124 (Xiaomi Mi Pad). All listed
devices were tested.

Assisted-by: Claude Sonnet 5
Signed-off-by: Jordan Viknar <jordanviknar@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 55 +++++++++++++++++++++++++++++++
 include/linux/usb/tegra_usb_phy.h |  1 +
 2 files changed, 56 insertions(+)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 00443a7beaeb0..d3faeb6619454 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -16,6 +16,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/resource.h>
@@ -68,9 +69,18 @@
 #define   UHSIC_PHY_ENABLE			BIT(19)
 
 #define USB_PHY_VBUS_SENSORS			0x404
+#define   B_SESS_VLD_SW_EN			BIT(11)
+#define   B_SESS_VLD_SW_VALUE			BIT(12)
 #define   B_SESS_VLD_WAKEUP_EN			BIT(14)
+#define   A_SESS_VLD_SW_EN			BIT(19)
+#define   A_SESS_VLD_SW_VALUE			BIT(20)
 #define   A_SESS_VLD_WAKEUP_EN			BIT(22)
+#define   A_VBUS_VLD_SW_EN			BIT(27)
+#define   A_VBUS_VLD_SW_VALUE			BIT(28)
 #define   A_VBUS_VLD_WAKEUP_EN			BIT(30)
+#define VBUS_SENSORS_SW_OVERRIDE		(B_SESS_VLD_SW_EN | B_SESS_VLD_SW_VALUE | \
+						 A_SESS_VLD_SW_EN | A_SESS_VLD_SW_VALUE | \
+						 A_VBUS_VLD_SW_EN | A_VBUS_VLD_SW_VALUE)
 
 #define USB_PHY_VBUS_WAKEUP_ID			0x408
 #define   ID_INT_EN				BIT(0)
@@ -621,6 +631,10 @@ static int utmi_phy_power_on(struct tegra_usb_phy *phy)
 		val = readl_relaxed(base + USB_PHY_VBUS_SENSORS);
 		val &= ~(A_VBUS_VLD_WAKEUP_EN | A_SESS_VLD_WAKEUP_EN);
 		val &= ~(B_SESS_VLD_WAKEUP_EN);
+
+		if (phy->has_extcon)
+			val |= VBUS_SENSORS_SW_OVERRIDE;
+
 		writel_relaxed(val, base + USB_PHY_VBUS_SENSORS);
 
 		val = readl_relaxed(base + UTMIP_BAT_CHRG_CFG0);
@@ -727,6 +741,12 @@ static int utmi_phy_power_off(struct tegra_usb_phy *phy)
 					   val, !(val & VBUS_WAKEUP_STS),
 					   5000, 100000);
 
+	if (phy->has_extcon) {
+		val = readl_relaxed(base + USB_PHY_VBUS_SENSORS);
+		val &= ~VBUS_SENSORS_SW_OVERRIDE;
+		writel_relaxed(val, base + USB_PHY_VBUS_SENSORS);
+	}
+
 	utmi_phy_clk_disable(phy);
 
 	/* PHY won't resume if reset is asserted */
@@ -1456,6 +1476,34 @@ static int tegra_usb_phy_parse_pmc(struct device *dev,
 	return 0;
 }
 
+static int tegra_usb_phy_parse_controller(struct device *dev,
+					  struct tegra_usb_phy *phy)
+{
+	struct device_node *usb_node;
+	char *node_path;
+	u64 addr;
+	int ret;
+
+	ret = of_property_read_reg(dev->of_node, 0, &addr, NULL);
+	if (ret) {
+		dev_err(dev, "Failed to read reg entry 0: %d\n", ret);
+		return ret;
+	}
+
+	node_path = devm_kasprintf(dev, GFP_KERNEL, "/usb@%08llx", addr);
+	if (!node_path)
+		return -ENOMEM;
+
+	usb_node = of_find_node_by_path(node_path);
+	if (!usb_node)
+		return -ENODEV;
+
+	phy->has_extcon = of_property_present(usb_node, "extcon");
+	of_node_put(usb_node);
+
+	return 0;
+}
+
 static const struct tegra_phy_soc_config tegra20_soc_config = {
 	.utmi_pll_config_in_car_module = false,
 	.has_hostpc = false,
@@ -1552,6 +1600,13 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (tegra_phy->mode == USB_DR_MODE_OTG) {
+		err = tegra_usb_phy_parse_controller(&pdev->dev, tegra_phy);
+		if (err)
+			return dev_err_probe(&pdev->dev, err,
+					     "Failed to get controller\n");
+	}
+
 	tegra_phy->phy_type = of_usb_get_phy_mode(np);
 	switch (tegra_phy->phy_type) {
 	case USBPHY_INTERFACE_MODE_UTMI:
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 6343f88df5de8..4bb20e39003ab 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -87,6 +87,7 @@ struct tegra_usb_phy {
 	bool wakeup_enabled;
 	bool pad_wakeup;
 	bool powered_on;
+	bool has_extcon;
 };
 
 #endif /* __TEGRA_USB_PHY_H */
-- 
2.53.0

