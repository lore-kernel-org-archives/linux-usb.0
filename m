Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795618085;
	b=OE5oHMOoPFXvrAcf/MYLzEUrnpUhtqUXE/jMV42+kob9fEqvIjsDzBMj34aQUoDMK/x3
	 NKznSn3uTH34JYwejVpTDqny/nSCu24tAWYFVL8tK3EmCRCqzITu2banyeDCb+sPZIKsJ
	 w/TUe6HCqSJ6Z79CnEVMgGKzJP6yli6k1ahjEH1HRtB0x8htJF7CLU2/pxqNFyqlK8WFB
	 FeoH3dyR5hFnGdOIfxvvoyuZm1Q9QprML50vMOdql4behva+40kLeyKV+F5tcDP1NP1+N
	 6zaBbixvk+4UaW6qVuWszKUN4AM7nijZtOqMFFAG62n5NOE2dMtT80o/R0RfynvLMiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618085;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=881cg+q8rBG5SAvA55kuktvH5kvM8OctgmMcethSLTE=;
	b=dzuYVvMUuZLd5mFvbzRZK5FM5b0e2w6VlULQ6FJy9Ick1VymBv4VNiaLrtcJK12m7BS+
	 jJLzxgROw/lKfkK3YmnjimFEooULQNuepLfnhcGBIDnV3WeBcwSjdpI6yBUhm761+q8EN
	 Xi9XQzRVFnrTRzRSmMt06lcu84VHg8mELkVm/Pgkb35OEud7OWSbQPdYf0sddbEEW8oWW
	 DhejBppRLpvu47YaoK7hBzGMUZNPrRugTz3v05fgtKkty+sGSyagbb2FvqEmdDw09UcNR
	 5h+54lbMueTt+j3zdyzsPcE1c0+favNbtlBDxzgQ5RYwo9wP60SpE1S0jVg/v791dMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="TxMi/mtJ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.70
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA023606A327
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA023606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=TxMi/mtJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq/F8Xe/q8TV3gs/rNKYj3kHsZZrR7Y202uAYQCWVoY6JdHxoCuyE+St9rkS4kQVgyAUzHBNP7yAsWHofY1XDpyfG5nDPtf+1Skbn2ZX4aqx4wCE6ry5d/9zgH70QiUY6xC9PFUXfVfStVvXls1undsRVJCwfRGEfRZHh9SYdI5E9DbWZjzc6OLvtq1YhzN+wcB/tPMLZKCVpUtRRqZ+DiTTELJKho5OJO3MhG3WVJ3UJYhk51sCj07gRjPopEOGauNe+bZwzCKVbMRwGz52p6jrnQjrj+fyEEQ+1+eJg9GUBlBjqUeMYKwI5Nn+HP8ZHSDXcdjAgeAFG32pJZ0wZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=881cg+q8rBG5SAvA55kuktvH5kvM8OctgmMcethSLTE=;
 b=Xg+0y6ATEbtl9g7YzfM2lE9ufcByYfmKV/Hng4JiEqhg79c21ugwysu1KdaQThFY53QdbROXRfeaTVjBfxfaPbjHkE8o1T80fQULK6bx8g+qbc8Jn9LYvf9QDXXjDb4G9HJ0q/X0Dn5IQpqZ1aSSlzDnWAkBIpdAky0UPf7JJRnYYk51I8jaLL/QqFXKsdItdzijCmK+kCLIocQ0GZChB7gI6nZW0PTmoYRRSacDdg6DgJcw0tL+iAVr1yE4zwmi5Z+HPnkdgRhq7OqjkhnucGa35bYuD6HGpCCc5Rvfz6nDmXumJ3DjVrf20UJ28z0nj5qmcFUl43HW1+jUoKbW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=881cg+q8rBG5SAvA55kuktvH5kvM8OctgmMcethSLTE=;
 b=TxMi/mtJkbKmFC8sxnAnJXlBlhw7HPzOMuPnvjehaYXKoAO1Tq62Dn4J2ha2qQp2HgIN/Mh4DyKMafizZ4Rcmv9C0dzVyK5RhSiAGyyAFF14XO9ad2cPrLv4ifTP8JjsDjYyB4DT/aNHRw32lFkunxBMuAJEP0yGBFWeVYz7xfHCB161jPy4+WAZvw5W4Px9kxsSB8aCgkkPFq0NfKYZuIYDa5nKUCCSl/O2fcoVu4fHxMscHTDq5M7USpfzEaRTAY22B6hBr0KuqzDiEFES7hqdB83voRXgti3r9NrjIiIYlvRp6nxijWULSZrE7X9Og263uLfKgjgBgI03jtC/nw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB901068.eurprd04.prod.outlook.com (2603:10a6:208:a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 14:48:02 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 14:48:01 +0000
Date: Wed, 25 Nov 2026 09:47:56 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/3] usb: dwc3: Group glue-overridable properties in
 struct dwc3
Message-ID: <awb1HFl7PUi6lNye@lizhi-Precision-Tower-5810>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
 <5f9e2da1ed83ef3b640760b2ec2539481a59d65b.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f9e2da1ed83ef3b640760b2ec2539481a59d65b.1795559405.git.Thinh.Nguyen@synopsys.com>
X-ClientProxiedBy: CPBP307CA0014.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:2::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB901068:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a500bf-e7c3-495c-8773-08df4b031a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|6133799003|10086099003|261009223027099003|18002099003|22082099003|3023799007|10067099003|4143699003|5023799004|11063799006|56012099006|261102123227099003|261026140227099003|261026121527099003|261021123027099003|261022105027099003|261022075727099003|261028144727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	OthdcoEjkBsau0uggyWJQPLADx8HZ17JsHy+L8hPCXskV24xN4PpdXHl51QhhvT2iqbNVDT5+aCGIFydlS99bGX8yaoX2ZXsnIE/VFzgJJHS+O3eg0LMrMz7C1EgleybIPB0JZXU/XgiCVQhp+Bdhz9sdZtVD3x48Cwo505LK88xSw/99i8Rj44itrD91xR492gZRz8kTaKk5f0sdVySJ64+5ziHzj8VVdNDb16EBNqFk2+1EOAqfNZa4lPS7eIbgg6ad52CStksgXQDYdpY+wPHAfji4A9O6Kazjzlb6TKRX7rsigIlUXSz69196uhcPpik+qA+Ak+y+FoWnpjreu87U6mzlJEt5AVbt9stPlKzZlFYkVUw769M1rxma4qr0ZoTK09tRItUv376Z4q7Tlr5Cv5qoXlrXXUjOt55RNZMnDWa5jcqGAJ1LSH3OpKdNhzp32cYQLGZyzaGvuGaxT3jnZT5L1KIpE6jJiku9AR+nHhBMJ3E8pOAKe5+GLYeh5bz1t0dZSVn5wR9oms1gkiyD+s8WX/Ff1QOZ201TTsBR8WMdEX+cSlIN4qxnXLugporwkqbZf9+rwWlAWONH5ckhMhUh0hKOMQFlmLO7IVRT65TodypFg81gxzVIlqY/dmLnfTnIZGeXCFLuMLlvM1aRBgpjnSWTEdO5GSDGA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(6133799003)(10086099003)(261009223027099003)(18002099003)(22082099003)(3023799007)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(261102123227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z8+r3gYfgzSgWdC46XmVZNw3wK5s9/cOSorc+TNWDaplNLne+nXRTjZPcjc/?=
 =?us-ascii?Q?hIMlAaFtniJfMHzo4Ldx6SgilDpkr0KDutJJgTWOC1LdY5WmfgHxqVtUaBEN?=
 =?us-ascii?Q?uWQR3NimyJxMkFzneWyunAcIrOOBdDOAwhRRXMSSn8NKOO49FAo4791CTlmW?=
 =?us-ascii?Q?YVKAFoAGyGHrT8x127P1uOzvBWK6N0l4dFaNFZ7kLbaESwKeAtH9LqQPC8jX?=
 =?us-ascii?Q?fMGgmQF0hj7rkhW9z0XLcwI6Hi5QwKvqYSZhv043xmlKHerazdZkjKaQJLVz?=
 =?us-ascii?Q?eey/KMLLfdpDwXwUaS3cGM5HnC5ANkF7VxVUSo3oyXet1fNeJxjcRQJO+eOs?=
 =?us-ascii?Q?iWS32f7fgCA5SgzuOvx+kRope5s+JhF7VVUtshUinMgDPkxkzZosApgEf/Ru?=
 =?us-ascii?Q?vRliOmZ5HG+lyltjd7n1JHFnUk2OgPMTMvkr42sXt5CJzdY/Y36e3ErF+OoP?=
 =?us-ascii?Q?Anry5UFKFFLuRLj9QwCzKUuhBrbezckzY+z0rdtetqkFTYf6rtltgO0vLAki?=
 =?us-ascii?Q?BV+tSCsyigvx1tczP0924+dNM4iNsI7cZWoH8uBmCyK2esyPYpOu7CxtV7Te?=
 =?us-ascii?Q?YAGZoHYekhiS0AFrx8ogM3vl98ap4IjzyhK/BhZTtghMzdtL+S0ODdE168yl?=
 =?us-ascii?Q?I4iiovGCNb0eL2SatBF7QqtggUkfhl9P3DMmZyA3CeSBOgTHqP6uxLxy3ivp?=
 =?us-ascii?Q?Yu/FsAIImhAax0MyYav7kLhE2x4RsTeIkMP41G7N2tsFg5DSXbfa5akaPTPU?=
 =?us-ascii?Q?+k/GwXC0jvP/KSBWLCGW2a1JE7OGnA2Moa7ZLAYl1wGqM9prwxnX9ofyoitQ?=
 =?us-ascii?Q?TwpeYpOSrCgjJ77Qm9DAFaNJYuN4CFrG2eMZeJKLjRoLi2G/9GR02KtGiXOa?=
 =?us-ascii?Q?7TZGGLTjgpFct0Zg9gdwuf1wl7iu2eBTtHNyVT9kWHagtCnUNWxKl+vo8UUn?=
 =?us-ascii?Q?F+Wx6HlCf+8U/hY4ANSr1MslzfHMPiq5PnoyrACAtYie7s3wCLWKM3Tuzv4U?=
 =?us-ascii?Q?pgVBDQOIjfNjZkStDIFI653HiS8jF2CGNtvidguF7e0VUfR2IM3ajlOxpeWL?=
 =?us-ascii?Q?/aRE3VNUpYWS111HmCArR4iHXclUCNnYp9UK30GCFiiKSpib9MuFTGIQNOMM?=
 =?us-ascii?Q?cybcCcoEfKhceWP9PS1usEjxiRH/bYzZaiBIDE3e9Ho+h8Maze5fSbLP+kpe?=
 =?us-ascii?Q?bgA3BG5+0GI4lc4u05hOlMuzggUesxWsAgQwRI07tY6LiTbhcpVPzWkTONYJ?=
 =?us-ascii?Q?q3Xhq1XMZzCShhCeZ+Dm8BXG5n1QZdiKhyaDeJosNLBlZTPXNBNxeW/kWTq8?=
 =?us-ascii?Q?RTH/LemfG8kURdvCUwNUYTq+pLDTU1k4e9mffY2DMuMDVxpLutg5xVweL2Ic?=
 =?us-ascii?Q?bXUCkknieIJBiN7ryJzG/djoPs4ivxRLJNG752Vpd8iL7ZEH/s0WPoEhqZEF?=
 =?us-ascii?Q?jhMkAqqFBExKax04eVhP+R0B3CAgJ/eHncrEnrHyOZbxLLCJMCG8ApN2kG3O?=
 =?us-ascii?Q?ErbN68rOZRuQfcna4yiULVBEuBxf7P6L5kzSStZMbRrIxDFFhSjgx4L3CUvl?=
 =?us-ascii?Q?IpmBjp4HxQzPIP/yg3IIkHWF1mTjlzk0FTpH0YkfMoxTtUPwANXhbnf/Eitr?=
 =?us-ascii?Q?qly2jS+IBVuyZLlr5BsWLCtS3lzWFaLve9fm7E34q7ZMYOJk5RvUIqiDy29k?=
 =?us-ascii?Q?PIRd8KvrWJUv8Xbk2TzBFZZ506aQ+ocsbGKcsFYdXTDZ76q4PXWOuyUEvZGn?=
 =?us-ascii?Q?jZrkhJPefv/cYsij6jbUL9coQ7yOqVxELeY7BI6RteQESf3hJ4N3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a500bf-e7c3-495c-8773-08df4b031a72
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:48:01.2914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDs3B7Vg3jI2hVE7F48rrDXSLkIPdr8iH/zGmtW/ElCcb3aYWhW/Q7arci2RzRgdsnmIgvQvDnBV13LbIS871yxcSstJpQb49NIb3dlnZtAcgoltAm0LTcU1zoles5tT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB901068

On Tue, Nov 24, 2026 at 10:59:19PM +0000, Thinh Nguyen wrote:
> struct dwc3_properties duplicates fields of struct dwc3, so every
> property a glue driver can set is defined twice.
>
> Define struct dwc3_properties from the matching fields of struct dwc3
> with struct_group_tagged(), and move the remaining property fields into
> the group. Users of dwc->X and probe_data.properties.X are unchanged.
>
> No functional change.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/usb/dwc3/core.h | 163 ++++++++++++++++++++--------------------
>  drivers/usb/dwc3/glue.h |  11 ---
>  2 files changed, 83 insertions(+), 91 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index f635a9fbc151..d103a637a4f7 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1040,23 +1040,18 @@ struct dwc3_glue_ops {
>   * @reset: reset control
>   * @regs: base address for our registers
>   * @regs_size: address space size
> - * @fladj: frame length adjustment
> - * @ref_clk_per: reference clock period configuration
>   * @irq_gadget: peripheral controller's IRQ number
>   * @otg_irq: IRQ number for OTG IRQs
>   * @current_otg_role: current role of operation while using the OTG block
>   * @desired_otg_role: desired role of operation while using the OTG block
>   * @otg_restart_host: flag that OTG controller needs to restart host
>   * @u1u2: only used on revisions <1.83a for workaround
> - * @maximum_speed: maximum speed requested (mainly for testing purposes)
> - * @max_ssp_rate: SuperSpeed Plus maximum signaling rate and lane count
>   * @gadget_max_speed: maximum gadget speed requested
>   * @gadget_ssp_rate: Gadget driver's maximum supported SuperSpeed Plus signaling
>   *			rate and lane count.
>   * @ip: controller's ID
>   * @revision: controller's version of an IP
>   * @version_type: VERSIONTYPE register contents, a sub release of a revision
> - * @dr_mode: requested mode of operation
>   * @current_dr_role: current role of operation when in dual-role mode
>   * @desired_dr_role: desired role of operation when in dual-role mode
>   * @edev: extcon handle
> @@ -1098,6 +1093,25 @@ struct dwc3_glue_ops {
>   * @dbg_lsp_select: current debug lsp mux register selection
>   * @test_mode: true when we're entering a USB test mode
>   * @test_mode_nr: test feature selector
> + * @clear_stall_protocol: endpoint number that requires a delayed status phase
> + * @connected: true when we're connected to a host, false otherwise
> + * @softconnect: true when gadget connect is called, false when disconnect runs
> + * @delayed_status: true when gadget driver asks for delayed status
> + * @ep0_bounced: true when we used bounce buffer
> + * @ep0_expect_in: true when we expect a DATA IN transfer
> + * @is_fpga: true when we are using the FPGA board
> + * @pending_events: true when we have pending IRQs to be handled
> + * @pullups_connected: true when Run/Stop bit is set
> + * @setup_packet_pending: true when there's a Setup Packet in FIFO. Workaround
> + * @three_stage_setup: set if we perform a three phase setup
> + * @dr_mode: requested mode of operation
> + * @fladj: frame length adjustment
> + * @ref_clk_per: reference clock period configuration
> + * @maximum_speed: maximum speed requested (mainly for testing purposes)
> + * @max_ssp_rate: SuperSpeed Plus maximum signaling rate and lane count
> + * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
> + *		       DATWRREQINFO, and DESWRREQINFO value passed from
> + *		       glue driver.
>   * @lpm_nyet_threshold: LPM NYET response threshold
>   * @hird_threshold: HIRD threshold
>   * @rx_thr_num_pkt: USB receive packet count
> @@ -1109,26 +1123,15 @@ struct dwc3_glue_ops {
>   * @tx_thr_num_pkt_prd: periodic ESS transmit packet count
>   * @tx_max_burst_prd: max periodic ESS transmit burst size
>   * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo resize
> - * @clear_stall_protocol: endpoint number that requires a delayed status phase
>   * @num_hc_interrupters: number of host controller interrupters
>   * @hsphy_interface: "utmi" or "ulpi"
> - * @connected: true when we're connected to a host, false otherwise
> - * @softconnect: true when gadget connect is called, false when disconnect runs
> - * @delayed_status: true when gadget driver asks for delayed status
> - * @ep0_bounced: true when we used bounce buffer
> - * @ep0_expect_in: true when we expect a DATA IN transfer
>   * @sysdev_is_parent: true when dwc3 device has a parent driver
>   * @has_lpm_erratum: true when core was configured with LPM Erratum. Note that
>   *			there's now way for software to detect this in runtime.
>   * @is_utmi_l1_suspend: the core asserts output signal
>   *	0	- utmi_sleep_n
>   *	1	- utmi_l1_suspend_n
> - * @is_fpga: true when we are using the FPGA board
> - * @pending_events: true when we have pending IRQs to be handled
>   * @do_fifo_resize: true when txfifo resizing is enabled for dwc3 endpoints
> - * @pullups_connected: true when Run/Stop bit is set
> - * @setup_packet_pending: true when there's a Setup Packet in FIFO. Workaround
> - * @three_stage_setup: set if we perform a three phase setup
>   * @dis_start_transfer_quirk: set if start_transfer failure SW workaround is
>   *			not needed for DWC_usb31 version 1.70a-ea06 and below
>   * @usb3_lpm_capable: set if hadrware supports Link Power Management
> @@ -1151,8 +1154,6 @@ struct dwc3_glue_ops {
>   * @dis_u1_entry_quirk: set if link entering into U1 state needs to be disabled.
>   * @dis_u2_entry_quirk: set if link entering into U2 state needs to be disabled.
>   * @dis_rxdet_inp3_quirk: set if we disable Rx.Detect in P3
> - * @async_callbacks: if set, indicate that async callbacks will be used.
> - *
>   * @dis_u2_freeclk_exists_quirk : set if we clear u2_freeclk_exists
>   *			in GUSB2PHYCFG, specify that USB2 PHY doesn't
>   *			provide a free-running PHY clock.
> @@ -1178,6 +1179,7 @@ struct dwc3_glue_ops {
>   *	3	- Reserved
>   * @dis_metastability_quirk: set to disable metastability quirk.
>   * @dis_split_quirk: set to disable split boundary.
> + * @async_callbacks: if set, indicate that async callbacks will be used.
>   * @enable_usb2_transceiver_delay: Set to insert a delay before the
>   *			assertion of the TxValid signal during a HS Chirp.
>   * @sys_wakeup: set if the device may do system wakeup.
> @@ -1193,9 +1195,6 @@ struct dwc3_glue_ops {
>   * @num_ep_resized: carries the current number endpoints which have had its tx
>   *		    fifo resized.
>   * @debug_root: root debugfs directory for this device to put its files in.
> - * @gsbuscfg0_reqinfo: store GSBUSCFG0.DATRDREQINFO, DESRDREQINFO,
> - *		       DATWRREQINFO, and DESWRREQINFO value passed from
> - *		       glue driver.
>   * @wakeup_pending_funcs: Indicates whether any interface has requested for
>   *			 function wakeup in bitmap format where bit position
>   *			 represents interface_id.
> @@ -1259,7 +1258,6 @@ struct dwc3 {
>  	void __iomem		*regs;
>  	size_t			regs_size;
>
> -	enum usb_dr_mode	dr_mode;
>  	u32			current_dr_role;
>  	u32			desired_dr_role;
>  	struct extcon_dev	*edev;
> @@ -1276,17 +1274,13 @@ struct dwc3 {
>
>  #define DWC3_CURRENT_UNSPECIFIED	UINT_MAX
>
> -	u32			fladj;
> -	u32			ref_clk_per;
>  	u32			irq_gadget;
>  	u32			otg_irq;
>  	u32			current_otg_role;
>  	u32			desired_otg_role;
>  	bool			otg_restart_host;
>  	u32			u1u2;
> -	u32			maximum_speed;
>  	u32			gadget_max_speed;
> -	enum usb_ssp_rate	max_ssp_rate;
>  	enum usb_ssp_rate	gadget_ssp_rate;
>
>  	u32			ip;
> @@ -1369,71 +1363,81 @@ struct dwc3 {
>
>  	u8			test_mode;
>  	u8			test_mode_nr;
> -	u8			lpm_nyet_threshold;
> -	u8			hird_threshold;
> -	u8			rx_thr_num_pkt;
> -	u8			rx_max_burst;
> -	u8			tx_thr_num_pkt;
> -	u8			tx_max_burst;
> -	u8			rx_thr_num_pkt_prd;
> -	u8			rx_max_burst_prd;
> -	u8			tx_thr_num_pkt_prd;
> -	u8			tx_max_burst_prd;
> -	u8			tx_fifo_resize_max_num;
>  	u8			clear_stall_protocol;
> -	u16			num_hc_interrupters;
> -
> -	const char		*hsphy_interface;
>
>  	unsigned		connected:1;
>  	unsigned		softconnect:1;
>  	unsigned		delayed_status:1;
>  	unsigned		ep0_bounced:1;
>  	unsigned		ep0_expect_in:1;
> -	unsigned		sysdev_is_parent:1;
> -	unsigned		has_lpm_erratum:1;
> -	unsigned		is_utmi_l1_suspend:1;
>  	unsigned		is_fpga:1;
>  	unsigned		pending_events:1;
> -	unsigned		do_fifo_resize:1;
>  	unsigned		pullups_connected:1;
>  	unsigned		setup_packet_pending:1;
>  	unsigned		three_stage_setup:1;
> -	unsigned		dis_start_transfer_quirk:1;
> -	unsigned		usb3_lpm_capable:1;
> -	unsigned		usb2_lpm_disable:1;
> -	unsigned		usb2_gadget_lpm_disable:1;
> -	unsigned		needs_full_reinit:1;
> -
> -	unsigned		disable_scramble_quirk:1;
> -	unsigned		u2exit_lfps_quirk:1;
> -	unsigned		u2ss_inp3_quirk:1;
> -	unsigned		req_p1p2p3_quirk:1;
> -	unsigned                del_p1p2p3_quirk:1;
> -	unsigned		del_phy_power_chg_quirk:1;
> -	unsigned		lfps_filter_quirk:1;
> -	unsigned		rx_detect_poll_quirk:1;
> -	unsigned		dis_u3_susphy_quirk:1;
> -	unsigned		dis_u2_susphy_quirk:1;
> -	unsigned		dis_enblslpm_quirk:1;
> -	unsigned		dis_u1_entry_quirk:1;
> -	unsigned		dis_u2_entry_quirk:1;
> -	unsigned		dis_rxdet_inp3_quirk:1;
> -	unsigned		dis_u2_freeclk_exists_quirk:1;
> -	unsigned		dis_del_phy_power_chg_quirk:1;
> -	unsigned		dis_tx_ipgap_linecheck_quirk:1;
> -	unsigned		resume_hs_terminations:1;
> -	unsigned		ulpi_ext_vbus_drv:1;
> -	unsigned		parkmode_disable_ss_quirk:1;
> -	unsigned		parkmode_disable_hs_quirk:1;
> -	unsigned		gfladj_refclk_lpm_sel:1;
> -
> -	unsigned		tx_de_emphasis_quirk:1;
> -	unsigned		tx_de_emphasis:2;
> -
> -	unsigned		dis_metastability_quirk:1;
> -
> -	unsigned		dis_split_quirk:1;
> +
> +	struct_group_tagged(dwc3_properties, properties,
> +		enum usb_dr_mode	dr_mode;
> +		u32			fladj;
> +		u32			ref_clk_per;
> +		u32			maximum_speed;
> +		enum usb_ssp_rate	max_ssp_rate;
> +		u32			gsbuscfg0_reqinfo;
> +		u8			lpm_nyet_threshold;
> +		u8			hird_threshold;
> +		u8			rx_thr_num_pkt;
> +		u8			rx_max_burst;
> +		u8			tx_thr_num_pkt;
> +		u8			tx_max_burst;
> +		u8			rx_thr_num_pkt_prd;
> +		u8			rx_max_burst_prd;
> +		u8			tx_thr_num_pkt_prd;
> +		u8			tx_max_burst_prd;
> +		u8			tx_fifo_resize_max_num;
> +		u16			num_hc_interrupters;
> +
> +		const char		*hsphy_interface;
> +
> +		unsigned		sysdev_is_parent:1;
> +		unsigned		has_lpm_erratum:1;
> +		unsigned		is_utmi_l1_suspend:1;
> +		unsigned		do_fifo_resize:1;
> +		unsigned		dis_start_transfer_quirk:1;
> +		unsigned		usb3_lpm_capable:1;
> +		unsigned		usb2_lpm_disable:1;
> +		unsigned		usb2_gadget_lpm_disable:1;
> +		unsigned		needs_full_reinit:1;
> +
> +		unsigned		disable_scramble_quirk:1;
> +		unsigned		u2exit_lfps_quirk:1;
> +		unsigned		u2ss_inp3_quirk:1;
> +		unsigned		req_p1p2p3_quirk:1;
> +		unsigned                del_p1p2p3_quirk:1;
> +		unsigned		del_phy_power_chg_quirk:1;
> +		unsigned		lfps_filter_quirk:1;
> +		unsigned		rx_detect_poll_quirk:1;
> +		unsigned		dis_u3_susphy_quirk:1;
> +		unsigned		dis_u2_susphy_quirk:1;
> +		unsigned		dis_enblslpm_quirk:1;
> +		unsigned		dis_u1_entry_quirk:1;
> +		unsigned		dis_u2_entry_quirk:1;
> +		unsigned		dis_rxdet_inp3_quirk:1;
> +		unsigned		dis_u2_freeclk_exists_quirk:1;
> +		unsigned		dis_del_phy_power_chg_quirk:1;
> +		unsigned		dis_tx_ipgap_linecheck_quirk:1;
> +		unsigned		resume_hs_terminations:1;
> +		unsigned		ulpi_ext_vbus_drv:1;
> +		unsigned		parkmode_disable_ss_quirk:1;
> +		unsigned		parkmode_disable_hs_quirk:1;
> +		unsigned		gfladj_refclk_lpm_sel:1;
> +
> +		unsigned		tx_de_emphasis_quirk:1;
> +		unsigned		tx_de_emphasis:2;
> +
> +		unsigned		dis_metastability_quirk:1;
> +
> +		unsigned		dis_split_quirk:1;
> +	);
>  	unsigned		enable_usb2_transceiver_delay:1;
>  	unsigned		async_callbacks:1;
>  	unsigned		sys_wakeup:1;
> @@ -1447,7 +1451,6 @@ struct dwc3 {
>  	int			last_fifo_depth;
>  	int			num_ep_resized;
>  	struct dentry		*debug_root;
> -	u32			gsbuscfg0_reqinfo;
>  	u32			wakeup_pending_funcs;
>  };
>
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> index a1284c481390..b7ce196e84ea 100644
> --- a/drivers/usb/dwc3/glue.h
> +++ b/drivers/usb/dwc3/glue.h
> @@ -9,17 +9,6 @@
>  #include <linux/types.h>
>  #include "core.h"
>
> -/**
> - * dwc3_properties: DWC3 core properties
> - * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
> - * @needs_full_reinit: indicate the controller may not remain power during system
> - *			pm and need full initialization
> - */
> -struct dwc3_properties {
> -	u32 gsbuscfg0_reqinfo;
> -	unsigned needs_full_reinit:1;
> -};
> -
>  #define DWC3_DEFAULT_PROPERTIES ((struct dwc3_properties){		\
>  	.gsbuscfg0_reqinfo = DWC3_GSBUSCFG0_REQINFO_UNSPECIFIED,	\
>  	})
> --
> 2.53.0
