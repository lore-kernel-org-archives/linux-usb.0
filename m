Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795582037;
	b=tkVGS3vGwppSsGvQzs1AKi9MwlsI3uEumLy+4Je/kfu9/xuEa3G/4HRhtp9EPPT1QwQg
	 kluwvJnidk1vhBsXjySR5NXOQtDcMD0j5FXdNl9k7lMjgmz6sz4nBhEdt1iGzYcNnuKbc
	 OvxpQH0b3O3dezBH4jZ2dvPLz82LpmM4isCrvF3xoDsK0El+2H8Ao+ZWrEHfEU+sB9tef
	 PHAzokBwWHWlhPq38kleWE8Uad0L5FCweHGQFjb7oGgImvf8L8NatoPSj9HNzYz4fc/tB
	 9ASP9NM54qAiXPM1mE4keVIG6bmxl2Z4A4KWwukrhmApepzl5dD9cA6s4OYn3XrQFlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582037;
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
	bh=43PibUadCzsypcMECV1pXuGxSVDfYGhPii2qAZaiuco=;
	b=PX1BQEdJSXXQZzp0ydU4DXL4fObPuSeFZIy+mZmNvS2hf80Y6lVO7N9hjc7T5woxaTMI
	 Jq4bGirH1Ra7TTdUT+U9TxvTsnzAg3/LpLnHRsSHz2b6iz/AP8EsLBqQOWaohn/Gzrnhk
	 3TUHOJ67WvPrx2HVMIgzcJmnTZGMDaaPybj1afXGu4iGSBxOkwb3iLn9Nj3IQPygPMI33
	 4wqNN1O1k1WQOx2B2i4iCqhJLg4KzZLtfdxfeKLu6/pOTQfzrZaaWjaTJ0TDh2dg23K+s
	 aG6I5gPuEtouzlB1t9d5ZVSo3+LShdT/OTFjqrKig7oJQ9raNex6ti1F3Y7FK6aRV0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aodZjBob;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.34
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA905606A31E;
	Wed, 25 Nov 2026 04:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA905606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aodZjBob
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lS8yhmlKaQAQjJ2lPZbs7Ut7sYuIgDkTJp4kE43+KNVvQ52l9HkP7vgo6Idb0GIz5vIgKpsLH04Upa0dBpZRkHrRGIynPTEeDJV1LX1UeZiZHJbahlnUcxl2HWazBlh1WPJ0qXX/UJAPahweVh61hhMP3PG4QsFL5tucC0Xc6qnRZbvONBqE65V+OIe76Ujw1SZeZXMUpKCPQ8gdWjQj6aP/9q79DZTP48DrbcALchCVAtyy41SXOo+yWxnKGgDoRjZgtd7IMWhFsDMO7g2Lw+ajPObWy+FFKAtb60Ul228v955tMvHGEwEcrO6OWqEpchBc78l+D1RHfHyVW2UV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43PibUadCzsypcMECV1pXuGxSVDfYGhPii2qAZaiuco=;
 b=gSIYrSSj6ly2J4oZ2IhIkxS4Jll/Y9KjeqdvUz/Q/QjxtndVQT/GEtVkltS+Anz1n5kJ5wxW5QbhS0NXT3pNnvFgSMChBKu3ZhWeHLYZ2TL5DhBnygfx3TON9XH+pKPTT6x605+9ED5reU4Er01/NB3AcVg0LcRExw8o1SztzlrANmQ1uepOSBwl/2bRc7o4F+2rrcoABKSY9hnPY2WsXmFkozjX82j7GXzfgQYC6583AN0TbbL+LhhSm3KHPpx/RAtCnEeQIbgnuGFAuItAHcFQgB+Td6QAQ0Il27NNyHQ4IhHezly7YW638KJK1cSnFmLr9tbvwmhIPc91EbStBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43PibUadCzsypcMECV1pXuGxSVDfYGhPii2qAZaiuco=;
 b=aodZjBobtCPKi3QC2/nccVJ9EZu5CVEb6pY664H5G6mLk/+g2DHGa4hgS3eJUCLWkEwRDZJiME+BFEtb8LdYbketFrfqsgd52p77Ej0V+j2EpEMREbvTWgeD9vrnb7jvxG5lQByFpTYTi8XT5il2V1ulydLn4xCvNCVWhw4VRG8GDa8xP2Z5FGhU/j9Fq2RqW4IBYu0OM7v3cN7d60Xo/aZJclRk4sMz5Eba5JTPaRgoSzbfhQlYF1xMMEakXO99hdRAIB0Vc4+MkeVGnW7h8YvCpB48OX86N4aI9OMSZ03WEGd+x57EsDukayQUBfDZWUBbtZHcDCx4zSTumKgJIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by MI9PR04MB849419.eurprd04.prod.outlook.com (2603:10a6:290:ba::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 04:47:14 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 04:47:13 +0000
Date: Wed, 25 Nov 2026 12:44:05 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Joonhoe Kim <26rote@gmail.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "aiyengar1990@gmail.com" <aiyengar1990@gmail.com>, 
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: tell xHCI that it lost its state when the
 core is powered off
Message-ID: <rtgfuz44sjpiomzhamrkvteqygkk6jdzrvxh4nfcpabiae6bsy@cbtvblfx5uao>
References: <20261112141512.1840-1-26rote@gmail.com>
 <awZHwRiICsPs-UyI@vbox>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awZHwRiICsPs-UyI@vbox>
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|MI9PR04MB849419:EE_
X-MS-Office365-Filtering-Correlation-Id: 83dd55cc-5a06-44e1-735e-08df4aaf2c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|18002099003|22082099003|3023799007|4143699003|261028144727099003|56012099006|5023799004|11063799006|10067099003|261026121527099003|261021121427099003|261102123227099003|261021135927099003|261022105027099003|261026140227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	WuYJ9Q9eXrqcYRylX9bbLCTb0VIJA+OePqHipRBc7jdx/ED/OsNkwtBSN+/9mTIpzYhljBxTjf4OIlZlEBn41ipNwCJMWMqnUo23LRe3aH16s2qGmgxaatGXgOawgqhE5c3MHB+ohxvxm8RGMoYMaq9rFx1XPWQo6A5I7wAoyn4iEqHupVb6g+b4rPIXTMrEA4/n7flUmBMriXG01/M5/n+AYMXy9JNWGT+/ykNBbq6RtvYgMn5zIw9mvitau5XC0hI5WfhV9Hq5ro41CaIHwT6k/LHCoHaNzSMCWkAYo9io1g9ETQZgAVKHCLuvgenBsyCP8AkEItBjJOoR1EfL02X0EIlP/gmKJVJAnHhLC1JibTyekvx/Q7Z92le7IMa+pnqY5SQ7e5w/kHbFOiFMv0HReJNdaASlGA3wIvICC97u3gLDKkB1u32hn588ulkndO2q4fhJ8E0cOorLGgXnsGMmIyLG5zHASyF0KwdQUkgmi36952b1y1I9UzUYWAEY4MC68yYwlXQH5rHOxcyxYV2Y+/kHvl4ya0UaIklSkzJtDyAp3mLUSEB5m6+IDaDgrmtydDs2OrQUTnuFBBwjJzwgEiyUd12FZYZy7FM1c56rU3gR3RJIBJX1+apPCqa+nc3Dcb/1VHwhHKV3tbtGC9fFU2YMVjoP4YiR/ZuG5jI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(3023799007)(4143699003)(261028144727099003)(56012099006)(5023799004)(11063799006)(10067099003)(261026121527099003)(261021121427099003)(261102123227099003)(261021135927099003)(261022105027099003)(261026140227099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZlbzvzaIlp+FEqPzP7h6JwjRa24dte7p+13M6JwBFQ0PMZsU6ZNPRVEZ7mUn?=
 =?us-ascii?Q?VQGuG3D9Q4VdXyXF5Be1Hq5fsmtb8JaknFPf6nhCV9SoCFWd6Wp0/ZOOhHfV?=
 =?us-ascii?Q?BM6gHxENnEf8NRKSNVkCODSMvsn0Ugbova/aItVGh0lt8LXOnwwNdaiszTBR?=
 =?us-ascii?Q?J53tLlQVURCfdSK3c06n8eCcGBp85p89yx1h2Gm54ElZ+dLm3vQEu1VrygcA?=
 =?us-ascii?Q?heRrqFsy/OM18qq1c05RPmQIqBRW01Ureu/6SWlsPx0P6i6DhG1tVfR03HT2?=
 =?us-ascii?Q?wvkdkrzaWUXteFNqjkmFznJuxtCwWoU42DU1x+t5jj2ZNxU9o4snkEOp534j?=
 =?us-ascii?Q?Nrw1qbqjJ5LmorWRfQPRHYUV+k53PyjYFAcozZll/48nCkXj4It6ps11eiA7?=
 =?us-ascii?Q?PS7A8CiUFmcZWjxQeOaoztFd5fta92EK4J6iZyHkg52mRAyFWXtENdxyMzH0?=
 =?us-ascii?Q?CTlh4oF5vuuRJPaG4ZFr1AC5VU1Jw8VwJ9CTEMw4cNpw89ybSEMS7rx0//zU?=
 =?us-ascii?Q?mWnNOXiT6llkF6dkO8AMvTPpb5kS8w+pIJv4f1aMJnClQJ3aPZPmuazEwBJY?=
 =?us-ascii?Q?psTG+Bnal2eGvvHhdoBeT+ctoWPS3bhlbNy7gsdMDi3Es1BlF9EMBZ3BhDpl?=
 =?us-ascii?Q?ZhebwWtG0oHsI/KUhJuzzAP+5C42s9vlbO45I7eyPMIow+PXHXAYfCM5kqfl?=
 =?us-ascii?Q?l8FwWpJrmlWCGPtoX78ix+uL1iIHQfomYlQO88GmWp5oVyPp/aPAr27TKxy8?=
 =?us-ascii?Q?5dV6Iy3yjdJ70WtkOLPJNsCXCHVuHcTnqxXy16JzwuTvgJ80fvugRCIHBifw?=
 =?us-ascii?Q?pQsuz92LySdocAKSduC1eh27eg7KMa+ds7lec8BOrNB/OKlLctFdarrhKT0X?=
 =?us-ascii?Q?ZG9xOkCS68iwXqBsR26oBaE+vcWAc2KBunlwzagD7T00JXlzCs99IU/I95QC?=
 =?us-ascii?Q?aI8yu/Jeb7mFgutR2CGbwPG7iK9a5oUshiP3ENE57QKFn0/z9XNSvWP22I8v?=
 =?us-ascii?Q?uQgOHdLeiSlgsoj1rtvTsWeAUKERQZU1+p4+01+fVbddwTLQUp71li/73VFo?=
 =?us-ascii?Q?LKhLMRHMRGYEN5h8E7ajsF4+c++/8DvIqpV+WdlU1B8mEE7eRDLLBovCJrAQ?=
 =?us-ascii?Q?XphVBVoe73V2VnNhPiSHtR/yaej3QMLnB7f8iCUDl8qD8w2dOwuRIEccB1oi?=
 =?us-ascii?Q?w1cKvddq1ZGNwYgD2HLO7oSZu7Lk4BuezB4OKRcPnVTe49V5JQyqiYFh2v1u?=
 =?us-ascii?Q?UfmRncBMNhxFQhL1fVMRK2OcZ20xuW9+KtmX/0hJC/2GBmXKaJAt6bdOlR10?=
 =?us-ascii?Q?49Yam/MJyI17kQnTHYvFJNrSYsUvVLf4r61VokWyeNHVIdOwg0UYRpzzi4fT?=
 =?us-ascii?Q?ht2eUmk1iw96gJjuyWZCa+uyGa86IsyM7EigHWsDW4AuPHIz5LBjqSbdBTER?=
 =?us-ascii?Q?0jS5qLx3uTTzLQg17n+SqVYr12O8fhqnoXSzCzakBi7R6szHxiTtwTdWjQ5y?=
 =?us-ascii?Q?FUNBTHExkWNsw4pvbz7azaX7L/uKPb4DudXY43So4TF3nMjX8/8Y3dVFWDJC?=
 =?us-ascii?Q?HuNYVKcJJ1yabLIdm7aC/Y2AP497Rla+1BKZJfJq5rKoYGV5O/VUsKSRWdD9?=
 =?us-ascii?Q?7FCXcRFgOnki2sWhALg4yTKX5p1oyG8Axw4ARcF+mxahJNh97QVpytljRi/u?=
 =?us-ascii?Q?siKOoQfwR1Nu9tXj24Ug9eUNp/DBADxeevE93wMZuF3BiYLekA3Vh7C1kEdR?=
 =?us-ascii?Q?yHn0UImirr0IoJJL4hp2oV+UR4nUyswQTSmKHFz4iDYWrZYrRkW0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dd55cc-5a06-44e1-735e-08df4aaf2c7e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 04:47:13.7206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzls13evjdEuA+NM4a4ZXZc0/q3hI1iWCB0NPyJi+vq8ZuqCqbkN7MCg/9ZBMCeCFVXkqpxWZ6hHW3+D3cYKToHryb75JLO8CGHwDKkD3LLDjTm1QWjsbXpMyyRERLel
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB849419

On Wed, Nov 25, 2026 at 02:37:38AM +0000, Thinh Nguyen wrote:
> ++ Xu Yang,
> 
> On Thu, Nov 12, 2026, Joonhoe Kim wrote:
> > dwc3_suspend_common() powers the core off for system suspend
> > (dwc3_core_exit()) in OTG mode (DWC3_GCTL_PRTCAP_OTG), and in host mode
> > when the controller may not wake the system or needs a full re-init. The
> > xHCI registers and the state saved with the Controller Save State
> > command are gone then, but nothing tells xhci-plat: xhci_resume() takes
> > the "state intact" path, writes the saved registers back and asks the
> > controller to restore its state (CRS).
> > 
> > xhci-plat has a flag for exactly this, power_lost (commit 668cc6bc1178
> > ("usb: host: xhci-plat: allow upper layers to signal power loss"), used
> > by cdns3), but dwc3 never sets it.
> > 
> > On a Lenovo Y700 Gen 5 (TB323FU, SM8850; DWC3 + eUSB2 PHY) with a USB
> > 2.0 hub, a USB 3 flash drive and a Billboard device attached, and USB
> > wakeup disabled, s2idle then broke the host controller on resume: either
> > the controller wrote to an address that was not mapped
> > 
> >   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
> >     iova=0xd85e7c300, fsynr=0x3d0011, cbfrsynra=0x40, cb=13
> >   xhci-hcd xhci-hcd.2.auto: WARNING: Host System Error
> >   usb 1-1: hub failed to enable device, error -108
> > 
> > or its command ring would not stop
> > 
> >   xhci-hcd xhci-hcd.2.auto: Abort failed to stop command ring: -110
> >   xhci-hcd xhci-hcd.2.auto: xHCI host controller not responding, assume dead
> >   xhci-hcd xhci-hcd.2.auto: HC died; cleaning up
> >   usb 1-1: PM: **** DPM device timeout ****
> >   Kernel panic - not syncing: usb 1-1: unrecoverable failure
> > 
> > With wakeup enabled (the core stays powered) the same setup survived
> > every cycle.
> > 
> > Record that the core was powered off and pass this to xhci-plat as
> > power_lost from a resume_quirk, so that xhci_resume() resets the
> > controller and the devices are re-enumerated. Unlike a static
> > XHCI_RESET_ON_RESUME this only applies to the resumes that follow a
> > power-off; resumes with the core kept powered (host mode with wakeup
> > enabled) and runtime resume keep the restore path. Clear the flag once
> > xhci-plat has read it, so that a later system suspend that fails before
> > the dwc3 core is suspended does not reset the controller.
> > 
> > Fixes: c4a5153e87fd ("usb: dwc3: core: Power-off core/PHYs on system_suspend in host mode")
> > Fixes: f09cc79b4b33 ("usb: dwc3: add dual role support using OTG block")
> 
> Can we also Cc stable?
> 
> > Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> > ---
> > v2:
> > - Also set the flag when the core is powered off in OTG mode with the
> >   host role active (Sashiko [1])
> > - Clear the flag once xhci-plat has read it (Sashiko [1]), instead of in
> >   the host branch that keeps the core powered
> > - Drop the comment above the resume quirk
> > - Add a Fixes tag for the OTG branch
> > - Rebased on next-20261111
> > 
> > Testing, 30 s RTC s2idle with wakeup disabled on the setup above:
> > without this change 1/1 cycles lost the controller; with this version
> > 3/3 cycles reset the controller and re-enumerated all devices.
> > OTG mode (DWC3_GCTL_PRTCAP_OTG) is not tested; this board switches
> > roles through usb-role-switch and never uses it.
> > 
> > host.c now includes xhci.h for hcd_to_xhci_priv().
> > 
> 
> This looks good to me.
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> 
> Hi Xu,
> 
> This may conflict with your "usb: dwc3: wait for the port to leave
> RxDetect before xHCI reset" patch. Can you check if rebasing on this
> patch work for you?

OK, I can rework a new patch based on this one later.
Maybe I should wait for it to land first?

Thanks,
Xu Yang
