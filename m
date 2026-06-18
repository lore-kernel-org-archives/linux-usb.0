Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568743CEB9A;
	Thu, 18 Jun 2026 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774341; cv=fail; b=o6hu6ot9vENpLtVy+tTPzJ6nECoTYF6oVs24Eh1Y8xmjxZR8XRWOnbWNdMrVBlavTTqHHKyo3ZnAPRe0yo7ov2xl+rzMMREGSsV0zB5rMIrLm4R5i2yWw2xks6wC6GjHfwaGVy7nFDriMAoAvQ0CJH97FQGL/VOynXMsOMy3MYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774341; c=relaxed/simple;
	bh=ocGFzIqjgedXhmsuYVpVc4Ign5pWwU/PrFoqwkglNfk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iWQBBWK1Q0EkprxrrCdifBvTrUN13Uxx4rIIQzFnJEyJMMZMqQvDE/jY9mCTFb5eLt7oQKD5cr4d80IqQo6jT0Q05Sm1xTxr2m5Yk70jBiHuV9jYfGGN8QMp+oP6fnJwWKwDSBYVMaFG8SN/jIZ6M/QjMh0z9vzwKKtLp1R74JY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z/IgQZ8O; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z/IgQZ8O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lvf16c4J5OzaBkS23EKn6Q9AC/RqrlppFegLk+hfJhFYwFqLKw+O1WY3PZViDpwRlR+bxo/vJXzadXEK/gCzlGbBv5EXZesEnMg3JUuFtGZkAIhRYpbY0dR/3T8gYQfePdWVXFE0WExZrgCgVHWECeKhaWXElL93hDjceMy1B+BguckK/0b8g790Vuqr+addNR0bFPo/d0xYBk7dws2SIrIpOQzyZekbi2ENMM2LlH5aIHu7U7o+E7B0C3VCRFJWFw8dFr7kH0170zn0Ee86F19s+AipwmbkkW8IU414Tvr1vtHpi/78AUFJM9Vpw8l6o1rtNA0WaXEyel+GGNbZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTXxuWiKQk5NhTcVfjKUUVE2z59Ij1vyKxt6/CQDpAU=;
 b=nKdtEiMKKvs7zmNf4cXfyCOqFc3O8NoYWZ0HV3yvIy78X4tR7+KlbUQg8sHzWW1mCWwRpuTTRjeCJjkMW3AMDC5QriGahh5ZYHYt6yjABFw2haNhT4uMX984soVBQCBhv6c1qu+VdPkrWyEgdg4++ltMgtC7XA+LIRFkILv4Nay6gFDPS/lbY6lPxc1i5LmX7+ruznQSYYNmvBIXDGI7aY11DrnjKFf+e9TasyolnpfWe919Gsshov4WrAqNVHA2VURT+pbOcGVLOrakH2IqvElvnaHnKgx5u5rFPHGKl9PUUyQJKJOxfazdC7nch1T4pf07uYxAOceW6LIQRzpI+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTXxuWiKQk5NhTcVfjKUUVE2z59Ij1vyKxt6/CQDpAU=;
 b=z/IgQZ8OoozKxKF/1xDtIcbKL32WBowZL8LG2EaHQTVGDyGETngpX3f77I3Is9FWiVp3OK2H0TbPfnit0KqISbIggVDlfsBOq3wHUg4OK0eOl9ZcgbfrnnLFHIUk+pizklZkhiDiN3mOABeo/1bGde6koDCV0bq+C9xHbObHprM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 09:18:49 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 09:18:49 +0000
Message-ID: <c42b2588-b700-46b2-aead-e31d85ca7ed6@amd.com>
Date: Thu, 18 Jun 2026 14:48:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: ti,tps6598x: add TPS6699x compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, bryan.odonoghue@linaro.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260613162335.1490514-1-radhey.shyam.pandey@amd.com>
 <20260613-adorable-sticky-skua-6eec43@quoll>
 <9825384b-8e36-4c16-a10c-8abe9d000b56@kernel.org>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <9825384b-8e36-4c16-a10c-8abe9d000b56@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0143.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::10) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6caca6-69f1-406a-5133-08decd1a9b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i0fhP7I5fGOcWHMV8fR/mdyb2T7pUUlx0rJVmFYaVjpAZIwAg2NLoP2z1buCQ2dOxIG5SgoYWkq92gK3FKUM9c2f2CdNvjUvxNbGywIQ+mQraPjlkipmWew7wUHADSNmjPcAnL4prmRx0alTNEJHhFKU9xU9/ixuozOOXUVOk7v88PzEmU7aT0/1R8O7iwRb/TMUtTfDGDUd1GCBjE3G6o6JvNN0uwKzOVhqT0sj7H/F57a7ySYZqwJXPUhP1yHy//81PApl1ByGSni8GFtedssl38S/L4/phrfZOdTqJpXwpQav5UUkFQgGx5mYc4AAhdeRIRK0Uji1jtYmiXxrlZXgb5wEoWT60Ul0kISVgd5OFSxUPTWAqc9Ug9klm607VMKL3jiQ0UriAK5fQ0ZBvT5irge4VvheOIwlVln1gdhuu3JfFc8gxDYA8a8eISV0SKvA3yU9pfKskA6WCj6svRLTIC2VxS3CVmQvC6+BtURp5ssg0TOOmR/X44Z5mHC8bFN6j7rbqnWU5P3X4oxR4R1B7tLra9urmIoCroG7amFeljnVsHHRUDP5exZ7VoHHWuA1GPMfCt+m0u7oEDnEEBqlkHZSBlRxzKMKQ1vF/5nysOf+/7dWuhdwjP5sDLrFQFnbkkTtFHN/t+BWZHRk5rincys29sakelHz9RftL0Fw61fDbuI6D5rr12oUOOZ0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmRUMCs0K21YeE1kc1BSUFVEbmhjTGc2cEJVTjFqTGJ5Rk9RcU83TzdFOGlT?=
 =?utf-8?B?bW1FL0c3bWRjRE1KbVVBMy85bVBVY2ovbEN3YngxbmJ2bjNsdjRiWWhrcjht?=
 =?utf-8?B?akhGTy9KUnduTGtPQmdLQ2pUeUgxcTRKNlU5bnV5bnVOak4yTCtOaEJrR2xm?=
 =?utf-8?B?dWVUSlFBOUUyaUZqUmxTdGNpRDV5ZTdzZG1QR1FSL0FGMWxGQUp3RVEycUVC?=
 =?utf-8?B?L1JneEEyc3dJZlB5U2NiZFlTd2JHWk9aOEJWRytCOGRpQktKVDZkMnZZY1hH?=
 =?utf-8?B?NW5ZbVNtdFJpblRDV0ZVeVlzbWs1MkpmUFc4OE1TNW56YVpWSU1XRGFqdDVS?=
 =?utf-8?B?NGhmRGR5UjF1dzh3dm5kOStNK2pjbVdIV1B6ZW9OWmM3NTBtTnJtU3ZDQ0hj?=
 =?utf-8?B?ckhrTmdqTkJmQjlGamVCOTF4by95eFFvTm1zOGNCTmIzRDdXb1lnYk5lU3VF?=
 =?utf-8?B?cFltNFFQSkhKMGZjbkh5TnFGQmkvVEppYzgrUWV0RkIvMkN5Y1hEWGFYOFBu?=
 =?utf-8?B?TmVKWU5nSVZJVDE0L09hZjV4MFZnRERwYVUxZnE0QjZ6TWRmSEF5Z0YxWk9K?=
 =?utf-8?B?L25lT1RoZUNhdWh2VVVNSTM0MEVNdDlLSmdxTE5kQ0dtdTk3NGZpU3dZL3ZT?=
 =?utf-8?B?T25QN3FCbWFqMkVIVlZZa29NTktBQUNLbVc5c1Nzbm14OXBYQm45d2QwQnhW?=
 =?utf-8?B?ODk3bXdPeXhOK1RlaFE3RDlqUHpFREtYYTFWQWo3TFlIbTdxd2QxbmpvYzBK?=
 =?utf-8?B?Q3JnUlh4ZXUrQ29uS0xtdmdVSUpDajFPMmJhVlZselgvWjhJOWxnajQyWDdJ?=
 =?utf-8?B?RHVBK3RBNmRQakdydnlmd3Y5L2VmUE9naENENGkwMmtqNWZINlFnbmdrbE1I?=
 =?utf-8?B?ZndvaWx4Y2dReTJSWFd6TlBJZ015WktWK0cvRStkdG1hNDJqd25qYkRmTDh1?=
 =?utf-8?B?ZFBEWitwWmZEK0JaN045L2NQMlhaMlpjdzQ1aTJQc3dTb2MwWWwxcTJzVC9K?=
 =?utf-8?B?MG10UjhlcEVIUnBrS25VZWZsT2V0WTNETm5nNU5sdndWRmJxWUxLK1FjSXN1?=
 =?utf-8?B?MjNnQXBjWXNmZTRYNlJZSkpBdk5EcUVteitOTGhtYUw4MjZBaVRMUmNnVXJK?=
 =?utf-8?B?WWRpd2ZTajUyNlREOUVsV0lGN0RnM1dFcEwzeDR5QUxlU2Q1QlM3L24vb1gr?=
 =?utf-8?B?ckRlUHFObjJhbC9Nci82amNDSndQUVRZVWl2a1pvQlZVOE5Kaml1aTl1cXYw?=
 =?utf-8?B?U2NjZldhZGpRcmdTeHlBWXdWOUJRbEpoYmVzVzl5V2pXb1lqNDhPa01GdE5m?=
 =?utf-8?B?cE12SVlDYzVnbkx4RHRhajZjM0NKUllEbzFmKzdvNWE5Q0FXTTB1bVdZOHhF?=
 =?utf-8?B?NEp4MDR6NmdBb3hsTldWK1JoU1BFYU9VN0l5VFFVYkZETHl6b1lxNUIrUENY?=
 =?utf-8?B?RVVVNnBjVGFqUk92eDdDN3UwWjUrczhjU3JKdDIyN3dTSzFTM3ROeGlkZGx2?=
 =?utf-8?B?QmplakF0MVliSXR5UHEreFZtVGcrL0l6S2lkakgwOFg3SnR3Qld0N1J5MHJ0?=
 =?utf-8?B?ZWxmc1NuWEF2YVVybmxJbndrVGU2Rm1kT1RENFAxSnQ3WXN3Q1pEdCtlQVdD?=
 =?utf-8?B?dk90TWxOblBLSVNyK25TU3A3UHZGWkpzTVA2bkorYlBtVzIxRXhrcmxZcGNC?=
 =?utf-8?B?QU1TVTVyMzNLN1UyT0NFQjdOUTRyeEZBWGZiNEo4UHFvYlJOVnRWZTl0ZkRs?=
 =?utf-8?B?ZEwzSlVpV3UweGg0NDlmVHEvVjNsc2VGc1c3TndQL1B0TVdSb3kzTjZFenhW?=
 =?utf-8?B?bzRVRWlwRVU0TmsrRHhoZms2TytPeTkvT0JDNjVLTjRGaVRxc0hXSlFpYXdM?=
 =?utf-8?B?VkJJeWZRWjlXaGdGTXVGK3FMZ25OSmtFaUtSNjJJTmlMVWVGaTVJWnpuaDE4?=
 =?utf-8?B?WFN3d0JDdEJGYWtoMFltR1dWaFN2RFpxc2ZjZlh6RnZVbXNkNnV6MFNhd3gw?=
 =?utf-8?B?S1lsajFDa1phZ1lwbDFndmNmR2owT1BIZWNJWXNPcWowb1pPeXdRMWg3blZB?=
 =?utf-8?B?YXRzTXduTTNhZjRJdm1lS0tyWkdrN1dUVExBcTdaSk9MVGlDanBHSnFRUnlD?=
 =?utf-8?B?WEZlY205ajk1VTNkd3p1a3NMZXFWVVh6REZEYXlJUGV4aHFGQmJXUGhJczZC?=
 =?utf-8?B?YUtIQytJU3VBbERGQmtFL3JvcjhjWVA1b2xLbmxIL2tpUU1XUmJ2Zy9hU3h1?=
 =?utf-8?B?MXR4V0JUS2FWem1NQnVRcmVPSDNDY2h6MEpmRUtQL2ZXdzVMUTNDaHRwb2x0?=
 =?utf-8?B?M1FFL0VFeGdOSm1QVVdEeWtRcTlFZCs2WUhQQnZFbWxmYWIvU1p4Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6caca6-69f1-406a-5133-08decd1a9b81
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 09:18:49.7717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGUZKw8tNryOI+M2q2BxnlGe5/sjdbNoYMvFTm1ppY3kKN2uhkb2k5Dw1KPkmmht
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268

> On 13/06/2026 21:08, Krzysztof Kozlowski wrote:
>> On Sat, Jun 13, 2026 at 09:53:35PM +0530, Radhey Shyam Pandey wrote:
>>   +  switch and Power Delivery controller.
>>>   
>>>     A variant of this controller known as Apple CD321x or Apple ACE is also
>>>     present on hardware with Apple SoCs such as the M1.
>>> @@ -19,6 +20,7 @@ properties:
>>>     compatible:
>>>       enum:
>>>         - ti,tps6598x
>>> +      - ti,tps6699x
>>
>> Family compatibles are not allowed. Please use specific models,
>> expressing compatibility (my slides of DTS101 talkmight help you if
>> something is unclear).

Thanks for pointing it out and the recent DTS 101 talk at OSS India.
It's clear now , will rename the compatible to match the exact
device i.e ti,tps66993 and send out v2.
> 
> 
> And where is any user of this? Why do we want this binding in the first
> place?

There is a user of it and will include the driver patch as well in v2.

Thanks,
Radhey

