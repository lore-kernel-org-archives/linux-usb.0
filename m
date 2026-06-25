Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013033.outbound.protection.outlook.com [40.107.162.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8E26CE05;
	Thu, 25 Jun 2026 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782401659; cv=fail; b=UWdzZtB9SVLTg2FXxrPpTbwhNI/hPNIdXJ2iO7fEdxdYNUFJr14RBeYodz0oPH5czDfSBcfjJpab/ywaYRLgV+aPrM8NSYyJh9mrWiqJ1oFIUFkuJZp3Bl01/nncDfby//DFzt1a85cVEwYRqvL2tux/rG5x4Llmx8bhJNZ16cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782401659; c=relaxed/simple;
	bh=09AO8o31fBj825PesDiwY0Rfa01+0gk54dPUr+rHdq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MbZtbwY0NwwrjUuueXpYIEimcj1k0a1cg2y1g8CnXDM2w6S1hbeCqunf9CSdhsxRTf+MN5ddr+BIZ6nIMVO2Kq7BJX1tDHFc47eHhpNOghI6GKFOFdK/qTP8Pev7DFhslUnh9h4SeinqXry89Kn7jvinTES26TBLT5+1TgjBVYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=g10jnlxN; arc=fail smtp.client-ip=40.107.162.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="g10jnlxN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyRIKO8aatiedyeZixfWWjQiY1PRgr1VccfbOBZkA0fKJm/gQWi3VW9TVFuIompUgPZSJxBARp6qfich+QYSlIuwXrBWQJ6efIP/X+cMPAnLok+JpCPbaETRBq3wn1Nu8wy2lkD4IIpMOXw5RI/RDVRe94S3ttVbb5ITa+b9HSebJTkQZZj1HCur4x1EHKM1JwNlFXJbIWHpwDzvQbr49x+QfG/jam3LhEFTr01j+3hjPfXjT2Hy/FU4Q8J/3SWvrrjE5ld2Py4NRyxFndWOwOd1SLAftF08Uuy9P7X57a9cyAd/lbyvRMalLbuPlEzHylUyzVzjRJH5xF0XiBpxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R32DdfOuRzv5AS1iH4OQvcnAYY4IGdWEp6OPjjQzkMw=;
 b=pglYmYAD0gVo9141fFd0li/xkV2ibJCv6cAZStgt8iJi6dQUbknmSf2ybUaxHaHpQRzvXOKoVH0lU8Xh6GvWBAgIjrMJC/cwLYFaos6rSUxz1VRtKOYI8/pbu+aUpNM7tC+VUPtx6zxq+xRpY2jB7Z/Va/lxJUqRakbwU0KyEPjpTo4aKLt1HY+AHpf354zknlid1/k93rn5CGeprBz5VOqw6SGAmdt3lh2TkVu+45FdpLSVx1rCmwWTjavpI9C3v88TbJEp1RPuMcVWJe6TTJh46NyVuV2fNkPTJ6dabCQpppb+TAyFGsb9jhFWYTsxO0C8ZgO9Y832XVGhc+cHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=iscas.ac.cn smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R32DdfOuRzv5AS1iH4OQvcnAYY4IGdWEp6OPjjQzkMw=;
 b=g10jnlxNhBGiaPPAB40zgJxIY/lWFFt68R0pAPEEWb4Y0zCqRADPKPEWnmmUrXMX3hiP4Ch3+QGKb0CJP88cnrXckjO3Fcg997xlkMgJy7vfe/vP7z9utbhwZoI0GXe4D+mNkBR2rdeBNMez3RSZY6KoPTNU+kj8miLxSibgaR7iq3ROmDnfB3jLtKXO8Uif0ZAxs08rqz9R3ynhkGCKNff8vucwxSU8KCpA1oDBLPElyF9TtOGMZWjoXccfkytewsx0Exj89yj/d8lqQostr03q/hrZuL1F/Fv/wX01HOdhcby79VKio9CVJ0i44CpxGAOpWfcVVCFHUrm6aVLFOA==
Received: from CW1P123CA0014.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:293::8)
 by AS2PR10MB6749.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 15:34:10 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:400:293:cafe::86) by CW1P123CA0014.outlook.office365.com
 (2603:10a6:400:293::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Thu, 25
 Jun 2026 15:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 15:34:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 17:38:49 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 17:34:08 +0200
Message-ID: <de784c08-2d98-4911-bea7-7d6c9298c631@foss.st.com>
Date: Thu, 25 Jun 2026 17:34:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: st: Propagate reset deassert failures
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260624055728.46078-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260624055728.46078-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|AS2PR10MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 28933908-cb83-4a12-017b-08ded2cf3351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PTkxu3lK630mTnWSfjI/oJq7dtKt3UYk+t3SXrb/fqrCtL9TH68IPt+pmij+bgZTc3nXpNYDsshy0iGdPQS0AAtVO34ABv8qUcy9XvRk+F9ApejYM4tr3q4k+AZTwq+bjudmVFRhkO5cLTkc7b7Y9U6OlDNnvH5jho5vKoONytwPlSk032Wn5za4AnK4PLdutUv8ZuBhDCkIjVOeb7743zHTbmM9+8/ylNclEd2sDs3pA2jOgEGVjSas0UVtIFPc3eKwmJo6GqEC6Qu9ci6gBKmqbzbGiWrlaIRn590QSZPv0iqB+L9wpr+hKtOJrI9XxDxSsJdtT62wH8TuFCnUeeERWS/U9LBSQXHLfpy3q8OCjS35vEJhMKER9yQHb8BD2M+Lg3RD2HG8ELJtaJtU1IU8PrcVVH+nK1Rct3m1PED0qamsJLf5gQ637cdNS6pasbudG2jbNTdcZVnDhRT1gsquqXQuNeJLGGkFaxbgBzWggi+JtrqAj/On6uzpCzbooDUUs2T56Vz8+atAc2MICa0TRKHREM1OAnvuYWe4cvCUZI1uF0SBV0fpekjMh76hpsyGQefoNTk9ghjcFGvgSJmzgRnRnYQg6arCfsqQNWLN1OuBsftZBVnBe2p0hrPqc+5qdhByyEa2KEYHcYitynu/8uVFNVjF8xNgacVfbwbzs30Ghsusv9rjuGTOdJOX
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p7BBTzQZdU6mcRdTQCgYzLPdgIcXR24qlrUCcD5Eb6a0kDToA8nah72KpJEGCEC6xa7AKE2TJ6nU5OT7QWYktWEj7eySrDqsmD/cMnZH/XNACgi3MWCOVd/nDVyDtQhNH9JhUom+fhocel9uU1DlgfMivq/8nSJ0UipuHxj/FuIHeN+Rt94iferQMB0NQX7jS4am+R3e6gkBDdn3pnlslAIrvgVF3BHMJFvxKMcwaOKjsgP98BU4UkOuumAGMqRep29DDsrpPnVZzPQS2NFZWKY+YKOCYERtM/E1htZbvQGe9KEQ8uiEG3pq0+3hykHlW7aRKoDK2VhnIyqZhJVr+AdsUB+pEzYkjfI/TENsA4DvOS0bAXocfjDAcN6gYH45ydsezHjQKnf2GIWc/xO1M+mF4stDXKf9QL9R9gNhec88m9gSWIkdU4VTd1atyBDi
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:34:09.3294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28933908-cb83-4a12-017b-08ded2cf3351
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6749



On 6/24/26 07:57, Pengpeng Hou wrote:
> The ST DWC3 glue driver treats the powerdown and softreset reset
> controls as required resources, but ignores reset_control_deassert()
> failures before populating the child DWC3 device.  Resume ignores the
> same failures before returning success.
> 
> Check the deassert operations and unwind the already deasserted
> powerdown reset if softreset deassertion fails.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/usb/dwc3/dwc3-st.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
> index 5d513decaacd..bbabfd933798 100644
> --- a/drivers/usb/dwc3/dwc3-st.c
> +++ b/drivers/usb/dwc3/dwc3-st.c
> @@ -242,7 +242,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  				     "could not get power controller\n");
>  
>  	/* Manage PowerDown */
> -	reset_control_deassert(dwc3_data->rstc_pwrdn);
> +	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
> +	if (ret)
> +		return ret;
>  
>  	dwc3_data->rstc_rst =
>  		devm_reset_control_get_shared(dev, "softreset");
> @@ -253,7 +255,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Manage SoftReset */
> -	reset_control_deassert(dwc3_data->rstc_rst);
> +	ret = reset_control_deassert(dwc3_data->rstc_rst);
> +	if (ret)
> +		goto undo_powerdown;
>  
>  	/* Allocate and initialize the core */
>  	ret = of_platform_populate(node, NULL, NULL, dev);
> @@ -328,8 +332,15 @@ static int st_dwc3_resume(struct device *dev)
>  
>  	pinctrl_pm_select_default_state(dev);
>  
> -	reset_control_deassert(dwc3_data->rstc_pwrdn);
> -	reset_control_deassert(dwc3_data->rstc_rst);
> +	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_deassert(dwc3_data->rstc_rst);
> +	if (ret) {
> +		reset_control_assert(dwc3_data->rstc_pwrdn);
> +		return ret;
> +	}
>  
>  	ret = st_dwc3_drd_init(dwc3_data);
>  	if (ret) {

Hi Pengpeng

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
