Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7624B04AF;
	Mon, 17 Aug 2026 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786998896; cv=fail; b=pcokRSQ8e7MIUf1yxAHvUWYZu8VkMxbFCi54Ofq+l7mHQvJ1p2xV1r/2SkoTCVyeTOI629+TSTMlJ2PYxYd/B6vQCf93QFGQNy4x0lwlF/fJ6npeHudzt4GalvVeOijHBK/1WFLnTUbgE6cp+YRO2Kf7lRgdQ6mSstWygi6Pd0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786998896; c=relaxed/simple;
	bh=ipYLDAX4Bgn4rSbB6ljRJ/MF+E/gzKSBA8TCm2uJAE4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DrcFVHWObBQ0QhTHkheY4ZCeXlP12IFqkVaSyEU1R1YYMshBCZVEnlCKgDlgMtxoMinHVxn+tRWPNbK4AaLoiEOA8U5F6GR+2PX3JtMHQw/CChDc7wkVtiPQ0ZxHZBSrUNmmal8uklQ6sgIV4Jlp7tXV4x3XHsR0nmBya9E6gEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EMOICK+H; arc=fail smtp.client-ip=52.101.61.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EMOICK+H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMwrgAAn4wg2llQ3EQ4wVa0KmfeFDLGSlSb9+0W8zHTyjdlIIb1T+ebeWdvJA2//no6XEccs6ic+Mb/VQQSVA536iPYvG53SiZXbXt9srTzpkY6iY0LdjOK6OyxmYWTwJVDgzszhp/+yHQH0nxmIE1zqr6JTUBsjIbsC4e/UrTfH2U8AdqoUGK45jhbSmpxjNAGbhx0M4CaoVFnGPGEVdSONfvvtDQ/f7RdtnLAFf/fGYKSsfVogyGupJhZjGQBET3NucXNR1DECFlxdNXwnFfiKdl4os4vbX0jZCrxKkJeubcWCZ32PnVUL2ILg9vbCEPSZ4hWZqwGG87A36oDpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWB62lEJpWuDk+WdVnDRr+KM+VHqeXPbB3lrNN90s+0=;
 b=Pe2psFxt/Rq1tugjIdMgOi4pZtwiQSzcRyQesSo+yr0CUKbFdluH+//sdTaWg4zP1GOLhkt29vKEzBxR91sDj0DmnAZoXYJgqrivMetsiWMa59F87MqmGhHB21BNWWSzqSiJiJrR68WpCr39iE1K/EiVqB/oDPOaS4MvfH7+mTJqlAm673haEHu/eG05RSbvPIG0QTyvPFKN+8DjkMf7vsPBKWdZsD7eiN/vkGus1n4WNV94RDJVLmlvgJspqRyud2tlZ3swq1XqrNecvPh+Vv+Xm+wrA7zFUhYn1AksNWHAz/FumJCejQOW7l5Uot/MFISvmBn+gGMlAKkgxY5blQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWB62lEJpWuDk+WdVnDRr+KM+VHqeXPbB3lrNN90s+0=;
 b=EMOICK+HyMSwH8s3abMFrE6zWZPY8IvWf4rVVX8KZnBwh8XWXBrOUs2lYkB/8oS3Va6xziwgqJYraSpwDBL9+KVDSxojQCg+u/Zf6IjNhsT3dz1yzhzK9AitxErfKJdXKnu6mPXrwJfshU8541MMHy0Me2fGsU80/i8107kNnRU8WMFqKQCi4U4rMUpPvAnI28hmLDk6A4ajQh9K9zHYNTlzzriNYu5fdklwMfDHLHpSw7XSxxbYmR9ZpKcf5gDZ1BDvOe8t/1wGNCIIrag/nilT4DfqKSfbzBJwwtA1VJxDzOEnn6BMpogtYlQ5IAj2gcjTJJO9tTScxTyinU0oIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6296.namprd12.prod.outlook.com (2603:10b6:208:3d3::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Mon, 17 Aug 2026 20:34:51 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 20:34:45 +0000
Message-ID: <bd091acb-fab9-4678-a185-0b65a2900a11@nvidia.com>
Date: Mon, 17 Aug 2026 13:34:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in ep_write_iter
To: Zi Yan <ziy@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 syzbot <syzbot+805630f1453e490427fa@syzkaller.appspotmail.com>,
 apopple@nvidia.com, byungchul@sk.com, david@kernel.org, gourry@gourry.net,
 joshua.hahnjy@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 matthew.brost@intel.com, rakie.kim@sk.com, syzkaller-bugs@googlegroups.com,
 ying.huang@linux.alibaba.com, linux-usb@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>
References: <DKQP5QC9XTDJ.3MI016NP0NPFY@nvidia.com>
 <02c2e5c7-0d78-4763-90ff-75fa87105fcb@rowland.harvard.edu>
 <DKQS9ADYVLN1.246LJPQ9QQYVP@nvidia.com>
 <9787b33b-b30e-4c5e-a0ee-7f14515c7166@rowland.harvard.edu>
 <DKQU9SQUIKDR.2KEZZPONJ1IJ7@nvidia.com>
 <20260816194213.0e813ed338144ebc81ed4050@linux-foundation.org>
 <472add4b-f16a-4b87-bbc3-98c8aa385cf5@rowland.harvard.edu>
 <EDCC14FA-F7D8-4F72-B780-37D09E26D16C@nvidia.com>
 <2026081745-unshaken-retread-d744@gregkh>
 <1ED81A86-22F2-415A-8CC0-7E9B4A4446C2@nvidia.com>
 <2026081732-unaltered-regime-f91f@gregkh>
 <92B3A471-F7BF-488F-94FA-6A011D33D31E@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <92B3A471-F7BF-488F-94FA-6A011D33D31E@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6296:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c64e8e-379a-4522-2d19-08defc9ef991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	1kySRiEBJsW6ROFLYnk1hWvn/lCw5CY70kFBRoLUzDE/ViZ4cvCX2V/p7BjORS8WMfGHycfbIyI9cvvwP/cyRspz+nypbKd/H8lZtglAoyv4S30bF/rnEzqT419O0B3tGa7NmvCjTIZXuwqn+res9BWpz13cBAm8vvOwXX0LcyXFBYAGpUX7DVG8WV/hSgIz5ssyBI6vS/G0uzYWDgCkdHAXri9jO9VDyamLbxFIYdm1XN+2gP2bEjXl97+U2PbY9054yXtpZO8NSNda33Kbg8xtWMWFkZwQ2CqfjbfjTErg58kYxhFy8PxcBecy+ZV131qFzHS51VEglLTf1c8qyCCnXZyJ8II9Z4IWkwg0m1mse1IJSpUnuV4ZE8FdQXiaa5gE5BhxHxxaC4bG6e3Ns6lTT9a/O+SI0OBWfdp/cMmRPMbmUTRz7s4g0D4jTMbmnhKpsQk/mVRjt0nYnFzjl8jgJWSjndpbaLPjqqouqoch5T4jzJoza7jqiPXo6+B9K6A54V0TFDz1YcqKY7WizMgg0HJzCqNH3NiAWEaDZ3TIshrCDEOtZNMO87Mhk7ejHKg04jFSfjQP2USDVisHB6IUJ2Q//2Du5DGBqlMFdx2JNhqsHm8fgsC93LGaIkrCuPDFN6yJsTvgV1E2ggJq7PFMBsWrwEzgZFvIllLZWCs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWFheVBhRzBkOXkrMlRpM2l6V0k3ci9BMWJaVW9HT1k4Tks3K2JpanQ0ZkRW?=
 =?utf-8?B?ZDdRUlhIQVNVVzhCdVY3Wk9Ka1kyK2kwOXRVYW11b3hKdjVjanp2eVUxNVZi?=
 =?utf-8?B?K2lQQlhia0I1WkIrUHpwZFVYa1ZLVEFwVHkzN0lQSTlhY1UzekVNRmxoMlNm?=
 =?utf-8?B?ajJwOTg0L1I4RnVXdmVyVHo2Q0hRWTlXWU5jbHNIdnZxTVh4NDMrc0pUdEZ1?=
 =?utf-8?B?cGdYdDE2R0toV3l1VTNUZk9PNGllR1dCb2tld09VTGhCTnk5QVo0NEdxYkVF?=
 =?utf-8?B?RXR3WCtOckl2ZHNOTmdGM1ZhRHZFaEQzZDBYdTQyMXBqYWM2ZjV3T3Vxa1Ba?=
 =?utf-8?B?M3BiQmNqM3ZIME5BMGhtQjRwMkRTTEprVjA3cXZxSkNTZHJXYXJXOTdBa09X?=
 =?utf-8?B?OUtoak9xSVpPVXR1N3ZSUHUzUU9ReDhCY2I5NmRmNW41dVd4dUxFMkMyM2Iz?=
 =?utf-8?B?MGtSS2s3S0pBU0RLNGNXT2xTUFdKL0N4bm1HRDFPenRzMUFHNGxCUUlZMWpo?=
 =?utf-8?B?Mkt1L1luNk5PdldhRmlhbStGOXRsZk5NUk9PbUc0N1dBbnF4bGxlZ2xqRVZC?=
 =?utf-8?B?SmFmc0tOcGdydDJHTXF5cWYwVS9TTXJKTStFTjBqMkljUloxZjFRa0F0eGNF?=
 =?utf-8?B?QWFaSEZ1SEJpTVVKSFFpcjl2VGtwWXFLQjVUbkpPZmdWUTc0NVQvaG43eUp5?=
 =?utf-8?B?QjlvNldvWlpmNjFjcG01bzltNVg1MVJPcHFVakJDZ1RJa2dObkJnU3U5S2My?=
 =?utf-8?B?cTh4ZXh0WFEzSVVoWUw4bkk0aGVOUk9ZTzBqY0pCdS9hOW03SjdZcXUwQkh2?=
 =?utf-8?B?Z0ZLaEZsNm9LS2dRbzVSd3lKM0VrSXZzZzFFSjJRNmVLeHhDNmpyWFc4UmVU?=
 =?utf-8?B?T28rZlNzWWxLVEJaUmsvbUxJMmxzMHJjVnhaZFpyNFEyS0p4TUNHb1dyZHVs?=
 =?utf-8?B?M09IRDFpYVpiWE1DZUFvZWFKRjF0NnVKb0tFVlNJbFZJVG01UjdHaFluR3Jp?=
 =?utf-8?B?TXBlQTRTUzJhL2tXTFFSL2xSc1RUMmoyUnJPMU9WaXJiaW5ORzRBaUVDN3Bw?=
 =?utf-8?B?VGJTTlp0eXZmNVNPTDNxSWZIUkhUU3Nxcjk1QVJ4aW0vbG95NEl3L2QxeHJM?=
 =?utf-8?B?QWs2VXVQUG1pZDBHVXd5djluOGdBaUVrMTZqNEdxMEFtZzlybm5mZ1hoQ1pX?=
 =?utf-8?B?dC85K3VhRktyb0VZM3NZejlaS0RjWXJLQld0dWp3VE9iWk53ekFmakxUN2RB?=
 =?utf-8?B?YStjV0djZjVWWGlTV240MjNHRnJrYUJVVjJxdHpZVXNLSE9Kc1RsRFVIVnRG?=
 =?utf-8?B?bngyVVZnV0IyS1E0clRtc045L2RmYXFGZzBCblMrYXVQdEtxRGdnbXlYQjg2?=
 =?utf-8?B?bTdtVDNrYW5LZWtIUE5ISzNMaFIvbWxsNXlMZHM1TW9nZlovek91SDBldlkr?=
 =?utf-8?B?U01UdEJKcVJ3NjN6L2JTMnd2aFlqdmVnTkEvWHZkTG1JNFhjaENxRWdqN21Y?=
 =?utf-8?B?eXJGMDkvdnJQZi82dGlQYXo0Y050aVZMZHhxMlBFMi9FUXJXZk1Ec2xQUnNM?=
 =?utf-8?B?RnNqNG1zL1lMMHExa0l0c1RUZGpRcU4yWmpRbnEwcFQvQ1hyMlhYV1Q1VGhQ?=
 =?utf-8?B?bks2THk3V2E5dXNwdUtuYkhuQm13NEhLd0lTOEVCVG53WjBaTW1pLzZrL2Nq?=
 =?utf-8?B?N2Rkdk4vdjNaTFpybW5wTGtqYy95K0hpMlJqaTc3Y2tUNUdaVzhubDVZdHlU?=
 =?utf-8?B?RUJkVmFOQ0pPUlRYVWNiRUhCNW01QllkL3k2YjhTZG1iMVQxSndIcmh1ZUZi?=
 =?utf-8?B?UGUraGVoYXNEZVNkZW5ibGVvYUFrYXVIdm9EelArRGlab1c4MCtreExrWEVl?=
 =?utf-8?B?Q0J3TXN4am1iZDRGMUhsWUMvY2ZET1F3aysvblM1TmJ4UUR6bGgwRVkvUDQv?=
 =?utf-8?B?RE52SVVHUkd1aUx0ekxRQ1J0Y0tUUWJSaENYYUZzYzRudkFDbFZER2V1Vjk4?=
 =?utf-8?B?QUYxQWFkR3FnU3pnWVRJbmF0aFZTV2dEL3BjaVgwNXZkSkpSZHJrWHVxSGhX?=
 =?utf-8?B?NDFCVi9qNjByemRzZnQ5TjN2Y0t1cTVYMElxWjNaemZ3VnJ4ZVZTOS9ka1FU?=
 =?utf-8?B?UDFKT011MlVxZGI3R3Q1TlBzY2JtN0JrL1hXRVBCMDV4T29JUEVIUmdsV1BJ?=
 =?utf-8?B?L1dXMXpITm9iT1VwT1A1MjJVNUJKQVhIMG1FSW15ODdmWWt2TysxM0pXUlBq?=
 =?utf-8?B?NUM1K0QxZ1JzK05yTzlEUndKbWc3Y3FVZ05KcGU2QzkxdzBFRW5BZHUxWWhQ?=
 =?utf-8?B?TFJ0U0U3TG1RVjBaalp2M2xZcHlHZzBZVGF2aC9yQkptQTI1VEc5UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c64e8e-379a-4522-2d19-08defc9ef991
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 20:34:45.6788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpTHpkOpbPkuHh71MTOXqGNesyCGFoAm8+qHxU46P+4WDMI00q5I9EVVViCbV6p1wrsY5F9cZwRqlIt9VOJITA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6296

On 8/17/26 11:51 AM, Zi Yan wrote:
> On 17 Aug 2026, at 11:55, Greg Kroah-Hartman wrote:
>> On Mon, Aug 17, 2026 at 11:19:23AM -0400, Zi Yan wrote:
>>> On 17 Aug 2026, at 11:06, Greg Kroah-Hartman wrote:
>>>> On Mon, Aug 17, 2026 at 10:34:26AM -0400, Zi Yan wrote:
>>>>> On 17 Aug 2026, at 9:55, Alan Stern wrote:
>>>>>> On Sun, Aug 16, 2026 at 07:42:13PM -0700, Andrew Morton wrote:
>>>>>>> On Sun, 16 Aug 2026 21:47:58 -0400 "Zi Yan" <ziy@nvidia.com> wrote:
... 
> BTW, kvmalloc() also gives a WARN if the input size is bigger than INT_MAX[1][2].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/mm/slub.c?h=v7.2#n6912
> [2] https://lore.kernel.org/all/CAHk-=wiRq+_jd_O1gz3J6-ANtXMY7iLpi8XFUcmtB3rBixvUXQ@mail.gmail.com/
 
Probably best to remove those WARNs as well, both for consistency, and
because the reasoning still holds for those two references as well.

There is already enough information for the kernel developer: the allocation
failed. "Go investigate, it's easy enough to find out what happened."

No need to print out warnings.


thanks,
-- 
John Hubbard

