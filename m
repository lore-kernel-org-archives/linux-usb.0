Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4338C3905FD;
	Thu, 30 Jul 2026 06:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393701; cv=fail; b=HB/Ld4Hor+79yHQ7sAFHyfLg3rEI5W2bxKtTUxNOftlpgi1x9OxawUgkL+C7hKsQ9MForFltgo+tbWVnMSzsowIcfdC5ZxCPwKk3pbDCrqzjTtHUZHb6D6ZQSbn3ZJNlwAEXwQ1y+RCfI3ho372mZuytHZHRBX9Ht0XJ5pdLK6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393701; c=relaxed/simple;
	bh=/SiSbQr9/thTFsjQ9PMagW6VKPmhyHthbocku0Qf/hQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GR+LFxAPQ4cEBHGEntNDSmMGs+ZP8KYOfKnanjn56MpOusHcmpbbl+Cz56v/qhmNcAiXEgQYW2lRoAsVy211rQDotn9NNkgzBkGN+IqK5EocR2kIkALNcYowIyGDDQVj5CvHuYffrwiPKCtHzAoW+Po+vKFfI1rH4UTv7T5qD34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LjVDV6Ph; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LjVDV6Ph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ip2sPYq6hby3LpOuE3RUEiU4NHJIQkp5whNziNQsD8P/Up1ZJZdhStBrdETk2kJ0VajjIYi7HlRVD886b3SA5jrRy8lcnXdtBRyHHIzNocfibsIdzg/ekd+f15FA4M5ND71+IBs6776gGX3vFjmYlrQJ9OD9lvemSKS18QrqSaCEuHiACO84hbEZxrKfHt1vkeBK93tAQMEwdPrQH8MYdLGxFXtyf9+/gaO7RJopxh2SC6yFCBM5be0gNfOltoibrzTzuRIzoGf054yfUEYG+9zK8s53G7ceZ/5vdxz7EfEdzwzBv2vFJa+V/DfeHRjwEnNKv0uh/6Lmmhu6qH2x9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6Is2XZ+gr6GOsGtnz5knL7npCRZFBs2sDyhzzyDSpM=;
 b=dlCTsZpGZK2xvv2HUJ3Rh9474vMsRClvr2Ft20ApovD8THOgsyCObEYusVOWXhC9Jacv5zyGUFtHaAHPDwpzrj0ZKwyxTX+y3Il3vK2Kn8zI7UpJZ/WQN1RS+iW0dHtM9vuYWlWiKewC7cy+VisCja1UZStLbHkXVCoBP6pSwy06B9Mp9mBHhHMsqIScEyXa/AJKNWq4Bruu0M6yadaMYk8fSMzyB4jRfhVFy9eAtZUvD5Y839oMd9uRWkp0HS5wHqgkiatvCkETJQb39Luyn1xJ+yyht/G0APREdlCK0rkuCRU9bRKo6RPMTId+f3LuhOzInTzuMw7l/0rmdjONfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6Is2XZ+gr6GOsGtnz5knL7npCRZFBs2sDyhzzyDSpM=;
 b=LjVDV6PhwffKosG75scLl5jQdWTSvceNNQ+H0VKH6TeHWdMrvrOYN62+eTO3u5IYhv5CGXrz8WnupL8ttt+H+L8N0cNC0A/yoj3rnBcpRqsO7izI+iDYcrGa7W5jBJtlAyF/clXect14EwDfx7RaGKWLQn8GBFnUodHX/9F+BEfqEMGvW3D4Y+Lzzf8xJ9lmdB5ZrRUOHoC1GfxiZFXO4Cs5Q/5n81mOJQZqDmwksM5ZgllSvHRT3myWuK7W60LrCgtuKqfkQcTlDTa8tUyIZyaTzJ8qstqoBEH4sOWO8++iHOm3+k1L3g/XPlC0ObjJ+LploI1rEdscf2RDT3ycoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB8655.eurprd04.prod.outlook.com (2603:10a6:102:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 06:41:35 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 06:41:35 +0000
Date: Thu, 30 Jul 2026 14:40:04 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: gregkh@linuxfoundation.org, xu.yang_2@nxp.com, Frank.Li@nxp.com, 
	panjunzhong@linux.spacemit.com, kees@kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com
Subject: Re: [PATCH] Fix Null Pointer Dereference in uvcg_video_init()
Message-ID: <6qgcnm4rvqwrfy6l5kksojmd7qhjhr6at6kcgyuoyppfz3zmnv@x3nj4g6ggeaj>
References: <20260730055705.13784-1-jeffinphilip14@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730055705.13784-1-jeffinphilip14@gmail.com>
X-ClientProxiedBy: AS4P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::12) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: f50b9881-cbfe-4c9c-ae53-08deee059977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|19092799006|366016|18002099003|56012099006|10067099003|22082099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	gnVy9l0z/hh4aqV6og36SVgGF8vneGcgpb6jdeiWdPHzKSYwSWw8iGj4xcdEHxrpvAd4ayzzZFVNYnWPuaFqTuGBzRb8hlSiNLI7NUsNSRDVj87oHg69x9ZwyX0Ht69H3e9D4TTprtPLt0/kWv5Ya5jyOf5Acfh6d/2yZ9zHGAynF7n2/M455GbBJVqz7sYHKmYQadlIGDERqtCqfh0PYhfbm/4cMW6pxIvg9RmlKEqd3zGLWjqVu8323kiFRjaFX7fs9m5zfOkM4a3QmJ4Q2tC3gxPBb5Y3Kg1u+ujkFa34ntQ8E0y50k81pASgrzMrkumYX9OesF996vaU2xbjdiI+EjTrmMlLWyQD2DRXrdNVIYPRMtekLTuJTeL5owAk44KISLemKz+2HUzSd/+389bSruy/t8wA193Ge0gvqbOxvYy9LQ8XUEMN7uomrIF5o7gIc7ijSCzHbY1duFemEmeXcbaHlpLTupM4Qxe5GWRPdUDXnr/12WqPLta9Gc0xpD0AmUKZ6Xd9Bg5ULNiNbvlQ9ZZRET1AWhXlvy8x3a6Y+p6aIzdTYcEZJY77MyyWsjKoWNxET5v5E1Hq+Kt/HKdFZ0LPsZ9WJZJArY24s1Ph5EwbSY9YazPWR/WWhf9Q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(19092799006)(366016)(18002099003)(56012099006)(10067099003)(22082099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m/X6R9cpgq9/LCvSpIBwyaDthBbDkfyf6pJFW1reEbtPB5PbuRRVK88ZsGEo?=
 =?us-ascii?Q?CAfza6Arln3aiBk70pwj3n5wC1ub0NI1Sn4uSSHxd88zqbCWcg4rC2JvRknO?=
 =?us-ascii?Q?jbTd9HhS4UyquBylVlnba75fOnAEteW0tUMoTp7rjxlOmfRgOxCFDi4laH7J?=
 =?us-ascii?Q?U5iUCCLVAelZE7wTC+2tGvI08rL1rc9wCD9pWgtv3C7UHtnBqjwlUpsi3sNS?=
 =?us-ascii?Q?1xqE4PBP4EYYhsC4tYUmvccerHSo50DHn/VIERfAIdECuzl6fU4zMRDpo+TJ?=
 =?us-ascii?Q?yijqxMeklZupPlqCoWHDGAS1qPSzqvzwWhgMjhJDtz/WA0L1rV7mtgQogeRq?=
 =?us-ascii?Q?235yg+V3C18P8B2/ctM14trpX1M4ia8+WGg4HfQqTAYcTFCRT7/5toLZtfWL?=
 =?us-ascii?Q?LBmbgOxMU+JjUXGL631gxigLWjP0obPwqjIHkDsNYXvUtYXA8f7Pzx6Kurxs?=
 =?us-ascii?Q?AjKLES9G+0Zr5Mpk+2peX3fryH3pu6FURARxpC1n2tGaa/SeEG1lZUXAGop+?=
 =?us-ascii?Q?5GEgk4MUuZjgZ8Uj80m8Xb67WYcZJALAgNWwFJGHBcOiTfmSdvq+XC0+R6PN?=
 =?us-ascii?Q?f/jSAVNvLXN410kjYv2eGf2ZqqBDqKAsk7hYGeBzuUzli9/Y+cciV3zOik0K?=
 =?us-ascii?Q?+jNGUBYiPjTctItmetFO78gAgHG2xuvepzIZXnOGoTxDSw9lDqKteHH2rTwB?=
 =?us-ascii?Q?NZfJ1cOftSAKeWkTfDr2HKogvTMjmcuAwma3KzgvjL3E5xjksub3knOslBzf?=
 =?us-ascii?Q?P1xfL+fhTsj/+UvI1bx1LvD3x/cdXDjk3XDSSL3gNxDo3w3SUySCrV2Pi3Cz?=
 =?us-ascii?Q?0R9U4IK7YY1wSWanGd7Ib/Mw8mKwtQoeF6zWuWoj4KzlUl6m96YK/QbM3/xn?=
 =?us-ascii?Q?dG/ldZ45ZnmI64GJ27iDlHBZ9g0IHfmQO5nmRC4zHExCeacjjpBIX/IWvvEa?=
 =?us-ascii?Q?91Vc1FVEWXORLThNfw0Mh+dWiGXTVyE5Cf5qYlyTsxUh3FR0Keem4IW/7p/u?=
 =?us-ascii?Q?/NpQXm5MvsgLCFbameMGBiVTgMXA0ImW0uoXdilnrOz84k1W0nndMMilLko1?=
 =?us-ascii?Q?IJFzockpBwVWlPYCCL2zTQkZP8YcmuA5LDtcUm3A1As6MymbYsVIdnYeU7GZ?=
 =?us-ascii?Q?sCuagVYPZsElg8iE8bp7VlDlYZyD0ED+9W/Z+dbdFIAoIs+8B1F6RyTzI4z3?=
 =?us-ascii?Q?yhEDs7BYB755Zo85gJEnmm/OqAzw2PVk2t1tPFDzVLf2ZPzuzE6+PGg8k0aF?=
 =?us-ascii?Q?ggYv7qfQ4ddg4ikDXZd60Milz2Q+ge/1C1f6nJE/RJj06TdapXeM/TmtdpMU?=
 =?us-ascii?Q?L00Sv1nLFUELeEZA5YtvL9CuG+jdvayuUZW6iIayWKTRQ7rQLxRAcHWb6mbe?=
 =?us-ascii?Q?Y2Dv7xDNjUTXfrYnoqxta9D3KWPXo191u9pLMkknRAXDafPnTaPXCERN4ShH?=
 =?us-ascii?Q?tyETa9BLjLFSK8UzxMcWzaQC+Ww702rLxz5Js1DmLZX6pykzFYjh4wxvRFDL?=
 =?us-ascii?Q?98UB2tv7yqPmRutn7awJOVtLRfoL7c/6Dcx5zHgi865lfXs8QI0TG+CUy19G?=
 =?us-ascii?Q?ll/+LqoygvirVJxnk9Czk5+YCP6a3GN/PgOQByJqfvc5NVaGLXOi/GhXleib?=
 =?us-ascii?Q?bub9jd3I4WP41SWVtucz4Erv412YxLrdZ6SoC7DoJyN159/Ht7vsgAuKGKc3?=
 =?us-ascii?Q?L3gXF5OqKPVtJYkHI5t5Lfsl4vpHr1IC4iS3TOGVS8+F+3t9MPIwTRG1AxSa?=
 =?us-ascii?Q?9KE9RToHFA5ix0B5t7zf5LgeBhpzU39XGPhvKd5Tdys/XyD942eM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50b9881-cbfe-4c9c-ae53-08deee059977
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 06:41:35.3848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBIixpa2rQ/cPBDy+4qfoajCem69ZZRVrgIHcclxN0Gwu3QU9tlJA8OEtufGRIxL+pC+d3oik8atcoQ8wGG/7ZNLiP4wGX1Ew8Wg0WuEbMhg/q5/Bf7EflbJx6zvfkHE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8655

On Thu, Jul 30, 2026 at 11:27:05AM +0530, Jeffin Philip wrote:
> uvcg_video_init references video->uvc before assigning it
> leading to a null pointer dereference. Fix this by assigning
> video->uvc first and then dereferencing it later.

The subject should indicate the subsystem: 
  usb: gadget: uvc: Fix Null Pointer Dereference in uvcg_video_init()

Please refer to: https://www.kernel.org/doc/html/latest/process/submitting-patches.html

> 
> Reported-by: syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com
> Fixes: https://syzkaller.appspot.com/bug?extid=8dcac923582c28505fd7

Not Fixes, it should be:
  Closes: https://syzkaller.appspot.com/bug?extid=8dcac923582c28505fd7

> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index 2f9700b3f1b6..cb532654b9b8 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -806,6 +806,7 @@ int uvcg_video_enable(struct uvc_video *video)
>   */
>  int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  {
> +	video->uvc = uvc;
>  	video->is_enabled = false;
>  	INIT_LIST_HEAD(&video->ureqs);
>  	INIT_LIST_HEAD(&video->req_free);
> @@ -829,7 +830,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
>  
>  	sched_set_fifo(video->kworker->task);
>  
> -	video->uvc = uvc;
>  	video->fcc = V4L2_PIX_FMT_YUYV;
>  	video->bpp = 16;
>  	video->width = 320;

It's caused by below code:
  uvcg_err(&video->uvc->func, "failed to create UVCG kworker\n");

Would directly use "&uvc->func" be more reasonable?

Thanks,
Xu Yang
