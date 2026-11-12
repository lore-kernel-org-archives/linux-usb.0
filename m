Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479693;
	b=zHg18Y7237HE4sqDI8RSWV7pt3MgnyaGjlRrgNvDMk65GLg81a1Wi8+RyS3zhfvT9G55
	 mu18z1weL82iDA9Zlk1LbFKkd7p3+qpC0gU5qdJbm9dE8xjKGeFZRBCmA9ivXfvBMgT2y
	 2wEjmMfpc/GePNDSHc1OjQvyrjCxrkjrhFy3GOO54gx18jgJqGtXjcAixFHGh+D+iy75X
	 X/BKWP+zjPFSHv+PqY+dVydsUCdQcTU6PRBFipjYlx80bYylQ81cA3fHzmbThp5C08qzc
	 Z/d2zMWw7KS5oRlzhB/TWCco2dgXDDr03vxCma4HcKYc+6t11nLU4+FgZ0LA6RUI95Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479693;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qVMd2QUmyt2LaZruYROUTP0MeYB05Rxt5Mls9Kg2GgE=;
	b=u9pzU/DjJ7z1XOr/67xYjeBPfGTjExHzstkSrn+iANk5QxzpVk6IEloODGmmOcncfyj8
	 +DL6GHJdkL+qlXv3hYjjKdMdxuHUfh2QMNZhl6AbcW/pf9XoOlUQGPfO1GUnEdcV4ys0Y
	 QkCu/okPNiyUzF6a28fI1n+MRVoQiuuNBu7KtoMphW0juJxJqk+jk2NAHUq/WGVLK9/BQ
	 2UnNkISWNR/liiae3krmU0t1nrVgmoVeYYp8xZNtZbFyFJR0Up/z5+jonRBAsJmSAxcKc
	 fh7f+lql4GUVpgV2j/B+BT8zhbWDYOgteZUZZ5veCiR7cLDbMaJ84OLhpNvFzZr470Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=boeOOodo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.22
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013022.outbound.protection.outlook.com [52.101.83.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D1B606A323
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 10:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D1B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=boeOOodo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5p3s3qIrruV5vTOINpBfGXuYHuNvmRAhiWhcSzNBUzgP8Ii9/abcX14H6gUNNqUdhD1QPnvTjPbdNxbXjeLkGgooRs6MsD8cU5wW8VytXjKkpTBgLb4xBXLBPC7hSaVETpNbxRI8BY1Aq4aOnu9pk3iEOKSFJy4a4ja/kKePS2p2hau/2hNWXhdJbI76bYTVeUt+2bz1N/2ejONSho4Tdh2dpVgDR8dhXn2wgY/VHwDss4jVDW42fVquepfM2HL7T0LbfrDYNlmOix/KspwsXKtconWmIsQVLENj4Q0/ucfDEVf/ipMY6IodUKL9EanL8KHSKaDzHI6oD8X7fPwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVMd2QUmyt2LaZruYROUTP0MeYB05Rxt5Mls9Kg2GgE=;
 b=CEf5dRlWwZdH/zRAEiS7UkOE9z5VXu/b44ql2+YNk8srtS/dgEqPgjPC+U1RIByBOduzzQNvfvqYah6/LGbAYqLXZRR+Yt1zqUFK9lpuBgD/93O7EGrybR8azZOl+Whj11OuTDBqLLB5UhJ4iIUMBFYcqhxE8bsVVc2ixnNpzyTsRZtxHtwDCjPJoljandkbjmlB+MtMEpnVsQtvm9nGxPQzuf0VsZD59tsq5HmgBQMBBXC62uHyJiRgcWem0rqJdJ95wpHFDtyG+pn3i/BCQ0K1UgjjrflgMlyiCKa6+l2oJyNVB8GUs4cHoMKnywkIvwnpcIMabs6753hb6d/ggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVMd2QUmyt2LaZruYROUTP0MeYB05Rxt5Mls9Kg2GgE=;
 b=boeOOodozEpAgcSIaDt6U3KCzi2eHXOqUqe8XqQeVKI+wN51ipa/Nb/CvgRcMjas//BiI0dMSPR8sm5LGQTNw+R6/13CQPD76hOb98p9Zqk6qMNHXgkZXQ6pFvxZ0YL4Ev/6zzMfF3ajoSYrMEIrTAY4RavoLwMy8MTMN56QcdhoB+vfAVEk1/UgFuxhOqqkD/KwOJ3HEoL/RU+NXfVWmXn3jfI8Za5bt0KQIBo9lzzXEN/40iQhUwvYU2b30pL1UjpWgD+bJYODP4PoosHX2Gb8L9Sm0Qv8LqyYjMCn9UqrlTfqojg3c5RBouGzyKmHlNDA1y3wkhJowbJBQ4n3uA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by MI3PR04MB12682.eurprd04.prod.outlook.com (2603:10a6:290:81::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 10:34:49 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%4]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 10:34:49 +0000
Date: Thu, 12 Nov 2026 18:31:46 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH] usb: chipidea: stop asynchronous work before destroying
 roles
Message-ID: <soa2ghcadt5j4llam5z7wltokdc7mxd2twvgokyxb63t5z47eb@fcqr7fvvbqcc>
References: <20261112092556.2747348-1-xu.yang_2@oss.nxp.com>
 <sashiko-outbox-210905@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-210905@kernel.org>
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|MI3PR04MB12682:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c3be92-715f-4e71-8e74-08df40a893fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|5023799004|11063799006|4143699003|261021130227099003|56012099006|261022115727099003|261102123227099003|261021121427099003|261021123027099003|261028144727099003|261022105027099003|261026140227099003|261022113327099003|261021135927099003|261009223027099003|261022075727099003|261026130827099003|261026121527099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MDwS7lS51Hh+JfBHIB0DNsLfG6IFizjiMezj55s3+Py6wZfXx5y3ZBKqHIf8YIJaLdr6SRWuB+Ne99eooZvwLcXFD6PoW19t57miItKzSJElx1DOQIkAfSivTcc6QhqFJxGRJ4EzORczc7hSsr5nB8E0oYNS94qnecPd+H1i0WP2KbiEr6wna5fBkEZMYKMQHxN9QFsuJtQ2LHAbZR9LN8oW4ZPYANewUlnLhF/qe/Qg4d5OhBplSAgvhXaw8q92aLgznbFuqIYV+2hFOxWyGPGxivdeL2oD2VPSy4MY3SFL8KyP3SJf/E7bB/T/Kzu6y6K/Y821EaV25iilT37VH1KbsSN+HaCsVDgMYZwpNFEZlQZtaB7HiYv9d8Oqex3xDeFXb64vtrQA64hT37o4Xn+jsY3VWs7IsulY3pr/fJ5pFKpuh4kuta8XNRXd3xSb28KGI6No7G/nZGYT5wkXKl08/NrvAdVJz38o3uK4uGvOmjTR0S/XnRJ+CfW/GRhqRAQYca4lqhvgokCrq+XLNCHhtKJqjfxubWUEr17fDvP8mgkh9cLJT/+Rtf5zDFN4BhD6cTpGmGw8WbUMNdAnUAV3CLTfUAPdKS+/x2+yQ60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(5023799004)(11063799006)(4143699003)(261021130227099003)(56012099006)(261022115727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261028144727099003)(261022105027099003)(261026140227099003)(261022113327099003)(261021135927099003)(261009223027099003)(261022075727099003)(261026130827099003)(261026121527099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1dkbmxLR2daS1ArcEs2ZXJ4cGJObEF3UjBuYkxMbEc2dzd2UnpSSTQzVWpl?=
 =?utf-8?B?ejBoM3AzclRLaGNlcExSbzB1RExqRlRhVFREZENHZWZnRDBWRDlGU3RDdkxZ?=
 =?utf-8?B?ZHJzTFRHT3UwcktxV041S09aSlNtbFZ4djhqZnNwR2JTTjEzWVo1NHdtL3hR?=
 =?utf-8?B?aVVhcVdVVWc4Q1JKSi81R1NPc3BPWWgrNlR6bTVyeXc0UnhIZlVoRU1qRERn?=
 =?utf-8?B?WDRMNHdDTjkwNHRZZVhIU2JVZTY5S2wxVUJIaVZaT3dPQXZOUWFlNFg0REdx?=
 =?utf-8?B?aDE5K2pkdk5CVzhuVHU0T21DTWZGR0N0cG50aWsrT1ordzlvdExhb0t0Y0tN?=
 =?utf-8?B?akF5c0ExZ0JicHRnZHNYeG45NWJtc2NBb2JpamRHYkFJQ3E4NjBPd0tIR3Np?=
 =?utf-8?B?QUpSUmZ2UmEzaDUyUHVXci9MM25hQVRKdUxMbXc3WFA3Mm85R3dEM3EzUHlY?=
 =?utf-8?B?bCs3Z1BHN1VoYUNhUlFncEg5NlFWaE8vMTNvQ0R4K0ZVM2doNE1vM293SnNK?=
 =?utf-8?B?M1k2RENPTHpoOEpudGo4UWpOSHVqbDJVRGtxMXd0WllkT0Y3TGw1WWc2bXBC?=
 =?utf-8?B?ZHU1akxUNklzN0VqY3dGclh0U29VcHBrUEdpc3l6MXVRRTZsdi82MERudlZR?=
 =?utf-8?B?YklRMWF1WkN4Z01TS2Rqcmc4Z09pUmxadHMwZjZMYnlGQ1BlR3RYaWExZ1pB?=
 =?utf-8?B?d25kL2p2VHhNblR6MEVFQitXK201WEpMcTVZYjdsaUl2bUh4QnFOZnFlRi84?=
 =?utf-8?B?RGFGZEY2K1l2eGZmK2hGYVlndWx3R2N1eHJ1V2ZiSDl3eWdyODhOZFpvc1Rk?=
 =?utf-8?B?cUUrTC90YnBaQ2ZwemRzdWVzTit6UFpZMEJDMk5QaHNLOWUwelJlZTZxMEpB?=
 =?utf-8?B?UFZNblJuYTlYcGtnenh0MlQydHlCa1hQZXhLa2tFY1NFUnBuK1U1OWNwQ2Nm?=
 =?utf-8?B?MGhEdDZNNUtCWlNQNGVNY0NINlQ4SlNoT29sQitiMmVGQUVWSXUxZEQ1dkRK?=
 =?utf-8?B?bStpemFQTFlCL3I1MjQ2aFZ6UUxPN2oyQ3ZzMDgwZzJ1b3lHVVRoYTlRU2ds?=
 =?utf-8?B?ZFVJOXFVZDhtUkFxd1VaU2RyV2dXeXkxQW5zK1o3UEgyM3IrbmsydnRlZ09F?=
 =?utf-8?B?NnFIQzBvODZOK2tuQldTWEtUZFdHS05jTXIvV0dYRkdSNjhRMGo3dFZzNW1s?=
 =?utf-8?B?cm1aSEU4TmQrOTNaY3RFVHMxNStwcGZaYldOVnFaaEZXS09xZW9Na2hvT1FQ?=
 =?utf-8?B?alBBZExYZFB5VWdTbGg5YnM1U2lWRzM5aHdrdVFFWEhMTzJJQ0Jzc21ocDM5?=
 =?utf-8?B?bjBGV3FqV0tOTTRvSjhvOEJyeDBmb0NaQjhpNXl1OFRNSU5KOHdXZ2RBTmth?=
 =?utf-8?B?UVB5dmg2eTJNMmtIRUd6c3Y4VzBsV1VVN3NLQ085ZUg0cld6VUNXaU83MThU?=
 =?utf-8?B?SFY3Y0tualJSekt5M2taUHFTTDBuK2dxc2VqT1pORUtwQlJZdEdvSHFrc3Z3?=
 =?utf-8?B?a1ZCUC9uSHJkZmVrVlRKbmFPQ1YvZ1EwTnNXdWtpMXFWdWRGVTFKN1ZGMWZS?=
 =?utf-8?B?TU5DaCt2L3g3NTJwamlUNUcrcW5YNWJ3UEZsZjNqWnZZaEp4dVh2VHdkZW05?=
 =?utf-8?B?YWhKWTNvKzl1akFFSGZVU04yTHFiS0FDWWxwOTdRb3VKMWVGSENBM1FCTFdK?=
 =?utf-8?B?SDJRQUlpMDRxVVB6eW5kaUdmTEF6bjVudHozYVRHQXBPTUt5SEp1bVRjY1J0?=
 =?utf-8?B?ajdnWHJHSmVEZGNSWWZpelZHcFN4aEhCODVLVjFRbm0wbjJuOHk1bmFZc2N3?=
 =?utf-8?B?djNrSlh3a3VSK2JWb0UxcVhtblBXRjI0UHVqdEJmL2w2V2dQRkF3RVlyYi8v?=
 =?utf-8?B?anViV01ZYmpWL0lVZlFNTnFFT3JmVUVTZThWS005bzdjWElvS2Y4Wmh2N29o?=
 =?utf-8?B?bGtSUkRiZDFlbExidm1nNmM0TFlxWStHVzdNSWRkRkdNd2xLT2V5b2UyVTFY?=
 =?utf-8?B?Z3VNYWNxY3lHbnR6bVNDWC9aZDdrbzk0d0xTaVNla0E4NFl2aFVNZTdrb3NJ?=
 =?utf-8?B?M09Lc2sxZkRiT1pBTVR4WWpJSjB4NkVIWFBFd0JMVVkxT2YvaDBpNU5TVjlt?=
 =?utf-8?B?RlVYMGI0cHArdDlpbmUxdVNIb0k1Nk5MaFhkakg3UUg0V1IzNjkzZzFWd2kx?=
 =?utf-8?B?a3NtMWQrUnhVc2pPa2pENlFkVlBLNEJackk1T2VsWDlDNm1KQ2NWbXNlZzgr?=
 =?utf-8?B?SDJWaXJTMGJmS0NIZFkveWtVYlBZNHQxTzdFVHFqK2haOWxMbkU3c0MwQWdN?=
 =?utf-8?B?bDF0T0pTS09iYlJYRnR5S0gwTzc1YndDUVRDbi9YZm1Pa1ZwV3RsZ2s3QXNo?=
 =?utf-8?Q?GsDZB3tt+OUaKteIomyt1ZaRW1KFQPeWA+6lL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c3be92-715f-4e71-8e74-08df40a893fb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:34:49.3198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //9KCtY1zMbntiKc/sZOp3G5l7+qPndgVyn84JtnGj3GIuEqq+6WIfn3UZ/OCIzSOgq8kFsXMTggXiNNESk0Dz/HeQdP1Qi9UMFSI1Z2XVAKru0X9j8UsTGeWeamPvyh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB12682

Hi,

On Thu, Nov 12, 2026 at 09:50:13AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] usb: chipidea: stale OTG event flags and teardown race in
>   ci_hdrc_otg_destroy()

It's related to extcon notification. The issue is introduced by commit 3f991aa0b665
("usb: chipdata: Replace the extcon API") in 2016 which switched the driver to use
the devm_extcon_* APIs.

Reverting that commit avoids the issue. But I would perfer to leave it as is, given
that it has existed for almost 10 years without any reported issue.


> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] usb: chipidea: uncanceled otg_fsm_hrtimer in
>   ci_hdrc_otg_destroy() [1]

It's a pre-existing FSM issue and not introduced by this patch, we don't plan
to fix it as FSM is fading out.

Thanks,
Xu Yang

> --
> 
> commit b8def951ac8ca82d212a5f915b8e9c3017f3be77
> Author: Xu Yang <xu.yang_2@nxp.com>
> 
> usb: chipidea: stop asynchronous work before destroying roles
> 
> This commit reorders role and OTG teardown so that asynchronous work items,
> interrupts, and the OTG FSM are stopped before the gadget and host roles and
> workqueue are destroyed.
> 
> > diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> > index fecc7d7e2f0d7..ec11056dddfaf 100644
> > --- a/drivers/usb/chipidea/otg.c
> > +++ b/drivers/usb/chipidea/otg.c
> > @@ -264,12 +264,21 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci)
> >   */
> >  void ci_hdrc_otg_destroy(struct ci_hdrc *ci)
> >  {
> > -	if (ci->wq)
> > -		destroy_workqueue(ci->wq);
> > +	disable_irq(ci->irq);
> > +	if (disable_work_sync(&ci->work)) {
> > +		ci->id_event = false;
> > +		ci->b_sess_valid_event = false;
> > +		/* Balance disable_irq_nosync() performed in ci_otg_queue_work() */
> > +		enable_irq(ci->irq);
> > +	}
> > +
> > +	if (ci_otg_is_fsm_mode(ci))
> > +		ci_hdrc_otg_fsm_remove(ci);
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can ci->otg_fsm_hrtimer
> fire after teardown [1] because neither ci_hdrc_otg_fsm_remove() nor
> ci_hdrc_otg_destroy() cancels it?
> 
> In OTG FSM mode, ci_otg_add_timer() arms ci->otg_fsm_hrtimer with
> ci_otg_hrtimer_func(), while ci_hdrc_otg_fsm_remove() only removes the sysfs
> group.  If an armed timer expires during or after teardown,
> ci_otg_hrtimer_func() dereferences the freed struct ci_hdrc and queues work on
> the destroyed ci->wq workqueue, causing a use-after-free.
> 
> >  	/* Disable all OTG irq and clear status */
> >  	hw_write_otgsc(ci, OTGSC_INT_EN_BITS | OTGSC_INT_STATUS_BITS,
> >  						OTGSC_INT_STATUS_BITS);
> > -	if (ci_otg_is_fsm_mode(ci))
> > -		ci_hdrc_otg_fsm_remove(ci);
> > +	if (ci->wq)
> > +		destroy_workqueue(ci->wq);
> > +	enable_irq(ci->irq);
> >  }
> 
> [Severity: Medium]
> Can leaving ci->id_event or ci->b_sess_valid_event set while ci->work is
> disabled cause an unhandled interrupt storm after enable_irq(ci->irq)?
> 
> ci_hdrc_otg_destroy() only clears ci->id_event and ci->b_sess_valid_event when
> disable_work_sync(&ci->work) cancels a pending work item, and it disables
> ci->work before hw_write_otgsc() clears cable->enabled.  An extcon event
> arriving via ci_cable_notifier() -> ci_irq() before hw_write_otgsc() runs
> (which disable_irq(ci->irq) does not block), or an earlier OTG FSM transition
> past OTG_STATE_A_IDLE in ci_otg_fsm_work(), leaves ci->id_event or
> ci->b_sess_valid_event set with ci->work disabled:
> 
> drivers/usb/chipidea/core.c:ci_irq_handler() {
> 	if (ci->is_otg) {
> 		...
> 		if (ci->id_event || ci->b_sess_valid_event) {
> 			ci_otg_queue_work(ci);
> 			return IRQ_HANDLED;
> 		}
> 	}
> 
> 	/* Handle device/host interrupt */
> 	if (ci->role != CI_ROLE_END)
> 		ret = ci_role(ci)->irq(ci);
> }
> 
> Once enable_irq(ci->irq) runs at the end of ci_hdrc_otg_destroy(), any host or
> gadget interrupt during role teardown takes that early return in
> ci_irq_handler().  Because ci->work is disabled, queue_work() in
> ci_otg_queue_work() returns false and immediately calls enable_irq(ci->irq) in
> hardirq context without ever calling ci_role(ci)->irq(ci) to clear the
> hardware interrupt status.
> 
> Disabling OTG interrupts with hw_write_otgsc() before disable_work_sync() and
> unconditionally clearing ci->id_event and ci->b_sess_valid_event after
> disable_work_sync() would avoid this.
> 
> [1] https://sashiko.dev/#/bug/linux-8569f327-701f-4376-8f59-b4c911b172bb
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261112092556.2747348-1-xu.yang_2@oss.nxp.com?part=1
