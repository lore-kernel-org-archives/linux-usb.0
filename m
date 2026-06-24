Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4864329C60
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 09:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782292340; cv=fail; b=lts7Ixpq+VY9qlk0rxsGr+fgQ8lov1YC47rApm90+qP2bZn9sX9aAylGJ5fg04NS/sZ8C/g8x1Za04S9JWlMtoWmSCse5RvVGhN2V0WzkDo1oD+xoxen4WZ1W16PA3We+NE+xGpbVD83REvkR2xL1QX259OZijHEIpMbsS5lwH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782292340; c=relaxed/simple;
	bh=o2whOuvwoHbZpJVgKl8STfXinhgqAZnVBXGyW51/RSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n3qcHV3mmbgI4RqMdRqIomRVB2BEfPLy6w9F743bxaQdJYW7WcDa4WRx2QKzqGh5zB5PtPqwsJ6KWh2UFBEKN3uy88wj7toJBpa1ONyckJia0jH36s8e4xScJ/NRG+t1TjoGj0zPKua4GZo5L/GmuMJSHXCDF2jNN6jc5DNXjrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hyBHxe3H; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hyBHxe3H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULPD+TKuyXuAKHoPHEhiriZwyPre6pUUu0JWUbmt99Tls4VTlsoCT9hK1XYUbW+nTchG9E2x1yrB2ZEIoWTW9Tq0jrNdwGSqoyiQyFUxcHOtZKfGLgeIHIZE8bYgX80UJtUTwn0NYl19AOJvzucEaspx4EOLLc3TqaUDhECkzfKmKccXyy9ItXqHAMT0YpchdcBveh5qOcQ/DmJIoAoPbMAch3M2WyDUX2xJIxBU4EvPovZL2LFrWuOmkYwWwUEatJmdkxsHbR/lgDMQQSahCNrL58PLj4YHhxFKxqfKTIHD9bMJwc+EbDWESTIzPKTshkIDOUU+X+g5o2gp8sBL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nySKxbAjWJzIDkoT/MWQg/T1BPHd/lROkTTX0ibTUZ8=;
 b=m/DU6Tdgd25EginFXKZQiA/n1Xu2gZEFDq6hEoOp2JKJQD25yxl/7cZZgBZusMHuaPmx4VZ5A6EoxEfawrJqyS93ev7FUMn10kHi6wdu7LgVXg5Pf7uAaksfGaYJA4XpZB7q7V6TbDWGAgFlfX/Kkzh+jHGKOXiVSgH+dPGbR05MhWRbrsydvbIjaah0sXzwZ5DKZLOmoKzJyFttNPy4mmqmOEoSAr0rOAozjmCyQLJqokAZZjVCfkmvNSM9WUxLTvbc9E8CnZiYOhxjiIJ+ZovN9F4UKvzNqBGUqViUWjIsQYOnxQ7Q+cug+ep6+Rb7beo3JSK2eN3xgmQRn50FKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nySKxbAjWJzIDkoT/MWQg/T1BPHd/lROkTTX0ibTUZ8=;
 b=hyBHxe3HP8FtjX97wZpO7aj4TgNLtxabq3/RDIMz5XKpT8c9U2AcqYlBgpL5iUP0XKaEc3Prs/6RXQoGH4u8zFqBxgdv0XkwohdmfjR033lfMJFi4XfUcVhv/kWIeQ/jQjiNtyhz1nSK2Fjk2d97/C6VqXhoHLy+Q8CGcsdSXkJkn6KnJ4GrO0qb0z6ZgKutBf9xcfFswvWNbp8fNl1TDqkaGwbdAhPZpRekC0cxmU5pfE0mTlUKF0GVGbxj5dz1iUxGuLx/Ug3Jl7pCbWM2YhONHMNP/3ojrMSFA3f2tOTJRaQr/hlX1xb5EjgMexEFu/RWdOFrkjH4YZpaJOOMCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by AM8PR04MB7745.eurprd04.prod.outlook.com (2603:10a6:20b:234::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 09:12:15 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 09:12:15 +0000
Date: Wed, 24 Jun 2026 17:11:02 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jun Li <jun.li@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: chipidea: usbmisc_imx: i.MX93 support
Message-ID: <lwo7rsdsfuibceyz5qoi46bbrhmofjpb2e3ukzdawieou3uo7m@5o2ral3q4oaf>
References: <b2fb88eb-5c5f-499f-9cee-6a69769c578c@gmx.net>
 <ibkjg6bymxoy5wcewrfn4y63f5izlh2yvdqjt42a63kvttr42w@tvqjjhfjg3u4>
 <40e4df43-5de8-48fb-9c5d-9ccb437e63b9@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40e4df43-5de8-48fb-9c5d-9ccb437e63b9@gmx.net>
X-ClientProxiedBy: FR4P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::9) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|AM8PR04MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 70740327-3916-453f-1e1c-08ded1d0ae53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	mMe32oBYMxlOyQTorv/xkxLYLKY1WKdm9NEBGdbTaBx8hH3sFUi7YpqnHNC9uxRJXLtK+4yZvSDbq2Jt/D8QFuhXWRn2iXbOcLGZXEZukuguWq7NyQgWglX/RLbFMjembUzPVICaApQ/opeVHWHFK8/NtzHOnc1x+dobS7DRxlY5B+boLg6RDgsi6ErQ1JjZ/qles2f8s9iRb++cCZivJy2L4TAiRkwEXvId+7ylKIicf9nPlBkyKebQSonmeYr1EjEElSgIXghM732SYXxL98caIH9vOnqHAqQjsT02P/yQqoLaJzwyyL4S6szMsA9Dc3rCXdRUU/8YsiOrpAc/9+S5CujQGsBm5pK2I7ADQI+BmuRFHvUVkhw6T6y3XBAPytD4ZzuKnAVPyftmgeIILXdevlnvQvStM82QzI5uo/n9MQFIwa52YaqmrZ94eDbs939pXlvlksQ5S6LwYNNnVudx3DCC5viHkSTiyxMnMZREEF2OlIMPOHFB5fwaNwWQh6x3dvAHKnev6XH0uCMQN12ymFK0lqZDEbV/Ld9e4nQXUd4nEIil0f+NNGQgCUMr5oY6xgiGkItPV2L87niRWsL257poXd/bDp0o8EbMIHzyRSX80grC3Pmp/NfNXeOse3JReBbb7F43nCSNMUXn99KCSsuSEylO36JOHj3Jqh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bktQTm1XTnVhS2UxMGN1SlhWVVBjR2h4alptcFJJZTh1UUVvdHR4SXVhdGNl?=
 =?utf-8?B?WVF5emdSUkRoSDRLTFR0ZDkxbjkrZHJZQk9mRmRoQ3pOb0xaTXdOUXh1Ny9h?=
 =?utf-8?B?SUxSNlRuSU1MV1Boa0ZmaUhzQWZYR3N2VHB5SjBFMlJpSyt0R1I3SXNsT1I4?=
 =?utf-8?B?b2J2ZitwUGtvR2FzZTlLNjhEVnJPVUdGT0E3VW05RDhET3FmcThKM0cyeXZ6?=
 =?utf-8?B?a1FSMS9XQVNNcitvOGY5YmIvZVVsaVY1bDI5aHlONmRvZXdQWCtNMVp5VmJD?=
 =?utf-8?B?WEV1U0tHK0syUUdVd3AwQ0pJTlRsMDIwK1cyNWJiTnhML0x0SHhja2lIWnBG?=
 =?utf-8?B?ZHlCUm5CM0xUMmZRckgvckNRY3Y5UXM4dWlZb1U2L0RsYlZHYXJhU1B6a2Zy?=
 =?utf-8?B?RlNyYmhTeU9Vd0xDTDMwZVhoUWdGZVJLa3I5WTFxT2M0U09GY1RIM051VUY3?=
 =?utf-8?B?NVJPcGpWYjUzMW5nU05jVnY3SmxHUUFad2RYTEZuVjFGamRyVVZEL0VrQWs3?=
 =?utf-8?B?endtTDVtbDVZOHB4NUZ6S0Vzd1JCRGlrN3VBOW1zYUluTFFjVkdzanZBSnRz?=
 =?utf-8?B?VklaUm9HSlA1YytmRllkcXp5dUYwWWxwSGZDVlNpdWpmemhDak90UXpIMFl5?=
 =?utf-8?B?MHJYSWtJZ2V0QVN2UTdqQ3BLd3hJd08xUldyVmx3VXZpM0JvYmlEYlVJRmxD?=
 =?utf-8?B?U1MrUm5YTmd5TU1PcDJMcFJ4dWVtRmVKZHRFeWNRSndoSmZXVDA3MXArREd6?=
 =?utf-8?B?VzE2Qi80WktFaWdTNEd5ZWZiRngwMkZnWmRDMkJSck4yOEFsa2NkcUttTFdx?=
 =?utf-8?B?Z1VWNCt3RWpqRktLYUZqNS9TNWtHOE9XSDdrNGI1ZlFnSkNQMkZRYk1GK3Y0?=
 =?utf-8?B?ejdiVC9lWmRWZkhCazNMQ1RtUFBBdi9DazhRRisybDJFbUZaNEZKNnE1bVBt?=
 =?utf-8?B?ZTNvZlhlSFdlUzNrdktEeWREbXM2NktzeDFjRDl5TitFTjJDUzJDQjlOL3hv?=
 =?utf-8?B?R2ZmZDBOd0dUWVlVSS9TS2J6M3VtM0ZRVWRDbFZmUXVmakg0UWdYUUhONEVJ?=
 =?utf-8?B?a1krcTN1cGsyOS83eXpBNW1nMzNkN3h6aU1qQmhQa0pNSEwydnZHd3pGbGwz?=
 =?utf-8?B?SDI4dmpjQmFkSXA4UGNsK0FrNmQ2QzFTVytYSkc5aFBWaG9HejdHMysrc3hI?=
 =?utf-8?B?VkdKcks5QWNVbitxamVFVVh1WTdMWkVPZU5OUGprdzJtTThyUEdzWU1OVVdE?=
 =?utf-8?B?U2lyd285R2JFcFBHS3hzaElrZzJqeTJZNmdDcEtpZUJvNGFNOXcrQ1hKeFg5?=
 =?utf-8?B?c0NxMGZOSFRQSk5EQU5SaW9MOGRVakNYZzhoK0F4RlQ3NUpDMENlOElob3FD?=
 =?utf-8?B?bW5SbG55VU9SWkxTVU11eGx0emtaalZSREhJSGtBOEJqRENod0dsYm5NWCtG?=
 =?utf-8?B?aWpKckpsN2JEVXlDTlMzUlNlSFlCM0VRWGJZSE9FWXoyWFVSQkYxdXFwSHFT?=
 =?utf-8?B?dzF0RDFuTHlCN3NlVUU2M2ladGdGa3V2cmpzQTRSbzZkTGtrUEFPeHB0Y2M1?=
 =?utf-8?B?dHZhbnBaSyt2WFNiZDArV3RBVVVMZlZsbEpCMTNRck96czg4d1MveFVVZU5Z?=
 =?utf-8?B?VjgraTA4bUwrSFA3a2xRNVFOMDZjdzFLMFlhbWFuWk1HTVphS2Z2Ty9EVGU1?=
 =?utf-8?B?NVZCVFpEeGhPMk1ObWNsQzJkcFdFamUxNGhoNWNmOWlwUHVPSEx6RUwrU0ts?=
 =?utf-8?B?QytLaEpqcFhvSmZyTW9yd0F2SlNXWG9rNVR3eFJRSTlSTHAyaUxyakdjNzFt?=
 =?utf-8?B?MjJZY0I3OVZHdFdMeitjTEQ5UEJqYXhETkNQRFMyZE9pTkxGdHc5QjExTjVj?=
 =?utf-8?B?WTVsN0F1U0NRQmk2TVI2TFQrR2s1NVMzcjgzVzd6VUdGKzRxc29hRTBRYmpV?=
 =?utf-8?B?TEpXZzh3MGF4V0VBc2h0OFJqK1loL1p3b2toeFUyQ1hTOHJ3T0xmYjk0L2du?=
 =?utf-8?B?VXZ0NzZsVHFKS3FJVVVvaS92VlIxK3FSK0tQOXY0UlZHaXBVY211c09YYzVx?=
 =?utf-8?B?eDV0eXhwc1FlaEFvUm56WEVUNTN0djl1dUtxekVjMEdmRWNyOUxkNXJqZ0VT?=
 =?utf-8?B?SDlhakNxb2xKYzFGRWV5TmZFQzd2K2E5d05qMGdrTXNUR2hPSlJ1bVdBcklD?=
 =?utf-8?B?TWRtWHEwQzYyS0UwUnhkaWdEb3lXS1JxQzkxaEpsWGZjRlArdlY5T2xETWF2?=
 =?utf-8?B?MWxSUDBVN1NoREI1TmhBUW1rVWZmN1g5bzhRK3NKbTBQeDFRNjQ4YXF4UXo5?=
 =?utf-8?B?ODhOcU1LUDVTclBXNEtlRk83b25oTmFvb0ttUlJ0dkpBS2xkQjFXczBwMTNn?=
 =?utf-8?Q?te3pNG4hN49V2+IkNMNP0logLHrk99MbJ/JRw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70740327-3916-453f-1e1c-08ded1d0ae53
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 09:12:15.0691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S14fnhoLjar02jsHfU3137EqOU0GfHMpTiPf9jSj1wZTn5YAZdoTeHxeENNAi1UUpX5r7K66xvTSfKTwkRzt0/Ofj7MGIVcPi7z3oUrpOMXY/xHXqpiqSuqSBHyxWYxE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7745

On Wed, Jun 24, 2026 at 08:30:00AM +0200, Stefan Wahren wrote:
> Hi Xu,
> 
> Am 24.06.26 um 04:50 schrieb Xu Yang:
> > On Tue, Jun 23, 2026 at 12:23:12PM +0200, Stefan Wahren wrote:
> > > Hi,
> > > 
> > > during debugging USB OTG on our custom i.MX93 board, we noticed remarkable
> > > differences between the implementation of the chipidea/usbmisc_imx and the
> > > official NXP i.MX93 Reference Manual [1].
> > > 
> > > Is the USB OTG part including PHY of the i.MX93 officially supported in
> > > Linux Mainline?
> > Yes.
> > 
> > > According to imx91_93_common.dtsi the USB IP of the i.MX93 should be
> > > identical to i.MX8MM [2]
> > > 
> > >      usbmisc1: usbmisc@4c100200 {
> > > 
> > >          compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc",
> > > "fsl,imx6q-usbmisc";
> > > 
> > > But looking at the PHY register definition and reset values in the NXP
> > > i.MX93 Reference Manual,
> > > 
> > > the registers are comparable to the i.MX95 [3] ones.
> > > 
> > > Could you please clarify which source is correct (Mainline DTS vs Reference
> > > Manual)?
> > The Reference Manual is correct.
> > 
> > > Looking deeper at chipidea/usbmisc_imx shows the usage of the following
> > > register bits
> > > 
> > > #define MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL         BIT(0)
> > > 
> > > #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0              BIT(1)
> > > 
> > > #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0              BIT(2)
> > > 
> > > #define MX7D_USB_OTG_PHY_CFG2_CHRG_DCDENB           BIT(3)
> > > 
> > > #define MX7D_USB_OTG_PHY_STATUS_LINE_STATE0              BIT(0)
> > > 
> > > #define MX7D_USB_OTG_PHY_STATUS_LINE_STATE1              BIT(1)
> > > 
> > > #define MX7D_USB_OTG_PHY_STATUS_CHRGDET                    BIT(29)
> > > 
> > > According to NXP i.MX93 & i.MX95 Reference Manual, these are bits reserved.
> > > 
> > > Is it correct that the chipidea/usbmisc_imx use these bits on i.MX93?
> > i.MX93 & i.MX95 no longer claims to support Battery charger detection. So these
> > bits are reserved. However, at the IP level, accessing these bits will not produce
> > errors. We will remove .charger_detection hook for the i.MX9 series in the future.
> I think the access to MX6_BM_NON_BURST_SETTING should be addressed, too.

Yes.

> > Do you want to use Battery charger detection on i.MX93?
> No, we don't need this feature in our case. We suspect the cause for our
> issue comes from the hardware design of the board.

What's your issue on i.MX93?

Thanks,
Xu Yang
