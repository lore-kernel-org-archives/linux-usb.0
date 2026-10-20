Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792504160;
	b=w6RvvmB32R7ec/L+KzpE3VvrBU2jlAUybO4J377fuyz7h+4on1oS/Dy1mFajPU1/+SXj
	 kODlmkNWgt0z/l3WIlSpV8TDulQ+HmhJyvGBOn5y8PdrsE1i0DrxPoDDsaR0uBPhgbl5t
	 cwbsPrlwnjc3tVh8BTB/GBBnf4XQSGJubJjaveei0UzZ3TRpYqzxMlzzLJwEJ39a7O5Oa
	 df9tn3So90f7EUfv7aFsL0GzZass5icHVe3PY7V3XDiUjX7L2dHkuOc7zTV7ZvcahOk1P
	 Gho4jP6Abb5GPOieUInOP94/PHzlcIeWR3i66rFW7UxCT+32zogJv2myMz7JKvEZWrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504160;
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
	bh=w6yhrCDA18P6f3fCzynEd51gxuuGYchkAERC5YFMWZo=;
	b=Ly4blcoRYzoV7Iudm2fO71y5rd5cPqk9RlbBCoSxyJ4s67S5xfX9DAroLIUv3YyFuYm2
	 pmeELuuvV1uXsNQnLkPeVKj0zgke7pLItZ5Mpw0LNobk5xR9QPLm6u8wE+5xfvMtOq/9h
	 slWXphGIL9ywZzkzc+EdwB/Z1uwHSoYA0LYRvqrxPM3SCO39TBTcLSSyrT5d6y0zeXCUq
	 XrCr6/0OtOK+/xFEsF5ht5HUZwXKi8Ai+u7k8d6X0P3GosotIHaHy1U1IQgqEf3Apx1bl
	 CAMnNrQZn6NnGL1Fk9EKNPq5NsWTwGBlF2Vp3Jr5CYZvJ6XkgaWiSZZnscI9CMN4R8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U9IfIDMi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.17
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFA9606AB37
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 13:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFA9606AB37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U9IfIDMi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doSRZZrm+m2tXJNnOEWfU9+liZG7UqyUEO1h+DIvPpAM76zf/H3eM2f4kpaHE+l8+PqOXygDMQi8KGLbi72OJveuSAv2+UmeXxsZ4vNYxyXWhsKvZUG97YExRo1A1I20x2aMkiOGA5N2BK3Rc/tuIrAODBHXp6MG1VfmPQO5gwhGfnGtonef8E7NcnEsKjQAQAwXYcHRFU0JD7aPbPUE5VefGhua57HnUrV/JTvvtDSwPChhIFJn5Qz1w6pmI+DJJN88RbvyTVMdrc5EgxPz7hDKG411lVQCw4ZPZsq5FmTHlS5z+IFYSM1oIGuQfhcfP4Z7r+6uxjymkQCF23hcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6yhrCDA18P6f3fCzynEd51gxuuGYchkAERC5YFMWZo=;
 b=ldpe9Mep/GLzNy1OXfkT1mlJ3Qz3wX6p6jaVHsYxWWUF+C6g5Wh0e+W7DNc51FgzaXStoLqsHO3HMYLJjdHF8LWBG+QtzZyU9sPeZV43NzYdF7eyOFYRSUIzrjgsaGGnW2CX/XffNYIbkLI6zwUee8HVw4/5kwhjjO1J3BwHOiJF9U6c3S2MWn/Ereqa2PLgwXRCvzz+jgJcrKStGcwgqHYsDEM3udOeuNmiHz+cmezouK9X+IHqQ/cABFMJX91MOKTKQXpCbs4VfsKAm7AVLjOpHO6Mm0zesKESXRLvcHOC0+9f5331aeXG/mF0Iu7t+5qvzH4zS4dSzlFJ76LILQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6yhrCDA18P6f3fCzynEd51gxuuGYchkAERC5YFMWZo=;
 b=U9IfIDMiRf7WHGfo7zcuOX9hiVrwWl2eZIPSFKn1Gr7Eil9HVpwD5r8L5Ad2HP5NgBGX5KNMm76Xg8zRy1autQ//ri4lMGkspJMEi8DtEjKzihilnjd9911yj/FU4V/Ofvg0u1uSQXX7D5B4jfqc99TNSvO5+btRQZ4mm1EGjrw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Tue, 20 Oct
 2026 13:49:15 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 13:49:15 +0000
Message-ID: <a9cfb8f4-1bfa-4d4c-af0f-9166c295300b@amd.com>
Date: Tue, 20 Oct 2026 08:49:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] thunderbolt: NULL pointer dereference in tb_dp_dprx_work
 after device disconnect (7.2.6)
Content-Language: en-US
To: =?UTF-8?Q?Pawe=C5=82_Frelek?= <pawel.frelek@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, westeri@kernel.org,
 linux-usb@vger.kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
 Sanath S <Sanath.S@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
References: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
 <CABL4uF=f6Y06KmZ+ux2ZrboiLxivFZMyB_dqc4rTiEtiLd3GLw@mail.gmail.com>
 <20260925052929.GW106095@black.igk.intel.com>
 <CABL4uFn1nTrdxomWgAWs_gtsM5r1owt+4KOk1F39rXTLF3UZkg@mail.gmail.com>
 <20261016055802.GV176164@black.igk.intel.com>
 <CABL4uFncJktAvO9yVpZOjm=uAjLa7291deE9x805i8Kc7tFUDw@mail.gmail.com>
 <20261019061121.GZ176164@black.igk.intel.com>
 <CABL4uFkwcK-5fXWY_csebiW2G8i+49H0kfN5bsmA_wGTAeVBqQ@mail.gmail.com>
 <2d0ba53b-9f23-4fb1-bd97-637711017fa4@amd.com>
 <CABL4uFkv9E1e1qbM-e_5-sS+wvV95Mxm3V79LUftbLDSebAddA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CABL4uFkv9E1e1qbM-e_5-sS+wvV95Mxm3V79LUftbLDSebAddA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::25) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: dacc957c-46b4-4148-dbbb-08df2eb0ee09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Zw+SYTWgWZSCu+mC/IJvOKVkXH0hAG9saR/b7tYAcOmtgNA2gWSkKfJreZLX/0h8iluDBctxSUK78w8rCroJvAZq85eluAWL7FwIZYZzU40hj0v5gcCSj8aNX0KePgfLzb5XrJZG23UsZ3JQDK9JZV+xUUs/z4valVVdHZl0Jz8VlJCudVAE6BoPl8COGqmBrvoU4LSu5l8XDINTTBh6Gf+BcmBPiomhDtmHuO051N1DRgSN7N+l00OGf/TIqFM+i1AQmsNjqYEAoF2nnh7sMgbC1gMKioQhSXLu1uR9Fyc2MbXfI2J8mxisuVPadInyD0ZN0UF/RxxCm5sD553sA4fpWA+SuPZ8AD93PA8UuWLvjsTOmA4B+kqL4n6Vc+HRS5/9+Vbu6RgmkYkmQLxUd95ngc6lQ3kJzjQOfR/vzOEcv+uQsV1kvETzT26uSR05tWHjPecIvEtXX3H2IdBbq26ybKpXRHpT5ZUnhyFpJfoZq/lJS9fYQD8UsWkivwjZnPy2ZsJxNfRWMaty03GEACUBOp2sKMK72PtLwYwhKDZfzczRxLVJAbED/0yKr2QTtiSVsmkPdzg5T0ZL+AHLPDkZTuJDy73QCy0tbJXp6LM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWRGYjBobkdCbGZZeHcwSVVXY2c5WUZ4SkczV3dEeExSdjY5WHJzUXVXUko5?=
 =?utf-8?B?VVZzRGtBZU9ZcEpQdU5EbVhDV1RTNDJjTDhEcEpJUFcwUkxpOFlQdmNzVnQx?=
 =?utf-8?B?SFVVVklXdUpHSklDRjEzbFk3dzZrNW94VkkrQTV2RkhiSU1ZNkZ5aHdCSkN5?=
 =?utf-8?B?clFIZENEaThHVDZ5WEZPOU1ocmxmL2Erck1pM28rRkhONWowRmR3bDFVZDNN?=
 =?utf-8?B?MmJsQ3c0TW1QMDc2MXh6Z3dvYWJxV203dHg2dzZ2R3ZXaWRubjU3ZXRPem5B?=
 =?utf-8?B?SC9MaFRjdGJoQVVZeWNOcGtXbWRpOGx6YS9abDRHYTZ2ZGhzUjRDcStXQlBl?=
 =?utf-8?B?Z3F1SlJVN1dmV0JMd05pZHhlOWtMNE1vbFB0YmpXdS9UMFkyd2ZONSt4VFY1?=
 =?utf-8?B?eFAxbnVNYVRObTBhcUZPazlmUTNkSjlmRE0raWhmb3Z4bW1iRzYrUVliZGVC?=
 =?utf-8?B?NWxpbjI4TU9YRTRURHVwZzBNRTdRMjVMMktFUkJJUm9ra2hkV3RvV0NSVmNa?=
 =?utf-8?B?cjR1d3U3MmhZaGdpUmZzRHp4b1VzSkxmekhQOEVsbEdhOE5LNWdmbmcxdG5a?=
 =?utf-8?B?ZW96Wk90NHdUUDZoQVdvMCtNNml4M0o0Nk9QTnRPd05jSXcrZGpkUnFrbnA5?=
 =?utf-8?B?aGo2M3BVY1RqWis1aG16eXIxeGp1dHFmT2YvOUg5c2VrSHIrekc2MEc4Z1Rw?=
 =?utf-8?B?UUYyNXBGNXdTbHRkSkF5OE1lVEptbGtldElDTmhhUHRxUkZHdEg3OTdISlF5?=
 =?utf-8?B?T1pyTXZuM2JEZEgzOGFQZ3h1aEk3RGQ5Uyt2aXlmNGlFYzMrQldkeHUzVEtl?=
 =?utf-8?B?eUgxZVRBNnRoQnlDc1VOL051blh1MmlPeGJWK1paVGtJTm9nNklvbDNKeEpo?=
 =?utf-8?B?NW1MbW9iN0FzMUNDVjFlc2FMSWJUSzk1Y3FRbm1MN2NVUXFsaFA3QmJTK0V5?=
 =?utf-8?B?WEI5a2RHVTRLa1Jod1BOYlBUUXdrQmgwZjJkU1o1OW04LzYyOTVCRnFORXBJ?=
 =?utf-8?B?a09GaGRsTElPZTd1ZlhUOGtPNU5nY2luL0VYcTU0bkVFSXM2bnNJeFVWeTB2?=
 =?utf-8?B?elEwVkp2bTBVOWJOUWlPOFZFQXo3M1RleFVaVncrNGxBVXd2amdGN0FZY2lV?=
 =?utf-8?B?M01FMXBHaThsUFV5Y0pVL0t6OXk4enVKNWtwN28vbWtLM1N5R1pzelc4cWFG?=
 =?utf-8?B?V1A1clB0cG00eFN4Tzc4UVBCejI3Z0J2OWplYkNaOU5lSWxkZU4yRUNHWHdo?=
 =?utf-8?B?QlRoOVZDZHY0UnpVWXFpMlpUa0pWclg3UWppcHVKRHJnb3Q0UEJhOTd2M2JX?=
 =?utf-8?B?Z29UZGZ0ajBSQXNPMFEwOUZhWE45SjBwZGtINEhYQzAraWw2RmFMTVFmcG1q?=
 =?utf-8?B?eVR6UThQWm1DOVZNZlNZdDE4VUpqUGhrWFhTQzFzcWpNVXJxZHU3QkN3UG5a?=
 =?utf-8?B?UnBDSm94dXE0VEk4RTE3dFltT3VHWDFyMlRTN3RxYXRWNmtzVkNkV3BlWG15?=
 =?utf-8?B?YnRjZW9JRGgwWitrU2g3ZkdlOE5sUDVEUnhSYU41T05QN1hxbWZ2VldHcTRT?=
 =?utf-8?B?d2JRVVJ0S3pQcTFDdUVhTEExd1ZvSkt1ZVNGLzBHQmNBOHNUK2FvL1gzelVQ?=
 =?utf-8?B?WUJQQWNCcDBZK3l4amdTZHhmLzBqZktWVDBmVzN5bkdBZitFMTlGbXg4eWxk?=
 =?utf-8?B?RjFkV0FWSmZvWUJPRy9HYytYK1lvSlk4MTdqT3F4dytIUkYvU3Z0QWcwY09k?=
 =?utf-8?B?VGk1bHBZTUkwaGNNUjF2MUw0QnpSRytRTGd4aFF6am51emVLclRXNllaSkhz?=
 =?utf-8?B?WXVtZUNyZS94K1BNVnlrSGswSk5xeWxEVTdxcVR1dUpJdFlCTEdLam00UjRO?=
 =?utf-8?B?ODZ5U2RLQ3BxQ1RpR210R25uM1lSNmZsOERqUit4eEdkdHF2T1lwbWRVRWZz?=
 =?utf-8?B?YU1lVFh3dC96S3JrNkxzWVQ5SlVicUQ0S0F0V0tCbUNlVXNNYUNyaDRHMnFt?=
 =?utf-8?B?N0JMaGhlTFIzR0daeWVVNlAxeURZb0ZyTVNOVytNRnZHRHZ4bVdTOHBKNklG?=
 =?utf-8?B?T3dZV3U1RUdESGRyaGNEQnhnRmpHU0c5eTBrcHF2eno1b2NIeU5tQWVXa3hw?=
 =?utf-8?B?TlR1UXpRSENqTW9FWlpOUDBiaGgyTjRUZWxjd1FIQnlVRkdmMGZqb0VRZisv?=
 =?utf-8?B?Vy9hRndYTFlqY3pjcEplR3V6TzJNOWpxR00wNUhyWUN1ZDVsa09ZRjdEaDU2?=
 =?utf-8?B?WkgvRWZHRzhvenZjMkdacEozSzBGaW1uVTNXVE9hNEJ3OVVLU3FBOUFsZ0xB?=
 =?utf-8?Q?9LRkOu21XXmyhyNN/1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dacc957c-46b4-4148-dbbb-08df2eb0ee09
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:49:15.4324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLR86HuyaQmHF/GKloae2cqVenmC6uDGYhq0OwYUcDliasNC2V6x4qaOBIiEq5PKsJokamtCx/eYqePjB2+v5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112



On 10/20/26 08:41, Paweł Frelek wrote:
> pon., 19 paź 2026 o 23:00 Mario Limonciello
> <mario.limonciello@amd.com> napisał(a):
>> I have a few patches I was going to propose for this area.  Can you see
>> if these help?
> 
> Hi Mario,
> 
> These are the same three patches you shared on
> https://gitlab.freedesktop.org/drm/amd/-/issues/5981 on Oct 15.
> 
> I tested them on v7.3. 0002 and 0003 apply cleanly. 0001 doesn’t
> apply, so I ported it by hand with a lot of help from Claude (AI):
> amdgpu_dm_release_irq_stream() is a plain static function placed
> before manage_dm_interrupts(), with no header change and the KUnit
> test left out. The port is attached in case I got something wrong.
> 
> Test: power off the external monitors, wait 60 s, power them on
> again, done 3 times, each from a fresh boot.
> 
> “Sending link address failed with -5”: 2 of 3
> “Step 2 of creating MST payload failed: -5”: 1 of 3
> link_hwss_dpia WARN (line 60 with 0002 applied): 1 of 3
> 
> For comparison, with only 0002+0003 on v7.3 (2 tries) I had the
> “Step 2” error 2 of 2 and the dpia WARN 1 of 2.
> 
> Thanks,
> Paweł
> 
> 
> 

Thanks, it hadn't occurred to me you were the OP for that issue :)

Let's continue to follow up on the gitlab ticket.

