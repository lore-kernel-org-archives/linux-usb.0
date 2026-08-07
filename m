Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575711CD2C;
	Fri,  7 Aug 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786130308; cv=fail; b=IoileHIhTgmVzlCzxlWp6m7HmKl/N1tG1TjfBPTtoKdMbUddXxdFBDaQBKG3MCwXfyO1/T8TfRnk1SoRSJEaPVUpozIpbahyvqYPX8p6HiRFEpKajhuF2Bwe/hBHd318rgkWJdv62anbZdfSnUUecCi126rHNHt8dVSgVgK3oXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786130308; c=relaxed/simple;
	bh=+b7hUOIH6Ic7sz0VourFkFxHhQeMxkGjwcu2l89sT3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HG3IjWa9rzubHBrG5v7SlHa9Ex68/FFxoH4BBLev9Qq32Jyg7DGjYDSjP1hzjbRylHAt2STgy2aOMmdkHkxRLetaIH5Y/3srQ2hxJXc36Pu4LKH5viCaXNj8EbuoUppp4y7wxw+sjDzJoTgqelHsrQ2AriqPn5OuILYCUWyvJJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j+u7WoWn; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j+u7WoWn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plNIUgemJJXhaoOXbWNI1hcpB2auHpMugya96uLcV22wDek4Y+j0MLju4CQEUu9wSqH5WetZWaPN+JJJPnEVkJrUboPMbbsgmUHv+yHY6n3Aoc4+/36v9z0iDO4I3tEwm6FtRuLFDbQ+j9HIlTIFJrCp8qMsnrl6B/K+7f02wa9ShiWo3o7qxpINoNd3dBs0cMHUAVqLV0z3hrarhBMneKS7lvJSGZ2dcLphmpGSidgc05UbM1Y67eIASj1bwcjDKPkFjunZcjstMic4ham3PIxW77I+QSwM7ZEmS0OvLnUdiq39WVWOPPOYAV4LM9njL7qwjBmTVzOUYl+dzvgS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cr/JTnmXXjlQ3EpGYxdhQAYKKjgcB8B444EoUdl64tc=;
 b=MwCFmo/H58Nz47h81LDb63iVPT6Q311UiHZrM0Fk4pfTLEyvnxWXCU/jTodrp2vdvai9UdyIQ2Le4SZaOHhyw3S8KZpK+5oTqI+jI4YOn0HsUVYc6KZOmWtw0U7egVtB1hEVPkXnA7lhRpvLurR9gu90d5BnjLKC9P5pJ6/+ovd0VB94AQqrLd2qWmo6IvR5cV0gnFNn8PUfKVuTou9rYn438zpIzDNhbNP3TIedKqDPIwgz/3rRWOmModyWHv8oDgO6ZWR24Edg4bnIthie2OXN4RP0Gv9EK07705RVsU87VaVfd4ojA8iTZ9jT0hmiPvr64zIsp509qRXT2zpl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cr/JTnmXXjlQ3EpGYxdhQAYKKjgcB8B444EoUdl64tc=;
 b=j+u7WoWnOriayby2Q5UD8t7F8N2zn4TKcO41zV8rBmWA6EZhm6VfNI67mgRI1AkE012SK0YFndLBBTM+yVZceCGFZwbN2ETtbrj6rlTARIYUEZi5ID6FXnWXzM6xsd5yIhpTTCOIb4O1eaw+61tI2y19nmTREd/QK8hbdWg9oEQWqwZL+EKnCCZNirDhofO8zwAkhRB2rfAgf/b16p/pWM397lD3yMuh1g5U3DrIvppZ9HLyRlc/q4hm1bfbwpERBg41gDkzrAaXncFiYEHB4pV7NYuZkalKrOBAEq09F3XtWvMOAY8vUvoaQ08GmhsHmfyhjIi4XSk3Nzx6QapOBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10547.eurprd04.prod.outlook.com (2603:10a6:800:280::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 19:18:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 19:18:22 +0000
Date: Fri, 7 Aug 2026 14:18:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: phucduc.bui@gmail.com
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling
 when creating IRQ name
Message-ID: <anYvdo8V_bqWnJNj@SMW015318>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
 <20260807065619.30604-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807065619.30604-2-phucduc.bui@gmail.com>
X-ClientProxiedBy: SA9PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:806:a7::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10547:EE_
X-MS-Office365-Filtering-Correlation-Id: d46a0db9-3244-44fb-29a7-08def4b8a5d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|376014|23010399003|22082099003|18002099003|4143699003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	jN67+ZaxQCmbMo4MJSIdefXC4L27k1xqrFQ9PQp5L1KcUauNRDqe3/RQUZz3OgEfshslmQl4J15S+6W1Pw7TEOcNCgmiqIKJBJOBCEZaBts0I3DK0oI/ruXPOgQW0i4pxlB3tK2okLWCC5ZnHrXFcqbeSGbjvOah556cp0CK5m3esebffzfPZA4zByuj6TI5sIcxvM/SVFx52pcYnZnXj+/28AUsayMCJ8plPEb0NfNp0eKmqIge3osI/d+7DXOWdAU6sPQiL9k5BiD+xQf8typ6qC0j89ZFhyAFfjhF37ITPod7NH2OGT22n/LyWnWfer2sm637RFffMfsOIGvMkzHNIu/NT8vGCPCu/v2yG5PTQTOi5O36VNWM9xz9jXMaYQAKiyVOFA40Him3ZvbYm7Wlb80V69CoYVJNos180tnx2HN8CdgC2ZBILy0V3SzlY/b8rsX8q99pD9+Cr3pw2LwJ267E29NnQK1AI/0ZnzZ8soqq7kO+wOjx+jZ2UnbGUk9B6SV7Ct3s9ZL+RfIHgAvN/zPIbWKe9vaTnZOvUDxQYE7KRv2ws+YEajAcOAmNLTD5ZB5APO6wqfBDHrmGwo26K8JTIOvadYqS8ZEIR1jU1HLAPUZndwLBw7TNOzpuWdXLNYnb8JYe76X+wOO0VdmM2AnwJeGeBZwbHVl74fs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BLLgxOG9G5hRF5QwNbPVEUeYdKYPffTf0wgILSstpNkBtRUKBulWBBsS4cQa?=
 =?us-ascii?Q?q9c0Tb4Li4mhGU5vH8tW/LxGW8z9HKszU5TEwV4hPEiZAjq0LYlIQDHCJVTW?=
 =?us-ascii?Q?mKCHufR6TLHsHCREp0vRDYy403UTOFebIlcRAIz2c1Q8ikPulX4lQ54e3sgX?=
 =?us-ascii?Q?eu32rwfjBqHEpSXwwR1BdOrz8voj0udMflj3WoVVoGDXOXgSqNGmXmkoAO1n?=
 =?us-ascii?Q?L7TdhlJaQHkCZ8tlcXPEML7S0U3gktzBh9zJgLbRc7X00JrPsGxMbmW/ARLn?=
 =?us-ascii?Q?NnUBElmqL+QUBqLpp4scVcmcXh2vgUSCp72ddZRAYK5wqObkfI9//gHtNUWK?=
 =?us-ascii?Q?PfVWarnEcLEqD9JlH5ybo9u4Eqeuyeh1Lrkj4W/DX4G5pgdd4BMiSgEk3Hac?=
 =?us-ascii?Q?MJ0ATmf/rImwXlh6jASEeRCfzGjH1AjJdbGqjDH5IjsbC5bfkd4SOhcFXRSh?=
 =?us-ascii?Q?IGSJhTjNYDZNHyveIF9YNICLFjGyuoHDyE7wwQTfbO3Mpe2XnY6mvN9c6t9J?=
 =?us-ascii?Q?5BApaVaCr7xBvJt+V859xUbcSwb5JvTDsP54utynIzcmo7LCvanGQ4DL8Mka?=
 =?us-ascii?Q?6gekd1V1c/WHay+fUs56jkKDWvkFkCCadkOJA8kx0Xxo7hjnSNl6zKF92hyX?=
 =?us-ascii?Q?pmr1G6IZtCN0acV6A38O2ZBRETMBDtb01zAL3wahg1NYQTIbygs79vSh5ntw?=
 =?us-ascii?Q?aJE6igQCNjugs2OF2thd7sdia0CpDq63l4pqlbc+AZFAD0ZqUXw0+X+0/zOL?=
 =?us-ascii?Q?yedw98o8wna7yGsUkXlvl/UsrI79l0NEt3C62zzaZ2vkvd/07L3/+AkBtwHB?=
 =?us-ascii?Q?KU1z+I4qGzMerjyJ1/5Ai+tUR+axlf+mxdOK60zUC07XOUFyfZaW1xa7Pw3o?=
 =?us-ascii?Q?QctW8OI5CCQwRII0EvZFA3X9Fwb5MaVpzTqGwHV4QAHDE7N0sFIDzNW4VQbt?=
 =?us-ascii?Q?dT5qOyacSrXhscEcD4FdXUXGpDBZ+LyUUDYVXylcpdcvbNCfRpG07WQuRTjA?=
 =?us-ascii?Q?X0/SKB487Y3MRNxIrBrcFhDvEiqlV2iDoUBfpcGduRb5CF40gM0PSBIJmSTV?=
 =?us-ascii?Q?eF+0mT9+ScKQUPuKc6D93uUzAqSaDS59AdqRjiW4u61ZCG6GT1N69Yz9wpzZ?=
 =?us-ascii?Q?+RaAyGJRuvdieK91W8wIQ7GqEdtsavXWqKn1i7xbEHUXRnbfigyC/LQBcV4h?=
 =?us-ascii?Q?cKWxft1aundF8EUZkE+bI4SVSuXKQcBtJ4ez/0jDr1vMMPh2pmQUAc9CnRYC?=
 =?us-ascii?Q?XpmnSDIgMw3DnPS783WKt93zt4uk2BOjCa4KHHG87Wi+iDM/vizWQOOqTQJB?=
 =?us-ascii?Q?3NEJIXZINGQOeE3sASQBypZkhgHTjrdJRMQzdQwKWwPprbt4DReTBQm4PTUD?=
 =?us-ascii?Q?JGLG/wcc9GewFyqZIMZAjsR76hfFdopzDw4fa+LJbxU7hcBWLEAqahPTQHJL?=
 =?us-ascii?Q?mczESWibiec0ywWithmPkZTdYZaco9MMdaw4H74Xf3q/LXfTs4Fpt5kUmpEN?=
 =?us-ascii?Q?erm2w0vjDw8WSO3sgY1VjwnfwncgNILkhxWqrRgempHxEqZhZKuRDyDXgytc?=
 =?us-ascii?Q?WqxrZw4dcFJXNgFRedLO9l0a+I+ROapeB3olerw8jdqEz+6cv6z+3rZfrWmq?=
 =?us-ascii?Q?k2y617aU8fKs8KQ8ZNd9QvqWFtqWKAW/l9Cl+p9mq8wWauJ521tsBV+7Lcv+?=
 =?us-ascii?Q?Mlf8LZPEJUxiQ7XkyPjeY8YVtUzrYJNmwPL3QHIvb3zvm9RWPR4Z79si7zF8?=
 =?us-ascii?Q?rR4f35sYfWkKd+Tz9fo7ERRSuG2tcdGYMVSMNBJ4rPvfAklOK7bX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46a0db9-3244-44fb-29a7-08def4b8a5d4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:18:22.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEl1dpUJPMeKKNSEff7dP82sbu1uCi2V/cdvZp3kdss7YwVyTEEXzjXLktbZwCrUcriTBN6MGiZ8DKXScf19JXkV5biLdpvh0iOLjLCakgtW3JTEb/wzMIg1V3jeuNez
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10547

On Fri, Aug 07, 2026 at 01:56:19PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
> was logged with dev_err_probe(), but its return value was ignored and
> probe could continue with a successful return value.
>
> Store the error returned by dev_err_probe() in ret and jump to the error
> path to propagate the failure.
>
> Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 7387c9903e80..ec2280ae82dc 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -532,7 +532,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	if (data->wakeup_irq > 0) {
>  		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>  		if (!irq_name) {
> -			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
>  			goto err_clk;
>  		}
>
> --
> 2.43.0
>
>
