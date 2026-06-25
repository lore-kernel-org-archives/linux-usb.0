Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37A526CE1E
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 03:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782356923; cv=fail; b=DCAlFj2FkFyoOmF3o1niIA4sIPkSNJk2xlTr01CYSryNVXbayOb1N22PpJgCfwZ3lf8qYiT+/zgg43r3wgOFr+mouWd5Fjg2lKzPbXsCtM+IKfA6slCSmcc3BNYAyjcfJe4ySIqQuy0uMMxgO+7j+nfhoQQ8srYV6RTgBEyQRXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782356923; c=relaxed/simple;
	bh=iDXMQXDvnDbt4mZS5BdeTeLCAswZhfaAdLVtpwPflpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UAhHW4vY0Rg8D6kEsC1kksyfEwxVd7m7HM4hLdYH2CL8+VENNmmWWiEnMxbxzeOTzCPn7sRxFEXI6qQKvY+vBiv/hc4ze4wZIZ1MJfcqZSXe9vxlbgtDZPH2cmWSGwX3qjZhTQtkYE95y6+X4i6etzgBZj/TRgQJ9FwwEis4GYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=g6BvGXQ5; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="g6BvGXQ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbjAMDCRv4xv+vKYTe5eMOez47dWV6L14DXLJoY5uac9DaKDNxsCifse52CPE9AtRKt1SV3LkFgAPzog/Sl76nEMvKNVrYJR8/hvhjPN6p5+hGv4goW7RXY2LlgjBZ8eFZJ0a1qAt9VPKShftybemBWxdIM0I8itvvwnIMrORSt9gJlpIMHCFqxLXqzcO4FANro++g5EoC3hzNS5KITyMgWxvU5w3FV1bqdL3BRl15RBlyIfku4iPFx9bwjzd6Tx7NYCTebqGcd08sTJm3bDU6R4nQXvfKlC4oFm/eHDACMcbFNXHKnKiEAIICL5CkBlSlUE7rMapuTAjXEQks5Ezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGSTZcD5BqV+BTlncx/kKHVWGixIXysKdEoa3Outxgk=;
 b=Khf5Ws6NZoxad4nCmonMImtCPMWtLctjnsyxhXEDgkB1KhblpzJIjs/xcfBwm2jWvwNHJFBfnwkN93KvaU3zWDaHnwXAwScQcyR8PlMNSB2vzZ8wMroWuAK9ckhUxOioZ+vV5z9ijWox0qOMwRJVFkDbt2/vOqLG6xOUm8Hnrjuu9+5RpLZqvMmUhXZZ6Dg2LAxhKEMWKCscKe6uR3ungp7kKfVU1Y5JnsJa9I3ekgWzzuZfqStdrvyyWzV55L8+hsIWF39EPTciPlyBIu9YaJXrhDu4TfG0RC91zl71+l/s8Et+61Ft4zoytGMLXUXU7BN50RMm2F7EzikzpdmrEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGSTZcD5BqV+BTlncx/kKHVWGixIXysKdEoa3Outxgk=;
 b=g6BvGXQ57utNHj2Q2nYOI6gGVMKKSXtBYGt360dg1C+ANP4VPoOmlt4pYyQj1Y+VeHqKQrBZAShIiGGCkgL/SgkF3TerwcQsGCP8T94SIqLDC7wZHK59YM7KvF8IJAaKnNBav3T8C4GUJ8qw8PtCRDNhNup4hV9rbTVUz6mDmL6jtRNnwioixCLYasTZk462Nk8lJ1N6Kb6ZbZhMIZaR7k62viXPsq1CF4Cv1fAu1RUbLrE1JONM7hJJuvZdAfoTvoAKVUZDah0HWk8/uZPcM+FEd7WIxpVSlC2uliM5sYKqQqQ88IVrIcDAL1U8qHRfnIqkYDffv3+t3tDnbrmv8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by DUZPR04MB9726.eurprd04.prod.outlook.com (2603:10a6:10:4e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 03:08:40 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%5]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 03:08:40 +0000
Date: Thu, 25 Jun 2026 11:07:26 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jun Li <jun.li@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: chipidea: usbmisc_imx: i.MX93 support
Message-ID: <sbu2axah6vjys2q5zpsurdzlto33zbcpexmfn7uhpnxzkmnmle@3dl2jvt4hb5t>
References: <b2fb88eb-5c5f-499f-9cee-6a69769c578c@gmx.net>
 <ibkjg6bymxoy5wcewrfn4y63f5izlh2yvdqjt42a63kvttr42w@tvqjjhfjg3u4>
 <40e4df43-5de8-48fb-9c5d-9ccb437e63b9@gmx.net>
 <lwo7rsdsfuibceyz5qoi46bbrhmofjpb2e3ukzdawieou3uo7m@5o2ral3q4oaf>
 <07bc94cf-2b89-45ce-b36e-d07af6749ef9@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07bc94cf-2b89-45ce-b36e-d07af6749ef9@gmx.net>
X-ClientProxiedBy: SI3PR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:4:297::18) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|DUZPR04MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: c5eaea77-84d1-4c32-a96b-08ded2670e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|19092799006|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	u/IeoYrbk5TUAhfkOWkCkVDFFIQ987SixNrGYfxz6mC6EGUDuJLtc+zedrifGHnLWSKWHR3TaV2IHQDWDanPiB8eJkjyFtuTKnfy/Xh1ZTEseYboHnyoKETCAXMz8kC2hT5/6+T6BXJQGQhuSF5VtN496g7vJoMAdQpraiG6TNdbpTRf1XXB0rCv7QM526htw+o8h6kdOuEbIHQpN0/grQXjraxYXkuta6ZKYQlPPeVSlpnS7ALk288r6yvsic7iEnF081sZoTy2NlP52IQBjKY2Jx71Ivt3un/NwN71SuvLNFm7yuvrgxapAaj3f/IbJurT3z1jNytTxsArpqa2TcQbk/YVqtEOnkUHTDt6zON/Z9gMH9ECdHfwpMB2EfWoaJkSZw6uMXJDfBuMNZfFe/LmUEzmyH3dE79B3y92A/AQKK5fnNmVzmtegFI/ewVnRlW+QdXNcGLiiMG2XJk3AMWvP4yeTzR0v1K1tq/H5Z+I0Ji+iJqI1kVNjEy5SOtTz0oGFNWv68aYL0rjizokpIwJQdbw0t+c+1EVc6S2ykamiLQuZANWTQNwFnWzYI3WTv1MLN84PzDvEw7Q1Ql8SBk+3pmgunu8hYajw/mhdtnn1oGJBQZfWm/iVhvGIj753beG5HKVCdut+AH1aXmhQwsprz+0ZHWDUjfdvLSBYSU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(19092799006)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlhONndkMjR1ZW1qQk5FZXZwUlIyNkJCOHVHWVllVGVKaFBQaVhpMFJFRTlM?=
 =?utf-8?B?Y0x3RGczR045QnNXSkIxN1Y4Y1ljQ0lFaCt6T29lTDA0NDBuaXB5bkl6VERr?=
 =?utf-8?B?WUFTNFlWU0o5VmFTR1hnWGgweWx0UU0vbERXNGI0enBrTWxkd1I2Tm82cEZT?=
 =?utf-8?B?MFRuZ0hSSEs0N2hkK2pSTG5EQXJDQ2F1YzB6bWxJa2VVaXVsVytIOGI2a2ZI?=
 =?utf-8?B?WWZmSFhsYzRSclVSRTFmTUp6dDEzTzJCc2FvVEsrMWtrWnFRZ0Z4NTZ4aGdF?=
 =?utf-8?B?clVZeFBDbWJEV3hKanBwZlBlQ1oya1Y1ZTFOYS92THRSYWdBSFg2bGNncGd2?=
 =?utf-8?B?NWZwamsrczBSbUFnU0JlV05UL2hGYnFjUU9uRHp0NG9hd0lraExNNm5NMGNh?=
 =?utf-8?B?Uno5WW1ZWkJiTHF4YXVFMmhmQ25DaEl6blgyaHNJckJsUFlRN0FNajFDK2NV?=
 =?utf-8?B?SE0yL1RQaWhNMG96dXRwRnJYRGJtalloMjYwY2FjSERkVGVmeUM4MTJyN3E4?=
 =?utf-8?B?enVDQlBjN096UWpKRWxZRXBtby91bGhWYnFCbVZzSmFrS0YrbTN6Q0hmckZD?=
 =?utf-8?B?RVFYT3JMZHFtbEVoSXNjYy9xQ2c1a2tnaE04dVNKbnc1NjIySW5WcmxRa1l2?=
 =?utf-8?B?MDF4RWV6UitoR2J6bFpCc3R6dzJwMk00eStpK0dtMlhxTmpWSDI1TjFvOElL?=
 =?utf-8?B?NFlJc0twb1Y1WkMzWmRJV2lzMjZmK2RzYWd3TlJEWTNyK1dLL1k1Qi9YQUQ4?=
 =?utf-8?B?M1hUQlJXMll2TCtsWmVRSEgzdXgyZG5TdjhSN2htSmpEZEFaZFltdDU0NTVh?=
 =?utf-8?B?OXdyS2RERkl6ekUyWXlIekNzdTNpeWRscy91QnFxQlRnaEx2K0l4VUdYa3pP?=
 =?utf-8?B?WEY2RVhVZmVVbnNwQUZSSzRYOE9HdHRRdEFodXFtN21WU2NRSVZXQTVjcStQ?=
 =?utf-8?B?SU1oYnpwV1g4bXduWEFwcDgwYVFTZjBVLzZOZmZIdmZZRDR4aDRTZm1DVEpH?=
 =?utf-8?B?dSszL0k2amtYc0xGMnl0UEdGT2JReE1XWWZkTk9zUkZGVEtJSnpaSjhhUmI5?=
 =?utf-8?B?dXA4QWQzS0ZCNlhnbSs3ZlFnc3VXLzRBMXdKYlJtOXFydE4vUEdIaUtjdHZi?=
 =?utf-8?B?WlpCS2tGWUlZVjh3V3d2STR2VTEraWNmYVhGNkdYOHAwTy94bzg2dTE1cVBL?=
 =?utf-8?B?OXVyaVNWWHVXbDhGdXBiUHdCTXlVc3BFUVpCNDE0eEJ1cXhpWG9tL25ML20v?=
 =?utf-8?B?aVNGNlhjVUxNbm5RcDkwWUN1M3FCQ215ODZEVEJrMi93K1NnSkdweVpEZXZR?=
 =?utf-8?B?ZnZqdEw1Wi8xQjRibjNDM0VGVUNHL09oclNrV1dSNVBuL2NMRWJXaGZvcDVw?=
 =?utf-8?B?dlU4d0kwaGJtQ1gwOGdOTG9hbytxQ0g0ZXl5eDNNYTl4anl6d2NzcnRYN3Fy?=
 =?utf-8?B?Y09qTzBpV3ZoNGczMmpqaTJjbVFGT3doem5ZelM3Y0xFZ1l4TzdVS1UwZHJM?=
 =?utf-8?B?OXlkWkpsUmpVK0tiLzVDd29nK2dlT1Q1M0ZiYkxBNHNET0ZCR0M4S3VCZGVU?=
 =?utf-8?B?WjFvNkwwamlDenpLMW5JTjA1WE0wU2Z4NHZVZDZnOHBoM1lKK0JKcXZjWDNy?=
 =?utf-8?B?aUl5cU9RY0ZlQkxlUm5KTkJ1OE53ckU2L2FPUnZzTmpPeE5DbjBSRTZRL1Z2?=
 =?utf-8?B?NEVqY0xLL2dDcE9LOTk1TFJUa2lOK3FuMW9Jam1wei92MHZMUnZacUlDMHZr?=
 =?utf-8?B?cGlpYzBPakRCR254bE4xeVJHRHYxK2hyWHN5VEtkb243eEFzRFFJRXROUlhH?=
 =?utf-8?B?SnZjWFlybVdoMnlIdnNudWhnQkF3Q0g2UEdvb2k3SHlTME1uMWtIdEt1N2E0?=
 =?utf-8?B?Zi9JajNFRzlUQ3BXckpub2ZhL20zOWxCaFNHaVptTCtjMXBwSjJ2UkpwTkJ6?=
 =?utf-8?B?VnIrK0tHWU5Lek9ISU9NQklrdndUMWVENTRhNWlYV3pDR0FYMHppRHpHYU84?=
 =?utf-8?B?V0hTcTlwMEJoVy96WjhCYzc1VjVGZnBNc3B6R1MwcExScFVXZ2l4MkZpTUN4?=
 =?utf-8?B?SmY1ZmVOWnNMRStRQlFaekljNlFkdjRaelhINk5FQUNoSUttZkQxRkhaV2JY?=
 =?utf-8?B?VTRDL21QSWR4UGVvTXluWUZhaEZWNDAwT2pTWmw1MzFub1N3UkNtbzN0U3ZY?=
 =?utf-8?B?YlJOdTNna1c4RDMramhDV1NIS204UVNId284Tm1ZU0FBdGVPQkx5Ui9oSEho?=
 =?utf-8?B?bEwzWmVadHJhd1hmRWZKakxqZmRuZFBNaEk2Vmp2aW9UdmhBY014OHBHOWZ1?=
 =?utf-8?B?QTBocVJaVUd4dTlscndWWDQ2V2ticmtKYkUwa1N0NnZXSG9UNnRLU0llZ1lE?=
 =?utf-8?Q?CESCPlzHIbO0C5PCW5phRxocRzwdrEa9TIsR+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5eaea77-84d1-4c32-a96b-08ded2670e34
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 03:08:39.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGXWgoRGAfXODwXOpQXy0Y9EAigybLp3IB0Mkyv1ZlIETdPUNUG7mNXV2PRm19DVQ9BpMwAhiZYg9gYkhLxa+3OUIJPcfKoZRwQQyXDBbDvPqOrJRI1BqE531Qh5gP6p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9726

On Wed, Jun 24, 2026 at 12:05:00PM +0200, Stefan Wahren wrote:
> Hi Xu,
> 
> Am 24.06.26 um 11:11 schrieb Xu Yang:
> > On Wed, Jun 24, 2026 at 08:30:00AM +0200, Stefan Wahren wrote:
> > What's your issue on i.MX93?
> we have an i.MX93 board using both USB interfaces:
> 
> USB1:
> - external available via USB-C connector
> - OTG interface should be able to switch between host and peripheral
> - as USB-C interface control we use the TI TUSB321AI [1] (while its DIR,
> OUT1, OUT2, CURRENT_MODE, PORT is unconnected or tied to GND)
> 
>  USB2:
> - used as internal host interface
> 
>  We have the problem that 5 seconds after disconnecting a USB device from
> USB-C (USB1) interface, the USB driver complains that the VBUS is still to
> high:
> 
> [  144.078347] usb 2-1: USB disconnect, device number 2
> [  144.083425] ci_hdrc ci_hdrc.0: remove, state 1
> [  144.083521] usb 2-1.1: USB disconnect, device number 3
> [  144.090310] usb usb2: USB disconnect, device number 1
> [  144.139325] usb 2-1.5: USB disconnect, device number 4
> [  144.158700] ci_hdrc ci_hdrc.0: USB bus 2 deregistered
> [  149.190274] ci_hdrc ci_hdrc.0: timeout waiting for 00000800 in OTGSC
> [  149.196741] usbmisc_imx 4c100200.usbmisc: vbus is error
> [  149.202078] usbmisc_imx 4c100200.usbmisc: Error occurs during detection:
> -22

Does the VBUS be turned off after switching to device mode? If yes, how long
will the voltage of VBUS drop to 0.8V?

> 
> But except of this, both roles works as expected.
> 
> Here are the relevant device tree parts:
> 
>                 reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
>                                pinctrl-names = "default";
>                                pinctrl-0 = <&pinctrl_usbotg1grp>;
>                                compatible = "regulator-fixed";
>                                regulator-name = "usb_otg1_vbus";
>                                regulator-min-microvolt = <5000000>;
>                                regulator-max-microvolt = <5000000>;
>                                gpio = <&gpio4 13 GPIO_ACTIVE_HIGH>;
>                                enable-active-high;
>                                regulator-boot-on;
>                 };
> 
>                 &usbotg1 {
>                                vbus-supply = <&reg_usb_otg1_vbus>;
>                                over-current-active-low;
>                                status = "okay";
>                 };

Does USB2 use the same VBUS regulator?

Thanks,
Xu Yang
