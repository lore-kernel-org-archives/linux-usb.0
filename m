Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D28414A0F;
	Thu, 16 Jul 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205791; cv=fail; b=r6H60wluQY6qiKYu/s+L9RBPAGWRKYKchrZbJng+3AER64QypTlrolOj5b1X6pZicDjZkA1aEsRYHnRzampjYYsh82/3vfE+SB+MsMjSgtG0GFij3vzQdqYkCUJ1p2K/GoK1n+9YpooHlb6+yPzemfsM5zLulVEwiDUXIIjxj10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205791; c=relaxed/simple;
	bh=uE/z1abLVCxTRDUI5r5QhNa+5B//f6+UVb/KMK8rgT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sZ6vrJQOazffg1SmqSDOFlQlxYP/E+oVcxTFIhmpKghn7reB58uC7xmS1cGyQnYqERKHrWO3Awf+cboHiQHNoxFtO6HjeYy3OQo9qbKl6K7nJGroyjeMvVh7O2LFr+KQX+OXTBhwR6+r6pLCe8RDB0dwPbasqSEKs5NvkE5HfFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KuFLD+4f; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KuFLD+4f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUVsOm06nEOJTuaO2CiNarO4jF8SmY2BJNRH3lDGmaZFvsaZJzjhig++U+aaNv8+63C2oyG2eBkO7uLQgHOcQGLCgZf1TGJ7ImecETtQDy/S6Ihbh4dAo6BeUS43eqZpcaH1AOyIiHUztRJGD94snNR75YaBOi0Suih2Xgeyf+5/wSQuqJNwPPP05aljxhQt4UAM7uS9Spcv0/3H+zDYe886TI8sNh4t+Ined5AW/LxgniKukc5CGmo8EhGJgooWSgyn9je3iu3liKH1J455prsok5DYiLdycsCTf+yleiiYGFUMp6VdUG1wJbDIlp+tCkA0kcbUA01Z5dIiRIOXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv44gTJtzfzm+50jzNKS9Hjn8NyE4asMflHOQsFPwUs=;
 b=jxteGK0JVErxaUs/nhDTLm10pHwrNP+Dt687Y/DRIcGZUyus+NGTcVroKI/PMLzCZbMt3LkdiLjmTHNsWFXPyakkc0UPpumW7BauYL0N/Pba6fJE03CyMKDmBAQOa+PJYYTu9RwjPOMPnGYmK3CKxP6qtCoKEiPj/imU/19b7OGa/nGOJwQkmHGwm3ZsHUPn0N+NqUQJT/hr5YXaO6xvu04QirMcsKRIzL2EbROWQlVcvXWkSj4T+R/OdSO7gHm8a3N3XLPHVH5OWYkCfOxpu1ks9wcbHGFsnyKRzrCVc0cCvJIAAPRbn7VP5TzNXinZuhlfQcb6qBgJmh9mpVX4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv44gTJtzfzm+50jzNKS9Hjn8NyE4asMflHOQsFPwUs=;
 b=KuFLD+4f5C3C56kU/oNYkFuzQ32DopDf2VqyOKuld2Rs8JKuJ8RE0gLNMXkOioAdtz3NFPrbhx36ydrfcc8nHuBSadn6WlZFHY+uAEjy7Zwf8jBFzOmRR7phhFnCegx2+mSr64xzLWzDhfDKhQM8ESAuHrGi+bEfpbI5nuP+geh0z1jTJKSSl4KwGkAkh80pbylDAnufEir7Y2HvZZmGT9I95vbJwPj16zRXgN+eZpRgLHTh/AmeIuwYpez7ZF3cWZXi35D6ITEuguyV1uuH1fvPScFWyUot281GbhJywu1ODHMcqnQFBaxbGQYmRDYi3NvPyKDBIXNzdbnv5aJxOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10741.eurprd04.prod.outlook.com (2603:10a6:10:581::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Thu, 16 Jul
 2026 12:43:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 12:43:07 +0000
Date: Thu, 16 Jul 2026 07:42:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: fix usage_count leak when
 autosuspend_delay is negative
Message-ID: <aljR05aAspEK-ksA@SMW015318>
References: <20260716104126.2763454-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716104126.2763454-1-xu.yang_2@oss.nxp.com>
X-ClientProxiedBy: PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10741:EE_
X-MS-Office365-Filtering-Correlation-Id: c152dcd1-ef04-4ff6-c586-08dee337c901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|56012099006|11063799006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Gb8vQLE3iGY27oniKbjmHGg1GAgPIP5OsAO5ppiWEgN8ET9QA8ZSKt4gzqd4KZspxigttedJCfpYSxSyOhN1CQiFgD5wtCl014UymsAqyMy021Cd00GbKGFGfgCkz9CgBTNdUJOJQlldXV2Mb8TnnPcgU0/uHsOEs6gxJs+thH0SuGCtFz4J9t2XmsSrHPXMmk64ymYNvWjtd7nOHawdDCql/gpyewSYwWJ6ix1q7gGxiksYC4lGJj8h1BLfbCFEOp4eqekvWjIpyIyKEV2VmVKx11FXYKcokAVzPsEk+JscZPPCrXnV5r1FMOIkr+2VE5/UhPP0c7+gadV1IdcXkdaWjFS2oCUmAdvHEarVGUtQA+x38r0oQEnHlWWrE0p9wOqOc2UyG9YQ2j7y8mNpQk5CEum/+OQwMMHEcxGidEKSqJbHlShf0UGiR6NHlf6sy11dOnoq3oYgm+HnBFQX5Xp6qWlpk6O1nZ4l0jr8jLNjgc5R/KMgdpFaE+ZE0twQ4F6kW0xEVPPTVd0dTCKEFbxXv7ilgKJddGCmThZQJDaHrwb8K9v7P6r1R4Y9lqq+4rC9bmImri4+wzepbCcbaTLbKr3TTWiXVol1Wogy5Vfg3Hvo180dEWTqIxtLFYX+Evdy6Qlfug7cmwzWaSvMzP+vqEPKEqlT60x2Y3brOjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zQss5Gm817kk3K+LV7FgWX7xW9fmxwd4x7Q0rvCumH5NPEivYGtHp7vWWZ4z?=
 =?us-ascii?Q?mmSE6scoH6FD5gGmcShLaIWgRw3S5k2jUqTYwxSmGcKrpX1PbNq8lW6EqJWY?=
 =?us-ascii?Q?5r706yDibzYUatmX2dk+Od/+Zd4UdMrui656a92qoE0yqisGxIBHj4Y+TTa2?=
 =?us-ascii?Q?hE11cNLgwAnPQE7D95eCLO8PiyUHINhWrAALpk+23BFgk1wwiL7sQNeB5Ep4?=
 =?us-ascii?Q?UGBzZu2fXFawDhg7xhQ3PBx4NNxbgfjC5wN2mTVsImovWbzdkPDlifbJf2JI?=
 =?us-ascii?Q?VBzCa8gY9ALw7Ho4ZxUM9TPs0fOn1QzZGPIhmZzZJC8Mrep8oTtq6PIEli0L?=
 =?us-ascii?Q?4Ip3pPUhHQHe4B5uZB0YqsBYsAjEfRU1W6TxYp9lTHoS0zcH3gYyi8bbRUSt?=
 =?us-ascii?Q?pMEv1uMWxGCUltorJjTWwdiGZSi86TW8RZCMmzAKWRkoZhrCc15KYFUw0I4B?=
 =?us-ascii?Q?hoHxk3UaHzTVavqbeoIAtKsL7HgABH1FRhHoqx7d5pwGzN4CF/Sx+2fnvTKW?=
 =?us-ascii?Q?/nn6ghAkBifQyr3EnFAvs8QnmqeGl6vvpiANqXw/5kZp4PK8foijutcxTtWS?=
 =?us-ascii?Q?tpV6l5sbMkrieRxyHu7q9/a/7Y50ZjEEWhW8fz8yWNGLKt/PvO1ZSkQHczUz?=
 =?us-ascii?Q?TV4WgGX/1nheWUSnvt90rI+iHUA5UghV31DU+klgFmEXDKcH3i/8L8vk4kaw?=
 =?us-ascii?Q?j0dnfvO5rJd3lVBBfDu6oK1Pp9J0pPU9mdsyDMIBmRsEvHXHZVyrvpaAe/7M?=
 =?us-ascii?Q?NPyCucNBGxoZ+J6n7sGDjZ8wW59u+nCOxLDlt/I7yJExlTupsm/RhiTUhdXz?=
 =?us-ascii?Q?1YUrSxcXP/UjieT1XhtV1bIeXEMZ9dJ+njtYBGY5OaQnnCljaCdiJa9+XERw?=
 =?us-ascii?Q?pC5fA849VdYqiH7bI/Z7K4fT+U3YnLWHwIA8JOwrw6cfYbJkZOuFe0QlKTxX?=
 =?us-ascii?Q?qM1pIMZmPj6GWYzgaH0RZWREgm5CUr0D22Hx+ePNvuuizAiRdkA0xzf2sRBJ?=
 =?us-ascii?Q?YX1xKnCY//3nXskoE3zPN4QLmPMTqi2EOSdSkLibZ9F1ayMd/QCp1cls26Xg?=
 =?us-ascii?Q?kE7EvKDCrG2QJ12KhOO1gBqFVfwleqYLochroNCUeSUV+FtwxLwIDhO5yBmI?=
 =?us-ascii?Q?bSznq7vJGS3h+z74Wy6IwlH8ko0hJ+iI4Uuwg44DtXCYVGQdkljPv2jH/3su?=
 =?us-ascii?Q?TSMRW8CphxtS4I4NagrtSezkq+spld6cUbZk2/Wma56uIQhgzqhuqMLXIHTb?=
 =?us-ascii?Q?e2rrS7oPboqBEmlQFQh73uQtvCnkU6ESOUSAx5SbT7GjsbvyRtiz9KVjiPJE?=
 =?us-ascii?Q?Ads9eQYS5LAJzhaAfo7Xx8tb2P2YUUfSSt0K4v8KBoN4qUNrY6fZqdewNe/5?=
 =?us-ascii?Q?ZIKSZX2IlFGdTi/z3WCp7oBgYTVYzaS1imbHRpRFDlduDr/FI7hYDTVKSWvJ?=
 =?us-ascii?Q?5v5JaG8hD+WhkcsOoXPxKQ11NtDXwsRRVdw0pIUa71sSdmOu4XEaqAwyp5mD?=
 =?us-ascii?Q?JtJ+MX4s79oYiaIr+WC8BT3dVjzex0MKDjfmphLahhLX7tSX1Dw8TQvO0NWN?=
 =?us-ascii?Q?bO/VV6dBzRsv6tL5iuzuBGBm1h7DfcpGODhx91mygZnr27c2ARmVkvgkVcIz?=
 =?us-ascii?Q?MWhB/5dIqvm3TIltDh3XJGyCn7e3FkBSAp1YqHn7hJvS0VKw33Qik2BWSOdD?=
 =?us-ascii?Q?7I0/t75Nga/5l1qyORNzKylsZLboDndskVuAjLGcbyHvaDSQ0bnuPEyRZDHO?=
 =?us-ascii?Q?9B0JW+7dkfGjR99dQ45bATuKVgPTbA9rB79ESao8RmcQn/IIPLtB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c152dcd1-ef04-4ff6-c586-08dee337c901
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 12:43:07.2010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VGjw3l6vJa7N4Q/gBZtiuVTE0RczonJ49w1V+9GAYvp0UCsvWyKK0IZHh0C2C7eQ6OZsyPoWPXZZFLtxwMGWDVpe43urF8J6Vkbu78cKaw7Irm6vrFG9ip7ha3ITZFs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10741

On Thu, Jul 16, 2026 at 06:41:26PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> The probe() calls pm_runtime_use_autosuspend(), but remove() does not call
> pm_runtime_dont_use_autosuspend(). This can lead to a usage_count leak if
> autosuspend_delay is set to a negative value.
>
> The pm_runtime_use_autosuspend() also notes that it's important to undo
> this with pm_runtime_dont_use_autosuspend() at driver exit time.
>
> Fixes: 1f874edcb731 ("usb: chipidea: add runtime power management support")
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/usb/chipidea/core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 7edc512cc37d..3461dd763a6e 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1250,6 +1250,7 @@ static void ci_hdrc_remove(struct platform_device *pdev)
>  		usb_role_switch_unregister(ci->role_switch);
>
>  	if (ci->supports_runtime_pm) {
> +		pm_runtime_dont_use_autosuspend(&pdev->dev);
>  		pm_runtime_get_sync(&pdev->dev);
>  		pm_runtime_disable(&pdev->dev);
>  		pm_runtime_put_noidle(&pdev->dev);
> --
> 2.34.1
>
>
