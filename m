Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381633A75A8;
	Tue, 18 Aug 2026 09:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045292; cv=fail; b=KFcZ5bVA6zg0hQvNQloAAJubHvDC4CMu7gJVYKSj8b48e+yhDm1xoTjkerxCDlvvz1KE9aOBQeA9s/tSLrutpyaW69iaDLnVxHW4WtoFKKXJmqiaCkWXYIBiFJM7x1gGlfS7/D3e4EObAn2gaXfz+bP7RaWCW07SL2DcZrGrMBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045292; c=relaxed/simple;
	bh=YCJT64TSriAJrq2BqEOBQ9ri2nVWZS6Wc7LBsTOnpec=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mFirzZwFvIoe1c2K/Ou4xBUwFmWR5ubZ9tfhqlEqOB6ecp1bdYnDl2O6KriOsVtJYzfFXkGxBdp6WjThD+67g2S2oFfQHb6kJB0IWWHvra//5nD+U+sjwCxvE8IBNNPvxjxipx6G3vixam6w53+eBl3jWyCJ0fHaf8LLxj2jFes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UEtMnm67; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UEtMnm67"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGbKTEXHe+D4h3dE4n+qxFNHgnHvKiOi4+fmEi3qb5VfPEfRE0zt6p/Nyvcb4vfboQZpBIhIErNYhEbu2WkyGWQfUGcAtm0oVqcpd1DQih49D1BuVKIWvGJA1IeJ/FsxotaYyM1+EwMkqAdsoBzZeIhliqD3gf3nAZamuWvw3KhKw/vnQYNAbGMHu3ymb9PcfveVGL+0zZTNEILDVASf9ucSpj2rUKoqEvdYdDr+oW1i/O7FBYLL7f7X7sYJ9yNLgfDln/peteD26NLCkwEU7ireoPoQHqJmKw4O7YNMcxSU9WurM0zr5d3DUbjIsqxm0CvhQAO5fN4qkA1amtvg5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo5YNiwZKuJgXW/x+uBoyHI/PFvFdMMI4FACkKXMHoo=;
 b=sg5ywhi1Z7xLAXmt3UdxPtNcta8drw+cbHG2dIeWzVx6aciD0IGG3XjmoLhKu1RjcY+kwtPp3FFbXC6Fyc12wY7khzOSYb0hWVA65Dod7VqCXFpG4I7ISlbU6OTqGAJfpFkkfuylffI+hrrNOc/NTNxMFQFcgmR7skx0CuwEkv7BI8Ekd+Mr9YGve5OqTS/55t21MKjG4mLXet58oHUz0cZDZMrsSyRueIhvi84RB3kHHdym4BxMSQML4FihNU84WHMlKlh8eorc8drJIpBviexaHu03eJPZFA1J5Bin4C7B/IBApmej23ZWLAq28Zoova6Rb82J2lostWU7viSrqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo5YNiwZKuJgXW/x+uBoyHI/PFvFdMMI4FACkKXMHoo=;
 b=UEtMnm67irePQLSDypXr8ggpE5sReKytYj8kRVZ/dawlOjFGKcaM85NJmHRqmlMdadiMG9Iabhv5DDbenVyu/HgwKucJNU3AGKbmV+xr3WiZuNBE86FFDYcVm4MHU4thyUxJX2t4EyTMNzKs4pQi9MKJfsNWZxBnkxpm/C5St+4c0njthF4skePiT4oFbO8WaylCvfrRGPa/Wq40T/PnWumCAkHITfwkLUtm5ecLms0yNNnqqJxiXrXaX6M3hGac9bWxxeZCk0jXuUrMvk5fHvoNhkk/JTgzz/k7+Mm9QdsEWO66ZwmwhBRo0o5TmpsPaJM7q5yGEUt+6FEOel9PbA==
Received: from DU7P251CA0007.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::19)
 by AMCPR10MB992170.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:785::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 09:28:04 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::26) by DU7P251CA0007.outlook.office365.com
 (2603:10a6:10:551::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 09:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 09:28:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 18 Aug
 2026 11:33:37 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 18 Aug
 2026 11:28:02 +0200
Message-ID: <ed1d6988-251a-43d3-ba0e-aaa3e54ad07b@foss.st.com>
Date: Tue, 18 Aug 2026 11:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <e415f8de-f8dc-460d-80a9-5e1b2b34f8a8@foss.st.com>
 <f7b674b3-9490-453c-9eb9-96b19254d0a3@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <f7b674b3-9490-453c-9eb9-96b19254d0a3@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|AMCPR10MB992170:EE_
X-MS-Office365-Filtering-Correlation-Id: 394932a9-c3f5-4a90-4e66-08defd0b0123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|23010399003|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Ob5Dfd66foXce792+SyI7MCOK+QR5+QqKDisGSbkxXnsApkXA/e1rZPwbxpvj01BCPaTTPtPHvC+gpPXyrN+DWFg/QvyWUT4ymMBNmu/tuckpAMXwwa67X5MCFq15BPvbLzQ2rMJBXDwUZIA9rUO8euBe0cUwrhl8Oi1fOj74s/5ZatZx+O0d/aakyCJH8VZ9rGuDdXUI+gujbOkDS/OC7snPh0ydZMjvcfEKGG54PTFK2qEb9opo5waf1buiZuWO5O6JCiN5nk40BeYcP1z+GfMhLGFBh9mrUD0ccH93HfujJIAyLVnBl/JGtRNEqizWDAPPr4kIsal1qsUAL1r+geVRxj/73GoUuGdVeEpoPjxGCBqoYqrPFQTM4EQ/pt0IPJxwW1OiRDv/qDVmVIiOIIHkGmmidGGp4E2g1D1Y+cboVEAeF0p6HU1lAC4adueqdbKXEUCYCd5fCeIgyhIIUQ16mcIrA1L7d9xFiWeLJ8VH7189Rlnm4msDWt8fgzLls0zbS40d8OVZcmzKyFzLE47otvfB3ShDaUPIQSxnfeDkVanXgtgqKcA7doHpyGIcz3HcflBKDS1pKJYenT+xJB+ls6xoVXWMIb8MsQB2EI0WcAVbBOVD0alE+zNtDlWXxovmR7oZn6jUQLa+UxIVdfxjF4tfncOwgn7p9zhhG8xYn0xMlyMauAtBwo05JNU2Sfao/xoek8w/UGEUdunLQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZfpJTtz3er48FBLE4YiKLHUwNpm6NvxtYCuJsc80QN61yR9WmeRFrhYbfr5UqPqB0ZTE8seW75Yd2poJg811en1FP59M0ArMpVtQppfTRA16aYf23QEZTPZRsQZ9bJKzg5Ryr7rhbqGQwT7xFCJeXlyLHeaftSVhWYvCVSgw7MEbj39fLTiP4N3Nu/MrgPbW5LAeBHv2cpk5l08oyoDXObfsZFb+INgZthd61nHD43TkCpOEw9HEbmJ/uaZbqr9BXcWdrWuElFmmDBlCSV3Kv9dt+Rrw82BFyRWIeZcWkNM2O9XwjbdV8TSEnxpSIYUjzkKuTYuSMjaPVWw4psijLXQ7vvHuPWNS5SvNqCNOqPnu9A9bCe03gwp4btSdGlZh/N5yQzntDnIXzVM8LbC5iWUWkiqXzeKNlXWZ4x4D94G3PPsOhB8wHQc6GcxYF35V
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 09:28:03.7442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 394932a9-c3f5-4a90-4e66-08defd0b0123
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR10MB992170

On 8/17/26 21:43, Marek Vasut wrote:
> On 8/17/26 6:22 PM, Fabrice Gasnier wrote:
> 
> Hello Fabrice,
> 
>>> +++ b/drivers/phy/st/phy-stm32-usb2phy.c
>>> @@ -0,0 +1,361 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * STMicroelectronics STM32 USB2 PHY Controller driver
>>> + * Currently Only supported for STM32MP25
>>> + *
>>> + * Copyright (C) 2022 STMicroelectronics
>>
>> Hi Marek,
>>
>> Could update to 2026 ?
> 
> Fixed in V3.
> 
> [...]
> 
>>> +static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
>>> +{
>>> +    const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
>>> +    unsigned long rate;
>>> +    int refsel, ret;

Hello Marek,

Just noticed refsel should be unsigned ?

>>> +
>>> +    /* Check if a phy is already init or clk48 in use */
>>> +    if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
>>> +        return 0;
>>> +
>>> +    rate = clk_get_rate(phy_dev->phyref);
>>> +    if (rate == 19200000)
>>> +        refsel = 0;
>>> +    else if (rate == 20000000)
>>> +        refsel = 1;
>>> +    else if (rate == 24000000)
>>> +        refsel = 2;
>>> +    else
>>> +        return -EINVAL;
>>> +
>>> +    ret = regmap_update_bits(phy_dev->regmap,
>>> +                 phy_dev->cr_offset,
>>> +                 phy_data->phyrefsel_mask,
>>> +                 field_prep(phy_data->phyrefsel_mask, refsel));
>>> +    if (ret)
>>> +        return ret;
>>> +
>>
>> Hi Marek,
>>
>> Below condition
>>
>>> +    if (phy_data->is_usb2_host_only) {
>>> +        /*
>>> +         * The clock should default to active after standby, as it is
>>> +         * needed when resuming OHCI to access its registers.
>>> +         * CMN is default reset to 1, so enforce it is cleared, when
>>> the
>>> +         * clock enable request from OHCI driver comes at resume time.
>>> +         */
>>> +        ret = regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
>>> +                    SYSCFG_USB2PHY2CR_USB2PHY2CMN);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>
>> up to here, is a specific part to manage OHCI controller clock during
>> suspend modes (either bus suspend, or system-wide platform low power PM).
>>
>> This should be moved to the clock provider api. E.g. to register a 2nd
>> clock.
>>
>> Point here is the bit is always cleared, even if OHCI is
>> unused/disabled, but EHCI is. EHCI can be enabled w/o OHCI when there's
>> an on-board USB HUB (in such case only High Speed traffic is expected).
>>
>> EHCI don't require to clear CMN for suspend states.
> 
> Please see at the end of this email.
> 
>>> +
>>> +    ret = regulator_enable(phy_dev->vdd33);
>>> +    if (ret)
>>> +        return ret;
> 
> [...]
> 
>>> +static int stm32_usb2phy_set_mode(struct phy *phy, enum phy_mode
>>> mode, int submode)
>>> +{
>>> +    struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>>> +    const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
>>> +    u32 val, mask = SYSCFG_USB2PHY2CR_USB2PHY2CMN;
>>> +    int ret;
>>
>> Then could simplify here directly for host only PHY : there's no point
>> in poking control register here.
>> (As mentioned above, control SYSCFG_USB2PHY2CR_USB2PHY2CMN with clock
>> provider API for host-only configuration.)
>>
>>     if (phy_data->is_usb2_host_only)
>>         return 0;
> 
> I think it would be even better at this point to register separate PHY
> ops for each PHY, one with and one without .set_mode .

Indeed, nice thought

> 
> [...]
> 
>>> +    ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clk48_hw);
>>> +    if (ret)
>>> +        return dev_err_probe(phy_dev->dev, ret, "Failed to register
>>> 48 MHz clock\n");
>>
>> In v2, the #clock-cells has been updated to 1. This allow to manage
>> separately the OHCI clock bit ("...CMN") as a child clock of the 48MHz
>> clock.
>>
>> Please register a 2nd clock, so the OHCI controller can take benefit
>> of it.
>>
>> As you mention the downstream driver, please see there a specific
>> comment regarding the 2nd clock for OHCI:
>> /*
>> * USB2PHY provides several clocks used either by either USHB
>> (EHCI/OHCI), OTG or USB3DR.
>> * In case of OHCI, CMN bit must be cleared (clkohci_hw). This clock is
>> required to access
>> * the registers, to resume the controller from suspended state.
>> * So declare two clocks, the PLL used in all case, and the OHCI clocks
>> used by OHCI
>> * controller.
>> */
> Is this what you have in mind ?

Yes, with one addition, please see next comment

> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/
> dts/st/stm32mp231.dtsi
> index e22bb53c9748b..2fa03b059c71b 100644
> --- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
> @@ -883,7 +883,7 @@ usbh_ohci: usb@482e0000 {
>                  compatible = "generic-ohci";
>                  reg = <0x482e0000 0x1000>;
>                  access-controllers = <&rifsc 63>;
> -                clocks = <&usb2_phy1 0>, <&rcc CK_BUS_USB2OHCI>;
> +                clocks = <&usb2_phy1 1>, <&rcc CK_BUS_USB2OHCI>;
>                  interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>                  phys = <&usb2_phy1>;
>                  phy-names = "usb";
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/
> dts/st/stm32mp251.dtsi
> index dbaac8a930fda..6e0f25e33f05f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -1765,7 +1765,7 @@ usbh_ohci: usb@482e0000 {
>                  compatible = "generic-ohci";
>                  reg = <0x482e0000 0x1000>;
>                  access-controllers = <&rifsc 63>;
> -                clocks = <&usb2_phy1 0>, <&rcc CK_BUS_USB2OHCI>;
> +                clocks = <&usb2_phy1 1>, <&rcc CK_BUS_USB2OHCI>;
>                  interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>                  phys = <&usb2_phy1>;
>                  phy-names = "usb";
> diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-
> stm32-usb2phy.c
> index 1daaf2f440d04..1c4b37094591c 100644
> --- a/drivers/phy/st/phy-stm32-usb2phy.c
> +++ b/drivers/phy/st/phy-stm32-usb2phy.c
> @@ -27,6 +27,8 @@
>  #define SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL        BIT(5)
>  #define SYSCFG_USB2PHY2CR_VBUSVLDEXT        BIT(6)
> 
> +#define USBH_NUM_CLK                2
> +
>  struct stm32_usb2phy {
>      struct phy                *phy;
>      struct regmap                *regmap;
> @@ -34,12 +36,15 @@ struct stm32_usb2phy {
>      struct reset_control            *rstc;
>      struct clk                *phyref;
>      struct regulator            *vdd33;
> -    struct clk_hw                clk48_hw;
>      const struct stm32mp2_usb2phy_hw_data    *hw_data;
>      atomic_t                en_refcnt;
>      enum phy_mode                mode;
>      u32                    cr_offset;
>      bool                    is_init;
> +    struct clk_hw                clk48_hw;
> +    struct clk_hw                clkcmn_hw;
> +    /* Must be last */
> +    struct clk_hw_onecell_data        onecell;
>  };
> 
>  struct stm32mp2_usb2phy_hw_data {
> @@ -74,19 +79,6 @@ static int stm32_usb2phy_enable(struct stm32_usb2phy
> *phy_dev)
>      if (ret)
>          return ret;
> 
> -    if (phy_data->is_usb2_host_only) {
> -        /*
> -         * The clock should default to active after standby, as it is
> -         * needed when resuming OHCI to access its registers.
> -         * CMN is default reset to 1, so enforce it is cleared, when the
> -         * clock enable request from OHCI driver comes at resume time.
> -         */
> -        ret = regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
> -                    SYSCFG_USB2PHY2CR_USB2PHY2CMN);
> -        if (ret)
> -            return ret;
> -    }
> -
>      ret = regulator_enable(phy_dev->vdd33);
>      if (ret)
>          return ret;
> @@ -233,9 +225,33 @@ static const struct clk_ops stm32_usb2phy_clk48_ops
> = {
>      .recalc_rate = stm32_usb2phy_clk48_recalc_rate,
>  };
> 
> +static int stm32_usb2phy_clkcmn_prepare(struct clk_hw *hw)
> +{
> +    struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
> +                             clkcmn_hw);
> +
> +    return regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
> +                 SYSCFG_USB2PHY2CR_USB2PHY2CMN);
> +}
> +
> +static void stm32_usb2phy_clkcmn_unprepare(struct clk_hw *hw)
> +{
> +    struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
> +                             clkcmn_hw);
> +
> +    regmap_set_bits(phy_dev->regmap, phy_dev->cr_offset,
> +            SYSCFG_USB2PHY2CR_USB2PHY2CMN);
> +}
> +
> +static const struct clk_ops stm32_usb2phy_clkcmn_ops = {
> +    .prepare = stm32_usb2phy_clkcmn_prepare,
> +    .unprepare = stm32_usb2phy_clkcmn_unprepare,
> +};
> +
>  static int stm32_usb2phy_probe(struct platform_device *pdev)
>  {
> -    struct clk_init_data init = { .ops =  &stm32_usb2phy_clk48_ops };
> +    struct clk_init_data clk48init = { .ops =  &stm32_usb2phy_clk48_ops };
> +    struct clk_init_data clkcmninit = { .ops = 
> &stm32_usb2phy_clkcmn_ops };

clkcmninit should be a child of clk48 which basically represent the PLL
(480MHz) as it is still needed as parent. See below.

BTW, mainly a nit: could rename clk48 to clkpll and update frequency to
480M.

>      struct phy_provider *phy_provider;
>      struct device *dev = &pdev->dev;
>      struct stm32_usb2phy *phy_dev;
> @@ -243,7 +259,7 @@ static int stm32_usb2phy_probe(struct
> platform_device *pdev)
>      struct phy *phy;
>      int ret;
> 
> -    phy_dev = devm_kzalloc(dev, sizeof(*phy_dev), GFP_KERNEL);
> +    phy_dev = devm_kzalloc(dev, struct_size(phy_dev, onecell.hws,
> USBH_NUM_CLK), GFP_KERNEL);
>      if (!phy_dev)
>          return -ENOMEM;
> 
> @@ -285,20 +301,33 @@ static int stm32_usb2phy_probe(struct
> platform_device *pdev)
>      if (IS_ERR(phy_provider))
>          return PTR_ERR(phy_provider);
> 
> -    init.name = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_48m",
> +    clk48init.name = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_48m",
>                     of_node_full_name(dev->of_node));
> -    if (!init.name)
> +    if (!clk48init.name)
>          return -ENOMEM;
> 
> -    phy_dev->clk48_hw.init = &init;
> +    clkcmninit.name = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_cmn",
> +                   of_node_full_name(dev->of_node));
> +    if (!clkcmninit.name)
> +        return -ENOMEM;
> +
> +    phy_dev->onecell.num = USBH_NUM_CLK;
> +    phy_dev->onecell.hws[0] = &phy_dev->clk48_hw;
> +    phy_dev->onecell.hws[1] = &phy_dev->clkcmn_hw;
> 
> +    phy_dev->clk48_hw.init = &clk48init;
>      ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clk48_hw);
>      if (ret)
>          return dev_err_probe(phy_dev->dev, ret, "Failed to register 48
> MHz clock\n");
> 
> -    ret = devm_of_clk_add_hw_provider(phy_dev->dev,
> of_clk_hw_simple_get, &phy_dev->clk48_hw);
> +    phy_dev->clkcmn_hw.init = &clkcmninit;

Would initialize with (to adapt) :

+ phy_dev->clkcmn_hw.init = CLK_HW_INIT_HW(name, &phy_dev->clk48_hw,
+					 &stm32_usb2phy_clkcmn_ops, 0);
+

Thanks & BR,
Fabrice

> +    ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clkcmn_hw);
> +    if (ret)
> +        return dev_err_probe(phy_dev->dev, ret, "Failed to register CMN
> clock\n");
> +
> +    ret = devm_of_clk_add_hw_provider(phy_dev->dev,
> of_clk_hw_onecell_get, &phy_dev->onecell);
>      if (ret)
> -        return dev_err_probe(phy_dev->dev, ret, "Failed to add 48 MHz
> clock provider\n");
> +        return dev_err_probe(phy_dev->dev, ret, "Failed to add clock
> provider\n");
> 
>      return 0;
>  }

