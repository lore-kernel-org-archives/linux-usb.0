Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1159E313E21;
	Mon, 17 Aug 2026 04:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940909; cv=fail; b=tXQ7q8TimrE4h515UE786DnQBwrckOgwpBlwSqqqZivdil5dWbAGTqG63nxcMQOVOn4fofPYGHg+X0BHBKJNnJUjs9gBY/nyKwH1xVeDRaM5xGjtBM1Xd7xweb8XGoVnpwiAXJmh3+5gu2vsp1ZsMSMA4FjZNaBTwsExT9P+QAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940909; c=relaxed/simple;
	bh=G9qOc42svDf0Bk1PEhkz7qb4NjUygoszwDe8gXxnOMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nlD7dpU7/HH0E/l6vkYPvON/0+xQmoCG1pSZjb3RgGbFRiyuR+aMkoq11xIuhK+XLi1H+i9NLAmA19zMynwflz9jy4NUzJ5orbMQpftKaPDl8NrPN8oqu6/l9ssOCa0ADcmMFZGl1sjiqtrlnjcgOSiNPyMH6ZOHZYgbwducAJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f40cfUwH; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f40cfUwH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZq9aMWAdFfiy8/hWv7PoRLDRG9WcwZwtRFMjmFHOPh7GOEAU4ToNKtDAFxITiUlrPxDX4N6Fv5mNZokoj9pM75n86aUcvirtlpqeDDMGEnMwgJFBqnWOVXpvupo1Qlb9AmEwWJwYfB6/2XTPF4ixxaUA3sR0Hg7BGFyvUvHrMuTvh+LrLY2nSd4olOcISkueWLu95HkVffnGoazNuindL4RzEvhlSVE9OF+vUiu2DFJycQC7Ry3sN2ysvp/I95JxYinciqR2+o05chcbIMUGYeT0yIwPd6To9siCYvMnVzOmuGXnc9eR1Tsl4ThE2afz3MTAtVs0HYPX0ANcIRvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa/DAabwKG3EaO6Y04RnyLp6TrQUPOWWAVqm1u2ER9M=;
 b=Ov2rzjYFtNzPfSy42925dhN4yhoBOFeZgydwZK3tsp4wbAgvkzr2JIxpQCTSPeAycD41Cmt2AkXQB/nINTxiC2+ktAFlV72+Oc827hKDpIs7L7/jRrBkhJKuwpYMi8sd8fF0wPIriN6LikEV4z2ENNpYtk3/gfJVUXkbvQq9ZMRfE4iY9SpxNzRFSjMNdRXbpwQ/mefDR/vQSt+EVi+JOD4oaYSmkEKnvK0Hl4itOeAf39CcsIVA2R+I8Gxv3ez/ONqh0/ieySiHIidlm36iWUqk1XL1kZ8xkhlFMK/ynCFNihwc5NPw/yGNeeCWSihNQFxNxYBNCNypvwZ8LNhe8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa/DAabwKG3EaO6Y04RnyLp6TrQUPOWWAVqm1u2ER9M=;
 b=f40cfUwHJRFw0CXbDbX+ZkXssBrly23Eopqi5A3ldj5AMCDaZ8dL6ZirQ28kF1NpEU061iKJ6ScnuEP6BjL5VGOlYhAaNQ/Q7j8/4fzvB4MmLMOTN4cph5QT1+g0PJ7fZx+BPtQpc9fhNnXKR91iRNve5n3mkzp4KWHxloAuHmaYywt994kSOCq4vJip0yhxsmg3pwxwq9OOf4OROaqCFN6vFowszEFQhu6OeKnN8S2vddLAobsg0tHMrpbWh92gOGskhMpzNlPW3EMRmrOoPGSkc19ywGb3Ladb5+pFKlZTmp6pjNbCINd+/H9ZuVBbKiQrlxxM9te5/yxh5SOFZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by FRRPR04MB12595.eurprd04.prod.outlook.com (2603:10a6:d10:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 04:28:24 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 04:28:24 +0000
Date: Mon, 17 Aug 2026 12:32:21 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] usb: typec: mux: gpio-sbu-mux: fix SBU path not enabled
 on orientation change
Message-ID: <aoKO1WGHs4wgF4gH@shlinux89>
References: <20260817-typec-mux-v1-1-5e53c16744b3@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-typec-mux-v1-1-5e53c16744b3@nxp.com>
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|FRRPR04MB12595:EE_
X-MS-Office365-Filtering-Correlation-Id: 970eaa4f-1d48-43b5-4ce1-08defc17f9f6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	atmG2Oi7sN5DUvHwN0gWZ8lQzfxnRlGmLanCM/CP4g00lIzYblRv+6GXPzJjS67e/fxsZyuVnmIXLTMgnL6phenM8Vizge1D0/6OJ1P057DPcu57c6POqXDIDhpA/5u7Cc8l5dSlSMHiIedecKuySEcD1KeCQyZa1ld2RxIEe9TQ9/xRjMop5RT2Ajzq4yFwRelKOlV9MEBmdpvm+FNtuBdxRhTG6PpZfkZh2l9QQj7ZiwgJirwBacc/AmxQDyyfFRmr59YpptzcMpcCYiBR+D/PzG8RPN8bxcoBakxIDTzmGYGbIEQIPkgwKzwhfTqeukQWkAtmzWWoWbrzXy8xC+tssrS7QBjqUWYzN6uzMjOqzHXpaJXpx1KfiX7mzgjEAhFeP8ReWaQpCivQwXDoJt+9VAzmGbX2CANXRWARgqhX1pLO7163lz8cflDcJldpUTIGeagmgFvVG1G5fTzEWBUbbxq0bMSRfE15r84yhN2ivGahXMxmzK2OcL4pfw3IiDUwMXGJUmWpCO6Z/TgR726fy6w3vPO1qTZhPaZ/yPe1xzQqJKDGZtmTbaWPfaTnTGCUBTqFRvLXneYIJo0fTgTJWqauM4es6MjLZFgIE+pf5jVf9hjHGziPV2xoC8c4g6yy6pGog7+4/6J3yGRLPvJtwLTtLOkKq8D9z4FV3GA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3tr3V94fvLPa0VVo8+KA0OM6+d/K5AXKA+G0BvFBX7A8PTm+QJ2g9M16vsA2?=
 =?us-ascii?Q?UvyQfvL0S+wxj/i2le1dHMgeMNUWo1iw6Fosv87iKsHUHSH58m6nYwSaSTLD?=
 =?us-ascii?Q?oabGaqgAdxfCnbN5wvPA7WIW45u2tYr/TREM0podG52EJ/zb3iMKNmQZoW1x?=
 =?us-ascii?Q?sF75PmbfIGfN8VQqhQV1PNkyultps0k2GVlsrYuJKPxNoCouq1Bjgnwxy0DI?=
 =?us-ascii?Q?Q/K3Shu/MClDOfYElBlFD8+cKrOksonpkKEFzKM1FInwbPGDLpxDA5n0GOBX?=
 =?us-ascii?Q?Wld4JJsJ5YoHEPluymWHFvn3WNwd2gNKNBNmmSuVZw2cmJ4kSVYQhR6ngWe7?=
 =?us-ascii?Q?YqTsY5Y+Fsjq7TIdRmhlBQsfZqhO7sQZzefc/iP0Ys1uiiTec8C0xJ6TzFwi?=
 =?us-ascii?Q?1FsKYbbkSBZhPOM9pvHJRrgyABUf+RAbPF+TGRIBygeOHq4qOb3qA8qyLtHn?=
 =?us-ascii?Q?VkVf1cp/6bmT2kkdPaUtyQIhBAxbFe6N2yK6cAFEPpXpiGfblvZhvqc2nC7X?=
 =?us-ascii?Q?i3WE8/kmqZxYtez5BrKpb6KLclt3uwuoKc5bQhCIX/T3E3B1jTvtCqh0VU/N?=
 =?us-ascii?Q?g05OY0d9aSpZQ6E4gi0Piss6wS31dI5GqNUYttP8rWn9I5AeCYz3tq+iHgc/?=
 =?us-ascii?Q?1Px+Sz2GEo8kic5RLV5ritZKm7KW6b4SDE3bRGRyeGvqety1wk0t3vtSA19U?=
 =?us-ascii?Q?yH6upyJQOMEEHxDwnHynFheAT3pJ2SrcQodKlykiJgLrKPmRARNQdzwtvqXI?=
 =?us-ascii?Q?3atw04lGgqoH4ZLPxWlJYB5od+R6uzoyALWSnb/AqDU1V0Rb56pKzfCr0k4g?=
 =?us-ascii?Q?kftVlTJJL6lKAy+EQ5TfiOIjT/pEG4iyfzC+8MnpPbJI6uVw8U9fTgWswumJ?=
 =?us-ascii?Q?HjoIh5SavVn+gAKFTaqyktFA/3x7KgTExjYyK/gDtVjjsZ36AQxDv+38crMt?=
 =?us-ascii?Q?aVmA5d26ky7klAS6yEqRglBr0B9niac3Hyl/+7b25bwNw5VTTYrOcJOVCQz0?=
 =?us-ascii?Q?cq/rx9y7h0eiKnudTtXpvB45VwBsz+Iy2XRN2QsLUM9FI3Q6VU4ukV6pyF5f?=
 =?us-ascii?Q?znZYAo1sPj1uN86uABisQAREBwVzY80h3U6oZQ/T9GiMGUklKq0+p2YmdKoP?=
 =?us-ascii?Q?UjbpwY6uEECpHeEQgPEgtqG7JfVrIBq1GQBoszQNFo5uyW67SmOoUUnvl7/L?=
 =?us-ascii?Q?98ywUPb1UrMp5tBEmG92NWvCJ7OimezuEWJ+rBVUcyH23uDonsXLDROzwT7H?=
 =?us-ascii?Q?c/F9D3taK3+G219yYlUsejFzTuVT9KXbMfwd5hhppBnTFi2Fitzv5Uu7yHbc?=
 =?us-ascii?Q?ap/9SQsnGshmMYH1T3rbBWxroeD7087wp1mLIoxJnswyEJVp8HWCvhqjG7Jr?=
 =?us-ascii?Q?cYmUot6HxQ6tt8PvYpxabrzCpPko+XUqRukfZOU2Uu9U90V/0igHdRQc9Sr7?=
 =?us-ascii?Q?kk+F0DP+98omvBLrMHICgPtUxY+TtLHbzdALknSYKcncDv8bdieJI7O9ycAD?=
 =?us-ascii?Q?oK2874j7xU28aLqrrGhH2ehC6MTbFBr5VY8KGiVPy/ERG+eXrja6GHPRzvnz?=
 =?us-ascii?Q?9V33Ow1Hu/VgiPnwEyuXkbH7BEIfS+Uj0uEGAndSqKX2B3HkgBta8KDtxc/G?=
 =?us-ascii?Q?NnQXde6iCqgUWR3lFGGn47KboyZxVlmujRV5WbpQbZ4WGzZ8WKXm7YqJNG5K?=
 =?us-ascii?Q?p1anlBJxjy4AoPwKuYdvWxVv3xg4oPwYf+/zSEMdxGD7Sg8OtGDGE621R/Kk?=
 =?us-ascii?Q?stDjVwBTdq9TkXfh+ENm/U585Nlobv8rM8AprZJCWO2CgTDZOk4C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970eaa4f-1d48-43b5-4ce1-08defc17f9f6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 04:28:24.4427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVqqywqLrmBI76EH5Wge4aN97M0CBbCNcGvjpi6kcwZOnNk5oKlXfxBIOBS5kt2DPJbJxCN7d916e/+Ffn/Ri9NuTVyIN1ErP1/kqVs10Oc24QhBK/+b2De/5jiP5W9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRRPR04MB12595

Ignore this patch. The patch is not correct.

Thanks
Peng.
On Mon, Aug 17, 2026 at 10:11:07AM +0800, Peng Fan (OSS) wrote:
>From: Peng Fan <peng.fan@nxp.com>
>
>The swapped state is updated, but the mux is never enabled when
>orientation is set to TYPEC_ORIENTATION_NORMAL or
>TYPEC_ORIENTATION_REVERSE, which means the SBU mux enable GPIO would
>never be asserted when a cable is plugged in with a known orientation,
>leaving the SBU lines disconnected.
>
>Fix by setting enabled=true in both NORMAL and REVERSE orientation
>cases, mirroring the disable in TYPEC_ORIENTATION_NONE.
>
>Fixes: 065ded319d39 ("usb: typec: mux: Introduce GPIO-based SBU mux")
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
> drivers/usb/typec/mux/gpio-sbu-mux.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
>index 1834f1a2dd9d..4de7456794ad 100644
>--- a/drivers/usb/typec/mux/gpio-sbu-mux.c
>+++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
>@@ -40,9 +40,11 @@ static int gpio_sbu_switch_set(struct typec_switch_dev *sw,
> 		enabled = false;
> 		break;
> 	case TYPEC_ORIENTATION_NORMAL:
>+		enabled = true;
> 		swapped = false;
> 		break;
> 	case TYPEC_ORIENTATION_REVERSE:
>+		enabled = true;
> 		swapped = true;
> 		break;
> 	}
>
>---
>base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
>change-id: 20260817-typec-mux-d0e148129c08
>
>Best regards,
>--  
>Peng Fan <peng.fan@nxp.com>
>
>
>
