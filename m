Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012069.outbound.protection.outlook.com [52.103.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D643C7A2;
	Thu, 20 Aug 2026 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231120; cv=fail; b=L5UN7USw0/R+2svTdQ2BE1lKr2gacRTTzSFrVi4cmiDhGKxKd5FYvSmW8BltCkxLmBKxAlMpvG87XTE6UQTZjdufgaUjA8DLuNvWZ7tNrUUhO5LL1tIsCTqNs/6NHhwN2EmMI28jIIUNxobQyc1IlCpxYaTFk0Y9rS9SRbRFU7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231120; c=relaxed/simple;
	bh=yOfKJ3DL+xIqT3ZNngMU+ZaLDF0dkoMAzUCvK4+dudg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=frPLfMAOj5dAALS3LRQ8WgxGixy1zxhNiqWwOzCV2i9GyDHZ6ruLSChWVj0ndPE/z17hs08Gbsr7pi8uXxv52w+TzNTLIA7IvlOaTZBK0QmubgrLcfCX8FSe6FHc8ZoIWxZ70g3MJCdaDHyvOvPX9PReI46EMqBiJqTNFgmVSTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au; spf=pass smtp.mailfrom=outlook.com.au; dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b=BvG+CVZf; arc=fail smtp.client-ip=52.103.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.COM.AU header.i=@OUTLOOK.COM.AU header.b="BvG+CVZf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0xeuambjjpfGnZNPbSok1M5V0kgKWxquu2bhUT1gQg7Z1V8O9aKqJydA2WIN6s4++PfAQytVYQtt/v8OyUs3sxIMmqTUbdFddY+kVzNiq6J4FJ/Cw9OMsRFTUzHxToRnS7LmzJE1LRSLL4qV4iWiNhLtKtkAKYJfbkcr7ZFua8DdaQn8xSCBGYW7lPGxLjPnOGgFHNjjDaxbOS4pffkpkgJlgP50BXlyUzht92hLbxMz25Z2lW7JbGJBwcGYiFFm9q0wisdQ+XsBQjarJ4NFo3v64v2t9Q40dS5+yZjqHz2NxbqZoR8an44SBMl35JthaYpgF0i8WJ8uq0n2MeI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE+c7CgKEARYP1hsk16K484aAqtGLwRJ3nGe0TeRk14=;
 b=crejCa0Ym3rURZu+M3h2upkGJ+VVTYBAZtieDA6VyUDyUf4+7KccpBBSuV7y/1QHuT5R0ISunR+ihEhblaxJHpFDgRvWw0KBjSbCOcxGuwKFP4GUn9OJBKT220ePr7op0FoJZR3qUmRNWVm4OKx9mveK7ZglCq7DyjQOa16uSdYaqWtGL7xvbRVrTBx38oFep7eBA5UVJ9yOTWB9OyY5ngkEZ8Q2KHAiPWP47AgoWYojQrygSnbYnUola3BLZthHrDuwyX4sNnMw6vXmjbi76UZRhZNlMO9Oz54ql1/zVZTtNW2sh9y6z7xVoDSM/4mYETwckKbA0YVB+NiPYV+5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.COM.AU;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE+c7CgKEARYP1hsk16K484aAqtGLwRJ3nGe0TeRk14=;
 b=BvG+CVZf5a1PnCIC7npSj2B9S6Tfu+73JdTbijUKlYVT+/Eo70Ch/D43oLdeJxJV0ZKffoCOHdlDiyS7J0UzJE1gkImaB41TOkV+lYf4ueagL51KYku+O3Z7r6f9oocw1AXHjKLdEgFTMulRWezXkbJGG4vqPwptnwVQ8xHOn7iuZ+BuVa8d3O2i2GYdhXa0qad14JtVLVDxliUy13SZCw8+Y92GkkAOXGoBsxsHrlib13LyZy4QiOY70wpaXvWaYO8fKXr+/Ia+tnyd9nZ1za/c1px9HvtAxjIDvuhqVdCQ7Jbf/c3iSd4HO4VQNYRvXkJSbw89fsAUYThyBdy6tg==
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com (2603:10c6:10:59::12)
 by SY0PR01MB10073.ausprd01.prod.outlook.com (2603:10c6:10:2ff::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 13:05:13 +0000
Received: from SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::57d:8fd6:3940:5957]) by SYBPR01MB4586.ausprd01.prod.outlook.com
 ([fe80::57d:8fd6:3940:5957%6]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 13:05:13 +0000
Message-ID:
 <SYBPR01MB4586BB68E8B126C080A1F10AC5A42@SYBPR01MB4586.ausprd01.prod.outlook.com>
Date: Thu, 20 Aug 2026 23:05:11 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jihong Min <hurryman2212@gmail.com>
References: <20260818-xhci-pci-prom21-v1-1-6584857e654d@outlook.com.au>
 <50a39638-cd08-4de0-ab13-f985e27228a0@amd.com>
From: Stephen Horvath <s.horvath@outlook.com.au>
Content-Language: en-AU, en-US, en-GB
In-Reply-To: <50a39638-cd08-4de0-ab13-f985e27228a0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5P282CA0107.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:20b::12) To SYBPR01MB4586.ausprd01.prod.outlook.com
 (2603:10c6:10:59::12)
X-Microsoft-Original-Message-ID:
 <3285a26a-b953-4d13-ae1f-a1b5f4d3d6a8@outlook.com.au>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYBPR01MB4586:EE_|SY0PR01MB10073:EE_
X-MS-Office365-Filtering-Correlation-Id: f98ddb52-785c-4494-1974-08defebbab9c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|19110799012|8060799015|37011999003|15080799012|24021099003|23021999003|25010399006|5072599009|6090799003|40105399003|1602099012|10035399007|2607281247196008|3412199025|4302099013|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkhBemZIQThPNmV5azVQTlYvZGlUam9FeVpTT3VqWUREWDFnK2Y5Tk5GdkRu?=
 =?utf-8?B?Q2dEem9GbEcvRytNVWsvN1k2amJtSmtHSTZZVlJybGpmUkNleVFvNGlZVVZ6?=
 =?utf-8?B?L2tKcjBKVkhmU0QvZTFSeEh0RGdyNHNXNER4KzlOZnZ4T21PVTdiN1lEVkR0?=
 =?utf-8?B?eC9RZk5MVXBoTElLR1YxQmxUdUk2ZnA3eGFNSm5pVDg1blJjZklvWG4xVjFM?=
 =?utf-8?B?ZFN6QmxqRUdiUFRLMENlTm95cVlEd2F6cGtGQnFIdFI3S1ZKaHBLRmtPUTl1?=
 =?utf-8?B?T0QzTk03M0ZWS0x0dm9GTGFUQzhqTjNDNmtZTEVsVlk0K1JHOWdQTTIxQXcv?=
 =?utf-8?B?Z09SMkI5SWNvOEFTaFZWemJrTndIR2dRQis5dk9weHRMRFp2Y1J3ZUVMRmdq?=
 =?utf-8?B?UmNVY0E5bmozaFJWYm1FT3k3aGlEeDQwOG1PNlhhWi8xTVMvL05Jbkg5OW9C?=
 =?utf-8?B?dGwwekNXanhUK0hVNWFENmVINGRwS2E4dE9XUnN5NzF0UUVsLy9BaE5nbGNU?=
 =?utf-8?B?Sk1iQ2FaWXYvSlpqOW5od3RBUkpZalE4MVlVQ0s2TEhnWGx3eVVUMjVrUjJs?=
 =?utf-8?B?eFpOU2RBYjgyM2h6K1NHaWNyVEhPdEdjczFGcXQ4UG50NElMdiswWFRBVk9B?=
 =?utf-8?B?UTRNc2l6MERQWGJKd1cxaUZDWndwUDZMMFF0SFBHcXh5NEFwb21KNzZXK21n?=
 =?utf-8?B?REpQaHJBMHQxL2tvdXNDeGZqOW1FQ1BBNXZOa1FjSW5wSEhaMHMvZ0kxdGcv?=
 =?utf-8?B?UXJYaTA3RDkxTitBS25aTEVFUERoRFI2MnJLNU80RkxMaHl4ZTRkU0JsWTli?=
 =?utf-8?B?QVNXcWd3MXBpU1ZvZUY5ZWZEV1J2WmpKMW5Hd0tVRWRRNUR3TlBpYnd6Q1N2?=
 =?utf-8?B?c3d4TXFWZXFqUTBLbXdNZnBhNGhOSlB6Y0pLL0pUZXNqeHV4S29uNnBRYjN3?=
 =?utf-8?B?T3dYUG5mOW41Y2lMM3d2cWNMR1htdGgyam9LWjlXWVNkbnJLQmpXL0daWDVH?=
 =?utf-8?B?NkRYMTZ2NDhlR1VIckpIN1lmWTJYb1UzNUhjbnh4cFl1QTJCdkYrTkYwRG9T?=
 =?utf-8?B?K2djV2VYM0hXYWNjWHd3eThBckdLaHNkNHlkTnlKTzkvTHdnRytneGF4VEZB?=
 =?utf-8?B?bm10TWdIVFJoeGVqMkhZbC9ETGdZcXBPTGxjdDEwVFFnQmpTRGdRY1ZkVm5V?=
 =?utf-8?B?cmlZaVZ6Wnc1RktXWE02OHFpMFJEb2RWUXIxemRKaVl1TDdIeGdiSjN3cjZq?=
 =?utf-8?B?ek96VEx1TGlVYnl2S0J6QTlrZWVMUmttZTVoTnZXMjFWdkJTZ2dTaVZmc1RS?=
 =?utf-8?B?RUxzcVJQWDYrdVR6ZmVtUzhqMWNTMVROcjFUUnFHVzRmTUNJck1aUVpBUE5N?=
 =?utf-8?B?a3F5UXpnT1hPdEpSdTR0UUF5MXQwdHZwaFZzMTUraVRZYi9RbGJVOHN6RG1C?=
 =?utf-8?B?VzA2MGFETTBYbFg3MWZ3UkNCNmpvMk5KSVUrWXd3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azgvY3NzcGQ5bUNvdmxZRmdGaUtUSndhMEZlV2k5RjMvT1o4VUNjNC9hRE5v?=
 =?utf-8?B?Sm84Vm5nRTJmTjFmLzBWM25rdGY4aHhQTjdhOXB5eEpWVnMvM1FMeDAzbnFq?=
 =?utf-8?B?TzRNS2ltbW5laE5FNVZ3eGtmQWZ6OFNJL3llNmlPUTVxMEVyQkdJYUs3WUtX?=
 =?utf-8?B?Zm9YU3ErZjJaUFhyYm5tRGh5ZnVkbHltYXBoaStsT3V2bGNaTkJjWkh6d0xZ?=
 =?utf-8?B?YldvV3pxNDQ2dGQ3c1dBZE9kQWkyNlIvMUJ1N2JvRUxhQkdhVXY0ZExjdUVP?=
 =?utf-8?B?UkhjSmxpa1c0ZFJsWU1ISXlOaElZTnVwMXdFU2FrWmlQYWhxc0p0RzY4VnlF?=
 =?utf-8?B?RTJ0bVI1NEgzTUdPQlozY1VWTVNJMmd1QlVmRlRadkR5bnRFbHorOFFPMkZS?=
 =?utf-8?B?MGpZd01YQUprdkx3R2J4UFk4K1FnYXhMR25ETzFma2U4QUIvVVFLK20zM1Fl?=
 =?utf-8?B?dzVVbk1wbk5pVHh1RWFYTTYySjJ0ZFVFNENXenRHWGlzTE9wcERDTFZUdmlG?=
 =?utf-8?B?WVJnR3RvazlXbG43YXJKeDQydHZxZm5nRVVrZE9QK3FFNEtlUkRGVHQ2VUc5?=
 =?utf-8?B?R2E3cERxSWlIQTdvNVBqeXk3UDBuN2ovSG5pSG50RnpIbFJyNGYwMnIxM28y?=
 =?utf-8?B?ZFF0ZUcwYTJJekJmT3hwVHFzNml6RUQ0bFdFMCsvSDhxN0I1Z3BDbTBJdExk?=
 =?utf-8?B?K21xZGh5bGhhaFVsQlhQNXJ5T1RwV0tsVHlscmZwWENycUZtelJlclFOSGUr?=
 =?utf-8?B?K0ZLeXVuMnhlZ1A5VDhyWFpsSmUzOG5nb1lsYlFRWHpXUlJSRURzbVA1MU1s?=
 =?utf-8?B?dEFJTnlrWlh5aVEzWXRYclB6a2JpSHhRQWY5dkwrK0lHclJEZzdTU2loeDhM?=
 =?utf-8?B?UXRla3UrcFRnc01EQnR2MkVPVkMrUmFWRkdRNmhZbjE0N1hmYjJaWFdFSDZ0?=
 =?utf-8?B?VXZMV2dQOElMK3VFZmlnQkFQQ0FHMmNKTG5HL09BRStVdDNsamxYYWd6bDQ1?=
 =?utf-8?B?UktpMHpXMlNEWXFIaUpyVS9nOXhnUWVmZ1dzdTNBWW9mdEVsVjlLNldvc1JU?=
 =?utf-8?B?bUJUZ3I1UzRkNnE3ODh4TFZIa3VOL1JBdTJaT1dtdU9Pa0hxYmhZVGF0cXpt?=
 =?utf-8?B?d2EvM1FLSEhZeExqYUtnZkI1R1ZVUXZEdU9iVnd5Z0V5cXJUUWZHR25ZSWV6?=
 =?utf-8?B?MHptVWNVbGluME85UFIzTTlQSzc5bnFTNTY4aElHcTdzMTVrWXhtNE41d1Ew?=
 =?utf-8?B?ZUVQeERtYXBidk9jOXZZOExDbVdab0g0Y09JZndtSE9aK29iTWtYdzBIWC9Q?=
 =?utf-8?B?blpQUjduNVBHWkRQYnB3Ny92anhIMkpYMS9nVzFqUWhOSzRkelVtaE9aSVpx?=
 =?utf-8?B?c29GUUZlcWJJOW5yTlQ4dzczeXlwajRFSXhxZzhlVERlbXVFQ01zTm9OeUVx?=
 =?utf-8?B?YURsV2p6cE9IYjE5RkhHR29BeS9GWklRY25NZUw4a1AzeHBYRysxRkkwQ0NH?=
 =?utf-8?B?UmFPSHRLbEJOT0dLUnUyTEl6SEpJdjZBaXJJZWVFYXlFbkZ2NmNrT2lUYkFn?=
 =?utf-8?B?YVU3SkcxRW8vWFVORklVeVVBNEZRbDU0U3loSERJcXVLczgrUkJNYTg1dkdr?=
 =?utf-8?B?MTc3RFdNMTlWQnZBeTQ5STh6dlc2RUwzSFBuN2dmU2NFdWFLWHFDY2NDL1V2?=
 =?utf-8?B?VE1QT041T3pVU21NaHpCYTRBUlcvZGRoY3VZSElHMEpHUXpLRklIN1JZZVUr?=
 =?utf-8?B?aVVLSjhtckhHbzlrSDFWeDBJY2h2b2ZOcHRpRUNaZnZ2cFJIZmpRNlcwajNR?=
 =?utf-8?B?YVUzbGRSamp1cXZhVE9XYlFnZUJ6TXNwdTcvMi9iS1NYQmxvd3dZbDZvUXBq?=
 =?utf-8?B?RGtWYmZDOFo5Ulp2VXBNNlNmNHNkMGNyN05VbEhvVTRjWERETzNHS2grRDRO?=
 =?utf-8?B?M3YvT0EwUG1CdWJYN0ZZVnRwQ0RUVjJTaTlBRTBGbHRTaG9ITnNZVkZYUjZH?=
 =?utf-8?B?TGN6RE42a0tRPT0=?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-feddd.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f98ddb52-785c-4494-1974-08defebbab9c
X-MS-Exchange-CrossTenant-AuthSource: SYBPR01MB4586.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 13:05:12.9963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0PR01MB10073

Hi Shyam,

Thanks for your review!

On 20/8/26 14:36, Shyam Sundar S K wrote:
> Looks good to me. But you may add 0x43FA/0x43F9 they belong X620/X665 models respectively.
> 
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

I've just sent v2 with 0x43FA & 0x43F9 added:
https://lore.kernel.org/linux-usb/20260820-xhci-pci-prom21-v2-1-638e5958fbbf@stevetech.au/

Thanks,
Steve
