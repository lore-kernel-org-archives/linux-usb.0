Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1FD406832
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591124; cv=none; b=gshZHJ97Hn+pPC+3QhXUv7ub+l6Yixsvf1Sfkun1KJ0xqudy54NFgKGs71ir8L1yXHMRYNe+egVhPrKxJebV9KEwrAZynnv5DWDEYYRBGqdO1qeT5yqfvYePLmCL+kMCt0fJIWv2NJafnRinTUF7C2OqqCzJOGjEYOllm3gVezM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591124; c=relaxed/simple;
	bh=mcWMNv7HhsNiSp3DMmLXndV6/eLqusOEgpevEhArbcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHfCIRHy/TcKfofYO5v8hvOD1FyZsSfSLKmMBV8Hjw3pkgUY2iExkQMMkwpA3c0PQqpkU6Te+6oF2WRX+22ix6EGOyOqPHPzaajAmP0w1ONgN10t3yGLJaXwdnd8FVIRr1IwuU2wvpu3Gad5is4nXLG/VXWr/Bd8IG3Xn0OYpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DuWwPQD7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DuWwPQD7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so10391725ad.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591122; x=1784195922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TJQhyYS4M5x6G4jk8p4LYaJRSq9L1d3/4D1LtBYsTE=;
        b=DuWwPQD7wQ0mhRksupjCKU/ih7a8Q7MOwh/D4isVlhnWqdPIEuWTq+io4Y6HNL+KZ7
         HQZrhV60f6ogtOWDXlWpSzR0kTs/NRAO34HsXcd+MQx14cqxieTUEzWfsiA/Wn2bACCX
         LtwoZlg9y3cq+jf46yP30oXXAwbqgr6lpdnEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591122; x=1784195922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3TJQhyYS4M5x6G4jk8p4LYaJRSq9L1d3/4D1LtBYsTE=;
        b=TL1w+gWUob1joeY76givKDpaC00eVf4NKyhONc09fIY9Yl4UlMb59vEVymitNshyZo
         /Yc0IBE9TFES2L4mNHh5guKlhA2m6osK5zpScbxXTjN93zavDlrWWYuO0RMzNvl70RNz
         FVupoLfHR11DqCL67N1UOlpr1Bep6ZAFtgedmqPTie/xiQv7KvLzb6u+8lgHIcCrnpTM
         /dEr8SFzedod+EIgK19taVMaBjf7+7doEpCV5WNWPKYVs4nkjahoDACsztkTK3T3ibvc
         E9nnlR+8oCe9daYidbxQxXFXSAnHux0l+bSiiqO1nzx44wo3Dl46Y7ABVg/7xgjcipNY
         H++w==
X-Forwarded-Encrypted: i=1; AHgh+RqAu3uKfpH1a88MJblFXNEcOK83BpjKihVSJifjNQVDcBRtDcZL9MoH92D/2vVXozVefcgEBS8KNgI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb3EnkMoTyVfYA2sibyDbYanaqUlIv/8epwSRS2WbV0TjoYjSN
	fBom8KDRo4r/ugqhtlYZ5MtU8pM/yH1nnAsjHP1zNP0qHSkjvT3tMra8WNovnKGQCw==
X-Gm-Gg: AfdE7cmv8xdf7eCw6l13P6nosgLkCjQG06HRrIhEbTJLzxYBwe88NPpRk9Dfwpy3XZS
	mj0iWjCr53lt+jfOMe+ElsXSGtw3RZ5lrYEKJuGSUm+MmWXK7Lpg6HUSb01zPveks19mUm51Npi
	L/vplJlkJ9vuhrJ75wsAsiHE9hI/S+X5e1GW/5B2GX6tx47JRzSNmr/soVP5KVaPKocnQSTapEb
	qLOfXnnaURLdlD8ZMrLIaOfSJnWO0KuFNEykcXqODX98RsDiVgYvixWNwifvnj8Sinq//IJ0mPm
	nnzCFtR3oxtjA5GuvmoX7wDxmU9OktD3cNmcpglmpf+zEIrteSqQYhObchuWXRth+K8otDgHp/C
	B4EB4P5/FiRo7cJyWrSN0wf9+l3PNZQzZmFpgSla+h0bS4sFR6iIYsw3jD0haCXB39P9rhsv5i8
	uoXEfXK2L/fa8pglevDO5zLey1VPqgdYylzbHBKq8ZZMKJMFddFKk4qzVOwtrfBOBwMm/2BQ==
X-Received: by 2002:a17:902:fc8e:b0:2ca:ddbd:a19b with SMTP id d9443c01a7336-2ccea40b65emr65003915ad.28.1783591122348;
        Thu, 09 Jul 2026 02:58:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:41 -0700 (PDT)
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
Subject: [PATCH v4 12/14] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Thu,  9 Jul 2026 17:57:17 +0800
Message-ID: <20260709095726.704448-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
UART for BT. Currently the driver only supports PCIe and UART.

Add power sequencing targets for SDIO and USB. To avoid adding a
complicated dependency tree, rename the existing power sequencing units
"pcie" and "uart" to "wifi" and "bt". The existing target names are left
untouched. The new "sdio" and "usb" targets just point to the renamed
"wifi" and "bt" units.

The "unit" names are internal to the power sequencing framework, and
should be confined to a single provider. The names are only
informational. Dependencies are tracked with pointers to other units.

The "target" names are the strings that the consumer uses to acquire a
descriptor with. As these remain the same, existing users will continue
to work.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 733190175f84..d67bf275480e 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -69,46 +69,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
 	NULL
 };
 
-static int pwrseq_pci_m2_e_uart_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
-	.name = "uart-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
+	.name = "bt-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_uart_enable,
-	.disable = pwrseq_pci_m2_e_uart_disable,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
 };
 
-static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
-	.name = "pcie-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_wifi_unit_data = {
+	.name = "wifi-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_pcie_enable,
-	.disable = pwrseq_pci_m2_e_pcie_disable,
+	.enable = pwrseq_pci_m2_e_wifi_enable,
+	.disable = pwrseq_pci_m2_e_wifi_disable,
 };
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
@@ -130,13 +130,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
+	.name = "usb",
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+};
+
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
-	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
+	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+};
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_sdio_target_data = {
+	.name = "sdio",
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
@@ -147,7 +158,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.55.0.795.g602f6c329a-goog

