Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012034.outbound.protection.outlook.com [52.101.48.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F71A4C10C0;
	Mon,  5 Oct 2026 15:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213215; cv=fail; b=RmYoUya/a3D4cfHV1z+9gh0UuOpyBPb0AMv+8pVdndTFpk2KhKUk9xH0tvmeRaCmvviDmU33gdoYgXbTEvQWGv+Y3kRYUKcaZgn2C8+gJXhmoTVJsNTUSHHlQA/w+eGJITdS8MTt7i2oehhMQ0FGupIBrL9A4FMuY4SktbjjDJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213215; c=relaxed/simple;
	bh=23S0ui+kAgUjTzlf0KBNM7XubJa/RntEI748ONRr4E8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=orzZKOm525F+fbFPSfoItk1PttUFiDFfmbQ4TrHnG8nYE3Y0Z2ZVReEalOVmlD7mz85cgw1OW0mcnk/EAmQWylsNcvZX46MMYeLWeTyeYpWgmj/eQd3DsbQ+3N11ETViRZMd4xPArYxu5H1BvXqxYp7PBwBtkDa6jhe2BDftBu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NiclNz5n; arc=fail smtp.client-ip=52.101.48.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NiclNz5n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmCniTm0b6PVWd6Z0CCv6aGBvUkkjxgUDkf5n67yPxkmSYkcbNycVEfFcFIA1YtnMXZZ5OB26Xq5kCX1mllM+DDLpMZGqc37+1ed8f+fqz81UPlcm+RfdHigdkNI6w/0AkFayLGZ9aVHAkqzF3OE0gxIWRU6hMbEUYfIfG+vMGjfHDM/t062Po9dmr2zlwRGBndob9AzP8YF97DIGODIICusxUEA98HfI88IMjPYQRrh+lKRlZEWuv1TW/cpMVVRLiPg769ORLCx2ahmr8Cqn6+6XqKj2KNoXC/9k/jLuknpW/BbLwsdNFfX1SNrrg2CWIC8lRDSg0uPqSDjU29M9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+HH2q0+UMRkmy3AXHgn4Npcw9Z3flC8iVMsMhi0PNk=;
 b=s1/DsgRXBuxgSdVDgFiVxpVIww08VkVIKcYbT5CjbV4kF5pJnwrrz5iNobviGX4MQImhEQOfpnJ+SDxuZggLh/5Fk5PPZITK0TUM3O6LTryZKLzToxY3lhbZnJcjRJ1+yirW8yt0VQBldJPTtVpqHilnnz/d0hNBQ7T1zWyGpMMZQtWUEP0fWK82r3TCeNBBVvQi5EbeMhSReKmoPI9PUGOvEMXV8x92B9iQ4e/SZzTqRK6pZlU6eyxiAFqquIGlWkxRz58m7nHRI1XFj6j4qaS+dyQQIIbkTvMTLDYOXRKdnGkMup2ATanS9pjgp0SMgNU9hRlguEd6m0/rFRLIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+HH2q0+UMRkmy3AXHgn4Npcw9Z3flC8iVMsMhi0PNk=;
 b=NiclNz5nIIrYQ8Ppohsu6g9K7JJItfQZwZN9udVAgKsDJUg9V8S7YPYddZJkQuitVyziHF5a8PV+GZy4JK611Yjem6D0l7NsTjB6CjmpqAyFi5KxOPMMeB1XqODJhJUy63uWPuMJnvyFyvbL/l1EKllxuvgAdSNcPOdwpjKgDVQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by PH0PR12MB999089.namprd12.prod.outlook.com (2603:10b6:510:38e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 15:12:45 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 15:12:45 +0000
Message-ID: <fb5486b1-1a93-4fbb-8e6e-e4145665714e@amd.com>
Date: Mon, 5 Oct 2026 10:12:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] thunderbolt: Reset the host interface before reusing
 a DMA HopID
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 Sanath S <Sanath.S@amd.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
 <a7e066c3da8e1a92fb018008861775b33909ab0a.1790854235.git.Basavaraj.Natikar@amd.com>
 <20261005143535.GM176164@black.igk.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20261005143535.GM176164@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS1P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:8:44b::12) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|PH0PR12MB999089:EE_
X-MS-Office365-Filtering-Correlation-Id: ba89b8c1-fa46-463f-bfe0-08df22f31bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|11063799006|56012099006|4143699003|260925022911599003|260925021311599003|260925021911599003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OphNOpzQf86om0Beh3PzxzTV/JOWVCWpuOIdjQfGK4J+9hpuUMt6/y6enhEdiXO/RhHkioF1GSiVBFUHg2NPitv/sxYTaVlN5HjO2gmLFP+CYvgz3b7VG41lKV5seTM+BZhOBNH/vqpCuV3crOhgPCI7OyPC8TReHcVcEejAIg4YhfLPZwtTuFjA7GPQTRChZelwWEdjPxubnvUP4dvR8St0JkE06g4aoBJeJFGUd7sdoed3j8yDNoHnfCYS+TtfOuLS2oTiXuVDBocgmV5VsBbqUFr+lDR2l09ezk5sgFR65ZoAlBWXgoeDOJ1pDVnqpRplY+xifEt5gYZKOBNxUhUYDBu3oZ8jOypZOCtgc/zLsBmuU7uu6pEzLCqT1d3o9IVAjorAnRJ8/5gKi1lKo9wfOToQSo53NNyFrp4EJVU83trvzScEDxcSHDU88hA62YTCdj4v41D1hJjKJDXY8XSuCbxKk+ryri88cfz3ePbSfBsWbzPxZspTWciWu7uaM4IO5Ud17XJxf8mr+++XYb+Oho/Zyg9Fvg4fwE2bry+ATRA8ZaZ5lKAlwQeP0hFtjywkKFhmJc8ZmPLyDNgUcp+jCBKMi0+NE7v695zxVNivQhIPvQY7gd6fzWqNfa/T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SldVSU0yYXlYckMzVU9KOFp6YjcxRy9ZRnlndmpURVRQcURVVWp2Z0NWakFo?=
 =?utf-8?B?dngxK3FhaEJ3ZjdyUGQ1M0F6K3V3TkMraTBBUFErUStlSkhXdzJ4TklhZGx2?=
 =?utf-8?B?WThiSWtCeGhFYTkxa1hGVVRObVZqaFBwd2p2c2w2TGdUWlhkZ0lKa25JdzhO?=
 =?utf-8?B?YkRpR0RRajhGTVV1S2dQa1V1aVdRV0FQaGdKQWx5KzB1cWlqMnZMRHFTWEhr?=
 =?utf-8?B?ckFXeTNPQXhWbkd6b3llU25oR3ZJemxYbXBXNkJsZ3gzaUJyNnJnTno3alU2?=
 =?utf-8?B?c3p2TXRMdWY0T1Fybm1Sak1pSC9NVU02YTV0TkJ0YUEyWlBXTTNmWktGY0tJ?=
 =?utf-8?B?dnZwbUpDWHhnWklVbWhpcjZhbzQvVmxtQnhzcVRvd21xMHZOQTFMdkJwL0tZ?=
 =?utf-8?B?U2hXQkFCS0NvOVVYTTZtRU1Cc2Q4ZjhHdTRZbUNPNjU0bXBzN3pscVdBZjMv?=
 =?utf-8?B?TFllTjdRQ3ZvazBEemQvYzRXS3RVcXFtYzVBSGdsUC91UVBrWVlObmYzNlkw?=
 =?utf-8?B?b3Vsay9HSTlSNUE5c25zTW1nMWwrNGpWeFMzVUlWNnpxL2NON002emhDblhi?=
 =?utf-8?B?SEtYTi9VUnR4UzlKcjNyaStiT1ViMVQ0WkdIYWhkNjhEN0FnT090S2kwVTJJ?=
 =?utf-8?B?ZVczaTdWTDRBdkZxSXZUOWZQWkd3MEhPeVpLS0NVSmNjNDFad3M2cG9yV0wx?=
 =?utf-8?B?UFZPdjdmdHZvRmQvQUROYkJRK3doN2pMbnVhRnRLRGhpMkw5Y2Y3TjN0VnNS?=
 =?utf-8?B?dkh0WDhQZ2EzYnBJMHRZQUg0MzhBNkFVb3loNEZENkFPSUNoemYwQzdCMHZW?=
 =?utf-8?B?UThTZnN2blhFVmRyYU9kamRLdXF2UVZ4UkdLcTF1N1F0YnFQd3VNWWo4dmJk?=
 =?utf-8?B?TWlySWFacGh6S0JwN21DZ3diQ0M1WUU4YzJGVXdkNEl2MDl5YkFaMll5M0Nx?=
 =?utf-8?B?R1VRUkNRU2ZRS25lczdwNXpGQ1hwNzdvNlEwNUlrSXk0emlUSGlpRllPR1ky?=
 =?utf-8?B?T2tvdFlSdFNkbFFnTjdYS05SR2htaG52NkI2NGZPeXpSMjFIVUlFTG1xRStD?=
 =?utf-8?B?RThldk5WNkZMNWZNQXZlNm4vcWhMZHFUQ0dzV2xIdDV5NkxrUWxaaC8vUWFX?=
 =?utf-8?B?ZTh4Q2twZldPTkk0UGQ5RGxXbHpiazVzVUtycDM0Uk5aM29vd0t3NEV5QjI4?=
 =?utf-8?B?c2FpdG1Xd3JEWlk1OFI5QlVtZFJteE5VSjFMdUR1eTIvKzlzV0I4czZNOGpp?=
 =?utf-8?B?UzRKaUl3RnRqaXM1NTQ5SmFTbzNaVGxWUEhmSGpRYi92NitwNFNGZkFPcjZu?=
 =?utf-8?B?cDdDaVliZmdBNGJ2VkI3Y0NIam1TV0p0TWlIMnBENFJsTUVURGxMZSsrdyt5?=
 =?utf-8?B?S2J3VnVBQ3BBVjFyK21acWVad0VMY1kzVWxYVDI2Wk1aTlF6NmYwem1kYjJL?=
 =?utf-8?B?RkVYY0J0dFhtMzZzcGtxa3cvQWNzdDgrUVUycURXd3FVazNqSm1Ed0xQQ2NO?=
 =?utf-8?B?bEY5N3hVa1RFdzRsTTIwc1dWdThESjNUNnE3eFhwK3BJN2VTL1VmZFI0TXlR?=
 =?utf-8?B?L0VnLzBpdGZFUkkwQXg3SzMweHdTQUJOcXFHWXBoRTF3MDA4VXdIS210RXEv?=
 =?utf-8?B?QTh6cXNENFFWNHpRcFRLdEtJUEZGcUI5V3Noa2JudHBsaE8zOC96NjUzM05x?=
 =?utf-8?B?VkRhYm5La21mVExCb04rSTZVUTZXTkJoNU4xTTVpWnZScEFGQXA5eFBTNFNy?=
 =?utf-8?B?RnREdVE3T2RnRmFWU3o0SzV1WlJ5ckg3UDlDNkM4aWV5MXkrYmUxRHBFMi9L?=
 =?utf-8?B?MkZKajNYRDdkSHpnT1hhSDZXZGJxMjNGRE9xdVZqUElIai92OFpWVzJEdUVN?=
 =?utf-8?B?ekNSNmVUQjhtWkxZQ25MT0c4TzQxZnA4OERLc1VFN2pSdTRJd1VZUU1YQWdh?=
 =?utf-8?B?M0VYTVp0VElqTDFMVDFxRzZheUdrVEVUYWVIRXd5RmZ1Zzl1TzFRaVByOW1Y?=
 =?utf-8?B?MnJBYWVRWXRYRjMyd2E5cURQeFI0TStsUGV0dUduTUQxUVZlSzh5M3YzSHZs?=
 =?utf-8?B?ZjdLeXRFRTEwZzNHVU9VdnZ1RTdXbHlqNjd2VFJPWWo2RkVqMHNOZzFoWHN2?=
 =?utf-8?B?Qk9nNWhUWUNndW1wS3lQMGhpdlNQdzBDZGV6Vk1TOG5OOTZtZ0gyUlhLblZC?=
 =?utf-8?B?cG9mVFppNnVUMWo3Z1d4UjlNQmNrZTJxMC9qVDBXQVpNWkpXLzBqQ3MrUEN0?=
 =?utf-8?B?ZUd1MitKLy9QdVZnUE9OYWhrRTUvOEFQN21oUndCU3diU0FCVXc5OE0wYkY1?=
 =?utf-8?Q?LRHuC/ZLbHNAxXQ1Su?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba89b8c1-fa46-463f-bfe0-08df22f31bbc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 15:12:44.9238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RinNAbOssblOhFZj5h3KUf4bcCTqEdiRb7luJaL1aajikcX2wA6761opoKGUYUvmb56H+v0VpHMiZJqqQvpIIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999089



On 10/5/26 09:35, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Oct 05, 2026 at 07:13:40PM +0530, Basavaraj Natikar wrote:
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/iommu.h>
>>   #include <linux/lockdep.h>
>>   #include <linux/module.h>
>> +#include <linux/pci.h>
> 
> I haven't looked at the code at all yet but this one is no-go. We are
> trying to make the NHI code generic that can work with any interconnect,
> like the controllers on ARM based SoCs (aka platform bus) and that's why we
> have pci.c for the PCIe based NHIs.

To add to that - what tree did you base on?  I tried on thunderbolt/next 
(a93a8e3200002f0c345fec4c340390e9a60aabc7) and it doesn't apply.

╰─❯ b4 shazam 
https://lore.kernel.org/linux-usb/cover.1790854235.git.Basavaraj.Natikar@amd.com/T/#m2e70efa2f627df231d9f975424096587b819a354
Looking up 
https://lore.kernel.org/all/cover.1790854235.git.Basavaraj.Natikar@amd.com/
Grabbing thread from 
lore.kernel.org/all/cover.1790854235.git.Basavaraj.Natikar@amd.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 5 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH 1/3] thunderbolt: Allow tb_ring_start() to fail
   ✓ [PATCH 2/3] thunderbolt: Reset the host interface before reusing a 
DMA HopID
   ✓ [PATCH 3/3] thunderbolt: Add quirk to reset host interface for AMD 
USB4 routers
   ---
   ✓ Signed: DKIM/amd.com
---
Total patches: 3
---
Applying: thunderbolt: Allow tb_ring_start() to fail
Applying: thunderbolt: Reset the host interface before reusing a DMA HopID
Patch failed at 0002 thunderbolt: Reset the host interface before 
reusing a DMA HopID
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: patch failed: drivers/thunderbolt/nhi.c:17
error: drivers/thunderbolt/nhi.c: patch does not apply
error: patch failed: drivers/thunderbolt/nhi.h:123
error: drivers/thunderbolt/nhi.h: patch does not apply
error: patch failed: drivers/thunderbolt/nhi_regs.h:115
error: drivers/thunderbolt/nhi_regs.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
