Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94283448CF9;
	Thu, 20 Aug 2026 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231712; cv=fail; b=taZDvWf99rRn8ptLaD/H0THBro53ZNLJs8kaynbolzHh5g061W7tKv3GksKDLSobWUV81LJb5vEN2JhjXGdjHEi+MRrSMk5dRteaUcv8WJgRc3LpFSsJPbL4fw/cUjFcLvdMiqaig8Z++QIRJMby3sqItWKa9rqpR7D9MX4nM0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231712; c=relaxed/simple;
	bh=QPf72HD32fMId3swUwr4iHkxlL59weVu+UoaOFgp75A=;
	h=Content-Type:Date:Message-Id:Subject:To:From:References:
	 In-Reply-To:MIME-Version; b=gvTUVpjNfQbagGix9fXgu25u34h/YaFMJLrp+tyddDdM56W5qlv1Qf/HIwICzYd4r9QlPFRc/qSyLDN3kXC286Xavj0yGN8qsIFcfJCwlsmiYcTDZXkiDDVq39OuN+uWaJPpxpMiryjnQ00m0kQaV08ZufqE/RyNsUVgvVQOO2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=olia77IA; arc=fail smtp.client-ip=40.93.194.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="olia77IA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMBN4puNbsZ8EHIxZ9QavAHvMFOX6eQ2bk2oxJrIhhS00CzutJWmru57K2y/shixMEL0aE916FKt1Pyb19aOHjxFqW1Bvy3ZLhkOAFRbjSe3yeiPElvfJmB9ouySLc0roRmajIMnx2Mc45ka+qNGcRFWQm9kEGrY1S3b8EoVSEg/Z9tAlPRhPg3r3LNvBFGFFT+rFntMrEeD5t0+A8dfnW816Yeqq4h6A5eRSYmOzO4wmrqQ8DnjuYm1hJT45UnW/W0MvyzsRWZxYHnvgoJX/UI1rOx7EUH+pQJxS+ktWSy4S/aheGQ55nDgyjwJyLW83NyXM5qE6xt++iCM7tAr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Jn/d+gi5WiY+AYmRk5grugwd2aJOOSkjdCqwxN4swQ=;
 b=pHVV6ZfLsrpb4DEJIQA2hGUEmD5w80WZ/vCm0u2IROmDJB9iwbtN6quYkfJ5cHsL3oP1isJ68CC7OH74crsgyCvQ5WfTbSzIgOSRYyeZWtcOXIuJYucc/SX/FN+DSnGQaE0cAXh1Wzx/AonEbAkQ/JCAmKc8BvhTNva0g01gQum+Ty2pmoeNTU7MfWHzN+snSmb8XNLcC680b49HP9uADXC7V1mehMvb4xLZLKSt68v28KNfjOs5j0rkzqhpXCb98zf6Xy4Y85bTE8/ROntsa4f5qWKQvslPa5/fnqJcMenrawRCOOt3l1hUEvr2CZNvcH1ixUMOxPp4LWVoWsZdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Jn/d+gi5WiY+AYmRk5grugwd2aJOOSkjdCqwxN4swQ=;
 b=olia77IAZsLQ9DiT/jUoe8O4iiMpB+qXFeuFJZZ6WVuDC1J/XPUG7ZAGIagir9rldRxT+ZQdhEnY/v4Nd2uHasCHLIGC56YVNRNgJ0Woih53pNt66Wm6AKnnEnRAEv/Q9CBKRIyvRl5n03BeC/fMBX+AUCuk+WyV1XQ5zya9uCjxZ0oGN7ichRph4bPs3Qb3dSkSdocWsIoiGopGz81cgm0J+yya7bOYNGJvwaYbhK8aT5Dj94QAL1Afp15GphsjRDK9HUq5etaAOh0VFsjsutgxKOQlez6ljRJX6AfEPCp/qtPyibMfrc28Wk0A9/z0AyVkDwFsGNESvxXv7rhcvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SA0PR12MB7001.namprd12.prod.outlook.com (2603:10b6:806:2c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 13:15:03 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0339.008; Thu, 20 Aug 2026
 13:15:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Aug 2026 09:15:01 -0400
Message-Id: <DKTSRH54U1QQ.994L7IJ2TT3I@nvidia.com>
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
To: "syzbot" <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
 <akpm@linux-foundation.org>, <apopple@nvidia.com>, <byungchul@sk.com>,
 <david@kernel.org>, <gourry@gourry.net>, <gregkh@linuxfoundation.org>,
 <joshua.hahnjy@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-usb@vger.kernel.org>,
 <matthew.brost@intel.com>, <rakie.kim@sk.com>, <stern@rowland.harvard.edu>,
 <syzkaller-bugs@googlegroups.com>, <ying.huang@linux.alibaba.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <6a82d0f7.dbb3a75c.20434b.004d.GAE@google.com>
In-Reply-To: <6a82d0f7.dbb3a75c.20434b.004d.GAE@google.com>
X-ClientProxiedBy: BN9PR03CA0310.namprd03.prod.outlook.com
 (2603:10b6:408:112::15) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SA0PR12MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 1908b618-e616-418c-cec9-08defebd0b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|10067099003|3023799007|18002099003|22082099003|11063799006|4143699003|921020;
X-Microsoft-Antispam-Message-Info:
	RoSNO+7U2KHM2mwpS2k1X0XxY1KvB6HuH6do4Rg8DykWO9dRkESKCSy33dBoxWraKgF46uFkNY54bMnTPp1OOSUan1k61FAVwhVyHHYnArYO+VClesuSfKcd8O8kEpmQOfJ4IaTP0bLyCUeuaLJfx3S4Drf3KXVBzVcz6o6/bMBNED+nCnoSIBf4Na+ah7tR/yXpf3eyOo//e5jh5DR5GFehbvyBBgF1Auoc3K7sJl8giykalRl1uHwuGy/WTkr7owkIAiMjC79ZwIcFhw/dOm0jpPH95RFSxuRr8u5+Z3yC7RbXaSB+GOoQsRO/muFkdGSuZA78dJR8TXrZSGREnJkVoJ/oZB/rhf1vTfF80BOKeFHug48D/P8yoCCHW4V2AHVZdm2HKsZo0Z13UyQgAuqEZVsjjr/ji5mHf7ESc5qNJdYd7PdulFAZIXfFw1Kq1TFkHK2QrxBBWACKpnH4E577QRrbWR9wfJ5rKZLOq44QP4t51OQa34B61eCdx1WngRTPB7/unx4rOvBZ2i5bB9Uc/VmGzO4ydoaP90VL0GezTPNveya+z7KTsjPHyzFNDN6I46Clp/nPRZE/7LlyqRPaBJ0QgnPcDHrjszx1mmr7ldbyQU8EH53a6xEcR2ey1a+oXxEHRWsZwllYDDpgsZZ8vTTgXzP9zY0OMIJEPbWo0NmhrtFEe1BfvUBHDz+IgnCs6cfF64wzRRQvcIErEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVRsMm5QZm1qTnVJL2dKR2FCNTZnNmx0ZVhRbnRTaW5NbDJVTlBEa1pYVFJQ?=
 =?utf-8?B?a1l3VW9qYkxYcHdFTEhDem92V3BTcU9XcHpmVFNyVkY3Ulhpb3FDa2FMbDJZ?=
 =?utf-8?B?VUM3bWw4bi9hQlRDQnZoYzhyTHJhS1lGVHZRcXZ1dnMzTmtFUks0L0o0SUFk?=
 =?utf-8?B?alozWlhqNGZsSHJ0L2pLV093N0Q1eEVRWmdtVkQwTDNNVEVJQldIUzdNbFlp?=
 =?utf-8?B?cDRWRUpPMDVjTXBtaHFyRkg2M09TNUYrbkEyclZsSm0xTkNCQzhzc21jdFhi?=
 =?utf-8?B?STlYR00wcXdCRXpZSmZZbnY0Z0tET29kVUtBbEwzQi9yKzZDWW9vcFJsMGxy?=
 =?utf-8?B?UFNjbEFnN291UkhqeW9OaTg4bmxTVUVzbW1Ub3FOR2dWdXU5b3VaSEVON1dD?=
 =?utf-8?B?ajAxa0pweFhDYW0wSTJWSHA2RmUrTFZJUUJ3aWg3N0ZyYlFtZGpla29uNGJq?=
 =?utf-8?B?Tm1lM2JlUGswTE54bXpZQUc2TW4yN1JNUFRMRmdmTFZxamg3R1A2SWpEMnZ3?=
 =?utf-8?B?b0pjVGppWHBveGM2cVExM056Q05jVEIxRHdtV056d2RpZk1SbUVwVFVBSEVx?=
 =?utf-8?B?UXQrWmttcmpDUkNyS0hHVGNFUlFmejVQTVZhRG5OTHBxMkN5eVNKWjlyN3NX?=
 =?utf-8?B?clhrNTRxMnZRN3ViQzJyYzMzVVFyTVp1U1VSRzY5N1p5Q1pPa2U5UWQ4K0wv?=
 =?utf-8?B?ZWRwTkZKR1ZXcE5qTGNZSmt4aFBNdHhsL1NxUC9UeHBKK2xaWUFOeGp3dXJB?=
 =?utf-8?B?MCs2eWlDNGNGZmoxZnpXYTAvLzIva2UxT25Uakh1SFI4QU5HVC9lRnNsUW05?=
 =?utf-8?B?SWY4ZnFyVDdWTVhiKzRvU2NnL2dFTS9Kdlk1aWlCaFo0Y3F3SEdOOFVRK2JN?=
 =?utf-8?B?dURVQ2FNSmtHc2gvUVVjaVZ6Rm0xYW1xMDAxTEdtY3VpWlBNT2RCR3VLN0ZP?=
 =?utf-8?B?MXpyMlhoeThLenFXL2ZOTFdTZy9SeFJxTmdOckZtUWxqdU1YcDJhZjBFNlI3?=
 =?utf-8?B?ZWNVTXZnTER4S2RnMUhvekRyZmpsSWc2Zkg2N0poazNKRkg1d1k2bHNDT3hI?=
 =?utf-8?B?bkEvemRmbGo1dXI5T0hyMjZVTDBKZXZrNmd1YSs3TWxsb0tBQnVrcnBBZGUy?=
 =?utf-8?B?d0FyV2Z3T1lQNTk0Z3EvdzBsU01TUThDS3pMNFFSZ1JpU054NTNlRngyR1dv?=
 =?utf-8?B?TG1kS24vUytJaDZMVTk3QnF0RkY4ektYY0Nic3M5bW5jMmxNQlk0QXB6Zjg4?=
 =?utf-8?B?VWNnaiszS1U4Z2l2cFpvVmQzR1p2Y0hBeFdpaE1vS2tnUXJmaFhCVWRyNm03?=
 =?utf-8?B?K1owVnN4bGlrK1JtTWxvWGF6R09WdmZ5MGZaRThSQy9JQnF4anlpQzAzekxp?=
 =?utf-8?B?eHdjWDVVWkVwcWorRXVzZU05d2p3QTJNUFVNOWhyZmJVMjMxMnpURDMweXQ2?=
 =?utf-8?B?MW1tN0NVWkJ3ZHhNSkV1REZYRVk0RlZvSWdxakRpZDlkK0N0VVVwemFtU2hZ?=
 =?utf-8?B?TzlXTEtmeElTbk5aV25QNDZEMG9TbjlSQkhxQ2FFWFJQdzdwTjBTU1B1b1Jq?=
 =?utf-8?B?OXFtelpndnVSTEZoeDlGVHVJQUk3TVByYmd3eE1rT0pVSElic2kwNElsblZs?=
 =?utf-8?B?N3VHSzBwaHU1MkhwL0thbitNN2dFN0lJdXpnTkJ3UG1KSnZCdmlNV041a1pB?=
 =?utf-8?B?NktkMkdRbHhmV1JoVFRyNGYwcDlYMzhIZDUvakRvcnpLc1lNVUl1a0pZbThy?=
 =?utf-8?B?RnY0c0VUbTlGTjNLWjZvV3ArZ0RlTXZIQVdORjVZTFgrcVZNYUNIWVM5L3JK?=
 =?utf-8?B?cGhQNjdvWjRkRHE2RkVlWDkvbVZud1BjTGdqM3Y5MThYbXJMN2FqVjczMkMv?=
 =?utf-8?B?UGcvQVR3NEM3K1NXVzY3S2xkUmRxc0RvaW1JT3dWNmY1T0l3ODdROVA2WVNn?=
 =?utf-8?B?TzZkc00vNjlBbVZYZ1c1SDc0MjdJRldYUVNsVXYyR1ZndkV3QkRJUFJ6eS82?=
 =?utf-8?B?SXRrSkxCUHY5VlA1TjVxSDRBajZYbzA3YVVhdW85WHd0bXljcHFHaGhkU1lN?=
 =?utf-8?B?Y0kxVnpRMWNIQnl2Wmhua0lNSWJMTlp5QmUvbGVUQVJhNzc1RkozenlJL3Bx?=
 =?utf-8?B?WHNtRE40WEZVTzNTY2Evd3BRUllFV2NudTFFS2U2N2FxWUx3TEgvT0hyaEYw?=
 =?utf-8?B?RFZYYnFoY0JWZXJmbS8wSHZvSFBNUHp3NFd5azN6REpoTzNJbWQ1SXVXSGNH?=
 =?utf-8?B?SlRjNDNZdlhzczRWdFNkbFpYYnBUSGIyQmd1RWJqSm1qaTMwTjZxTC9EaDZD?=
 =?utf-8?Q?jxpwRwei7QsKAg66rz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1908b618-e616-418c-cec9-08defebd0b5a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:15:02.7688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lA1dwQvTu5fhLc5vzpB0ttoWP2LK8FBJtiLEqV/4Wodp3elaW96vaulwb/NzUzSE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7001

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


diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/=
inode.c
index d87a8ab515107..278a0a2b39f4c 100644
--- a/drivers/usb/gadget/legacy/inode.c
+++ b/drivers/usb/gadget/legacy/inode.c
@@ -604,7 +604,7 @@ ep_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		return -EBADMSG;
 	}
=20
-	buf =3D kmalloc(len, GFP_KERNEL);
+	buf =3D kmalloc(len, GFP_KERNEL | __GFP_NOWARN);
 	if (unlikely(!buf)) {
 		mutex_unlock(&epdata->lock);
 		return -ENOMEM;
@@ -666,7 +666,7 @@ ep_write_iter(struct kiocb *iocb, struct iov_iter *from=
)
 		return -EBADMSG;
 	}
=20
-	buf =3D kmalloc(len, GFP_KERNEL);
+	buf =3D kmalloc(len, GFP_KERNEL | __GFP_NOWARN);
 	if (unlikely(!buf)) {
 		mutex_unlock(&epdata->lock);
 		return -ENOMEM;


--=20
Best Regards,
Yan, Zi

