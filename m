Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF42B378832
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986367; cv=fail; b=CEyiZ32FkD+NVv/m1EcZH8sYRiNPi8WSJ07xhhezL01+zPN4xq+VFvjYSzB6/9yfiO5u06aYLuMoSJgYAsqcIQf3hH7+TaX1d2EptSdx2PxzEoBaxFqpzCmso/ML6cAdHEZ6oqXbaA8RqE4rjPmreWucUPmpLrF5yUFa/3T+Lpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986367; c=relaxed/simple;
	bh=kqmH/45a7OFMSHjRzB6mrSbKGA9wg7zz2Ap0yEr18b4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sq1m52+l+BUuejTTvacS3fRcQyFBgGa5mxMWWhi9B4skR9o3I2wlrmPpGJRDlD9HPMefHLhlHMEluNT+fJH3dBDWwgBILPOs38HBeGg+HMAQcDOh3iXg9kwP2JxdJvKf/smOE+bewRsRBsxIVI1xHCU/xochUf2sKbMx+eove6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rbwJPCZP; arc=fail smtp.client-ip=52.101.52.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rbwJPCZP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xzqlxkupn89MkujiPBKMIZZMQXfExi6cqsmxuX6IHJheZNdGNJlhvvi4+pC5mBy3LIPJd41J7MxZ0Tyiu3+QYj4NVsXoMf6vy7mnrZN8FMnlCkELxdyMhuhDrU3EwiUG5/YvYudHNOR7MgKwuEixNMlFHTHZvuH2g+iOk2ivSgueO4qXoCzA+09T6gtV3aPOHP9woasjomaJtXykLprBmT+DeoXU/iOFHrFPBvfkkjv//5wDvhXWQe7upEuzUKWUnGZFZMqFiwEZG4zs9HmYr7AzQJq/C+lxRphGhVcN3YMnPYt7LOtOdTJcA2qLf7FMf3ntuJJIdiGQ50JZ4f8Mtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5BK9dhSAP2Iau4PD6zvM4kPNCgD3+cU/TJwnmCr5pw=;
 b=ifqpGzkKuWJFWGMYDJwFEiysTa5yidcfNBbBWeu3OcOk+W6Fp5EwZ+lXItOfIKO6rMOg6521YM6JUJ0O37OzI7dMoYpAZWmGkohiXVzvSZeVgsgixvuDnjN8SUj9pgEcBtnWwK08O8QA4huGTw3Qreli+ytu/6ECN77qqZeUznmR/cOOX4x6pRoSCeNzLNbSbHSK5gFn9md03pQjkYwz8GlT3m0cqBkeARD8Cq6PLnNjZ68+C6O6pqA46Y4+3zilQwsDNgTKoH19UBEhBpNz/xdCZvOdDO+nmsmvEqIAHSPvOLFPiRwLZXGJSvAEULKAh9TNn8JW5HuyEVznsimjuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5BK9dhSAP2Iau4PD6zvM4kPNCgD3+cU/TJwnmCr5pw=;
 b=rbwJPCZPIUaJpNCfuhsCupfinDAxZ4SR/KXcA/B6WK6I9eBP7bft5xlkuPTG6QjphQEUivbWW36D3UylZV/V3Ks0pFQyD2t6XkUWDWG4970d8Wt7CISYGuI9DIJACcxWt+e/1y6BwPom//LOztLsKYgkV+AnberLU58gPO9cUcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by PH7PR12MB9256.namprd12.prod.outlook.com (2603:10b6:510:2fe::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 06:26:02 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:26:02 +0000
Message-ID: <0e482be6-3b60-4322-8554-53c48a2aa629@amd.com>
Date: Tue, 9 Jun 2026 01:25:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Assert downstream port reset on shutdown
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
 linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
References: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
 <20260604050326.GH2990@black.igk.intel.com>
 <d80346d3-692a-4982-859e-5321c4ec022f@amd.com>
 <20260608064020.GJ2990@black.igk.intel.com>
 <a7f333a2-d594-4e1e-9cc5-265aeda8e5a6@amd.com>
 <20260608152201.GL2990@black.igk.intel.com>
 <9010e24a-afa0-4ede-bde9-90299f062dbf@amd.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <9010e24a-afa0-4ede-bde9-90299f062dbf@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0274.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::14) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|PH7PR12MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3159d2-cde9-46fb-6090-08dec5effa38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0WU5gz5uDXOymLafdS50xBQ737yekjESpJUxn6NGfNoarsQsK12XTSj5zfEho/Wp9Dgg1yJz6nNY0zMERFDxuy+GVXH7H0MLWrI40zrGviNTRSNRN3Ex1JB20PcWR5X5u1GLKgGotXo2XjufI1AGXma6/IUuyMC7Q2SuaCycUoGWlMaUJBcrPFSGyzCuyXM+TCqo9JIRzoTXIoRhI74xescKyomBksh80Q509oS6w1THNCSkJGIPPMZFCyS4vq8LQB8W4nWAojW5ZaB/0w5L+TNXvo5HTo4mlQTgyYUF4IJxCaPKySQABq/MOP5bFAzlfqb1Qd15lLVtwepsD5qgiTdWtjxSQmlUzs79M+m8WLNPOFn/bwtrnxQPeitQfKsN0TIG9VH2dDlrHPOW3uySEQO9C1JaY4zvGRgUC7LvNjHVgENuPIJsc4awAgoLVoam9+QjE/6m67/5zl5G2V/7RM+GF9HI/jYU8vY44rd2ddP4Qpm8YnFrtH4MtRjBCGrxKS0xiEm3IEgwtBaAjMec0+WmCmjT/RJbUTagxBk5DLwMii5Jpoevka1k/fSA/nYSHD2FODSjHJUN0KFTX8ZDFCiti+ObIoXkyco1tJo20Em3z/xmzOktSCY9OGjoKkwlCjhJsKnVqkAuBn9k29gSNAbWPBpR4MAW9ZYQLC86B75vj5GfACAKFe+rIOoZdejJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE44M21nWnVCZ3BCdlpMR2NjV243LzN6bWx4YndVQzB0NzZ1eG1aWTE3RXVS?=
 =?utf-8?B?YUFQQTIzMW0vWk92dHc4NkJKc3J5OGM4VENNcTJkNzBlWTRUZ25RTkd0dURY?=
 =?utf-8?B?ZEtodjNHSmNtbmtkN1JwSU9abzNLVnJoN0EvK0d4WFI2dTVTalNoUGw0aXhE?=
 =?utf-8?B?bEZwak05T1l0RTJDa0J1TE9yakFGS0N3VTRWUVlMUzJqbGRDRVA1WXlHRm91?=
 =?utf-8?B?MWcrUlFaQmE3di8rQk5kQVNpYXhlWDRERXBXN2djYlY5NnRJaFQzN1ZiN3pY?=
 =?utf-8?B?M3lBb2FYcGE1YWJhak1YdUpUNHZELy9nMkJqSHJBWGpSaXBzMklMYnMvRWVK?=
 =?utf-8?B?WWl2WGJvRy9COWMya3pLeFhzNmplTGpnaUw1eVlmTWhuZHJZd1NMNzMvUitB?=
 =?utf-8?B?Mk5vU3JSeVZrSnJiUkNKYzViK2IxMWRZT1AvTGUreGEvczJadkREMDVWU3VS?=
 =?utf-8?B?WTFqeTJ2d3F4TXNUWG9FSU5HTHIvSHhTNGhaanpWbFZMRGozWU5GY0MraFhG?=
 =?utf-8?B?bE1Fbm5INGx1Ukc3VDFBS0o1N0RUQktFRHFZMTY4cy9IV0szVi8xenFMcFdh?=
 =?utf-8?B?MmRRcHpGaHBMdkwzbFgvVjJrTW5idmNyT1VzdkVXRG5yUTlXaTdKdFZVNnZI?=
 =?utf-8?B?ZlQ0eVFzZHdBVHdFek8xK0hDNUxQWkhpNi9EbEN3dUY3ckNrSUwyN2U5N0tz?=
 =?utf-8?B?Slo0UGk5WE1Nak03THFYQTRteWM0ZjRGa21sV0M4ZmVqMDFkY2RkZEtlUTlM?=
 =?utf-8?B?TXNGZ1h5bnBwMDF2WFcrR1BOb1VRaEhUMnhhNXlHMXBPaEdGMlBuSENEMElH?=
 =?utf-8?B?WStsR2lkbWliV0hnbTkyQUNsa0lOL3BaVzZwckYrVnBkbmVtWnFvcUxaaUZP?=
 =?utf-8?B?V0E0V09KVWVWeC9oTm5pQjVjcEF3Rk9YSjdwMGgxcHF4UythZVBKOVgybFNr?=
 =?utf-8?B?RXpTNlNqTkN0Z3N5ekFuZVVJdjJzbUg3NDhRZnY2TXAwUHZtc0ZEL3I2bE5t?=
 =?utf-8?B?dmpuY3YxNlhkOWhLZEVoWHl4ZW9jL2E1dFFVR3d2V3ZHWkFFZlc0Uk9Xdk82?=
 =?utf-8?B?REQ1dXdyMlJhVHdLMjRwZXZudE5IWmVpS1gvaElwd3l1ZWI3Z0ZwUG1HMU9z?=
 =?utf-8?B?STd3SjY5TjVXYkl4LzBzb2dWVmxtWGExM3JBSmlsOTNNU3lwV2NXZHdHejhP?=
 =?utf-8?B?RmtxNk5SdktTWDRORHM3cUMyTGh0c3FoTGN5M3ZQNnRaWG1lM1hZWGpEY3B0?=
 =?utf-8?B?NDV6YTZCOWFndVRpamszNXBKMlNRNWQ5Y0hqc1JxeTJGZmw2YThNZTNxZjBS?=
 =?utf-8?B?M0lQVFBrV2hQaW55NGk5RlBFU0RvdlE3WENWbytMQ3YzcHN3QkZGSmZ1bjN1?=
 =?utf-8?B?Vlg5NDUrbHFSeEZ2ZGF5ajhCMVBIVEZYL00vcGpPdWtGYStJRDhZRlBleDY3?=
 =?utf-8?B?WEI1RmtJU1VkVWg3L3Vrazg0QmlJdHVMKzVyeTFINlROZHFtYkFvK3dIdktx?=
 =?utf-8?B?dnZVaW42UHBaR0NySE9FdGtjRE5mTVVPQzV3aTRIbWpKVGNucE9JTGlPbnov?=
 =?utf-8?B?MERXaTk2VGJrV0REVVNQSkw4ZkpIaGZpazh0S3QvaFNMb3lpMHNnRndnQUVR?=
 =?utf-8?B?QzRCQ0lYS3J4d2M3eEhLUVNmY1BCYkR4VjJzcGxFN1NZaVRwY01WMUdWdWRV?=
 =?utf-8?B?UGV0UHp5UU45SlpJQys4Z0xZSzdpVENIMG1RcVRkMk93WkIxc0RPa0RCdlJ4?=
 =?utf-8?B?RUpZK0lyeDE5ajRvbkRFMHpXeDBEY2dhd0MxdXE4UUkzKzhqYzBrZWV0ZUll?=
 =?utf-8?B?dDFUd1U3TGlab3VlaDQwd2xSRXZWUW1SWUJWcHhrdHFkOXlQalNFRlR2cG95?=
 =?utf-8?B?M21FWVoyeVlneFFxTjF0TXNvclBvVDlMRU5USW9ONWwrYkY3VU9YamRuOGlF?=
 =?utf-8?B?WVJiSGxoSEZQNEo4N0c4Mjk5YnhsRXA1QU1PdU9qdHF0aGJacDk3eWdnL2xv?=
 =?utf-8?B?NHJ6U3RpbmdMcmdYYTFDVUo3OXR0Z2hoanU4MTlXNHVFT3puaGRxbVlyK2pX?=
 =?utf-8?B?c2JLM0FUeDhuOUVtbW5JcThISURVWC80NHQya0RPRG9lNnp5S1FBTWtlQXpv?=
 =?utf-8?B?a040YW91eWt0NGpuWHlVSU5EdUJFb2NPTDF6ZndpcmZhaFRkZXE3N0dWbEk0?=
 =?utf-8?B?R1V0clB0c3c0Q2FMZUxuK2pUTi9wRjdiWnduRnZLRmdqd0svWkM4M3AzdUh6?=
 =?utf-8?B?QXE0L3JTQVBMWEV4blVWQ1pCR1N6ZldvWWM0YXg1cGJmQWFDTkcvUVlEcHp0?=
 =?utf-8?B?SUFPRFNBTVJobDBIamtScmJqeDk5dXNRRjdrbzh2Z1phdkJlWGUzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3159d2-cde9-46fb-6090-08dec5effa38
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 06:26:02.2938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KilK3a+/JsUDYRck5HjCg+sQkwY4B+TicPYCwp1YFZJKEkUJtJ2Go5V/0uAJAJ8zjd6BSrJ0nXK0O3hHQpxuMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9256


On 6/8/2026 10:25 AM, Mario Limonciello wrote:
>>>
>>> I guess I see two approaches.
>>>
>>> 1) Move to shutdown only (your suggestion).
>>>
>>> Corner case of user who unloads before shutdown means they could be 
>>> exposed
>>> to this.
>>>
>>> 2) Link the DPR behavior to host_reset module behavior.
>>>
>>> IE If a user set host_reset=0 avoid host reset on module load and 
>>> avoid DPR
>>> on module unload/shutdown.
>>>
>>> If user kept host_reset=1 then do DPR on unload.
>>>
>>> Always do on shutdown (regardless of host_reset value).
>>>
>>> What do you think of #2?
>>
>> That sounds better. Also we could restrict this more for links that 
>> are TB3
>> e.g no need to do for USB4, assuming that is simple to do.
>
> OK thanks.  Basavaraj, thoughts?
>
> The way that this was found was by looking at the traces of what 
> Windows and Linux were doing differently at shutdown.
>
> Maybe before we make a decision to tie it only to TBT3 we should 
> double check if Windows was also doing the DPR for USB4 too.

So the traces confirm Windows only asserts DPR for TB3 and not for USB4
docks, which matches what Mika suggested. For v2 I will restrict the
reset to legacy TB3 devices (skip USB4 routers) and fold in the
host_reset changes (the second approach).

Thanks,
--
Basavaraj

