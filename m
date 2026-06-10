Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8803A32861F
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091190; cv=fail; b=Y9AxkP1Y/Tp5zZhhc3GyjcXxWoQtBTJ5vkQlHj6XqXCqfWU9Qg84GPutmFabJAWofvCT2Q7c1aJEiHfx1QIMvwp5w3gTEUnOs/GBHmnQ5IHPNFLij1aKhhGKIkh0u4ToguYeDoJygKGIOLUL1e83f33rZb3fr6k1KTcmgDoZtl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091190; c=relaxed/simple;
	bh=k+oPLSHwHeTnNoJrzhQCRWm5IZezYEz7DiKfYq7HBBY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PDkoXgrb9Lx5taEtBabs5yi+ln6Ye5K3sxivdSxCf06cMogIOsdAwCL7bNrw96EEO6FKXiNeRcFkQu1ntH2U7RmbG4Ws8MzFnt4Jpltf8bEcjMcs0X2iSkKxHSFZnTq6sw2CerI52Wh0vNc6A+NPiX3vnUiX1pwCjFWAnmWd194=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=paQlL5nv; arc=fail smtp.client-ip=40.107.209.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="paQlL5nv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gt8YkK54zpTTI8m0ajzPY0BUQohPpcaOi7p+5NVqO2YSx924+KyiTglD49XdrZBspF7OeYi1mLhKgJzxZhjtLbpjwqCC111JqBUICVUjynNvZ2Bw3ZU0pgUMcCXT/nfO8hJp+otzDb2n1FRIra4pzQwcEAmVwVZY5eKO58yKnE4fjTKdEhRqmc4oxs9rJpoLYoyoYoGn0JancI4RoxSBnRAIBLvD9JCeJvv0UNd9MUwth8+ohekmz/19jOUlM01L8eCHUSQze7J9tLVo4r+GCMQg011OLGvgWCxtOFndA0Ddm9iYwaL9xOp6b83gNjmzCr57jxNztPkRxOohIOm4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHPSuOx6NvZB2ojB6l4ORsq9h8pPXkKCEjA2wEoLsH4=;
 b=Xsp7eusxYs1dFiI9OsjPvnrEPWJAtGBg3woGz/gwYIm6k87yI/RjxI0H6sJ0FVCdqVgP8fkMsP0AoJCFNOe2MmcwKJUcgpc1UD1yfeswJYioeWVeRlMhLAd/4TOT0K16JN4egbSI+u0BI3TaZ/GG8JuWtdUTlZqfgwIWRTzkXSzGWrIxS8lh0E0vipGLDhFClULCkzp2iMzfghEpyrm2UIrcvO81/vNhfIWfcE1rklwukQ3ukKF2P2GM2eSDWsTBMum161yiyjc4uPVcugaHzax7sBbjlYnwumQ0S1WgzbVw/fCnuGyYdOp9is5BE94Nt8QTfh+j7imdr0Yqfwj6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHPSuOx6NvZB2ojB6l4ORsq9h8pPXkKCEjA2wEoLsH4=;
 b=paQlL5nv1jep3QPhBPbeCBzI1zcZ6McMp+1pJ4qdRdIkRAUHZpPfZg+0HIT3S3xHUJH6t8tlXYjFvdAH4vqoAnKMCvy0KXlrjQSEvVb7ybKGCUCWU5RbEzX1WJaI7iTFoWu5h4Nbh/tVbIGL9msdle/SeFXshyYCiLnzJLUW8aU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DS0PR12MB6488.namprd12.prod.outlook.com (2603:10b6:8:c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 11:33:04 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 11:33:04 +0000
Message-ID: <5b14d6df-bbbd-4c0e-a276-4cf8d370d097@amd.com>
Date: Wed, 10 Jun 2026 17:02:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thunderbolt: Assert downstream port reset on shutdown
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
 linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>,
 Sanath S <Sanath.S@amd.com>
References: <20260610085006.3735139-1-Basavaraj.Natikar@amd.com>
 <20260610105717.GQ2990@black.igk.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20260610105717.GQ2990@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DS0PR12MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb0f9a4-dfd3-49c5-f28b-08dec6e4090b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zuc8IYZu6Mowemu3FTGp9a/jc+Jj/+y2LEJrTigkaGtL0+svPW8y5aKjeHbmPWKKtf4oQ26qzYggMH/jYmYNCiTMOYB6vHurVlT3a/k++kz6RNuL4AwCpecz9R/QOs0kvv0SkqaMdB7M8OhytCthldimtuLZFRhhIL3GsFXgJ7dVDKFC8ZaSV2sz+b2nxMCImJJrx3uTM94N0knSDYm7YIcd7aAX8Q6j4PgNsxYu2O8mMqqLKzd9+65KUVXEPPIASTFlN9ZZ6QqkWMvuI1qKGgKUHy4kzuW1o01icU0mHQqxEnDKT0fFl6/ubc+fJTq2Ex6O6/roPilJE/uKpensAQnniWnbS3m3v0+wryf6iTb/k8aHUwz6hQYDzhKgRYAjo0xmpSzBy85C66jn4X3gIbbvnHz84MH5xI516is7mEz3FLo0pil0HKnwxWeqAjOQpz6Y544GAkJIB1hSc9m+cqSnKZXWn0R17L9/QlC8z9Enljq8AjbCFBiSbCUoAO+YuFC0SdDp7F3Soz3x8kqmLf8F5JeqbICUMGhteOc1FeHprnO22aMUyNBNyMaSoUM8DYCZ2pJRNFg3TIzWgPIyI40MOnnHsT2zqrbCsPkzjFgazVKQToYxrq33SbahThezKPT1Qlm0NE8io1ZhfCeb/hbiNA3WDv1fqG5b5WT1YfJn75Chjtm4v9G4Kw1VZwDZ+IXaJWpWup0xtMmHj4GgKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFlYbEdQVjNnRFB3T2xXaDJGVmNkbGYzYm9EaVhHOW9UUFdoL1pHQ0ZDTVJj?=
 =?utf-8?B?ZklKV2tYRkd4RDhUVVRyV3UycXFHYkhacFJwb09NMXM5RWF5TklGN1pWbWpF?=
 =?utf-8?B?ejNveUFFTVhCaWdJMUtoU0ZxeUlFVWYwckFJTE9oVVFMdkErSnNJd0pkMlBm?=
 =?utf-8?B?bTlFTitUNjJqVWdMb25raUNrMmVwZzM1VnZVTXNGWnRxbXdmY2xHdEtmV3p4?=
 =?utf-8?B?TlJydXNORWQ0RmFUVVpCWjFHM0lFSXd3djJKT1V4T2VLa1JSUmlzTW8vcjBC?=
 =?utf-8?B?by9DbWg2dGhGL3p1VVZEb2JTZmNRUmpEa2VJRzBrdXkra3FISUgwc241UEt6?=
 =?utf-8?B?amRiTWZLeGZlbEZ5TVhUdUxHZDR5RVYwTjYwbGtHT1BiUFcrdTd6L0RZQWRm?=
 =?utf-8?B?cFU2V3VDSjF1M0pEQ3VaYjVFVHpTM1FaelYvcUZxZllTR0RJT24wRjhkaGZ5?=
 =?utf-8?B?TUxidTNlM1Y3bHJwQldaUHRYT01hQUoydmxhQjhmNktWNVNKNUN1eVdwM01D?=
 =?utf-8?B?a2Jyam9YSHA4dzBETFhOUHNqS1pPQUI4TzFQVFF2NURFcmtNZ3gyVlc3ZXkw?=
 =?utf-8?B?THZTOUJlWHFGNTdqVVBTL2dnMkpUMWJIb2hUUGdWM05qTlZXdVhHTktvSTVG?=
 =?utf-8?B?WGJYNFRVN0J0UGdTd0RQSkgwcmd5aW14TjZqbGQ1YllHbXN0ZXRQeDdJT1FD?=
 =?utf-8?B?ZUMwS1EzTGpzYXBRWFZrYlJLREVzRDhGSFRWVXNSZGpTalFGK1F0aXFhUXcy?=
 =?utf-8?B?bnIrZE9GcEFub2RtOVNBU1NnU3Q5REt2cVpBOWlYUXVoNEkvUFZmZmQzKzV4?=
 =?utf-8?B?SFQyUDc3R042cE4xNFIyRVB0b0FKSlg0cldtNzBhVnZCUkJrOXlWaUxVYlVs?=
 =?utf-8?B?VWErOTlDYXBVWmd4eTVLSklDd3F4RVBrb3V1T2ZqMVRlMzFxVmRQT3E5SzJx?=
 =?utf-8?B?T21EdXlQK1Y4emZRNGNFMjFmcTVOQjJkd3V3K3QwK0JFYnFsdmtPZnhsNm5O?=
 =?utf-8?B?UFZibm80QTZSNWd5ZDN4VWVZTE5VeVU4Z3JEOHdMMms0Mmx3QlowVkpUWTh4?=
 =?utf-8?B?Rk1vOWFuejU3MFBLN0JsaUcxQ2ZHZkNkZms2MkY2cGEzeXAyN1JYdURWeUsw?=
 =?utf-8?B?WFE4NkxOWmtNYWpxZmEzMmkyWlJjT0R4QlJLaVBSZlR1NzJ5cGphb1FOMnlK?=
 =?utf-8?B?N0pxb2FjVytPZGc5bHMvMGtscHY4MGNWSGZiWVVrdmh3QXB3K2djeTVpMjJr?=
 =?utf-8?B?alBNazlDem42VEcxTnd3ZjZXaHRYK1cyaUxmV2tqVXEwSGVwbW1CbW50NnNz?=
 =?utf-8?B?VFJ2OWk1VFZYR012S1dFdXFRdGVKUFlxdUJ3dURSSWlqNEloMVlEUVYxeWI2?=
 =?utf-8?B?Q0RDUytCV2ZTaTIvYzJDSUovU2pja0JkSHNDc25IUmlsKzdxRWswOTJkT0sv?=
 =?utf-8?B?VENLZ2tTSGpZV1luZEdWeUJiMEM5bUpqVDBNRnBvd3E3azNBZUgxaUZSMlRp?=
 =?utf-8?B?WGF2Y3NheE9vdzY1UEZLeHpmdytQS2pPZGhmT0lkT1ZBOGJzQXFwNHlROGZ5?=
 =?utf-8?B?cDVKblVyTGZVMVFRZFdEY3JjUlZ0emllKzNGUUhOY3BkN2h0NU94bzBjdDRm?=
 =?utf-8?B?a2dWbUpNd1h1bC9HdEhSNEw4eEltczdhNjl4enJVc2R5d0ZHbWlhOUY5cGFE?=
 =?utf-8?B?THZZY2ZhQUk1UXo1REZEUUVjVFFDcW9NbFJ3dzhORWNKY0VuOHBrWm5vSlVC?=
 =?utf-8?B?anVKUHcvMVhzM1cwWnRsVDV2bjlHcFA0UmlPU3UybGY3TXJDN1pKdW4wVFhI?=
 =?utf-8?B?MlZmWndBdlRNOXB1VU5DVjdMNVV5NXQ4THpPMUp5WjdMcE9SMUtjS3duOUo1?=
 =?utf-8?B?TGJNb0NqQ1VnTk1IRVAwVWlNbzVJSVNFVmVOK2lEK09iNDJwR1hvcmdzNFFD?=
 =?utf-8?B?SWhKQ3U1U01RKzlkRk0xanJ0ZzNHK0xocUhETGNtWHNidnlGOTgrWnd4Y2Jv?=
 =?utf-8?B?N1hDNHFtRGJKNEZJQWZ3N00wb1JFbnNvRjBhMzJsVW04bGtMTmkxTUJRQ0tL?=
 =?utf-8?B?VmpoM25QQjJUZW8yTTRpUWNwUkhrL2VjekR2UmlUaEFEZkFyM2dFMFcxK28z?=
 =?utf-8?B?b2Z0LzdySEc4NGE4aTR5dFZWamR4THhyYlZhdDc4TjkweFYxcnJ3cTg5RXFQ?=
 =?utf-8?B?QTYrWHRhOWdhbkh5eElDYkY5aUpEZW5ENVpNZ010a3VYRDViQmRWZ0J1aW1s?=
 =?utf-8?B?TnhtcGNaQTlzdUhGNEJ2eGdYQVIvUmhEcVJ4Q29tWXhueEdkZk5lUWd5MWtM?=
 =?utf-8?B?bytuVjlQNWo5RFpIckhSZEwrdHN2UWhPUWdUUmxRNkYwb3BrZnJZUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb0f9a4-dfd3-49c5-f28b-08dec6e4090b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:33:04.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdJCF1Sh8MhBY5cIMEpppanKdLlxTZu8zlgo4NjdOQ08cbJm01sICr9G9SZfBRF1wiQGxPIOEOzKnP39F93hxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6488


On 6/10/2026 4:27 PM, Mika Westerberg wrote:
> Hi,
>
> On Wed, Jun 10, 2026 at 02:20:06PM +0530, Basavaraj Natikar wrote:
>> On shutdown the connection manager tears down the router tree without
>> signalling connected devices. A Thunderbolt 3 device directly connected
>> to a USB4 host never receives a disconnect indication and during shutdown
>> this can cause polling the dead link for up to 60 seconds. On some
>> platforms this behavior leads to a warm reset instead of a shutdown due
>> to this timeout.
>>
>> Fix this by asserting PORT_CS_19.DPR on each connected downstream port
>> before tearing down the router tree. This drives SBTX low (USB4 spec
>> section 6.9), causing the device to detect SBRX low and transition to
>> Uninitialized Unplugged state immediately.
>>
>> Always do this on system shutdown/reboot by forcing host_reset in the
>> PCI ->shutdown callback. On plain driver unload only do it when the host
>> router was actually reset on load (host_reset=1), since in that case the
>> tunnels are not preserved across reload anyway; with host_reset=0 the
>> tunnels are kept alive across unload/reload so the links are left intact.
>> Restrict the reset to Thunderbolt 3 devices.
>>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Co-developed-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>> v3:
>>   - Rebase on top of the thunderbolt next branch; the PCI ->shutdown hook
>>     now lives in drivers/thunderbolt/pci.c (nhi_pci_driver_shutdown()).
>>   - Add kernel-doc for tb_port_reset() now that it is exported.
>>   - Move the host_reset flag into struct tb_nhi instead of struct tb, and
>>     set it from nhi_probe() instead of tb_domain_add().
>>   - Spell out "Thunderbolt 3" instead of "TBT3" in the kernel-doc.
>>   - Reword the debug message to "downstream port reset failed, continuing".
>>
>> v2:
>>   - Add Reviewed-by tag from Mario Limonciello.
>>   - Restrict the DPR assertion to Thunderbolt 3 devices, since the issue
>>     only affects Thunderbolt 3 devices.
>>   - Only assert DPR on system shutdown/reboot (the PCI ->shutdown callback
>>     forces host_reset) or when the host router was actually reset on load.
>>   - Reword comments and commit message to refer to the "router tree"
>>     instead of the "switch tree".
>> ---
>>   drivers/thunderbolt/nhi.c    |  2 ++
>>   drivers/thunderbolt/pci.c    | 16 +++++++++++++++-
>>   drivers/thunderbolt/switch.c | 11 ++++++++++-
>>   drivers/thunderbolt/tb.c     | 21 +++++++++++++++++++++
>>   drivers/thunderbolt/tb.h     |  1 +
>>   include/linux/thunderbolt.h  |  6 ++++++
>>   6 files changed, 55 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>> index 0f795ea58756..698fb124d529 100644
>> --- a/drivers/thunderbolt/nhi.c
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -1235,6 +1235,8 @@ int nhi_probe(struct tb_nhi *nhi)
>>   
>>   	init_completion(&nhi->domain_released);
>>   
>> +	nhi->host_reset = host_reset;
>> +
>>   	res = tb_domain_add(tb, host_reset);
>>   	if (res) {
>>   		/*
>> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
>> index bbd186c29ef7..be63a4647b59 100644
>> --- a/drivers/thunderbolt/pci.c
>> +++ b/drivers/thunderbolt/pci.c
>> @@ -493,6 +493,20 @@ static void nhi_pci_remove(struct pci_dev *pdev)
>>   	nhi_shutdown(nhi);
>>   }
>>   
>> +static void nhi_pci_driver_shutdown(struct pci_dev *pdev)
> nhi_pci_shutdown()
>
>> +{
>> +	struct tb *tb = pci_get_drvdata(pdev);
>> +	struct tb_nhi *nhi = tb->nhi;
>> +
>> +	/*
>> +	 * Force host_reset so the connection manager asserts DPR and signals
>> +	 * disconnect to connected devices before the router tree is removed.
>> +	 * Only Thunderbolt 3 devices are reset.
>> +	 */
>> +	nhi->host_reset = true;
>> +	nhi_pci_remove(pdev);
>> +}
>> +
>>   static struct pci_device_id nhi_ids[] = {
>>   	/*
>>   	 * We have to specify class, the TB bridges use the same device and
>> @@ -593,7 +607,7 @@ static struct pci_driver nhi_driver = {
>>   	.id_table = nhi_ids,
>>   	.probe = nhi_pci_probe,
>>   	.remove = nhi_pci_remove,
>> -	.shutdown = nhi_pci_remove,
>> +	.shutdown = nhi_pci_driver_shutdown,
> nhi_pci_shutdown
>
> Otherwise looks good.

Thank you Mika for the review.

There is already a static nhi_pci_shutdown() in pci.c (the
tb_nhi_ops.shutdown handler at line 233, also called from nhi_shutdown()),
so reusing that name for the pci_driver ->shutdown callback would collide
and fail to build.

https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/tree/drivers/thunderbolt/pci.c?h=next#n233

Would you prefer:

   1. Keeping a distinct name for the pci_driver hook, e.g.
      nhi_pci_driver_shutdown() as in this version, or

   2. Renaming the existing tb_nhi_ops handler (say, to
      nhi_pci_ops_shutdown()) so the new pci_driver ->shutdown callback
      can take the nhi_pci_shutdown() name?

I'm fine with either; please let me know which you prefer and I'll send v4
accordingly.

Thanks,
--
Basavaraj

>
>>   	.driver.pm = &nhi_pm_ops,
>>   };
>>   
>> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
>> index a830c82bb905..404c0693df50 100644
>> --- a/drivers/thunderbolt/switch.c
>> +++ b/drivers/thunderbolt/switch.c
>> @@ -682,7 +682,16 @@ int tb_port_disable(struct tb_port *port)
>>   	return __tb_port_enable(port, false);
>>   }
>>   
>> -static int tb_port_reset(struct tb_port *port)
>> +/**
>> + * tb_port_reset() - Reset the port
>> + * @port: Port to reset
>> + *
>> + * Resets @port. For USB4 ports this issues a USB4 port reset and for
>> + * legacy ports the link controller port is reset.
>> + *
>> + * Return: %0 on success, negative errno otherwise.
>> + */
>> +int tb_port_reset(struct tb_port *port)
>>   {
>>   	if (tb_switch_is_usb4(port->sw))
>>   		return port->cap_usb4 ? usb4_port_reset(port) : 0;
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index 76323255439a..b7cc6894a598 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -2941,7 +2941,9 @@ static void tb_handle_event(struct tb *tb, enum tb_cfg_pkg_type type,
>>   static void tb_stop(struct tb *tb)
>>   {
>>   	struct tb_cm *tcm = tb_priv(tb);
>> +	struct tb_nhi *nhi = tb->nhi;
>>   	struct tb_tunnel *tunnel;
>> +	struct tb_port *port;
>>   	struct tb_tunnel *n;
>>   
>>   	cancel_delayed_work(&tcm->remove_work);
>> @@ -2956,6 +2958,25 @@ static void tb_stop(struct tb *tb)
>>   			tb_tunnel_deactivate(tunnel);
>>   		tb_tunnel_put(tunnel);
>>   	}
>> +	/*
>> +	 * Signal disconnect to connected devices before the router tree is
>> +	 * removed below. A Thunderbolt 3 device directly connected to a USB4
>> +	 * host otherwise never receives a disconnect indication, leaving
>> +	 * firmware to poll the dead link for up to ~60 s which on some
>> +	 * platforms turns the shutdown into a warm reset. Asserting
>> +	 * PORT_CS_19.DPR drives SBTX low (USB4 spec section 6.9) so the device
>> +	 * detects SBRX low and goes to Uninitialized Unplugged immediately.
>> +	 */
>> +	if (nhi->host_reset) {
>> +		tb_switch_for_each_port(tb->root_switch, port) {
>> +			if (!tb_port_is_null(port) || !tb_port_has_remote(port))
>> +				continue;
>> +			if (tb_switch_is_usb4(port->remote->sw))
>> +				continue;
>> +			if (tb_port_reset(port))
>> +				tb_port_dbg(port, "downstream port reset failed, continuing\n");
>> +		}
>> +	}
>>   	tb_switch_remove(tb->root_switch);
>>   	tb->root_switch = NULL;
>>   	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>> index ec9192b61bc0..4373336d9425 100644
>> --- a/drivers/thunderbolt/tb.h
>> +++ b/drivers/thunderbolt/tb.h
>> @@ -1103,6 +1103,7 @@ int tb_port_clear_counter(struct tb_port *port, int counter);
>>   int tb_port_unlock(struct tb_port *port);
>>   int tb_port_enable(struct tb_port *port);
>>   int tb_port_disable(struct tb_port *port);
>> +int tb_port_reset(struct tb_port *port);
>>   int tb_port_alloc_in_hopid(struct tb_port *port, int hopid, int max_hopid);
>>   void tb_port_release_in_hopid(struct tb_port *port, int hopid);
>>   int tb_port_alloc_out_hopid(struct tb_port *port, int hopid, int max_hopid);
>> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
>> index feb1af175cfd..cb1621c6b703 100644
>> --- a/include/linux/thunderbolt.h
>> +++ b/include/linux/thunderbolt.h
>> @@ -514,6 +514,11 @@ void tb_service_properties_changed(struct tb_service *svc);
>>    * @hop_count: Number of rings (end point hops) supported by NHI.
>>    * @quirks: NHI specific quirks if any
>>    * @domain_released: Completed when domain has been fully released
>> + * @host_reset: Host router was reset on driver load, or forced on system
>> + *		shutdown/reboot. When set, tb_stop() asserts DPR on connected
>> + *		downstream ports to signal disconnect before tearing down the
>> + *		router tree. Only Thunderbolt 3 devices are reset; USB4
>> + *		routers are skipped.
>>    */
>>   struct tb_nhi {
>>   	spinlock_t lock;
>> @@ -528,6 +533,7 @@ struct tb_nhi {
>>   	u32 hop_count;
>>   	unsigned long quirks;
>>   	struct completion domain_released;
>> +	bool host_reset;
>>   };
>>   
>>   /**
>> -- 
>> 2.34.1

