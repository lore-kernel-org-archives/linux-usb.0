Received: from ironport.ite.com.tw (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AE01A6816;
	Mon, 15 Jun 2026 05:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.202.87.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781502992; cv=none; b=WUfU5UeSPFBFsVpoiDmqsgeKM8Gj9TOcIqTFpD5/DKKcaMlj3W4WRH5vYE1l+QqBettsurEy5B5LoIWnoDmpYsg1plVqkgavA4xLlO/99zX8kgQjE7T+KZZl+c2Hbxhcjv67JJ3JluJUMrZY0uqMHClDamyX/rRVDmxAcPtuMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781502992; c=relaxed/simple;
	bh=mVdhqFFqRvXm10ubtFX5qrKMizq+tqddEmIhJWrwwGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mHWIFkiaKS8fDqsfyVTw5liO2Cx9rwEypfIlGW8tUKUKsQ9UpGruSMWr6IXuuAn+efURKiLbpIUJqtLERCbKHfwQwlE3FZpZtKfnGmbWH5ssSBVvKVE4az2SdEsn0zfCG8TxYHGKDbqcAR2yam1vBxo7zjgzsT2YlhIClB4UYNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=XnENT16k; arc=none smtp.client-ip=210.202.87.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="XnENT16k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=X54T08r4C6bfRWAwgy1yXyT2ufbgSEdeyXDYCKs0n5I=;
  b=XnENT16kCJWSbM1KoMo7xQV1cA5//xKG4iUVleZQlwHtg2xaJNKQ6ijd
   qHwf+nc86Chd8YF7Xj2B9lDC+eu+Ad0GKJ2R8GAFQNQ3y8lLIFiE+l24E
   OsjUXV5BnRrJQD+SROCiz1ZQXSJMkXLrfsz+dmPhO8II2WG/xOR3NNVI0
   AOaMYkPZ+BVFreKr/lvqzq42+3oxyYcaQ4KTAIQmtyMBAqW3hJxGJH/3H
   7WEt1MQoadVf9iBmDqhsBLv0MmQt/Ty1HbBELY7Mnv8sL17QcoGI8Bbl4
   y/FnUdSghG6HUHfd8y1sFQuZUNoMMkpQeEbLYh7vBDK7jjzgHzJsahNih
   g==;
X-CSE-ConnectionGUID: NA5wNXEhQPu+lGjlZW010w==
X-CSE-MsgGUID: tsFxUA4cRG+K5hiEmMRJBA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 15 Jun 2026 13:48:54 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw [192.168.35.58])
	by mse.ite.com.tw with ESMTP id 65F5mpMU030759;
	Mon, 15 Jun 2026 13:48:51 +0800 (+08)
	(envelope-from amber.kao@ite.com.tw)
Received: from [127.0.1.1] (192.168.37.107) by HSCMAIL1.internal.ite.com.tw
 (192.168.35.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 15 Jun
 2026 13:48:51 +0800
From: Amber Kao <amber.kao@ite.com.tw>
Date: Mon, 15 Jun 2026 21:47:40 +0800
Subject: [PATCH 2/2] usb: typec: ucsi: Add ITE IT885x Type-C PD controller
 driver
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260615-ucsi-itepd-feature-v1-2-a826cfd0df6a@ite.com.tw>
References: <20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw>
In-Reply-To: <20260615-ucsi-itepd-feature-v1-0-a826cfd0df6a@ite.com.tw>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang
	<Yaode.Fang@ite.com.tw>,
        Bling Chiang <Bling.Chiang@ite.com.tw>, Eric Su
	<Eric.Su@ite.com.tw>,
        Doreen Lin <doreen.lin@ite.com.tw>,
        Heikki Krogerus
	<heikki.krogerus@linux.intel.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Amber Kao <amber.kao@ite.com.tw>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 HSCMAIL1.internal.ite.com.tw (192.168.35.58)
X-TM-SNTS-SMTP:
	4522D954B3C2F580384024C32FD1547ACAAA969547953ECA050B8A677F10CD4B2002:8
X-MAIL:mse.ite.com.tw 65F5mpMU030759

Add core, UCSI, and Alternate Mode support for the ITE IT885x
Type-C Power Delivery controller over I2C. The driver uses the
auxiliary bus to spawn UCSI and Alternate Mode child devices from
the main I2C core driver.

Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>
Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
Cc: Eric Su <Eric.Su@ite.com.tw>
Cc: Doreen Lin <doreen.lin@ite.com.tw>

Signed-off-by: Amber Kao <amber.kao@ite.com.tw>
---
 MAINTAINERS                            |   4 +
 drivers/usb/typec/ucsi/Kconfig         |  15 +
 drivers/usb/typec/ucsi/Makefile        |   1 +
 drivers/usb/typec/ucsi/itepd.c         | 481 ++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/itepd.h         |  64 ++++
 drivers/usb/typec/ucsi/itepd_altmode.c | 438 ++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi_itepd.c    | 558 +++++++++++++++++++++++++++++++++
 7 files changed, 1561 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 94afe3729059..c936928a7028 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13730,6 +13730,10 @@ R:	Doreen Lin <doreen.lin@ite.com.tw>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/usb/ite,itepd-it885x.yaml
+F:	drivers/usb/typec/ucsi/itepd.c
+F:	drivers/usb/typec/ucsi/itepd.h
+F:	drivers/usb/typec/ucsi/itepd_altmode.c
+F:	drivers/usb/typec/ucsi/ucsi_itepd.c
 
 IVTV VIDEO4LINUX DRIVER
 M:	Andy Walls <awalls@md.metrocast.net>
diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 87dd992a4b9e..470070f7e217 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -104,4 +104,19 @@ config UCSI_HUAWEI_GAOKUN
 	  To compile the driver as a module, choose M here: the module will be
 	  called ucsi_huawei_gaokun.
 
+config TYPEC_UCSI_ITEPD
+	tristate "ITE IT885x Type-C PD and UCSI Driver"
+	depends on I2C
+	depends on DRM
+	select AUXILIARY_BUS
+	help
+	  This driver enables core, UCSI, and Alternate Mode support for
+	  the ITE IT885x Type-C Power Delivery controller over I2C.
+
+	  The driver uses the auxiliary bus to spawn the UCSI and Altmode
+	  child devices from the main I2C core driver.
+
+	  To compile the driver as a module, choose M here: the modules
+	  will be called itepd, ucsi_itepd and itepd_altmode.
+
 endif
diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
index c7e38bf01350..437a23f0031c 100644
--- a/drivers/usb/typec/ucsi/Makefile
+++ b/drivers/usb/typec/ucsi/Makefile
@@ -28,3 +28,4 @@ obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
 obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
 obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
 obj-$(CONFIG_UCSI_HUAWEI_GAOKUN)	+= ucsi_huawei_gaokun.o
+obj-$(CONFIG_TYPEC_UCSI_ITEPD)		+= itepd.o ucsi_itepd.o itepd_altmode.o
diff --git a/drivers/usb/typec/ucsi/itepd.c b/drivers/usb/typec/ucsi/itepd.c
new file mode 100644
index 000000000000..39ac1c136157
--- /dev/null
+++ b/drivers/usb/typec/ucsi/itepd.c
@@ -0,0 +1,481 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026, ITE. All Rights Reserved
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/gpio/consumer.h>
+
+#include "itepd.h"
+
+#define ITEPD_UCSI_VERSION_REG			(0x80)
+#define ITEPD_UCSI_CCI_REG				(0x84)
+#define ITEPD_UCSI_MSG_IN_REG			(0x88)
+#define ITEPD_UCSI_CONTROL_REG			(0x98)
+#define ITEPD_UCSI_MSG_OUT_REG			(0xA0)
+
+#define ITEPD_VENDOR_WC_INT				(0xBC)
+#define ITEPD_VENDOR_INT				(0xBD)
+	#define ITEPD_ALERT_VDM_EVENT			BIT(0)
+	#define ITEPD_ALERT_UCSI_EVENT			BIT(1)
+
+struct itepd {
+	struct device *dev;
+	struct i2c_client *client;
+	int irq;
+	struct mutex i2c_lock; /* Protects I2C read/write operations */
+	struct mutex cb_lock;  /* Protects concurrent access to callback state */
+	unsigned long client_mask;
+	struct auxiliary_device *ucsi_aux;
+	struct auxiliary_device *altmode_aux;
+	struct itepd_ucsi_cb *ucsi_cb;
+	struct itepd_altmode_cb *altmode_cb;
+
+	struct itepd_altmode_data altmode_data[ITEPD_MAX_PORTS];
+};
+
+/*
+ * ITE Read/Write Function
+ */
+
+static int itepd_read_reg(struct itepd *itepd, u8 reg, void *data, u32 len)
+{
+	struct i2c_client *client = itepd->client;
+	struct i2c_msg msg[] = {
+		{
+			.addr	= client->addr,
+			.flags	= 0x0,
+			.len	= 1,
+			.buf	= &reg,
+		},
+		{
+			.addr	= client->addr,
+			.flags	= I2C_M_RD,
+			.len	= len,
+			.buf	= (u8 *)data,
+		}
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret < 0) {
+		dev_err(itepd->dev, "i2c_transfer read failed %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int itepd_write_reg(struct itepd *itepd, u8 reg, const void *data, u32 len)
+{
+	struct i2c_client *client = itepd->client;
+	unsigned char *buf;
+	struct i2c_msg msg[] = {
+		{
+			.addr	= client->addr,
+			.flags	= 0x0,
+		}
+	};
+	int ret;
+
+	buf = kzalloc(len + sizeof(reg), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	buf[0] = reg;
+	memcpy(buf + sizeof(reg), (u8 *)data, len);
+
+	msg[0].len = len + sizeof(reg);
+	msg[0].buf = buf;
+
+	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+	if (ret < 0) {
+		dev_err(itepd->dev, "i2c_transfer write failed %d\n", ret);
+		kfree(buf);
+		return ret;
+	}
+
+	kfree(buf);
+	return 0;
+}
+
+/**
+ * itepd_cmd_receive() - Receive UCSI command from ITEPD controller
+ * @dev: Pointer to the device structure
+ * @cmd: The command to be executed
+ * @val: Buffer to store the received data
+ * @val_len: Length of the buffer
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+
+int itepd_cmd_receive(struct device *dev, unsigned int cmd, void *val, size_t val_len)
+{
+	struct itepd *itepd = i2c_get_clientdata(to_i2c_client(dev->parent));
+	int ret;
+
+	if (!itepd)
+		return -ENXIO;
+
+	switch (cmd) {
+	case ITEPD_RECEIVE_UCSI_VERSION:
+		mutex_lock(&itepd->i2c_lock);
+		ret = itepd_read_reg(itepd, ITEPD_UCSI_VERSION_REG, val,
+				     min_t(size_t, val_len, 0x28));
+		mutex_unlock(&itepd->i2c_lock);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(itepd_cmd_receive);
+
+int itepd_cmd_send(struct device *dev, unsigned int cmd, const void *val, size_t val_len)
+{
+	struct itepd *itepd = i2c_get_clientdata(to_i2c_client(dev->parent));
+	int ret;
+
+	if (!itepd)
+		return -ENXIO;
+
+	switch (cmd) {
+	case ITEPD_SEND_UCSI_CONTROL:
+		mutex_lock(&itepd->i2c_lock);
+		ret = itepd_write_reg(itepd, ITEPD_UCSI_CONTROL_REG, val,
+				      min_t(size_t, val_len, 8));
+		mutex_unlock(&itepd->i2c_lock);
+		break;
+	case ITEPD_SEND_UCSI_MESSAGE_OUT:
+		mutex_lock(&itepd->i2c_lock);
+		ret = itepd_write_reg(itepd, ITEPD_UCSI_MSG_OUT_REG, val, val_len);
+		mutex_unlock(&itepd->i2c_lock);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(itepd_cmd_send);
+
+int itepd_register_cb(struct device *dev, u8 id, void *cb)
+{
+	struct itepd *itepd = i2c_get_clientdata(to_i2c_client(dev->parent));
+
+	if (!itepd)
+		return -EPROBE_DEFER;
+
+	switch (id) {
+	case ITEPD_CLIENT_UCSI:
+		if (itepd->ucsi_aux && dev == &itepd->ucsi_aux->dev) {
+			mutex_lock(&itepd->cb_lock);
+			itepd->ucsi_cb = (struct itepd_ucsi_cb *)cb;
+			mutex_unlock(&itepd->cb_lock);
+		} else {
+			return -ENODEV;
+		}
+		break;
+	case ITEPD_CLIENT_ALTMODE:
+		if (itepd->altmode_aux && dev == &itepd->altmode_aux->dev) {
+			mutex_lock(&itepd->cb_lock);
+			itepd->altmode_cb = (struct itepd_altmode_cb *)cb;
+			mutex_unlock(&itepd->cb_lock);
+		} else {
+			return -ENODEV;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(itepd_register_cb);
+
+int itepd_mode(struct device *dev, u8 port, u8 mux, u32 config, u32 status)
+{
+	struct itepd *itepd = i2c_get_clientdata(to_i2c_client(dev->parent));
+
+	if (!itepd)
+		return -ENXIO;
+
+	if (itepd->ucsi_aux && dev == &itepd->ucsi_aux->dev) {
+		itepd->altmode_data[port].port = port;
+		itepd->altmode_data[port].mux = mux;
+		itepd->altmode_data[port].dp_config = config;
+		itepd->altmode_data[port].dp_status = status;
+		if (itepd->altmode_cb)
+			itepd->altmode_cb->notify(itepd->altmode_cb->priv,
+						  &itepd->altmode_data[port]);
+	} else {
+		return -ENODEV;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(itepd_mode);
+
+int itepd_hpd(struct device *dev, u8 port, u32 status)
+{
+	struct itepd *itepd = i2c_get_clientdata(to_i2c_client(dev->parent));
+
+	if (!itepd)
+		return -ENXIO;
+
+	if (itepd->ucsi_aux && dev == &itepd->ucsi_aux->dev) {
+		itepd->altmode_data[port].dp_status = status;
+		if (itepd->altmode_cb)
+			itepd->altmode_cb->notify(itepd->altmode_cb->priv,
+						  &itepd->altmode_data[port]);
+	} else {
+		return -ENODEV;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(itepd_hpd);
+
+/*
+ * ITE Interrupt Function
+ */
+
+static irqreturn_t itepd_irq_process(struct itepd *itepd)
+{
+	u8 event;
+	u8 clear = 0;
+	u8 len;
+	u32 cci;
+	u8 msg_in[0x28];
+	bool notify_ucsi = false;
+	int ret;
+
+	mutex_lock(&itepd->i2c_lock);
+
+	ret = itepd_read_reg(itepd, ITEPD_VENDOR_INT, &event, 1);
+	if (ret) {
+		mutex_unlock(&itepd->i2c_lock);
+		return IRQ_HANDLED;
+	}
+
+	mutex_lock(&itepd->cb_lock);
+	if (event & ITEPD_ALERT_VDM_EVENT)
+		clear |= ITEPD_ALERT_VDM_EVENT;
+
+	if (event & ITEPD_ALERT_UCSI_EVENT) {
+		clear |= ITEPD_ALERT_UCSI_EVENT;
+		if (itepd->ucsi_cb) {
+			ret = itepd_read_reg(itepd, ITEPD_UCSI_CCI_REG, &cci, sizeof(cci));
+			if (ret)
+				goto err_mutex_unlock_cb;
+			len = itepd->ucsi_cb->get_len(itepd->ucsi_cb->priv, cci);
+
+			if (len > 0) {
+				ret = itepd_read_reg(itepd, ITEPD_UCSI_MSG_IN_REG, msg_in,
+						     min_t(size_t, len, 0x28));
+				if (ret)
+					goto err_mutex_unlock_cb;
+			}
+			notify_ucsi = true;
+		}
+	}
+
+	if (clear) {
+		ret = itepd_write_reg(itepd, ITEPD_VENDOR_WC_INT, &clear, 1);
+		if (ret)
+			goto err_mutex_unlock_cb;
+	}
+
+	if (notify_ucsi)
+		itepd->ucsi_cb->notify(itepd->ucsi_cb->priv, cci, msg_in);
+
+	mutex_unlock(&itepd->cb_lock);
+	mutex_unlock(&itepd->i2c_lock);
+
+	return IRQ_HANDLED;
+
+err_mutex_unlock_cb:
+	mutex_unlock(&itepd->cb_lock);
+	clear = (ITEPD_ALERT_VDM_EVENT | ITEPD_ALERT_UCSI_EVENT);
+	itepd_write_reg(itepd, ITEPD_VENDOR_WC_INT, &clear, 1);
+	mutex_unlock(&itepd->i2c_lock);
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
+/*
+ * ITE AUX Function
+ */
+static void itepd_ucsi_aux_release(struct device *dev)
+{
+	struct auxiliary_device *adev = container_of(dev, struct auxiliary_device, dev);
+
+	of_node_put(dev->of_node);
+	kfree(adev);
+}
+
+static void itepd_altmode_aux_release(struct device *dev)
+{
+	struct auxiliary_device *adev = container_of(dev, struct auxiliary_device, dev);
+
+	of_node_put(dev->of_node);
+	kfree(adev);
+}
+
+static int itepd_add_aux_device(struct itepd *itepd,
+				struct auxiliary_device **aux_out,
+				const char *name,
+				void (*release)(struct device *))
+{
+	struct auxiliary_device *aux;
+	int ret;
+
+	aux = kzalloc_obj(*aux, GFP_KERNEL);
+	if (!aux)
+		return -ENOMEM;
+
+	aux->name = name;
+	aux->dev.parent = itepd->dev;
+	aux->dev.release = release;
+	device_set_of_node_from_dev(&aux->dev, itepd->dev);
+
+	ret = auxiliary_device_init(aux);
+	if (ret) {
+		of_node_put(aux->dev.of_node);
+		kfree(aux);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(aux);
+	if (ret) {
+		auxiliary_device_uninit(aux);
+		return ret;
+	}
+
+	*aux_out = aux;
+	return 0;
+}
+
+static void itepd_del_aux_device(struct auxiliary_device *aux)
+{
+	auxiliary_device_delete(aux);
+	auxiliary_device_uninit(aux);
+}
+
+/*
+ * ITE Probe/Remove
+ */
+
+static int itepd_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct itepd *itepd;
+	const unsigned long *match_data;
+	struct gpio_desc *desc;
+	int ret;
+
+	itepd = devm_kzalloc(dev, sizeof(struct itepd), GFP_KERNEL);
+	if (!itepd)
+		return -ENOMEM;
+
+	itepd->dev = dev;
+	itepd->client = client;
+	itepd->irq = client->irq;
+	mutex_init(&itepd->i2c_lock);
+	mutex_init(&itepd->cb_lock);
+
+	match_data = (unsigned long *)of_device_get_match_data(dev);
+
+	if (!match_data)
+		return -EINVAL;
+	itepd->client_mask = *match_data;
+
+	i2c_set_clientdata(client, itepd);
+
+	if (itepd->irq > 0) {
+		ret = request_threaded_irq(itepd->irq, NULL, itepd_irq_thread_fn,
+					   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					   dev_name(dev), itepd);
+		if (ret < 0) {
+			dev_err(dev, "request_threaded_irq failed - %d\n", ret);
+			return ret;
+		}
+	}
+
+	desc = devm_gpiod_get(dev, NULL, GPIOD_IN);
+
+	if (IS_ERR(desc)) {
+		dev_info(dev, "get gpios from DTS failed\n");
+	} else {
+		if (gpiod_get_value(desc))
+			itepd_irq_process(itepd);
+	}
+
+	if (itepd->client_mask & BIT(ITEPD_CLIENT_ALTMODE)) {
+		ret = itepd_add_aux_device(itepd, &itepd->altmode_aux, "altmode",
+					   itepd_altmode_aux_release);
+		if (ret)
+			goto out_free_irq;
+	}
+
+	if (itepd->client_mask & BIT(ITEPD_CLIENT_UCSI)) {
+		ret = itepd_add_aux_device(itepd, &itepd->ucsi_aux, "ucsi", itepd_ucsi_aux_release);
+		if (ret)
+			goto out_release_altmode_aux;
+	}
+
+	return 0;
+
+out_release_altmode_aux:
+	if (itepd->client_mask & BIT(ITEPD_CLIENT_ALTMODE))
+		itepd_del_aux_device(itepd->altmode_aux);
+out_free_irq:
+	free_irq(itepd->irq, itepd);
+	return ret;
+}
+
+static void itepd_remove(struct i2c_client *client)
+{
+	struct itepd *itepd = i2c_get_clientdata(client);
+
+	if (itepd->client_mask & BIT(ITEPD_CLIENT_UCSI))
+		itepd_del_aux_device(itepd->ucsi_aux);
+	if (itepd->client_mask & BIT(ITEPD_CLIENT_ALTMODE))
+		itepd_del_aux_device(itepd->altmode_aux);
+	free_irq(itepd->irq, itepd);
+}
+
+static const unsigned long itepd_rb3gen2_client_mask =
+	BIT(ITEPD_CLIENT_ALTMODE) | BIT(ITEPD_CLIENT_UCSI);
+
+static const struct of_device_id itepd_of_match_table[] = {
+	{ .compatible = "ite,itepd-it885x", .data = &itepd_rb3gen2_client_mask },
+	{}
+};
+MODULE_DEVICE_TABLE(of, itepd_of_match_table);
+
+static struct i2c_driver itepd_driver = {
+	.driver = {
+		.name = "itepd",
+		.of_match_table = itepd_of_match_table,
+	},
+	.probe = itepd_probe,
+	.remove = itepd_remove,
+};
+
+module_i2c_driver(itepd_driver);
+
+MODULE_AUTHOR("Jeson Yang <jeson.yang@ite.com.tw>");
+MODULE_DESCRIPTION("ITEPD driver for ITE Type-C PD controller");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/typec/ucsi/itepd.h b/drivers/usb/typec/ucsi/itepd.h
new file mode 100644
index 000000000000..339b3ab0dc88
--- /dev/null
+++ b/drivers/usb/typec/ucsi/itepd.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025-2026, ITE. All Rights Reserved
+ */
+#ifndef __SOC_ITE_ITEPD_H__
+#define __SOC_ITE_ITEPD_H__
+
+#define ITEPD_MAX_PORTS						2
+
+enum {
+	ITEPD_CLIENT_UCSI,
+	ITEPD_CLIENT_ALTMODE,
+};
+
+enum {
+	ITEPD_SEND_UCSI_CONTROL,
+	ITEPD_SEND_UCSI_MESSAGE_OUT,
+};
+
+enum {
+	ITEPD_RECEIVE_UCSI_VERSION,
+};
+
+enum {
+	ITEPD_USBPD_MUX_USB_0 = 0,
+	ITEPD_USBPD_MUX_USB_1,
+	ITEPD_USBPD_MUX_DP_0,
+	ITEPD_USBPD_MUX_DP_1,
+	ITEPD_USBPD_MUX_USB_DP_0,
+	ITEPD_USBPD_MUX_USB_DP_1,
+	ITEPD_USBPD_MUX_TBT_0,
+	ITEPD_USBPD_MUX_TBT_1,
+	ITEPD_USBPD_MUX_USB4_0,
+	ITEPD_USBPD_MUX_USB4_1,
+	ITEPD_USBPD_MUX_OFF
+};
+
+#define ITEPD_USBPD_MUX_FLIPPED				BIT(0)
+
+struct itepd_altmode_data {
+	u8 port;
+	u8 mux;
+	u32 dp_config;
+	u32 dp_status;
+};
+
+struct itepd_ucsi_cb {
+	u8 (*get_len)(void *priv, u32 cci);
+	void (*notify)(void *priv, u32 cci, u8 *data);
+	void *priv;
+};
+
+struct itepd_altmode_cb {
+	void (*notify)(void *priv, struct itepd_altmode_data *data);
+	void *priv;
+};
+
+int itepd_cmd_send(struct device *dev, unsigned int cmd, const void *val, size_t val_len);
+int itepd_cmd_receive(struct device *dev, unsigned int cmd, void *val, size_t val_len);
+int itepd_register_cb(struct device *dev, u8 id, void *cb);
+int itepd_mode(struct device *dev, u8 port, u8 mux, u32 config, u32 status);
+int itepd_hpd(struct device *dev, u8 port, u32 status);
+
+#endif
diff --git a/drivers/usb/typec/ucsi/itepd_altmode.c b/drivers/usb/typec/ucsi/itepd_altmode.c
new file mode 100644
index 000000000000..a88ae2fb6e79
--- /dev/null
+++ b/drivers/usb/typec/ucsi/itepd_altmode.c
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026, ITE. All Rights Reserved
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/workqueue.h>
+#include <linux/slab.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_retimer.h>
+
+#include <drm/drm_bridge.h>
+
+#include "itepd.h"
+
+struct itepd_altmode;
+
+struct itepd_altmode_port {
+	struct itepd_altmode *altmode;
+	unsigned int index;
+
+	struct workqueue_struct *ordered_wq;
+
+	struct typec_switch *typec_switch;
+	struct typec_mux *typec_mux;
+	struct typec_retimer *typec_retimer;
+	struct drm_bridge bridge;
+
+	enum typec_orientation orientation;
+};
+
+struct itepd_altmode {
+	struct device *dev;
+
+	struct itepd_altmode_port ports[ITEPD_MAX_PORTS];
+};
+
+struct itepd_altmode_work {
+	struct itepd_altmode_port *alt_port;
+	struct itepd_altmode_data data;
+	struct work_struct work;
+
+	/*
+	 * DP mode state buffers kept on the heap (inside this kmalloc'd work
+	 * item) so that itepd_altmode_dp() does not need large local variables
+	 * and avoids triggering CONFIG_FRAME_WARN / checkstack.
+	 */
+	struct typec_altmode		dp_alt;
+	struct typec_displayport_data	dp_data;
+	struct typec_mux_state		mux_state;
+	struct typec_retimer_state	retimer_state;
+};
+
+static enum typec_orientation itepd_altmode_mux_to_orientation(u8 mux)
+{
+	if (mux >= ITEPD_USBPD_MUX_OFF)
+		return TYPEC_ORIENTATION_NONE;
+	else
+		return (mux & ITEPD_USBPD_MUX_FLIPPED) ?
+			TYPEC_ORIENTATION_REVERSE : TYPEC_ORIENTATION_NORMAL;
+}
+
+static void itepd_altmode_safe(struct itepd_altmode_port *alt_port,
+			       struct itepd_altmode_work *worker)
+{
+	struct itepd_altmode *altmode = alt_port->altmode;
+	struct typec_mux_state mux_state = {};
+	struct typec_retimer_state retimer_state = {};
+	int ret;
+
+	mux_state.alt = NULL;
+	mux_state.data = NULL;
+	mux_state.mode = TYPEC_STATE_SAFE;
+
+	ret = typec_mux_set(alt_port->typec_mux, &mux_state);
+	if (ret)
+		dev_err(altmode->dev, "failed to switch mux to safe mode\n");
+
+	retimer_state.alt = NULL;
+	retimer_state.data = NULL;
+	retimer_state.mode = TYPEC_STATE_SAFE;
+
+	ret = typec_retimer_set(alt_port->typec_retimer, &retimer_state);
+	if (ret)
+		dev_err(altmode->dev, "failed to setup retimer to safe mode\n");
+}
+
+static void itepd_altmode_usb(struct itepd_altmode_port *alt_port,
+			      struct itepd_altmode_work *worker)
+{
+	struct itepd_altmode *altmode = alt_port->altmode;
+	struct typec_mux_state mux_state = {};
+	struct typec_retimer_state retimer_state = {};
+	int ret;
+
+	mux_state.alt = NULL;
+	mux_state.data = NULL;
+	mux_state.mode = TYPEC_STATE_USB;
+
+	ret = typec_mux_set(alt_port->typec_mux, &mux_state);
+	if (ret)
+		dev_err(altmode->dev, "failed to switch mux to USB\n");
+
+	retimer_state.alt = NULL;
+	retimer_state.data = NULL;
+	retimer_state.mode = TYPEC_STATE_USB;
+
+	ret = typec_retimer_set(alt_port->typec_retimer, &retimer_state);
+	if (ret)
+		dev_err(altmode->dev, "failed to setup retimer to USB\n");
+}
+
+static void itepd_altmode_dp(struct itepd_altmode_port *alt_port,
+			     struct itepd_altmode_work *worker)
+{
+	struct itepd_altmode *altmode = alt_port->altmode;
+	u32 pin_assign;
+	unsigned int mode;
+	int ret;
+
+	/* Use heap buffers in worker to avoid large stack frames. */
+	memset(&worker->dp_alt, 0, sizeof(worker->dp_alt));
+	memset(&worker->dp_data, 0, sizeof(worker->dp_data));
+	memset(&worker->mux_state, 0, sizeof(worker->mux_state));
+	memset(&worker->retimer_state, 0, sizeof(worker->retimer_state));
+
+	worker->dp_alt.svid   = USB_TYPEC_DP_SID;
+	worker->dp_alt.mode   = USB_TYPEC_DP_MODE;
+	worker->dp_alt.active = 1;
+
+	worker->dp_data.status = worker->data.dp_status &
+				 (DP_STATUS_ENABLED | DP_STATUS_HPD_STATE |
+				  DP_STATUS_IRQ_HPD);
+	worker->dp_data.conf = worker->data.dp_config & DP_CONF_PIN_ASSIGNEMENT_MASK;
+
+	pin_assign = DP_CONF_GET_PIN_ASSIGN(worker->data.dp_config);
+	if (pin_assign == BIT(DP_PIN_ASSIGN_C))
+		mode = DP_PIN_ASSIGN_C;
+	else if (pin_assign == BIT(DP_PIN_ASSIGN_D))
+		mode = DP_PIN_ASSIGN_D;
+	else
+		mode = 0; /* unknown pin assignment — fall back to safe */
+
+	worker->mux_state.alt  = &worker->dp_alt;
+	worker->mux_state.data = &worker->dp_data;
+	worker->mux_state.mode = mode ? TYPEC_MODAL_STATE(mode) : TYPEC_STATE_SAFE;
+
+	ret = typec_mux_set(alt_port->typec_mux, &worker->mux_state);
+	if (ret)
+		dev_err(altmode->dev, "failed to switch mux to DP\n");
+
+	worker->retimer_state.alt  = &worker->dp_alt;
+	worker->retimer_state.data = &worker->dp_data;
+	worker->retimer_state.mode = worker->mux_state.mode;
+
+	ret = typec_retimer_set(alt_port->typec_retimer, &worker->retimer_state);
+	if (ret)
+		dev_err(altmode->dev, "failed to setup retimer to DP\n");
+}
+
+static void itepd_altmode_worker(struct work_struct *work)
+{
+	struct itepd_altmode_work *worker =
+		container_of(work, struct itepd_altmode_work, work);
+	struct itepd_altmode_port *alt_port = worker->alt_port;
+
+	alt_port->orientation = itepd_altmode_mux_to_orientation(worker->data.mux);
+	typec_switch_set(alt_port->typec_switch, alt_port->orientation);
+
+	switch (worker->data.mux) {
+	case ITEPD_USBPD_MUX_OFF:
+		itepd_altmode_safe(alt_port, worker);
+		drm_bridge_hpd_notify(&alt_port->bridge,
+				      connector_status_disconnected);
+		break;
+
+	case ITEPD_USBPD_MUX_DP_0:
+	case ITEPD_USBPD_MUX_DP_1:
+	case ITEPD_USBPD_MUX_USB_DP_0:
+	case ITEPD_USBPD_MUX_USB_DP_1:
+		itepd_altmode_dp(alt_port, worker);
+		if (worker->data.dp_status & DP_STATUS_HPD_STATE)
+			drm_bridge_hpd_notify(&alt_port->bridge,
+					      connector_status_connected);
+		else
+			drm_bridge_hpd_notify(&alt_port->bridge,
+					      connector_status_disconnected);
+		break;
+
+	case ITEPD_USBPD_MUX_USB_0:
+	case ITEPD_USBPD_MUX_USB_1:
+	case ITEPD_USBPD_MUX_TBT_0:
+	case ITEPD_USBPD_MUX_TBT_1:
+	case ITEPD_USBPD_MUX_USB4_0:
+	case ITEPD_USBPD_MUX_USB4_1:
+		itepd_altmode_usb(alt_port, worker);
+		drm_bridge_hpd_notify(&alt_port->bridge,
+				      connector_status_disconnected);
+		break;
+
+	default:
+		dev_err(alt_port->altmode->dev,
+			"unknown mux state %u on port %u, forcing safe mode\n",
+			worker->data.mux, alt_port->index);
+		itepd_altmode_safe(alt_port, worker);
+		drm_bridge_hpd_notify(&alt_port->bridge,
+				      connector_status_disconnected);
+		break;
+	}
+
+	kfree(worker);
+}
+
+static int itepd_altmode_attach(struct drm_bridge *bridge,
+				struct drm_encoder *encoder,
+				enum drm_bridge_attach_flags flags)
+{
+	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
+}
+
+static const struct drm_bridge_funcs itepd_altmode_bridge_funcs = {
+	.attach = itepd_altmode_attach,
+};
+
+static void itepd_altmode_put_retimer(void *data)
+{
+	typec_retimer_put(data);
+}
+
+static void itepd_altmode_put_mux(void *data)
+{
+	typec_mux_put(data);
+}
+
+static void itepd_altmode_put_switch(void *data)
+{
+	typec_switch_put(data);
+}
+
+static void itepd_altmode_notify(void *priv, struct itepd_altmode_data *data)
+{
+	struct itepd_altmode *altmode = priv;
+	struct itepd_altmode_port *alt_port;
+	struct itepd_altmode_work *worker;
+
+	if (data->port >= ARRAY_SIZE(altmode->ports)) {
+		dev_err(altmode->dev, "invalid connector number, skip notify\n");
+		return;
+	}
+
+	alt_port = &altmode->ports[data->port];
+	if (!alt_port->altmode)
+		return;
+
+	worker = kmalloc_obj(*worker, GFP_KERNEL);
+	if (!worker) {
+		dev_err(altmode->dev, "out of memory, skip notify\n");
+		return;
+	}
+
+	memcpy(&worker->data, data, sizeof(struct itepd_altmode_data));
+	worker->alt_port = alt_port;
+
+	INIT_WORK(&worker->work, itepd_altmode_worker);
+	queue_work(alt_port->ordered_wq, &worker->work);
+}
+
+static void itepd_altmode_destroy_wq(void *data)
+{
+	struct workqueue_struct *wq = data;
+
+	flush_workqueue(wq);
+	destroy_workqueue(wq);
+}
+
+static int itepd_altmode_probe(struct auxiliary_device *adev,
+			       const struct auxiliary_device_id *id)
+{
+	struct itepd_altmode *altmode;
+	struct itepd_altmode_port *alt_port;
+	struct itepd_altmode_cb *cb;
+	struct fwnode_handle *fwnode;
+	struct device *dev = &adev->dev;
+	u32 port;
+	int ret;
+
+	altmode = devm_kzalloc(dev, sizeof(*altmode), GFP_KERNEL);
+	if (!altmode)
+		return -ENOMEM;
+
+	cb = devm_kzalloc(dev, sizeof(*cb), GFP_KERNEL);
+	if (!cb)
+		return -ENOMEM;
+
+	altmode->dev = dev;
+
+	device_for_each_child_node(dev, fwnode) {
+		ret = fwnode_property_read_u32(fwnode, "reg", &port);
+		if (ret < 0) {
+			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
+			fwnode_handle_put(fwnode);
+			return ret;
+		}
+
+		if (port >= ARRAY_SIZE(altmode->ports)) {
+			dev_warn(dev, "invalid connector number, ignoring\n");
+			continue;
+		}
+
+		if (altmode->ports[port].altmode) {
+			dev_err(dev, "multiple connector definition for port %u\n", port);
+			fwnode_handle_put(fwnode);
+			return -EINVAL;
+		}
+
+		alt_port = &altmode->ports[port];
+		alt_port->altmode = altmode;
+		alt_port->index = port;
+
+		alt_port->ordered_wq = alloc_ordered_workqueue("itepd_altmode_%u", 0, port);
+		if (!alt_port->ordered_wq) {
+			fwnode_handle_put(fwnode);
+			return -ENOMEM;
+		}
+
+		ret = devm_add_action_or_reset(dev, itepd_altmode_destroy_wq,
+					       alt_port->ordered_wq);
+		if (ret) {
+			fwnode_handle_put(fwnode);
+			return ret;
+		}
+
+		alt_port->bridge.funcs = &itepd_altmode_bridge_funcs;
+		alt_port->bridge.of_node = to_of_node(fwnode);
+		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
+		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+
+		alt_port->typec_mux = fwnode_typec_mux_get(fwnode);
+		if (IS_ERR(alt_port->typec_mux)) {
+			fwnode_handle_put(fwnode);
+			return dev_err_probe(dev, PTR_ERR(alt_port->typec_mux),
+					     "failed to acquire mode-switch for port: %d\n",
+					     port);
+		}
+
+		ret = devm_add_action_or_reset(dev, itepd_altmode_put_mux,
+					       alt_port->typec_mux);
+		if (ret) {
+			fwnode_handle_put(fwnode);
+			return ret;
+		}
+
+		alt_port->typec_retimer = fwnode_typec_retimer_get(fwnode);
+		if (IS_ERR(alt_port->typec_retimer)) {
+			fwnode_handle_put(fwnode);
+			return dev_err_probe(dev, PTR_ERR(alt_port->typec_retimer),
+					     "failed to acquire retimer-switch for port: %d\n",
+					     port);
+		}
+
+		ret = devm_add_action_or_reset(dev, itepd_altmode_put_retimer,
+					       alt_port->typec_retimer);
+		if (ret) {
+			fwnode_handle_put(fwnode);
+			return ret;
+		}
+
+		alt_port->typec_switch = fwnode_typec_switch_get(fwnode);
+		if (IS_ERR(alt_port->typec_switch)) {
+			fwnode_handle_put(fwnode);
+			return dev_err_probe(dev, PTR_ERR(alt_port->typec_switch),
+					     "failed to acquire orientation-switch for port: %d\n",
+					     port);
+		}
+
+		ret = devm_add_action_or_reset(dev, itepd_altmode_put_switch,
+					       alt_port->typec_switch);
+		if (ret) {
+			fwnode_handle_put(fwnode);
+			return ret;
+		}
+	}
+
+	for (port = 0; port < ARRAY_SIZE(altmode->ports); port++) {
+		alt_port = &altmode->ports[port];
+		if (!alt_port->altmode)
+			continue;
+
+		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
+		if (ret)
+			return ret;
+	}
+
+	dev_set_drvdata(dev, altmode);
+
+	cb->notify = itepd_altmode_notify;
+	cb->priv = altmode;
+
+	ret = itepd_register_cb(dev, ITEPD_CLIENT_ALTMODE, cb);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void itepd_altmode_remove(struct auxiliary_device *adev)
+{
+	itepd_register_cb(&adev->dev, ITEPD_CLIENT_ALTMODE, NULL);
+	/*
+	 * devm unwind handles workqueue flush/destroy and typec resource
+	 * release in reverse probe order.
+	 */
+}
+
+static const struct auxiliary_device_id itepd_altmode_id_table[] = {
+	{ .name = "itepd.altmode", },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, itepd_altmode_id_table);
+
+static struct auxiliary_driver itepd_altmode_driver = {
+	.name = "itepd_altmode",
+	.probe = itepd_altmode_probe,
+	.remove = itepd_altmode_remove,
+	.id_table = itepd_altmode_id_table,
+};
+
+module_auxiliary_driver(itepd_altmode_driver);
+
+MODULE_AUTHOR("Jeson Yang <jeson.yang@ite.com.tw>");
+MODULE_DESCRIPTION("USB Type-C alternate mode driver for ITE Type-C PD controller");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi/ucsi_itepd.c
new file mode 100644
index 000000000000..ea55ff7b866e
--- /dev/null
+++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025-2026, ITE. All Rights Reserved
+ */
+#include <linux/unaligned.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/workqueue.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/slab.h>
+
+#include "itepd.h"
+#include "ucsi.h"
+
+struct ucsi_itepd {
+	struct device *dev;
+	struct ucsi *ucsi;
+	struct completion complete;
+	struct mutex received_lock; /* Protects command response data:*/
+	struct workqueue_struct *ordered_wq;
+	bool connected[ITEPD_MAX_PORTS];
+	bool dp_en[ITEPD_MAX_PORTS];
+	bool con_change_processed[ITEPD_MAX_PORTS];
+	u8 cmd_port;
+	u8 resp_received;
+	u8 msg_in[0x28];
+	u8 dp_idx[ITEPD_MAX_PORTS];
+	u8 orientation[ITEPD_MAX_PORTS];
+	u8 mux[ITEPD_MAX_PORTS];
+	u32 cci;
+	u64 cmd;
+};
+
+struct ucsi_itepd_work {
+	struct ucsi_itepd *ucsi_itepd;
+	u8 port;
+	u32 cci;
+	struct work_struct work;
+};
+
+static struct ucsi_itepd *__ucsi_itepd;
+
+static void ucsi_itepd_handle_dp_altmode(struct ucsi_itepd *ucsi_itepd,
+					 u8 port, u8 *mux, u32 *config, u32 *status)
+{
+	u8 orientation = ucsi_itepd->orientation[port];
+	u8 data[10];
+	u64 cmd;
+	int ret;
+
+	cmd = UCSI_COMMAND(UCSI_GET_CURRENT_CAM) | UCSI_CONNECTOR_NUMBER(port + 1);
+	ret = ucsi_send_command(ucsi_itepd->ucsi, cmd, data, 1);
+	if (ret < 0)
+		return;
+
+	if (data[0] != ucsi_itepd->dp_idx[port])
+		return;
+
+	cmd = UCSI_COMMAND(UCSI_GET_CAM_CS) |
+	      UCSI_CONNECTOR_NUMBER(port + 1) |
+	      ((u64)(ucsi_itepd->dp_idx[port]) << 24);
+	ret = ucsi_send_command(ucsi_itepd->ucsi, cmd, data, 10);
+	if (ret < 0)
+		return;
+
+	*config = get_unaligned_le32(data + 6);
+	*status = get_unaligned_le32(data + 1);
+
+	if (DP_CONF_GET_PIN_ASSIGN(*config) == BIT(DP_PIN_ASSIGN_C)) {
+		*mux = (orientation == 1) ? ITEPD_USBPD_MUX_DP_1 : ITEPD_USBPD_MUX_DP_0;
+		ucsi_itepd->dp_en[port] = true;
+	} else if (DP_CONF_GET_PIN_ASSIGN(*config) == BIT(DP_PIN_ASSIGN_D)) {
+		*mux = (orientation == 1) ? ITEPD_USBPD_MUX_USB_DP_1 : ITEPD_USBPD_MUX_USB_DP_0;
+		ucsi_itepd->dp_en[port] = true;
+	}
+}
+
+static void ucsi_itepd_connector_partner_change(struct ucsi_itepd *ucsi_itepd,
+						u8 port, struct ucsi_connector *con)
+{
+	u8 orientation = ucsi_itepd->orientation[port];
+	u8 mux = ucsi_itepd->mux[port];
+	u32 config = 0;
+	u32 status = 0;
+
+	if (!(UCSI_CONSTAT(con, CHANGE) &
+	      (UCSI_CONSTAT_PARTNER_CHANGE | UCSI_CONSTAT_CONNECT_CHANGE)))
+		return;
+
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		mux = ITEPD_USBPD_MUX_OFF;
+		ucsi_itepd->dp_en[port] = false;
+	} else if (UCSI_CONSTAT(con, PARTNER_FLAG_ALT_MODE)) {
+		ucsi_itepd_handle_dp_altmode(ucsi_itepd, port, &mux, &config, &status);
+	} else {
+		mux = (orientation == 1) ? ITEPD_USBPD_MUX_USB_1 : ITEPD_USBPD_MUX_USB_0;
+		ucsi_itepd->dp_en[port] = false;
+	}
+
+	if (mux != ucsi_itepd->mux[port]) {
+		itepd_mode(ucsi_itepd->dev, port, mux, config, status);
+		ucsi_itepd->mux[port] = mux;
+	}
+}
+
+static void ucsi_itepd_connector_change_work(struct work_struct *work)
+{
+	struct ucsi_itepd_work *worker = container_of(work, struct ucsi_itepd_work, work);
+	struct ucsi_itepd *ucsi_itepd = worker->ucsi_itepd;
+	u8 data[11];
+	u8 num_vdos;
+	u32 status;
+	u64 cmd;
+	int ret;
+
+	if (ucsi_itepd->con_change_processed[worker->port])
+		goto out;
+
+	ucsi_itepd->con_change_processed[worker->port] = true;
+	if (ucsi_itepd->dp_en[worker->port]) {
+		/* UCSI_GET_ATTENTION_VDO (0x16) */
+		cmd = UCSI_COMMAND(UCSI_GET_ATTENTION_VDO) |
+		      UCSI_CONNECTOR_NUMBER(worker->port + 1);
+		ret = ucsi_send_command(ucsi_itepd->ucsi, cmd, data, 11);
+	}
+	if (ret < 0)
+		goto out;
+	num_vdos = data[2] & 0x07;
+	status = get_unaligned_le32(data + 7);
+
+	if (num_vdos)
+		itepd_hpd(ucsi_itepd->dev, worker->port, status);
+
+	ucsi_connector_change(ucsi_itepd->ucsi, UCSI_CCI_CONNECTOR(worker->cci));
+out:
+	kfree(worker);
+}
+
+static void ucsi_itepd_command_hook(struct ucsi_itepd *ucsi_itepd, u64 *cmd)
+{
+	/* Translate UCSI 1.2 commands/fields to ITE PD controller (v2.1) */
+	switch (UCSI_COMMAND(*cmd)) {
+	case UCSI_SET_NOTIFICATION_ENABLE:
+		if (*cmd & UCSI_ENABLE_NTFY_CMD_COMPLETE)
+			/* Enable Attention Notification for alt. mode */
+			*cmd |= FIELD_PREP(GENMASK_ULL(32, 16), BIT(3));
+		break;
+	case UCSI_GET_PDOS:
+		*cmd &= ~GENMASK_ULL(38, 37);
+		break;
+	case UCSI_GET_ERROR_STATUS:
+		*cmd &= ~GENMASK_ULL(22, 16);
+		*cmd |= UCSI_CONNECTOR_NUMBER(ucsi_itepd->cmd_port + 1);
+		break;
+	default:
+		break;
+	}
+
+	/* Track the connector number associated with this command */
+	switch (UCSI_COMMAND(*cmd)) {
+	case UCSI_PPM_RESET:
+	case UCSI_CANCEL:
+	case UCSI_SET_NOTIFICATION_ENABLE:
+	case UCSI_GET_CAPABILITY:
+		ucsi_itepd->cmd_port = 0;
+		break;
+	case UCSI_CONNECTOR_RESET:
+	case UCSI_GET_CONNECTOR_CAPABILITY:
+	case UCSI_SET_CCOM:		/* 0x08 - SET_UOM in older specs */
+	case UCSI_SET_UOR:
+	case UCSI_SET_PDR:
+	case UCSI_GET_CAM_SUPPORTED:
+	case UCSI_GET_CURRENT_CAM:
+	case UCSI_SET_NEW_CAM:
+	case UCSI_GET_PDOS:
+	case UCSI_GET_CABLE_PROPERTY:
+	case UCSI_GET_CONNECTOR_STATUS:
+	case UCSI_SET_POWER_LEVEL:	/* 0x14 */
+	case UCSI_GET_PD_MESSAGE:	/* 0x15 */
+	case UCSI_GET_ATTENTION_VDO:	/* 0x16 */
+	case UCSI_GET_CAM_CS:		/* 0x18 */
+	case 0x19:
+	case 0x1A:
+	case 0x1B:
+	case UCSI_SET_SINK_PATH:	/* 0x1C */
+	case 0x1D:
+	case UCSI_READ_POWER_LEVEL:	/* 0x1E */
+	case 0x1F:
+		ucsi_itepd->cmd_port =
+			FIELD_GET(GENMASK(22, 16), *cmd) - 1;
+		break;
+	case UCSI_GET_ALTERNATE_MODES:
+		ucsi_itepd->cmd_port =
+			FIELD_GET(GENMASK(30, 24), *cmd) - 1;
+		break;
+	}
+
+	ucsi_itepd->cmd = *cmd;
+}
+
+static void ucsi_itepd_response_hook(struct ucsi_itepd *ucsi_itepd,
+				     u32 *cci, u8 *msg_in)
+{
+	u8 recipient;
+	u8 offset;
+	struct ucsi_itepd_work *worker;
+
+	if (((*cci & UCSI_CCI_COMMAND_COMPLETE) == 0) &&
+	    UCSI_CCI_CONNECTOR(*cci)) {
+		worker = kmalloc_obj(*worker, GFP_KERNEL);
+		if (!worker) {
+			dev_err(ucsi_itepd->dev,
+				"out of memory, skip attention check\n");
+			ucsi_connector_change(ucsi_itepd->ucsi,
+					      UCSI_CCI_CONNECTOR(*cci));
+		} else {
+			worker->port = UCSI_CCI_CONNECTOR(*cci) - 1;
+			worker->ucsi_itepd = ucsi_itepd;
+			worker->cci = *cci;
+
+			INIT_WORK(&worker->work,
+				  ucsi_itepd_connector_change_work);
+			queue_work(ucsi_itepd->ordered_wq, &worker->work);
+		}
+	}
+
+	if ((*cci & UCSI_CCI_COMMAND_COMPLETE) &&
+	    ((*cci & UCSI_CCI_ERROR) == 0)) {
+		switch (UCSI_COMMAND(ucsi_itepd->cmd)) {
+		case UCSI_GET_CONNECTOR_STATUS:
+			ucsi_itepd->connected[ucsi_itepd->cmd_port] =
+				!!(msg_in[2] & BIT(3));
+			ucsi_itepd->orientation[ucsi_itepd->cmd_port] =
+				FIELD_GET(BIT(6), msg_in[10]);
+			break;
+
+		case UCSI_GET_ALTERNATE_MODES:
+			recipient = FIELD_GET(GENMASK_ULL(18, 16),
+					      ucsi_itepd->cmd);
+			if (recipient == UCSI_RECIPIENT_CON) {
+				offset = FIELD_GET(GENMASK_ULL(39, 32),
+						   ucsi_itepd->cmd);
+				if (((struct ucsi_altmode *)msg_in)->svid ==
+				    USB_TYPEC_DP_SID) {
+					ucsi_itepd->dp_idx[ucsi_itepd->cmd_port] =
+						offset;
+				} else if (((struct ucsi_altmode *)
+					    (msg_in + 6))->svid ==
+					   USB_TYPEC_DP_SID) {
+					ucsi_itepd->dp_idx[ucsi_itepd->cmd_port] =
+						offset + 1;
+				}
+			}
+			break;
+		default:
+			break;
+		}
+	}
+}
+
+/*
+ * ITE PD notify callback
+ */
+static u8 ucsi_itepd_get_len(void *priv, u32 cci)
+{
+	if (cci & UCSI_CCI_COMMAND_COMPLETE)
+		return UCSI_CCI_LENGTH(cci);
+	return 0;
+}
+
+static void ucsi_itepd_notify(void *priv, u32 cci, u8 *data)
+{
+	struct ucsi_itepd *ucsi_itepd = (struct ucsi_itepd *)priv;
+	bool comp = false;
+	u8 msg_in[0x28];
+	u8 len = UCSI_CCI_LENGTH(cci);
+
+	memcpy(msg_in, data, min_t(u8, len, ARRAY_SIZE(msg_in)));
+	ucsi_itepd_response_hook(ucsi_itepd, &cci, msg_in);
+
+	mutex_lock(&ucsi_itepd->received_lock);
+	if (cci & UCSI_CCI_COMMAND_COMPLETE) {
+		ucsi_itepd->resp_received = 1;
+		ucsi_itepd->cci = cci;
+		memset(ucsi_itepd->msg_in, 0, ARRAY_SIZE(ucsi_itepd->msg_in));
+		if (len)
+			memcpy(ucsi_itepd->msg_in, msg_in,
+			       min_t(u8, len, ARRAY_SIZE(ucsi_itepd->msg_in)));
+		comp = true;
+	}
+	if (cci & UCSI_CCI_RESET_COMPLETE) {
+		ucsi_itepd->resp_received = 1;
+		ucsi_itepd->cci = cci;
+		memset(ucsi_itepd->msg_in, 0, ARRAY_SIZE(ucsi_itepd->msg_in));
+		comp = true;
+	}
+	mutex_unlock(&ucsi_itepd->received_lock);
+
+	if (cci & UCSI_CCI_ACK_COMPLETE)
+		comp = true;
+
+	if (comp)
+		complete(&ucsi_itepd->complete);
+}
+
+/*
+ * New ucsi_operations implementation
+ */
+
+static int ucsi_itepd_read_version(struct ucsi *ucsi, u16 *version)
+{
+	struct ucsi_itepd *ucsi_itepd = ucsi_get_drvdata(ucsi);
+
+	return itepd_cmd_receive(ucsi_itepd->dev,
+				 ITEPD_RECEIVE_UCSI_VERSION,
+				 version, sizeof(*version));
+}
+
+static int ucsi_itepd_read_cci(struct ucsi *ucsi, u32 *cci)
+{
+	struct ucsi_itepd *ucsi_itepd = ucsi_get_drvdata(ucsi);
+
+	mutex_lock(&ucsi_itepd->received_lock);
+	if (ucsi_itepd->resp_received) {
+		ucsi_itepd->resp_received = 0;
+		*cci = ucsi_itepd->cci;
+	} else {
+		*cci = 0;
+	}
+	mutex_unlock(&ucsi_itepd->received_lock);
+
+	return 0;
+}
+
+/*
+ * poll_cci: called when notifications are temporarily disabled (e.g. during
+ * PPM reset).  For this hardware we can reuse read_cci — the firmware always
+ * pushes CCI updates via the notify callback regardless.
+ */
+static int ucsi_itepd_poll_cci(struct ucsi *ucsi, u32 *cci)
+{
+	return ucsi_itepd_read_cci(ucsi, cci);
+}
+
+static int ucsi_itepd_read_message_in(struct ucsi *ucsi,
+				      void *val, size_t val_len)
+{
+	struct ucsi_itepd *ucsi_itepd = ucsi_get_drvdata(ucsi);
+
+	mutex_lock(&ucsi_itepd->received_lock);
+	memcpy(val, ucsi_itepd->msg_in,
+	       min(val_len, ARRAY_SIZE(ucsi_itepd->msg_in)));
+	mutex_unlock(&ucsi_itepd->received_lock);
+
+	return 0;
+}
+
+/*
+ * async_control: fire a command to the PPM and return immediately.
+ * The old async_write(UCSI_CONTROL, …) path, now receiving the raw
+ * u64 command directly.
+ */
+static int ucsi_itepd_async_control(struct ucsi *ucsi, u64 command)
+{
+	struct ucsi_itepd *ucsi_itepd = ucsi_get_drvdata(ucsi);
+
+	ucsi_itepd_command_hook(ucsi_itepd, &command);
+
+	mutex_lock(&ucsi_itepd->received_lock);
+	ucsi_itepd->resp_received = 0;
+	mutex_unlock(&ucsi_itepd->received_lock);
+
+	return itepd_cmd_send(ucsi_itepd->dev,
+			      ITEPD_SEND_UCSI_CONTROL,
+			      &command, sizeof(command));
+}
+
+/*
+ * sync_control: blocking command — send and wait for completion.
+ * On success the caller gets cci and data filled in.
+ */
+static int ucsi_itepd_sync_control(struct ucsi *ucsi, u64 command,
+				   u32 *cci, void *data, size_t size)
+{
+	struct ucsi_itepd *ucsi_itepd = ucsi_get_drvdata(ucsi);
+	int ret;
+
+	reinit_completion(&ucsi_itepd->complete);
+
+	ret = ucsi_itepd_async_control(ucsi, command);
+	if (ret)
+		return ret;
+
+	if (!wait_for_completion_timeout(&ucsi_itepd->complete,
+					 msecs_to_jiffies(5000)))
+		return -ETIMEDOUT;
+
+	/* Hand back CCI and (optionally) message data to the core */
+	if (cci) {
+		mutex_lock(&ucsi_itepd->received_lock);
+		*cci = ucsi_itepd->cci;
+		mutex_unlock(&ucsi_itepd->received_lock);
+	}
+	if (data && size)
+		ucsi_itepd_read_message_in(ucsi, data, size);
+
+	return 0;
+}
+
+static bool ucsi_itepd_update_altmodes(struct ucsi *ucsi, u8 recipient,
+				       struct ucsi_altmode *orig, struct ucsi_altmode *updated)
+{
+	/* No altmode squashing needed for this hardware */
+	return false;
+}
+
+static void ucsi_itepd_update_connector(struct ucsi_connector *con)
+{
+	if (con->num > ITEPD_MAX_PORTS || con->num < 1)
+		return;
+
+	con->typec_cap.orientation_aware = true;
+}
+
+static void ucsi_itepd_connector_status(struct ucsi_connector *con)
+{
+	struct ucsi_itepd *ucsi_itepd = ucsi_get_drvdata(con->ucsi);
+
+	if (con->num > ITEPD_MAX_PORTS || con->num < 1)
+		return;
+
+	if (ucsi_itepd->connected[con->num - 1])
+		typec_set_orientation(con->port,
+				      ucsi_itepd->orientation[con->num - 1] ?
+				      TYPEC_ORIENTATION_REVERSE :
+				      TYPEC_ORIENTATION_NORMAL);
+	else
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
+
+	/*
+	 * Pass the ucsi_connector (which now holds the cached bitmap status)
+	 * rather than the old struct ucsi_connector_status pointer.
+	 */
+	ucsi_itepd_connector_partner_change(ucsi_itepd, con->num - 1, con);
+
+	ucsi_itepd->con_change_processed[con->num - 1] = false;
+}
+
+static const struct ucsi_operations ucsi_itepd_ops = {
+	.read_version		= ucsi_itepd_read_version,
+	.read_cci		    = ucsi_itepd_read_cci,
+	.poll_cci		    = ucsi_itepd_poll_cci,
+	.read_message_in	= ucsi_itepd_read_message_in,
+	.sync_control		= ucsi_itepd_sync_control,
+	.async_control		= ucsi_itepd_async_control,
+	.update_altmodes	= ucsi_itepd_update_altmodes,
+	.update_connector	= ucsi_itepd_update_connector,
+	.connector_status	= ucsi_itepd_connector_status,
+};
+
+static int ucsi_itepd_probe(struct auxiliary_device *adev,
+			    const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct ucsi_itepd *ucsi_itepd;
+	struct itepd_ucsi_cb *ucsi_itepd_cb;
+	int ret;
+
+	ucsi_itepd = devm_kzalloc(dev, sizeof(*ucsi_itepd), GFP_KERNEL);
+	if (!ucsi_itepd)
+		return -ENOMEM;
+
+	ucsi_itepd_cb = devm_kzalloc(dev, sizeof(*ucsi_itepd_cb), GFP_KERNEL);
+	if (!ucsi_itepd_cb)
+		return -ENOMEM;
+
+	ucsi_itepd->dev = dev;
+	init_completion(&ucsi_itepd->complete);
+	mutex_init(&ucsi_itepd->received_lock);
+
+	ucsi_itepd->ordered_wq = alloc_ordered_workqueue("fifo_wq", 0);
+	if (!ucsi_itepd->ordered_wq)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, ucsi_itepd);
+	__ucsi_itepd = ucsi_itepd;
+
+	ucsi_itepd_cb->get_len = ucsi_itepd_get_len;
+	ucsi_itepd_cb->notify  = ucsi_itepd_notify;
+	ucsi_itepd_cb->priv    = ucsi_itepd;
+
+	ret = itepd_register_cb(dev, ITEPD_CLIENT_UCSI, ucsi_itepd_cb);
+	if (ret)
+		goto out_destroy_wq;
+
+	ucsi_itepd->ucsi = ucsi_create(dev, &ucsi_itepd_ops);
+	if (IS_ERR(ucsi_itepd->ucsi)) {
+		ret = PTR_ERR(ucsi_itepd->ucsi);
+		goto out_unregister_cb;
+	}
+
+	ucsi_set_drvdata(ucsi_itepd->ucsi, ucsi_itepd);
+
+	ret = ucsi_register(ucsi_itepd->ucsi);
+	if (ret)
+		goto out_ucsi_destroy;
+
+	return 0;
+
+out_ucsi_destroy:
+	ucsi_destroy(ucsi_itepd->ucsi);
+out_unregister_cb:
+	itepd_register_cb(dev, ITEPD_CLIENT_UCSI, NULL);
+out_destroy_wq:
+	destroy_workqueue(ucsi_itepd->ordered_wq);
+
+	return ret;
+}
+
+static void ucsi_itepd_remove(struct auxiliary_device *adev)
+{
+	struct ucsi_itepd *ucsi_itepd = dev_get_drvdata(&adev->dev);
+
+	if (ucsi_itepd->ordered_wq) {
+		flush_workqueue(ucsi_itepd->ordered_wq);
+		destroy_workqueue(ucsi_itepd->ordered_wq);
+	}
+
+	ucsi_unregister(ucsi_itepd->ucsi);
+	ucsi_destroy(ucsi_itepd->ucsi);
+	usleep_range(2000, 2500);
+	itepd_register_cb(&adev->dev, ITEPD_CLIENT_UCSI, NULL);
+}
+
+static const struct auxiliary_device_id ucsi_itepd_id_table[] = {
+	{ .name = "itepd.ucsi", },
+	{},
+};
+MODULE_DEVICE_TABLE(auxiliary, ucsi_itepd_id_table);
+
+static struct auxiliary_driver ucsi_itepd_driver = {
+	.name     = "ucsi_itepd",
+	.probe    = ucsi_itepd_probe,
+	.remove   = ucsi_itepd_remove,
+	.id_table = ucsi_itepd_id_table,
+};
+
+module_auxiliary_driver(ucsi_itepd_driver);
+
+MODULE_AUTHOR("Jeson Yang <jeson.yang@ite.com.tw>");
+MODULE_DESCRIPTION("UCSI driver for ITE Type-C PD controller");
+MODULE_LICENSE("GPL");

-- 
2.53.0

