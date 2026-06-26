Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013023.outbound.protection.outlook.com [52.101.83.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AFE391E7A
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 02:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782441641; cv=fail; b=SLhi8hVdroeQ+WT/P8k8vKmwsb3fuSiW6UFkoMPZPsUbhzBmej7kGJ+i7Hlot+K2ipWHhMQ7eoqRKugNZTX+gzGn9/aBO4OywpBQFN4HQWa7cDXYjw631MJmnm7NJSi+nDLSXHEs0NA3+DtFGbtKdGEHOZSi3pwcvRrnXtQpknc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782441641; c=relaxed/simple;
	bh=9wYfvW23YvFs1bvXpKqy1sYhPO1d0ZnKjP7mBH4RGxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pKObqTWdK1PPgx4XHCOaW+6jsFetLKtYd3lFDHUSEM7JtoUi7gR9lu/YkEW64ACGZW0iOassex9aAGnLhaBPhcq0pUzI6wclc/0RJ1yVuuDhD1bavUmJOO5yS7kISUfeGVCHfE0OV0Ya2Swyff3mxaPN8fkvEInRMk6KrYagu08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=otXFvmaZ; arc=fail smtp.client-ip=52.101.83.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="otXFvmaZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLsHcfdcybYTs3mCWHOQFKt6eyRg1Zw3PDCqgyRMWMUWSxVXlyopMxt6IPQpeDHpEtP08feDTINiDxDit4VQhNfFjfDl0MvGnKXI9534Q5h/iZKSn40E+SWHRgCTYdrjP+EN6y/jBDGsGMVnWdyL4oTv2j+K3cTSX5CWONMMfvShoj+rsB6NEFK9ZVnm3QJJwlWJfPMwj6Xozd1dVfS6KjCwQChL7rLZKuVMt1KR7aG+2xplHwtYp0Wu3Om81cgOTdvtBSjHbbxRb3djN3/LpGEKH8F9Ugn72MxnPrOR+QLtq/LKyqtiLJis4ZSSzrAoKvw9Z0w+a1gSsqh3IvBq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SY9fB7bT5x6j7PBT0QOYVCBdraeT1PC6J/Z6r3RE6V8=;
 b=siHeA9z7QoyWXQl8ibNmjmX1adzll25vRxXgYd3YMUrOckJ+VknpE4GfHO3mOunrK23uIi/PZagpS36WbQPfewLDueJ16urbRAzcVG6t+S+2qAGrxYMQqWrUIxgSTXiT8WbR/ZoxiVyoWf87AozJgQovrT8jVPOu3LG0njKoiT/jjkKojXbbnb3cEpcs/3qeOXqwuYRSpFZjZMPeJgZtxv6ZR4lUQ0CS+gAxVGg/oaB0lgiHslT9CLrEHzm27rT6gC1utf7/E9lql+Vss1AtRLVHBnh2xWlw4l9exx2YQvO+G63ne+mZmHBLl/CCHNFah3ijrA/iXx02RUZG7EIqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SY9fB7bT5x6j7PBT0QOYVCBdraeT1PC6J/Z6r3RE6V8=;
 b=otXFvmaZ69cYSqaUg9Wy3ehj8BDtACynb3ChlT0nUAhcYGP8lPbvyOUrGkw3pHh8ziJdQj1ir8eRCQ2le6sB+0tNvdYJJh0Zwy+JAyhIeU+CdN5a6asvBRXMxJv+ItZ3521g5Gsn0DXV5LmR/0BdYYx2hcLjW29njlHTA/qE7e5fsrpPtPxHC3Z+Ng5B8pEJFFiwd7r7hQ88fblJhcLPYpmEuS7VBnhfDGBZ29wRr4Sfp1hEUGzGw28VMIRMbu/hDhYtme+3mve1lACUoBApUG44Id2lvEddnKGg5QqqGsq9KPqczxakC4+7IevZzBsbViNFV3ZMx70NBa9ObrwWZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 26 Jun
 2026 02:40:35 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%5]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 02:40:35 +0000
Date: Fri, 26 Jun 2026 10:39:21 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jun Li <jun.li@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: chipidea: usbmisc_imx: i.MX93 support
Message-ID: <n7z5b5iq6aqre7hmbw2pawhskolovt745g3fia5hneli7oiiwd@ovrboc3ujxib>
References: <b2fb88eb-5c5f-499f-9cee-6a69769c578c@gmx.net>
 <ibkjg6bymxoy5wcewrfn4y63f5izlh2yvdqjt42a63kvttr42w@tvqjjhfjg3u4>
 <40e4df43-5de8-48fb-9c5d-9ccb437e63b9@gmx.net>
 <lwo7rsdsfuibceyz5qoi46bbrhmofjpb2e3ukzdawieou3uo7m@5o2ral3q4oaf>
 <07bc94cf-2b89-45ce-b36e-d07af6749ef9@gmx.net>
 <sbu2axah6vjys2q5zpsurdzlto33zbcpexmfn7uhpnxzkmnmle@3dl2jvt4hb5t>
 <f1cb93cc-40ac-4b88-bc0e-94390d1f6a99@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1cb93cc-40ac-4b88-bc0e-94390d1f6a99@gmx.net>
X-ClientProxiedBy: MA5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::17) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 283eaa19-2d91-4275-c63e-08ded32c4cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|18002099003|4143699003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	p5+sWJJY1JuZhfLhz3cJ6ASeQDtWhv+y97K1UQQPAX13/gECliQqBzIypTs7k7N2WOx9mQ9wpMNjt18wvi9PTV6Z1Jp3momTy5byOL8B9iKnBccSHLF3sHjnhnIu4TlM9EIwTbHTb4yNMkxypfJSViCBLo/8XBEBtLu9E+EizrvzhIc1k9eZ1W61QXL+kttiIDrJ4GIWVUzb62SacqiVXoEys+ABVonD2v/ZwysmJ5MrTeecfeZvdZHmip4Kmlz5qRogXR3sxEvbDuVpx89WHNZ8U/5k6u6nkUSAQfbe/jNxSJUbnfnMyoC48N0fwfg6m7S8BTJpNfGT4m0JJ5YF/pr3hEMPPbTFO/VBD7UfdB/6UPfd8dJ4QeCQN5m1jG9OMQzUADiybRZqqVSQ3bXfY8y6li08pCANU8yK1yTQDov7O7htERrf3IBfUt4pg3TNlh1bcSw0cWzf1fMbGIOj1ZkUl0zV1EY7qviV/2ctvH+TFxpGX3CGN31rQYoP93qoxc0GOdN12kTAtAMW7LJxHs7S0LP1xxTXaPzMYewNz4gmV2O/g+cIvKP3D1cG/8ByD1Ket8bGS+BJwPP4qmDhD/SOIwvDRcvkdm4A+eQqpIRvaFrNsdHdrqeB/9W7e8SEcdPR4ky1T3fV+VFNvIsXmOEcfwXhmMImZph0iPSsJ4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(18002099003)(4143699003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bncrNjU5OXphbUcrZGl2YlpvTG8zK0NDbEd0K3VGOEFWaDJjOXZLd3dpbVc4?=
 =?utf-8?B?TlZqSWU4WUV0RzdhK3NkRXc2R3ZTNEppT3Y4Q3ZFd2s3OUNpOVdYRjMyZGVS?=
 =?utf-8?B?bm5zVG1QK2lNSDE5bHhwSEZMNHRSSkNxVzl0NEdtR0N4dHdNVHdGOWVGeXMv?=
 =?utf-8?B?Unc5aUhYYW1qcXplcmJNRHJqNnJFZGszQllKMnNPSEg0elI0dzNSRjB0RzJM?=
 =?utf-8?B?T3VhUGFlNEVDb0kra3VyNjgvajN5WElDdkxyZUNXYSttWUVnQzZId3FOUDZJ?=
 =?utf-8?B?TTlSZGkzNlI3ZjNrbnVWc09FVUxmL3dXQnFhbGx2dXJpQ1JnNG1BaE9LVEpW?=
 =?utf-8?B?eWVoRCs0YUZoQlBnNkVKWGtUL1loR3ZUV0t2RjVJcGwydkdjbDNFbzkxb0FY?=
 =?utf-8?B?TjF3bWZ5d2xLMkVsZ05TRHlJU2RlUkxzNFFHUGdmR1F1OFlqWDhDdE5uckpI?=
 =?utf-8?B?NXIxQlpIeVVTMlNjdTV5ZjF2dE9WNjU5c0ErTmJPanVqQTN3ZXBNLzRvMXFO?=
 =?utf-8?B?VFBhYXV2engyZjhrK3FENVlvVzJUZlkyTkV6djh5MHVUajhhbDBNMU5jb0Js?=
 =?utf-8?B?Y1lRM29EWGxzUERUOWpTajJ4R2hpZWF3eTVVQW1RNjY3VGo1VnBQVzlWaTlK?=
 =?utf-8?B?Smg5KzRLbFJXenNnbGJJQ044Z3JNazduQWdXQ09EZncyM2NyY3ZidEU4Rkg3?=
 =?utf-8?B?aFl3UzU0SkhNSGNuMWUrekI0UXA5eDIxL29uRThqV3RYTisvTmpTUTNSZ256?=
 =?utf-8?B?ZDBzcUxhR25YdU1CUzkwMjVCSWZ1c2ZrVnY0UFU2aVRSSXJyWkxEekt0dXRD?=
 =?utf-8?B?T0xKN0s0b0pHS2ZJTnF4dml1bDlHR0U1blh6QXQxY3Y3cmxaOGpzNXZTYUFS?=
 =?utf-8?B?UTFQRWRBeUVVbVUwVmNZWE5ReWZYMnVXa2k4N3Mvd1lCSERBVjhhUjMrL2Qx?=
 =?utf-8?B?bmNVZHVhQjdreWkyQ2tkQ1VUUlFZVzlsd2x1aTh4TGNRdkZiRzlBdHU2M25D?=
 =?utf-8?B?ZDZsNlNoSW9icmQ2RU1ZUDROcEFiemhtYjd2aCs2MlZ5ajFjWWpSeHBldEVV?=
 =?utf-8?B?UlVMejl1ZUhod2txdlhwU3oxUit6Yng0TFBQUlJRTm5PbmlyWTVRazBnRE5F?=
 =?utf-8?B?NFY3RklvczZZc2pyZUU1bWtDbGJxQmlvWGRQbXRZVTlVQzB1SkR6US9VeGdW?=
 =?utf-8?B?a1BoVlkvcmFDUDAwNUNyTDFRSVdueHVFTGQwbWxNYTlkZE83dUlDTDRRZHFz?=
 =?utf-8?B?ZFgyLzk3UENZWlJidnZVRU9Kclo5OERLVXlKTVdDemVmMGFMSWY2Q1VrWXVT?=
 =?utf-8?B?ZExtMitOUnBnMzJFRTdva2RiNW1hd1ZlaUFlV3FIUGlyb3lKenJXQWIyWmdm?=
 =?utf-8?B?R0JGc2hSREVDck53bll0N2RFMCt1dEJObDI1VjVJOUNLd1J0TThMT1crSG5z?=
 =?utf-8?B?aGhvQ0piRU13a0hCZVhwbGlDbkw4allSNWIwNUxlMStGZG53YzdFaVp3U0pW?=
 =?utf-8?B?N3pQT1lOSFQ5T0YyMDljUUVTYVA4MjR3OGxWTEpKNElFZVllVDBhKzE5UUpr?=
 =?utf-8?B?S3ZXWkNvb0NjOFF0VWZxT3JzNWszSzBiZkpFbHorbVVsb1l6ajV6ZXZ3VjNn?=
 =?utf-8?B?b3lBMURDOWVQcjdmdENjK3RJd0M0SnladU1JRGZzeko5TjFLZzNic0JDNlA4?=
 =?utf-8?B?Vm5DL0E3bXdYTHNDand4Y2EzN3ZManJZL0p2N1NuUkZrSzdqWUpLOTZoTnBI?=
 =?utf-8?B?K2RWZU9sZlBUMlVQcGxuak00ME1rQW9Lc3I2dnFXeTZQSkJRcXlUWGJnb3k0?=
 =?utf-8?B?SVB1V3VRNGtmdXNqaC9hNlF6dzBkQ0k5MThDcXJuSlY1TkhYK3Y3K2E1YktC?=
 =?utf-8?B?WTlRN242V09DRnI1NXpaclBmUDNXTGdpblFwK2Q4YktVRWZHRXlVaTBXemlm?=
 =?utf-8?B?VGZSZkdYam5LYTRYeldESS9QVUJGQk14b1NlajVZd2xxZGczMHZpZnNpT01k?=
 =?utf-8?B?eUI5aCtITEsvK3lhZkIreEZpZ0M3bCt2OENhaEl0QjhOLzBVaFNlT0J6a1Yz?=
 =?utf-8?B?Vjg0MlNGeWRiVW0yc3FIOU5YQnU2R3ZxeFFzNkdQQW5zSVlDZTlzR2VtMkZl?=
 =?utf-8?B?MDlHNmVTbk42S1lzTU5WUXRVZThnNVdHQWFVTFZzK1BTeUJNZklTdk5VVnpC?=
 =?utf-8?B?dTRJcjFtOEVUSVgwNzlFMUE2V1FEcmJjQXVPLzlERkZCMWlpTGc3aVBIVEJ2?=
 =?utf-8?B?QU1ZVlk3OFpxUHhJOURVZVY2akl0SElxUzFYdnVMVnlZcEJZQ2w4ZStyeGR4?=
 =?utf-8?B?SzFrRkZHNU14ZjR4bGt6NW9HYnJVck91NEhBRG91WUJ2WU8rL3ZRYWtMRGdU?=
 =?utf-8?Q?BjPP8CetKw1p1vm7Ke1hhurVAOF554sP4ZGyG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283eaa19-2d91-4275-c63e-08ded32c4cac
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 02:40:35.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtpW2U8qd98Hi8PxyCBgvGs+M/8BhYE4pmVAy/S0aj73pdQRp6EO332of7h0GU5vX0qrl11UohPRP9FakT3WC8WyXHwHDh7nlJpXQkzAK5/occN2ZPfnauxY4e+a/SWD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146

On Thu, Jun 25, 2026 at 05:22:20PM +0200, Stefan Wahren wrote:
> Am 25.06.26 um 05:07 schrieb Xu Yang:
> > On Wed, Jun 24, 2026 at 12:05:00PM +0200, Stefan Wahren wrote:
> > > Hi Xu,
> > > 
> > > Am 24.06.26 um 11:11 schrieb Xu Yang:
> > > > On Wed, Jun 24, 2026 at 08:30:00AM +0200, Stefan Wahren wrote:
> > > > What's your issue on i.MX93?
> > > we have an i.MX93 board using both USB interfaces:
> > > 
> > > USB1:
> > > - external available via USB-C connector
> > > - OTG interface should be able to switch between host and peripheral
> > > - as USB-C interface control we use the TI TUSB321AI [1] (while its DIR,
> > > OUT1, OUT2, CURRENT_MODE, PORT is unconnected or tied to GND)
> > > 
> > >   USB2:
> > > - used as internal host interface
> > > 
> > >   We have the problem that 5 seconds after disconnecting a USB device from
> > > USB-C (USB1) interface, the USB driver complains that the VBUS is still to
> > > high:
> > > 
> > > [  144.078347] usb 2-1: USB disconnect, device number 2
> > > [  144.083425] ci_hdrc ci_hdrc.0: remove, state 1
> > > [  144.083521] usb 2-1.1: USB disconnect, device number 3
> > > [  144.090310] usb usb2: USB disconnect, device number 1
> > > [  144.139325] usb 2-1.5: USB disconnect, device number 4
> > > [  144.158700] ci_hdrc ci_hdrc.0: USB bus 2 deregistered
> > > [  149.190274] ci_hdrc ci_hdrc.0: timeout waiting for 00000800 in OTGSC
> > > [  149.196741] usbmisc_imx 4c100200.usbmisc: vbus is error
> > > [  149.202078] usbmisc_imx 4c100200.usbmisc: Error occurs during detection:
> > > -22
> > Does the VBUS be turned off after switching to device mode? If yes, how long
> > will the voltage of VBUS drop to 0.8V?
> The regulator turns off the VBUS indirectly, but the voltage is above 2 V.
> AFAIU the discharge resistor is missing.

Yes, then the 2V voltage is the issue.

> > 
> > > But except of this, both roles works as expected.
> > > 
> > > Here are the relevant device tree parts:
> > > 
> > >                  reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
> > >                                 pinctrl-names = "default";
> > >                                 pinctrl-0 = <&pinctrl_usbotg1grp>;
> > >                                 compatible = "regulator-fixed";
> > >                                 regulator-name = "usb_otg1_vbus";
> > >                                 regulator-min-microvolt = <5000000>;
> > >                                 regulator-max-microvolt = <5000000>;
> > >                                 gpio = <&gpio4 13 GPIO_ACTIVE_HIGH>;
> > >                                 enable-active-high;
> > >                                 regulator-boot-on;
> > >                  };
> > > 
> > >                  &usbotg1 {
> > >                                 vbus-supply = <&reg_usb_otg1_vbus>;
> > >                                 over-current-active-low;
> > >                                 status = "okay";
> > >                  };
> > Does USB2 use the same VBUS regulator?
> No, USB2 has its own VBUS regulator. So the usbotg1 node looks good?

Yes, it's fine here.

Thanks,
Xu Yang
