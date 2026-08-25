Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEDB3921C3
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650511; cv=fail; b=jIsd8X4fzHr9ZEkkY5iDuNPNOND18hLIx1uMWW6w+ihUcRenOFPNis+wtX0V2YOHv9oPR45bo5mFGrph9nzASVjJlhEDrK1zj3YlN5214N52wSuZwW0ZLbTc7LUb1Uxr6u0K/i333A07OFpNEubWnXQ22jKp3KqiFctaQu0wv20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650511; c=relaxed/simple;
	bh=KIWgvqyXKR/w4XxI3I/UgWU7ZW1kyqOmeGXvxj6TvXE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=moGjXYQw0PslPSCwFc1ygKQJ3PmR7nbE6wWHxey6MkgDEcXlqqO9tXmKiXQ2B2ciSUyfkNMMw/GkmjNOlE3w8HB5LwCMoVPmdEndv+/0YEQffPpaBtuobuvUZp5N5caYDRL2PJ1+KNyGnmKCTwiXDhnXlv/oveYZrAOI8GkEmeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ4oFggA; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ4oFggA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787650510; x=1819186510;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=KIWgvqyXKR/w4XxI3I/UgWU7ZW1kyqOmeGXvxj6TvXE=;
  b=aJ4oFggAg+Rg0HM4VEX82D19WINtZbNVaivotEfURhrowgO3cUZBfObE
   rRlVm1AXSF4VzENKP8+UTbX3e1AFwQ2R/6RUwYwWfyt18mJrm6J0oZC2p
   vzNRGvj22YZru3nPMUmHBju7mA6xcEOiX8VQ2iiadyv9CqSN0AYhLLdeU
   IvYvkOBm6CYAlmLPLMWLe/rqBUBnXYiI1+t1W9a8by3RZKzK070k9h6tK
   ms/crOweR5JefwpdF96HyYAi4bAiSaj2L5uyyauSE1goxnOPUGTVEyvb6
   NarIuVCsdjDBA/8eUoxy2DX+jydgRZfCu1rw9fHtRJrxejOGSNEb7+w6C
   Q==;
X-CSE-ConnectionGUID: /CMg4QdfQ5ClfsvR+6bjGw==
X-CSE-MsgGUID: TD87TPcPQb6l1KyNMNM1ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87986425"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87986425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:35:09 -0700
X-CSE-ConnectionGUID: 9pPgK8QNTpe93KwEMIB3dg==
X-CSE-MsgGUID: wMPCQ8PESNKW7RUlSGjseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="265928630"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:35:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 02:35:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 02:35:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 02:35:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ED2hoFbq32oxKo2G3AQUtDldkB9QidFD/D8JoT293i4Z3gtlWLejHowbdM4w76gS4S+xcD2kKN/0UC7eyWQkEjq3rnAnfsdPHxSI8X0P0uZ3I20VDe9z7bLKPNyAfRs18D32KrheHZyDcxWJeMYSpL4l04GKCLziBorsrajDTl9xCz8Ave45CWozRCaKPsVvf1zj3/kgTlhQHJJIZJmyB4mpWbNxfMWdwVdnBfgTC7FpdCC2jPlErXLtYktqzHUbOssxjeXYxCI6TCWbOw173ueXcnky3kT0zHv3JeWlsF5fhtkG2kzGvMfhKI8VJP7PqoBB4vvSgRo1a18Tt4vwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky5gNxe5bnekJqaZdMTptOZwc35ss37kRT9wKajh4gQ=;
 b=PvNWQ+Ymln6IvizmSw0Yxj8SkTxweIp/qGOf58hL74e/0Q/eOHk62KpQZ3YZM2OfB9uqg4cL3tofMGfvxn9O6y46fBlOdGVDH0znCHwHFokIEcSEw0A7X3RhsCDxcLNNjGeymUOMhdQR/rR9sEeEG6cqnyiMyEqfCnenh/YVojUnS95Db9CNCrIoht5j3KEB0m0wrNIpdKTG/HNKqjOpSUCJSpIY7ppUVOsR2RZiMabjx/McgffeA5SW44gi4lgNWceCrepkK+yNcjj06O/l8rBiId5AfTHD057D7y+dPFZyQYKY1aUHm11XUjOm3f/esmTVwuIoT3L6vs87Is8ftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by LV2PR11MB9537.namprd11.prod.outlook.com (2603:10b6:408:378::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 09:35:06 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 09:35:06 +0000
Date: Tue, 25 Aug 2026 12:34:59 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dennis Wang <wqingxmu@gmail.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>,
	<linux-usb@vger.kernel.org>
Subject: Re: thunderbolt: DP tunnel activation not retried when display NAKs
 while settling after link reset (Apple Studio Display XDR 2026 on Panther
 Lake)
Message-ID: <ao1hwzy7ksGU2PMa@ideak-desk.lan>
Reply-To: <imre.deak@intel.com>
References: <CAOX-mXs0ZjpiLtviUDqHLrzWh2Dyz+Y9gZUcenW_yV4iQUa=7g@mail.gmail.com>
 <20260824100750.GC893316@black.igk.intel.com>
 <CAOX-mXtLXcdzGjSy12EsZ5H=AcgzROA0x38r9+Fv7ygH3iq5sQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAOX-mXtLXcdzGjSy12EsZ5H=AcgzROA0x38r9+Fv7ygH3iq5sQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVX0EPF0005F6C3.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::654) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|LV2PR11MB9537:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8bd03d-2350-4a62-6c6f-08df028c25c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6BHMar0Oh6y+m7i6AuOhati1I5qn8H6KuP5pylw2BOIihlQhD8GE/m6AGEJ0v4ZXvN5zrBK8EZ9DsoLp30nuWH38W48EzXOLA0dXB5uF7XEDHKmfQ3+sZhn6a6HVErRPuFrLcQ4/IlBsso6IN89iBcwJlZ+BmgFHnyGvgVSzGGCWO8Y+9k8XSZFdG0TmkKkgwawj1qwXcJpRrIA60fJ/5BDywR+VXuZxdimz/nUv9VpsGL8lHiVoj4Yf+Vg26G1D2sn8TM9uqSyDS6CR0twOYR4jL15L1X6at/HnLIIDaIG9J0Dq9/FjDhQqiRYQE1ohUpmYrT/wLV4Yh8ASdBA1AGzFZv/nPEMUKOMS4E5nJfc4u9txJOcvC3mnOjsSfamzeGl5KqeK7w0HbbQvnGLHXtw+6ekwNc3QIalid6Y/NdBkWBjx55Yj8inDD5WYREvD94wOrTDsIRGaS/Q2dXyxcusZePD8jmS1snl0UDUa41lVYwvkURvbE3jWEdn4/lT3faXCkv2OcCaDLk3L3fJwXcdRct+/7wgg20SMex8D5ubRaeStIR8jg7Krrd6NkrVr6NnP4eZTwjFmhtR0+U4BbICUxbgMyQZkF//n95JM7bn3XDFD71T4xFHNTCmAkACzFFMqo3OapAfdSY4KlIxqCHkTGqwZZ+wUTKTNSA2RlLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9273.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UJ4OvHJD14+0TmpPK54iWHadU+vlccMzj1tYr/EhDlcOhS5M0o8c0mXtca3o?=
 =?us-ascii?Q?nUAtQWQ+rXGG0MTPU2EmOBH1nGK9iPgHoqRP3olV4aTxqMIoBbjPv5Z2drja?=
 =?us-ascii?Q?/Kx2Mo/fPU8plVnhVO5nmwx8oxduPx9i8lXpp4MQKVf/+1D/nNkjAdOgzfG0?=
 =?us-ascii?Q?dRL7wOINdhE4fzISFuIJLyXpkgjitOZypXgnTZvSgid/WG8oZDr1TjrVS5nv?=
 =?us-ascii?Q?RHHAKmaRaBMsPqkuB9IM7iroUMluOjWLx7d6ZM3J0W44MYLn6b5ZXhL2xPcG?=
 =?us-ascii?Q?5Uztl6NhItIGKQzTew9GC86Tu51Hsa2+ZH1hFOJW7rhKYYrnbN2QTmeaSRUz?=
 =?us-ascii?Q?gowAtdJZ1PdfUvnIwbKIjRb6bkxON+B9HNNSDwt4Ec8uBTK9W6OCJiqttDmU?=
 =?us-ascii?Q?OFyEOkdSme3ACAS9UWHm39rQVQAndyeQL0JxIYbifs6ivMyfn1mBj8AuS56O?=
 =?us-ascii?Q?2CYoFdoUtlkVYiIJBEGsCi32vpR1GpGkQ3kignneIoJPi8zbzHFksom5I4M2?=
 =?us-ascii?Q?Adqofy3IXRCTVIbWluNzSFTTraHNQhKibjHGQfYNQ8Gm0yoJrlSF6tvdlZk7?=
 =?us-ascii?Q?xuKKnrmM3tPBZ6Ln/yGnssoPyV3FKuaBOp9vb+OO+X6Wu8kLvSsM8IdSrh0r?=
 =?us-ascii?Q?wnLj9GongVtCcmMc0j+adNl+vFxKEGGsGlEVKHf2AoCwUONDt0TbDM6ba2p/?=
 =?us-ascii?Q?nh8987b2lECrxxcRhF9499mdgT3fCeZBMdYWILdot7Mls7l1WGWDAVHenZZ0?=
 =?us-ascii?Q?cmW31CDvGFfIvHq7S2snbbXlegmm2DXvCSt8QTj9oxEfSZi72P7f1x6SbFhf?=
 =?us-ascii?Q?tG8o5SbDkflrDA/wt8C5G/SVyIzGZwUuOG6kJybQlpRZBxvV/A7w+hHIEFSp?=
 =?us-ascii?Q?3eRTvTWjq2cgadmsYY62bnC9PPghfLathygCBYGpggYLWg5812SjAWywxvoq?=
 =?us-ascii?Q?j09+LCTYn1D0b2fYVF4lAE/iAkRV0f2jPrg5DMQw+PDRCfj1Kj2o5PTQ9Hgs?=
 =?us-ascii?Q?8ut1okq7ndnpR0VCwDt5V72U0NX/YPbakyaSs07tFBvZsJv0xamS2MY5EVwn?=
 =?us-ascii?Q?Lgwfy/CFwUnrXJ0LAcKEMZbug2OMe1pw8803g6y62kXXJ0lvOMraJqOodp04?=
 =?us-ascii?Q?oCpEqUm4EAEyW1DRQ63tnZtSArgW75FfzP2PWnTy+s+ONWQX650TMeB6tj4c?=
 =?us-ascii?Q?T6SE+SCFcI+SUZ0YlCoqdZVbOo2DlP4lrB6G3odFmXvDdhoN7TL3ObMVxXvv?=
 =?us-ascii?Q?/cdwWRD5FMHx017V20o/aQ9anPX1w9UFonzcR7nGMqFqQ9q27sptK0mnv+8+?=
 =?us-ascii?Q?Tim3yBuQNG8vsqCcmqWh5N7zx41xjvOpGdNdReHsREw8A6PYnIfLU981dCMR?=
 =?us-ascii?Q?x6bBrIb4At6gAkH2C4IWnJoqbrqCxvvsGdXa1aKgI/KiUrjniYPuyxfLfaQT?=
 =?us-ascii?Q?crJXATTD4pddznfjcocng89uB7uVz1HuHMUdWwmnvKG5NR+Bnikxcjp+/8d5?=
 =?us-ascii?Q?poYPY6OwUBldEaI6GFwG6Er3vgxI9poLG2Id3Ym8Pn1aInjT7OjwLTOzGywL?=
 =?us-ascii?Q?Q8c50zCiiilTUCMXRsobwqXi6W360V4MXsRl6TZHBoOvqPmZFJCtic8IJRTk?=
 =?us-ascii?Q?dZIRClNPsvemmNzgcQP5snAQc1v4BPriNZtzXCnlUGHLVmHOoM4g4iVYmLT8?=
 =?us-ascii?Q?MTptUpv04wtLcryucR0LPALviRfUJNNQMVcGOsvvC7IkS7z/ax6XZwbciXcA?=
 =?us-ascii?Q?DkYBNx1gKA=3D=3D?=
X-Exchange-RoutingPolicyChecked: CZs1ifY58YldwB0RxXqf8WUdvkaCdqrfY9meQBhfEjG8rGScBSFwAKEAO+rtXlHtVzGWmtFElM+oMbcEYlrWf+DdDM40AdPvgc2C7AgkvWnJ33fbMVTOBUY8mAxpqzPxnaVlXR8Ahb/Zub45F+UsGtTl035iSUx4Oq2D6ZhtwCQhHpSPrmoVmej1cgpncwjt2SpMLtMGvn2J0bHtZZknTyVaU+eMGJz6aCtDuVhmD4arElHl49JdpvgpsPBiuo51OHCXhAQ7ctoo4FVplJrAQ6S0S7+7vbbHKfc0o2DPAuZqKUW/GnVCP2nLtPtUCjO9y/RGGs4BcT1ugt5v6Tu4/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8bd03d-2350-4a62-6c6f-08df028c25c6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 09:35:06.4365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fSwxRRS9u2UosenUbaXo0Hm1wdfcxLf70FxtWVVpahcvWiMDoNTLRIrMvnhImgBzWKIhAGQfUnYkBYa3zxZxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9537
X-OriginatorOrg: intel.com


Hi Dennis,

thanks for the logs.

Could you confirm that the problem you see is:

After boot-up with both displays connected, one of the display is blank
by 4.839037, while the other display lights up okay.

By 47.768154 both displays light up correctly.

I can't see any obvious issues related to tunneling, both tunnels are
detected and the BW allocations for them succeed as expected.

Could you try if the same sequence without the other issue you mentioned
happening (DP tunnel activation failed) the blank screen problem
reproduces booting with: xe.enable_fbc=0 ?

Thanks,
Imre

On Tue, Aug 25, 2026 at 09:42:23AM +0800, Dennis Wang wrote:
> Hi Mika, Imre,
> 
> Attached: cold boot dmesg with thunderbolt.dyndbg=+p + drm.debug=0x10e
> (timestamps rebuilt from _SOURCE_MONOTONIC_TIMESTAMP; root fs is LUKS
> so journald re-stamps initramfs kmsg).
> 
> This boot hit the graphics-side flavor - tunnels healthy, screen black
> until the LUKS passphrase was typed blind at ~40 s:
> 
>   1.8s   XDR found, Gen3 x2, both DP tunnels allocated, no errors
>   3.9s   second sink (0:10 <-> 3:12): repeated "DPRX read timeout"
>          (tiled 2x1 panel, two DP sinks)
>   3.96s  fastset rejected: crtc_hblank_start expected 3840, found 1920
>   11.3s  AUX_TC2 power well disabled - nothing lights the panel again
>          until the compositor modeset after unlock (~60 s)
> 
> A control cold boot with video=DP-2:d (masking the second sink) is
> fully clean, panel lit at ~4 s, single-stream 5K120 DSC. The original
> "DP tunnel activation failed" flavor is intermittent - will send it
> with full debug when I catch it.
> 
> Happy to test patches on this hardware.
> 
> Thanks,
> Dennis Wang


