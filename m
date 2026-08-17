Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932444CF37;
	Mon, 17 Aug 2026 16:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983749; cv=fail; b=HeR/xw8lgOMoYwmo2fReALSb2ovh+AxgRe//haLcnLEkxfQ+ckokX4TyiQAm48W1IZpQEV/6x7BOuCy5LDLYx0vIL0ZugrFU0aLQDsEhwkgn2Xu6OfDq/TdmBPFq5f7oQchX2Ncjitwi49NlKPn7Sh+fSKRdyASdkXOJa4+UM6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983749; c=relaxed/simple;
	bh=U+i+hXToPRj0lmrUznKTuh/qJK0UuK/xT+Xp4+dIqbU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=WN8HSND/ifxq9IK+P5exyjLLVNGxn+YktWaoF/TCH9Rp3R5kMQw0Esau0GRjoMVqdta+9iwiR+rgYFaEKEIPPnTu2fXTZO7Qhrk+HeUD1crWiHJoIh269b8CsVYXA/YbsHNTbAJMqVYWcSJkUqqn0b043fgy80bqxJhVTNeM9h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BuzDXSeB; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BuzDXSeB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKx4/z0k9n4qRTNr9KtiUhxcHWkd1ifDnzDkVLnWUyS8L2aGK3zxgz1tEJkEvNBP05Pzxh0zJ4P16VHqGehncqrT4Du0sBTjzRWDu8N/58o5XKggGksQcx2UbMGwY/pWuh/nWJ7MJklf6aXQ7+vNuy5hr226UwvPtmpPwXRtCkZkleMM437AvIVI2sI9wF/Bh9Hgv9nQ0lqx5D7TrGDNChmTqT4yB0Vfq9alwdjUxAiYBi6Nl2uWvWzfuY8RFwAc/SysxLhtsaGxNNrWwUP7xzdRkB3BuZYj4Pnknoe3U46zLxbSoV3DlhvijRuy5WLn5vjJYpiO7ASnEj0nBQe2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mhQKs28iG7Wea4Q25d3O6iKfaqp3+LRiG7HKKMI6O8=;
 b=uS8l2Qr0G29I9QS8S3N28KyeY1LaZH3qp7EPfQzZfjMtgg471wr4XDd3zgImL5XplmWmNL9DrIErMPECMaH2xLsyo0nfo0olGzvLnxrP8Ubr34uS+M8Rnd+I2Kd7MvrzxCxMzFoF1I+9LzWRvPVHQVIyk7QWYxPVXJXNfKdDhmbg1cJY2zxDO4h5oCi/dOSGOiI4nliv1u/WCSzW2dkGymh4abcsoe6N4B198kB3JbUm5PDsm4uWR9TUpvuntbxrN5mzjF0y5pMnXG43XIogZ5DqVdKRR5psFQHSmzojmYuTBPnU3VjXpmeqcpNr0BotgS+G0JsvBMllITOPG9cXiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mhQKs28iG7Wea4Q25d3O6iKfaqp3+LRiG7HKKMI6O8=;
 b=BuzDXSeBVHFjA+MBXnQx9bRB0hs8NDMGKgmP7H8C8SNJOflgp2AmwXGuhDjjFB7GcTig7qwPAy6QTjL7Zm8rkvGLXY39XLlij0W1cIQLpqOc+0clNrJAzwH6KhylrwqYgCMsUGPOy/rmCLgbHhOjlLZynWTK/lm1+yCHYvbYGY7o9TDWUeIG1khEVxJzwO3OKMF/N3CObpOxwFwWhkXSbCn0pt9ClXyv4sUD58STtQN2xq1YbMc8CmTz1nUai4QuyPeMRha6mgpx/2CGPSE8FowPmRpLnTto2TUuJilG8u0UvmD2wx7SIrrBJRtId5xTOTV9AN3JJJ+MgVUpNsx+6w==
Received: from AS9PR06CA0064.eurprd06.prod.outlook.com (2603:10a6:20b:464::34)
 by DB8PR10MB3959.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:149::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 16:22:17 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:464:cafe::16) by AS9PR06CA0064.outlook.office365.com
 (2603:10a6:20b:464::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 16:22:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Mon, 17 Aug 2026 16:22:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 17 Aug
 2026 18:27:14 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 17 Aug
 2026 18:22:15 +0200
Message-ID: <e415f8de-f8dc-460d-80a9-5e1b2b34f8a8@foss.st.com>
Date: Mon, 17 Aug 2026 18:22:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [PATCH v2 2/9] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>
CC: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
	Christian Bruel <christian.bruel@foss.st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, "Rosen
 Penev" <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "Vinod
 Koul" <vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <20260816213849.1044073-3-marex@nabladev.com>
Content-Language: en-US
In-Reply-To: <20260816213849.1044073-3-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E1:EE_|DB8PR10MB3959:EE_
X-MS-Office365-Filtering-Correlation-Id: 7980be34-a6bd-4580-511f-08defc7bb44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099006|6133799003|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	iR+uLEwzSYbwyjPxKeH0smRaIU/IYY6l0glwWz5wdROB1Sf2aLcdXwWZZx+dkre/Mav9yGgpxQd+E4TY500Hu+NmLgMekZVqXsbJ7SH5OmQEy+vFy4ZX2TviBCbTzfVG1x5/XBQ0lcznkhTphLt2+JM3Ya4pE3JFlj3Dwl3jqlJxzC5XNOiYeEDbuZ6f8HGQ6VVG4+zRfD8v1Q6WevufZS7t1AdEwFoF0DsS/8b2uQF9duHK5OMpYCoavtanKfZc4zvv45xaaLmgRKjMRBWJC77DXteZa5TKfHVJMu+FKwKPsg6QDJdhsKuZiLrZeBoDpKmkTOBPQKRaxZKbAYuiai4ds+67+/CEYHzp72ZDOdp2ft6Wi9A0mv3swRrupeeOOWGxIGB8mLxfsuqwzuSxzcYrjkUYenxlGxLi7DtvNnHmKHbM3OiOqQC7pGPPCMc5ctIvydTkpcSeNbimsYdZpdpllz1SwDMN6qeG8TECNR+87U4sQQssPZtLmtF4TGrPJevTjyGDbIbyHJx32A08Aikg2VmMJ04WdzYSSpoCBpqEZjY9Fza16xTccF2YGjhHSzrlwbIYDYxAS3CfBQ7jo76GjjrvvUeGw1eL0D5DyQMIyP/7+xImsJ2b23W5gdw0f82M1bk2GSxF4MsXc5VgrEkQetGAxxxML8kYb7qIjbHAnVIrqhnECS3RXnRCx8FLKaX8eRylMHeL1f3nekmeIw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006)(6133799003)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mcKMa02ZQ2t5TfxRGlFbILcwC3xJ62+SRVCMTaFLZfQduxI6Pm9Eo7UKYev2BBGSYQe96YcfrqsFhZwpI/C4lNjTn3iryaQPOHsH8qCG2v/PfyqdrFGfusNJX2+nlCN8i7f9lxPaw2IdQDN0SXqAUI3/CPL3ovVsKeijNHn2oz5c+t3WX2N82RDbBTt+E+FLX5ObGueg2mcvXT7VtDg6d9MmwxWYrClpcXn5zkGQMrz2qoVkOtRaJqDVIO3ODm4I5H329uj8B2eFLWcMORiazRBuB2eB3u6PvvFet0woeYfoTc8cTjdS/gf3Ml61HU+4GDXd73VC5pchGu71xE9txq98UVM9ZdiSgEfa8oshCuyIm+Zx8CwUPzMSHOxvB42VGvDuKZeTJlUcpU8wPwa3b+rV8tr1WymrWx7W4+WHRsnL+bskN90yU5Q8wUcOVD+L
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 16:22:16.8621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7980be34-a6bd-4580-511f-08defc7bb44e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3959

On 8/16/26 23:37, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.
> 
> Co-developed-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Co-developed-by: Christian Bruel <christian.bruel@foss.st.com>
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: - Fix up Sob/Cdb lines
>     - Operate PHY as a syscon subnode
> ---
>  drivers/phy/st/Kconfig             |  10 +
>  drivers/phy/st/Makefile            |   1 +
>  drivers/phy/st/phy-stm32-usb2phy.c | 361 +++++++++++++++++++++++++++++
>  3 files changed, 372 insertions(+)
>  create mode 100644 drivers/phy/st/phy-stm32-usb2phy.c
> 
> diff --git a/drivers/phy/st/Kconfig b/drivers/phy/st/Kconfig
> index 49206185e5633..2835bb67bca9e 100644
> --- a/drivers/phy/st/Kconfig
> +++ b/drivers/phy/st/Kconfig
> @@ -58,3 +58,13 @@ config PHY_STM32_USBPHYC
>  	  used by an HS USB Host controller, and the second one is shared
>  	  between an HS USB OTG controller and an HS USB Host controller,
>  	  selected by a USB switch.
> +
> +config PHY_STM32_USB2PHY
> +	tristate "STMicroelectronics STM32MP25 USB2.0 PHY Controller driver"
> +	depends on ARCH_STM32 || COMPILE_TEST
> +	depends on COMMON_CLK
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the High-Speed USB 2.0 transceivers that are
> +	  part of the STMicroelectronics STM32MP25 SoCs. The PHY itself is a
> +	  Synopsys FEMTO-PHY.
> diff --git a/drivers/phy/st/Makefile b/drivers/phy/st/Makefile
> index cb80e954ea9f0..4945df5ed78a8 100644
> --- a/drivers/phy/st/Makefile
> +++ b/drivers/phy/st/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
>  obj-$(CONFIG_PHY_STIH407_USB)		+= phy-stih407-usb.o
>  obj-$(CONFIG_PHY_STM32_COMBOPHY)	+= phy-stm32-combophy.o
>  obj-$(CONFIG_PHY_STM32_USBPHYC) 	+= phy-stm32-usbphyc.o
> +obj-$(CONFIG_PHY_STM32_USB2PHY) 	+= phy-stm32-usb2phy.o
> diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-stm32-usb2phy.c
> new file mode 100644
> index 0000000000000..a5cc7b855c61f
> --- /dev/null
> +++ b/drivers/phy/st/phy-stm32-usb2phy.c
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * STMicroelectronics STM32 USB2 PHY Controller driver
> + * Currently Only supported for STM32MP25
> + *
> + * Copyright (C) 2022 STMicroelectronics

Hi Marek,

Could update to 2026 ?

> + * Author(s): Pankaj Dev <pankaj.dev@st.com>.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/usb/role.h>
> +#include <linux/mfd/syscon.h>
> +
> +#define SYSCFG_USB2PHY2CR_USB2PHY2CMN		BIT(2)
> +#define SYSCFG_USB2PHY2CR_VBUSVALID		BIT(4)
> +#define SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL		BIT(5)
> +#define SYSCFG_USB2PHY2CR_VBUSVLDEXT		BIT(6)
> +
> +struct stm32_usb2phy {
> +	struct phy				*phy;
> +	struct regmap				*regmap;
> +	struct device				*dev;
> +	struct reset_control			*rstc;
> +	struct clk				*phyref;
> +	struct regulator			*vdd33;
> +	struct clk_hw				clk48_hw;
> +	const struct stm32mp2_usb2phy_hw_data	*hw_data;
> +	atomic_t				en_refcnt;
> +	enum phy_mode				mode;
> +	u32					cr_offset;
> +	bool					is_init;
> +};
> +
> +struct stm32mp2_usb2phy_hw_data {
> +	u32			phyrefsel_mask;
> +	bool			is_usb2_host_only;
> +};
> +
> +static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
> +{
> +	const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
> +	unsigned long rate;
> +	int refsel, ret;
> +
> +	/* Check if a phy is already init or clk48 in use */
> +	if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
> +		return 0;
> +
> +	rate = clk_get_rate(phy_dev->phyref);
> +	if (rate == 19200000)
> +		refsel = 0;
> +	else if (rate == 20000000)
> +		refsel = 1;
> +	else if (rate == 24000000)
> +		refsel = 2;
> +	else
> +		return -EINVAL;
> +
> +	ret = regmap_update_bits(phy_dev->regmap,
> +				 phy_dev->cr_offset,
> +				 phy_data->phyrefsel_mask,
> +				 field_prep(phy_data->phyrefsel_mask, refsel));
> +	if (ret)
> +		return ret;
> +

Hi Marek,

Below condition

> +	if (phy_data->is_usb2_host_only) {
> +		/*
> +		 * The clock should default to active after standby, as it is
> +		 * needed when resuming OHCI to access its registers.
> +		 * CMN is default reset to 1, so enforce it is cleared, when the
> +		 * clock enable request from OHCI driver comes at resume time.
> +		 */
> +		ret = regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
> +					SYSCFG_USB2PHY2CR_USB2PHY2CMN);
> +		if (ret)
> +			return ret;
> +	}

up to here, is a specific part to manage OHCI controller clock during
suspend modes (either bus suspend, or system-wide platform low power PM).

This should be moved to the clock provider api. E.g. to register a 2nd
clock.

Point here is the bit is always cleared, even if OHCI is
unused/disabled, but EHCI is. EHCI can be enabled w/o OHCI when there's
an on-board USB HUB (in such case only High Speed traffic is expected).

EHCI don't require to clear CMN for suspend states.

> +
> +	ret = regulator_enable(phy_dev->vdd33);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(phy_dev->phyref);
> +	if (ret)
> +		goto error_regdis;
> +
> +	ret = reset_control_deassert(phy_dev->rstc);
> +	if (ret)
> +		goto error_clkdis;
> +
> +	return 0;
> +
> +error_clkdis:
> +	clk_disable_unprepare(phy_dev->phyref);
> +error_regdis:
> +	regulator_disable(phy_dev->vdd33);
> +
> +	return ret;
> +}
> +
> +static int stm32_usb2phy_disable(struct stm32_usb2phy *phy_dev)
> +{
> +	int ret;
> +
> +	/* Check if a phy is still init or clk48 in use */
> +	if (atomic_dec_return(&phy_dev->en_refcnt) > 0)
> +		return 0;
> +
> +	ret = reset_control_assert(phy_dev->rstc);
> +	if (ret)
> +		return ret;
> +
> +	clk_disable_unprepare(phy_dev->phyref);
> +
> +	return regulator_disable(phy_dev->vdd33);
> +}
> +
> +static int stm32_usb2phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
> +	const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
> +	u32 val, mask = SYSCFG_USB2PHY2CR_USB2PHY2CMN;
> +	int ret;

Then could simplify here directly for host only PHY : there's no point
in poking control register here.
(As mentioned above, control SYSCFG_USB2PHY2CR_USB2PHY2CMN with clock
provider API for host-only configuration.)

	if (phy_data->is_usb2_host_only)
		return 0;

> +
> +	if (mode == PHY_MODE_USB_HOST) {
> +		val = 0;
> +		if (!phy_data->is_usb2_host_only) {
> +			mask |= SYSCFG_USB2PHY2CR_VBUSVLDEXT |
> +				SYSCFG_USB2PHY2CR_VBUSVALID;
> +			if (submode != USB_ROLE_NONE)
> +				val |= SYSCFG_USB2PHY2CR_VBUSVALID;
> +		}
> +	} else if (mode == PHY_MODE_USB_DEVICE) {
> +		val = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
> +		      SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
> +		mask |= SYSCFG_USB2PHY2CR_VBUSVALID |
> +			SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL |
> +			SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +		if (submode != USB_ROLE_NONE)
> +			val |= SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_update_bits(phy_dev->regmap, phy_dev->cr_offset, mask, val);
> +	if (ret)
> +		return ret;
> +
> +	phy_dev->mode = mode;
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy_init(struct phy *phy)
> +{
> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = stm32_usb2phy_enable(phy_dev);
> +	if (ret)
> +		return ret;
> +
> +	if (phy_dev->mode != PHY_MODE_INVALID) {
> +		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);
> +		if (ret) {
> +			stm32_usb2phy_disable(phy_dev);
> +			return ret;
> +		}
> +	}
> +
> +	phy_dev->is_init = true;
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy_exit(struct phy *phy)
> +{
> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = stm32_usb2phy_disable(phy_dev);
> +	if (ret)
> +		return ret;
> +
> +	phy_dev->is_init = false;
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops stm32_usb2phy_data = {
> +	.init = stm32_usb2phy_init,
> +	.exit = stm32_usb2phy_exit,
> +	.set_mode = stm32_usb2phy_set_mode,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int stm32_usb2phy_clk48_prepare(struct clk_hw *hw)
> +{
> +	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
> +						     clk48_hw);
> +
> +	return stm32_usb2phy_enable(phy_dev);
> +}
> +
> +static void stm32_usb2phy_clk48_unprepare(struct clk_hw *hw)
> +{
> +	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
> +						     clk48_hw);
> +
> +	stm32_usb2phy_disable(phy_dev);
> +}
> +
> +static unsigned long stm32_usb2phy_clk48_recalc_rate(struct clk_hw *hw,
> +						     unsigned long parent_rate)
> +{
> +	return 48000000;
> +}
> +
> +static const struct clk_ops stm32_usb2phy_clk48_ops = {
> +	.prepare = stm32_usb2phy_clk48_prepare,
> +	.unprepare = stm32_usb2phy_clk48_unprepare,
> +	.recalc_rate = stm32_usb2phy_clk48_recalc_rate,
> +};
> +
> +static int stm32_usb2phy_probe(struct platform_device *pdev)
> +{
> +	struct clk_init_data init = { .ops =  &stm32_usb2phy_clk48_ops };
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct stm32_usb2phy *phy_dev;
> +	const __be32 *offset;
> +	struct phy *phy;
> +	int ret;
> +
> +	phy_dev = devm_kzalloc(dev, sizeof(*phy_dev), GFP_KERNEL);
> +	if (!phy_dev)
> +		return -ENOMEM;
> +
> +	phy_dev->dev = dev;
> +	dev_set_drvdata(dev, phy_dev);
> +
> +	phy_dev->rstc = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(phy_dev->rstc))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->rstc), "Failed to get USB2PHY reset\n");
> +
> +	phy_dev->phyref = devm_clk_get(dev, NULL);
> +	if (IS_ERR(phy_dev->phyref))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->phyref), "Failed to get phyref clk\n");
> +
> +	phy_dev->vdd33 = devm_regulator_get_optional(dev, "vdd33");
> +	if (IS_ERR(phy_dev->vdd33))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->vdd33), "Failed to get vdd3v3 supply\n");
> +
> +	phy_dev->regmap = syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(phy_dev->regmap))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->regmap), "Failed to get regmap\n");
> +
> +	offset = of_get_address(dev->of_node, 0, NULL, NULL);
> +	if (!offset)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get regmap offset\n");
> +
> +	phy_dev->cr_offset = be32_to_cpu(*offset);
> +
> +	phy_dev->hw_data = device_get_match_data(dev);
> +
> +	phy = devm_phy_create(dev, NULL, &stm32_usb2phy_data);
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create PHY\n");
> +
> +	phy_dev->phy = phy;
> +	phy_set_drvdata(phy, phy_dev);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider))
> +		return PTR_ERR(phy_provider);
> +
> +	init.name = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_48m",
> +				   of_node_full_name(dev->of_node));
> +	if (!init.name)
> +		return -ENOMEM;
> +
> +	phy_dev->clk48_hw.init = &init;
> +
> +	ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clk48_hw);
> +	if (ret)
> +		return dev_err_probe(phy_dev->dev, ret, "Failed to register 48 MHz clock\n");

In v2, the #clock-cells has been updated to 1. This allow to manage
separately the OHCI clock bit ("...CMN") as a child clock of the 48MHz
clock.

Please register a 2nd clock, so the OHCI controller can take benefit of it.

As you mention the downstream driver, please see there a specific
comment regarding the 2nd clock for OHCI:
/*
* USB2PHY provides several clocks used either by either USHB
(EHCI/OHCI), OTG or USB3DR.
* In case of OHCI, CMN bit must be cleared (clkohci_hw). This clock is
required to access
* the registers, to resume the controller from suspended state.
* So declare two clocks, the PLL used in all case, and the OHCI clocks
used by OHCI
* controller.
*/


Thanks & BR,
Fabrice

> +
> +	ret = devm_of_clk_add_hw_provider(phy_dev->dev, of_clk_hw_simple_get, &phy_dev->clk48_hw);
> +	if (ret)
> +		return dev_err_probe(phy_dev->dev, ret, "Failed to add 48 MHz clock provider\n");
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy_suspend(struct device *dev)
> +{
> +	struct stm32_usb2phy *phy_dev = dev_get_drvdata(dev);
> +
> +	if (phy_dev->is_init)
> +		return stm32_usb2phy_disable(phy_dev);
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy_resume(struct device *dev)
> +{
> +	struct stm32_usb2phy *phy_dev = dev_get_drvdata(dev);
> +
> +	if (phy_dev->is_init)
> +		return stm32_usb2phy_enable(phy_dev);
> +
> +	return 0;
> +}
> +
> +/* STM32MP25xx USB 2.0 PHY attached to USB 2.0 Host controller */
> +static const struct stm32mp2_usb2phy_hw_data stm32mp25_usb2phy1_hwdata = {
> +	.phyrefsel_mask = GENMASK(6, 4),
> +	.is_usb2_host_only = true,
> +};
> +
> +/* STM32MP25xx USB 2.0 PHY attached to USB 2.0 part of DWC3 controller */
> +static const struct stm32mp2_usb2phy_hw_data stm32mp25_usb2phy2_hwdata = {
> +	.phyrefsel_mask = GENMASK(14, 12),
> +	.is_usb2_host_only = false,
> +};
> +
> +static const struct of_device_id stm32_usb2phy_of_match[] = {
> +	{ .compatible = "st,stm32mp25-usb2phy1", .data = &stm32mp25_usb2phy1_hwdata },
> +	{ .compatible = "st,stm32mp25-usb2phy2", .data = &stm32mp25_usb2phy2_hwdata },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, stm32_usb2phy_of_match);
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(stm32_usb2phy_pm_ops,
> +				stm32_usb2phy_suspend, stm32_usb2phy_resume);
> +
> +static struct platform_driver stm32_usb2phy_driver = {
> +	.probe = stm32_usb2phy_probe,
> +	.driver = {
> +		.name = "stm32-usb2phy",
> +		.of_match_table = stm32_usb2phy_of_match,
> +		.pm = pm_sleep_ptr(&stm32_usb2phy_pm_ops)
> +	}
> +};
> +
> +module_platform_driver(stm32_usb2phy_driver);
> +
> +MODULE_AUTHOR("Pankaj Dev <pankaj.dev@st.com>");
> +MODULE_DESCRIPTION("STMicroelectronics Generic USB2PHY driver for stm32");
> +MODULE_LICENSE("GPL");

