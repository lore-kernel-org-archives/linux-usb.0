Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012021.outbound.protection.outlook.com [52.101.48.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF34331E856;
	Fri, 21 Aug 2026 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326296; cv=fail; b=ZPn8j3Nnkhn+cGPu3xEFrBAe7j3Rk8kxlRUNywtVmxQAcZVYSOQlyMdRYTH5tmIqdfmuuPbDRaDNYasPwGd8hazSmSPdf4kPpJqIhcUUxHhM2ZPp3M84I6Iqa1HVig6l/uDZm208ZJ/gVj5fNuvdP3IHAf6+47c7WanTHqujnX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326296; c=relaxed/simple;
	bh=JjE58GTMZYnwWZv/1U4hC77wAVityeQXmS9TrI2RJjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BtvgTG/TNSRUA2m7Tkk/oMC6waHYBS7D2tYa6jOV/nXFlJDRbaa/y09ofuw1ZEK22sCk/gQufkeUWOiY3Ub2HzXgjtHuKilG8H5r0EL44Qe4Yn2XrJ+2QyLtIAjebqVGjGCvM+aQU5U0xGqdyXDIWcbvPwZX80gOtYVQucEwQLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xl2aY/4Y; arc=fail smtp.client-ip=52.101.48.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xl2aY/4Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igVW04QTPm7hfDTrs/gAgzh+NjZUR7Cqij9a5wH5MnztL5VeyS0jjlAIxgCpGu0LUDuqq9apvj2g/VmODL+BATyO1V0bU/CorPPYKDYsD0O9d6y6MqczVLuF8XyzEDge9KLkPb6nnWWo+07zxh2tI5Q1QxGJzMydagvPefiOlo+AZonO+J/aJHgXGIoRxV3/Xp7+2ZTmjT4x4WhP1wmwE0mUKl57JZIinKdfTvFKXAJq4RX15fBIN+6lnQ4+74olNIWNWs5DAoikT68mFleqpMhIsKWPfR3g+TGS932fi+7kqT72zHEe2mnYz6vvdRS24kIfQOeeWyT5uG8gVKRy1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMLKYJWZZRzR54cvGeUe0W6sjWwLeFrNu/ZQ7VMuFL8=;
 b=FnfE+ONb8DLypBerC//oRlt27KEpyLyXlMeGydvWX/nC+/5ZNqdGpFAluRcffUqR3lm6raFqvCAb3AxqCgkZWJJf+srfwF4yz0lDwSOjgZT7U1uIua69vtYXHrLJ7og9PN+phuOvswI61uPeFgFY2dD14Cz1zoHByGCotOckwvJoHDmMJqsND/XP4D6vcz4OSqENvlpNdsTBZ3Jpc4HJI31k+njB5RJQXS3J7LcziLIQsl6t6nMKDLmGvCIwp4uUPB5EQIzLwdPuoIn1LbB2hpzGU7xs+hTE+K8l4u7XsmmyZOT13CInZIHKGALpxPP2Dp9uRph78+n6RKHMmwnD7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMLKYJWZZRzR54cvGeUe0W6sjWwLeFrNu/ZQ7VMuFL8=;
 b=Xl2aY/4YIKB2mQk0kfQ3v8OaKX8HYVKUKFwejILIjqh5kzV41mnYr2YbViUULMFGHhG2Pn5atKHVUORIkcJjrlYrUNd5wAI1y/1UYtKQI7gDJLCZ53/MkC2o+1NBm4xSAoVcrTYqm7XVoaFz2/8QJJCOLpCMcR8xvskw4j5Gu5dWqhG5I7TARbrwZuWmD6bLER9xGRYdu/m6ASxBvc/b6KVIl83LC6S2A777kCKUOxn6QIVp8e2iNs0Pl93ZJmShub4/iyqCinmMj0kNUbo3URRrupOqwAW5tIpOb6TQHDv633fi4Z1ZRl/yVE9MZoA5OKFk0YH7x+h7Ucp8lvFwlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 15:31:26 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 15:31:26 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Laight <david.laight.linux@gmail.com>,
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
 apopple@nvidia.com, byungchul@sk.com, david@kernel.org, gourry@gourry.net,
 joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 matthew.brost@intel.com, rakie.kim@sk.com, syzkaller-bugs@googlegroups.com,
 ying.huang@linux.alibaba.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
Date: Fri, 21 Aug 2026 11:31:24 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <BA5425C6-1906-4938-AE75-93719AAFA45D@nvidia.com>
In-Reply-To: <20260821161310.28255793@pumpkin>
References: <6a820ebc.9ebadd4d.20b15e.001b.GAE@google.com>
 <20260816135201.98590b17b526dda8c4ec9105@linux-foundation.org>
 <20260821093039.04538795@pumpkin> <DKUOVAQ3T03S.14GFWAHY0I6HO@nvidia.com>
 <20260821161310.28255793@pumpkin>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: BLAPR03CA0089.namprd03.prod.outlook.com
 (2603:10b6:208:329::34) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 197f15d1-c8e5-4116-ca3b-08deff99436f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|22082099003|18002099003|3023799007|56012099006|10067099003|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	BzGrHvC1PfNs28OQ2chfnl7MDX0x1d2HHkxPIFEbmB2h3U9xbR9oRNDiDEtIm3C7XMUWW9fi3+topPWTshDcWII4AWafGoEZjR7UJaq5gfXMmsFEPvBgFI68F69XteP0SGCVA56WRUmedpzjPpFjyd5o/FSNswGNIq1gvWub4YcL4wjSKeEhcKmEhcUOXQp7SHtc6AvGNeyd0J4O6+zfySjkwMjVZ7K/+3NBNrq0t33PdnzKPeDYYesej1OzDUy6vic9KFwKl00Yz9jssnx/tjOYI7gcYjxy6ssNIlt8bvgnnP+IsyoHN5Z7Rr+C1hpVmScNvPCbQXzqbGLi9BUHpIqIVz9HCxwAo8HlRwyTI+nGJ0wdfZkDolVo01WyPgOtB1j+DZnOD4iEcuQo/NcIdb+0EAKfbcvQc/zp3jIupgYUGdYaXFATxO3Kii2seSQmsBv+rvE6yD66OgB4GrmKrWLV4m1UhUAAQWMX8bfUNj9nopYaWybdW8kbNsBpiPN4MRng4++5S0tSTGmFOVXx+7kU3nvmJbHJq+7gSNA/oaHt9ahyQDeYRN4nIve4Hr9wX87qL70I7hNCW/9NSRiE5LymmtSdsZ+UY9NWpiyu57+E7SQD4z5BEtmav+6bCQjup2PIr1f9YdaQa1q5X+1Fu5ORE3ElSpgcyiVu8W4m49w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3RH8yLhoqPtpnePEDYfvb3IasbFre639OstCMINaatt1qNbpv/Co9y7CSDoH?=
 =?us-ascii?Q?PJFnquCYJYp/KsstXEAiH7Qvr+XZyOdV2Rgz3wcrwYKyecb72NpGJIL84Xys?=
 =?us-ascii?Q?THwxeU8h3JnauMUeQJ02TTJeqsig9+siH5dw/Y/ZtTTm22qYcMe+ycRqCi/t?=
 =?us-ascii?Q?XAnJMFOfjGAjnepBKyzcmKp8KiHsNP82E7pXWR6tE3eIsVbl1Jt/0rumWjf4?=
 =?us-ascii?Q?VeVnV0DuJrnOWgEsVefW+mtMbGKRgUZPu4ag8+ilOAtO99xnuYf9p4PSh4f2?=
 =?us-ascii?Q?wgkbix8Sl+fAG+VqkYzzXfQDeCjuY3SNrnQ1LSoku3LaOHvFoVy6qQetNgmq?=
 =?us-ascii?Q?5ym9KHj188YNN9oI0gDymFbXLEjmrGa8sq92c2zxwdMKItI/Gp/RXBcXgaAa?=
 =?us-ascii?Q?MbspDkEr+eC1wITZXoYNyc0RP6J9ZY7qzxvwe6dMF0IouShMV2Oi3K3ZLdmb?=
 =?us-ascii?Q?MjErgzgQPeJhlFq/+f3VuaHeSiSslwDVvx5GrTW4LJgQujToM2+P5t0R3GjV?=
 =?us-ascii?Q?PbxMEFdcPqJXVXIcLHQe3NtgR4eldr1wUVga/uwomNGyIdU6xzQvdUNnzXxp?=
 =?us-ascii?Q?QyjiGeY0B2au56VNg8Kmox66iX8uSTpnHHeMtKZ5aADCvnD6EoVzGCWRcEL1?=
 =?us-ascii?Q?Gx2Bxn/OZqzyG2d75eyNd8rnRiA3Lc4nYrmX/IUg941jOjIkD54EUQSpdz6G?=
 =?us-ascii?Q?bd0/AAdaTterYt5ky3I4uJ0AHXNOWA4+EZ2rq4I8z93gr+vtdJ15Fd3ucy0X?=
 =?us-ascii?Q?WvwWb+CAQio0fBcsgbaf/qfAQiMWWrMKFVUlswA3Lhf++aafD3oH/2/GDAS+?=
 =?us-ascii?Q?XMVewiTTjODTt9nb9OSGqgXpo1dtNWPtePSLooqrgf+JprpbZ9cZ0S93SH8C?=
 =?us-ascii?Q?4eu2gtDQMRxQc12izh24chbR0TGVrLSowOl7C1T7I/Dv9yVMQ2Awno3zCqV3?=
 =?us-ascii?Q?/Y/pD90wbwkJ1VkZQYyhyEQBQ9EUQ7IG4jCXTeZmdZuS35Y+tbjmdla7oeIA?=
 =?us-ascii?Q?HXeQdTc2Zskn+63Vaq6zJdAKI4OpJ2B6h13f4IApef/wN4+RY/H1jpuF2sNz?=
 =?us-ascii?Q?npYyhSGShjqfFAEa9AWpocWzQa6/2nTOcBRRa+mRNHq/H0tXhLcBaSMtRoX9?=
 =?us-ascii?Q?zTn0Bq+xSChv+mvCRk4U6dyI6o6KwRRwxqRDQ+44XlewxfnnY8GNzEAbtVuy?=
 =?us-ascii?Q?yzp3jo0/ELjlUgXg6CWr4420xh8o9Yqqjnbyayo3Y2WXb82vmGcUVH3IV85z?=
 =?us-ascii?Q?RO6Pz2KM71k8xXzAujwlYiFr3Oxbvi/pHxpeVSv5+QfOVdTtJHM6/tWWLcCy?=
 =?us-ascii?Q?0A5/O+NOKbUkJVUMzWwffs+awAsKp/SBM4SKQBm1PirDGmef/Fu85F4Pwg8M?=
 =?us-ascii?Q?QFamD6IeoCfMk/h6Y0lxv8ZTzo92C2sjaI3uxCVOa/jw7hC5rjBAPuFuk3sI?=
 =?us-ascii?Q?cYTLYfWbCgr5P0RZQ1jV9oNktns2UjpHJqfMYiqnefxnygxaatElaU3WKX4a?=
 =?us-ascii?Q?nuoqQRnzLnri5T4nWPXc5H+gmFvDuotMHMUFwMhXjnkNYWD36rnaX5x5gu6N?=
 =?us-ascii?Q?rBZ3pLAlXnZ57UM8mYMT2CnvUqXiy3T92sAdpGyoonbJvs/ygvEmnOEW5IVC?=
 =?us-ascii?Q?9B1gldmdldx6Geh8EcY2YHSr9G74v8KWmaEOP6WPSuXttNrhk6XF0RGyRVdc?=
 =?us-ascii?Q?Q3ullWGlfH9fIcOf/XaGZEb78ScZbLK/mODJs6131DOLLWkwtr2/cG3XQ28q?=
 =?us-ascii?Q?h0ybXMIEWw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197f15d1-c8e5-4116-ca3b-08deff99436f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:31:26.2184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aT2Qvnwt+8CZhlM05ApcysE4XUFWXIEU6nc/hvNqkZ63rAFBEzEdIgfVqC2Q7UcP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736

On 21 Aug 2026, at 11:13, David Laight wrote:

> On Fri, 21 Aug 2026 10:24:36 -0400
> "Zi Yan" <ziy@nvidia.com> wrote:
>
>> On Fri Aug 21, 2026 at 4:30 AM EDT, David Laight wrote:
>>> On Sun, 16 Aug 2026 13:52:01 -0700
>>> Andrew Morton <akpm@linux-foundation.org> wrote:
>>>
>>>> On Sun, 16 Aug 2026 12:25:48 -0700 syzbot <syzbot+805630f1453e490427=
fa@syzkaller.appspotmail.com> wrote:
>>>>
>>>>> Hello,
>>>>>
>>>>> syzbot found the following issue on:
>>>>>
>>>>> HEAD commit:    3d6d817622b0 Merge tag 'scsi-fixes' of git://git.ke=
rnel.or..
>>>>> git tree:       upstream
>>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1592747=
9580000
>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da59830c=
ba91a1981
>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=3D805630f14=
53e490427fa
>>>>> compiler:       Debian clang version 22.1.8 (++20260613092233+e80be=
da6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
>>>>>
>>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>>
>>>>> Downloadable assets:
>>>>> disk image (non-bootable): https://storage.googleapis.com/syzbot-as=
sets/d900f083ada3/non_bootable_disk-3d6d8176.raw.xz
>>>>> vmlinux: https://storage.googleapis.com/syzbot-assets/d19e0514c02a/=
vmlinux-3d6d8176.xz
>>>>> kernel image: https://storage.googleapis.com/syzbot-assets/f6da7068=
11f4/bzImage-3d6d8176.xz
>>>>>
>>>>> IMPORTANT: if you fix the issue, please add the following tag to th=
e commit:
>>>>> Reported-by: syzbot+805630f1453e490427fa@syzkaller.appspotmail.com
>>>>>
>>>>> gadgetfs: bound to dummy_udc driver
>>>>> ------------[ cut here ]------------
>>>>> 1
>>>>> WARNING: mm/page_alloc.c:5280 at __alloc_frozen_pages_noprof+0x2ce/=
0x380 mm/page_alloc.c:5280, CPU#0: syz.0.0/5319
>>>>
>>>> Thanks.  drivers/usb/gadget is the offender.
>>>>
>>>> Gemini sums it up well.  "ep_write_iter() needs a bounds check prior=
 to
>>>> memory allocation".  https://share.gemini.google/5NzjyttO0ULc
>>>>
>>>> I expect an easy fix would be
>>>>
>>>> --- a/drivers/usb/gadget/legacy/inode.c~a
>>>> +++ a/drivers/usb/gadget/legacy/inode.c
>>>> @@ -666,7 +666,7 @@ ep_write_iter(struct kiocb *iocb, struct
>>>>  		return -EBADMSG;
>>>>  	}
>>>>
>>>> -	buf =3D kmalloc(len, GFP_KERNEL);
>>>> +	buf =3D kmalloc(len, GFP_KERNEL|__GFP_NOWARN);
>>>>  	if (unlikely(!buf)) {
>>>>  		mutex_unlock(&epdata->lock);
>>>>  		return -ENOMEM;
>>>>
>>>> or do what Gemini said.  Me, I'll add some cc's and run away.
>>>
>>> Should there be a separate flags for 'request too large' and
>>> 'no memory available' ?
>>
>> What flags? Are you suggesting kmalloc should return an ERR_PTR to
>> distinguish different error types?
>
> That would break to much...

+Vlastimil and Harry on this. Maybe worth giving it a try.

> I was thinking of a GFP_NOWARN_TOOBIG.
>
> That isn't enough to change the errno though.
> But a smaller sanity limit may make sense anyway.

Maybe. I am not sure if we want to spend a GFP flag for that.


Best Regards,
Yan, Zi
