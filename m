Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66094503F3
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545599; cv=none; b=rm5vdx8HhLvelk37oQYNjjwQMUTs9UarPuzTF7Qlu6rV91qJvAHkP00zThvKJJmJ4fpqggU7/i6PA09GlBzfMNMVDShGBAz/DRcsQjd0yU6zEtwsPCePA/sttZi3gLt3gqd2TMrdK6Ff1qwPeeZD+QiLGek5W2ulk88TMX+7Mjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545599; c=relaxed/simple;
	bh=hSWKx7tzryLVW6Q1z4sc3gQFmOjDfslid4a9Mq6tRHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f5kOrLrQcAGj/o0q6fr4Q7sBzSKt4vGs3UPwfGZhP2jtr+3X+6SDsAjLyL3OPr9VZFxTus0Xnb/c4ABEEPZKZjV6NhpQ4QZLo2mvnhjckAnhT8gknEraLcW7Gvzw9xPRq90DS4+9eZaQjh9JTMkp9zMzAHFXi7rQ4puhsOhRxC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DlN73nl3; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DlN73nl3"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so439172a91.3
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545571; x=1790150371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zziC+imJfNqpibEo8R3DN11n7Ds3Jxw6/OGyIDHBdk=;
        b=DlN73nl361eysWkFySS/06Tmuu5XXh6kjpHv0qMrWylR3r2Nyr9LnDweb3LvIBu+xY
         +1mg2MZnYAq0ytJDjNtxh4VqykBF6Ssh0qEgzoYqXI9dOVOU2uouIau2Gn+AbHvRKG0R
         2SN74K18PZhSfvQ6j/uqFLdg8o12y/CZerLFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545571; x=1790150371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zziC+imJfNqpibEo8R3DN11n7Ds3Jxw6/OGyIDHBdk=;
        b=sy2GKE66DAGPLUTuHsVHWOehBH39hnEHw1iq/cn1vo6i9Y97a4OTCpBdteR+kBPRXM
         JhQIMVKAAabfQ20Fcxh+usJ2Zw1ByI4Sg2bDJMGlrjfvLCQ5pGkW/JeYWf7qu7WF3JIE
         MekSaDXpV3SqhWX6aIpIC9i5BcEbRlEAANV1BbuhMzlIXFTFi4aOdANo8gEp303QSobz
         cnOz58J6wWPT3aBdf96mpv4l59Wwr/eOsGIaW7/Z7JSehqY9qhZmNVY7WqiAwM33AGU+
         viGoPJ6PqEy4Fel9I0sbyIJ1TArHgco1tXPVvt0dvIRP/X04/YlnLA9nGpTFi74YwHsV
         QoJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFLUbko2IOcLJLzLGXu6bAR/0F/AANQd/HuEmvUwAmNy8OiJPuMq8Zd6xatte/ka2LzrtjTS3gypc=@vger.kernel.org
X-Gm-Message-State: AFuF++lh6+XkLjrHEiI0n8HjINXooTi0X/oTH1KaKR/Csj1ZtdBgbZsB
	2A5ReUPOrxdAX5KC2d8zoBWvKuPo+93KSaoLulnLioecnMXFMiXtyrOsWJfqhUhI9A==
X-Gm-Gg: AYBFou1im9XyiLm7EePcIvD/PIVRVQajI5TtxGsO9C2bgG0S9dV8tpdJh7xQiues2Z2
	m3g0cppOOQW/OOsrdWkoTjS//pyIupvHSiQOCABnEBSw1b+c+3X6T+opj+D/gEQDJ+cc0IurDQn
	cqCIgvQMRR+3DIDf13Oao0D+P48eeraNjotYyd5sxiN+BMKM9lt1dUup6F3as0dyR2JCi8kjeoq
	AXX5g6FxxF2wOAgvr5v+dEmisXtwCZDfa0CkbC9C2CaHqHJD3lXE2L4DCdPoY7vQc48pw9uH0kT
	6Ub4K7W4RK+36R2e2rk9y7X8UMRrsTVnczRyYj97VwobXoH98FZSyBbMR2+FpFpbOllLTcE/e4h
	1jw64KtK4nAN68qfxZu+jj3AD7SqfUA+15HfCxCfS9c7f/m3Rk84f6YcGewwsYeGkfO/ykcGVJS
	UdsZFZY1Fvg8S7grCUDhE4GeNr39/ff1xTMMtba6LO10N08JLweYDv81ytP3ORgizj20w9HUjHG
	by0iZxO+V5g0kT124KfKdBJEDOlZBcSrfV4ptfSVImwFEbLJb4mi8rcJg==
X-Received: by 2002:a17:90b:3c07:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39e1e2e2326mr4169180a91.7.1789545571154;
        Wed, 16 Sep 2026 00:59:31 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:30 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 13/15] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Wed, 16 Sep 2026 15:57:39 +0800
Message-ID: <20260916075745.3549953-14-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
index 499cfd291a39..357aedd2a17f 100644
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
2.55.0.1032.g73a4cd73de-goog

