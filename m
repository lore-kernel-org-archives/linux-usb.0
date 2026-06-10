Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011056.outbound.protection.outlook.com [40.93.194.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3910E3314C5
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110182; cv=fail; b=OboQdi0bnsOWOJdKrRZesBnSRWgwiqt+1NAWbOIvp4dpQFuIOTFUZq9CZ/QIq90AgMQexYL5CH1vflpLA1FKXb3jw1YfFOVVm4sd/JYsy841spvYeABOJirZLessKMHQiLDN2INa948HXxKZwT0gsNGI9s/lRzuwj1I/kVaJABI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110182; c=relaxed/simple;
	bh=BgpyXww68BdPfPxnssw/xsYqba5AIOzR+0jSk5wKHTc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ERNVAvPD8qYC3vyU4ciq2RaL/Ih3zcYT6gpQWj/sGMJ9/m1SUEaMdILI26Eq9rcACXEVLXwHG/mLRQBrjII/BvMg6wIiBAuR7LfSxw4puYMaB8Wm8mnK/qfGpIM9nzzZAzuejcwvxeYAVCLA1MqY2zxoFKsa4KR0XmTaRMufnw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cq9jqyxG; arc=fail smtp.client-ip=40.93.194.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cq9jqyxG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMNlvuOjOeqcYvRKaVa/hxguWDb5/OkggkX2wHG/heSDsipA89g80ki07w9pwi4lj8ka+uc5PdT6fyZ+ecSFI909a6U8sX6fwkGIRA4zpoF/q3xSZ7jKSHx1kHf5zVcwYPYymUEESj15479bdFhZ4Dx2TVaWmF8PAt60xP9s/cLYA3JoHYjleWCo8rAUxksheb8eXRDS9dcU5tOt8Sn25WCcYcp/AqFr6apGNjn154DFKN8cGjJoZIPwg7332O7gXsFhv6EfqpsSJV2XyuXxDTTo9aDjJ3JKKFAMgA2sHE/VhattGBgOptocDMrE8DU4MblheF0+9LNFjODzmKln1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4CvfJSKI/PXRuqWcfuA0z7VwYM8L66ivqMgw3UhcB4=;
 b=xRz7PM5GOdIQf0U18veRhgaVGgllc2H7QFeT5+jnvtzUIJypmH70oTxxPbhGWHTPNheqs0G2VmMQ2hJBywcmbluDQqwMssisOutcs6Oof7AAe6n4wfKSJGZXjHeDMierSNK54QfmJFYtxoYDQXzHeU9JvRo9461mgwYjbtqKgoWH2+A3Ys8ftsIjmXm75akMJbXeJQVuPbSAbDboRNWJ0gqzx9Jd1T+C02yZiV+qIbTGv7fRZ0RQmCBI/6mH818hj9BF8PkeOK98yPP9aLKa97fcYwPZhMMHo+TNkz6kjGqHjQ0OeKxi3jxjnIPLhEawj2DzvoS/0ykLFAfGNeYbKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4CvfJSKI/PXRuqWcfuA0z7VwYM8L66ivqMgw3UhcB4=;
 b=cq9jqyxG+c0mVS+NNe0WlsDL7nbn+qvcEe0DJgfZ6HThBGynqimUs7t6pNIZ+eyxCY/kyDPijWqJ7X14lNLMB+WKcyi6jeT7MPNuzVzHBa0u88JOO5a7s4uG7cH0bsbUO/G8avJMxksenWgXtRBCN4e3VYu2WVhBx90+CacY4yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 16:49:36 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 16:49:35 +0000
Message-ID: <59484ded-53da-4004-9ae8-785d3b89ce85@amd.com>
Date: Wed, 10 Jun 2026 22:19:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thunderbolt: Assert downstream port reset on shutdown
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, andreas.noever@gmail.com,
 westeri@kernel.org, YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
 Mario Limonciello <superm1@kernel.org>, Sanath S <Sanath.S@amd.com>
References: <20260610085006.3735139-1-Basavaraj.Natikar@amd.com>
 <20260610105717.GQ2990@black.igk.intel.com>
 <5b14d6df-bbbd-4c0e-a276-4cf8d370d097@amd.com>
 <20260610115846.GR2990@black.igk.intel.com>
 <ef95085b-8c7c-4214-ad81-1ece2adf805f@amd.com>
 <20260610142317.GS2990@black.igk.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20260610142317.GS2990@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::12) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CYXPR12MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 833412ea-23a9-4b45-365e-08dec7104108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	q56s8hYKq2hscNvYsFXV+Kk8QTRTiBFkHSF4tu46jvImNynKolijP5Nz+acR4MbpjLr5Eggy2KLOgKhDh6qacGrzcJnZDVNMPjQDIPzyJltEwniRwkkTEXFMIu7i8hm0u2wT49e0afhFM8uP9QvX+tQY21qXWO7Vl/B2eohKuq1oFFUxyBbnGGxaNBWeyefh0Pktv+VL25h6GYOPoJ4xXd6X13zWj651ivF3QZYkxiCF+nvK/QdAKt/OJwbvMxv2xEX4YVBpMEUOTbZub2yZ3NhCcSAkikurdBZbujUnWLjh9thplaC2VXHOwf6Bwx2DQ29EnlsqYKXNzzEOTPe6npemdoLZ3AFrwMoB68CVkyKSeSOQ774xF+evAR0XSvhHpiv1tl8jCB4jXNYTk6nzXLTvMrQzQUH0BuOsMzBUEV3wiO3gkaYK4VCXA8Gady1lkFM39YZrDNn36Q3jlXyOaXbSUNpt+Kbvyq6Y30eeoc3nLjk0aGkSuLsud55xRABo74dFGfT7OsNicb9AbAP9+brlK6LLfdtVfTywf02HMNH3Gkq/PjdpUlyCa8unvuGvSiVVOY92tZrJmuATXs9oEzzcKOls0GawX1bm1/WbyA5EF9pcNYZnEmv+tIiQahBxsVGDRjjIBdHCa7xwxAASnnqx02pagPVEaCbb34WLbphaGHfrz+LKT2Gw6xZ/T/fLEEwqVwYDHigBTeBztdlnow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkpRb0dMdXB1TjJyMTdOelhZTHRsTnRtaHBiSXZvekpLODh2cjhpc1BoMFpB?=
 =?utf-8?B?amFvblNGVHNrQko5Smt4YjZIZ1ViRVIwU0g4U0hVSnE5K3JoSi9ydkFhbWtB?=
 =?utf-8?B?dW9kRFpnM3A1Mjl1T1FQbjdSeDRhTFpiaUYxekdEdHZNdjBTanRYcnU0dUow?=
 =?utf-8?B?cGxqci9JOUd3U3lHOC9jSGIzRzNCdkNtL3RUalFrVFdjaG83a09kb0kzOUdX?=
 =?utf-8?B?bDlLZUF4QjdtNXp2bzRrWHdMeWFWMGZRMXNRblpIMnNyNUpVVW9tSkxKaTkr?=
 =?utf-8?B?OUdmaE9NS01pVHFEQlo3NVQyTmFuUmpDVW83bTVEcWtaYW1OeEpzajRVTjBH?=
 =?utf-8?B?T2YvaFFZUGRsam9HV3dsd292bUdYQ3d4TjN5YXdtQWJKbk5MRkxFQ2tvbnFP?=
 =?utf-8?B?MjM0SVZINUZ4d0RadytaYWQ2WjR0TEc1eHgxdXczQnZpN1dRZWxNRFZEd1h4?=
 =?utf-8?B?ZnNuVWlOM2FjUDVrL20zTTdQaHNXZHVkQkx0WWVHZ3NRNCtTZGcxZTJIM2l1?=
 =?utf-8?B?N3QrTTlZSSswMTBVUDBPOXNLSUxLRVVJOFY3N01CY2QrRzNtR3RJWjNmVW0x?=
 =?utf-8?B?VU8wQWVoN1hMai81VXBORWxjcGo3ODlkT1NNVnRNcXNLTUtTbExoSXlteG1t?=
 =?utf-8?B?akRXdVZHR1dwZlk3R3pmclFzZXN2RXV2ZHZUY1IyT3MvR1A2RVNPVGVaTjE2?=
 =?utf-8?B?aFJhTGxUQUtIS3lpNWx6NUJpUXIrUFdNYjR5VmQzcFdyRTBUMVhmdTBtZXdI?=
 =?utf-8?B?Tnk3U3BUdzBRWC9STXZYWCt6R0hwVk9QRm5FTHAvbHlvcEV3b0lzQlZrY1RO?=
 =?utf-8?B?L3VvdG9jWXh3clhxdFJJRjNqYWV3OEdDeWxmRDc2aTJ5R0tNWktGS2lteE5F?=
 =?utf-8?B?ODgyVjU3WkgxeHZob3cxeW1BWUdqWkIxNThEdFVENTJqU3VHVENSUUxKTW11?=
 =?utf-8?B?ZTNOMUpyWWo5Mk9JWG4rdkZVeXdOdElvNjR5Y1Z0bFVoUEc3QW1uSEwxMzZh?=
 =?utf-8?B?d2JXYmJ1aXBQWG9XTDVnVzhESUhLQUJPUGYvWkNld3NrVVYwZTJMOXRTZkxP?=
 =?utf-8?B?NkM1eUtTeWpWYjVDVWlyR2UzenE4THhHNGJWdVJDQ09tWlN6cWtOb2ZqR0xW?=
 =?utf-8?B?NVh2eW0yL0QvN3NPZmtZbmVSWE15MXJXYVArNFNCTjFyQmlQa2pZUjZIaFNF?=
 =?utf-8?B?anFMblVxN1hjQUJMOGdraVRsaGhraDI2ejY3VnFmNWZMa2sxQ3RBUEhIcUdF?=
 =?utf-8?B?L1VReVltSkV0eEdjMlF1V1JRczl5UGFBRkdTMkpqZzczNWNVczErOFJwbk5z?=
 =?utf-8?B?OXkzZURnN2hDRmZIUURYVkp6alRjdG45VTRudVd5a3QzQTl0U1k1cXhkMGFJ?=
 =?utf-8?B?eFl5R1Q1aTQ3UEhVK1E3djVyaHVlNUcyZG9ub1ZVMmNOU1RhV1pIOGErUFBS?=
 =?utf-8?B?MDNkUU5WMmRIaWVmMGNINkdEeEZwdit1N04vdkI2akE3SXllaUlZb0kzMTdG?=
 =?utf-8?B?OTdsMjlDdi8xZXI4YWFsbXdWR2xVUllIYjlKUzBFR1d5OVBiY3doQzB0bHFH?=
 =?utf-8?B?a2hzOER2VW1jamp1LzJCckhMZ2ozS0JtNFBxUUZVOEtuaE9WTEtpMkV6Sm5s?=
 =?utf-8?B?MExndDd5ZU1QTVVNYUdISlViZm51NkMyUXArcEdxV0w0aE8vb0RMczV1bkJ2?=
 =?utf-8?B?Y05pcjduK0J0U1plR0FlRzQrSm5sbzh6ejI2amdaYXBESmxSN3M5QmhsbzJj?=
 =?utf-8?B?U1JnR1FVZTgxeUZsUkllNmNSeFlteURVS21ESjJhZmgyUHFnRU5GTVBkeFVm?=
 =?utf-8?B?ZFdxUGs4c3p0WmxkQjVjazdFVFg1ZWNmTGEzS1JQQmdmN3ArN2ZrdmkvS3V3?=
 =?utf-8?B?MWluSGNkOXRoaUg0MzhZT0d4SE9xVnM1WDhNY2o1UkJ3a2JnRW1NU0ErZlZy?=
 =?utf-8?B?TThQaTc3TjBEa0cyYnMydldGYXZrUXNNK0ZVSTlBaURnZ2JYbVVqMy9uczZ5?=
 =?utf-8?B?OExyUHZIK2plc1A4YjgxamFrUmxoa1lYdGdWaTVyU0d0NSs3N3hxOVUxUHE1?=
 =?utf-8?B?SVEwcWp5cUgxcit3QWt3Z1JIUEtvaTJ0SnpkNzYvU1M1bjBkMk51QmJxaEhs?=
 =?utf-8?B?YlAvT0ZIcTNscnZzaG1sK2hrcEREZmtOVjhzem9aQzdqRmFOYzd3c2lyZS85?=
 =?utf-8?B?TTlCenMwc09RcXUrc0F1dW1valYrN01udkE4MkltMlc2MmlmSUlndXh3TnE1?=
 =?utf-8?B?Tldmb2F3UWR5c0djeDF4OHROQ2JsSjlyNEdIRzhRK0hkdHRqd0l5YS9ia3lI?=
 =?utf-8?B?ZjM3N1J6OFpEQVlWUWxtUElSWSs5UEhib1JTV0NmcTZ2dHdMKzZYZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833412ea-23a9-4b45-365e-08dec7104108
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 16:49:35.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHF1/JZ7A1UrEPPcza3OkvveNLJml864ILyHhcrJSJYxWgcSHAw/hzrg2Qd1Y+GPx2qQWbmAlVVtptzF6WWy9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278

hi,


On 6/10/2026 7:53 PM, Mika Westerberg wrote:
> Hi,
>
> On Wed, Jun 10, 2026 at 07:02:02PM +0530, Basavaraj Natikar wrote:
>> Hi,
>>
>>
>> On 6/10/2026 5:28 PM, Mika Westerberg wrote:
>>> On Wed, Jun 10, 2026 at 05:02:56PM +0530, Basavaraj Natikar wrote:
>>>> On 6/10/2026 4:27 PM, Mika Westerberg wrote:
>>>>> Hi,
>>>>>
>>>>> On Wed, Jun 10, 2026 at 02:20:06PM +0530, Basavaraj Natikar wrote:
>>>>>> On shutdown the connection manager tears down the router tree without
>>>>>> signalling connected devices. A Thunderbolt 3 device directly connected
>>>>>> to a USB4 host never receives a disconnect indication and during shutdown
>>>>>> this can cause polling the dead link for up to 60 seconds. On some
>>>>>> platforms this behavior leads to a warm reset instead of a shutdown due
>>>>>> to this timeout.
>>>>>>
>>>>>> Fix this by asserting PORT_CS_19.DPR on each connected downstream port
>>>>>> before tearing down the router tree. This drives SBTX low (USB4 spec
>>>>>> section 6.9), causing the device to detect SBRX low and transition to
>>>>>> Uninitialized Unplugged state immediately.
>>>>>>
>>>>>> Always do this on system shutdown/reboot by forcing host_reset in the
>>>>>> PCI ->shutdown callback. On plain driver unload only do it when the host
>>>>>> router was actually reset on load (host_reset=1), since in that case the
>>>>>> tunnels are not preserved across reload anyway; with host_reset=0 the
>>>>>> tunnels are kept alive across unload/reload so the links are left intact.
>>>>>> Restrict the reset to Thunderbolt 3 devices.
>>>>>>
>>>>>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>>>> Co-developed-by: Sanath S <Sanath.S@amd.com>
>>>>>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>>>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>>>> ---
>>>>>> v3:
>>>>>>     - Rebase on top of the thunderbolt next branch; the PCI ->shutdown hook
>>>>>>       now lives in drivers/thunderbolt/pci.c (nhi_pci_driver_shutdown()).
>>>>>>     - Add kernel-doc for tb_port_reset() now that it is exported.
>>>>>>     - Move the host_reset flag into struct tb_nhi instead of struct tb, and
>>>>>>       set it from nhi_probe() instead of tb_domain_add().
>>>>>>     - Spell out "Thunderbolt 3" instead of "TBT3" in the kernel-doc.
>>>>>>     - Reword the debug message to "downstream port reset failed, continuing".
>>>>>>
>>>>>> v2:
>>>>>>     - Add Reviewed-by tag from Mario Limonciello.
>>>>>>     - Restrict the DPR assertion to Thunderbolt 3 devices, since the issue
>>>>>>       only affects Thunderbolt 3 devices.
>>>>>>     - Only assert DPR on system shutdown/reboot (the PCI ->shutdown callback
>>>>>>       forces host_reset) or when the host router was actually reset on load.
>>>>>>     - Reword comments and commit message to refer to the "router tree"
>>>>>>       instead of the "switch tree".
>>>>>> ---
>>>>>>     drivers/thunderbolt/nhi.c    |  2 ++
>>>>>>     drivers/thunderbolt/pci.c    | 16 +++++++++++++++-
>>>>>>     drivers/thunderbolt/switch.c | 11 ++++++++++-
>>>>>>     drivers/thunderbolt/tb.c     | 21 +++++++++++++++++++++
>>>>>>     drivers/thunderbolt/tb.h     |  1 +
>>>>>>     include/linux/thunderbolt.h  |  6 ++++++
>>>>>>     6 files changed, 55 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>>>>>> index 0f795ea58756..698fb124d529 100644
>>>>>> --- a/drivers/thunderbolt/nhi.c
>>>>>> +++ b/drivers/thunderbolt/nhi.c
>>>>>> @@ -1235,6 +1235,8 @@ int nhi_probe(struct tb_nhi *nhi)
>>>>>>     	init_completion(&nhi->domain_released);
>>>>>> +	nhi->host_reset = host_reset;
>>>>>> +
>>>>>>     	res = tb_domain_add(tb, host_reset);
>>>>>>     	if (res) {
>>>>>>     		/*
>>>>>> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
>>>>>> index bbd186c29ef7..be63a4647b59 100644
>>>>>> --- a/drivers/thunderbolt/pci.c
>>>>>> +++ b/drivers/thunderbolt/pci.c
>>>>>> @@ -493,6 +493,20 @@ static void nhi_pci_remove(struct pci_dev *pdev)
>>>>>>     	nhi_shutdown(nhi);
>>>>>>     }
>>>>>> +static void nhi_pci_driver_shutdown(struct pci_dev *pdev)
>>>>> nhi_pci_shutdown()
>>>>>
>>>>>> +{
>>>>>> +	struct tb *tb = pci_get_drvdata(pdev);
>>>>>> +	struct tb_nhi *nhi = tb->nhi;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Force host_reset so the connection manager asserts DPR and signals
>>>>>> +	 * disconnect to connected devices before the router tree is removed.
>>>>>> +	 * Only Thunderbolt 3 devices are reset.
>>>>>> +	 */
>>>>>> +	nhi->host_reset = true;
>>>>>> +	nhi_pci_remove(pdev);
>>>>>> +}
>>>>>> +
>>>>>>     static struct pci_device_id nhi_ids[] = {
>>>>>>     	/*
>>>>>>     	 * We have to specify class, the TB bridges use the same device and
>>>>>> @@ -593,7 +607,7 @@ static struct pci_driver nhi_driver = {
>>>>>>     	.id_table = nhi_ids,
>>>>>>     	.probe = nhi_pci_probe,
>>>>>>     	.remove = nhi_pci_remove,
>>>>>> -	.shutdown = nhi_pci_remove,
>>>>>> +	.shutdown = nhi_pci_driver_shutdown,
>>>>> nhi_pci_shutdown
>>>>>
>>>>> Otherwise looks good.
>>>> Thank you Mika for the review.
>>>>
>>>> There is already a static nhi_pci_shutdown() in pci.c (the
>>>> tb_nhi_ops.shutdown handler at line 233, also called from nhi_shutdown()),
>>>> so reusing that name for the pci_driver ->shutdown callback would collide
>>>> and fail to build.
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/tree/drivers/thunderbolt/pci.c?h=next#n233
>>>>
>>>> Would you prefer:
>>>>
>>>>     1. Keeping a distinct name for the pci_driver hook, e.g.
>>>>        nhi_pci_driver_shutdown() as in this version, or
>>>>
>>>>     2. Renaming the existing tb_nhi_ops handler (say, to
>>>>        nhi_pci_ops_shutdown()) so the new pci_driver ->shutdown callback
>>>>        can take the nhi_pci_shutdown() name?
>>>>
>>>> I'm fine with either; please let me know which you prefer and I'll send v4
>>>> accordingly.
>>> Put this code to nhi.c::nhi_shutdown() as that's applicable also to non-PCI
>>> hosts, right?
>> I tried that, but nhi_shutdown() runs too late in the teardown to be
>> useful here. On the shutdown/remove path:
>>    nhi_pci_remove()
>>      -> tb_domain_remove()
>>           -> cm_ops->stop() == tb_stop()   /* reads host_reset, asserts DPR */
>>      -> nhi_shutdown()                      /* ring/HW teardown, runs last */
>> tb_stop() is what reads host_reset and asserts the DPR, and it runs
>> inside tb_domain_remove() -- before nhi_shutdown(). So host_reset has to
>> be set *before* tb_domain_remove(), and nhi_shutdown() would set it after
>> tb_stop() has already run.
> Ah okay.
>
>> To still keep it generic for non-PCI hosts, how about a small generic
>> helper in nhi.c that just forces the flag, called from the bus ->shutdown
>> callback before the normal removal:
>>    /* nhi.c */
>>    void nhi_host_shutdown(struct tb_nhi *nhi)
>>    {
>>      /* Force DPR on connected Thunderbolt 3 devices, see tb_stop(). */
>>      nhi->host_reset = true;
>>    }
>>    /* pci.c */
>>    static void nhi_pci_host_shutdown(struct pci_dev *pdev)
>>    {
>>      struct tb *tb = pci_get_drvdata(pdev);
>>      nhi_host_shutdown(tb->nhi);
>>      nhi_pci_remove(pdev);
>>    }
>>    ...
>>      .shutdown = nhi_pci_host_shutdown,
>>
>> This leaves nhi_pci_remove() (and nhi_shutdown()) unchanged, and the
>> host_reset logic lives in nhi.c so a future non-PCI host can reuse
>> nhi_host_shutdown() the same way. Does that work for you, or would you
>>
>> prefer it shaped differently?
> I really would like to name the PCI driver shutdown hook as
> nhi_pci_shutdown. What about this:
>
> 1. Rename nhi_pci_shutdown -> nhi_pci_release_irq as that's what it does
>     (keep the callback member name shutdown still)
>
> 2. Rename nhi_pci_remove -> nhi_pci_do_remove that takes new parameter
>     'reset' or so and passes this down to the tb_domain_remove() and also
>     ->tb_stop().
>
> 3. Add nhi_pci_shutdown() that calls nhi_pci_do_remove(pdev, true);
> 4. Add nhi_pci_remove() that calls nhi_pci_do_remove(pdev, false);
>
> Or something along those lines. If it looks horrible then we can do the
> same but with the flag instead of passing the parameter down.

Sounds good, I'll go with that structure and name the driver hook
nhi_pci_shutdown(). One note: I kept the flag rather than threading a
'reset' parameter down, because tb_stop() needs the stored
nhi->host_reset for the unload case anyway (the host_reset module param
is static in nhi.c and not visible in tb_stop()), and passing a parameter
would also change tb_domain_remove() and the cm_ops->stop() signature
shared with icm.c. So:

   - nhi_pci_shutdown (tb_nhi_ops handler) -> nhi_pci_release_irq()
   - nhi_pci_do_remove(pdev, reset): sets nhi->host_reset = true when
     'reset', then does the usual removal
   - nhi_pci_remove()   -> nhi_pci_do_remove(pdev, false)
   - nhi_pci_shutdown() -> nhi_pci_do_remove(pdev, true)   (the ->shutdown hook)
tb_stop() keeps checking nhi->host_reset.

Please let me know if this looks fine and I'll send v4.

Thanks,
--
Basavaraj


