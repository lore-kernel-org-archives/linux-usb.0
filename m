Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013022.outbound.protection.outlook.com [40.93.196.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042C13A7F68;
	Mon, 17 Aug 2026 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995925; cv=fail; b=cQXDe/4xUm76miSuD4GfYLGT/Z/dHthWZDCsOLedF3msJLJzPLEaP9WIPXDTy4lU0MyRT9vIkg1CMFTKWUdVjpS06JbqJFECfL9CdTKynHWSCRK7d7cNTW5gVQlq8uzRTEjt7gGrfMmZjgg/QUg5zBe6McBejlNM4nmQ4vx/t3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995925; c=relaxed/simple;
	bh=yC0DHTou0H+/WmlMwyDDJ+qJ5/UgU1e/j1O1dVKeejw=;
	h=Content-Type:Date:Message-Id:From:Subject:To:References:
	 In-Reply-To:MIME-Version; b=X17Fq28Muz+L5WVIxbx1w2A6SsL4crV9zXPIbMoQQh/6nYfgDS/y5IXCSdryGuQnD3SRDnjm/wvy/sTBKLAUbuTUwrYKtppXcxUo5lh9X887Le1R3+uTfhPpflYSv0BalMFdxrV5PAIVHPWi+tmTmYHC6O6WMRn5FwZsDTo6ugQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TBPp2X4U; arc=fail smtp.client-ip=40.93.196.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TBPp2X4U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRSwsJfR99BeMkD/1mkZCdKiVCD+3lZksvFmrQu3oVgmixvk5WhZCxersEP0PwqIgI5ycnCu58yjjMgB0Y+pmbUqPReuqcPi6IGqVMWZFtQps3+IVRq990EWohEC9bhyU8uYKyvKBhHaehT27PwCudisBbpZZKQMIN8p+1B9i3MqdkbpvGrQ95fJgipK1qwiTJB2e43Xj8LvHi4K6FeyAw14KtnI5nBpFDbADTGk1u/XaQ9lpGfFLK1unblmufWron+R33NhYhP+adWoqkXq+q2jXCP/W3iZmk+FeawBOiIqeumfaVrSTlhz0KfTx3B78cv2BQidcyOZSWQz6IcXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAIbh2tDAat7WrE4HrvgGFQxLZQazzTT818q269w/RA=;
 b=oNHPxlaJk+yKD5QogXS1h8J1tgKb3OcPlQhDDBvv3FjhCMY5l771kgAs6ihcCi116WvtYfwZtoEViiCA7dfOaTiZbB8esZOTmdpbOZuI5t6p+3YCki28CFlulepVrSich1ZXbeumw6p3n++U9rCoY0+GvmjkovID+tAJjLlwiBewI1fkFsatY0HuKmhphOX7iY8vDQJyEJtIlbStb9aUnTqid2nIi/RUIN2w+4+siWdeVXhPcvnXG1H4HaR0VG5DZrkYPpy9CBSS0uqyDJq7FqapAkE8WN2JLF/vH6K2YrEMquw3XqcVPdoZhWRS8IYVAQM9CjZsxx5LkKE+aNThXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAIbh2tDAat7WrE4HrvgGFQxLZQazzTT818q269w/RA=;
 b=TBPp2X4UGD/JUsSDRZkYOCVpSh8hgfNv7fooVkGGYvnlgdKUFsVe52uZJCccnaUN/RcBwOtQ6mIbS7dSLfN61Kv+r/Oba6lcegNK+hsiHz9KJNSYrTh5QLWBVPv4iJ59zg8zggBCMrPgRg/YNvullVvoSS3iKvMiL55l+wDLgNrQgU8KihPGTLZCLNg2qSaeoGAgT8VJicEQK+N4x4ghWY9wbWpBul21JpamhOdnMCCjvU5Q2Dcs1mVy6Of32xmNdAFuBAAsKDnrUMI67SWot4CM1ZC1okQBFMWGipYjcDvt3ikc8OAVS02siaqT8ZhvBe44AFQezw6PhNXtlfoKpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB9344.namprd12.prod.outlook.com (2603:10b6:610:1c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 19:45:17 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 19:45:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 15:45:15 -0400
Message-Id: <DKRH6MEVABEQ.28CPBZM86HRGF@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
To: "syzbot" <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
 <akpm@linux-foundation.org>, <apopple@nvidia.com>, <byungchul@sk.com>,
 <david@kernel.org>, <gourry@gourry.net>, <gregkh@linuxfoundation.org>,
 <joshua.hahnjy@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-usb@vger.kernel.org>,
 <matthew.brost@intel.com>, <rakie.kim@sk.com>, <stern@rowland.harvard.edu>,
 <syzkaller-bugs@googlegroups.com>, <ying.huang@linux.alibaba.com>
X-Mailer: aerc 0.21.0
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <6a82d0f7.dbb3a75c.20434b.004d.GAE@google.com>
In-Reply-To: <6a82d0f7.dbb3a75c.20434b.004d.GAE@google.com>
X-ClientProxiedBy: YQBP288CA0024.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::28) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c62277-096d-498c-9787-08defc98102a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|10067099003|56012099006|11063799006|4143699003|3023799007|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	T7XLHRrD4egL4SxMljeR+G6oeh7Zks2b2nhmep8Qv0K1LTutO/Czzsno6UVJXVm6PZsGFUpoWJSmrtgsjfW05EB//8rryeNbrFGwZLdXjpvEFJwGg2L7qucdIiNLE4mulyqiv3mFEyKUFnHLhqjN7/e0uWEdJ9smDi+I3W5UboGnVJbmqRWp0mgpGMRiLy/78nmnwuYYvVsxKzMezaNhMfTb2BJQnhVjCGR1qqhiLN+1aXZPcp5iUs7AbLdB06DUcD7FS/S/fPFRpWjVZ5cSXhWBdYij48kuZ9SiGmkdu53JhqJrBD/fTSx/scNpojK+hQl3PxPY3RVe8hP8xFKOOLUl6UdXO7BPPxrBl0QmMDXDGBmXhosKX8MoCfH5Woatms7t5EeLkfOFskHYaOOnPMxh3707nLhevpohurAAU34Rg1gMNf9O7Z52k/17etxzC34q++eIMvpSn+a/sfDQCjmGV+IN0oogkIrHOQqoVntUD0oQfUg7CzmYbE0teL3AJagGBZy2zyVUWITxgnvb9VI5JhcnCJqpLrox43ksUOoFc4v70qDJcYbCb/8k3IFeD2rhnvqEjtPQz65gy5ptXqO4JhWI8op2mMpt99TDiMhuhw+NH4elVfAKDumeRuLrGYEbiB2uaptqQzDYtKeAWlVm5OAVyxeUc5Gr0l3jbu+EhZkfbXeHWjKS7lZcTvgVDVPGdU8OvnErsA00vY7n7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEdRaHVQUXpaZFFjeEdsUVczYXpuZjh3aldCNU1nNFk2UmhUZjRxbERrM3Rt?=
 =?utf-8?B?TS80MExFekthRGRuSjBWU245ZE9rZzVTb3lVdGpBOGtlWnpubXg1VHZXNTVF?=
 =?utf-8?B?eGIvRDJrRmxtTHVJMlIwWFN3VXBKU3U3UjB4bWtQaUtHcHhtazRuenFCTlQ5?=
 =?utf-8?B?S29nNnJMRGd2L0FDYVpmUEJUWWIvaHBvcmJ4V1ZCcGZlRUExZWlyT0U4aGFi?=
 =?utf-8?B?dGs1QmxZdHhQKyt6YldPZTRoRkwzckhUdjJBQW1vZWd4S0dtS21ydjZTajBM?=
 =?utf-8?B?Rk94TnVvWXEvM3BKSWZXb1M0YnJYLzZYdlliM3NVamZoM1M2M2NJbTNMbkg3?=
 =?utf-8?B?WGtRVFhFdXI3UEx4MDVLN284MjRCWnRONi9lWkE0NjZUSFl5clkzRElrRFdX?=
 =?utf-8?B?TXE0SDVsd2IwSjFLRTkyTDE0ZE4wOVBrR0k3UEN2UHFqRlpxMmRaM1EwQlRN?=
 =?utf-8?B?RmQza2VVeUhacWV2NjZpcjFEeWd0R3FjRFdMWFRyb2pxL0l5SFhjQWhmd0lv?=
 =?utf-8?B?UURWQmpUTVlQaDNWcVFzT25iL25zazRNTFpIdU5wMm8rUzcwUmkrMEJlT08x?=
 =?utf-8?B?QU1UOHpkUDdFNUE2RlBuYnV0VVpweUpTVmRqbXcycVdta0M3OUI5V1daR1Fj?=
 =?utf-8?B?R3VmTjRIN3kyQjc5UUh5NXhQTVJkQ2NEckJ5WGh5UVpIMmsrOGFHYWJMbmZP?=
 =?utf-8?B?cUlwL3dJL2g3cEUwVmtYWGk3d0NjaXRDODY0aE15UjliQmVBTGJMbWRLZU8v?=
 =?utf-8?B?VTdOU0thMjAwSjRRWkRjTDFEbmlKbXpMUkpjOHlleEc1NUVhN2JLVnlBSW55?=
 =?utf-8?B?eTY3cUdVd0k0QngxUXU0TnVUbDR6dmhicW11NjJSSFFXYmF3Y3JWMWtKR2kr?=
 =?utf-8?B?cjNOUTB3dW51WDFuSDBWaDlVdXM4aVJ2NFA2NmxZOEw3dG1lSUw2TlVsa2Fh?=
 =?utf-8?B?K3RMV2dFWTUvSDZSVmVtazBZMXdWRkgzbG5YSlFWWFJBQ0VHa3R6WWVCR1pu?=
 =?utf-8?B?Szg2K3JWNW40b3BGeDRSWWQxdnhoeHBBZjRHdU94VDZIV0tsVEFkL2VlT3Fm?=
 =?utf-8?B?bjl2VnVjV3J5Q1VHeVc4aWcxU284OEZCVlZRdzEyT2ZBVzdGSWlPOUpFZTJH?=
 =?utf-8?B?NEF6TXBKTFlkWVFTT0NyQ1VJSVdEak0xdGh4Tklvdy9UNXdZUjVOMnRZd3Ex?=
 =?utf-8?B?dXJZcUpFN2hyZkdhclYwMUd5dUNkUG9lNjVkWDhCVTlaZzVrMTFsU000S2Rp?=
 =?utf-8?B?QkFFMVJab3hhSjBNaXZqTTVheUFQQkRqQk9OWUt6VTlKUFhTUndZY052cG5N?=
 =?utf-8?B?T1R6eUJTcHRzd25valUya0Z2OEg5RVoxdG8yeFZqUHhmeDVNd2JlUkZTQnZk?=
 =?utf-8?B?RVQ5VGpUeGtlRGdNOGhZQXRQMnlBeFNhMGtadExLYUFIK3hlT3diRXR1Zity?=
 =?utf-8?B?YlNhRjR5S1FiWU9aVVpLQmlzZmpKZGQzRVBPamxDb2ZsTmNPckVWUXh3a01s?=
 =?utf-8?B?Rm1DRUFDK1BQcEl1SkdVcTV6eThLdTdRZytsMEhJTHJZckJhellEZ2t5SVI4?=
 =?utf-8?B?QkMzdm55NDdoUloyTDRKQTZnZFpISjMwNHFobTVWV0lPTHBmMFc4bVozMHFp?=
 =?utf-8?B?L3IvbmlsK3VMRmQ2anlzZjN1eWFSSW5OQnNqY2phOEdHV3IrbXhRMGxPeGh3?=
 =?utf-8?B?QzdQT3FDaVowN3M1WVh6MURYVDI5MUo0U2FnRS8yTzd6YkFrRjZzQ05reWJS?=
 =?utf-8?B?NjNrMmRzME1OYW1qdk9iNjZkM0x6U0hCK2pMcUFrTHAzVmRrQnUzMXJYV2NX?=
 =?utf-8?B?NytmMGZtQnBXNWFsUXRoQW5NL3JDbkUreDNxc2hZaWx6K2VZY21XcTdPSTlq?=
 =?utf-8?B?UkJWTExheVcxZ0lDUGlFemY3cnpFbWZtd2s4WkxyQnNXbS9XSjhLRzIyVTRZ?=
 =?utf-8?B?UkxrRzFyZDdCcUFyckxkcW9haG5aamxRaTBmZktsblRCY0t2a3lZUVFyU1NG?=
 =?utf-8?B?aDBFb0xmdzh5YzF6Zy9BamxVK2k5OTErOHdqUGdzeDZUN2sxb2RoM21QalVx?=
 =?utf-8?B?TkVUUjF4WmVKUmNpd3U3RFJ5aGR0QVNVSUt2cGh5aEdGQ21HK3VVeWx0dXBJ?=
 =?utf-8?B?RHE1MndMU2JxeDE1RUlEYTBCUis2RElZNStDNitVelErMGNNam1GWm1PTzVL?=
 =?utf-8?B?MjVJSkhlU1VMM2p1U0V1M1Y1WW9LYnRTTEt2eVFDTzZpUU4xRjlGOW8zSlBQ?=
 =?utf-8?B?ZCtYUmJOWk5BWXd4SXF2b05ET2MvYjhzak53ZStNWTQyREQwYktiS0dVMGtM?=
 =?utf-8?Q?5PWaI+H9hK9RKcto8v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c62277-096d-498c-9787-08defc98102a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 19:45:17.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyoL9fm7qhqdpkoc5Yt4RC82fAHsnDAhWw7PR2a0uB617nXFU31E0exZKmwizury
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344

On Mon Aug 17, 2026 at 5:14 AM EDT, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    8d3ae59288f1 Linux 7.2
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D13bad94958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D1d67342c314f2=
28d
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D805630f1453e490=
427fa
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D=
ebian) 2.44
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1637ea2558000=
0
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
>
> gadgetfs: bound to dummy_udc driver
> ------------[ cut here ]------------
> 1
> WARNING: mm/page_alloc.c:5280 at __alloc_frozen_pages_noprof+0x2427/0x2dc=
0 mm/page_alloc.c:5280, CPU#2: syz-executor421/6034
> Modules linked in:
> CPU: 2 UID: 0 PID: 6034 Comm: syz-executor421 Not tainted syzkaller #0 PR=
EEMPT(full)=20
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2 04/01/2014
> RIP: 0010:__alloc_frozen_pages_noprof+0x2427/0x2dc0 mm/page_alloc.c:5280
> Code: e9 8d fb ff ff 31 d2 be 28 12 00 00 48 c7 c7 a0 74 01 8c e8 7b 95 6=
8 ff 2e 2e 2e 31 c0 e9 02 ed ff ff c6 05 85 90 bc 0e 01 90 <0f> 0b 90 e9 6f=
 df ff ff 48 c7 c7 80 be f3 8e 45 89 f7 44 8b 74 24
> RSP: 0018:ffffc900048c7810 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 1ffff92000918f1c RDI: 0000000000040cc0
> RBP: 0000000000000013 R08: 0000000000000005 R09: 0000000000000009
> R10: 0000000000000013 R11: 0000000000000000 R12: 0000000000040cc0
> R13: 1ffff92000918f5a R14: ffffffff9b95c444 R15: 0000000000000001
> FS:  00005555738a6400(0000) GS:ffff8880d5dde000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ffd5f5d6fe8 CR3: 0000000020943000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  alloc_pages_mpol+0x1fb/0x540 mm/mempolicy.c:2490
>  ___kmalloc_large_node+0xe5/0x120 mm/slub.c:5274
>  __kmalloc_large_node_noprof+0x1c/0x70 mm/slub.c:5305
>  __do_kmalloc_node mm/slub.c:5322 [inline]
>  __kmalloc_noprof+0x5a1/0x820 mm/slub.c:5359
>  _kmalloc_noprof include/linux/slab.h:992 [inline]
>  ep_write_iter+0x180/0xbc0 drivers/usb/gadget/legacy/inode.c:669
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x6ac/0x1050 fs/read_write.c:687
>  ksys_write+0x12a/0x250 fs/read_write.c:739
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f7cc18b5cb7
> Code: 48 89 fa 4c 89 df e8 98 1d 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 f=
c 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80=
 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
> RSP: 002b:00007ffd5f5d76e0 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> RAX: ffffffffffffffda RBX: 00005555738a6400 RCX: 00007f7cc18b5cb7
> RDX: 000000007fffffff RSI: 0000000000000000 RDI: 0000000000000004
> RBP: 00007ffd5f5d7730 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffd5f5d7930
> R13: 00007f7cc18ea039 R14: 00007ffd5f5d7b30 R15: 0000000000000002
>  </TASK>
>
>
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.


#syz test


diff --git a/mm/slub.c b/mm/slub.c
index 0337e60db5ace..2d87896c6dfbf 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5265,6 +5265,9 @@ static void *___kmalloc_large_node(size_t size, gfp_t=
 flags, int node)
 	void *ptr =3D NULL;
 	unsigned int order =3D get_order(size);
=20
+	if (size > KMALLOC_MAX_SIZE)
+		return NULL;
+
 	if (unlikely(flags & GFP_SLAB_BUG_MASK))
 		flags =3D kmalloc_fix_flags(flags);
=20


--=20
Best Regards,
Yan, Zi

