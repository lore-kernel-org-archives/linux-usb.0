Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F48394785;
	Thu,  9 Jul 2026 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596361; cv=none; b=NldQ5NbvSbK2tP2/KKxhIo5+vu8IYhSBGXaSz2M0I4RqMsjFRor2hZZrHDw0DgG6YVpW6LFC64A0VMV6BFsmJfZqc8SCG31W+5s2vzdXW28CbX3maBysPLcJnLHsmd1pg6dr0YONmmCIoQAWnvT9sPAZc1/nU99Xs0K3w5+PiOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596361; c=relaxed/simple;
	bh=y2vs8mfcwQyZ3kbKiitUdUUK5LOEyrcrrvY1koJNvYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=M8DIS2PdocW90IshElV1cdXm0+KwLbAwv80dbMlS+FKRgE1jlLNA2bq1DyIbnxY9mJoUrYZPOTfAHaeF3zB6Vw20CMV79HZqdQ+2G7oApjzVZenuskzLP0UvpVhwdGqYSivkmiOeHuC9/O8OAVFJeCu2dgx9U2jVYcGcSPIVryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=Yfdh8TCS; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="Yfdh8TCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=xTlKEO+BkOZsoijOst3oHSmHOT6SXo1LPdoJd3b27Zw=;
  b=Yfdh8TCSXAUFy62CkIhW7KRYhzgEP37LuD+ViP5CGDJQQrc4tZ3f3G6v
   NZQ8NfBGJZNSXUUS3kortlm1Ye2ixMKT5noYmxMXu4nvAwvGfQoWOiLDy
   GHXxm0TS0vWrBMXg//OES9AjPBlDNCLHqFbdgWR9oZdv73cWfaA4fWrkS
   JvuvlQWa0BmCY9DtwQJdyDyhBx++SDrQdbyvEabL6DTKNyJ8VDUMUjCKq
   8ENtqtvxeU31t4Zp70kNB4YsQ4nW1X1Y+KlSRKuwqAwUQElTAQEy1azOF
   81+PQVw6LF0S0sn8Ep0hrstD93ynVcneMpE4e+JfHfU9VKJ8I3MhoBPHi
   g==;
X-CSE-ConnectionGUID: voK/WEvSQQ+skcMxiStllw==
X-CSE-MsgGUID: Rh7e6j8WSauQDRq9TRzKug==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 09 Jul 2026 19:25:54 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 669BPpON093116;
	Thu, 9 Jul 2026 19:25:51 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 19:25:50 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Date: Fri, 10 Jul 2026 03:25:48 +0800
Subject: [PATCH v3 2/2] usb: typec: ucsi: Add ITE IT885x Type-C PD
 controller driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260710-ucsi-itepd-feature-v3-2-8523e1e1c47a@ite.com.tw>
References: <20260710-ucsi-itepd-feature-v3-0-8523e1e1c47a@ite.com.tw>
In-Reply-To: <20260710-ucsi-itepd-feature-v3-0-8523e1e1c47a@ite.com.tw>
To: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
        Bling Chiang <Bling.Chiang@ite.com.tw>,
        Doreen Lin <doreen.lin@ite.com.tw>, Eric Su <Eric.Su@ite.com.tw>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki
 Krogerus <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CSBMAIL2.internal.ite.com.tw (192.168.65.41) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	CC4E11235BCD173C271398121520D73F2D619962A6E364D2D1380C06CEEEB81E2002:8
X-MAIL:mse.ite.com.tw 669BPpON093116

Add core UCSI support for the ITE IT885x USB Type-C Power Delivery
controller over I2C.

Per Heikki's review of v1, this series has been split into smaller
patches. This patch provides the bare minimum: register the UCSI
ports and partners only, with no command translation and no
Alternate Mode support. The command-translation hook and Alternate
Mode child device from v1 have been dropped entirely for this patch,
and will be reintroduced one feature at a time in follow-up series.

v2 -> v3:
- Per Sashiko: fixed teardown ordering in remove() -- free_irq()
  now runs before ucsi_unregister(), since ucsi_unregister() frees
  the ucsi->connector array that a still-pending threaded IRQ could
  access via ucsi_notify_common(), causing a use-after-free
- Per Sashiko: itepd_irq_process() no longer unconditionally returns
  IRQ_HANDLED when clearing the interrupt fails; it now returns
  IRQ_NONE so the kernel's spurious-interrupt detection can engage,
  instead of risking an IRQ storm under memory/I2C pressure

v1 -> v2:
- Per Heikki: split into a minimal, single-file patch
  (ucsi_itepd.c only); the itepd.c/itepd.h core, the auxiliary-bus
  child-device split, and itepd_altmode.c are dropped from this
  patch and deferred to a follow-up series
- Per Heikki: removed the UCSI command-translation hook
  (ucsi_itepd_command_hook()) entirely for this minimal patch
- Use heap-allocated (kzalloc) I2C buffers instead of stack memory,
  since i2c_transfer() buffers must be DMA-safe
- Add explicit little-endian conversions for all multi-byte
  register fields
- Require a valid IRQ at probe time
- Fix probe()/remove() ordering so the IRQ thread can never observe
  a freed or not-yet-created ucsi instance
- Add an i2c_device_id table alongside of_device_id
- Dropped the AUXILIARY_BUS/DRM Kconfig dependencies, no longer
  needed without the altmode client

Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>
Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
Cc: Eric Su <Eric.Su@ite.com.tw>
Cc: Doreen Lin <doreen.lin@ite.com.tw>
Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
v2: https://lore.kernel.org/all/20260710-ucsi-itepd-feature-v2-0-41943fd5df38@ite.com.tw/
v1: https://lore.kernel.org/all/20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw/
---
 MAINTAINERS                         |   1 +
 drivers/usb/typec/ucsi/Kconfig      |  10 +
 drivers/usb/typec/ucsi/Makefile     |   1 +
 drivers/usb/typec/ucsi/ucsi_itepd.c | 354 ++++++++++++++++++++++++++++++++++++
 4 files changed, 366 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b03fa3aa060..22c0f386b25a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13730,6 +13730,7 @@ R:	Eric Su <Eric.Su@ite.com.tw>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
+F:	drivers/usb/typec/ucsi/ucsi_itepd.c
 
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 87dd992a4b9e..28442d2aebf8 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -104,4 +104,14 @@ config UCSI_HUAWEI_GAOKUN
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_huawei_gaokun.
 
+config UCSI_ITEPD
+	tristate "UCSI Interface Driver for ITE IT885x"
+	depends on I2C
+	help
+	  This driver enables UCSI support on platforms that expose an
+	  ITE IT885x Type-C Power Delivery controller over I2C interface
+
+	  To compile the driver as a module, choose M here: the module
+	  will be called ucsi_itepd.
+
 endif
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index c7e38bf01350..0903a1fd486b 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
 obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
 obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
 obj-$(CONFIG_UCSI_HUAWEI_GAOKUN)	+= ucsi_huawei_gaokun.o
+obj-$(CONFIG_UCSI_ITEPD)		+= ucsi_itepd.o
diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi/ucsi_itepd.c
new file mode 100644
index 000000000000..539818869ab7
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026, ITE. All Rights Reserved
+ */
+#include <linux/bits.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+
+#include "ucsi.h"
+
+#define ITEPD_UCSI_VERSION_REG	0x80
+#define ITEPD_UCSI_CCI_REG	    0x84
+#define ITEPD_UCSI_MSG_IN_REG	0x88
+#define ITEPD_UCSI_CONTROL_REG	0x98
+
+#define ITEPD_VENDOR_WC_INT	    0xbc
+#define ITEPD_VENDOR_INT	    0xbd
+#define ITEPD_ALERT_VDM_EVENT	    BIT(0)
+#define ITEPD_ALERT_UCSI_EVENT	    BIT(1)
+
+#define ITEPD_MSG_IN_MAX_LEN	0x28
+
+struct itepd {
+	struct i2c_client *client;
+	struct ucsi *ucsi;
+	struct mutex i2c_lock;		/* Serializes I2C accesses */
+	struct mutex received_lock;	/* Protects cci and msg_in */
+	u8 msg_in[ITEPD_MSG_IN_MAX_LEN];
+	u32 cci;
+};
+
+static u8 ucsi_itepd_get_len(u32 cci)
+{
+	if (cci & UCSI_CCI_COMMAND_COMPLETE)
+		return UCSI_CCI_LENGTH(cci);
+	return 0;
+}
+
+static int itepd_read_reg(struct itepd *itepd, u8 reg, void *data, u32 len)
+{
+	struct i2c_client *client = itepd->client;
+	struct i2c_msg msg[2];
+	u8 *buf;
+	int ret;
+
+	/* I2C buffers must be DMA-safe, so no stack memory here. */
+	buf = kzalloc(len + 1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	buf[0] = reg;
+
+	msg[0].addr     = client->addr;
+	msg[0].flags    = 0;
+	msg[0].len      = 1;
+	msg[0].buf      = buf;
+
+	msg[1].addr     = client->addr;
+	msg[1].flags    = I2C_M_RD;
+	msg[1].len      = len;
+	msg[1].buf      = buf + 1;
+
+	mutex_lock(&itepd->i2c_lock);
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	mutex_unlock(&itepd->i2c_lock);
+	if (ret < 0) {
+		dev_err(&client->dev, "reg 0x%02x read failed: %d\n", reg, ret);
+		goto out_free;
+	}
+	if (ret != ARRAY_SIZE(msg)) {
+		ret = -EIO;
+		goto out_free;
+	}
+
+	memcpy(data, buf + 1, len);
+	ret = 0;
+
+out_free:
+	kfree(buf);
+	return ret;
+}
+
+static int itepd_write_reg(struct itepd *itepd, u8 reg, const void *data, u32 len)
+{
+	struct i2c_client *client = itepd->client;
+	struct i2c_msg msg[1];
+	u8 *buf;
+	int ret;
+
+	buf = kzalloc(len + 1, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	buf[0] = reg;
+	memcpy(buf + 1, data, len);
+
+	msg[0].addr = client->addr;
+	msg[0].flags = 0;
+	msg[0].len = len + 1;
+	msg[0].buf = buf;
+
+	mutex_lock(&itepd->i2c_lock);
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	mutex_unlock(&itepd->i2c_lock);
+
+	if (ret < 0) {
+		dev_err(&client->dev, "reg 0x%02x write failed: %d\n", reg, ret);
+		goto out_free;
+	}
+
+	if (ret != ARRAY_SIZE(msg)) {
+		ret = -EIO;
+		goto out_free;
+	}
+
+	ret = 0;
+
+out_free:
+	kfree(buf);
+	return ret;
+}
+
+static int ucsi_itepd_read_version(struct ucsi *ucsi, u16 *version)
+{
+	struct itepd *itepd = ucsi_get_drvdata(ucsi);
+	__le16 le_version;
+	int ret;
+
+	ret = itepd_read_reg(itepd, ITEPD_UCSI_VERSION_REG, &le_version,
+			     sizeof(le_version));
+
+	if (ret)
+		return ret;
+
+	*version = le16_to_cpu(le_version);
+
+	return 0;
+}
+
+static int ucsi_itepd_read_cci(struct ucsi *ucsi, u32 *cci)
+{
+	struct itepd *itepd = ucsi_get_drvdata(ucsi);
+
+	mutex_lock(&itepd->received_lock);
+	*cci = itepd->cci;
+	mutex_unlock(&itepd->received_lock);
+
+	return 0;
+}
+
+static int ucsi_itepd_poll_cci(struct ucsi *ucsi, u32 *cci)
+{
+	struct itepd *itepd = ucsi_get_drvdata(ucsi);
+	__le32 le_cci;
+	int ret;
+
+	ret = itepd_read_reg(itepd, ITEPD_UCSI_CCI_REG, &le_cci,
+			     sizeof(le_cci));
+
+	if (ret)
+		return ret;
+
+	*cci = le32_to_cpu(le_cci);
+
+	return 0;
+}
+
+static int ucsi_itepd_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
+{
+	struct itepd *itepd = ucsi_get_drvdata(ucsi);
+
+	mutex_lock(&itepd->received_lock);
+	memcpy(val, itepd->msg_in, min(val_len, sizeof(itepd->msg_in)));
+	mutex_unlock(&itepd->received_lock);
+
+	return 0;
+}
+
+static int ucsi_itepd_async_control(struct ucsi *ucsi, u64 command)
+{
+	struct itepd *itepd = ucsi_get_drvdata(ucsi);
+	__le64 le_cmd = cpu_to_le64(command);
+
+	return itepd_write_reg(itepd, ITEPD_UCSI_CONTROL_REG, &le_cmd,
+			       sizeof(le_cmd));
+}
+
+static const struct ucsi_operations ucsi_itepd_ops = {
+	.read_version		= ucsi_itepd_read_version,
+	.read_cci		= ucsi_itepd_read_cci,
+	.poll_cci		= ucsi_itepd_poll_cci,
+	.read_message_in	= ucsi_itepd_read_message_in,
+	.sync_control		= ucsi_sync_control_common,
+	.async_control		= ucsi_itepd_async_control,
+};
+
+static irqreturn_t itepd_irq_process(struct itepd *itepd)
+{
+	u8 msg_in[ITEPD_MSG_IN_MAX_LEN] = {};
+	__le32 le_cci;
+	u32 cci = 0;
+	u8 event;
+	u8 len;
+	int ret;
+	int clear_ret;
+
+	ret = itepd_read_reg(itepd, ITEPD_VENDOR_INT, &event, sizeof(event));
+
+	if (ret)
+		return IRQ_NONE;
+
+	event &= ITEPD_ALERT_VDM_EVENT | ITEPD_ALERT_UCSI_EVENT;
+
+	if (!event)
+		return IRQ_NONE;
+
+	if (event & ITEPD_ALERT_UCSI_EVENT) {
+		ret = itepd_read_reg(itepd, ITEPD_UCSI_CCI_REG, &le_cci, sizeof(le_cci));
+		if (ret)
+			goto out_clear;
+
+		cci = le32_to_cpu(le_cci);
+		len = min_t(u8, ucsi_itepd_get_len(cci), sizeof(msg_in));
+
+		if (len) {
+			ret = itepd_read_reg(itepd, ITEPD_UCSI_MSG_IN_REG,
+					     msg_in, len);
+			if (ret)
+				goto out_clear;
+		}
+
+		mutex_lock(&itepd->received_lock);
+		itepd->cci = cci;
+		memcpy(itepd->msg_in, msg_in, sizeof(msg_in));
+		mutex_unlock(&itepd->received_lock);
+	}
+
+out_clear:
+	clear_ret = itepd_write_reg(itepd, ITEPD_VENDOR_WC_INT, &event, sizeof(event));
+	if (clear_ret) {
+		dev_err_ratelimited(&itepd->client->dev,
+				    "failed to clear interrupt: %d\n", clear_ret);
+		return IRQ_NONE;
+	}
+
+	if (!ret && (event & ITEPD_ALERT_UCSI_EVENT))
+		ucsi_notify_common(itepd->ucsi, cci);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t itepd_irq_thread_fn(int irq, void *data)
+{
+	struct itepd *itepd = data;
+
+	return itepd_irq_process(itepd);
+}
+
+static int itepd_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct itepd *itepd;
+	u8 event;
+	int ret;
+
+	if (client->irq <= 0)
+		return dev_err_probe(dev, -ENODEV, "no IRQ provided\n");
+
+	itepd = devm_kzalloc(dev, sizeof(*itepd), GFP_KERNEL);
+
+	if (!itepd)
+		return -ENOMEM;
+
+	itepd->client = client;
+	mutex_init(&itepd->i2c_lock);
+	mutex_init(&itepd->received_lock);
+	i2c_set_clientdata(client, itepd);
+
+	itepd->ucsi = ucsi_create(dev, &ucsi_itepd_ops);
+
+	if (IS_ERR(itepd->ucsi))
+		return PTR_ERR(itepd->ucsi);
+
+	ucsi_set_drvdata(itepd->ucsi, itepd);
+
+	event = ITEPD_ALERT_VDM_EVENT | ITEPD_ALERT_UCSI_EVENT;
+	ret = itepd_write_reg(itepd, ITEPD_VENDOR_WC_INT, &event, sizeof(event));
+
+	if (ret)
+		goto out_ucsi_destroy;
+
+	ret = request_threaded_irq(client->irq, NULL, itepd_irq_thread_fn, IRQF_ONESHOT,
+				   dev_name(dev), itepd);
+
+	if (ret) {
+		dev_err(dev, "request_threaded_irq failed - %d\n", ret);
+		goto out_ucsi_destroy;
+	}
+
+	ret = ucsi_register(itepd->ucsi);
+	if (ret) {
+		dev_err(dev, "failed to register UCSI: %d\n", ret);
+		goto out_free_irq;
+	}
+
+	return 0;
+
+out_free_irq:
+	free_irq(client->irq, itepd);
+out_ucsi_destroy:
+	ucsi_destroy(itepd->ucsi);
+	return ret;
+}
+
+static void itepd_remove(struct i2c_client *client)
+{
+	struct itepd *itepd = i2c_get_clientdata(client);
+
+	free_irq(client->irq, itepd);
+	ucsi_unregister(itepd->ucsi);
+	ucsi_destroy(itepd->ucsi);
+}
+
+static const struct of_device_id itepd_of_match_table[] = {
+	{ .compatible = "ite,itepd-it885x" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, itepd_of_match_table);
+
+static const struct i2c_device_id itepd_id_table[] = {
+	{ "ucsi_itepd", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, itepd_id_table);
+
+static struct i2c_driver itepd_driver = {
+	.driver = {
+		.name = "ucsi_itepd",
+		.of_match_table = itepd_of_match_table,
+	},
+	.probe = itepd_probe,
+	.remove = itepd_remove,
+	.id_table = itepd_id_table,
+};
+module_i2c_driver(itepd_driver);
+
+MODULE_AUTHOR("Jeson Yang <jeson.yang@ite.com.tw>");
+MODULE_DESCRIPTION("UCSI driver for ITE IT885x Type-C PD controllers");
+MODULE_LICENSE("GPL");

-- 
2.53.0

