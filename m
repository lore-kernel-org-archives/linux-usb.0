Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010025.outbound.protection.outlook.com [40.93.198.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843841930C
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090459; cv=fail; b=bEdaEnIXg1a7hLIIi896jerImhDNys808K61Q3TbZ4PpuSLub6IUWVTXnpfGAHrKjFo4J8fhulY/qNK7OU4ZJyQjGJ7HUF2VYvhNMX0+Tkr0rV9V5Ju2ViJYCkbz0AiavdLPJp26ZmMshUt6q+PhSZ38i89BlM16BBxqHRpM1bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090459; c=relaxed/simple;
	bh=Yu/XMPUEcKgsZneXqU4iqItBP9ZwWbnp/I0TTJG/EgU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HiQyUcMOb3WaXxY6vWIDNjDzUE1X6FhtP+cQcTbD0dizolwaBcz+f2FUNM3RrbRYMqe/R7UgOai2kquRErbcK3QimXcHdMSuAgUQT0T0m42QogxY9uU+kpSsCFxjUZCl1to2KjrOV8owgp3HyBo1Fk3BVxvcIfG8RkkGNt0QgpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3HfA460Z; arc=fail smtp.client-ip=40.93.198.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3HfA460Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzitGTlzqBpbu6ym9xZv3C8YUU3WZeKNS7N9iCfGvesk5xP81APP3N5//xc2Bor+Fmm3gzKr+yUecA9zFlL2fAUCz4hgf8iJpQHkOdluhiHzrHfBPEQKE5M2bfUDT4dRA5WEjMsPA38Kql7qoDo6fy4ovwZiNizjUKa2KioO/pDVO7WRlhnvqEPpzj6r+0LyrpbKFJJt2JrILWPIEANqt8lWvaZgfFwRJR5RXv7AcieR5B4EASzfEMGCclSj70+tJHl1MENT3Ugiad6M98TrZ8qXXmPeI11+NRZclBZ5t7gJ9K7sPoWpwuXjtqY6H0HHJYT+fRaDYj/+P0tLfEwbxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu/XMPUEcKgsZneXqU4iqItBP9ZwWbnp/I0TTJG/EgU=;
 b=rHmUadashvvYWtFi4YwPBi0jImlOsalF1zpvTMB7to2/bTTeHANdEcrGqSs5YgCgV9ac4jZ3zdzykglj4nZSh7v2hVbVHq6DK8Y3bmj0qyI2QBKa6EUPG60orVt1/Z0AI16BYiF/afKHFgwx53n9d9crq2da8T0Nh6JL6JyxVs4z9Dho7Prg0ZOnTcnq08hFb6AC4Mg/76KweyJcWxXX75dv4erw5WFLJtA8kqfAdUyYNTXVp1hKGFl7jOSkxvEc+mMCW+E3KtbTlF1H5dKk2XGccAbdNJ0+4snolbDmnfhUYQ65guWpnZlsHgJultobHhNJefEiO2JKKkz3mufMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu/XMPUEcKgsZneXqU4iqItBP9ZwWbnp/I0TTJG/EgU=;
 b=3HfA460ZOD4QAmbQetvXRmg2uqOmn9MGN38ZFXGIEo+9XlNLHNgKIYGlUGy0CwzKhjzn2focUxFMFgy8yfCd7C4y7okAHbCO5kzoaHmMYMcOwwZnui0cp27Rs+C0ob2W5lvos9Tomck1h16XdvfIo5tbai/ywdhMSgjDkQzMK6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by MW4PR12MB7358.namprd12.prod.outlook.com (2603:10b6:303:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 08:14:04 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 08:14:04 +0000
Message-ID: <ba04fed3-e2a2-4f64-93d1-48eb9539eada@amd.com>
Date: Fri, 7 Aug 2026 13:43:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v3] thunderbolt: Add quirk to reset host interface
 on DMA path teardown for AMD USB4 routers
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
 linux-usb@vger.kernel.org, Mario.Limonciello@amd.com,
 Sanath S <Sanath.S@amd.com>
References: <20260806125929.1238914-1-Basavaraj.Natikar@amd.com>
 <20260807061628.GK235112@black.igk.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20260807061628.GK235112@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::11) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|MW4PR12MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: cf49f590-6e38-4829-7c32-08def45bd7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CU3aM+Ic3oHfY1YWOBdfXvuaHHGqATlsmrrzJ6CvR6/6HAwYh/mJdkykqJ6DZCmjFqY/rgCL8Gio6wIB7R9x/b6YqqCeUCt6s9GaHkjU0KYb3KUsKLTq+2tzVPSsnWHSZ+ax80wIwQF4ZFhRrQr9ImN5BJ7NFY39ClXvmlxpeZYXsZqmZFHY15re5zRd+vJN7jAMiF+xFwJzy9Zpgmq9ZywiUppDAScZBwGhWrBzeI4ua83yzgnWG3g82vqnfNATYXyGtmr3yO4SO6t8rvci938Vv66sr1tqlrUuRUi8iSj1qmLOUWK76K6DkSSgXPKcK2FHXm+X1gv4JxQIKxzFT+ASjB0qPMWVI+xegPbA7GXUVdq9cK6q6Lhdaid6ilXkawb3Tq/FJccXlj4dB4rCx6EJBAHR0gmCtcSbAD1gEK304+8kcX7o1I++1aaUhmt4QMIEQkImvH6pkjI/nYwzDu3mCYeVyb6RGTybDHjdPkEFbqIheNMp7BXqVbuKped0qwv5X2o6ZTbUt52u2+P/fTskkMN5HPUL7/6DSaok9fQ3N3IN7StxjvzeMk6SeBV6GluQil3mxUg+jrf9LaegSf8EmgU4ywCx2qlOYix6YCjbwm4l2MbWTeJMB8RVLSmH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXZsVmlnbkdBUWFqK1hwdnFPNWhUQ05Edi9ESmRsaEozdVZBQ2h2S01NSlg5?=
 =?utf-8?B?cXBKbUVxWktPM1kvVHlrK1pIdkZwQ2RMWTlIbzhtdFNZTHMrZ1Y1eFdzeUM0?=
 =?utf-8?B?b3llMmp6Tkk0TTQ1QVZsWlcxU0FjQVdQZzJJTXlhWWhvMCswdmhibTFVejVG?=
 =?utf-8?B?ZGRES2hKZXh5WDF2UnNqbk9NMTU1T2VKOTNkbHhVTmVCUzhnVUxNV3YwSU9h?=
 =?utf-8?B?cmd1ajF0VUN0SUYvUzhIN3ZJaWZLMituaUNzM2FLQ1lteEt1RjJCdUtHQ0dM?=
 =?utf-8?B?aXVqV3VrRUdBRnlDR2JWS2lTNExIMmFOU0xGaERKcS9iT2NCbVo3YTRIS3Q4?=
 =?utf-8?B?Qmg5Y0VKbytEVzlwS3kvcWtidk1hV0I3YUZNYVh4d29iQXpHQkRwNEdhb0JS?=
 =?utf-8?B?bkVxcThhTnlFbFFZYkh3eThNY05uaktBNVRFWHpYdkpTYVhZMk1rZHdKZTcr?=
 =?utf-8?B?UlV0aWxMZ05hdERlYnQ0RS96N1NRQzNDTDY3VDhuQ0FlM28vR3dZWDJSaUxw?=
 =?utf-8?B?c204djcrWFRaUDgzSFQ5TCtiM1ZkNTRqcFVEMjhEYW5QTFIyNWluMlJlTmxr?=
 =?utf-8?B?Ym1BakMyUTRBNkh1Ym5wVC9GYkZwaktSeU9FUGpFRjBYTytva2g3QmhzNjFH?=
 =?utf-8?B?bGNHVU40ZUtZWkFiSEpsdnJZMFRIUU85V1UwQURvUmZ2Vnp3RVg0YmpoZjhF?=
 =?utf-8?B?M0JkYUJzMWhUVzlFekI0WGNJbUYyd3NyVTc3c09pRmk2amE0cjdJYWw0SzYx?=
 =?utf-8?B?dmIzdFZiNStWcmY1cmRua3pHZDI3TWkvMUcwZmIwUGVnN0ZxWWcwVWl1c2Q5?=
 =?utf-8?B?S1dYUHc2R1htVkZ4WHdDQyt6bEpna2RaVFEzTTZlNFZMWHlVSXJuSkI5Z21F?=
 =?utf-8?B?Zm1zRlc2T3NLdk10VmgzSG9SckhYdXNrelpxM2lwWlNPK21PL2ovaGg0ZlRS?=
 =?utf-8?B?UlhLb0RUYWk3ZUhLYnZsK2dKR0tXRVRqcWN6MjdQMXlTbHc2eUF0eStNdlV4?=
 =?utf-8?B?THhKZVh2bHE0aTdGMEhPcmRQQ2ZmcUhnczhCR0hrbE4xcmJVS3hqVVFGeHlZ?=
 =?utf-8?B?amJIUE1URHRkLy9nZlZqd280cHl4V2VTR0NZVnhoRzMyKzBSaWR0Z2srTVo0?=
 =?utf-8?B?ZFl5blVqMEk2czFkZ2ZHeHhuSm5IVmwyQ3NNZFdXdVRDOUJZRzJXSHpZOWUr?=
 =?utf-8?B?SDQ3THdabWtXNlFHVmtNcmVWWm9HV1NVaG1uVGRCZjdzUDlRZktYUjR0SHha?=
 =?utf-8?B?NWlCSUFtYXhoeStHUG9wczVuU2hWT2dmVlZxZkRyelNSTXIrdzQreVdpTk1n?=
 =?utf-8?B?ZGlzQ1hKeVdiZUFrQmtOeWVNdVV3VFlreWZaNjZCRFhueEVZaDk0RVFpTEJl?=
 =?utf-8?B?VnRDTVByTkdQRHhIYWxkcWJmOHlXVUNnbWtlQ0xSbzJCTFdrSWpFaUM0VU1O?=
 =?utf-8?B?NUdDeVVFM2RqblNjQWZvOUFINDJVREduOHhrM0R4VWFTZWNHVG4yUEREWm9N?=
 =?utf-8?B?RDdiR2pCSVhrM2dTUXVPNi9nbXlqRlJNSXdGMlJ0Tml6T2IyTjdzY1ovKysz?=
 =?utf-8?B?QzRVTzNHUThDc0dLcG0yMGY1Z0pOd3E1Yml3emlTdStxNmtWSUk5VEVGVGR1?=
 =?utf-8?B?dWtzWkFmQVMzeTM0aHdMVUxkVStZUGVQcHluemRLb3k1T1hlRlNrNzRLeFNR?=
 =?utf-8?B?YndHS1kxYVpFbkxpNGd6bWhCMEZVdE9VNllYR0V3T2dnQ0lmd0RaanpIS3Zx?=
 =?utf-8?B?bXpRb3BWaWhOa3ZHeER4UWNRaGJ3b2xDc2wyanF2MnJKUS90K3h2WjlmTEt3?=
 =?utf-8?B?RTlyNHQvdDJzNG5odGhXSWVWVzhLT1JOZmZqRjFEWXNxTHNNRnVBNTM1UHdt?=
 =?utf-8?B?Q2xhbzI5VUl3djAwa3JYem5iMjNoRGdMZzkzK3ZXNTFpNXk4ZjkwMkNRMitF?=
 =?utf-8?B?RlVjdzhYTWJzTlVTVVhhWU02K2RtYmx1UklNYWU1TEJwUXJuL2pnajRVcDVo?=
 =?utf-8?B?WEhmRWVqWUdzMCt1cHZaZzFvRGhCa0h4elhjNTcwd0h2Ym5XZnRINmtHelNT?=
 =?utf-8?B?djc1OHY3dytIbXZUQ3JvTzI5V3pmNzA2VStGTldYN1J0RGREQ1RmUHBHeldm?=
 =?utf-8?B?amxhK1pZM281SWlhMDNwL2VGdnRZc0NucGdIYVZVbmpkLzlNL2MrK3Q4V3dW?=
 =?utf-8?B?cTY4RjRzbmNZRkZPeHhrRXRGS3Njc2R3QVRsRE56L0ZSMlNGRkh2YVVId0FC?=
 =?utf-8?B?ditpVHZlKzUwbm1HM1lDbDdMa2ViNWtjOFhsM0pzZEdiZVplRk1sZ3ZZZGl2?=
 =?utf-8?B?aXFnYVJQcjhPdEhodWFjTWhsdWw3Qlk1UDhzektLUWF2eG5WQ1I0QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf49f590-6e38-4829-7c32-08def45bd7bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 08:14:04.1295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zez0xFVA4aYmv67JNbA1ACnEDlDFrn8w8tv4zoZ+vzlPRLWcioKb1+74GjJf0kCtYOgMC8Wobx4JBSC0TzhGAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7358


On 8/7/2026 11:46 AM, Mika Westerberg wrote:
> Hi,
>
> On Thu, Aug 06, 2026 at 06:29:29PM +0530, Basavaraj Natikar wrote:
>> Some AMD USB4 host routers have a bug in the Host Interface where
>> DMA path setup and teardown cycles may cause the Tx ring to hang.
>>
>> Fix this by issuing a Host Interface Reset on every DMA path teardown
>> for affected routers. The Host Interface Reset brings the registers in
>> the memory BAR to their default state and clears the End-to-End Flow
>> Control state, preventing the hang condition.
>>
>> Co-developed-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> I did few minor cosmetic tweaks and applied to thunderbolt.git/next,

Thanks a lot Mika, appreciate the review and the tweaks!

Thanks,
--
Basavaraj

