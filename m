Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28E54C33D8;
	Mon,  5 Oct 2026 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219064; cv=fail; b=BqCOPIacz9SyZTg/HIElzZznp6W88EzvDs3R9tO0cnOt08GYcwXmBSFiXOtawTZ1MNFBdbsFTOiLm68+ZeDS/GNVdCEsCvImy0SZ2NnPxkWIxoNupMtwm26i2pooiz66Ld6Vb1P7UGlQyyU4hUquab4Cqd4cN7h7YNKdVhxsH+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219064; c=relaxed/simple;
	bh=klMcg9B20Ox15l5HCuc0nXKSkmI3LHYliL0S6foxG7A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r1RL+8hCvDsECUNyrzosnOHANFv2yIIQ5BFLonglODviO7YfY8Yx8VbHM6MZ+CSapMZcj7QHfUQRAQJNh3lEPGObK8XVqPqw3q5nA5XIboS3wLEX0NOUeeJNnH1EAknLSPGi1+k2NLUx7onAQVGjsytYSg8qYF3XrBprka0rHu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eVLsFep0; arc=fail smtp.client-ip=40.93.196.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eVLsFep0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHVtJCg9uTzNLSgshdGNDOLPloH1UgnH5WKMjb8bJYBVI9sLNdgZeus5x6D7Ai9d997Qk7xnvpdTXeCaXgmxJ6lKKuQBSSK3jOBxhLby70mPAtF1tk5pXmMAOwJqwkVUKOhWqEIKeOJKoSGSz83rd8HPp8UzuGqluOVFYvE8acLhJIv8Dj2B2JV/Kl/5oOSUPn2msj1yZ4x6KrJP3nH+AV1SMlkmev/OMGnRt6J3sdwBPyoj51S3kisopniEZbge7P8wOllY7kYTb+rb4LR1+C0z/J343on9+rb0KbFjcp51RNT1JmY4YNtOz4qzdcJ3jvsrw8jfbGXyCflNlCXcDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlOzOv6W/QLtU1IupRu6E8N7ux/KYq+FY94KWCaJTd8=;
 b=GYpfaAovJoxfgxZ7rmVfr44pL780V1erFsnatyGra5OaRG+g6snl4rbcv9dxuID0PSWr0PWgc0RE2k1rfjTosLcZbOwZo67XQn8j0YRJZafNnV+VwHNhMx3jinPrM+yBVBVe8zYa5wcZczl/swsBrO82w5TjQmERSLghYbEdESkexCv3GuBn39YOdjt+zhgAcTosDvNokB7o5oq7Ech90uN2MKB5TDxHl9mshyPb4DiGbFPZIWhucEqOJ0omwXbQ4IH6jf2oSixvHXWp5PCqFMtA/sagcIPkRpZHR8pgcef4Vlp4DpycH5xOESbeWqwy6x2WQyg8bhwD/2VZOgvF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlOzOv6W/QLtU1IupRu6E8N7ux/KYq+FY94KWCaJTd8=;
 b=eVLsFep0yBtZPQWXsS5+aAhSuEwtsM+aEOSVSUAMaQ+7Qb14NrB/2C2eJleVaiJ4P3nWYlwv7y2FmjuFth64z8q94+Qj30GjRgGNBMPAzU8UMCZSYWKLxa0ZcK+A3lRjGgF1tffvED8/TWpIdbGn0caSkMW00yYXR5LrslP/Qpc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) by
 SAVPR12MB999145.namprd12.prod.outlook.com (2603:10b6:806:4e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 16:50:50 +0000
Received: from DS0PR12MB6559.namprd12.prod.outlook.com
 ([fe80::3f99:f532:cf6b:ea46]) by DS0PR12MB6559.namprd12.prod.outlook.com
 ([fe80::3f99:f532:cf6b:ea46%4]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 16:50:49 +0000
Message-ID: <19b787d8-fac9-4925-b17b-f66d5ab8e940@amd.com>
Date: Mon, 5 Oct 2026 22:20:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] thunderbolt: Reset the host interface before reusing
 a DMA HopID
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 Mario Limonciello <Mario.Limonciello@amd.com>, Sanath S <Sanath.S@amd.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
 <a7e066c3da8e1a92fb018008861775b33909ab0a.1790854235.git.Basavaraj.Natikar@amd.com>
 <20261005143535.GM176164@black.igk.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20261005143535.GM176164@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::28) To DS0PR12MB6559.namprd12.prod.outlook.com
 (2603:10b6:8:d1::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6559:EE_|SAVPR12MB999145:EE_
X-MS-Office365-Filtering-Correlation-Id: 2236d1b2-e3d7-4f94-0e08-08df2300cf48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1vj9R6lriCnLUbpdt/zH4oBraP8y8VBF9SK529aj9iF1eUf0E3hTw1Vyn3PHMwXvsnhijPS9qX5W93tRB+DYV9PP3j9GfThLavveFwH0R7b7GgEmTWYpGtQIG4EM/cc8UUh5jYpyt2MxgfXxXlwSHC1JTwWnPDc4kJzzq493J4HIbWraIjupPZRJGULl7Lbck+BLRkks0ssRpWaQ5CvTszCo0MWmxB6NKzE2VEOOnS0dp1fB9b/SGBQ+lQgPVFhS72aQtpwgBLL/XOG8mfhbjfEWaAjV7mzPXuBSIhQjw+eXQWPMYzss7YtuKIWVBjLDpvQofPKi+DYUAaJNCcvgBWL3ofkAbpGQIXIxpjg6U+9xkatHz0d2kp37NGzDYVtqWaRgVgf4+erxOW8/g/aCVPrBswiHYano4lCzzKZkbaT/V2tkSkUf20rAtzEmhMISQ0cwZfR0HhVDr1F7NkLSUk9vGA6XNzhcBa4V79+G+FPv4hyUQlQ70i3CHC/Lwfo+uXN3F+9Q1dluaMy6VXct38NvC1gZUHh53bVRjCoZdlITKRoKf1KGsBc3Whyb5h2aNOmvw/6ee6aJNDFyfcK+8zSXOyWv6fVH8XjFnD5zoM0ShDEiwEbya3e8BgJhMF5bvbJAwbCHJRvXVgtP0/INd2x99fNysj1KxpjgrhSQmO0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6559.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekhzZkRGMFBTMVIxR2xwT3NWOThNNWRWNnoxdEFPVFQ0WVh3eUd5dXJ3cndm?=
 =?utf-8?B?OEZ5YVNmVEEyTExoNEd2UGRma3pabDFYdDZJYmpsa3JYR1ZCaWFDbkQrV3F1?=
 =?utf-8?B?RXEwQmsvcjZrUDlYU2l1RkJ6eFNuYzZSYWg2UWtZdTRTdzlUL1lUclIraTRx?=
 =?utf-8?B?ZlgwYVp2TXRKcHJiaGtGZ1Q5dGdxdXNCWVBEZENPSHgwMVlYMmIrOHFTK3lI?=
 =?utf-8?B?dUpMUktJQi9kVnBKdjFhaHhqa0pRUDhpc0wxWWVlK3BVUHRwZlFOcTlnVnZC?=
 =?utf-8?B?RlI2SVdKM0FSVy80WCtXemg3ZEZpWlRJVW5lSGpEUit3bFRnRS9EcnpTc3F4?=
 =?utf-8?B?MEZZQ2lCYzFpZE5HenlpcHJXMXMzc1IyQ1RHT2plcTFrVElqbk1panhSOFA2?=
 =?utf-8?B?SWdJTUdYZjBKV3ljblBNWG5Bd2lqT0czQkltc3BsSStEeHM0V2cvTDRzTVBL?=
 =?utf-8?B?RU9GaEg5SzNhc21GRHZpNFVlQkNESnc5L3NaVlVBb3dYbXJQTWxxWE5PaHNi?=
 =?utf-8?B?WWpqYzlNQk56eHdYTEtNZC9wanJxeSt0dE9iWkNMZmIwZGFFQ0JjK2dGZEN5?=
 =?utf-8?B?NHVlcXdDRmxlWEJPZWtZYmRWSXhsV01rd1RJSEN3SncvbVZxK3R5QTRydFAy?=
 =?utf-8?B?ZHVWd0dmRnF2dHlrYlNOSmMxM0F2VUFZNnhuZkR5cnZmQ0RXM2F0b2RvbTFJ?=
 =?utf-8?B?aFhaSHNKcUNPTnJ0bElmYVQzcG8xak5OQ0RIRGFKVks5VzZQbGUxcGdjNEV4?=
 =?utf-8?B?V1dJZU4xSHZGa0FLaHRsL2RPWWk4aVVVVjBieEZtc3YzNEJ6UUpyRStmSzJh?=
 =?utf-8?B?cHRYWWFydk93NFdhL2pVbzdocGcybVJkczNkSG1oRXl0a1hRbk9tL2JSbTBl?=
 =?utf-8?B?NFFyZnhWVnBqQzdIbmY5R2M5WExWRUFlQVNJY21BWGFqZVNtdjAwYk5wR3px?=
 =?utf-8?B?QzZjL0lWd2FKREZJZzZ1Y0dKMEhiWFlPSEhhZXZoVk9CRk11WE9qM3BSdmxz?=
 =?utf-8?B?dFlpanhYd1JUdTF1R2crRjcxMUJBRHZpN0RuRlo5TkQvOVFqTS9VeGd0S2k1?=
 =?utf-8?B?V3UyNXBxSWk1Vy9MaFVmTUtVVUdpVEc0bUpNYnZpWHJqdE9Jb21uN1VQY0Zk?=
 =?utf-8?B?OVBRdm96QkJ1dVk2d3Q3bFQrZnV0aGMwaTRJelhzeHJkK0hveEIwTE1QZ01D?=
 =?utf-8?B?am9OVFdzZW9JWHBLVXg0dmNmSnpoNWRzNFRUTjNpTjJmM1Iwa3dGL0Y3dHVl?=
 =?utf-8?B?enlkR1d0LzRZWHowYTA0Z1lid2FqUW5GN1FLTk1iT0JQeVM2eWFsbEZ1T2sz?=
 =?utf-8?B?WFVFb3ZxOUFOOEhYNUVsTmZLWmZzYTBGcHJaNUlncWRQK3pnU2dWTEdraGln?=
 =?utf-8?B?ckJHZW1BV3RneVdQd3BIWlNpWFN1SlJKWExCL0hsdVZJQkxsbTFybkl0QkVx?=
 =?utf-8?B?Nmx5UUowakppS3NwMW9nWmJkK2VRS1Qvem11eG5ic2M0anI0ZnFvV0JVQ1Ix?=
 =?utf-8?B?dURwbzRMdFpZamNleTUwcDFhQ0wvSWpob21sY1U1ZmduaktjdmtlanpDLzdC?=
 =?utf-8?B?WEtOZERzNm1oYjd4ejQ0Tzd5clorRS9GcmVUSitQNVZHcDNEQzFabUN1RkdE?=
 =?utf-8?B?YWM4c1JkWHNKUXZvdUUvV3dCS0xLbTFpSEF2azVhNExRbmIrU2VTZkF0NGM4?=
 =?utf-8?B?RU5YYmtUN01FdzV3NW5tTVRWVzUvZVk1dE55bEp6c25pWWFJZ1Q3V1BzSUtp?=
 =?utf-8?B?aXozYlE2V3NhQjhrTklqS0N1TUVEMnhuZUx6K0taUnI1aWJ0T01tV2hnamEx?=
 =?utf-8?B?MWpmSzd4RWtBQWZWT2xMOENzeEpjZ2Z6VStFc3BmaHdjYWpLc3NTd1NxYUg1?=
 =?utf-8?B?Zitxa3E2cC9Vbk16TEI1cWRuc1VrUWpBdXBkQW9JWUd3RlRRRzh5TER5ZVVD?=
 =?utf-8?B?Uzhxa21NN1FXNFJHcHYwNndwcUxmdk5BL0JVMExob3hRYkNISXVYR1NJMFZq?=
 =?utf-8?B?bVo3ZHpZdjFiSXB6Q0kxalA2U2cyUEt4dWU5eFFBVEhMVHlmT2JKSXhqelQx?=
 =?utf-8?B?eTlyUXZRSFo1aHZYbkgyUC9EZjFBZWpwU0xnNUdsK0J0MndCbWkxRkpHdFJ4?=
 =?utf-8?B?WkVmcDFscjVPd2hCcDdMWG1KY2VJdFZoQlhLczVnUll0THM1MUhEUlF5eTVr?=
 =?utf-8?B?Wkl4cU95Y001aVJuQjZqZUE2MWhIaklzdE1RV1laVWtyNTEvZnFTSmhNQ1FP?=
 =?utf-8?B?SGlWcmxhd2tiTmpVMzNocnFNcGtrRG5GVWE3MStrUU5YOWVkZXJmTXBVaWVt?=
 =?utf-8?B?NDNmVHdscldsTkxqS003WHdqQTl6SW9FbXhRT2MwWWRFRFZ5NHpTQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2236d1b2-e3d7-4f94-0e08-08df2300cf48
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6559.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 16:50:49.8399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzlbdid09Jvngsc6JACX8yAn6zvdz9v7NJUUzBNncPx79Bn2h8bjrgHXETKMEjnvTl/3qev6MLVE1V8aFRTlkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999145

Hi Mika,


On 10/5/2026 8:05 PM, Mika Westerberg wrote:
> Hi,
>
> On Mon, Oct 05, 2026 at 07:13:40PM +0530, Basavaraj Natikar wrote:
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -17,6 +17,7 @@
>>   #include <linux/iommu.h>
>>   #include <linux/lockdep.h>
>>   #include <linux/module.h>
>> +#include <linux/pci.h>
> I haven't looked at the code at all yet but this one is no-go. We are
> trying to make the NHI code generic that can work with any interconnect,
> like the controllers on ARM based SoCs (aka platform bus) and that's why we
> have pci.c for the PCIe based NHIs.

I rebased the series onto thunderbolt/next
a93a8e3200002f0c345fec4c340390e9a60aabc7. The reworked v2 removes
the PCI-specific dependency from generic nhi.c and uses the existing
reset_interface operation instead.


Thanks,
--
Basavaraj


