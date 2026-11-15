Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794752093;
	b=oJDN2S/jxIbRMTnlNuJwoMaSGBO2Y64NbIRDUwSi+ylrDlz/N7PAcccMkbnkvNqXcGLT
	 EuKyrZ/U6fo8xchCMIfAqsMv6wjUXSZ+sPbRs/suHoJYAseqzBrf1AooJNeJ6quh3DIZ3
	 AFtwdtZZdoZIvpUP0KlCCf6uCvhakdwJFb7glRw3h4BHUSqVBXhnB0/hQgxWkrCp7e+hm
	 PAUG46ZrBvNyoISNxn/1L1XA/TCIHsAIl/MaIgBvAzU4xZ/wnYcqh1MJRlC+6vqa6+QKG
	 i4ygg/wXGiFYkxSizDwB5PIDy8mC1rRgM6EERcP6VkXLXQBLqDKlpLu7U8Wu5eMMXIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752093;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SNEir0aIefAnx1gqyv5HO9zNM5JwHWikEAPC0tKfamE=;
	b=c58wEWs6LtMqXAi7CHctiDlfKOt8niHw581d9fcQ15ms7UEW6nymQba9yG1AXb4KsJ0V
	 XiHWV7Vxnou4tBtWvHhCq/ZjL6d+BniWOfWRyRw1B8gEt+O/yUrMZRVbaxYn5ywJFOd6+
	 kkRFHz7wkTrEl7SQljENR8EgAnJZP+0zIwiVvnyucrfsQceMsJbFCfehqiIdgEoqmUtbr
	 h3+4XyiZnZvA4tuzPQIiLxTPy0clSmophPb2SceSiGQgetMOpHYiMP46g8bTFG/sRY5aZ
	 /1QhgbpJF2EAudhZvAMliPa3jCmBC6X135mlEvc2iCKcAXXkq8gtVIEzt2Jp9fdAGTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=azCoOWsX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.64
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131EC606A31A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 14:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 131EC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=azCoOWsX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D12iNbBoPeGLCKrBSoc8l/HcM0RC4OY8ZkhQIlodfFLR2WIz34YXHY9pimGy+wtHgLn0ajrpBOxQwovfeUyOHJxz+txCD3NaM++zOwo+l3y0iXzeWhODJW1pQiIqQT9G1/pe+pQrmo5qJEAbGuAD/f8HusvaqayKzjIOVnkSzkz2AOhU5QKB12RHpwgTAmvof80METGx6f5DjBk7CGEYXHT2Nu04cIiwHpDbqmn+sxjKoTQkit9fxDg8+5rf11rKJ9euLzA17sdvYqPFWXQH46Knff/jG7w1X22wrWupX1XuOtyL+lTdQgp8X2+/UQnYlafu+AgEMYtfoFfixFLSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNEir0aIefAnx1gqyv5HO9zNM5JwHWikEAPC0tKfamE=;
 b=qGw7V7Pmu9zpjAJlr/NceLZ/bZOHm+gpI4HOubDq1yyp4h1f4xkNDrtq/7mfdqzmvDjZpowvJ9kbJzGrU4uztSCnUbURDR1x/SjpInuodlc23laHm9t7cONAwhO6yhSibR8rdbO+ot2oVInrKnjd+ZsYLUiKefUgjRZkst/d9jvynDH8GnIRAGcuXu7urzn2RtfDMuNjhQeOaGXuZUgBe77xH06W5+vMDetCLp3cn61xZNdq9Kqofe6uDP/ji1Duel1kTMGyVnRm456luJiaVoyeRVT5zSGZHptfHDSZM4cwCYjTQ6+MJ468sGXtOO0ReeVFeVjxkl6XMThdOZ23vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNEir0aIefAnx1gqyv5HO9zNM5JwHWikEAPC0tKfamE=;
 b=azCoOWsXoyRdoxpdPttPCtGAbBgybCtT6fo1ECgAroReA1GZy/AD/o/f+WGUpa6T8khlfdO2oVf76X873t/ARtTqXsGJsftvYHbv5co1vlH2AgUVnf3kq3vrfMbyhvV4RAXONXTGJbd5klVpoPX6ClibZJg4ieUSTo6uysKFHxU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 14:13:44 +0000
Received: from PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc]) by PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc%7]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 14:13:44 +0000
Message-ID: <dcc400cf-809e-4b7e-a14c-e4b2f469909d@amd.com>
Date: Sun, 15 Nov 2026 08:13:37 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in
 SB LINK_CONF with TB5 device, link stuck at Gen2
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 James R Taylor <jrtaylor11@gmail.com>
Cc: linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
References: <1794143745.17311.hermes@gmail.com>
 <20261109111852.GQ176724@black.igk.intel.com>
 <1794223545.366398.reply.hermes@gmail.com>
 <20261109142041.GS176724@black.igk.intel.com>
 <1794235167.3657.reply.hermes@gmail.com>
 <20261109153955.GU176724@black.igk.intel.com>
 <6af1e999.9efe04cf.8f35d.ae23@mx.google.com>
 <20261109155007.GV176724@black.igk.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20261109155007.GV176724@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0182.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::20) To PH7PR12MB9174.namprd12.prod.outlook.com
 (2603:10b6:510:2ed::9)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB9174:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c049fb-5357-4a40-0aed-08df4322a869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	sJ03Mu13xfyf+KxYr4EBStrKF2/x1HFsdtsP1Sd/rwNkeBUcvSdfRH+aP2rONj/pJG1ckiz/BSVutg1fFI9Vk0wxo60jts2bm20FE/ItWJljbMETpRhIOrIo8G7FbdhakFVJ4rgnmgFH0BAAbu3E0PONNv5w8k6vkBQs56Nb+Fv62NV1ATMW0GXK4icHqJJoY/aRSqgNbNVTEly1bUTBfxRTGtFNhPU5WN6CeZHfAMvrQyv90QDIolz1jNf8/khHRsrg4uxSY4Nb+XjVPfk+Ad7dqoXCVYP5U60Yi13VvdXVjCMn81bKYZ3RaKUAsbp0Nftx9JdmUptYcyQdYLvj2nYq1L6UhecaYz7KNKV2W8V9jklMNlOMn4v0iZ5P9a2wGYzomW5KoofbdhY9WlzwScfWHxslw4xk3++mVIFst+6aIrqFqqLk9588ZM84GBi+bwRfN+FhlHXYkhX5v3UvoRj2n9OG33MbOv1Kp2qp7fM27tno2E91CMMBSsInP+mDLhym/43pSnAlximlPgbLioDMSfDvRhoIpNDoqfx5xX81gffvNkwrIORHDwvZrZMFw6RbTNzXd54FX4F4DkLZRZrLTJToRCEPVYPNFBMmDHsr3g4W1D1EEzOhCYCjo3gaRZdn/kPYXaG/V/AWnMMqepMny7ozAQroyWOwd++rtD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWFwcnZjMFFNM0FEcERpU0dZVzNZYms5bms3MTlIeW5kV1lINkhIUEFIMUhR?=
 =?utf-8?B?bTAyd3FNYmVOeEt4TzgyVkUyeis2c2VVb0JPQnFmMVlEODBDN2xWZytlYXlQ?=
 =?utf-8?B?a2pRLzMrc05Zbm92YndOTnNneHZ1RGQrSXlwMy95QTMzTlI2cjNHNlpFa1FW?=
 =?utf-8?B?eTB0dHIyTTJ3WUh4WkFPa2hseW9zeGJKZ3VNcStvajFucHNSWWVURXRPVUZT?=
 =?utf-8?B?S0NiYzVtRVBTaXB2U1BuUjZTT0RTU1d5WjVWN2VGWW9WYVhJaDBSM3RnbW0w?=
 =?utf-8?B?bEJid1BIeDVlSUpKTmh0TjRCalNUb0FQYjNZK2VSVjhMNXg0aGgyam13dVJN?=
 =?utf-8?B?ckk3UHVSZy91QXZUQzZPRWtNUUFYVzIvanJSNG1LazlYSXdWQ2d4Umd5QVRR?=
 =?utf-8?B?dFRDSlFVaVlmTFlkcmsxUXJ1WHI4dDJHK3U1UEFQOUxVcDk0cllyZFpmK1dO?=
 =?utf-8?B?WHpXOHNnVmdFdDlwVnN0a3hvK3k3MDhmWVhkeUNTdDhGUTEzdGJQMitwM0pJ?=
 =?utf-8?B?R2g0VW9JWll4NzVpMjBWMEpoQ1ZRWVh6R1FyLzU3UTRRUmh0OFMwUWRkU2JW?=
 =?utf-8?B?a2x5dDhxQk5ZR0xCbHZRSUxCN3lBNnlPcUhaTjZPSHNoaHpSKzYyNEdoUzAr?=
 =?utf-8?B?Y3RCOFBZOWdURjZPT3p5Z0VMUzBuSzUzMTRjQ3QvZnpydEs4UUxNUGJtM3Ns?=
 =?utf-8?B?ZmJ0azJEc1IySFdxL1NVK01TSEVjK0RZY0tZTU5nck9uNTFreFoxSmUySXND?=
 =?utf-8?B?QW9CbVFjNCtJM2dKQ0QrUkJLVFdUd2VzVGtPYzRoTkxuS3U5SFVBNHZvbGhK?=
 =?utf-8?B?NUNnVnRZb0dLd25wYlNML1ZTMnNtVmg1QUsxQSt4MEFWYWJ2bnVzZ1E2Nk1V?=
 =?utf-8?B?Rll3cS9ZZnk5eG44Sm50ZXFLbEE4QnBRd09nTzVPajNublcwb0EzS214dldq?=
 =?utf-8?B?QlNFeDZBVFNWSy8zeERNbG5wOENMRGtzWm9BT3NwOWlsZWp5ZFRyMlBQWVdH?=
 =?utf-8?B?QWF1R2NLYnFZa1pXZmMzQ3FCcENsM2FkOGJyVTRJRGlFbjNTc21qZUQwbCtM?=
 =?utf-8?B?R3lTWXBZdFlPV25EZnp0RHlCVXNzQnhYUm1pakJvRDJXMzlSMEVPYTdpWENV?=
 =?utf-8?B?a2JKVUwzK1Q3ZllocnI2Z1ZwZXdJN1JxNHl1ZXdFOE9Xb2xOSCtDZ2MxS0kv?=
 =?utf-8?B?ekpYMnNWdUJ2OG83YXl2T1hQQlE3YXBDZzZSQ3NSZldLUk1BT0xPd1NBcldx?=
 =?utf-8?B?UUxLL3R5UFBlVVZJeWdMN25KeC9UR0ZRV2wvODV5a2k3VXJEb0dySlpkOFVq?=
 =?utf-8?B?d1ZCYlJPaHJCZVBxOVJKdXorTDU1ZHcrcWtqT210L1VYajd4SGdVMGVySlVH?=
 =?utf-8?B?b3A4RmpqTm0remNuME10QUlvRW9GNEZaVDVFQzdRTW0ySjRRalp5eVVvTStC?=
 =?utf-8?B?VEhudXAxYzVqVFNHQlA1TGNJa0x5MzdLb2FmakpveWtCNFl4WmluS0VtZm9k?=
 =?utf-8?B?S01NU1Q1bUVSblZYYllkS2dxblVvMzI3K0Nwak1EKzQ5R3RUajRpdG1FTkUv?=
 =?utf-8?B?S09IdCtWQjN1UHAxWndVNzh1S1VBQ1FFZ1ltQVZBelV0cDFpV2RWYkp5Nm1n?=
 =?utf-8?B?d1hCOWdBNS9FaUE3MEZleWR3UWhsRTAwTTNOa0w3TDlHZVhZM3N6RURUNjRj?=
 =?utf-8?B?dXIzMEN5N1I1OG5maUZRRUJiK21PMURQTXU5clJ6d3Y4RjJ1MkpqRGZ2RTMv?=
 =?utf-8?B?NGg1WmQ5NjZ2anhRYzFLMVZzaHFDaGF4TmFGSFVhZ1ZyVkdUSWE2T1BITTZn?=
 =?utf-8?B?NnJDNWxvZ21UenFwbll0T1JkZExicUQ0bjdjUWU5d0JCS2J4SFBIZzFzbXVk?=
 =?utf-8?B?Q283cUpTSWpSaXJWdFdWVG1oT3FjdWhMMCtmOURPM09EbTBrQUY1Nmplclhy?=
 =?utf-8?B?S1JFa3JKY3F2Z3p5ek5KcENCMC9KZ0J3ZDg2aGNjUVFhOW85U0xlQ2xNL29q?=
 =?utf-8?B?cXk5MHV4aEZQak1RalRTTkJidzRwRFovVndhdDlpQmp6UHNJNnpPbm8rMksw?=
 =?utf-8?B?ZmlRa2d5cVpxQ0EvYTkyT3Z6ZkRBNERhSDZPUHI4eExreWhHc1VISVhTYUJR?=
 =?utf-8?B?NGRkTnluSTFiWkpMeTdLWXpzU3gzQm9VTi80OWNSdXEyVWV3TVR4WkRBREtP?=
 =?utf-8?B?SlNwWlkvY0NHZWVMc25TeXFqQWhTbm9mOW56TXlZUUV4QkxqdFZSYVJFYWUv?=
 =?utf-8?B?TVpoQkNNM2lienp0VktwTEdaQVpiSVoxejVrN2UwcENtRStVcVo3NE1MbVVK?=
 =?utf-8?Q?BlAEsPNyIXATePcoKs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c049fb-5357-4a40-0aed-08df4322a869
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 14:13:44.5309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Te805eZa13MJn/Qh5ambDjvbczvWlval5XUcmnFitAQ0XYxOVE4xj/XQOZIqWbSJtV9V0hi1sadKPrNUAIL+8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810



On 11/9/26 09:50, Mika Westerberg wrote:
> Hi,
> 
> On Mon, Nov 09, 2026 at 07:41:13AM -0800, James R Taylor wrote:
>> Hi Mika,
>>
>> On Mon, Nov 09, 2026 at 04:39:55PM +0100, Mika Westerberg wrote:
>>> We could still look at the PORT_CS_18 but the driver log already tells that
>>> it is in TBT3 mode. What kind of cable you are using? Is it short TB4/5
>>> cable or something else?
>>
>> It is a short Thunderbolt 5 cable: StarTech TBLT5MM50CM240W, 0.5 m.
> 
> Okay so definitely it should enter USB4 mode.
> 
>> One retimer enumerates on the link, 1-0:2.1 (vendor 0x7fea, device
>> 0x1032, "retimer NVM format of vendor 0x7fea unknown"), and it goes
>> away when the dock is unplugged. I haven't been able to tell from
>> Linux whether it sits in the cable or on the DEG2 board.
> 
> That's the host side retimer.
> 
>> In case it is useful, here is PORT_CS_18 from both ends, read just now
>> (same boot as my last mail):
>>
>>      $ tbdump -d 1 -r 0 -vv -a 2 -N 1 PORT_CS_18
>>      0x00d2 0x00002f00 0b00000000 00000000 00101111 00000000 ../. PORT_CS_18
>>        [00:07]        0x0 Cable USB4 Version
>>        [08:08]        0x1 Bonding Enabled (BE)
>>        [09:09]        0x1 TBT3-Compatible Mode (TCM)
>>        [10:10]        0x1 CLx Protocol Support (CPS)
>>        [11:11]        0x1 RS-FEC Enabled (Gen 2) (RE2)
>>        [12:12]        0x0 RS-FEC Enabled (Gen 3) (RE3)
>>        [13:13]        0x1 Router Detected (RD)
>>        [20:20]        0x0 Cable Gen 3 Support (CG3)
>>        [21:21]        0x0 Cable Gen 4 Support (CG4)
>>        [22:22]        0x0 Cable Asymmetric Support (CSA)
>>        [23:23]        0x0 Cable CLx Support (CSC)
>>
>>      $ tbdump -d 1 -r 2 -vv -a 1 -N 1 PORT_CS_18
>>      0x00d2 0x00902f01 0b00000000 10010000 00101111 00000001 ../. PORT_CS_18
>>        [00:07]        0x1 Cable USB4 Version
>>        [08:08]        0x1 Bonding Enabled (BE)
>>        [09:09]        0x1 TBT3-Compatible Mode (TCM)
>>        [10:10]        0x1 CLx Protocol Support (CPS)
>>        [11:11]        0x1 RS-FEC Enabled (Gen 2) (RE2)
>>        [12:12]        0x0 RS-FEC Enabled (Gen 3) (RE3)
>>        [13:13]        0x1 Router Detected (RD)
>>        [20:20]        0x1 Cable Gen 3 Support (CG3)
>>        [21:21]        0x0 Cable Gen 4 Support (CG4)
>>        [22:22]        0x0 Cable Asymmetric Support (CSA)
>>        [23:23]        0x1 Cable CLx Support (CSC)
>>
>> (The wake status bits and TIP, 16-19 and 24, are 0 on both sides.)
>>
>> So both ends are in TBT3-compatible mode, but the host side reports
>> Cable USB4 Version 0 and Cable Gen 3 Support 0, while the DEG2 side
>> reports Cable USB4 Version 1 and Cable Gen 3 Support 1 for the same
>> cable.
> 
> Agree it looks like the AMD host only gets the link up Gen2 for some
> reason. It could be retimer/PD firmware issue. Anyways I'm adding the AMD
> experts if they have any ideas.

I'd lean on more likely a PD controller issue.  Did you already look for 
a BIOS update?  Most vendors distribute PD updates with BIOS/EC.

If there is no update available; can you start with reporting to your 
vendor and let them reproduce and get some PD traces to confirm?
