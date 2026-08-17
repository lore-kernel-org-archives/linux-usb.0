Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CA41397;
	Mon, 17 Aug 2026 00:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786925604; cv=fail; b=fF16V0Q6dwFOLFm8xOK1URooTPki6xYj2HH3zHRPqnZ4aEUDNxxNTIk1mWkSYSHcc8eVrfCH0u902AFKNrIzXdTrZpDqLvLaBi21FxtAchLx6wzjEtmhVLa4zIyvIkdBEVk1X1yyLt2ii02BqYzEQRTyJwekMYsq50nuZr/qCPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786925604; c=relaxed/simple;
	bh=rfNkR9YuI6+MV/QTMVjPJ5I2HCRJNRTZPTBWdEN9BR4=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=G1RDFz/H/4AResU7BpDEk4RXkdy4oyPXSrzR3ZMCVrCAZrpe6RAC53uv+54BP8s9ilh/mZf/45cMTpJdN/d1poZ4m9Sh66Ga69pX70j+tcF13Lp4xPjveLGMPFBawhJnM4pk7zMvjnq6oMfAVLa0xSDVb7s727J4LJvvJZoEA/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KKpptt4M; arc=fail smtp.client-ip=40.107.208.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KKpptt4M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxyyllItcovXq3kSs9pO2ZaVziuT0xbj8whUfAQeWZZrLdf0UVeCOwyeqbkWItlbin+S74QTe3bV5BDXEEKuA+uT9QZ22cQOatWsPMdmP9msMggifgJROYrLZ2E0C66Lf9o5VZx+t5hgTzshHoUKKR7NPHk5eOBBbfEqyne64asEq390X9Bu0tUp1fUoTY8XcHebLxqMZnj58p25+fY5DUMeNw6zlfrbJnQUpc539IZNX8iJ4OZxh0T+6IjxY/qIKdqWQej0PxWtfPoC98z8gytPuPwRmBZAbc7Ryz/FeEetMEqfNEqWnON5mAdFMZd1C/JD87SCITV10FeIt46LjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdUb6gOlSaKJj/831cZlJZh1qvGa8AmLhwj4mv1PRZo=;
 b=BwZhr6/Ny1OeUxPdnJSbMdIxE02+GsV9VdpsMjAhr/Ah8Oi+r9kz5q+t+3kRXyuaCAw8ABc0UXvlf3lntKPjZxm2aC2Fubdoiw3oYqiSqy03nzsMnwyS3CODTS4p1D5DnXvcMF/r0uztPMNBELIvHp83QQvpDkm/34LJS1eD0nzsS2Yau/i4uXQUGQSKUUDhlwR4mGxJHFWCKi+1o/k5Sfwxqo6xC6R4jLjhUz/su4qS3h9FkU2ptKrOHluzulNYTADfKih1Sg6GGIB1AqoTC8gjw99SzyUQ/qjpz0CQC5SwqHQlRuaetVzz1Gpb0LDgOT+J8jOtux1PDuP4LDnMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdUb6gOlSaKJj/831cZlJZh1qvGa8AmLhwj4mv1PRZo=;
 b=KKpptt4Mz8dMURAV8MbjJiCS4HGwErZ5vAiWc9Tgx0TZI0KoTcWKbbWSURSxo6kdeLFqP6bE76E52ePhKHCzaLZG2mLbB9av3HPZ/Ys1c6JMGjNpUBOUQp8nAAoNo7dMoJA4k7G+pZBrDeKUPguA+fVWjFLKtmQ2vvlchY+YKt/wIWaSBQ7AXrTBBgMyvKPBB1vEHZG/FbmXqrSHFGBJ6vLXpqns9UzSYCEXxuEHevjE75sVaKRNmNa6yXag8HGgjcn7KbGhQyA81lUTJO2q6DBZ/5xm3tAhkrkJFKkfcmJ//kE5/WncsWPTj9g1K1WXC3PZyC1BpN0YK0r4y5ioGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DSWPR12MB999152.namprd12.prod.outlook.com (2603:10b6:8:36e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 00:13:18 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 00:13:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 16 Aug 2026 20:13:16 -0400
Message-Id: <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "syzbot"
 <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
 <apopple@nvidia.com>, <byungchul@sk.com>, <david@kernel.org>,
 <gourry@gourry.net>, <joshua.hahnjy@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <matthew.brost@intel.com>, <rakie.kim@sk.com>,
 <syzkaller-bugs@googlegroups.com>, <ying.huang@linux.alibaba.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
To: "Alan Stern" <stern@rowland.harvard.edu>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.21.0
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
 <DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>
 <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
In-Reply-To: <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
X-ClientProxiedBy: YQZPR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::21) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DSWPR12MB999152:EE_
X-MS-Office365-Filtering-Correlation-Id: 4187f894-e14b-4a65-15c1-08defbf456dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|6133799003|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xfU3R7ejGoSWYqCpSjaH11JHsfTMYu8JFKXnQbXOb6W35pMKpE3C4JnbLFq10xSOp43cmcjEPYDZq2rQ9SdS70crnTxR+ibvxzpHKpx4H7Vn8+fJVEn/M6BUqUHtx922hsuEr7+ZxAvaxQLfayh7TnAh/jF91YNqXy9Obk+e8TQe8PbV7Du4vGihA76xpszdwSYd0V6fYLmYF8EBYVFg29nlefpoe39aabGSBSEw0stPfdSLKzOc7TO+4FSYTDMgPptWalFCvjI2r5h6N5qGVVbtM9tT86EYeIg6rOglRclfjR9xvpyReU6ES55dOyCDfqdwI82RXFGKUGnmsWOJKgisoAR4+rN1w0Y0i5qDfXdP1g8gQ7k+cm6N+9Ig1a+Oo5/fgECtD4Qdyqyyw0qJGWOWHf8+0CbspRAaePa8e7xD0loFbYpsRZl+NRhR4+VtyR8efav8OIXmsWR8tGxfx9r6cJEji5mnrCvcNl3XslNzc+EalWKA+EKPwXSzP1USh6BFrM+iGhcsV9hJVh0khejydeUamKD98XJD9+fcxWDvFQHCLJK1zfV4eJeGjf6DnKJwi/ifBuxOsoi37t6y2G346WiFZwZUKrhVUHZXk8EZBhse5HkjB9xQTgVNM4YxbDEsHjO+Z8d4t8UrEiXflrZl0F8U/dfoolVJrDsWFDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3ZNcnlBQmx6SllObmVDdEpxWnIyTjNZSXBVbEx5cks4eTJlSnBvenVOQ0Ew?=
 =?utf-8?B?bzBURDhSbG5IdkJKSlFlMTdnaU1EWkVaMWJ4MHgvdklJL0VhUzBhVUtQQU40?=
 =?utf-8?B?NmhpakFQQnRnZjhPQkJUUTlCd0tnMEhIejlsZ2FSSThsWU1LYmhnRDRFajdv?=
 =?utf-8?B?OUNjWTlSemdjL09QTzdWblVaU1pGelorN3duSjh0N1FkTno0TVhwMzNId2xB?=
 =?utf-8?B?bjY0UmZXYzArdmU4dElIQ3BkOTU1akx3d0llTXRGM1BjUGtUVnRHRHJLdktH?=
 =?utf-8?B?c1BreDNqem5tU1VGMy9YMUl5M0dMYkR6emNza1hvMDZDN09TUTZGS2ZMOXJp?=
 =?utf-8?B?WGhINWZUV1lyMndiZFd2MkdqbzVaVi9RbEI3VDJ6bEhrTDQ3OUdxL0RZR3Av?=
 =?utf-8?B?MGRQZmpXMkE0cGVNM0hRcDkvNWs3emp1anc3ZVI1ZlgvNUwrQk42ZERUZ2pM?=
 =?utf-8?B?ajhXQVF4NEVRL080czBId2JFTmhnOEs2bnVBSXdhYXhmOTNNK0JGYWgzbWJh?=
 =?utf-8?B?M0V4WnVMRnZMOVpZUGR6RitxNnlhd01YR2lRL2xIdGlLditWSW1HdlR1NmFX?=
 =?utf-8?B?WDVSbFNLSnFYQkRGeUFtVlB6aUhMNEdUUGQ3dlBWVDUyQ2ExYmZ4eXhlT2U3?=
 =?utf-8?B?VjJIOVFxMHVDbHlqS25ENlZlV1pzbzRwbnNTTGFGUklqNjRQVUhWcnFhSnNa?=
 =?utf-8?B?NkVWNk1DVHY5U2ZxYUVHSFZBM1pFWGNnbSttZXYrZmN6Y09hQ2Y4bmZNcmlU?=
 =?utf-8?B?TmlyVG5WbmNnNGFkSUZaUlo0SldsTHVpOFhJalV1VHphZ0o2UWtvMERoLzVG?=
 =?utf-8?B?bWhpVTh4TU1JNWdMSWlHd2l4RzhQb0ozaWVWNW44VjRzWkNhYlhUMm1wK0w1?=
 =?utf-8?B?R3VCSzM5dUJBYmI2WFlYY3lnY2MxQ2xSRHRyMUpDVkZXbnZOcytOKzErYlhl?=
 =?utf-8?B?Nk1mMmErL3VBK2ZscnI1NkZENmZpbXZCZTZtbmx3OVpuTmpvTzVxL0RrWk9C?=
 =?utf-8?B?cWc3ZmxVUEZpaXBPYlNvbVVGbDVVZ3RXQUYrOVlHNGhHY0JJelVCUm1vYmhk?=
 =?utf-8?B?RXRQdlZJU2daNTBySlZCREFCK3JVTGFHWmcvaVYvaUg3N0xNbEUvM2FTMG5n?=
 =?utf-8?B?OVRuV0lZMERQSHNLZkc3TUYyM082QkR5b3dwTnhWOWp4L204KzJpOFJVVng4?=
 =?utf-8?B?R0d1aTkxS3FWS3k1MUozRWgzVnBBc3ZOQ296S01Rc0llK043bFdWMCtFR3pJ?=
 =?utf-8?B?WUxaTDZxTGV6MnZ0eGhnTXpmNkN3MGJlWGJSTyt4U29Kb1pxWWNEREJkRDE3?=
 =?utf-8?B?NmJ2TlRoR010ZUtONTFjWGFCZ0lKRGl2YjNwWE40UWo1MHVwUlNra1pwMFlT?=
 =?utf-8?B?S3E5MExTUlowWktETFRXZkhMc1pmL2w4YUp3Zk9oRlNHbHJoaFhzZEp3RTEw?=
 =?utf-8?B?RWp2TzBUb0xOaWxYNk1ydWR4aDV0VGRMY0NWSlkwVW5URjRod2FJS2JhTkZt?=
 =?utf-8?B?MGVFYy8vRGVTMHh0MmExaXJHZ0lRQW1EY2phSU05YkxkSUk3S1NLTnBWOGFT?=
 =?utf-8?B?Ymc4MzczZzA2SFBJZzlUT2wzR2dvUWs2OHQrd2k0cUh1bVc1dzVGTG1wQnND?=
 =?utf-8?B?djAwL1lPSUN3OWtyS2E5ekZkK0p1L1V3RW9BWTQyVWJPRzdMenNwTzFyQ3Rw?=
 =?utf-8?B?NGtMcVd0dTJLQ3NlOGRaYU52eEVCRU5wVUVhRG9nQ0xpM0FBc0o1NDRnY21p?=
 =?utf-8?B?cmlhbUE2SVF5VXRyK0djS1d4QkFQeVdmSGpubVJZYjhXakNXQXRuZE90WERB?=
 =?utf-8?B?RDdoTVVNbXJkNVdDbytuR0xaQ1NwZmMvL01HL3YvQ2lZU0RpT1FPbzdzS1Rn?=
 =?utf-8?B?QVIrdXdMZGNWQWplOEFtalE1dktxRlJ0cWovdmVpVUJqajZ3a3I2VGlZZkUz?=
 =?utf-8?B?VjQ1OG9tRHNXTVdwK0djbTkwaXRsblpBa3AySTZ2dE5iOFdsNVUra2oxUSs3?=
 =?utf-8?B?ejNlVVE1WXlaUjRybFNqVC9BQ29rRG1jWHhMNloySXNyL3BNS0hISnMwaitj?=
 =?utf-8?B?aHhDbkMvcGF5RmdMZEdRTDVCZ2g5dkR1Wllnc2FWMUdOWXQ1UjNVM2c0WUx5?=
 =?utf-8?B?VWk1MzhiVkpJMFg3WVJ3SGlOdGM3dnFqeWd5V2ZwQjR5UmUyaklZdlNJY0ZL?=
 =?utf-8?B?R2cybXdVUFJxL1E4RldiTGdrNElTbTc5OFhjT2tUMXBFRFkrbU5GQk96WHBQ?=
 =?utf-8?B?a25hZFVob1J1UGlNNDlkTFY3TzFWSWR1Vks0eVZVanFUZ0l3cEd3NjZ0a01l?=
 =?utf-8?Q?yNbo1zvOQne829jFrf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4187f894-e14b-4a65-15c1-08defbf456dd
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 00:13:18.2428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcwO7aTkrQpMzdFPgoZ++1/rr+SvgV4M09+7cha0aIEH6bPqqG++MkT6p4iujVHI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999152

On Sun Aug 16, 2026 at 7:32 PM EDT, Alan Stern wrote:
> On Sun, Aug 16, 2026 at 05:47:34PM -0400, Zi Yan wrote:
>> On Sun Aug 16, 2026 at 4:52 PM EDT, Andrew Morton wrote:
>> > On Sun, 16 Aug 2026 12:25:48 -0700 syzbot <syzbot+805630f1453e490427fa=
@syzkaller.appspotmail.com> wrote:
>> >
>> >> Hello,
>> >>=20
>> >> syzbot found the following issue on:
>> >>=20
>> >> HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.kern=
el.or..
>> >> git tree:       upstream
>> >> console output: https://syzkaller.appspot.com/x/log.txt?x=3D159274795=
80000
>> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da59830cba=
91a1981
>> >> dashboard link: https://syzkaller.appspot.com/bug?extid=3D805630f1453=
e490427fa
>> >> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda=
6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
>> >>=20
>> >> Unfortunately, I don't have any reproducer for this issue yet.
>> >>=20
>> >> Downloadable assets:
>> >> disk image (non-bootable): https://storage.googleapis.com/syzbot-asse=
ts/d900f083ada3/non_bootable_disk-3d6d8176.raw.xz
>> >> vmlinux: https://storage.googleapis.com/syzbot-assets/d19e0514c02a/vm=
linux-3d6d8176.xz
>> >> kernel image: https://storage.googleapis.com/syzbot-assets/f6da706811=
f4/bzImage-3d6d8176.xz
>> >>=20
>> >> IMPORTANT: if you fix the issue, please add the following tag to the =
commit:
>> >> Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
>> >>=20
>> >> gadgetfs: bound to dummy_udc driver
>> >> ------------[ cut here ]------------
>> >> 1
>> >> WARNING: mm/page_alloc.c:5280 at __alloc_frozen_pages_noprof+0x2ce/0x=
380 mm/page_alloc.c:5280, CPU#0: syz.0.0/5319
>> >
>> > Thanks.  drivers/usb/gadget is the offender.
>> >
>> > Gemini sums it up well.  "ep_write_iter() needs a bounds check prior t=
o
>> > memory allocation".  https://share.gemini.google/5NzjyttO0ULc
>> >
>> > I expect an easy fix would be
>>=20
>> Maybe it is better to stop asking kmalloc for unreasonable len:
>>=20
>>=20
>> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/lega=
cy/inode.c
>> index d87a8ab515107..20905f254968f 100644
>> --- a/drivers/usb/gadget/legacy/inode.c
>> +++ b/drivers/usb/gadget/legacy/inode.c
>> @@ -645,6 +645,9 @@ ep_write_iter(struct kiocb *iocb, struct iov_iter *f=
rom)
>>  	ssize_t value;
>>  	char *buf;
>> =20
>> +	if (len > KMALLOC_MAX_SIZE)
>> +		return -EINVAL;
>
> Is there any reason to think that KMALLOC_MAX_SIZE is a good limit?  The=
=20
> allocation could still fail, and you'd still get a WARNing.

KMALLOC_MAX_SIZE uses MAX_PAGE_ORDER, anything bigger than that will be
rejected by page allocator. This warning comes out because of it. This
if solves the exact issue here.

>
> I prefer Andrew's first suggestion.  If the user asks the kernel to copy=
=20
> too much data, just fail -- with no warning.

__GFP_WARN gets rid of all other warnings, even if user asks for a
reasonable size. Why use such a big hammer?


--=20
Best Regards,
Yan, Zi

