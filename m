Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113C3E832C;
	Fri, 17 Jul 2026 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282568; cv=none; b=akYcO5PCLi0pXN2Ly4mHi66IDxoHy+ZQUnDHLx57ZJ7OJeZxSPnaQl37t6w3ELW2mNjid6X5RCC7O9FofbG09SNl7TZUx071cKFbwcyH4Oq6oklCI5HFQkuQudxMOBIPkYGMxoz2Lc33jzradxUgFAnf3nR1j0XHIasBhwaNNMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282568; c=relaxed/simple;
	bh=+KRMrmp4pBjOEGmGHRX3xd0Ap0IzcMvSACvXZO5aYW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=r15l08bdu1O+CKKhwfLRHXtuF5tq2JxbXS0t9jY0qypPJFhB+SwedOuRS9VwdjFqOuhOYERgq86LC49XAGxb6gYPbXCE58iZZ8LH99DSsLuYgIpT1trNWQw5S0+bYH7faKAfBN287rPHVmcBfT7iAEu5KMDygzmXZ7xG72yoPT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=BBvXobF3; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="BBvXobF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=zGyCKB+h7NqqSgz2SnVL5gvj+3dNn6GdywQiCRMDn4I=;
  b=BBvXobF3J4FoSKgy85nE+imaVUyTCaSlQzP1WR/r7edZ+oBPrHtQzr0n
   QiCAqJbmcnLr/OteNa3qIiaa/gWhVhz7txZoPkqyusMu+TOcaGmQwa4v/
   1gaoxdvkmAz4aolJUze6OCFzdiFji26jkX8h7+WlJuUpn42GVdf87837X
   fvh/LgMCgfx52mPLjA1OReOvqt9fpw4vIMdCjz1negGYA7JjYiEOokhvA
   Lg4HF5Ig13wofcpAaFtOTsDLbSfcBor3tWLSIcQmAiTGGp91wntKCaEDE
   WkrCXF21/QetiMfNO6xpIdPhSLEFuxaQCu727bkJ6+7hV6Thx5LysUs7e
   g==;
X-CSE-ConnectionGUID: 0QOaRAXtRgyIptw0cmVM5g==
X-CSE-MsgGUID: /BMKthC3TK+OraqF+VD2wA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 17 Jul 2026 17:59:19 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 66H9xDoV095316;
	Fri, 17 Jul 2026 17:59:13 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 17:59:12 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Date: Fri, 17 Jul 2026 17:59:50 +0800
Subject: [PATCH v4 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD
 controller driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-ucsi-itepd-v4-2-f3ba5addd0df@ite.com.tw>
References: <20260717-ucsi-itepd-v4-0-f3ba5addd0df@ite.com.tw>
In-Reply-To: <20260717-ucsi-itepd-v4-0-f3ba5addd0df@ite.com.tw>
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
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	CC813D5D8462530AF745598D2ED250ABDE24F97605495D9ABCB2CDC7076ABE2F2002:8
X-MAIL:mse.ite.com.tw 66H9xDoV095316

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
 drivers/usb/typec/ucsi/ucsi_itepd.c | 381 ++++++++++++++++++++++++++++++++++++
 4 files changed, 393 insertions(+)

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
index 000000000000..ceaadb0b3fef
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
@@ -0,0 +1,381 @@
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
+	struct i2c_msg msg[2];
+	u8 *tx_buf, *rx_buf;
+	int ret;
+
+	tx_buf = kzalloc(1, GFP_KERNEL);
+	if (!tx_buf)
+		return -ENOMEM;
+
+	rx_buf = kzalloc(len, GFP_KERNEL);
+	if (!rx_buf) {
+		kfree(tx_buf);
+		return -ENOMEM;
+	}
+
+	tx_buf[0] = reg;
+
+	msg[0].addr	= client->addr;
+	msg[0].flags	= 0;
+	msg[0].len	= 1;
+	msg[0].buf	= tx_buf;
+
+	msg[1].addr	= client->addr;
+	msg[1].flags	= I2C_M_RD;
+	msg[1].len	= len;
+	msg[1].buf	= rx_buf;
+
+	mutex_lock(&itepd->i2c_lock);
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	mutex_unlock(&itepd->i2c_lock);
+	if (ret < 0) {
+		dev_err_ratelimited(&client->dev, "reg 0x%02x read failed: %d\n",
+				    reg, ret);
+		goto out_free;
+	}
+	if (ret != ARRAY_SIZE(msg)) {
+		ret = -EIO;
+		goto out_free;
+	}
+
+	memcpy(data, rx_buf, len);
+	ret = 0;
+
+out_free:
+	kfree(rx_buf);
+	kfree(tx_buf);
+	return ret;
+}
+
+static int itepd_write_reg(struct itepd *itepd, u8 reg, const void *data, u32 len)
+{
+	struct i2c_client *client = itepd->client;
+	struct i2c_msg msg[1];
+	u8 *tx_buf;
+	int ret;
+
+	tx_buf = kzalloc(len + 1, GFP_KERNEL);
+	if (!tx_buf)
+		return -ENOMEM;
+
+	tx_buf[0] = reg;
+	memcpy(tx_buf + 1, data, len);
+
+	msg[0].addr	= client->addr;
+	msg[0].flags	= 0;
+	msg[0].len	= len + 1;
+	msg[0].buf	= tx_buf;
+
+	mutex_lock(&itepd->i2c_lock);
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	mutex_unlock(&itepd->i2c_lock);
+	if (ret < 0) {
+		dev_err_ratelimited(&client->dev, "reg 0x%02x write failed: %d\n",
+				    reg, ret);
+		goto out_free;
+	}
+	if (ret != ARRAY_SIZE(msg)) {
+		ret = -EIO;
+		goto out_free;
+	}
+
+	ret = 0;
+
+out_free:
+	kfree(tx_buf);
+	return ret;
+}
+
+static int itepd_process_event(struct itepd *itepd, u32 *cci)
+{
+	u8 msg_in[ITEPD_MSG_IN_MAX_LEN] = {};
+	__le32 le_cci;
+	u8 event, ack;
+	u8 len = 0;
+	int ret;
+
+	mutex_lock(&itepd->event_lock);
+
+	ret = itepd_read_reg(itepd, ITEPD_VENDOR_INT, &event, sizeof(event));
+	if (ret)
+		goto out_unlock;
+
+	event &= ITEPD_ALERT_VDM_EVENT | ITEPD_ALERT_UCSI_EVENT;
+	if (!event) {
+		mutex_lock(&itepd->received_lock);
+		*cci = itepd->cci;
+		mutex_unlock(&itepd->received_lock);
+		ret = ITEPD_EVENT_NONE;
+		goto out_unlock;
+	}
+
+	if (event & ITEPD_ALERT_UCSI_EVENT) {
+		ret = itepd_read_reg(itepd, ITEPD_UCSI_CCI_REG, &le_cci,
+				     sizeof(le_cci));
+		if (ret)
+			goto out_unlock;
+
+		*cci = le32_to_cpu(le_cci);
+		len = min_t(u8, ucsi_itepd_get_len(*cci), sizeof(msg_in));
+		if (len) {
+			ret = itepd_read_reg(itepd, ITEPD_UCSI_MSG_IN_REG,
+					     msg_in, len);
+			if (ret)
+				goto out_unlock;
+		}
+	}
+
+	ack = event;
+	ret = itepd_write_reg(itepd, ITEPD_VENDOR_WC_INT, &ack, sizeof(ack));
+	if (ret)
+		goto out_unlock;
+
+	if (event & ITEPD_ALERT_UCSI_EVENT) {
+		mutex_lock(&itepd->received_lock);
+		itepd->cci = *cci;
+		memset(itepd->msg_in, 0, sizeof(itepd->msg_in));
+		memcpy(itepd->msg_in, msg_in, len);
+		mutex_unlock(&itepd->received_lock);
+		ret = ITEPD_EVENT_UCSI;
+	} else {
+		mutex_lock(&itepd->received_lock);
+		*cci = itepd->cci;
+		mutex_unlock(&itepd->received_lock);
+		ret = ITEPD_EVENT_VDM;
+	}
+
+out_unlock:
+	mutex_unlock(&itepd->event_lock);
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
+	if (ret < 0 || ret == ITEPD_EVENT_NONE)
+		return IRQ_NONE;
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
+		return PTR_ERR(itepd->ucsi);
+
+	ucsi_set_drvdata(itepd->ucsi, itepd);
+
+	ret = request_threaded_irq(client->irq, NULL, itepd_irq_thread_fn,
+				   IRQF_ONESHOT, dev_name(dev), itepd);
+	if (ret) {
+		dev_err(dev, "request_threaded_irq failed - %d\n", ret);
+		goto out_ucsi_destroy;
+	}
+
+	itepd_process_event(itepd, &cci);
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
+	ucsi_unregister(itepd->ucsi);
+	free_irq(client->irq, itepd);
+	ucsi_destroy(itepd->ucsi);
+}
+
+static const struct of_device_id itepd_of_match_table[] = {
+	{ .compatible = "ite,it8851" },
+	{ .compatible = "ite,it8853" },
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

