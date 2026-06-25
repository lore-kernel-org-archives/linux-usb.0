Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011028.outbound.protection.outlook.com [40.107.130.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3633D9DC1;
	Thu, 25 Jun 2026 12:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389717; cv=fail; b=qJDumCMrXFhksR/YZOlLw0GXaKcJzzWTIZJDXCU5Wmc0fJKw3rNt3P0KhBLSNynq5Tcs7ypUSoSwH8FD30O8rIG2LHmLjHmra3UdJZqulT5fWZnv5JwB5h5mDJVP5atFbR/F2PtVM1S85R7wfATqreFufcMDN5xoGkWMaqshzoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389717; c=relaxed/simple;
	bh=0S6FRWGEWR/YQCgS9WQqS2zI2X5X/btb185GPND8Byo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZSZ5BndXrHYPs3OzYJGzgRfRS2sstg45pPkNK1YjvWPkExHUNdN2C6SAyaWaHjcJYzj4oFhTC9z4PPa/zLbZkY9jQU+4A/RtoKH5lwQGTHBCGb70p3cLJBY7hfZdcM1me0H+bo+7BTiC+5z7xChoS4WZkO8idZXvhrXoyiB9FAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RaOUIlM3; arc=fail smtp.client-ip=40.107.130.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RaOUIlM3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpJxd64SmXixCBkDuQmLmzVK919ZMILIJB/gZ6x8BrxcC66GjDwPEFqqlsjSylX7+4i3Pl9sm61ACVQ8p8y4MErx2yDsqit51AVczN07dUM6x8cupJGEbKUOMEmE+bG9YoobuS/TBdk7DN/vFAB6DWJ8UCpoh3fv867gMtNBA8bFAKxPo38+cLgUfapzIkH6DkMguxYOexi9fYMU7D3pKTHT7ATXF2S+O6JrY2aL7sBFqyX2vUlHRAMn9nHDaY0o6NsMqZ6acDuQdy2elOoIAB0GhwbfQKu9lsyOja6Pz1354yubSd92tEZLYht/nywauNpVfq8W1u3Rfp/Px976UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TU8JgADKEOZhVtks6Ab5jjQ0ukNbbOoV0Yxrf2+w2s=;
 b=pUixyVrYcCg0FoQNoq/TQOnyUToZVgAuAaJgRSSlQnpJ0f4xSQ96r7i/TqLMXP9EGC29uWBB6PPpMqPn4IeBX2g3m190o4qcbhaYWdrGzvvaJvqwYKg2RK+ulw1PRIWBS39zbm8TsNyB68zY0NVPQDOco+dgT5Ea2MozC32lDNvBFibiq/FUuCt6YF9AvDmH+Nf5bCjwUF2m/l4KPkLpAxbVAy8VRb8mtCUHbCorvKOzOCPoLYpWhazcBelBJsAgIpRcr44+rebAw6gHHEAA0fvk29S6VWPupDrDTNRTSMXbp6enVkxq7E283dQIsnrycUeecQsiQ5wp/X8qQn3i7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TU8JgADKEOZhVtks6Ab5jjQ0ukNbbOoV0Yxrf2+w2s=;
 b=RaOUIlM38BNmLlgPRNKayFAaTuHPdBJCH5uo5jjnm2DXRPRvmiLyC3W8KZv1ZImRkE2No8Und3cPzFdhtp5u2SFRDKWlklS7yU62B7kDfUtKMUp6/VLxZ5mxsYjVZdPRuZ9sdy6ejswjMPr8IUBQa1Cm0N53/heJXiUNWR+cZTQYmlW3jzWHl5Rk4crM+/qjA5DnvNNQ+o6tnQhs2juN0QZQLNrfcgRrMsIrGrh3SAZgI5COT6HHoNqgEikfV/shQub0HxT6hyQqIBiXcdOF+RJa0LaPOAJ1fpjNRjms45zcMcqW9cPQwBwmhYQnhohLA5wK50gIDPUUoohzDZJ1YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10543.eurprd04.prod.outlook.com (2603:10a6:800:25a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Thu, 25 Jun
 2026 12:15:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 25 Jun 2026
 12:15:10 +0000
Date: Thu, 25 Jun 2026 07:15:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, kees@kernel.org,
	christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com,
	hataegu0826@gmail.com, balbi@ti.com, andrzej.p@samsung.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <aj0bxBVuPPbJrqVi@SMW015318>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
X-ClientProxiedBy: SA9PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:806:24::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10543:EE_
X-MS-Office365-Filtering-Correlation-Id: 15044e50-60bb-4df0-e7ea-08ded2b366f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|19092799006|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AmhuLRx1Gdd9ABc9NWl+hEz7sl9IXZ0r5A0bvae8d/ZGkNlvEpBLa6aovPJ8z6/siL1Ymol9r5JcnCV70KOgrnfilD+R6HOgG0KceOyAN0+s3KIKxghVvR1QRe9qNID0Z4oJpV1wkJvVDVA7YduaMrIggO9MySBawgRiVyXYLKJrkO+mHKSTq49C9BosxRclLudyVUt21So9O3+bt2WPXHhNOM/EzoCJRWLONXoLalpZgUj5eDsLBtMVoskinfUsuVfo8rd/L+HoSyh9BeqBKZwOqg5Db85iQYMF0z/UgtbRB6TiYuLKulWLDTkmX64WA0MH1dunbwTaw0m1KSFeqFpd7AMY305QZ8KqYtVxw97fr0JdsOJN28sqX6HzkkX3DhFa89LDOLNwCmbhkURHk0G2P7gUW+p8mmYExIcmx1kAlg0BXmqhecv+JOXXJ/m6jybfIhH4zxRrvevF87i19mvF9UTq+WoM51WxWswjGzoopEV2tZviYXNAay2RzmPRgAg/vPdhecrtAVYVWOdq72wCUhmz4URHHK6mYtK9FbU8PN1Zt0ZVBS9xv8izNgeENA6WZ1KAyBgdV0kgT6VwSz50juUDoXDqB1y9e/9HuCOTYAN8djX801/eVBuP/noNQ+Mr6GOE1GRKxa1v0nvZsNdh6HYDrm36EJde73cXXmg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0RaUzdVTDVyNVNxSEZCMStCQVZDNHN4ZVA4UlhVTGtoM3Q2dUlXSTNYR055?=
 =?utf-8?B?Sm4zQkcyT210clNVZWIxdXhNdzA5Y1BBSTN3TmF1V3ZQd3JwdUlEa2p2RmRx?=
 =?utf-8?B?VFo0THp3c21GYzhINmZQN005OEVHeVJZdVJrWkgwcHk5RWVPMjBqbzBsT053?=
 =?utf-8?B?NWhFTFhFcGo5RGhHeGdlaVZSU2ttcUtUdy9WelZDSjhxTldKOWxSUnd5ODhN?=
 =?utf-8?B?Q1QvQURwQXluQmpSMUJHeGhGSEhwdUhGZHVXWWFDa2JHWm9TeVgyL3JDMHZj?=
 =?utf-8?B?ZVlCMkNlSmdHdFNpNGZmOXowSlY5RC9HTnN6ZUE5c0xVekRkUVczdjZHWG5Z?=
 =?utf-8?B?ZGNJakhDNE9zdEw0MUhyc3E3N2phWGJlOUdKUllwd3dQSFEvaExRaVhjemVr?=
 =?utf-8?B?a2IwN1BESVQ2ZlFpYjdzdXpoNWprM2ovU1ozbWZpL1R1N2hUUVhVMDZSNS9U?=
 =?utf-8?B?WDlVcVRoVHBYcFVyOUs1c0g5dExCa1I1N2hzWlQ2M2xFTjhvRWJSNml0Nzda?=
 =?utf-8?B?UDhQd0M2Wmx3elhMSW5veHJDZGorTkFsb0hMS1ZaaVVZYUR5cEJrUXQzMWpZ?=
 =?utf-8?B?R3hqdFo1dUJTWDYxSHA3cmNFKzhJUEhPelM2MjcyeWRTaC9yeUs0TGt1VUhM?=
 =?utf-8?B?NCt6b2JIT1ZIK0lhRFhORENmMlJHT29yRnJQZWdJSG42OXE0YUFtTGFSRGJ3?=
 =?utf-8?B?TjNQTXZsT2lyZy8xRElUU0NBaUVJZkFTYmVyNHhsZFFFU1h1cG8zcnJyMTVY?=
 =?utf-8?B?V3k5WGRWWStsVEkrdmdRZzVWNzdxb2JpUlBuZUNIaVJhV1Y3UXFTL2FYSGtO?=
 =?utf-8?B?dzE0RkRLZkk4U01DT25hVkZ2SjNydkVOMTh2Nk4xSDBRSHZielViTkJua0hH?=
 =?utf-8?B?eFd3aW9UcTNkTWdiRDlOSTBlSzBRcGxxQkR6eTJCNlVKUEExbDBGanovdjc1?=
 =?utf-8?B?eUk5elhHSW1QVzROWG5xUDVJbkNmNlVwU25wUkdnKzY0MGMveFZFcHYrQzR6?=
 =?utf-8?B?ajJJOUlNRUNWeUtROVpQVzVuL0VoU2FoNVFUeWUrQXFoNjEwYVJLVVZyT04v?=
 =?utf-8?B?dW5na2loaHB4VlA3MUVPZnJyeWQ4RVBkTlBKTURwc1lNdVhtUzlybDZtTm9x?=
 =?utf-8?B?VTNOMmE3SkYyNnBCaGtUSGE1Wkw4RnZ5aDRPT0lheWlkdkpRWm1CMTBXVVRO?=
 =?utf-8?B?K3hTZ3Y3dnUrNlYxMHM0K2ltaFVDcmYrSXN1YlBWNjI2TDhJcW9YM3RaTlpv?=
 =?utf-8?B?cjh0VU1YTmhKc2xNcUxPcVRCWDRhaWg2VTJLY0hsNDVCQUhGSmx1cDVJVElk?=
 =?utf-8?B?Z2l3K0lGeFdOYXpoWU1rUWRQS2JWdTRyQUFVWTByRXMvN25GUUpWcGI0OGE1?=
 =?utf-8?B?MytjVWNmN2hVRGpFVU5HN3R0dmd2WVU1QS9kNW9EMzVEQlpPd1JhUEZHeDZJ?=
 =?utf-8?B?OC96c1FkSjlNUzNGTjZCbWx2T0Y1V1l6ampKRmZGWG95aUZpMkRMbmtOT2hw?=
 =?utf-8?B?cFg3dHNZZFNJS2xaRlhONTJKZ0ZWRUNkN0ZZQlY5T21DVkNxSzV2cjNWMEpx?=
 =?utf-8?B?d2h5MjdXQzZBUUxQM29VeFBHdkZGaTJEaTZia3UvYmNMdThQa2x1dzk4bWVh?=
 =?utf-8?B?dEtiSlpHaXU4cGZNaFNLZzMyOUhrV3BKeWFDVE14UXJTeTFFTFdRTUxwenJV?=
 =?utf-8?B?QjZUZ2l5eWo3QlFxVnZuQklCMUdOKy8zZ0Zoc3NMQTN4K3lFcm1QOTRyWTly?=
 =?utf-8?B?bU85cHpybE1XSlJkeW96MkdsditCc3FlR0lLZko5RU5uRUZxejBLWGVIa0kw?=
 =?utf-8?B?NDM3a1RMeTFOQVBSOFVqOExWVW5YVGVzV2RDOXZCVWNtUkhrckF2Unp5Y3VY?=
 =?utf-8?B?K3Vlb1FnTFFHdE9MR2c2ZjJyYlV1TXdqQlE0TWt4R0ZZZnhGOGtrL1VHOFhE?=
 =?utf-8?B?NU5SRjhabjNHbDFzYzVYQkFjOXh6a1hqcHJ0RmxyT2lOMDRnUmcxVTZtWlo1?=
 =?utf-8?B?OVNFbCtSSTNPWm5iMXZLcDdRcStQOGF6amVlbnNmUVFGM29iYXhQT04ycHd1?=
 =?utf-8?B?UE9qZUZKZy82UXNqM1BTLy9wTmFGTUxUZzFJVmk1UVlnbmoxalM2Wk4rdUMy?=
 =?utf-8?B?TnFqWEJZektBL3duSitoK1JJaWtrNmpVYlRCcGJ2Ykp0N1RXbVNhTUoyanEz?=
 =?utf-8?B?WkJOQXoweUpKS250bk9SSVRGaWNYRjdRbzlEZVAyZjlmb21rQTZPK1RQNTla?=
 =?utf-8?B?RlAzSkhHMzVnUVltdU5aNUNjbTk4eVNXKzhMOVNNS3BYUm8yKzRYY09pNDRx?=
 =?utf-8?B?MjVBdUFvMEZucWtWWTJ0bzdOWkp5dTk4eExyU1dZZWZ5cy9Yd1VVTkVPSzJm?=
 =?utf-8?Q?dcF0NduxxebSYpd6ItJJWuavWvFFrVlvvm3/a?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15044e50-60bb-4df0-e7ea-08ded2b366f7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 12:15:10.4199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3uxDM3aSZ3JiF/2qR3GKXXqgwp85VDQp/l0iiLXQ6go9PsKKY/Gfm3+0ii9G8x8EBlVlTUB+QoqpQtwLGgg4C+lAefnwr6McWBR0icT/KMK/Lb1StkKFuhx25DtEhuN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10543

On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote:
>
> From: Xu Yang <xu.yang_2@nxp.com>
>
> kstrndup() returns NULL on allocation failure. The condition was
> checking 'if (tmp)' to detect failure, but this is inverted — it
> would treat a successful allocation as an error and return -ENOMEM
> while leaking the string, and proceed with a NULL pointer on failure.
>
> Fix by changing the condition to 'if (!tmp)'.
>
> Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> index 5d201a2e30e7..e9f2632ce785 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item, \
>                 goto end;                                               \
>                                                                         \
>         tmp = kstrndup(page, len, GFP_KERNEL);                          \
> -       if (tmp) {                                                      \
> +       if (!tmp) {                                                     \
>                 ret = -ENOMEM;                                          \
>                 goto end;                                               \
>         }                                                               \
> --
> 2.34.1
>
>
