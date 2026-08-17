Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011044.outbound.protection.outlook.com [52.101.57.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C831381EB9;
	Mon, 17 Aug 2026 18:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786992326; cv=fail; b=vCgYTrpNM8HS+plJKGDjyzOvv+yOZWeH9TlyqqjoBbKEPYbSHvgiool6Q/erw8AqGiQC8WD0J5MGj5FLedX3Jzefo7eIGVSMqKJSSnsUNJj3LEpjQkB5pcbOSlXDlHB7r2yNg1kG+RosIKPVf1rw0uP11tQ2KCfa7T2Qh+DOtyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786992326; c=relaxed/simple;
	bh=t2rBCIrUc2rrzSSjU74AW1Bvv02vGGEc3/jrKlXYvgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eS0tIkjlIe6Vdnmx34hRso0fQ4ZlsEO/4kBJ0EwMI0Lww0L+22M6mSgOWRLen/euiji/04sygXo+ZAOtXol49IthuipRmLUYOZv9N8zGJ/2/6KdlAo2TBltnYd8isqB48CyMBVrGG1YSQi+1DK1m09jS4clHmpcgObava/lJCLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JhPj5gRy; arc=fail smtp.client-ip=52.101.57.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JhPj5gRy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvA0d4YR24213WeD7jV0ad3O1qmqYiZhZvOYHAiSXyzOJnCKZSIlsLnvMH5zFarifyf96sxrhQqxmYqTNYbjKbRQXB2Hg74fNV4mLcGLGVSGFryd5XmPnSbC0SccUxWHGu9iApjp8JNj9odr5RZCkqMDK7ulPkiwZyhW+4iC4SNzD8akZXOI2FQ+pWl6+FmGaj8xN7/R2GM7MT7mAAImQgQun+LXcWx2a6N1JveTEBJ9WVWjwv9Gc3wTR+pXa6guUQErf61e99Ms43/AOJ0Hm+5aDJV1k/HiDRqDdS6EyPxOjoqKulay7od84dVsZziqrPu7Xxp2wKn1QRpK/UjUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSJZk0qPBkzQbH2Nx9UCLgsZ7a9CzSDfMBMTsirouaM=;
 b=ttG2Kl1cATUBUP0/bWqxIQcrup0gYue3Zg5xes8w/SOIOygJ5gV3xa0T+C2id23Tdrg3Mewcj61ikhgySd+jxyoR5sTq+mXWqAP+glvxgA6/eaSncNAQvv6hAjDbBY3hqpe2E2KDb7Jw9P07lYuckh66swkpWVnUnq3SJT0iCOKUHP+7AzTcntBqRN0+0/hS/B81KjBOsu0HuP+o31ImuIH0UREgovVsfJxNRnQ677+d4ip6kH9Yj7OC7zh/i7q0sEKSYgHIg9UYzVbB5Rjag1K1BMCZ7kthGfTmmCBx24JixfeafsIb7CdlPdVcrIjen+ov4MVfV5wIumSSpX8IEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSJZk0qPBkzQbH2Nx9UCLgsZ7a9CzSDfMBMTsirouaM=;
 b=JhPj5gRyazoDOS1i0TT1pJrHAKj7IX9NEw9/fUfoqHBx5NsHZElmQy2L24nvLH8BLJ2U7HxNSTJfoBVDiW2Mx7+5WZTwfFHEfDuIckMI7r8NXJCkaP3nRV51zEI1fYoxhGw7GDvR/qfc8XauZ2q/78PENILgWqXkEkkkZ2Gc/bQYhdyBSkc8SqIwf50yNRwNTZ0eMxWdAVW5QaJYmTbNM8eJL+A7jLdQfhJUcDjF52wBVXA2d32aWMYxFDfGwfbvwcUrAkuGHeXthDexBaDeb7rEYFGpLfPGraMgMxCPhJhszhnC2BWpwK28521FCZeIsijDiaGd0gvXd12gTwXbpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 18:45:21 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 18:45:21 +0000
From: Zi Yan <ziy@nvidia.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
 apopple@nvidia.com, byungchul@sk.com, david@kernel.org, gourry@gourry.net,
 joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 matthew.brost@intel.com, rakie.kim@sk.com, syzkaller-bugs@googlegroups.com,
 ying.huang@linux.alibaba.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Date: Mon, 17 Aug 2026 14:45:19 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <6FC11E12-9428-4975-B135-E24805C2D9BF@nvidia.com>
In-Reply-To: <2bf01548-723c-465d-8368-247a814f61eb@rowland.harvard.edu>
References: <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
 <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
 <9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
 <DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
 <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
 <472add4b-f16a-4b87-bbc3-98c8aa385cf5@rowland.harvard.edu>
 <EDCC14FA-F7D8-4F72-B780-37D09E26D16C@nvidia.com>
 <EECC6FB3-7559-4D22-B9DA-33E30E5EC181@nvidia.com>
 <7deabd9c-04d5-4a45-8b8a-39929c046152@rowland.harvard.edu>
 <A2BA0883-6B5D-4AB1-A7CF-6B9BDF27F439@nvidia.com>
 <2bf01548-723c-465d-8368-247a814f61eb@rowland.harvard.edu>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: MN0PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:208:52d::9) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: eec2ef35-8434-4b3e-49c3-08defc8fb0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XmNbC7lMvUvCsywmGMrWG3oD1zokZHNVFxtvR1KlVH7HAgrrWwe7Arhv0KIcqd8Ylb9f5qqIU8/PyLQ2uMKHfHQ/tPAuc+NdCENerraZEGYvZ2MK9BTd+qzAEIUkpTbV3spLqnUpsFJeTQL2s/NPDip3ELdFuvtMz1g49qCLXVkHRwTM5e+y7czyl8Xt0VRXSbEhjVydE/dY1Zz+710X5pdZbo2FeBqUa+ieh/eBf8gWJY9XM6pNak8+nwAMwgo4Bl9ziCRJYeHE0mx2G3Uqe/cgUJozk4mP4WQzrJ/SQP6FsjCaiP787ARyKLL2R9MfEwQW76l2D72QrifjBXjXP69G2UxfUjDt8WnyIZ7ArrgR7BYcODi/SghVEyOdlfJc22kpjptgW9k+1rAOrnwswoX9MLqaI3KN1afDPn6zVRIEwH/+eAa0U8tFNaHHvyWckzMvcvBbtDiDWijDqFljHlhqstHBxdkamC/rJ7kx4jERcQ6SvGnIf02I8POj00wykDMXRpeNASbHrPRRRE3qIBS459XUHx0H/6xoqQPqZ7lto8ogw95JbeKY8SzJoRUVNWte6ruQk/IFI5GZXVQ5GuqG2HnYas0PSqB48cbNs83jt0U7qS8617o9CdU3RaVYDNN0RFF3rWac4fKhgQ0xTOBHRWrKHdFmv+WADHulqY8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v/6hvJFrV6TUub27uC5RkoIKlT15snVPWtegKouxg7InMuBStd2LmgMpXH31?=
 =?us-ascii?Q?D+V1DcvfRDSpdcAa7ShUwxQzBX1vm3oL0QRfSEsG/WP2pXaWWDE7Vh1yJXI+?=
 =?us-ascii?Q?Ki8gxo6rgSVp1bJMvPaMQCiGxdnkG2wTZ9eTMryWCRgbyGh/rk286AZEf0yc?=
 =?us-ascii?Q?zKgZ7dGoZRbesAed7lQX7JF8SGnPVEd5li7lqC8pbd8ZEPALWGdj0zF75Abp?=
 =?us-ascii?Q?pZmM0u/joscnAbMj3Gau5mAjFKS6lFLzu8dcwk5ojy1XuV96IYqwJBpFr7jT?=
 =?us-ascii?Q?wvuFW8jjo5w1olXywza6EQ0SRJSxcHscdLiPBkBSlofAZLGMDEqpfnz+3sMv?=
 =?us-ascii?Q?kJ8wle51lNmmb34xM6bur2vi4/mOz1866vd3xWB4nPivL542aMQgJ7hzYmnc?=
 =?us-ascii?Q?k9H3/L+Z7+KZdmzcWtIViYnZnxUOEP9PcZSHKD+3zhH2sInWW+XK4s6cR5lN?=
 =?us-ascii?Q?Jlpok9W//rud1qKofUjm4qMHlBd6M5mHGIvfZHlDwvuv0c2Cb3h54bCCy4qR?=
 =?us-ascii?Q?T1TIid3jlxsFqPtG8TrjX83mbAeQnWyz1siKN/0lulAuecPutJAQGnD8UmPP?=
 =?us-ascii?Q?7kURpgeuHwXGbI2Azb9+G8+TlO5mSX2yhsHpk649Z83dtmbu0tGO+wMegDvd?=
 =?us-ascii?Q?you8sxjk4Kp00ahlH9/J3Xh0uZ2b1SkrqGQXcWx+yYZFFjkchVuFVhcOvaQz?=
 =?us-ascii?Q?fOoN2kT/AxZrWWIxjgmMH2qMoVYuDTNloxLhbYIMgXGXSOoZ0stq6IUHFjNG?=
 =?us-ascii?Q?LUStDiO2Rnd1okfwkDdKzwD4XG2rTEFu2jDeqlDB3jMjmeA2D1QWl3oywCUH?=
 =?us-ascii?Q?YOmT8Hs7iipTj55UlPFdenB+/vPo3cZLQADwhAJ8CRuZQ427Tb2TGvznzILf?=
 =?us-ascii?Q?5yy9O5kE68qL9BvLfnVR9UVZ97E8R4jGdNVz0kPx+TX5hxqJAEJrvfpNsYN9?=
 =?us-ascii?Q?Wy68vGNJVYXM/RIzssE4rCxxAYnW0ag7B6AV9FVzD3J2wKzuVWcsrLN+Qrtu?=
 =?us-ascii?Q?BcLY299RL9qsnf2BAOqTAsN26a5y6j1+Dp/li0z9w4fWQL6K7ruIF4RHojYh?=
 =?us-ascii?Q?yuQFpkpUB+3/SWm14ZXfcz2qpgtpk+/WmY05Sfl+3+fBtceq0LNeqBnWrncB?=
 =?us-ascii?Q?OeoghOHKe+bsqLLE75AlTwodht4bwwHmnN0yI9MgFzvh5M3Ag0jgqD5L0E4F?=
 =?us-ascii?Q?QyMqHxRAe2mResjcthiKLNEaFxNOpkfYpCUWUWv0L1B0U7uJjAkgogs/6VoQ?=
 =?us-ascii?Q?rGl95U2mHe16x15mKfCg7GCA1IsScWd1WAfhKqpsSZOxZ8vQvbLYqtRNLB5S?=
 =?us-ascii?Q?X6YWmrNaL0NRAKv8aJCDjnVqrlRP1/VlxaMv9aKM4ES72Lbt+nLNgFERNgOC?=
 =?us-ascii?Q?Y+MRu+DiAmg9+OYL8sSIYL9W/BUzCj7ryp8bxrON8Wt6tf/o7v1DLrxSOIU4?=
 =?us-ascii?Q?lk0vH2CeTM9JNZRDsrIK45E1aMK48IItvoqj/4N45WrJqF6AMCswNZa0MyWC?=
 =?us-ascii?Q?lmpnH510o1w5k7mBKLQIbBySmzMTtEGzdl0YMRVQ7gmbwko1pIE6e55uxo8J?=
 =?us-ascii?Q?uCdt40TKo6MmNI8G+RjeYBeo4vIIttZscAtlrskNXInN4jcuZ8iPA+IboSQm?=
 =?us-ascii?Q?t/WWetNPPYSLFlMXiM6bLuStL3Grd7+yVuaiKhDJW1HZQezAYSexZRog9iYb?=
 =?us-ascii?Q?E07JCI6xm6WWzHcJmDHgR/ZVPr8H8WjW6GxZAIZ3LsVFPUuaBRiIB12R5n+e?=
 =?us-ascii?Q?uLTfSelX3A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec2ef35-8434-4b3e-49c3-08defc8fb0da
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 18:45:21.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7rVCNOWtdhVk67iSjivZBgnvNxI3KMLifwfmK6emUe6m9GTxyjkliVJfPsMK4/G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529

On 17 Aug 2026, at 11:37, Alan Stern wrote:

> On Mon, Aug 17, 2026 at 11:22:47AM -0400, Zi Yan wrote:
>>> Again, I disagree with some of the details of this argument in this
>>> context.  For instance, if all kernel developers are supposed to know=

>>> that they shouldn't ask kmalloc() for more than MAX_PAGE_ORDER at the=

>>> risk of provoking a WARN, if this is such an important restriction, t=
hen
>>> shouldn't this requirement be mentioned in the kerneldoc for kmalloc(=
)?
>>
>>
>> kmalloc is the normal method of allocating memory
>> for objects smaller than page size in the kernel.
>
> This means when you are allocating small objects, kmalloc is the normal=

> way to do it.  It says nothing about what you should do when allocating=

> large objects.

alloc_pages() or vmalloc or kvmalloc(). kmalloc() is used if you really
want physically contiguous memory.

>
> In particular, it doesn't say that if you ask kmalloc for more than 4 M=
B
> of memory, your system is likely to crash.

Crash because panic_on_warn is set. You just conflate a sysctl config wit=
h
a WARN. I understand panic_on_warn is set by many systems, but that does =
not
mean every system crashes.

Plus, if you use kvmalloc with a really large size, you also can get
a WARN[1][2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/mm/slub.c?h=3Dv7.2#n6912
[2] https://lore.kernel.org/all/CAHk-=3DwiRq+_jd_O1gz3J6-ANtXMY7iLpi8XFUc=
mtB3rBixvUXQ@mail.gmail.com/

>
>> See https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/include/linux/slab.h?h=3Dv7.2#n1001
>>
>> In this case, kmalloc is used to request > 4MB memory.
>>
>>>
>>> Regardless, if it is important to let kernel developers know that the=
ir
>>> code is doing something wrong, why not make the WARN conditional on
>>> CONFIG_EXPERT or something similar?  In other words, prevent it from
>>> crashing production systems.
>
> You didn't respond to this.

I do not get your argument here. Why does this WARN need to be conditiona=
l
on CONFIG_EXPERT? What makes it special? Or you mean you want all WARNs
to be conditional CONFIG_EXPERT?

Anyway, if you do not want to check user input len and want core MM to
do the check. I will send a patch to make kmalloc return NULL when
the requested len is bigger than KMALLOC_MAX_SIZE without giving a warnin=
g,
based on my discussion with Vlastimil on IRC (he is out until next week).=



Best Regards,
Yan, Zi
