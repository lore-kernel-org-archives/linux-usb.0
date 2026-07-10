Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A861035AC18;
	Fri, 10 Jul 2026 06:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666111; cv=fail; b=rCkKKNzxu2keZFJa4ChKunxKIFKJvmrQQVrpEQtUcJxMbi9uMgOJ6wFXknD/zHrnI6BIUtKEWSv1ZK5if5nBhq1Kt1DlEJ//IMi7KDiyGcBmzwoqyL0Rztlv7SL4a69C/X92tlyBtZs60okddNJYoK/It9PrPhEhLREF4rsYftI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666111; c=relaxed/simple;
	bh=xRZk6yQTsRXhm7S3AmSo9JkuZ3LCcNGA+zfIVK3vzSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L7rQQWiUfYshosEUuH5wYlMU0ctvfgOM7c7w86slUXqWshM3DCUOVlc59oFsd3WvmFyZkCNn0ZzZAz2n7ZVrcoXoO0vOGHl4PdgejOBE6tv2MvZwRW5EuZ9xjv2lUZ0+jKCdGk30sBlyc6QFaFbWFBN4IOCdsoGdzAza11zsYlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sLtSs+gz; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sLtSs+gz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFt65iwJ2u73HyBkhRo5m2GbcX5xM71NUqtXuPLX9GJT/HepcoA5TQadGs0Ob1zwtmiUW1FIVxkSjPBCRiClXiGWeEWxImipNOsUIjiOQukHlnHQUF/ROzd+FF3glJOf9lHWq5784wH4Q/xfTgPsKV+oU6YaAhDNPKxOsMlY/0aIyOCtERYMsn/rwF0adWRwW1PbDT04ZkqhTnNUFqB3DqRbiEqXecT7QzQULDw7YB6YRXGiW7KtalSJUtCq9BywcYfPOMMoZOOGPWXGNLC6vBWUwqdeqSWoo4SIldPswKZ+OsqjoI50G9t1xJkKQcuWZ5SYiYvif3d7UUQUyTIWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU/X8I0+tXmdqwJrVeSGNMOTyWSUa6PxLz9JD5MZiXk=;
 b=tVx6RK1bzbVPrf9EcR6eVDKchzxBNud/UupWqxGKMEeprdwkCpgq6nVUZ4p6413H9RP+FUN4GtpD6ngJ1/mKO18v2WTiciDgVCtgJb4oyKuTXExHQHozkqON/9aYw+KhK2k3Mvk56ooxIdyq2O9CBdRUrF2pTgKTLJS9OIpBEF42L5/+XKcz6LoriYu92qsoAlBWZOejAjxki7w+ce8ErbYICYt7i0iRCZJ6np+NPVrexONZ15WW/9PuIkLwP/ZLZ8fBgmSJed5ksOcinv6S4qhFhI+/Uz16EX9ZiPsWs1UjzVdYc8fEE2MoVW+dGRgX7PXm8HwhXCOCC/yw24B6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU/X8I0+tXmdqwJrVeSGNMOTyWSUa6PxLz9JD5MZiXk=;
 b=sLtSs+gzcvDQ/EuIudm5qF8DclbeOhKWpWwBiFnh1ss3C8LKt01DhBPpj/6apsJXykBTnRexiwUeLrCu/u4vBsjNiznPektNRt75Ba7O+w9CbkbrP4y+CA5Qpt8HkFd0G5yOkFxaEfvWuXzgGF0umH/ywBA7f6TUMKC6ifyq3KlUHpCYgsCjnb2LuKQHLlviX8ZhQE7g/iB/ykCCC0lvMLIlGsqBW8cNwWeW8bcbOflcMIxN7RIX7XmX9ulLxRz6jR+x2q7IM3IuSkjMpUlPXbHyOZK3W4cJv5lHhsbMYjjLGoBoilxUYL+hxMHlIq/pQ8KhNzzxH0xdjNEB/hcn+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8627.eurprd04.prod.outlook.com (2603:10a6:20b:42a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 06:48:27 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 06:48:27 +0000
Date: Fri, 10 Jul 2026 14:47:08 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpm: implement retry mechanism for
 Discover Identity VDMs
Message-ID: <6fzy7hyxbomkucnoeogioap63vfufhiy3ambo65zrrjqdtwxjl@zqk3nabfnrvs>
References: <20260625215431.914380-2-rdbabiera@google.com>
 <uwxhwziw25earfgsn55zikihnv6b4g4cesxlccrei2opk5exmn@a5wu4h5sg35b>
 <CALzBnUEBtoiW1+hBBxkvpp4+8f-3uVyg3+4LKX8ezTg6zeOfTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALzBnUEBtoiW1+hBBxkvpp4+8f-3uVyg3+4LKX8ezTg6zeOfTw@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0391.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8627:EE_
X-MS-Office365-Filtering-Correlation-Id: a121d6d7-e42d-40bc-eef6-08dede4f3e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|1800799024|18002099003|22082099003|4143699003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	uqbWzQkThsIqBdPsyqAjBsbfUmgIiM4Pq8rvGvb9JctzzKtfv4Bjxt2IL6L2yd0jWhe2rEp/dd519Qe0D5fVBAForXV6O947Zk0I72Dz9YkYPrEKEvfX6Rxhg9jLuNvJzQ9jYQ7KszU+OWhqx2kWFXw4lw3eOIJwGKr98TP0BLYGScEA2GyZX2Zc5AFW7v6GS/O1OUrkE/nduslZZzezfbAv93uIkOU4cVFXN1UDIW1RzAKXynt4o6ZUS4xOV5Qavc9GcIpq8HDroxLe4bIbD5oWHjisftpdNAA+juRm4dKQQywh3jej0DZoIoMgAv5Lyf45HfbzEpFNknbRnF4OjjCI6yTb+J0tz+uwqVJl0kpn+zZ/bfc/SoncnrKbkcA9OAhX3aVgN2C73MiJh8SPNcJBQYyB75q3PQ2e1BAOwaBZ8mi34IrzlZeLsAYCmTrmwkqxcXGHNlXYYyiThqAXV6zn9eoRPMvtxxauCNu4M80+xzzfUocm0vC6+GIvpLV/DsN1Rdm7j++F5JeMQ0vGinkeOr8ytYhRDcfhAwoRPNc3KGp34jYTeQZ9gAN4XsVtom05cYN3pdMpk4trxO/5GM8gFy250hr2nGguHxRwvCHsIVvRzziXYw7azx2W9RFEmSP3u0IgUvQ1WijvbW3u5URPaybDujcic1+z46C8T+M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFV2VEpFZHNGKzlITTY3b3FUTkl4OVdSNWZUSDk1b25XRWFaQ3VoeGZsME5v?=
 =?utf-8?B?SjB1ME04U21lZ0pHUlgxRE9PSlE5cjRpMS9lSE5hcXZJRnZSSndyR2tpTDQ3?=
 =?utf-8?B?MkJUOVhSMllBQy9QUjljQ2k3WHNXTlhxSWRzM3lQRGtTZnFiWENXVHMvWTFX?=
 =?utf-8?B?Y0FEd0xRUjJtUy9jSk5wWUVnc3BGbURua0l6eEE2ZGZXa2ZabDBaWGxjNVJE?=
 =?utf-8?B?K25jei9qSjRYWVc5STk2ZzZTMk9mK1IwN3cwL0Q1RGVqd2pVWGt5SERVWDhq?=
 =?utf-8?B?NGVLeVE5ck9kb3JwbzJuVWhvVlpuemkxMGZUS01uQU1NQ0hKRlI3QklySlVL?=
 =?utf-8?B?aDc3azQ5ckJJMlM4bFpsTnVLUW1KQ0JXVEwrWHBKc2VWS0cvZE9OdXh1SUZE?=
 =?utf-8?B?Qkg1M1dRbzMzKzVjNGNYMmJqOUFxaHRuYzhSNGZnYnVLZkd4MHFidmVLZlVX?=
 =?utf-8?B?TWRZaS9FY0lPYkN1SExxWUVlbGV5Q2VLQmZqN0FsTnJ5T3RuUU9FY2l5ajNi?=
 =?utf-8?B?eWNuLytUUkVmdjVQMmVIUVJZV2NpdU9wOUkwTGxETERpNGxtNDRVY3VVeGs2?=
 =?utf-8?B?ajZQclJ4OXFMdDFvblcxcmZiTldIaDNCTWdNaENPcnR4dlRHblp5Qmw2V2Vi?=
 =?utf-8?B?TWI3b1IwYW90akRYT29iWkhMOWJ0eXNHT2FMSVcxcWE1OWx4VzlDTFFOLzBp?=
 =?utf-8?B?L3RCSCs5ZE52TGZ0QldBdHlPaFppRjdZU2s5WmQ0dHJiZ0lZVlM0cTk3VS9C?=
 =?utf-8?B?M1UvTlc2eUVObmNTNHh0TllRWG5LMGlzQWt4bG4wSnhqaDJaS2drZmFlYXE2?=
 =?utf-8?B?bk9NMzVEc2VFWUhXb0FwejdqWjdJeHBLdHV3TEh3bW55MXFPVUw0TEd1cUxO?=
 =?utf-8?B?cSsvUHVVQjQyOEtQYW5CSDlsODNEeFcwMHdUQ2YvZ0pGcnJNV2NlTEZmdGQ2?=
 =?utf-8?B?cE5rMzBJbjVVQXhYb29iZ2ovYlNyMVBWYUEvc0RiY1N3U243bkNmVFhOSEhS?=
 =?utf-8?B?dDBoL2Fsck9JZTgxbk9VYnFPeUU5MGdjM1VSSit2amN3TlBvdERCQ3VPTkdh?=
 =?utf-8?B?cEI4QkU0dkQ2bmc5OGZKa3NzYkwwVHorbGxwZEJxc1E3dkhVeVhiVFMyZEMr?=
 =?utf-8?B?UzVvQmd1VXVYaTdFTW9VNG5MZUdFZGMvMldQNTNaOGNEMXpWYlRLT3NCOEh6?=
 =?utf-8?B?OFpYd2hWVng5cHk3NG9kUTRzTkxuOHBjTnVzUVg3TDlFaTkybUQwSDVZbG02?=
 =?utf-8?B?YUdTOWJMWTdETUI0TTlIN1ZQTW10c3ZtU0haTER0OFBCR1IveFZ2NE0zVzl4?=
 =?utf-8?B?ZUEyS2pvZ05qeXNqamlnUU9mdVR5THBhNDh6SFZHQWdnaldVci9ydlp1K2lk?=
 =?utf-8?B?dXZYV2JhMHRQd1RJejFEUmxoTUEyeTQxVXhPT2xCNjNxSHJRWlN6a0NqRGRV?=
 =?utf-8?B?ZWJTTGlPWUE1amtnZjV0dFM1SUlBSDkzWDdiUHdMSEJlT1lpU0c4bXI4OGN3?=
 =?utf-8?B?aGtUVEVQWE1lZXdMVzQzaml2RjNVejFESjdUWGU5NThZY0NhU3ZPYWJMK1cz?=
 =?utf-8?B?bDU3VmRJVDA4L3BkUG94bE5ldWVPSXpUNGFkMHJtdFBFZUV5MU5vSi9PdlZX?=
 =?utf-8?B?b3dwbGJjaTJrbDZOUmJYMVYrQWhOMzR3TTJZQnFCZ0NPMW5wRWU0b0lpV3NX?=
 =?utf-8?B?UW5ybHk1NVJqWURjVElxblk0YjhhcFptcjA1alBrQmM0a3pKK1grU25wTXhW?=
 =?utf-8?B?QURvRjRweE0vWThPeWVGQkt1WjdiSi81UmtVSXQzWHlIZmtjTHFEbGhBeVc2?=
 =?utf-8?B?Slc1V2NtYjZXejRPL2JyRW9YTE9ZcmVRS3ZiVlBtRWQ4MDk4NGMxQlFDV25Z?=
 =?utf-8?B?MEM0cVVXSlgrdW42a1pKWGNldTNmMVBRNlliWkt1VjZkMGxvOCtmS1NtYzl5?=
 =?utf-8?B?YUcvUGxHbGQ3dkYrQWVrYkhaenI2VmJweUZBcHJ0T0tuNG9sRDNFcGpIVGdR?=
 =?utf-8?B?clVLQ3g3OWgxV2oyQUphdE5semlha0p1TXVCcHhGSHc4UUpxT2N3SDRvUGp1?=
 =?utf-8?B?NCtqazc5YWdibG1YWUVUMjJ1UUVQMnpESXVtS2VBaTMzZnpCS2NERDRMNjJy?=
 =?utf-8?B?R1JBZGNvcnhjMktsWDdwSU1wVmc3S0d4UC9uUkw1OFZYZDhkZVNIaDdENWNU?=
 =?utf-8?B?NjJvZFNBWFRWQUZpdlF2a2FEOUtIMjNDVnY2dmprN0dtdXZDQXh6ZS8zWFdj?=
 =?utf-8?B?R2hBcHZITVhBRDY1b1BYQW91L3hNVDRnZFhLbzA0cFJkdWVaU1FxdEVES3JE?=
 =?utf-8?B?bzBpMlN5eXF4RHIyWW9sZW1vN3JJL2lTUnN3R2lOR2ZxK3hIKzJkVHdueTI3?=
 =?utf-8?Q?BZchQfiVarBJjgJa7NaXHkb1be3XYr3LOQOcP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a121d6d7-e42d-40bc-eef6-08dede4f3e97
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 06:48:27.0551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrVFj5q08mI8ckJN7TiRL4OSBOSZOomvX/5uH8XEXWZBPlVaWBUsr9WyN7KOUMtv54Oh8TXTunkOglz15Vrm+R1XWc1a6eaYXAATjH+F+7chLEylQDajbgezRNQ/uJcT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8627

On Wed, Jul 08, 2026 at 03:23:50PM -0700, RD Babiera wrote:
> On Tue, Jun 30, 2026 at 2:45 AM Xu Yang <xu.yang_2@oss.nxp.com> wrote:
> 
> Thanks for the feedback Xu, and apologies for the small delay here.
> 
> > Can we utilize FOREACH_VDM_DISCOVERY() just like tcpm_state does?
> > Then you don't need to write them again.
> 
> Makes sense, will add to next version.
> 
> > >
> > > +
> >
> > You add a blank line here.
> 
> Thanks for the catch here.
> 
> > I see a loop: SRC_VDM_IDENTITY_REQUEST -> SRC_SEND_CAPABILITIES -> SRC_VDM_IDENTITY_REQUEST.
> > The tcpm should go to SRC_VDM_IDENTITY_REQUEST state only once here, right?
> 
> Interweaving SRC_VDM_IDENTITY_REQUEST between retries of
> SRC_SEND_CAPABILITIES was intentional
> when SRC_VDM_IDENTITY_REQUEST was implemented for SOP' in order to
> pass USBDP Compliance Test
> timing requirements. This is consistent with the current
> implementation, do correct me if you're experiencing
> otherwise though.

OK, understand. I just realized that I connected a Type-C device which
report Ra but can't response SOP' message. Thus I got above log.
Then I have no other questions.

Thanks,
Xu Yang
