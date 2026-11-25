Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795618337;
	b=2fglteDatIG7s5DEWRwnCIggcGF+3WkUuwdRYt7fvXhpSBr7thdYIKoUL9FiMkZaxsd9
	 P6bzSFu6qJl9xHLRgX6tAB6XhkSC0qow5boNyNDzFnkpiLjZ0dhTI/LDhNG/VxGeDdsWf
	 uRopY6nXsYCvrFMspJ9xL+FVnco8DMXyOPz8o4Z0ZWYvhL/Xv+JzXvSrLMCbfulf3Wsyq
	 WvCm8XAZulzN2WwATjvu04GP90qxAwB6LFrAbgnSVVkccnvZ14urooVMEIil7Z+yHPpqo
	 Boxp8ygtH6qqCr/C3hEOwkNCebPq6ZlfeF0iGyNPUW7SR/NEzRLzmOemGJf9jlOEIig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618337;
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
	bh=uQ40ydE9aeVO+o2EgYG4YwahJQL28aQv2oxXXdFB4u4=;
	b=nMokUIbEPrkFf06FVlkVxdPop1lHtwv4VS8a1ah+NkFh7qz/4HEzi/2TxbzWsrAAPOVo
	 L5sOUCTd5E52ZF72kVyYRFiRCzWXMBN2Gdnnj8HhaYdctSI6ekDTzNJaT8589eCdpOSrd
	 BRB/835AddTN85/E3mvgkzWOyVa0QtVgqYVlWLQ1DXvLsuKC44z4PSJ5nMeRCc1EdYHzv
	 G/NU95Wkg3O6enpNyOdJ189DiPFbYy0ACce/OiRnULfhyptrKWUBBUWt53Z1vQZVwDdta
	 CnDFZw0kJAMI7htXWTlYdCWkT5bgEdnHP5CBZlSGoXI4nd1f+Fv7XfBqY34yYOHgjzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QgABv0bq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.43
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE971606A336
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE971606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QgABv0bq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fhaKloHJG3X52GdH7VKyHICaMTX3QKG9KX5bRJRmneIvlNXp19A7G+D3mtsEoXrz/LxwBYvelgLCJYWgu7iGuMwgMatvepcGdsR3zJbnM7y6cFG287HzRr1MTpybOgzaw+FPk/O0+jRWInorutj1/Pf0SMc6mdVg+J44BvfQ9wbr/3vYRMVYdp8DPLJC19gi4IB0OnTMNny73YL40WB6YlrsYJT1UWS0f3Kgkt3QqPiTv5BxYlpB4Pe45/kGaCz9D2wGCgkmYalX1KBxEkZpwp2MZ49XhMcEClIoyU31WRna1cACGEUxeIgauabw4C5E6BpdrvDSnpW4g/UOcW16Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQ40ydE9aeVO+o2EgYG4YwahJQL28aQv2oxXXdFB4u4=;
 b=RSCoQQpp/jZrJN+Y533RCGqVmzvPTQ7tj1cVDPoXPT6uIixraB9FDT+9R0bapKDlSzABpFzA8sY62K4xa1Kphci91oBYwaj4foUTQ7SeJ+ifx0ahMVi6DQ3HEM/JQaQttICgTJzJM9fR6DLsHwT4bvFdsMD3rPNH9Y53rfMxulMIH6oH11XQr6B7BJ+jW6YEfL2bixtzNq90SmM+IYTeqUUI6nDqpTlW+0IRMkRC5jOsCQ8S8mGCmBqcdl2s+gj+ncAiJf03kXW52C32BX9d8rvcfK1KASMV8Bq8end/OXnva9qRsoYntR87SEKAXGsgv6YBhNvwJ00HvYV2sQ0FXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQ40ydE9aeVO+o2EgYG4YwahJQL28aQv2oxXXdFB4u4=;
 b=QgABv0bq4eVTWYFDp077ojng+N9y6FGC0Jwsw4GDfOeY0g5MhQ+XbBVhInzZ33RZgoN6B+8UN0bet+tgmdpllpT7SenTrKggxB3fSyP2626C9hslVDzZWSW7Po/ez0tiS+VH74tMJ2YCkSAShnMjPtufw5VpQ+SOceC/lcScZG8ptfxcvrjYh4Orr+4v1S+UtoOkmx5HhsqEZNj/g1wccpMUtE1oNhg+L62ORk+TnOr5HzAHLYWslZ+RLuBukwtX5Y2SjhuXr58jb8O9LAzll99DdKpqNbtIq4ISFJKX3932i9n9PKfEGVBLgIEwA1LdDTJUmNw2WKuEAYLEJiVHoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM6PPF16D8455BE.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a86) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 14:52:14 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 14:52:14 +0000
Date: Wed, 25 Nov 2026 09:52:10 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/3] usb: dwc3: Move sysdev selection and clamp out of
 dwc3_get_properties()
Message-ID: <awb2Ghsu_QaVboaG@lizhi-Precision-Tower-5810>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
 <6f0f6d1316450597da0515dc31954339ebe59482.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f0f6d1316450597da0515dc31954339ebe59482.1795559405.git.Thinh.Nguyen@synopsys.com>
X-ClientProxiedBy: CPAP307CA0007.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:3::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM6PPF16D8455BE:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d65fb1-fea7-4df3-dea0-08df4b03b1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|10067099003|56012099006|4143699003|11063799006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Li7+JyekgMCIejf6z1KBOxpchqkehXOMNGuOvuFidT4u63pkeDj6l5gjkF6BzGsx4JuwFdaNu5BG3ltdwMDVQ3xyeoyDNFB6ETonKyTJ5UegDJ5S/gUBQR4zDzerMfvXnOE78HzJnq5KPDKJAGAgO+p/Al1XZi8mCxNR4QMgfV+kHf3KT1ECgaHe/czbD86ifuF/JtzTlarcHfcWaRPISpC3WREQnUe8I0q4SzszJDqr8PQwcphBd590BKWJ9ozZbjBTfs855OuSf/20XKjKNRdi8YwwXx+jtb0Ta//647UPIDc4MGlcqpEOx2ZzsJ9tY+7h1/4upAYGLUF82vTFFomI4edVqu6KcsngEdLkkEKCqU12dn6ppnS0M6BSG/GmKwjB3mQ8nlhBS9QFUi+TWq7ZtlMfLrOdxbyKZHQqha+0bdNJ4+VkFRtoIh1PDoFRJwRXXVjA7zhfcEfQ7PfAMzSsdKeulx8e7fXdgZFszdP00wjOhd8tT2wGFGejc15DtqizP1jKqppV4wyB4Evo95YMV2X3nJAN3M94MYQ/oQfgs19GO/ql2VvxlO/C3n2D+R86DI0NLJLHRm9ggjrmeElT2J9msCJE2UHgOjb01ZlmpLINaYqJHSXc2YloRX6Nx4CmZqQoKpKxcXzRtlBJeVcy/RJzhmML9Jm6TnyIQbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(4143699003)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pBt5s6NRy9vFNUifieeQSPyVNVuPUzI0nrER+nTisskxtlQU6PBNkc9Xo83e?=
 =?us-ascii?Q?Kim3IiqAQkVOsis/2p8/JYvnj2nFZbcI+CoZevxoeYMGTs0K4bqowyta+AK9?=
 =?us-ascii?Q?Ymx0Ir2y8istECOuC/dUlCUFhasW1lLjQ0ByMP+iK5TZLLidnszoLhPchOsr?=
 =?us-ascii?Q?ciRgMPgQSJc3C+eBJH5xrbH3CANGQn3wvFapyygg+ipiJ61j8/Q6vumJw3aq?=
 =?us-ascii?Q?WLvcE6RDK3NiYKMTB4QAGS7mMD/XEHgOfy4GBJBsmj+iKqVsihC1U6kWJlp8?=
 =?us-ascii?Q?LS7UCL6YoOWqGThbpY1hvnfBXEEpaWceHj0NHTYSU3VsZ3yz31fTDl65WUuy?=
 =?us-ascii?Q?lY+W3TBToansIIgJUMXuP+Lfb8EbZoGEHpR7FPGicSbFoLSc2wx1fJW+ULsI?=
 =?us-ascii?Q?1GyayszaTo704XfK3FGZZyLaKH7QDEEXzkRdMR1WZC4H9NqG33W2t7IPgqcQ?=
 =?us-ascii?Q?lotRiHeo3bFB5nH1qwbG1sTUe5LTEq2ODG1OtrTvOFt/S4E9sS/NU24uK1Nt?=
 =?us-ascii?Q?EhHaubM20rkXFiTRoqNu/ym16O4s5JxtotRJ+TONhp/x8GizBXTLqdY32aO2?=
 =?us-ascii?Q?Zz53QqnIXOWcKDjY45PKJlICMDjBkFLIcHF88fMARk15p3zaGk+18ofVKRvg?=
 =?us-ascii?Q?sY4V84fbgUyUWs/NZO/SB+fz7bzWsICXjf35Q5E2yTMFet8EwX9yO6t0uJjY?=
 =?us-ascii?Q?u87I9WNV9Uwh5+vDp4HDRaTJ0Gcw66lxa7d2dS7YdHbi9mQg5pTbEYlZpedn?=
 =?us-ascii?Q?+OH+TCC3xkB4R35oW4h5YoyqxrdNdG/UW/IXNpIrJsOuLthbmDSd2HoWeL7Q?=
 =?us-ascii?Q?4HhnuqQcHyR5zhmQNqG5j50WCXWe3jL6cgdpt8+aeRM0U213tFqiI2notZ/5?=
 =?us-ascii?Q?k71NMn7GrVAW0yEHGH04rI0VRhFiQK41Qn1Dp7X15O4ZPouWAdoKSm2PyY2/?=
 =?us-ascii?Q?lpMODhYxXXbnLXUlxZZm4Bzv/ITqOiPF8fNfrqQjT2LuiCKGBp86accUZXXt?=
 =?us-ascii?Q?yAz5JA/RS9tGWOEWEOfbcsZ6+b5sTAY/qeeXKL5LOO3+8WOhpjEWUh4xE3kj?=
 =?us-ascii?Q?rXB1IYkGnIKKP7j95QxFOPdJtsWkr3JU3uBj9RpS11SxYVJ5RGJsbo/gNTiA?=
 =?us-ascii?Q?hSxbj6xaeW6CZayEPFFqeJvmyBcffxpP1sw5BAAuJq9fFI7DuufSxvZOCocH?=
 =?us-ascii?Q?y5RSycObxDFb/wanM0RBFRphG7eh7NDmIC2V3ClVcP7h4ZhQdrZTU59JAz5J?=
 =?us-ascii?Q?wzQI5CaI9WnXShd/dSJxpBdPKWVGOxUS8Qie1rMuy2Id0pFIhwyWMJau5de2?=
 =?us-ascii?Q?96t8eh4ZWGYZGn2og4m5zKcyKC8zuHBxbNP+hPMCji64cVT5KoH8NV25evrW?=
 =?us-ascii?Q?e0brjdcwmUBjvW9K1kTudOZ6/AK2N/eXC85DJlVp9NU6+g1umaecJs7xSXlX?=
 =?us-ascii?Q?GXNn6pUWVcQKybQ3erciKNX3LsTkNcA/kNid1HE1Rb4kXyzLvlhiNYm5aONF?=
 =?us-ascii?Q?cAtH/qVCES26Tn+lhwNaxItc7R9lttBg1I4+e3kYWtIFaXAqvASU4thQ12Nb?=
 =?us-ascii?Q?cwkWho2wo5KLCsJnYAe4KcoN/ParRTIwOa6jOP1Sc7TK/mY1ZgPu8slrTqK5?=
 =?us-ascii?Q?CTUT+SHhpzt8XiKqVQdWB1QSY6At8iASgRSXHspsY38QSkxPnapiR7a/AriY?=
 =?us-ascii?Q?WPhvD78ahxWw/wMgAapufbijGV10Q6LPyfJ7zVI2v9AjfAj0gZb0H8jy+qO2?=
 =?us-ascii?Q?AXaJA9ZxmJUgmxEdzxF9G5cgn+tvadSU0dWdMs1G9amZCWlyTXob?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d65fb1-fea7-4df3-dea0-08df4b03b1a6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 14:52:14.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU1Xz1ZG5gvDFSzJEy60NdVBM6ororPwOHWG1E0J0aSV/U+THDJ27QNTXpoEtYeGIfMqO7KrYP+UXbSR0SYYTfK2fIpLZA5gBd4utRyzVCiMVcFu2Wpa5XNUTonB5DTg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF16D8455BE

On Tue, Nov 24, 2026 at 10:59:25PM +0000, Thinh Nguyen wrote:
> Select the sysdev and clamp num_hc_interrupters after all properties
> are read, so they can follow values overridden by glue drivers in a
> following change. Move the clamp to dwc3_check_params().
>
> No functional change.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/core.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 372737f4750b..3b2b5fcc627a 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1761,12 +1761,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>
>  	dwc->sysdev_is_parent = device_property_read_bool(dev,
>  				"linux,sysdev_is_parent");
> -	if (dwc->sysdev_is_parent)
> -		dwc->sysdev = dwc->dev->parent;
> -	else
> -		dwc->sysdev = dwc->dev;
> -
> -	dwc->sys_wakeup = device_may_wakeup(dwc->sysdev);
>
>  	dwc->has_lpm_erratum = device_property_read_bool(dev,
>  				"snps,has-lpm-erratum");
> @@ -1802,9 +1796,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  				&tx_max_burst_prd);
>  	device_property_read_u16(dev, "num-hc-interrupters",
>  				 &num_hc_interrupters);
> -	/* DWC3 core allowed to have a max of 8 interrupters */
> -	if (num_hc_interrupters > 8)
> -		num_hc_interrupters = 8;
>
>  	dwc->do_fifo_resize = device_property_read_bool(dev,
>  							"tx-fifo-resize");
> @@ -2001,6 +1992,10 @@ static void dwc3_check_params(struct dwc3 *dwc)
>  			break;
>  		}
>  	}
> +
> +	/* DWC3 core allowed to have a max of 8 interrupters */
> +	if (dwc->num_hc_interrupters > 8)
> +		dwc->num_hc_interrupters = 8;
>  }
>
>  static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
> @@ -2315,9 +2310,15 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
>  	dwc->regs_size	= resource_size(&dwc_res);
>
>  	dwc3_get_properties(dwc);
> -

Nit: avoid this unrelated change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  	dwc3_get_software_properties(dwc, &data->properties);
>
> +	if (dwc->sysdev_is_parent)
> +		dwc->sysdev = dwc->dev->parent;
> +	else
> +		dwc->sysdev = dwc->dev;
> +
> +	dwc->sys_wakeup = device_may_wakeup(dwc->sysdev);
> +
>  	spin_lock_init(&dwc->lock);
>
>  	dwc3_get_usb_power_supply(dwc);
> --
> 2.53.0
