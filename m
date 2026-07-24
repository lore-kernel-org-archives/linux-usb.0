Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B550B40EBB5
	for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882719; cv=none; b=XdRIRJEzla7wL6Gk3aHqylFoQZg1wpjnAK/QVsDoSWtKeaiwA+BwrOLRYO/GPtwoYq7CysAiHcm3xCeAY47dOrPForxfvYZvy8UoltL/IS2yynxTbqDf146GG0BXuJDo5fC/l29EKz3DlCqOBIVFR48jpw/cPDdyMXRHK0VYAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882719; c=relaxed/simple;
	bh=2bdpJglUXNu6BBTggJFiuCLLgE+aHPv4Z4H92NilTHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrRb8CPDxWJxUGwHGj0T/piQxJZ0qN413CwbjtDeHrheAP2ZN7BIAU9uObrgMs4xwwSIzH6nVSUltsEQjlYrgyW/9yPhkYiSm8au1f2Ng3b0KIXCWRVmlMqnZlKBgVaQe8DJwnwC0u2UogkMr3TEjCXsAM8lq6cdVfggxP0rYSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fBcHxtBD; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fBcHxtBD"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e041ea211so163168a91.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2026 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882717; x=1785487517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=fBcHxtBDYDTinFEZmdfv8EXfL/aqfTCX7skCt+kf1t7650ZuFcp3pbAa5jdtaDy56M
         HPsMQ5C0nwrwRD3c+GPOJ66XhMmxlQrMik+UrHqboVfMNcLiUB9go7f7BqMYPrIAX8w6
         5E2NLpEf/b3fGwjkQ4e9I7qV0JAxn4W1Qn/nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882717; x=1785487517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=IlQHvG+96snX75jC+PIPfFolwTbObgcsCJx4RJzKS2GK46pasxWjfV3qzkSQtF4vFY
         AIx1iXAdy2HhzsX0VMOZOtBFU1bloyKBl5iNZazwf3WoHbJAw2UV28F/S4WLMeatdKel
         N2dpxI97zASyaEBeMaEbIXmBaNc7p1JbbhAxdR5U+v9sBYJeBNeAuunbJFrJASXXjSRq
         z9/RTu33fobk5BJaSVG2pKCCdy/tdUnweE37L7xQzDZqHLcrDLLbXr4cR8g7/72TrmvF
         mO5tAiQHkr5Lc+zDUDPFXR3hkyQXhNc9DC2rbAJjIUdAsQ5T4L2AE9Vm2pOu2jDsdtvl
         xt4A==
X-Forwarded-Encrypted: i=1; AHgh+RqLwdM72qgIaeawY4zGnW416IlpFoXxi0QQBRsf8WQZO1+0MBXGGc8MpPyMYUZHgNYTSJYNreIlt7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjM79Bf33cyfYzd7nMV2XC/elvJAFXzPp2IeN8yLqqlOZ7CubJ
	xxXb+PV+WMpyZLakYVE72IkNfU7TnAzwkqbr546Y2FDrviUAI5sq9cJLJwXoTrH7zQ==
X-Gm-Gg: AR+sD10K6v1cnN0zjT58cT+4M1tbvezVGwXpCJ1P3+JF8UFbmKXibUABO4se6lx1y4f
	vpdA9/euKWFKeGXyo0tb8aNIfEShlHKX93KgUGayt7LygOYQD47pUXa49RKYCHKYNZzxl271CMT
	NbT/ngd8wKCHi3bD8iaErIJITcIjm7IR/JXXI0PRMH7GFYbCZzs6DEqk2clbH/XzTmUKl2rZZKd
	V9mwHcNF24upO55ZNcFCXaTJh057SlYHE6Gq/DwFPHA669NpiR0q6t6uHyZBqWzvzqnJUG0nhrT
	2rYhw1jIahbVOC3hvvdX7xuP5VFOF+6mkXg5clSSWawzA3TYb9nlSNzDMj5b6QsVK+c7akOB2lK
	hPa4pKyfgp79+id72m93ijazwyded36J0h1vOsCZAN4ZljF8ESFQsQDFZudC6H43KBKh0OnNfh6
	l4eNLm8431R+v6V+SReU7EVn6d9r4BH5tt3/BOjJKhmP+v8jOwxyehwNeTFyA=
X-Received: by 2002:a17:90a:d64c:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-38ec6985236mr6392312a91.18.1784882717037;
        Fri, 24 Jul 2026 01:45:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:15 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v7 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Fri, 24 Jul 2026 16:43:23 +0800
Message-ID: <20260724084328.3943997-15-wenst@chromium.org>
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

Some UART / serdev based Bluetooth drivers need to be able to reset the
hardware during initialization or recovery. This is not possible with
the current power sequencing API if a unit is shared between USB and
UART interfaces.

For now, split the Bluetooth unit into two, one for each interface.
This allows either interface to independently toggle the power, with
the last action prevailing, thereby unbreaking the Qualcomm Bluetooth
serdev driver. This is also needed for the Realtek Bluetooth serdev
driver (hci_h5).

Having independent control from either interface unfortunately means
that userspace is able to shut down the controller from sysfs using
the USB port's "disable" setting without the serdev driver knowing
about it. On the USB side, independent control is also desired, as it
allows the USB core to power cycle the port/device during faults, and
for userspace to initiate reset and recovery using the aforementioned
"disable" setting. However when USB is used, a serdev device is not
created, and there is no conflicting usage, which allows the power
sequencing to work even without the split unit.

Suggested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch

This patch is _not_ squashed into the previous to provide clear context
on the change, and the less than perfect nature of it.

I think what we need in this case is some sort of lockout. The serdev
consumer would want "exclusive" access, locking out the USB consumer,
which can tolerate "shared" access.

Something similar would be needed for the WiFi if we ever add support
for SDIO for toggling the state of W_DISABLE#1. At least the SDIO and
PCIe reset signals are separate.
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 693b0d33f8cf..56e4f40e0480 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -83,8 +83,22 @@ static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
-	.name = "bt-enable",
+/*
+ * XXX There are two Bluetooth units to allow either one to be able to power
+ * off and thus reset the controller. In practice only one of the interfaces
+ * is used, so there is no conflict. However userspace could power off the
+ * USB unit by disabling the associated USB port, without the UART unit or
+ * its consumer ever knowing.
+ */
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_uart_unit_data = {
+	.name = "bt-uart-enable",
+	.deps = pwrseq_pcie_m2_unit_deps,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
+};
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_usb_unit_data = {
+	.name = "bt-usb-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
 	.enable = pwrseq_pci_m2_e_bt_enable,
 	.disable = pwrseq_pci_m2_e_bt_disable,
@@ -130,13 +144,13 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_uart_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
 	.name = "usb",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_usb_unit_data,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
-- 
2.55.0.229.g6434b31f56-goog

