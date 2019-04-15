Return-Path: <SRS0=TXFt=SR=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C1CC282CE
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 02:24:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D9C320848
	for <linux-usb@archiver.kernel.org>; Mon, 15 Apr 2019 02:24:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfDOCYG (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 14 Apr 2019 22:24:06 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:9848 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725789AbfDOCYF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Apr 2019 22:24:05 -0400
X-UUID: 540df32760c9495cb2ea24fee074a7d6-20190415
X-UUID: 540df32760c9495cb2ea24fee074a7d6-20190415
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1841856273; Mon, 15 Apr 2019 10:23:58 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 15 Apr
 2019 10:23:56 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 15 Apr 2019 10:23:56 +0800
Message-ID: <1555295036.10179.192.camel@mhfsdcap03>
Subject: Re: [PATCH V3 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C
 DRP port controller
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Biju Das <biju.das@bp.renesas.com>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        "Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Date:   Mon, 15 Apr 2019 10:23:56 +0800
In-Reply-To: <1555064179-15626-4-git-send-email-biju.das@bp.renesas.com>
References: <1555064179-15626-1-git-send-email-biju.das@bp.renesas.com>
         <1555064179-15626-4-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190415022356.l8gJ1v5VuBNPvtSXhk_zD5xmidca-BTkh0Gvgi0zOU4@z>

Hi,
On Fri, 2019-04-12 at 11:16 +0100, Biju Das wrote:
> Driver for TI HD3SS3220 USB Type-C DRP port controller.
> 
> The driver currently registers the port and supports data role swapping.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Note: This patch has compilation dependency on 
>  https://patchwork.kernel.org/patch/10882555/
>  
>  V2-->V3
>    * Used the new api "usb_role_switch by node" for getting
>      remote endpoint associated with Type-C USB DRP port
>      controller devices.
>  V1-->V2
>    * Driver uses usb role class instead of extcon for dual role switch
>      and also handles connect/disconnect events.
> ---
>  drivers/usb/typec/Kconfig     |  10 ++
>  drivers/usb/typec/Makefile    |   1 +
>  drivers/usb/typec/hd3ss3220.c | 278 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 289 insertions(+)
>  create mode 100644 drivers/usb/typec/hd3ss3220.c
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index 89d9193..92a3717 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -50,6 +50,16 @@ source "drivers/usb/typec/tcpm/Kconfig"
>  
>  source "drivers/usb/typec/ucsi/Kconfig"
>  
> +config TYPEC_HD3SS3220
> +	tristate "TI HD3SS3220 Type-C DRP Port controller driver"
> +	depends on I2C
> +	help
> +	  Say Y or M here if your system has TI HD3SS3220 Type-C DRP Port
> +	  controller driver.
> +
> +	  If you choose to build this driver as a dynamically linked module, the
> +	  module will be called hd3ss3220.ko.
> +
>  config TYPEC_TPS6598X
>  	tristate "TI TPS6598x USB Power Delivery controller driver"
>  	depends on I2C
> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> index 6696b72..7753a5c3 100644
> --- a/drivers/usb/typec/Makefile
> +++ b/drivers/usb/typec/Makefile
> @@ -4,5 +4,6 @@ typec-y				:= class.o mux.o bus.o
>  obj-$(CONFIG_TYPEC)		+= altmodes/
>  obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
>  obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
> +obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
>  obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
>  obj-$(CONFIG_TYPEC)		+= mux/
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> new file mode 100644
> index 0000000..b5cb42c
> --- /dev/null
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * TI HD3SS3220 Type-C DRP Port Controller Driver
> + *
> + * Copyright (C) 2019 Renesas Electronics Corp.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/usb/role.h>
> +#include <linux/irqreturn.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/usb/typec.h>
> +#include <linux/delay.h>
> +
> +#define HD3SS3220_REG_CN_STAT_CTRL	0x09
> +#define HD3SS3220_REG_GEN_CTRL		0x0A
> +#define HD3SS3220_REG_DEV_REV		0xA0
> +
> +/* Register HD3SS3220_REG_CN_STAT_CTRL*/
> +#define HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK	(BIT(7) | BIT(6))
> +#define HD3SS3220_REG_CN_STAT_CTRL_AS_DFP		BIT(6)
> +#define HD3SS3220_REG_CN_STAT_CTRL_AS_UFP		BIT(7)
> +#define HD3SS3220_REG_CN_STAT_CTRL_TO_ACCESSORY		(BIT(7) | BIT(6))
> +#define HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS		BIT(4)
> +
> +/* Register HD3SS3220_REG_GEN_CTRL*/
> +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK		(BIT(2) | BIT(1))
> +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT	0x00
> +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK	BIT(1)
> +#define HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC	(BIT(2) | BIT(1))
> +
> +struct hd3ss3220 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct usb_role_switch	*role_sw;
> +	struct typec_port *port;
> +	struct typec_capability typec_cap;
> +};
> +
> +static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int src_pref)
> +{
> +	unsigned int reg_val;
> +	int ret;
> +
> +	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_GEN_CTRL, &reg_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg_val &= ~HD3SS3220_REG_GEN_CTRL_SRC_PREF_MASK;
> +	reg_val |= src_pref;
> +
> +	return regmap_write(hd3ss3220->regmap, HD3SS3220_REG_GEN_CTRL, reg_val);
use regmap_update_bits()?
> +}
> +
> +static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
> +{
> +	unsigned int reg_val;
> +	enum usb_role attached_state;
> +	int ret;
> +
> +	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
> +			  &reg_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (reg_val & HD3SS3220_REG_CN_STAT_CTRL_ATTACHED_STATE_MASK) {
> +	case HD3SS3220_REG_CN_STAT_CTRL_AS_DFP:
> +		attached_state = USB_ROLE_HOST;
> +	break;
> +	case HD3SS3220_REG_CN_STAT_CTRL_AS_UFP:
> +		attached_state = USB_ROLE_DEVICE;
> +	break;
> +	default:
> +		attached_state = USB_ROLE_NONE;
> +	}
> +
> +	return attached_state;
> +}
> +
> +static int hd3ss3220_dr_set(const struct typec_capability *cap,
> +			    enum typec_data_role role)
> +{
> +	struct hd3ss3220 *hd3ss3220 = container_of(cap, struct hd3ss3220,
> +						   typec_cap);
> +	enum usb_role role_val;
> +	int pref, ret = 0;
> +
> +	if (role == TYPEC_HOST) {
> +		role_val = USB_ROLE_HOST;
> +		pref = HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SRC;
> +	} else {
> +		role_val = USB_ROLE_DEVICE;
> +		pref = HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_TRY_SNK;
> +	}
> +
> +	ret = hd3ss3220_set_source_pref(hd3ss3220, pref);
> +	usleep_range(10, 100);
> +
> +	usb_role_switch_set_role(hd3ss3220->role_sw, role_val);
> +	typec_set_data_role(hd3ss3220->port, role);
> +
> +	return ret;
> +}
> +
> +static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
> +{
> +	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
> +
> +	usb_role_switch_set_role(hd3ss3220->role_sw, role_state);
> +	if (role_state == USB_ROLE_NONE)
> +		hd3ss3220_set_source_pref(hd3ss3220,
> +				HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
> +
> +	switch (role_state) {
> +	case USB_ROLE_HOST:
> +		typec_set_data_role(hd3ss3220->port, TYPEC_HOST);
> +		break;
> +	case USB_ROLE_DEVICE:
> +		typec_set_data_role(hd3ss3220->port, TYPEC_DEVICE);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +irqreturn_t hd3ss3220_irq(struct hd3ss3220 *hd3ss3220)
> +{
> +	int err;
> +	unsigned int data;
> +
> +	hd3ss3220_set_role(hd3ss3220);
> +
> +	err = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
> +	if (err < 0)
> +		return IRQ_NONE;
> +
> +	err = regmap_write(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
> +			   data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
> +	if (err < 0)
> +		return IRQ_NONE;
use regmap_xxx_bits() if possible?
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t hd3ss3220_irq_handler(int irq, void *data)
> +{
> +	struct i2c_client *client = to_i2c_client(data);
> +	struct hd3ss3220 *hd3ss3220 = i2c_get_clientdata(client);
> +
> +	return hd3ss3220_irq(hd3ss3220);
> +}
> +
> +static const struct regmap_config config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0x0A,
> +};
> +
> +static int hd3ss3220_probe(struct i2c_client *client,
> +		const struct i2c_device_id *id)
> +{
> +	struct hd3ss3220 *hd3ss3220;
> +	struct device_node *np;
> +	struct device_node *parent;
> +	struct device_node *child;
> +	int ret;
> +	unsigned int data;
> +
> +	hd3ss3220 = devm_kzalloc(&client->dev, sizeof(struct hd3ss3220),
> +				 GFP_KERNEL);
> +	if (!hd3ss3220)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, hd3ss3220);
> +
> +	hd3ss3220->dev = &client->dev;
> +	hd3ss3220->regmap = devm_regmap_init_i2c(client, &config);
> +	if (IS_ERR(hd3ss3220->regmap))
> +		return PTR_ERR(hd3ss3220->regmap);
> +
> +	hd3ss3220_set_source_pref(hd3ss3220,
> +				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
> +	np = hd3ss3220->dev->of_node;
> +	child = of_graph_get_endpoint_by_regs(np, -1, 0);
> +	parent = of_graph_get_remote_port_parent(child);
> +	hd3ss3220->role_sw = fwnode_usb_role_switch_get(of_fwnode_handle(parent));
> +	if (IS_ERR_OR_NULL(hd3ss3220->role_sw)) {
> +		of_node_put(child);
> +		of_node_put(parent);
> +		return PTR_ERR(hd3ss3220->role_sw);
> +	}
> +
> +	of_node_put(child);
> +	of_node_put(parent);
> +
> +	hd3ss3220->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
> +	hd3ss3220->typec_cap.dr_set = hd3ss3220_dr_set;
> +	hd3ss3220->typec_cap.type = TYPEC_PORT_DRP;
> +	hd3ss3220->typec_cap.data = TYPEC_PORT_DRD;
> +
> +	hd3ss3220->port = typec_register_port(&client->dev,
> +					      &hd3ss3220->typec_cap);
> +	if (IS_ERR(hd3ss3220->port))
> +		return PTR_ERR(hd3ss3220->port);
> +
> +	hd3ss3220_set_role(hd3ss3220);
> +	if (client->irq > 0) {
> +		ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL,
> +				  &data);
> +		if (ret < 0)
> +			goto error;
> +
> +		if (data & HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS) {
> +			ret = regmap_write(hd3ss3220->regmap,
> +				HD3SS3220_REG_CN_STAT_CTRL,
> +				data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
> +			if (ret < 0)
> +				goto error;
> +		}
> +
> +		ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +					hd3ss3220_irq_handler,
> +					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +					"hd3ss3220", &client->dev);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	ret = i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
> +	if (ret < 0)
> +		goto error;
> +
> +	dev_info(&client->dev, "probed revision=0x%x\n", ret);
> +
> +	return 0;
> +error:
> +	typec_unregister_port(hd3ss3220->port);
> +	usb_role_switch_put(hd3ss3220->role_sw);
> +
> +	return ret;
> +}
> +
> +static int hd3ss3220_remove(struct i2c_client *client)
> +{
> +	struct hd3ss3220 *hd3ss3220 = i2c_get_clientdata(client);
> +
> +	typec_unregister_port(hd3ss3220->port);
> +	usb_role_switch_put(hd3ss3220->role_sw);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id dev_ids[] = {
> +	{ .compatible = "ti,hd3ss3220"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, dev_ids);
> +
> +static struct i2c_driver hd3ss3220_driver = {
> +	.driver = {
> +		.name = "hd3ss3220",
> +		.owner = THIS_MODULE,
no need set .owner

> +		.of_match_table = of_match_ptr(dev_ids),
> +	},
> +	.probe = hd3ss3220_probe,
> +	.remove =  hd3ss3220_remove,
> +};
> +
> +module_i2c_driver(hd3ss3220_driver);
> +
> +MODULE_AUTHOR("Biju Das <biju.das@bp.renesas.com>");
> +MODULE_DESCRIPTION("TI HD3SS3220 DRP Port Controller Driver");
> +MODULE_LICENSE("GPL");


