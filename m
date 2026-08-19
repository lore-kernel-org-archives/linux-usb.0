Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1FC3BC68D;
	Wed, 19 Aug 2026 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152766; cv=fail; b=KG+Up0TnKyIygjOahgjBDoGpEoIsYlumqepyKfz0KeommYVyKeahgzWMUSAC5pi2oUE9W5lznLkWwwRQLmP5XMS4S8X+lKcE1xJvPVkmH0wjRLOw2wPOoJeB3R+dOPuxrN0BaAZvLG6paBVXjDBY0vj+X+intsIk4yaBbQOLy70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152766; c=relaxed/simple;
	bh=qng8MmSUlpApn3JVUyEzzVVhYVAtE8YmfuiFaHh0gnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WbdHs8GQEnq3GLRjJKzDJZwpDOYhv3K4blBA110HncQy1wGMDhBBX9JlvwshO1NHWZ2pgGtL8aCZrFSDG590L7Dc1BUfl1lC1/HCGFHc9J+rH4o0S4gJ+0ZqMNJ1ZovzOJlfF6BeakTzNYrL/G/HMZHkE95fs2NMZfNViMCH1Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HHMfOLDC; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HHMfOLDC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tysBxWOiYRFRILtoaqyl+WOUB8pcLmksjyswsK+ECFHl0XJl4a3Lzhawec7coIfuv/3CH3RGLkcPENEoV6XwExRGRwQmzwD34Vt/tg24ETJR4zdungsmoNApdnODHR/edbWFLAbg6MLAg46u3PK0Jtvti0BpK6jzT4Av2F2aNxkTOyZ7CThO+oOwZFE+nMX75OqYLiV8jFaE/3Z0ij7AvdDWFPEQ05HEv8mmA0Mg80pT+DSla7HzxithWRwWTeZubCj/VjqwrVmrlPEuiMqE7nXU9oxcP4uPzgvg1iiuTJfTHtoARBI+4imRtP1OBVgeRQ5FSQAuN5kC9YcY072iKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoHO3s51oL9GUJU24KhxWrmnpYLuAZNIFuX1r7gazg8=;
 b=hq7uKRoF/y3tOgSM07fXL1SLn0fyWRZFS8CJDHhUsYq8aoCP8IOZ2sFXBpE48MsICfPcDckEf6McED+AO28GQ4PSVzTPamNbtmt93yIdHEZt5oKizAlCoPPcR3rc/2pG6VONLgi8kogFPvRRC8AHS548eWYRzkbQGzm26jlOO3faePgkDjNQumYAm4sLVUMUuVf7Q/pmoZpWIOu1/l1XCE1mwhp/8HxFWpkomDVKm5LETDbqfOGkgo0AeeQylkO1T/tEZwtZTf1r0ITkq3QH11nCz+SXKGqFZ9INR0EW3EJiLDMnt0H4ls8ikVsc97p3JCoNsbv/gjlvQZ59zq4kFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoHO3s51oL9GUJU24KhxWrmnpYLuAZNIFuX1r7gazg8=;
 b=HHMfOLDCElMKQ0Mk5FrCXGps3HZaskiBVO7JEIMPoNdvz1lGCR54dWgsKoZSM183Y35DsXBAbY28+ttoLXA3WY4YvA7cjIArsvxYTRYz6rigEO0YtqsrbdIVJi7EPo0QLSzLXyQpWtxooxlDPGJ4zvMu9dzRCt3osody5d+qo9A8a7/1sFuGficttPCp4ThDDZylAqWaqh+DQeVWCwVGv7PLEkdwD3frZTR2T2+UhezlOwLBwPq25w8oBfkIED88I/CImnF5M57/+nn0tNDvLQd4Ypung37Sur5DZW0AZ75OAWidPmmWvKowCeJf68AeFi9FcwevOUVGBniLCtmwtQ==
Received: from DU7PR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::19) by VI1PR10MB7716.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:1ce::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 15:19:20 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::7) by DU7PR01CA0030.outlook.office365.com
 (2603:10a6:10:50e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 15:19:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 15:19:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 19 Aug
 2026 17:24:54 +0200
Received: from [10.48.86.251] (10.48.86.251) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 19 Aug
 2026 17:19:18 +0200
Message-ID: <066ce020-6123-4aed-a069-67c51957173d@foss.st.com>
Date: Wed, 19 Aug 2026 17:19:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: phy: st: usb: Add STM32MP2 USB support
To: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Christian Bruel
	<christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Rahul
 Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>, "Rosen Penev"
	<rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "Vinod Koul"
	<vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
 <61dc785c-bea1-4674-918d-0f38ea253a29@foss.st.com>
 <41e7978b-933d-4813-9158-00474f531476@nabladev.com>
 <6c900e6b-2f50-4ec2-aca4-3093479bba53@foss.st.com>
 <d6064380-2368-4131-8cde-44734f67028f@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <d6064380-2368-4131-8cde-44734f67028f@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D11:EE_|VI1PR10MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6e44ae-e711-4df3-ced6-08defe053dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|7416014|376014|22082099003|18002099003|56012099006|6133799003|10067099003|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+PdQUkBKjBnWxJdKGbvI5klpENgVUWuhEFJSfEVjPAOG0Rs7t2sP8abCWto7SAMk7xdkuqWjglJtfw4oJTSRmF5NlSmM7zox1Vk60eFEn90IRQqVeDcku7AkaD/L0nHHTobD5ceriLJEjt8m5s8gRvh1+T4plW7IOSvJBOZp1ER4mR/9ePqqMyJaqMljZf8UQrmucIuMOz/eu4Cl8NqvR6oMUY/p/N20vilCl9zMBr4P7jnyAW6CQFQ2oX7ABeFRw8l9KHVUs8Qrl1vkNUa739mu+ES0ByBwAZc1uL9RiHSKfxWGEeRwJ896G7qlq23WLlph3HPIzuyYVCs0mPvd/VLcuWUyJfAV7xEy5mWV6Hjrk14UQi0dGi5yiiukEd7/il/S5289AjumpOxS3mIIBwUi0TT674ajnpv4V808gGeu3KqPCMwKKQkVXboZH4NxpvBtVTCRGiAEHvOHFNiSDsG9u0UryZp8OpKdkXn5yBSLuO0424Xxn5b18pw3gCt+gvkeX2jlq7/OmNNYyhHIuZLJx9ES0q6jf+8Y+jKbeigJHovPKRfbudqbMjlOwSz8ekpOlEKSQTQcGDcfdyG62N+Rminkdyee2kW+ox8AjI45YiW2OoZXS+GoGGvz4YWB8tQZmPw46rpf50B6uyTegUGgRWGhi6lPwK0xmeZLcv2lwA6xcr01BGGrLSiWgrMcBGXDzl1ZLhycO4VDbV+B5g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(7416014)(376014)(22082099003)(18002099003)(56012099006)(6133799003)(10067099003)(5023799004)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UW6Pq1mIlrYE1/uEkqfJYP6BVct/YLs3YaeB27SygMj0s6W4xarYHN/K9RXpDA5yBRUy5jIqeuh+hf5qs8c2p3FUgOek4cUyJeVb/PQ5pUrJFADqQWtTB1vaKQUAS0Ff7ZzZ6wMb5ZP0i3E1f10Bz5lbR90nOaTZk03j9Yw1zjY6Og+wtD5Sd+ZLLXiwF2ad2bThtaJxzhSu1+yhkgwibAQbyQDrMCgEVjmcF+cAlZEBjqsEMpmsOvlIOwQzK2q4aWnBmIYZj6GneLAah02Rya8nxC3qndEhRMuRP4iCx2MdBDLfu+HTSPFz8hPNC0H9MT/8HwjHWEoqVzTTdnRdkDA4F2EgVjt+qn2FI39OW5BzAQBWdGyWyXoZy3OvW4uRKPLhIht0bRSAxO2cMxeQS7YuCDlyEOdij8WtPtJlZrTxQM7hFdu8BOPIxOZ7Rsj3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 15:19:19.7486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6e44ae-e711-4df3-ced6-08defe053dd2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7716

On 8/18/26 18:35, Marek Vasut wrote:
> On 8/18/26 6:07 PM, Fabrice Gasnier wrote:
> 
> Hello Fabrice,
> 
>>>> - On coming MP21 (not supported here), there's address translation
>>>> control
>>>
>>> What kind of address translation ? IOMMU ?
>>
>> This is much more "basic". The controller can address 4G of memory, e.g.
>> it's 32bits. That feature is only for STM32MP21 that can address 4G of
>> DDR which starts at 2G offset. So basically there's a SYSCFG bit
>> (SYSCFG_USBHARCR AREN), that adds a 2G offset so the controller 'DMA'
>> addresses directly the 4G of the DDR (instead of 2G lower memory map,
>> that's not necessarily useful, and 2G of the 4G DDR, requiring swiotlb
>> with perf penalty).
>>
>> Current downstream glue driver checks the 'dma_range_map', (e.g. DT prop
>> dma-ranges = <0x0 0x0 0x80000000 0x1 0x0>;) that represent this, to
>> enable the syscon bit that adds offset in hardware (so 4G of DDR can be
>> accessed by the controller, without swiotlb).
>> For USBH, there's nothing mode: set it at probe time, based on
>> dma_range_map, restore it after resume from low power.
> 
> Maybe the DT syscfg node shouldn't be a plain syscon , but rather there
> should be an actual driver which binds to the syscfg DT node and
> configures all these hardware details early on boot ? The USB controller
> drivers will start only later, when the syscfg configuration is already
> set in the hardware by this (future) driver, since they depend on the
> syscfg node and the PHY subnodes. Maybe that is the way to fix the MP21
> without having USB controller glue ?

Hello Marek,

Ok, I'll think more about it regarding MP21. Let's continue on current
series without any additional glue driver for MP23/25.

Thanks,
Best Regards,
Fabrice

> 
>>>> - Common dedicated interrupt to manage wakeup
>>>
>>> This is EXTI configuration, is it not ?
>>>
>>>> Using generic controller drivers, I don't see how to manage it, without
>>>> describing it in the DT.
>>>>
>>>> For sure, generic ehci/ochi drivers and bindings can/must be used. What
>>>> would be the proper place for this glue to leave ? Why not adding the
>>>> glue driver from the downstream ? That's supposed to address this.
>>>>
>>>> Do you wish I send it upstream, so it can be properly reviewed,
>>>> amended ?
>>>
>>> I would very much prefer to avoid the glue if that is at all possible.
>>> Thus far, it seems this could be done (interrupts are generic interrupts
>>> managed by EXTI, Vbus detection polarity is likely a PHY thing since
>>> this is managed by SYSCFG anyway) ?
>>
>> I better see your point, thanks for your explanation.
>> This makes sense! For this part, the approach can be the same on all
>> STM32MP2 SoCs (21/23/25).
>>
>> Still for STM32MP21 address remapping feature (out of scope here) I
>> think there will be not much choice to keep a minimal glue DT & driver
>> (and parent to generic ehci/ohci). It seems totally out of the PHY
>> driver purpose.
>> Maybe you have some thoughts about this ?
> Please see above.

