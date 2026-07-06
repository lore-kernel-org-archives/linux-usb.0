Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013054.outbound.protection.outlook.com [52.101.83.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E597081F;
	Mon,  6 Jul 2026 04:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783312789; cv=fail; b=Y3MLZe0xbws2D2MAEG3CDOdPOP/Sv+oz1q6gEo/xHg+OEvB9d9txU/O4jkRn6lNenoAmxaKbWWeCcslq0IqWU1d1bGf5ze22NZ4+4L1ZScIxXUNyQ5H7iG9qXIx+o0VvPRLr3yWSDVGTVIWoqOFEafxJ2eHfV2Yf9nHpg9Bh9XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783312789; c=relaxed/simple;
	bh=GUCFsbP7RBt1CwgYxLoXlLGWKSmam4lAZtYwKj+R5Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RV0kCl3hkpEyN8S6JeNMS0QtavMprZPfu+74UI7vV+IBh+nZHyWFrNWt1x79WqKXZmLAxTgDPfQbkfphJ6oo5PpDgBmDJZb0Z17bjFhT2BY7Vv7yKCFIoDSfzfV0Rat8c+moZVOUsjiQz51es8bGWpf3kHjdtByCxB/Nullg0Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OYsFnUVN; arc=fail smtp.client-ip=52.101.83.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OYsFnUVN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDs1xXslhVKq05Shj8egH8sHZUp0XM+xR7T6nDfb34AxzsZq3sNyN0l7jctZEsy6jBGFtmPfi2RWHWSc48p+rmYn53tJDlfMQapN7j2P48wBvGDHnWukgPFqVdtomlbUJvs5oC66MAgO/fo1L0vWxVV5H35ydnc32b0z0mSHbAG9h6FMOyPqlmIHLf/EbXKVz+Rfwq7R8Pmq38zVkWoNaIK8djcAzrA02bwtMuKR+3lIHx3LqLDYdHnZM+3TcYziwEtcJQl39uU1T4rcKBkd3yxq/sZmMErn8K8d6H7JgEMiAWbR/jWcxFeEsyrhZFB01KegVCIxORPSifuNk4nfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fvkFFk1Frjp8tCXt0qGh3gBuinwTOEmM8qVLef6mDw=;
 b=b+BOJNl1kNJpVgLB738HRZvRe4pnqP2tZp0oBkV1z3JKMJqQB0xYh8GMEBx+ORE8mB1e4zsR5bZe3d2oq6YnYdvXKa8CpvhappxGZJtHBXJ+xfHrfYdqFgpAWBCb7tbLLhKCn50fLH853eiyZD1pfjwXODOGq/oW6ZGlTgESA/+tiV2jhQqhZBbFd/+10KfTpd4+QtP3XrZsHULaonmKc36ARq1qJhToX1Thm/z60xv874A5PHChxI1tEl4YWEsuVtLKc/jCNBP3o6kEz8iwNbO8K4nXEx86EP6NhZVSntrm5+xfi1eADy1zgLCOOTnmBoBVANcLsnZrTD1QJpY6nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fvkFFk1Frjp8tCXt0qGh3gBuinwTOEmM8qVLef6mDw=;
 b=OYsFnUVNHKhanfkIQBmrbIWdLvl9YOv7rXnY9KVLlNYEFm4Up46tQeHK6GGGF1/XZzKzae712P5yRaHxReGzn2FdkPhVgn/yb9uQlkz8hGC+2o7jHo8EiUkKNwyk8QHdmPXLDIMChJ+RkiEbGZXbaiIh0caByJSwSP5VmVf7qNWMrCoE+DLoePsMDHwtbb+xBFVhSfvP26WiIUtuhr30DKXCQ9ehvgDkGuRhEB1LjQvGJ2F9Bfc1ywoCOOsA7rEiHgjESbvWEt6yeIvgE71CcmcRxeUdOnyULI7XYZukJcYWprPWvv1UfW2MOC35GlULdBWbdKSlKQdwNoabCj1hnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS5PR04MB9769.eurprd04.prod.outlook.com (2603:10a6:20b:679::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 04:39:45 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 04:39:45 +0000
Date: Mon, 6 Jul 2026 12:38:28 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v2] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
Message-ID: <g2gacb7dfzzvqobqtxrl52tp2iqtikozg2xeay4ueroe23fkhq@n6rdjnhtctjl>
References: <20260705065832.184-1-kernel@airkyi.com>
 <af9b60de-ff6e-433f-a757-ed7e1dca6caf@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af9b60de-ff6e-433f-a757-ed7e1dca6caf@gmail.com>
X-ClientProxiedBy: AM0PR02CA0115.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::12) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS5PR04MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e5e84cf-2133-4dd9-33cc-08dedb189a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|366016|23010399003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	RgJBtpPPRacvLc3hzdA4t11IaUB8B/3Zg99gxunM7C6zp1kSkIQLYi7TztgmTyHHWtaUGlfKBjsLMOxaAax7AXvR/KcVuj8+uruaEt+ZGhQSqsWg0xIhYObSLfea1w5R4kMeAH/eKE2UscU7dgp9k2J3MJuh9ZG0gMHmmZxKjkc+QVGZmP6frytPk0W5DL7X0jqT5orRUDp1ut5Rx7YK1NQoadJcwPikXxYl4j+MRX63q0y5fHKFztgekSw/J4QQtOxXWB2xHAlJMBjb7JcBTJR8u9yX5E/S0gTqI6sYHwXSHM5JTNc8Z9AsUs7VVTYC91BHVbVcf3FoRn/dcDVkJNA2WOts+5FFdIAo1NMVIHqTxLyLD+mF4uhLLj4FEAWRo9+xihtJaHQivIdqmxXvB+McNhD4J0GFmucMVB5jUpWANxus+5+c2P15D5XbX2vSeiM3Quu1iDIA7n49fNbcdbgC4mZvjCEPo8pLChZN7qgatXnQsH0fDShOouL1PlgLhIpVza/W8TqxJSPnZyyZKXn2Jqw8C+r0pJcW7/72rhDjkYDabXsn8HNFVxHa/8gpDqU/5Jm0kQFwm3fPZRIf2tYsqyjgr7xo67fdu3Sie5dufjtJdNIRTyp37jecBrXswBsb+vDSPhLQGBNQywIrdpEZPFhJ69WC19Gaf4aJcFQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016)(23010399003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?znvCYryORkqjySQ1YIPw/8r8Jb75wjWfk/5WvFEZQvC1EuCOij0gBAws6wMj?=
 =?us-ascii?Q?03mbTQbooUpn40a3gy2LmmEkNJEO+VdzAuvS43/3sShDc+exu6e6gGTgpw2P?=
 =?us-ascii?Q?G2xxLCqQ5QtL8e0OjmOcjsjyJysVbUljNvhJMEPvcOXFy3vU7id3WYRdtNUR?=
 =?us-ascii?Q?V/KyjvY7cceAZa6pVa+ETKA57Aw2FtgN9dcWPqMcE3DOSrIvc6exrGYfpJTn?=
 =?us-ascii?Q?CRvh3gexAXUY/igf/YTIRnwdV4XYwWtzIe8qzQQVJhlLLUvQLNI9tyVRhq70?=
 =?us-ascii?Q?pbBZCXg6WxkoA/ryw88DvYxQ7fgHd+bABEzmedS9nTZ7Awgy7DshrQJg/C4z?=
 =?us-ascii?Q?EGxvsO6QIehehF3dQ0tar/Q8s5v2Gnx1NrWK+kKlIjm7kPM9/pvH4xllkIZE?=
 =?us-ascii?Q?RxLSl/KrX9sjnRiQ0TPiXCrpCJ3vp2xOlG3HOF6bDIB/1SwX9y9xegv0jTaq?=
 =?us-ascii?Q?9LBNI5h86SMbPJT7AeyOoi2vE2rKeqRhDd9hDIpGgzNNL3wAw0YSVgcd4x+W?=
 =?us-ascii?Q?vgBrxcesE1P8cWxy+q06nh0h70ZKwtV84I1VuS9aNiczz3+OhQV7KOHflN2b?=
 =?us-ascii?Q?M1hjzCDUTXh3D2iPgP6sJDCCQzkOgQ/9lhimlsqJwBaINGcgMPy9Zp/ReVKn?=
 =?us-ascii?Q?ebXM9WstCRfZ51bcHKOV5mmRcrBgOhpyabqE5zD9ja/Nb5wrxqtaNQGqFiji?=
 =?us-ascii?Q?0L/MKwWdHDPUpAER27sWaKwjUCTR/SHGfaWRn6d/4sXDrN5Yufa4xlJvoAbW?=
 =?us-ascii?Q?to/5cbUZ1Rw8FFhvAV0u3ydys7CgK9lcayRMaRDyzzIyicSlH47Ba4EnHpHu?=
 =?us-ascii?Q?CyFkVcQGjfY2xrFFHrMgy21mGMbGlPl43IUeCiYTLSBQ2PeEiH3YPrWDy6vT?=
 =?us-ascii?Q?PQmWf6D+1tiU2uvEXCCg5DupfRUdVO3jN6isYzYBNl6ogNkYS+il+AvXAO3e?=
 =?us-ascii?Q?2FO7wM72raF3wDJvfSYeMglxu1NIzN6EPasTkPBVtUxUmGQHZjkF3WE1PpNk?=
 =?us-ascii?Q?15zDJWYa0DpzYjucS6uZix2oYZBufFHC3wffToyXx/P5n26QgbCjLUDQOzrr?=
 =?us-ascii?Q?4vB+BTq/bdulzrjqwDxALpnFZ3CL0JcDUM40gch9qZOohJvXIquwPYk5Bmm9?=
 =?us-ascii?Q?IyQFMJV7kpbZtRnWK3MCug8WhhgbswfEVHP4LDsSskR/G/agstClYqwv79+j?=
 =?us-ascii?Q?+UkJ7jiDyf0VGEUeWVCFQRvleNszGjWKfDlR+kRjrW5ibuyTuEdYup6SBwok?=
 =?us-ascii?Q?73i6cJZbC56OUQ830tLUhrE0ETPvm1vsjND4Sh0nUdpozM6dcGnQ8sHh3tzC?=
 =?us-ascii?Q?50oW8BAS8MtXyFuBopdZJOtWWA8JG6tYkX2q8YuzgtLrVuYxadtShizLHbLN?=
 =?us-ascii?Q?PHuiVxhgtofigFSdag+qzXMwh1Azr12F3RUoAeYmu25WHO/mjD/+Wx4yTEAy?=
 =?us-ascii?Q?aNgRboKMYG3IZtSIeaelGYZHlnaRl6FSKD4nZCGT9fxGwsWSkoT2/TZvPKla?=
 =?us-ascii?Q?mQPL96LJM+cAlfqSvXDaVAM4OGsjhTVXWZGFukxOwnymCh5/F2wmir8McQEs?=
 =?us-ascii?Q?ndIPIcCkAO87yWDe1KRGF2tiwnbphcvaiQt1mJbIwD3sQIfS6v1A5+BFiO1h?=
 =?us-ascii?Q?aYOGnMfuNjlYnrmnJXymaF2wOeBR/FCrbWHI/fDj2XIEkuhs8ace9M1efacD?=
 =?us-ascii?Q?dA/3e365UUsp9vKAQ1tqEnPLPM9c9MZzydt2MxMLlgdvOmFhr8l9Ukp4/2cz?=
 =?us-ascii?Q?EH1UDH3nxcxToA7FeLh3pcD9D1naDxarx8LYBoHMirlUkDl1QiVB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5e84cf-2133-4dd9-33cc-08dedb189a9c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 04:39:45.5305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BATibG6rSG4qjzAvDZAPiDUuRkaV/kBexCrt50dJoygIZEV5g6CjgwZoHIaZO5SSkZDZOV1hbVv0jHpqqmiHSj5T/tzOu+tRlRcSzUS/ftkFfKJuV9ODiwJrStXob3dv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9769

On Sun, Jul 05, 2026 at 10:20:03AM +0100, Julian Braha wrote:
> Hi all,
> 
> On 7/5/26 07:58, Chaoyi Chen wrote:
> > +     imply DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> 
> When I suggested that 'imply' may be more appropriate here on v1, I was
> hoping to have more of a conversation first.
> 
> 'Imply' is safer to use than 'select', and intended for use when the
> option is highly preferred (but not actually required).
> 
> Perhaps Xu could provide an opinion?

Config DRM_AUX_HPD_BRIDGE is not user visiable, so I think "select" and
"imply" have the same effects here. And there is no force dependency bewteen
DRM_AUX_HPD_BRIDGE and TYPEC_DP_ALTMODE, it's ok for me to use imply here.

Thanks,
Xu Yang
