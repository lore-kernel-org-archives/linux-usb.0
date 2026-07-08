Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010069.outbound.protection.outlook.com [40.93.198.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1B62D12ED;
	Wed,  8 Jul 2026 17:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532072; cv=fail; b=u2n+8uqK/xcV08We9CPGXL6lknnBtkjVJoIaUoZz2hPr2OavZi8DPEasju63tft2z/v6+KRoTbk3a7NL/5GFlMEvH8VWPpjRM70isdWvp+6SZifQi8mBoTp6J0ziwM6LyZPxYm+7iBrEQD7NOb8Hw8ZJm13bQN1Qv9LIVHPizPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532072; c=relaxed/simple;
	bh=vAaUf1q//Yw78OtozJfA9AEJKA1AP6gXe0A8MOEXa5E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZWg046FMh+dlDQwGdMZ5Mjv6FkxI/A0Go1xQaTK74jqGEghmUZUBQDHZkpkDX27ksvIjrQ2ER+hXrcXDmy+5g3uMzOVJvJAs7GteTG3wIJ6ru2LQlL+hRc+wm1DaJlLOr0W1Pa8CYLjerZ5ZAvMPXzTB216EWiyh/AZvc8VPjnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UJd+6SeW; arc=fail smtp.client-ip=40.93.198.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UJd+6SeW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gndJbEYVHttfvc02m+mTU4V9ZPi6VjpSpoK7ImkT5Sb34XfCH+fik1aam4J3NVUXpU+7y9V44bgrLmkCFcBFI0lW9wPHstGf4wO2DxwvixVgDRxV/wNcU0SrxMOjqlhtBpulNqdaFUFsbrmMJ/7QKnSYZbInMXG+2Kndph6VtrkLxyYqJ6wCG5nlrW7xc2Ih2fvoQxeY/VyNIS0IXABaitBDw539AaBkFy898KJ4M3d6Kvg6inEw5cNx2durGIxMblE7hHBIP9YhVPS8Y57K2lHdksSNYRLLs3T8gCTVxkHlAkNfiUa6OEDbQ4BBvgJHZ0IPTWV/WQDl8Py/0AFgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMfjl8AFR8TEpXN7W9YCbSW2esOteUwxUNzzz+7SHd0=;
 b=eNKVSsD5XnwgPQewqdYXzNHz7b7B6QprkLk1mkZ3yJcRHaMXvR4ZIH//d8ZEEcFWLuYYeHaVNJXZcXDhmI7tKjQBL8+8J8B/Ihi8ciDzR4nY6HY8PDKEGvIScOOrS7IM1jDNKbesRioQmBibdf/VuUIoJTKVkA8K3Wb+JVB/dimYZ7Z0Z/M+nNsIdpIcd4l/iTStdI6zOj621HrT71p+pGctZaEGtQTm2DvnY7B14tpJj6RCO1mqPEj4ZtcJC5KEF8tqd3kiy3E2JH18Q6M0KHE/MjvMS4yzuSkRpGMrNUM+YftcK5texBvWBAVxitEQXjENYwote8/LPLnXeZewoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMfjl8AFR8TEpXN7W9YCbSW2esOteUwxUNzzz+7SHd0=;
 b=UJd+6SeWwTUsnXdyCNgc2E+WXWdX/44AMdhyKU+BUk+RrqwGqJSrEZm3DrbXWqdYDdJYAE0rh+kNPdsY40g6wjzN7Dy7XOAwWqyko2HEzRs4q2tOXBjuttds9UquKk9QQRnTC1m78C0wwr/Lcu3jkzcipHEWJIlEha95aOfjUSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by IA0PPF64A94D5DF.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 17:34:28 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 17:34:25 +0000
Message-ID: <34c3ca72-7327-424d-9da9-63f6542d7472@amd.com>
Date: Wed, 8 Jul 2026 23:04:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] usb: typec: tipd: add TPS66993 support
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
 <20260702190527.1820671-4-radhey.shyam.pandey@amd.com>
 <akfSnKaxki9FCDww@kuha>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <akfSnKaxki9FCDww@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|IA0PPF64A94D5DF:EE_
X-MS-Office365-Filtering-Correlation-Id: e69358ea-0e44-4450-32a6-08dedd172555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|56012099006|11063799006|4143699003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	T7nzE7z7d7+MMfH6SKsbnjwg5yPLGaE1CnEoT/lqNInlXiBJjtA871A0Sjfd1J+hAWeRcpedUekVM7V3+O+nK3j7s8VV94LOaKxpIGDG+bKOWPhUPBEGZN745HJIj3QjtJL5iAi5ca8uiPoiIc/sK+ZqwIAiPgMLYHWwYyQjWe/8bCJU5Jhx4ZJZ741YG8XIHF7ZvYvi5YA4hKJG19G78QHmCk39Fb/ruQSPGP2ZommmKoV5L+1mKWdw1Mhqd2sdkcYaBH1HOHavUECUT51LFrjDRHfEYLxj0jnJLSfcgm4DFzazlq9xUA5OGe0Kqt2QgQMR1yr1I9onTwpRpmuDw3m42SXgZuPgzedboQ7Ba5ToyRlNwuepE8y6NfDg52r2j8ygiR66cvwezCfmhm8N5y5hGG/1Py0bwfbXm4edmQP7FYSLorHYyQXufBRTLLU7m9nznWU31HZmoIoi1QuQNfujxhMoGYikQzXp8bwBWdYkfRiD9NAZ61WeVzdzHOUTkjN36AmRerXj0B0F/Q3dN10T6ZJgLH5pGdjdM1PcElHQ4aHgAgS/WvkwCVUe5e4x1l7trvOAgckA/8OSLhGMz//MNPHlZsETARce2HOt9HCMytEotDAhdgdKHqiNavUKPG4UeWMXzv/ka+FDtYjnZtA7zSKtVgRRuc2UfUUpr7Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(56012099006)(11063799006)(4143699003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3d5U08xU3hiMk9RUHp0WE44d2Z6Szg1WEJkbytyUk04ZDBZVUFpaUpwcWFh?=
 =?utf-8?B?eEV5SUhXOC94eGo2N1ZERDZ6cHd2dUQ5WGw3cmtoNVBEdllreEhZMnExNk5T?=
 =?utf-8?B?U29RWmNOZkc1UXRpRFVjc2xBWDROSDhIQmpQNE8vZnVkelVZejBaMWg0WGxK?=
 =?utf-8?B?Yy94eVhDZ3NMeE5JVG5rYnc1RXZqRmpidmJCaW42a1JqOEtLRXIwa2JQb3Iw?=
 =?utf-8?B?TndOM3lMOXlYU01kWTQyS0NMVGk2cjhGUTNhU1JXc0hnY2dRL01VajdPK1Nu?=
 =?utf-8?B?KzVVT1QwWGxqblNHcmh2MlQ0Um9RRFFrRnE1ZUN6MGxrcHltN3llMGM5TTB0?=
 =?utf-8?B?S1g0bjhBbFBNYUNaN25Dbm04V2lhR1dNZmF3eXUvd2Yxc3lRb3o3b1JPMlps?=
 =?utf-8?B?S1l1Nnhoc25KTFQvTzV2d2hkYjdUdGlaSXZxazJtOExTbmlWdUdneUI3N2lB?=
 =?utf-8?B?QW5Bak5aM3ZReHZ4NUdHNUpwYktrdkxyWUJ3TTlPbUdHVk43MkhSdGczNzJP?=
 =?utf-8?B?ckRxc1VGMVQxZHI5ODVWK2RaenJKYzVnUEJ1T2ExbWtYVnFnQ3BYNktRVko3?=
 =?utf-8?B?b2RjVjdiS2tzeHpTbHBKKzVUbGh4bWZZVFExTHIrZUVmcFJHdkY2cXYwbWRN?=
 =?utf-8?B?UU00ZU9sb1VVVkwyTnBBVFp3VGNER3lEMHdldHBrVzUzejJYVkNZUzVuS0k0?=
 =?utf-8?B?QTN2REROZnRTcXI3cktPVE44TzFlZXJPa1cvZDdjVEFyRGphb0greWNaSS9Q?=
 =?utf-8?B?Ymx0WGFlN1NZWGNuMityTklqUTl6ZnU3bHUwV1ltOVBIRzZzRUZKam5SdUI1?=
 =?utf-8?B?L3hhek1lenF2MGJzQVZpRmJpQy9tQnRqY0xhN1dNdm9BdlRtSHJJNm5YTC9x?=
 =?utf-8?B?M1U0bjdrS2QzdUV5b1BJSC8zY045L0dUbTZlK3h1amVKdXE2RUo5eVg4clZ6?=
 =?utf-8?B?UlNlRlVQWkd3MG50bE1wWGdsRS93Zmx2RnJNT043Y2dFTUhrSUNZc2tjdEla?=
 =?utf-8?B?eU9GR1ZLOU40eitWQms1Kzl6M2cyNzdqbFN1M1gwRkE1cm9TaXQ1NVdTd0Vv?=
 =?utf-8?B?SzJtYzE0OHZQeFY5SWJ4MVU2S2dVNFlEQUdmeVpIUUJXR3Q2c3B4NmFyaEs3?=
 =?utf-8?B?blk4dUVEYTNONHVscUozTTc2bldubllobEZybmZPZzdkdkZwUTROcm43ajIr?=
 =?utf-8?B?VGpBYjkwRXZSa3VwYmZoSGVFMlYyZytkckcwRDduOVNMR2pJRTE2QUNjVzJX?=
 =?utf-8?B?MUU3c3pIUkc2dUcvYUFXTWdXS1NoQ05yRGFRQ0ZNd09PU2F5QlJwMGZrRlpD?=
 =?utf-8?B?dWpoMTJ2bmdBbm5QVG5LYVo0aGdwb3p1VkNoczc3UHp5VXhjWTZyRmJWUmZE?=
 =?utf-8?B?RWtmR0hQelJ2cTYyVUxZMjUxUVZCejhhVVlFTDJURGxvWGhCK3RyNGdkbGs0?=
 =?utf-8?B?NlEwdWg0Z1BxNGtSVE44VEFLV25MWGZVakxBUE11amZXakNBS1ZySEN1U01M?=
 =?utf-8?B?d0M2bng1bHRlVmdyQjdBNUdoZ24xbWpMMC9iL3ZpN2VxVG0zVmFoMDJOc2Vk?=
 =?utf-8?B?YVJnY3QyMml3WU9VQTlWWG5FRDNKTjZudWEwME9RZHJnM1ZOeklDQTJvR1dY?=
 =?utf-8?B?Tkt0WlNPODQ4M2lZY2M3a1VOSjBhVnhCSGxDdmF4Yjc1dnJMUWJ3SXdLNWFq?=
 =?utf-8?B?eHhPeHdkYldDK1E3VzdSQms5TDJ3N3RCUVh0ZjdwaEVzL3FSbjN1bHFTbzRQ?=
 =?utf-8?B?Wm8yNlAya0UzeWV3eC83SW54ek9YYkJDY3BISjBrRWtFM2VuTUVxdm82aDlu?=
 =?utf-8?B?c1B1bkg2Rk5xcjlRa3RLU1hJMUJ5NGFRSEpJTWFiT0dlLzkyMjUyVDNiREY2?=
 =?utf-8?B?R0YrMmJLQWRJL0xNQUQxZmFQSzUxdTlPa1pyQjN4eFJUbjZNSXBnZ1dFNHJx?=
 =?utf-8?B?MWxaYkZRYjkvVGU1ZzRkL0l4NXFLUm9PK0NTT3krM29Eb0ZDTHNjZGVhMkZH?=
 =?utf-8?B?WkF1TjkxM2IxTVV3SU5ORE1PRml3YjBrZ2E2Y1JWaFZ0TU5TSlpQdnFlVldE?=
 =?utf-8?B?SkdnRzNSQzBPNzJZWFMxdjkyQ1FQR1VTSUJtK21lSWtKMlBZYjZ6Q20zR2o4?=
 =?utf-8?B?TTBFUkxUblVwS2NEZWErVFdKRWhnTmtHL2ZQK3JzNlVTK0Z0NmlvVDRWYk4x?=
 =?utf-8?B?WDNWQk9ROHNxdkc3ckc4N1cvUFE1R0g3QTdQaTNFR2k0M0dXaUR6VDcwRThu?=
 =?utf-8?B?N1VHaWRwbDdhQVdSRzNaRjNBM3d6b0gxb2I1c3BBKzFCWFgxN1R0Nk5ZRWxB?=
 =?utf-8?B?WkJCZ2FNNS9scVBycE05bElKNEVOamVTRURNc2NTT2pjVVpEMTJlUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69358ea-0e44-4450-32a6-08dedd172555
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 17:34:24.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jS1+WJCffHlIZR2mbFvS6z1lZZFuU87vVUT+RkJelMlRll844kUNrvb4emLOEPxd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF64A94D5DF

> Hi Radhey,
> 
> On Fri, Jul 03, 2026 at 12:35:27AM +0530, Radhey Shyam Pandey wrote:
>> Derive power status from the STATUS register (0x1A) now that TPS66993
>> deprecates the Power_Status register (0x3F). Add support for the "APP1"
>> mode string. TPS66993 controller is configured in polling mode and only
>> type-c flip orientation feature is supported on AMD Versal AI Edge Gen 2
>> VEK385 Evaluation Kit.
>>
>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> ---
>> Changes for v2:
>> - New patch to add TPS66993 driver support.
>> ---
>>   drivers/usb/typec/tipd/core.c | 65 +++++++++++++++++++++++++++++++++--
>>   1 file changed, 63 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
>> index a6cb233a055d..d2394d23a2dc 100644
>> --- a/drivers/usb/typec/tipd/core.c
>> +++ b/drivers/usb/typec/tipd/core.c
>> @@ -130,6 +130,7 @@ enum {
>>   	TPS_MODE_BIST,
>>   	TPS_MODE_DISC,
>>   	TPS_MODE_PTCH,
>> +	TPS_MODE_APP1,
>>   };
>>   
>>   static const char *const modes[] = {
>> @@ -138,6 +139,7 @@ static const char *const modes[] = {
>>   	[TPS_MODE_BIST]	= "BIST",
>>   	[TPS_MODE_DISC]	= "DISC",
>>   	[TPS_MODE_PTCH] = "PTCH",
>> +	[TPS_MODE_APP1]	= "APP1",
>>   };
>>   
>>   /* Unrecognized commands will be replaced with "!CMD" */
>> @@ -631,6 +633,35 @@ static bool tps6598x_read_power_status(struct tps6598x *tps)
>>   	return true;
>>   }
>>   
>> +/*
>> + * TPS66993 deprecated Power_Status register (0x3F). BC1.2 is not supported
>> + * and the remaining bits are redundant with STATUS register (0x1A).
>> + * Synthesize pwr_status from the already-read STATUS register.
>> + */
>> +static bool tps66993_read_power_status(struct tps6598x *tps)
>> +{
>> +	u16 pwr_status = 0;
>> +
>> +	/* Same masks as TPS_POWER_STATUS_CONNECTION() / SOURCESINK() / PWROPMODE() in tps6598x.h */
>> +	if (tps->status & TPS_STATUS_PLUG_PRESENT)
>> +		pwr_status |= FIELD_PREP(TPS_POWER_STATUS_CONNECTION_MASK, 1);
>> +
>> +	/* SOURCESINK: 1=sink; STATUS.PortRole 1=source, opposite convention */
>> +	if (!TPS_STATUS_TO_TYPEC_PORTROLE(tps->status))
>> +		pwr_status |= FIELD_PREP(TPS_POWER_STATUS_SOURCESINK_MASK, 1);
>> +
>> +	if (TPS_STATUS_VBUS_STATUS(tps->status) == TPS_STATUS_VBUS_STATUS_PD)
>> +		pwr_status |= FIELD_PREP(TPS_POWER_STATUS_TYPEC_CURRENT_MASK,
>> +					 TPS_POWER_STATUS_TYPEC_CURRENT_PD);
>> +
>> +	tps->pwr_status = pwr_status;
>> +
>> +	if (tps->data->trace_power_status)
>> +		tps->data->trace_power_status(pwr_status);
> 
> Is the condition necesary? Is it possible to get here without that
> callback?
> 

Thanks for the review . Valid point will remove the if() and call 
trace_power_status() directly and spin out v3 soon.

Thanks,
Radhey> Thanks,
> 
>> +	return true;
>> +}
>> +
>>   static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
>>   {
>>   	int ret;
>> @@ -1026,6 +1057,8 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
>>   	if (!tps6598x_read_status(tps, &status))
>>   		goto err_unlock;
>>   
>> +	tps->status = status;
>> +
>>   	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
>>   		if (!tps->data->read_power_status(tps))
>>   			goto err_unlock;
>> @@ -1034,9 +1067,15 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
>>   		if (!tps->data->read_data_status(tps))
>>   			goto err_unlock;
>>   
>> -	/* Handle plug insert or removal */
>> -	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT)
>> +	/*
>> +	 * Refresh power status before connect - needed for TPS66993 which
>> +	 * synthesizes pwr_status from STATUS and never gets POWER_STATUS_UPDATE.
>> +	 */
>> +	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT) {
>> +		if (!tps->data->read_power_status(tps))
>> +			goto err_unlock;
>>   		tps6598x_handle_plug_event(tps, status);
>> +	}
>>   
>>   err_unlock:
>>   	mutex_unlock(&tps->lock);
>> @@ -1072,6 +1111,7 @@ static int tps6598x_check_mode(struct tps6598x *tps)
>>   
>>   	switch (ret) {
>>   	case TPS_MODE_APP:
>> +	case TPS_MODE_APP1:
>>   	case TPS_MODE_PTCH:
>>   		return ret;
>>   	case TPS_MODE_BOOT:
>> @@ -1810,6 +1850,8 @@ static int tps6598x_probe(struct i2c_client *client)
>>   		goto err_clear_mask;
>>   	}
>>   
>> +	tps->status = status;
>> +
>>   	/*
>>   	 * This fwnode has a "compatible" property, but is never populated as a
>>   	 * struct device. Instead we simply parse it to read the properties.
>> @@ -2004,6 +2046,24 @@ static const struct tipd_data tps6598x_data = {
>>   	.connect = tps6598x_connect,
>>   };
>>   
>> +static const struct tipd_data tps66993_data = {
>> +	.irq_handler = tps6598x_interrupt,
>> +	.irq_mask1 = TPS_REG_INT_DATA_STATUS_UPDATE |
>> +		     TPS_REG_INT_PLUG_EVENT,
>> +	.tps_struct_size = sizeof(struct tps6598x),
>> +	.register_port = tps6598x_register_port,
>> +	.unregister_port = tps6598x_unregister_port,
>> +	.trace_data_status = trace_tps6598x_data_status,
>> +	.trace_power_status = trace_tps6598x_power_status,
>> +	.trace_status = trace_tps6598x_status,
>> +	.apply_patch = tps6598x_apply_patch,
>> +	.init = tps6598x_init,
>> +	.read_data_status = tps6598x_read_data_status,
>> +	.read_power_status = tps66993_read_power_status,
>> +	.reset = tps6598x_reset,
>> +	.connect = tps6598x_connect,
>> +};
>> +
>>   static const struct tipd_data tps25750_data = {
>>   	.irq_handler = tps25750_interrupt,
>>   	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
>> @@ -2025,6 +2085,7 @@ static const struct tipd_data tps25750_data = {
>>   
>>   static const struct of_device_id tps6598x_of_match[] = {
>>   	{ .compatible = "ti,tps6598x", &tps6598x_data},
>> +	{ .compatible = "ti,tps66993", &tps66993_data},
>>   	{ .compatible = "apple,cd321x", &cd321x_data},
>>   	{ .compatible = "ti,tps25750", &tps25750_data},
>>   	{}
>> -- 
>> 2.43.0
> 

