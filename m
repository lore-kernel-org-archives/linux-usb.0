Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011050.outbound.protection.outlook.com [40.107.130.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82AC3AFD0B;
	Thu,  9 Jul 2026 06:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578316; cv=fail; b=MqT42iAoS8RB9Tk2ytpnJv9H/B4R2Xcc2zLFeGjHHXf+ZzPQRkdutRng8WArCX/awLXxzcZK6DJxo1aVwNfK8OPF/n23PHexhyVTm95v2v5PzUYKW6ekIywWuRR5eG7Er14djEF/ePnqNKUypEvL5U7j7n3/r6j9Q6iWFUaIo3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578316; c=relaxed/simple;
	bh=2d9nQYRCpU0ZX9iY70NZC34rgSdHqH9tTZKduvdG0oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qDwJDXSEJp9KwFU3JO9bVhAlGI6UDZWw+3hjcjb6xOG41YfGCuN7eWMgZ2PA5VUKrX73uAfcUK2rmrQw5MuHo5Xs9LHpmou6LAlkdJRFN0ILBwMUTQZGDDObCLDLuVNWoQAZ0BWAT75ofCr5bn0wR+a8jfsGrW/TkZXI5WnnWkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gmqX9rq7; arc=fail smtp.client-ip=40.107.130.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gmqX9rq7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pv5MDS0ae79qGXAE3IrO/6jJ8rbvmZDPhMNzX+KyOk2BW2+sEnpzjTjsY+DDy11DBP8/CIoc2ddBcxicY2tw+RSz/LKep2kLOA6KhYmsq53gWqBl4ydGXk91bYYeCrxhHI0iNiOqKgqZm2hb70UuWFcZTfoV2LashzWRxpCZWS8N8W0E/+8LjfWoZEpogdQ46pkW9G5GAD/bnYE27ANa7P7YbZXXCJwC3kgBMCGMQEnCyHkN/gizmxTbM/bmsoywFzw3mdDjrzlMjV8lzG2VZ4S0OiUGJT9SZwbdm2KuGaRDiZJlL6YZwLeiCCO8r11J7z4cKuhbHih1/QrWxykAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQmchxe+xSgfJF7LoN1Rl+/HEztPixtxl0Z1mz7Nf9Q=;
 b=Ptvw7epkN89DZDsU87l+sbjVjOvme7R2TPz1CpWe89am8YfYrQYTAOUSNPSqWm9HOLmoD2C605Kt2VsqKD7MQ+QeOUbaxXGGMuyFMkZuvD4t5vKUL1JmTBRQyON7OPMK0+MI+E71oHbpSpzhRDW9JzpYgmtLr1gTXVWITW+D52PotTPVqX0RGoB5QsX82Gtdl42I2ayLTpO7QLmLreSZ/tFeyYTGPPhlsN7rsQrLFpfbdjyIow//YGzHNHkqUrq71nuaQABv/Tihpw90/e4oc01o07WCIKqFQN4+1rzweQWMga8CVSy3vSS2Yis9ZMqu+LzcO5cPYbRSxJtUDciJFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQmchxe+xSgfJF7LoN1Rl+/HEztPixtxl0Z1mz7Nf9Q=;
 b=gmqX9rq7oAIx2rda/Ro1qmkqZ0JmYHBS/J2yMqC4rYWHTmX4KZ5w7WAw/PdpzC5F9oj/zthjPxg5qX8SLv82HJtcPVEeeR5EHRImZEfHILVFkFCXVmCES8W3BethQvXg9AaLJii7dmcwlNrAYCWcgeUDMuPwdHitudqUGnnAzZSFpld44fIKfou07mr9fuSHDLSpu1zRoHfikd3BZqERCuzUzSAzwIVC6p4gkV2gZoBVglfEt/Qe2LIo5/nmxqlFqTrUhUc2KUCwwGMc7wI4cEPQZiDxo04NN7RZZkIvDp1GA3O4iTroW30Cy52rm4jJ8Jx2CGyvSMP94DqRnGJVhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM0PR04MB6803.eurprd04.prod.outlook.com (2603:10a6:208:187::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 06:25:11 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 06:25:11 +0000
Date: Thu, 9 Jul 2026 14:23:51 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Frank Li <Frank.li@oss.nxp.com>, kees@kernel.org, 
	christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com, hataegu0826@gmail.com, balbi@ti.com, 
	andrzej.p@samsung.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <n7h2d72m2lqdnrtvlbztwrkfmmzsh2nbb77luwomxrcyrpimuk@fdlg44plusyw>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
 <2026070831-peso-aluminum-df0c@gregkh>
 <ak64635tgUj3MPEx@SMW015318>
 <2026070922-density-onto-3ce6@gregkh>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026070922-density-onto-3ce6@gregkh>
X-ClientProxiedBy: AS4P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::13) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM0PR04MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: f37ac811-2e2c-4199-6ac2-08dedd82d40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|19092799006|366016|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	npRk1yfqNiCF1PfrsQ0ffcbRvv6AuH1UTXg6oqZV1yiLmRRyLbVYAz3FYyyKTVsRJ+B59vmlYPT30iWxmKo5bmdSEs1rKzZXMU+6ew/PF0zZchr1omE3uQZA27cBqr/Gcip7RnmtEv/rgkteFiL4FYHtWuPI93DZ5QwoETxBdQHtjyGcBpg82dxnrGSSidh+rT6U54KWtBLbjv8hNk4RbfBIq1dYg84iemyKpA+X0WfTq3yRw4aK99L0/xfLKbC4+MMeKt6Wij8PADj9CYXB/MnmNHIHpCXp7Ja2M+QCfpDti70rJXU6axOnswMFEPX2lLRno2RSIkbh6ioS8GNUU6g9MLfCz3+gd2PSKmIz2oLYz7/3zGGszmh1QkocDJb3T5B1mFntCVLz/F3Fiew+q8VFy2d6fhyhSYR/EiUTt/Wead+irUGl4eOWxAT5vMxNvfGDoZBvyHfRZ5DyUGXjETz5VxsVkSfNEgJq2vj7j4GD5pXoglPnasokXghcQrX2U1st681A1A083MJ6R0WmbryR4GyGSk0RK1soQ0Eojx9EJqI0Djou2hznxOytf421wh7z4YFf8iYKodK67T/k1S6dOrVM64ClnXPSdPl8Z0ipKRSf9NWMWfPBKZWUTDzxKnyyTLXeCpH3er6TXwPTUoEwqA7FrdIVZRocxS4aGwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(19092799006)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlYvOWJ2WmVMV1huVmtXVGpseGp3RWltSVpFUjQrNHNkMTEyODlxWkRlREdy?=
 =?utf-8?B?S0p4MmlNdzR1cEdiSWJYUG5mNGlPVDZYNGFMSkhBNDFQRkNpcHFUWmErZGwx?=
 =?utf-8?B?NHpRTkhET0E2RU0rbzlYUWhUQk5HcVZxUFVqaW8vZ1RHUXRIakV5VXZOS3di?=
 =?utf-8?B?V0R3S3NpSGh2RDJ1aGNCNnlpMmVzSWlUSXY0TTROb2l4V0RYWWt0V1lCdTdD?=
 =?utf-8?B?bmJkbmJycnlWYlV4Qzd6T2JRak9aeTdsdCtsYTVPWTM1VFlJemhab0hSenVp?=
 =?utf-8?B?aFhEeGI0cFdmbjlIMjZjME9Pd05Pc0ZoMEtjTmd4OWhLQ2Q5Z2c2NWRIYUtG?=
 =?utf-8?B?S2FpNjNiMVJRWGZvS0w2ZU91STg2MWl0bmZmWnVpdk9EYkEwcXNCNVNhb2l3?=
 =?utf-8?B?SWwwZjVYeUVpZWExNzRGVkxHajV6akZHdWFtcER3bGVITklRSitKRFNMR0lP?=
 =?utf-8?B?VERlN3N4T3RIaU0xejg2SzBoMU5uQWpZY3JjOGNVdDF4RENvcG1jLzlYOHRV?=
 =?utf-8?B?T21RWjR5aVhhZy95ZEgxZ2k5dS9RTFMyUWRZS24vQXhlbTRlZmxFcmYvY3ZY?=
 =?utf-8?B?SXcxUTJQMHhNV3I4cnU3ZmRMWmlUaEdHUGk4RVJ1NGhaT3NGdndCNW9za0pZ?=
 =?utf-8?B?YS9DRnBDcEczQ2JmY3B2MmpVZjE4U2NaOXVodVFFM3piQ05jaE5YQjVRLzQ3?=
 =?utf-8?B?aFBnTGJzaWtEdkRBMU01WkdJbUJNb0ZNTTRHUTBrKzdLREpIZ01LRXlzUUFV?=
 =?utf-8?B?WEZ4c0F0SXQwcE54WTMwZno4cHE2TnZIb0pycGxHNnIzUnBnbllBY2NFT0s4?=
 =?utf-8?B?TzFiNHg5c2gzOHVIZU9qOUdCYWlqenFBV1ZYMXVlLzhodDFQaFdjbW1DMi9H?=
 =?utf-8?B?eWFlakdpVW9Vc3U2NHluaCs5RFJxWVgrSjdqK2RGZUxFM1g3U2EvL2FTZHZY?=
 =?utf-8?B?Vm9IcnQ1L241WjdyREh1V1VoeWRZOG14VCs1S0lPRXNNM09pNkw4d2lQY1p3?=
 =?utf-8?B?ZVM5U2pHSFFkNlNnSDJHUFhlUFlZeFpScm9wS2tuUkRwUUs5ekprRWptcFBH?=
 =?utf-8?B?b1RRNmcrclk3SUdDWmdQTGI4SkpxQXo4Ym1jZXhQcjgzOVdpcDljUGI5ako0?=
 =?utf-8?B?M3l4Z0lDdGxxbm4vQWt6NEtuSWYxdzZ1bkdyTWhJZ2Y2M1ArOXFvNlZNVDFD?=
 =?utf-8?B?Ny9hWmxzNlRESGgwUTZmdDJLdmRlUExaNE51eXFGT05QL2VIdFo5dnNON3pN?=
 =?utf-8?B?dU80QmtJbUlaaGQrVFRPOXo5QkpGaXpFbGZ3SWVJWTYvRFUxQVp2bkM5ZEdF?=
 =?utf-8?B?NTZOdXJFVlZ0ek90UkhOTHFXVUJoN2NGTWc1SEJ6WGY1NmkzZ2NPRnV5d0Ew?=
 =?utf-8?B?OWNwU3hRMzVYWTUyWDNQL0FmdThWM2dVWHg1Szk1T2kzNjhFcTNKZEhSZy9z?=
 =?utf-8?B?S3ZDODl6SDdSVEJJRU05TkNjUTcwOG41NFQzNUd6N3dVNkZDOENxRGsrcFNr?=
 =?utf-8?B?NFJIdG1DQjRxQnkzZnhMQzJLOWpyaWdFamVzbDE5Q2VxaVNEOXB5WEZNSjU0?=
 =?utf-8?B?WmhmelNUL29GbUtrODJCV1VsNXRFbHVHTWk4OEplMTdWenFGOUROeTZnUVhC?=
 =?utf-8?B?QXFnSHhRMHVadkZTNmxVK2QzdFZGV1NDU0JPdE9FRllxeG5qbEdWa0Fja2c4?=
 =?utf-8?B?YXZZMUVGWkhKODFyUVNOVGZDc0Q0UTZnRVBwZ2N5Z01zQ3ZjQ01ZMUtnR2Zy?=
 =?utf-8?B?c1YxemJRVkhFQjMxR09OblVnM00yQm94a0NzZWNyM09rYmtjNCtmS0RpcEti?=
 =?utf-8?B?Rko1bWpzK0hIN0hhUk9ObjFXZkRRSnFGSW5TWkE0U25TVjg2a2Z1YkFpR25H?=
 =?utf-8?B?UEVoMzJVbE1ERGtuZWdWYVlyODdFMDE0Y1NRL0dRampvSDhLT3dvV1Jqd3VT?=
 =?utf-8?B?cVFlY2dNdVVkaTRBQU0wVVV0a3Z1TEVtalJvWUZUcWtEekJ6dUdSRC93aXZi?=
 =?utf-8?B?aWlkM3p3N0ZmNUdEOWltN3IvTEFteGdvMnVCOENEVWl5RjA0Q3VTazNONFhu?=
 =?utf-8?B?OUxBKzY5dkpvRlQyc04wTzJmY2wxcW5UYkc3a0hRbUpoTHIzZlZDUnNlTHZW?=
 =?utf-8?B?azR2ZXhSL1R1S05VcW5PWW9zQlBMbXlhVFJ6S2t4NmFLUGVnUzVYNERSSDFB?=
 =?utf-8?B?cHpQZGpiVVdKUS9GRElsNWNiQ1BnZVJCeU02SjA5eWpnSHlUeHFkYkxsUXpx?=
 =?utf-8?B?d2d5TUtFNmFrQ3kxS2R2MldrdmNMbDl2ZVV6ZElqMC9iSXlMRFlHUzhyNTlG?=
 =?utf-8?B?bmt6VmJiOGRPOElNdXg2RUdHeGFjWUxKbDYwdjhKV0ZLS1FFWVlRZG5seG1W?=
 =?utf-8?Q?uqsT/4OPtB6xF0PyyrooanSUHlf626rBj5669?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37ac811-2e2c-4199-6ac2-08dedd82d40f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 06:25:10.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40O5j/l5btyQTS4Mdou/wdxmWcfONdOZP+gCAopXIy0hC44XUaYTNLFAAsP0Y4+jsiVDGL3mFNwV+Y3sw9tq9sG00gtX6LBrkDAJU/TkjKDYD1Zs4vlbh1SnVtFdM/fu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6803

On Thu, Jul 09, 2026 at 07:33:03AM +0200, Greg KH wrote:
> On Wed, Jul 08, 2026 at 03:54:03PM -0500, Frank Li wrote:
> > On Wed, Jul 08, 2026 at 05:05:03PM +0200, Greg KH wrote:
> > > On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote:
> > > > From: Xu Yang <xu.yang_2@nxp.com>
> > > >
> > > > kstrndup() returns NULL on allocation failure. The condition was
> > > > checking 'if (tmp)' to detect failure, but this is inverted — it
> > > > would treat a successful allocation as an error and return -ENOMEM
> > > > while leaking the string, and proceed with a NULL pointer on failure.
> > > >
> > > > Fix by changing the condition to 'if (!tmp)'.
> > > >
> > > > Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> > > > Cc: stable@vger.kernel.org
> > > > Assisted-by: Claude:claude-sonnet-4-6
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > ---
> > > >  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > index 5d201a2e30e7..e9f2632ce785 100644
> > > > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > > @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
> > > >  		goto end;						\
> > > >  									\
> > > >  	tmp = kstrndup(page, len, GFP_KERNEL);				\
> > > > -	if (tmp) {							\
> > > > +	if (!tmp) {							\
> > > >  		ret = -ENOMEM;						\
> > > >  		goto end;						\
> > > >  	}								\
> > > > --
> > > > 2.34.1
> > > >
> > > >
> > >
> > > So this has never worked?  How has no one ever noticed that in the
> > > decade this has been in the kernel?  Does that mean that no one uses
> > > this file/driver and we can just remove it?
> > 
> > I think just no one use sys interface to change name.
> 
> So it can just be removed?  Please submit a patch to do that instead.
> 
> Ideally this whole file can be removed, does anyone still use it?

This legacy driver is still built in kernel in multi_v7_defconfig: 

~/work/usb$ grep -nr CONFIG_USB_CONFIGFS_F_UAC1_LEGACY arch/*/configs/
arch/arm/configs/multi_v7_defconfig:939:CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y

It seems we can't simply remove it. 

BTW, do we have other ways to figure out if it can be removed?

Thanks,
Xu Yang
