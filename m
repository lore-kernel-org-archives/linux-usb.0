Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9C391517;
	Wed, 12 Aug 2026 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526693; cv=none; b=cBU87TrCs+l+MFlf/vD3hiQ3e02KhjjBQ45hl6wv2RaYao3u/QGMm48gz1BzlK9/qyIRz9rLAqleQn3+3WoYyLrzMamP03ATwcELJ0gAn4Y9IiYJoTLMjYQ0yAh7+gxPF3ZFeYXjEVFdnQntcDPw13qUCQU1r4BEzwDLGV1Ihfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526693; c=relaxed/simple;
	bh=9SaYXoqcKYgMEg6HJf+RyLGkBe17l+Ofku85szlkrFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZnbQiXjDQEBgNkZ68iefqxnrANvDLDCQQ5CGE53T9ixOl4AKiI9pIks7V3PZdfYVyiffNvdY4W/szA/WQA8WInXOBjg8PA8MzenS5lg4nd8zKTw5XueCqA7dLJmsKiYwJx5sBa45bkkUcQDh+4rvAcbi1j0RqlZADZG+GMruenM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZqgcfmG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZqgcfmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786526691; x=1818062691;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9SaYXoqcKYgMEg6HJf+RyLGkBe17l+Ofku85szlkrFo=;
  b=mZqgcfmGSOz/9IeUmWtJfFsqwobU1YCkVxbs2TifHFDRQewL4L9gcpxS
   X2UiiYmmEHFAXfiW9acdysq/NLJzSd31pbGq+6xPbFINVrT6dxy6Hp+Rx
   C0s5rxc8kB0L0REvl2XL+CZRG5GdjU55lQs2EAWssSQSc1MW3mEbmyDEh
   HPlnABpT93Od1pzzSVU6zg/01e7r8klzJRrBRxtXFlN+HtRPjH9zXRha8
   7ieAX+5u701Y8Jnsn9SzPNkzMRkC5VbPCw4tbqLcE9U+GxKR1jJKd/ZEZ
   jSCFLcWP6btIx10OXc1QLo2UXtdsV4J/QaHhrJSMzzIuNcc9G7x3dkqgo
   A==;
X-CSE-ConnectionGUID: pD/I0JSTRnGYuS5cBAXTJg==
X-CSE-MsgGUID: X0N3p9QyQCC8IpSRybDiOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98433931"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98433931"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 02:24:49 -0700
X-CSE-ConnectionGUID: IgcaMK2WQZq2V0Qqp84ECQ==
X-CSE-MsgGUID: zgt+6bkcSRqYob5dM+oe4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="263635265"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 12 Aug 2026 02:24:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9D9F699; Wed, 12 Aug 2026 11:24:44 +0200 (CEST)
Date: Wed, 12 Aug 2026 11:24:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amber Kao <amber.kao@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bling Chiang <Bling.Chiang@ite.com.tw>,
	Eric Su <Eric.Su@ite.com.tw>, Doreen Lin <doreen.lin@ite.com.tw>
Subject: Re: [PATCH v7 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD
 controller driver
Message-ID: <anw73Ps2KgcwP4iZ@black.igk.intel.com>
References: <20260807-ucsi-itepd-v7-0-998ac11ed0ef@ite.com.tw>
 <20260807-ucsi-itepd-v7-2-998ac11ed0ef@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-ucsi-itepd-v7-2-998ac11ed0ef@ite.com.tw>

On Fri, Aug 07, 2026 at 06:17:46PM +0800, Amber Kao wrote:
> Add a UCSI driver for the ITE IT8851 and IT8853 I2C-based USB Type-C
> Power Delivery controllers.
> The controller signals UCSI through a shared interrupt line; events are
> read and acknowledged via vendor-specific registers, and
> UCSI events are forwarded to the UCSI core.
> 
> Add the driver file to the MAINTAINERS entry.
> 
> Cc: Yaode Fang <Yaode.Fang@ite.com.tw>
> Cc: Jeson Yang <jeson.yang@ite.com.tw>
> Cc: Bling Chiang <Bling.Chiang@ite.com.tw>
> Cc: Eric Su <Eric.Su@ite.com.tw>
> Cc: Doreen Lin <doreen.lin@ite.com.tw>
> Signed-off-by: Amber Kao <amber.kao@ite.com.tw>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  MAINTAINERS                         |   1 +
>  drivers/usb/typec/ucsi/Kconfig      |  10 +
>  drivers/usb/typec/ucsi/Makefile     |   1 +
>  drivers/usb/typec/ucsi/ucsi_itepd.c | 356 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 368 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec0eeea79b9e..1e76e299e6c3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13727,6 +13727,7 @@ R:	Yaode Fang <Yaode.Fang@ite.com.tw>
>  L:	linux-usb@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/usb/ite,it8851.yaml
> +F:	drivers/usb/typec/ucsi/ucsi_itepd.c
>  
>  IVTV VIDEO4LINUX DRIVER
>  M:	Andy Walls <awalls@md.metrocast.net>
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index 87dd992a4b9e..0f10dac9b34b 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -104,4 +104,14 @@ config UCSI_HUAWEI_GAOKUN
>  	  To compile the driver as a module, choose M here: the module will be
>  	  called ucsi_huawei_gaokun.
>  
> +config UCSI_ITEPD
> +	tristate "UCSI Interface Driver for ITE IT8851/IT8853"
> +	depends on I2C
> +	help
> +	  This driver enables UCSI support on platforms that expose an
> +	  ITE IT8851/IT8853 Type-C Power Delivery controller over an I2C interface.
> +
> +	  To compile the driver as a module, choose M here: the module
> +	  will be called ucsi_itepd.
> +
>  endif
> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> index c7e38bf01350..0903a1fd486b 100644
> --- a/drivers/usb/typec/ucsi/Makefile
> +++ b/drivers/usb/typec/ucsi/Makefile
> @@ -28,3 +28,4 @@ obj-$(CONFIG_UCSI_PMIC_GLINK)		+= ucsi_glink.o
>  obj-$(CONFIG_CROS_EC_UCSI)		+= cros_ec_ucsi.o
>  obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)	+= ucsi_yoga_c630.o
>  obj-$(CONFIG_UCSI_HUAWEI_GAOKUN)	+= ucsi_huawei_gaokun.o
> +obj-$(CONFIG_UCSI_ITEPD)		+= ucsi_itepd.o
> diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi/ucsi_itepd.c
> new file mode 100644
> index 000000000000..d1887435a2e1
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
> @@ -0,0 +1,356 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025-2026, ITE. All Rights Reserved
> + *
> + */
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/unaligned.h>
> +
> +#include "ucsi.h"
> +
> +#define ITEPD_UCSI_VERSION_REG	0x80
> +#define ITEPD_UCSI_CCI_REG	0x84
> +#define ITEPD_UCSI_MSG_IN_REG	0x88
> +#define ITEPD_UCSI_CONTROL_REG	0x98
> +
> +#define ITEPD_VENDOR_WC_INT	0xbc
> +#define ITEPD_VENDOR_INT	0xbd
> +#define ITEPD_ALERT_VDM_EVENT	BIT(0)
> +#define ITEPD_ALERT_UCSI_EVENT	BIT(1)
> +
> +#define ITEPD_MSG_IN_MAX_LEN	0x28
> +
> +#define ITEPD_EVENT_NONE	0
> +#define ITEPD_EVENT_UCSI	1
> +#define ITEPD_EVENT_VDM		2
> +
> +struct itepd {
> +	struct i2c_client *client;
> +	struct ucsi *ucsi;
> +	struct mutex i2c_lock;		/* Serializes I2C accesses */
> +	struct mutex event_lock;	/* Serializes event processing (IRQ vs poll) */
> +	struct mutex received_lock;	/* Protects cci and msg_in */
> +	u8 msg_in[ITEPD_MSG_IN_MAX_LEN];
> +	u32 cci;
> +};
> +
> +static u8 ucsi_itepd_get_len(u32 cci)
> +{
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE)
> +		return UCSI_CCI_LENGTH(cci);
> +	return 0;
> +}
> +
> +static int itepd_read_reg(struct itepd *itepd, u8 reg, void *data, u32 len)
> +{
> +	struct i2c_client *client = itepd->client;
> +	struct i2c_msg msg[2] = {
> +		{
> +			.addr	= client->addr,
> +			.flags	= 0,
> +			.len	= 1,
> +			.buf	= &reg,
> +		},
> +		{
> +			.addr	= client->addr,
> +			.flags	= I2C_M_RD,
> +			.len	= len,
> +			.buf	= data,
> +		}
> +
> +	};
> +	int ret;
> +
> +	mutex_lock(&itepd->i2c_lock);
> +	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	mutex_unlock(&itepd->i2c_lock);
> +	if (ret < 0) {
> +		dev_err_ratelimited(&client->dev, "reg 0x%02x read failed: %d\n",
> +				    reg, ret);
> +		return ret;
> +	}
> +
> +	return ret == ARRAY_SIZE(msg) ? 0 : -EIO;
> +}
> +
> +static int itepd_write_reg(struct itepd *itepd, u8 reg, const void *data, u32 len)
> +{
> +	struct i2c_client *client = itepd->client;
> +	u8 buf[sizeof(u64) + 1];
> +	struct i2c_msg msg[1] = {
> +		{
> +			.addr	= client->addr,
> +			.flags	= 0,
> +			.len	= len + 1,
> +			.buf	= buf,
> +		}
> +	};
> +	int ret;
> +
> +	if (len > sizeof(buf) - 1)
> +		return -EINVAL;
> +
> +	buf[0] = reg;
> +	memcpy(&buf[1], data, len);
> +
> +	mutex_lock(&itepd->i2c_lock);
> +	ret = i2c_transfer(client->adapter, msg, 1);
> +	mutex_unlock(&itepd->i2c_lock);
> +	if (ret < 0) {
> +		dev_err_ratelimited(&client->dev, "reg 0x%02x write failed: %d\n",
> +				    reg, ret);
> +		return ret;
> +	}
> +
> +	return ret == 1 ? 0 : -EIO;
> +}
> +
> +static int itepd_process_event(struct itepd *itepd, u32 *cci)
> +{
> +	u8 msg_in[ITEPD_MSG_IN_MAX_LEN] = {};
> +	__le32 le_cci;
> +	u8 event, ack;
> +	u8 len = 0;
> +	int err = 0;
> +	int ret;
> +
> +	guard(mutex)(&itepd->event_lock);
> +
> +	ret = itepd_read_reg(itepd, ITEPD_VENDOR_INT, &event, sizeof(event));
> +	if (ret)
> +		return ret;
> +
> +	event &= ITEPD_ALERT_VDM_EVENT | ITEPD_ALERT_UCSI_EVENT;
> +	if (!event) {
> +		mutex_lock(&itepd->received_lock);
> +		*cci = itepd->cci;
> +		mutex_unlock(&itepd->received_lock);
> +		return ITEPD_EVENT_NONE;
> +	}
> +
> +	if (event & ITEPD_ALERT_UCSI_EVENT) {
> +		err = itepd_read_reg(itepd, ITEPD_UCSI_CCI_REG, &le_cci,
> +				     sizeof(le_cci));
> +		if (!err) {
> +			*cci = le32_to_cpu(le_cci);
> +			len = min_t(u8, ucsi_itepd_get_len(*cci),
> +				    sizeof(msg_in));
> +			if (len)
> +				err = itepd_read_reg(itepd,
> +						     ITEPD_UCSI_MSG_IN_REG,
> +						     msg_in, len);
> +		}
> +	}
> +
> +	ack = event;
> +	ret = itepd_write_reg(itepd, ITEPD_VENDOR_WC_INT, &ack, sizeof(ack));
> +	if (ret)
> +		return ret;
> +
> +	if (err)
> +		return err;
> +
> +	if (event & ITEPD_ALERT_UCSI_EVENT) {
> +		mutex_lock(&itepd->received_lock);
> +		itepd->cci = *cci;
> +		memset(itepd->msg_in, 0, sizeof(itepd->msg_in));
> +		memcpy(itepd->msg_in, msg_in, len);
> +		mutex_unlock(&itepd->received_lock);
> +		return ITEPD_EVENT_UCSI;
> +	}
> +
> +	mutex_lock(&itepd->received_lock);
> +	*cci = itepd->cci;
> +	mutex_unlock(&itepd->received_lock);
> +
> +	return ITEPD_EVENT_VDM;
> +}
> +
> +static int ucsi_itepd_read_version(struct ucsi *ucsi, u16 *version)
> +{
> +	struct itepd *itepd = ucsi_get_drvdata(ucsi);
> +	__le16 le_version;
> +	int ret;
> +
> +	ret = itepd_read_reg(itepd, ITEPD_UCSI_VERSION_REG, &le_version,
> +			     sizeof(le_version));
> +	if (ret)
> +		return ret;
> +
> +	*version = le16_to_cpu(le_version);
> +
> +	return 0;
> +}
> +
> +static int ucsi_itepd_read_cci(struct ucsi *ucsi, u32 *cci)
> +{
> +	struct itepd *itepd = ucsi_get_drvdata(ucsi);
> +
> +	guard(mutex)(&itepd->received_lock);
> +	*cci = itepd->cci;
> +
> +	return 0;
> +}
> +
> +static int ucsi_itepd_poll_cci(struct ucsi *ucsi, u32 *cci)
> +{
> +	struct itepd *itepd = ucsi_get_drvdata(ucsi);
> +	int ret;
> +
> +	ret = itepd_process_event(itepd, cci);
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int ucsi_itepd_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
> +{
> +	struct itepd *itepd = ucsi_get_drvdata(ucsi);
> +
> +	guard(mutex)(&itepd->received_lock);
> +	memcpy(val, itepd->msg_in, min(val_len, sizeof(itepd->msg_in)));
> +
> +	return 0;
> +}
> +
> +static int ucsi_itepd_async_control(struct ucsi *ucsi, u64 command)
> +{
> +	struct itepd *itepd = ucsi_get_drvdata(ucsi);
> +	__le64 le_cmd = cpu_to_le64(command);
> +
> +	if (UCSI_COMMAND(command) == UCSI_PPM_RESET) {
> +		mutex_lock(&itepd->received_lock);
> +		itepd->cci = 0;
> +		mutex_unlock(&itepd->received_lock);
> +	}
> +
> +	return itepd_write_reg(itepd, ITEPD_UCSI_CONTROL_REG, &le_cmd,
> +			       sizeof(le_cmd));
> +}
> +
> +static const struct ucsi_operations ucsi_itepd_ops = {
> +	.read_version		= ucsi_itepd_read_version,
> +	.read_cci		= ucsi_itepd_read_cci,
> +	.poll_cci		= ucsi_itepd_poll_cci,
> +	.read_message_in	= ucsi_itepd_read_message_in,
> +	.sync_control		= ucsi_sync_control_common,
> +	.async_control		= ucsi_itepd_async_control,
> +};
> +
> +static irqreturn_t itepd_irq_process(struct itepd *itepd)
> +{
> +	u32 cci;
> +	int ret;
> +
> +	ret = itepd_process_event(itepd, &cci);
> +	if (ret == ITEPD_EVENT_NONE)
> +		return IRQ_NONE;
> +
> +	if (ret < 0)
> +		return IRQ_HANDLED;
> +
> +	if (ret == ITEPD_EVENT_UCSI)
> +		ucsi_notify_common(itepd->ucsi, cci);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t itepd_irq_thread_fn(int irq, void *data)
> +{
> +	struct itepd *itepd = data;
> +
> +	return itepd_irq_process(itepd);
> +}
> +
> +static int itepd_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct itepd *itepd;
> +	u32 cci;
> +	int ret;
> +
> +	if (client->irq <= 0)
> +		return dev_err_probe(dev, -ENODEV, "no IRQ provided\n");
> +
> +	itepd = devm_kzalloc(dev, sizeof(*itepd), GFP_KERNEL);
> +	if (!itepd)
> +		return -ENOMEM;
> +
> +	itepd->client = client;
> +	mutex_init(&itepd->i2c_lock);
> +	mutex_init(&itepd->event_lock);
> +	mutex_init(&itepd->received_lock);
> +	i2c_set_clientdata(client, itepd);
> +
> +	itepd->ucsi = ucsi_create(dev, &ucsi_itepd_ops);
> +	if (IS_ERR(itepd->ucsi))
> +		return dev_err_probe(dev, PTR_ERR(itepd->ucsi),
> +				     "ucsi_create failed\n");
> +
> +	ucsi_set_drvdata(itepd->ucsi, itepd);
> +
> +	ret = request_threaded_irq(client->irq, NULL, itepd_irq_thread_fn,
> +				   IRQF_ONESHOT, dev_name(dev), itepd);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "request_threaded_irq failed\n");
> +		goto out_ucsi_destroy;
> +	}
> +
> +	ret = itepd_process_event(itepd, &cci);
> +	if (ret < 0)
> +		dev_warn(dev, "initial event processing failed: %d\n", ret);
> +
> +	ret = ucsi_register(itepd->ucsi);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to register UCSI\n");
> +		goto out_free_irq;
> +	}
> +
> +	return 0;
> +
> +out_free_irq:
> +	free_irq(client->irq, itepd);
> +out_ucsi_destroy:
> +	ucsi_destroy(itepd->ucsi);
> +	return ret;
> +}
> +
> +static void itepd_remove(struct i2c_client *client)
> +{
> +	struct itepd *itepd = i2c_get_clientdata(client);
> +
> +	ucsi_unregister(itepd->ucsi);
> +	free_irq(client->irq, itepd);
> +	ucsi_destroy(itepd->ucsi);
> +}
> +
> +static const struct of_device_id itepd_of_match_table[] = {
> +	{ .compatible = "ite,it8851" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, itepd_of_match_table);
> +
> +static const struct i2c_device_id itepd_id_table[] = {
> +	{ "ucsi_itepd", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, itepd_id_table);
> +
> +static struct i2c_driver itepd_driver = {
> +	.driver = {
> +		.name = "ucsi_itepd",
> +		.of_match_table = itepd_of_match_table,
> +	},
> +	.probe = itepd_probe,
> +	.remove = itepd_remove,
> +	.id_table = itepd_id_table,
> +};
> +module_i2c_driver(itepd_driver);
> +
> +MODULE_AUTHOR("Jeson Yang <jeson.yang@ite.com.tw>");
> +MODULE_DESCRIPTION("UCSI driver for ITE IT8851 and IT8853 Type-C PD controllers");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.53.0

-- 
heikki
