Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013023.outbound.protection.outlook.com [52.101.83.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B022F531B
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 02:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782269505; cv=fail; b=lYZzZV+6saDUZ9KtWL1aRm66WRS+BTSjrd8i4JB6Ewo/oiwf1JtbvUcHOazZuNfOix6IIj6VUxWFJLWm9RP9KjGInTgW9/CsuwXjDKUumZYCJAY3SzjQ+e2n0snW4iS6FqxyzNvCHhD6b4NvOhC07cvwXpz9L9Ki0yFpz42+DMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782269505; c=relaxed/simple;
	bh=QYQ657+H7WTjxMroAEmm7NVGJr+QR329fuxTBfgUCc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RAJDPkD5G0xraaK3Cp4NAtiS0laytwSMx/XzxsKRU1niy29MDPDke9olv4q19w+ibJE2XKPn6F7yBm2E7BPOzs2YLP47ZjjKPkA8K6E+SM4W2TUgtiAaTwBXybwF2tQN59bx1gGq5pQWayxRUaEkqaxvawD8UDpzlArfF9pBYB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YoRvStdU; arc=fail smtp.client-ip=52.101.83.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YoRvStdU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HykfLQGBVOXAyEloNexPQ4MxIx1VLVPfQyqEYy0eP73LWaPVUyTH3bvJ/ZABkhFpVM7jJv6IdBeyPf/BEkMw5U9dO0Af0OsYaU7XXDHrxyZoRRA49DwV11Gs3jsT9zqATLPcQ4+U5ZwowYa/wTTy4kyCpgKSCFmXLgMHbGcN6irslrHLaKZXhn2UiS1fI8cqsXv/SnmCpUuihFr1o0P75l+F9yl9JcgPbpXibmn66Uk83NcSZU1wFxx1iPMYH7iutZC/c1i22R0pmU1wGcBJ9n15MWcbx3IM1t3KXQLatKtP/IF7otxUhG+FWqAX2FeR3qPBOtPhZxjsGfSGPF6Y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hd2CiytuMXtFPrKoztlETFLtwAl8oX9bD7JpGW2TGI0=;
 b=jqweyQAxzEEzWGS1ig5PSG5Zp+ViVQDQo4Zw81Kcgpjc1crmtRbuoQzptONYAJ2VghPA2hZtlme31q29TZ323tZ2IMg/NWyn/5kEo9OmfF4cxn5JL6rDTnHVHEOUnuBOiOppgs3lxFxldSKfVEdBEdwJeHPHWdMqFfOpjelEStBaRgkZR4FIfistl8e4LOUjp9O/EGiGdIptaHrgfgLGwz2SRwgHQ9Rgv68rjy4kZjcaCj8CNe1MDEfSzDIZMs5AT18P13giIIQRvI1/5B0cOyBo+X361uLtYhZzv4huFhe1vpUMwCMe8e098s6Aae5fOilDBO0c6BfTIwUz+rBIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hd2CiytuMXtFPrKoztlETFLtwAl8oX9bD7JpGW2TGI0=;
 b=YoRvStdUeyFvQrz3hdmE/tPok477cNqyReFCmGypKIIZh7/VdUiNzuZU4OH7ye+dZUa9KznhooFy7rgcE0Uk8+CNHH7Gsbyx0b0ycd3p22w9w7HUtzxW/GVvb8oRuPrEKEaeNCH8baTxglElq5EeOKNpTGCfx9NCLjce/r80xJb2foLBeUGmiGke8j0DDz/bG3RLYQJLv2jWiNkMrdvk4gMvZYg8kP5Z9YBI2RuaLghNh2lOjSWJLHJgmlXr9P76y2JruIAJLD5wDrj/bDZ73YgkMMZ8A3PY8wtSpGgE7A+vS6FjLzyhrDUcB1K4/wW95zyPGxADAQZEcNbH2XCL6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by VI1PR04MB6782.eurprd04.prod.outlook.com (2603:10a6:803:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 02:51:40 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 02:51:40 +0000
Date: Wed, 24 Jun 2026 10:50:29 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jun Li <jun.li@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: chipidea: usbmisc_imx: i.MX93 support
Message-ID: <ibkjg6bymxoy5wcewrfn4y63f5izlh2yvdqjt42a63kvttr42w@tvqjjhfjg3u4>
References: <b2fb88eb-5c5f-499f-9cee-6a69769c578c@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2fb88eb-5c5f-499f-9cee-6a69769c578c@gmx.net>
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|VI1PR04MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 5edb6c8b-06e1-41e0-c0d2-08ded19b83ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|19092799006|13003099007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HhGb+P0EGlTF/asnaUhrP5qQs+gMl94OnaAHn5DWSRpo95er4V1IbC8H4bDtoiD5j/tsyB959k2fIkZQD/YPWofLF/p3s4CeB9Y2udoMG+GrjubIxJY6Mt2lmjUJZihFJ1JZ7uKrQZHWrERlcBckWRJNBkTRHKzUAFNDkgaZl470cgzri2VGIjhLAXkrrDF2SwpX16EXOzBF5lQn+88uUN3ElVmQx5ElDSICSLHsw9QzQoMBjXOqBgtU/SV81pX2sKlHw7pXHbwTHXjRuqQin2ZP/1ejxmiPKlVZW7/l+a8aahfP+fK3w8VxTKWT06xfJBhe1FfR6QO9N4S4jsN27kv72I2LwfBVod9Io9UZaK0dye6pzISZKLIP/uxl2kV1IBQwUHwmU9hlyMjcUvMsC8bQCzPLwE7qV34L3FutobA8pHB5Z4YNarMl6fUZLGIUYupelmJDjF27Kp5zo5tkaTuRNRxMKf7Ewvepluetf4t1r3hBCnSG+jyW1BBGIJWGQ0Ij6nlvlCJ3M2TSqBVVKY4zM3qfA+lECBOkTjD6tYc19/Mp/7KSe+g+8ipWubdnwtShL8yE3POX4N5MkNvQx9Pv7QUvScLSrnuiovCbSlC1amXVd8L4I6HAD5pCC3rz1ZY7lFEGXMEnU04obcnhnlpC7otv8OmXyx14BI8UhnM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(19092799006)(13003099007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWZUYUFxV3FpVXdZS1pCSFd0ZWl0SS9mckxLb1ZsN21SaHYyVmUveUtVUGR1?=
 =?utf-8?B?WXNFWXE5dXZyMFFZRUg0SEdlZ1N2L1REYVVZa0l0QUErZDRsaGJ3UmVhQUpp?=
 =?utf-8?B?aE9wQW80U1VkWEd5aFFmVWdIS05wdGJhUjFRR0NKMUk3emVFTTdBbGw4OU1P?=
 =?utf-8?B?T0E2Q2piaHFtZVh2UkNGR0FsNG5RVGV2cUZvbVdsVlVMQ09NWWYrUGJHZy9W?=
 =?utf-8?B?WktYbUF1cXZuRnp2VS9USTI2TzE0REtWRGFUY25aTUIzVmgwY3ZlT0tPL29z?=
 =?utf-8?B?NmNpSFhnSksyT1hFdzdvbk1HanFmTFg4Qk95RWFwZEVEVEpkbStINGd1amZM?=
 =?utf-8?B?bStrMVg0aGVMMDRRUE9Td2Z0QXJtQ3N1VVJMNGxyeEpSZkt6U0ZYVUhrZ3Nk?=
 =?utf-8?B?RlY4VVBrUWdScUtwZFBPbld6eVQwN2VoQi9nRjlRbEI3NXY0R1ROTlBXSElz?=
 =?utf-8?B?R0xpWmtLZzA4QmJjNmZIQlFydlhEc0V2Qk9YTlFSenBKTlBJdHdCaHk0VHd2?=
 =?utf-8?B?aENCS0NvTitsb3A3S045T2xJenlNZWxCSGdKSGdGcVRod2ErK1NXZ2VLcWxI?=
 =?utf-8?B?VWtNMmFiMEN1VFJjWWJOMWhIVjJVUzRCUnpKUmpsdzhPbVUwUzVKb1B6aXpl?=
 =?utf-8?B?V0YwRDJqbnFtYU9wa3NHYXVxblI5SVpBTTFvaFowcGl2ZHpNR05MSGUwd1o2?=
 =?utf-8?B?eVZETmJqVTVxM0p3OXpxOGdjdUNqcjh0ZjRHQndMSUdNK0lpeElya3Z0OWhw?=
 =?utf-8?B?S2hNQllnZ0llKzJzdTU0ZmNsZlJ3SDZWTmZwVFpzaDZSQU40SFo1eG5IOGpo?=
 =?utf-8?B?SHg4RmhaWjQ4L3JFNEdZODVrcCtWWVRmNXo4VFRtSnREZEJFQmIvdy9DWjZC?=
 =?utf-8?B?RXZnUHloL2tYaUZ3dWtnZmNKUEd2Mk02MEhNaEp3RVZyS0FWUy9sZE04Lzhx?=
 =?utf-8?B?UWlrUndTUW9PZm1DZG1HdmQ1SmJvQlpRbWo5eGdUU3pzdGFzNVY0UlR5RDhm?=
 =?utf-8?B?TllGaDlQMVZ1aEMvQ2R3VmdHWVc0YjhBbW16Y3RuU2xiRTlibkpSTGlzRGFU?=
 =?utf-8?B?R01kQnBSOGJkMXAxYlp0UU9hWjhmZ0ptSkNWQytjRjZJSi93SzhSUXVRZGwy?=
 =?utf-8?B?TlYvb1h4K2gyS2U5Nm9uQk8vSEpIZURqb1Z0ZXBLZ3ZiTUxqbHpDV0hxNm0r?=
 =?utf-8?B?eEppYUdkSG0zMTZEMzZHWmw2bnBieE95TnVFUlBoOTIra2FObGtjTUUyTksw?=
 =?utf-8?B?UWdvNGROY3ROUnZFOCtUMFV0K29NdXo4eHR2dHRNWjA3d3Awa3VRTHZrVllx?=
 =?utf-8?B?MGdSZkhJcmIzeFlMYjF1aDV6TTFNQ0c4MUZDKzBjQUxrcE9USmRaM1JRK0x2?=
 =?utf-8?B?ME0vL1gxOGhOS1NkR0pNKzFuZnNxYUVCbmw1NTZwcWF3L285OHI5NmwrYTdI?=
 =?utf-8?B?QnV2b2FuMHh6YWp6UzNNbGdkamtUaVhWNjVlV1lseGZleTNDSFpRT1owL3Fl?=
 =?utf-8?B?dU5TcUYyVzBhU21kNzdkZWMvY0IvZUtEbkFBanJVVktvYlpGSnQwWXQ4eXFI?=
 =?utf-8?B?WFlGZXg3Y1NtVENIbUdxc01NM1ZFRW1mOEJ6aFoxa21zRFQxTVVFYlhBdndy?=
 =?utf-8?B?VnBsa013K2d5SUdwRUhJWms1WXlQRlZwYS9IY0xUdEpzRDhET3FQTlVSVGh2?=
 =?utf-8?B?akQ4VVhWejgwL3hjQktGS1VaL2hzNWM2UkpxbmdFTHBqbUVzdGt1RDA4RjR0?=
 =?utf-8?B?SHRhT2NjcGlwczRKVm5WdkMzeGpkdGx0b1FlMEdsVGxuUXQzaTJ6MmREN2hi?=
 =?utf-8?B?aXhiOW8rd042d2xhemlKTWRwUEt6RXA4YUdJNXZTOHplN2tMRElyTW9XSGhD?=
 =?utf-8?B?V2FoNDlJcXhEaC9LbmVKWmVxa0pvS2F6UC9aekE0SFlSZnN6KzlMTEtudFlK?=
 =?utf-8?B?Z1Z1K2N1VFVnbDJ4ckFQWEQ0ams1aG1PcjlKdy9DMVhzQ0VPQjhRcGQzR0dZ?=
 =?utf-8?B?cFphN2pCWVR6U3RDbjBSZFZxRUNsN2thT2RSOVlmYmJiMTFJemZzaGt0RTZC?=
 =?utf-8?B?RmF5bGlNYUFPSCtwUWJJeTZmb2o0SVBhVElKY0dQVWN3NWVveTNwRzZIcjU1?=
 =?utf-8?B?bW1pZ2hBQ0JvV0VBTW1YQk1mczZ4RXRKc0xCay9SdlFYK203bDR5ZHFiMmFN?=
 =?utf-8?B?dnpnM01YZjlQSUpBZjFSZ2ZxKzdSWThaRXgvN2lKdEpvMURHSGZjUUxqUjIw?=
 =?utf-8?B?QnA3SVp5bWROczJGRjNQbkxFSEJYZk9HLzFDdXdTeEo5RXlvem5ZVDNWU2NS?=
 =?utf-8?B?QzB1ck51U2FHbEx5aW9SQXZxaEhVN3I0K0Z6QVUrL2ZVaGExYkFycGJxVVh5?=
 =?utf-8?Q?bRoF7OW2wKUyfDqvAdcCmrz9+w6n7+FZ+PE0m?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5edb6c8b-06e1-41e0-c0d2-08ded19b83ff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 02:51:40.4870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ioft08zDCfqVQt+fyjRZP56eCvWeovSoHLQkQdrWfR6EfitPgY+d0p5JTC88FWOm3q/4wHVInvf14pwp8U3+UKYhqmppyWzGee6V2VYHTVIgLaoSKLJ4VqEW50Ybc16x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6782

On Tue, Jun 23, 2026 at 12:23:12PM +0200, Stefan Wahren wrote:
> Hi,
> 
> during debugging USB OTG on our custom i.MX93 board, we noticed remarkable
> differences between the implementation of the chipidea/usbmisc_imx and the
> official NXP i.MX93 Reference Manual [1].
> 
> Is the USB OTG part including PHY of the i.MX93 officially supported in
> Linux Mainline?

Yes.

> 
> According to imx91_93_common.dtsi the USB IP of the i.MX93 should be
> identical to i.MX8MM [2]
> 
>     usbmisc1: usbmisc@4c100200 {
> 
>         compatible = "fsl,imx8mm-usbmisc", "fsl,imx7d-usbmisc",
> "fsl,imx6q-usbmisc";
> 
> But looking at the PHY register definition and reset values in the NXP
> i.MX93 Reference Manual,
> 
> the registers are comparable to the i.MX95 [3] ones.
> 
> Could you please clarify which source is correct (Mainline DTS vs Reference
> Manual)?

The Reference Manual is correct.

> 
> Looking deeper at chipidea/usbmisc_imx shows the usage of the following
> register bits
> 
> #define MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL         BIT(0)
> 
> #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0              BIT(1)
> 
> #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0              BIT(2)
> 
> #define MX7D_USB_OTG_PHY_CFG2_CHRG_DCDENB           BIT(3)
> 
> #define MX7D_USB_OTG_PHY_STATUS_LINE_STATE0              BIT(0)
> 
> #define MX7D_USB_OTG_PHY_STATUS_LINE_STATE1              BIT(1)
> 
> #define MX7D_USB_OTG_PHY_STATUS_CHRGDET                    BIT(29)
> 
> According to NXP i.MX93 & i.MX95 Reference Manual, these are bits reserved.
> 
> Is it correct that the chipidea/usbmisc_imx use these bits on i.MX93?

i.MX93 & i.MX95 no longer claims to support Battery charger detection. So these
bits are reserved. However, at the IP level, accessing these bits will not produce
errors. We will remove .charger_detection hook for the i.MX9 series in the future.

Do you want to use Battery charger detection on i.MX93?

Thanks,
Xu Yang

> 
> Best regards
> 
> [1] - https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf
> <https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf>
> 
> [2] - https://www.nxp.com/docs/en/reference-manual/IMX8MMRM.pdf
> <https://www.nxp.com/docs/en/reference-manual/IMX8MMRM.pdf>
> 
> [3] - https://www.nxp.com/docs/en/reference-manual/IMX95RM.pdf
> <https://www.nxp.com/docs/en/reference-manual/IMX95RM.pdf>
> 
