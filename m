Received: from ironport.ite.com.tw (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45641835F;
	Fri,  7 Aug 2026 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097844; cv=none; b=iuntXbFPnG9E4ISEIPOVYZdhuydWcJXvgEyhZiAWYM07OGKUyZFC3LIjc/AuqYwHJPwZx4/wOdk5XDpMkPxjaxNGot0HIxCs6rp6NMOtJ1X5wUFgv341cKN79zlhaoxrGGDi9/0idQ9nsn0J3W1kQUymA5rwt/uNDZYSAbS1pMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097844; c=relaxed/simple;
	bh=2HY1Zzj43MtHa467kBeLo75ETQLRgaEeAHUB9LAIgNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AEkK3ywGNDofVMprx2Ts7IbZsu1MlPRKVwPmdiSLgpSu+wu5xxLLjEEZL9S1uiyHAgUP2QVAvhh8Q2KbqaUEspg24wKeJxW4JSeCWzohwsKV2foEc5LRULB1gC4n5GXLbvaaSa97Urrr3TfSXBXceDVWbmBamYV+gA0VI25Qq60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=UOIVMvtv; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="UOIVMvtv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=93fZ+8HCWR+OrAcHgDBJmlvinCp3CX4vM2xehH3/8is=;
  b=UOIVMvtvERmgtdZuhioTJD53dO33rVWF2OWDEhzsdn52Xr0kFugmAtHD
   JgbsbM8chIrJQIKhNJbgVLW9WS3gJIDpIQ9lsbN98ZiuFbjNx1M/tDUVJ
   vfQzXmBjI2V54MVJ438tjQTWBfXKlTOQiruJlt96uNgSGASt718eiqIh7
   exMpiCH8PR8vvdYzsfJWgjcn19E6HRQtTzcaw9mZgDRqPZtLBfb/63/oy
   NeLLmOIMqOe5iSKiEE9VctGiInap9SxipoihmxiZM5XxRleGHE2MUfL9+
   +cFlTULBpAnExnlw7OuFc7zgwcEFranYbvT/rurr3kgoHc08kZS9jY/fe
   g==;
X-CSE-ConnectionGUID: rV26BhZMSV6cTg6nkTwbDA==
X-CSE-MsgGUID: RJ/iblo8SBWxO9cevZg0LA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 07 Aug 2026 18:17:11 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 677AH9f1092218;
	Fri, 7 Aug 2026 18:17:09 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 18:17:09 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Date: Fri, 7 Aug 2026 18:17:46 +0800
Subject: [PATCH v7 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD
 controller driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260807-ucsi-itepd-v7-2-998ac11ed0ef@ite.com.tw>
References: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
In-Reply-To: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
To: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>,
        Bling
 Chiang <Bling.Chiang@ite.com.tw>, Eric Su <Eric.Su@ite.com.tw>,
        Doreen Lin
	<doreen.lin@ite.com.tw>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CSBMAIL2.internal.ite.com.tw (192.168.65.41) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	53AABE5666DAF5388752286CFB00BA0789769E4B4970329F94A96AC2EAA12A1B2002:8
X-MAIL:mse.ite.com.tw 677AH9f1092218

Add a UCSI driver for the ITE IT8851 and IT8853 I2C-based USB Type-C
Power Delivery controllers.
The controller signals UCSI through a shared interrupt line; events are
read and acknowledged via vendor-specific registers, and
UCSI events are forwarded to the UCSI core.

Add the driver file to the MAINTAINERS entry.

Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>
Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
Cc: Eric Su <Eric.Su@ite.com.tw>
Cc: Doreen Lin <doreen.lin@ite.com.tw>
Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
 MAINTAINERS                         |   1 +
 drivers/usb/typec/ucsi/Kconfig      |  10 +
 drivers/usb/typec/ucsi/Makefile     |   1 +
 drivers/usb/typec/ucsi/ucsi_itepd.c | 356 ++++++++++++++++++++++++++++++++++++
 4 files changed, 368 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec0eeea79b9e..1e76e299e6c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13727,6 +13727,7 @@ R:	Yaode Fang <Yaode.Fang@ite.com.tw>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/usb/ite,it8851.yaml
+F:	drivers/usb/typec/ucsi/ucsi_itepd.c
 
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 87dd992a4b9e..0f10dac9b34b 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -104,4 +104,14 @@ config UCSI_HUAWEI_GAOKUN
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_huawei_gaokun.
 
+config UCSI_ITEPD
+	tristate "UCSI Interface Driver for ITE IT8851/IT8853"
+	depends on I2C
+	help
+	  This driver enables UCSI support on platforms that expose an
+	  ITE IT8851/IT8853 Type-C Power Delivery controller over an I2C interface.
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
index 000000000000..d1887435a2e1
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026, ITE. All Rights Reserved
+ *
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
+#define ITEPD_UCSI_CCI_REG	0x84
+#define ITEPD_UCSI_MSG_IN_REG	0x88
+#define ITEPD_UCSI_CONTROL_REG	0x98
+
+#define ITEPD_VENDOR_WC_INT	0xbc
+#define ITEPD_VENDOR_INT	0xbd
+#define ITEPD_ALERT_VDM_EVENT	BIT(0)
+#define ITEPD_ALERT_UCSI_EVENT	BIT(1)
+
+#define ITEPD_MSG_IN_MAX_LEN	0x28
+
+#define ITEPD_EVENT_NONE	0
+#define ITEPD_EVENT_UCSI	1
+#define ITEPD_EVENT_VDM		2
+
+struct itepd {
+	struct i2c_client *client;
+	struct ucsi *ucsi;
+	struct mutex i2c_lock;		/* Serializes I2C accesses */
+	struct mutex event_lock;	/* Serializes event processing (IRQ vs poll) */
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
+	struct i2c_msg msg[2] = {
+		{
+			.addr	= client->addr,
+			.flags	= 0,
+			.len	= 1,
+			.buf	= &reg,
+		},
+		{
+			.addr	= client->addr,
+			.flags	= I2C_M_RD,
+			.len	= len,
+			.buf	= data,
+		}
+
+	};
+	int ret;
+
+	mutex_lock(&itepd->i2c_lock);
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	mutex_unlock(&itepd->i2c_lock);
+	if (ret < 0) {
+		dev_err_ratelimited(&client->dev, "reg 0x%02x read failed: %d\n",
+				    reg, ret);
+		return ret;
+	}
+
+	return ret == ARRAY_SIZE(msg) ? 0 : -EIO;
+}
+
+static int itepd_write_reg(struct itepd *itepd, u8 reg, const void *data, u32 len)
+{
+	struct i2c_client *client = itepd->client;
+	u8 buf[sizeof(u64) + 1];
+	struct i2c_msg msg[1] = {
+		{
+			.addr	= client->addr,
+			.flags	= 0,
+			.len	= len + 1,
+			.buf	= buf,
+		}
+	};
+	int ret;
+
+	if (len > sizeof(buf) - 1)
+		return -EINVAL;
+
+	buf[0] = reg;
+	memcpy(&buf[1], data, len);
+
+	mutex_lock(&itepd->i2c_lock);
+	ret = i2c_transfer(client->adapter, msg, 1);
+	mutex_unlock(&itepd->i2c_lock);
+	if (ret < 0) {
+		dev_err_ratelimited(&client->dev, "reg 0x%02x write failed: %d\n",
+				    reg, ret);
+		return ret;
+	}
+
+	return ret == 1 ? 0 : -EIO;
+}
+
+static int itepd_process_event(struct itepd *itepd, u32 *cci)
+{
+	u8 msg_in[ITEPD_MSG_IN_MAX_LEN] = {};
+	__le32 le_cci;
+	u8 event, ack;
+	u8 len = 0;
+	int err = 0;
+	int ret;
+
+	guard(mutex)(&itepd->event_lock);
+
+	ret = itepd_read_reg(itepd, ITEPD_VENDOR_INT, &event, sizeof(event));
+	if (ret)
+		return ret;
+
+	event &= ITEPD_ALERT_VDM_EVENT | ITEPD_ALERT_UCSI_EVENT;
+	if (!event) {
+		mutex_lock(&itepd->received_lock);
+		*cci = itepd->cci;
+		mutex_unlock(&itepd->received_lock);
+		return ITEPD_EVENT_NONE;
+	}
+
+	if (event & ITEPD_ALERT_UCSI_EVENT) {
+		err = itepd_read_reg(itepd, ITEPD_UCSI_CCI_REG, &le_cci,
+				     sizeof(le_cci));
+		if (!err) {
+			*cci = le32_to_cpu(le_cci);
+			len = min_t(u8, ucsi_itepd_get_len(*cci),
+				    sizeof(msg_in));
+			if (len)
+				err = itepd_read_reg(itepd,
+						     ITEPD_UCSI_MSG_IN_REG,
+						     msg_in, len);
+		}
+	}
+
+	ack = event;
+	ret = itepd_write_reg(itepd, ITEPD_VENDOR_WC_INT, &ack, sizeof(ack));
+	if (ret)
+		return ret;
+
+	if (err)
+		return err;
+
+	if (event & ITEPD_ALERT_UCSI_EVENT) {
+		mutex_lock(&itepd->received_lock);
+		itepd->cci = *cci;
+		memset(itepd->msg_in, 0, sizeof(itepd->msg_in));
+		memcpy(itepd->msg_in, msg_in, len);
+		mutex_unlock(&itepd->received_lock);
+		return ITEPD_EVENT_UCSI;
+	}
+
+	mutex_lock(&itepd->received_lock);
+	*cci = itepd->cci;
+	mutex_unlock(&itepd->received_lock);
+
+	return ITEPD_EVENT_VDM;
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
+	guard(mutex)(&itepd->received_lock);
+	*cci = itepd->cci;
+
+	return 0;
+}
+
+static int ucsi_itepd_poll_cci(struct ucsi *ucsi, u32 *cci)
+{
+	struct itepd *itepd = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	ret = itepd_process_event(itepd, cci);
+	return ret < 0 ? ret : 0;
+}
+
+static int ucsi_itepd_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
+{
+	struct itepd *itepd = ucsi_get_drvdata(ucsi);
+
+	guard(mutex)(&itepd->received_lock);
+	memcpy(val, itepd->msg_in, min(val_len, sizeof(itepd->msg_in)));
+
+	return 0;
+}
+
+static int ucsi_itepd_async_control(struct ucsi *ucsi, u64 command)
+{
+	struct itepd *itepd = ucsi_get_drvdata(ucsi);
+	__le64 le_cmd = cpu_to_le64(command);
+
+	if (UCSI_COMMAND(command) == UCSI_PPM_RESET) {
+		mutex_lock(&itepd->received_lock);
+		itepd->cci = 0;
+		mutex_unlock(&itepd->received_lock);
+	}
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
+	u32 cci;
+	int ret;
+
+	ret = itepd_process_event(itepd, &cci);
+	if (ret == ITEPD_EVENT_NONE)
+		return IRQ_NONE;
+
+	if (ret < 0)
+		return IRQ_HANDLED;
+
+	if (ret == ITEPD_EVENT_UCSI)
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
+	u32 cci;
+	int ret;
+
+	if (client->irq <= 0)
+		return dev_err_probe(dev, -ENODEV, "no IRQ provided\n");
+
+	itepd = devm_kzalloc(dev, sizeof(*itepd), GFP_KERNEL);
+	if (!itepd)
+		return -ENOMEM;
+
+	itepd->client = client;
+	mutex_init(&itepd->i2c_lock);
+	mutex_init(&itepd->event_lock);
+	mutex_init(&itepd->received_lock);
+	i2c_set_clientdata(client, itepd);
+
+	itepd->ucsi = ucsi_create(dev, &ucsi_itepd_ops);
+	if (IS_ERR(itepd->ucsi))
+		return dev_err_probe(dev, PTR_ERR(itepd->ucsi),
+				     "ucsi_create failed\n");
+
+	ucsi_set_drvdata(itepd->ucsi, itepd);
+
+	ret = request_threaded_irq(client->irq, NULL, itepd_irq_thread_fn,
+				   IRQF_ONESHOT, dev_name(dev), itepd);
+	if (ret) {
+		dev_err_probe(dev, ret, "request_threaded_irq failed\n");
+		goto out_ucsi_destroy;
+	}
+
+	ret = itepd_process_event(itepd, &cci);
+	if (ret < 0)
+		dev_warn(dev, "initial event processing failed: %d\n", ret);
+
+	ret = ucsi_register(itepd->ucsi);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to register UCSI\n");
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
+	ucsi_unregister(itepd->ucsi);
+	free_irq(client->irq, itepd);
+	ucsi_destroy(itepd->ucsi);
+}
+
+static const struct of_device_id itepd_of_match_table[] = {
+	{ .compatible = "ite,it8851" },
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
+MODULE_DESCRIPTION("UCSI driver for ITE IT8851 and IT8853 Type-C PD controllers");
+MODULE_LICENSE("GPL");

-- 
2.53.0

