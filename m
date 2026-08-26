Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13499383998;
	Wed, 26 Aug 2026 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738545; cv=fail; b=StW0yyA6KmWwGrlqi+b9v1ZHx4EqLlzHQ78XowWOMxy78mZSHcUnag3FtarCP/tlU7BZImYg3ff733cKnmB4X+2/KfHz/rDOcpHm9MEYrQdEMZgFeVNfbbFACe8joZUsCTpSJFr9Fjh/FiwWhQCaNIbsxFqeIgPNHILmX/AvWXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738545; c=relaxed/simple;
	bh=3BX/CJxGOtjTtYM2BzC0HrnqGg9G2uL8bA6yzHf+YY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nFSmBnHaGNZMlPY7ob3dl1mVCuwa71aqzEyiDtCNQco8eDDc+AJ4jT4dDcr4+s+W9Lw7ai0UuQnlEVpUDwDO9WSle4MYVWWfOrVuJvS+zzlcILpcgTtYiwjr+00MlGFacx1ZojFJQ5qKOkuViLZioHMfdzYLDoNs2MG1kde8lKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=J5QOmWKC; arc=fail smtp.client-ip=52.101.70.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="J5QOmWKC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFTzRmRGQG3Lji/Oa1xo9Mqq+w1GhSaKgyoCVs6CKcDTvkriW3vAJcAHWJlE4TfALxOeaq/JT5eXGyuogzNCymiPxzKtu2DOvMBdqabdIIlnKVKCGk0kl8zuITRyKuSpYeSJG/b1sje+5EEDxDxJn3sp8hReo3ezv0VCCdqtZYuIDObfPrXdp/WjTnRVe8SykBM1se9TWVzvsXNg1AgO7IdABqDJ9Hy6hKNvYU3Yh1fTBcr3rja/V64nPkCaXA6wUFK9Swy5IVV25Wu0wmRWTLquGjDZhup5wjkJvCIZl2S0M6UbO38WntcINtMcIV68gOszbb+OSu1Jq8cqk2/THg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbOANgltz1KW7fKvnDkTlU41xrzrxr2BwQ7iJZ00TmQ=;
 b=YtUxXmV/WiLkcE5B31SRJyy2SHFgsIl0b6GgM2yf/2fH2zJERhBW3UvSNq/LfiUyRS3GxQw5XdmLFQiRL1Y+mDF4sA/mDMpx1+03RZbJvrZS9yQRHKa3BpoLE7IXKDos3Ey+uDTwg4SeNGT9+qULcPodcEx4DDxyPjJbOYVEKirErdNnmwn+u16IB9o4R7snkso3ZPWzOd9nOcIkNGCakI+tFcSYUQJvzYtCc5Q2iXiWDrcvQAzVbGEIx6r3brQn+aCCR24qh3avgaTVKY7uwpjC9yjNWuow0LKmu2uNYi0fSciMHapYBQV4Nm2b3NY2DNYQGIgqNIQILU11f5RHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbOANgltz1KW7fKvnDkTlU41xrzrxr2BwQ7iJZ00TmQ=;
 b=J5QOmWKCcQ+1QQAPhLA8hQVrNOhYVvLnOp+ozK3BUji0qTJrhk4s/iRPSpbLGGymPXDFn5r0WEPrLdB9HGbmp1cd7/tirBKUZlut1ssw+IfRPnLwcHPL9fgNQYmwQcLKr/OudL5dNlYPTVfK5bNYqJbwegQpfs6LdfZa+USqIEe0O2kr/1vXod3hpr0GyHBG+ba7ZDqydnbLU3n/anrzinA8Tj/kFbh9gVpnoQ79r9xmGumvqLEjsf7mD3xc7UTNfmf8uJXvFm1bLrDI1qUtHWbyBFBDBCQYy+eu9Xxs4qhwSW1dqvhkRBpmFgY8iilE8JVBFNLaeYZvOR2VcaDqKg==
Received: from AS9PR05CA0061.eurprd05.prod.outlook.com (2603:10a6:20b:499::15)
 by GV1PR10MB6098.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:9d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 10:02:17 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:499:cafe::13) by AS9PR05CA0061.outlook.office365.com
 (2603:10a6:20b:499::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 10:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 10:02:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 12:07:36 +0200
Received: from [10.252.23.181] (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 12:02:16 +0200
Message-ID: <8f1cd58a-33f1-49e1-bb32-02fa125f6f3d@foss.st.com>
Date: Wed, 26 Aug 2026 12:02:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] usb: typec: mux: gpio-sbu: enable when only used
 for orientation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260826-usb-fusb340-v1-v2-0-994a03c9ae45@foss.st.com>
 <20260826-usb-fusb340-v1-v2-2-994a03c9ae45@foss.st.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260826-usb-fusb340-v1-v2-2-994a03c9ae45@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A66:EE_|GV1PR10MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: f209f030-ee09-4e80-c7a3-08df03591c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|7416014|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0hu4cfg4HIiCafjTV/eOJZ71R2/TAT14GZtK1iqODZqgOnJ816XTtd9UVIh0ZinukdL7Hd4BJrRtHmp0POeF/eyWbndV/CunUcHDBfLFNVErhgdq8r8Qpz/2bMjjXs3Pbt6AQ8aPvCrW1PaH4Yx8uAkKw9lPl7VvxU3aGZyUQDuKL5zzAgc1Xi6XeBFZZVHB+pd2qd2vhucR1YprUF5BKbl7Vf9epFWntMpYhn8cH+yBIfY8ZBqNZHm/nDJi8zvN+uk08TliYD2dc4QwIavXZsmvL03v59EwUIE/uco3gprWM7WIdlicvpHtMQv/liWS9u/fw/2wX4xuQLzESG1UyrYJ/kNnq72DyYfvL5xiFjChBqTC/Q6qfcS3k+ZRq5llbNKeuE0DeLIiiCo7fEDd8Ut0r4io+vJqWli5kJysMHlzUms8HBFzUxGBFrYbY1U4S52O2GB9APiwSRXXJLlU6y4BFsW6TtyMgOmAaV0J992H1VvZnJpqFioc4UwRoKL4XG4ZU5nglyelGMLXmlgn6UnLbCRdUyWwlft2zC6GC3Bp8GfCHw71TGP+SkXz6iDUqxa6S7oFJpxwOhTbLNP53HgnX7a5DnVipUm+I1n/YZ519771S6H5RpQGQffC1vGRczucRRLwE6hz8MDqjR4blqWIjhS7+vB1H1qAzDpx3/WxlzW1Xmi4P5ZtHW4r3RveVMNOaJdgmeF0j55UfiBabQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(7416014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WGO33UrQ0BXNkH4VGaLXDIuBPb5uRxW1uWKX0CcZ1lq33+51hssda1iADNSxCa2PuvhopJoW0suaVJ6/5GU5xPpGQfji4BSq74BKXgAwoPf1bnwQB5ha051DIZxFBRXEf7KGeoXr3KzmcfREXYurh1AzuVe8XVxbt92t3SCqvxGQuH2OCjVJWJ+wzpwa3GPOHT2qcMSzVTiF1GRhfwNZSLT1bm0vkPnC+P4IL6ugPOmOu0Tc/A7sJIBb1AGJWg/srPxypQchJPUxt8l6ykNJxS+SIhbGmwvIiNUSfxOkMyhbzUo386gNn1Vq5VF3jqz5YMFYqyrEDLfm6k15xvY8S89aEXU5zuJ55YoUodIdMeaBkCEdw1sNnmK4gKt7a9aqwb1T3vVOhteM+s9EamsktnIlVBbs5bB+Ky0i6gj74fwcBSUDAyVChikrSCIydkeV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 10:02:17.5099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f209f030-ee09-4e80-c7a3-08df03591c8d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6098

On 8/26/26 11:53, Fabrice Gasnier wrote:
> When used as orientation-switch only (no mode-switch, e.g. no altmode),
> the optional enable gpio remains disabled.
> Enable it from the switch_set() routine, in this case, when the
> orientation is set and the enable-gpios property has been provided.
> Move enable GPIO configuration after the swapped configuration has
> been done, to avoid possible glitches in case both signals are changed.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v2
> - fix issues reported by Sashiko: probe mode-switch property before
>   registering Type-C switch, to avoid possible race. Configure enable
>   GPIO after swapp GPIO has been configured, in case both transition.
> ---
>  drivers/usb/typec/mux/gpio-sbu-mux.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c

[...]

>  
> @@ -125,6 +131,8 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),
>  				     "failed to register typec switch\n");
>  
> +	sbu_mux->mode_switch = device_property_read_bool(dev, "mode-switch");
> +

I've missed to update that, I'll send a V3.
Sorry for the noise,
BR,
Fabrice

>  	mux_desc.drvdata = sbu_mux;
>  	mux_desc.fwnode = dev_fwnode(dev);
>  	mux_desc.set = gpio_sbu_mux_set;
> 

