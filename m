Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013078.outbound.protection.outlook.com [52.103.74.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8113FA5CB
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 11:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.74.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819097; cv=fail; b=ThWQrLCybKkSgZ8KM7j56ErFvX/KTXwsuIBfb7zvLnPy054YwDNW8uBNP4IZYfcjICoi5qA5oNSpYX5fZ08B3fAcKr52UPbzdp47sMp/dj74b6uYdn3NZsmI0mf4hctqd6SEpKq993K94nbU7lc6e3dg7UjZQlPJr+LP30R7Ntk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819097; c=relaxed/simple;
	bh=Z6WB5bOyf2SU/ulq7QzLNrkmNYRwc5cZ6yA44EyNxv8=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=QsoEOhNZlIjX8SA/q9HBnwNA3uvW8seyjZF7+zXkLBeBLjN4ce8y9x5u83JZYqGkKKVOxBcv8CIOfullRyx69ql3zaONYPhYG0/tpXcVuwoXcdbjVx+esvF4lqDkPeZqBfYPGrS4OfK93mGTOgVNWsmJfrNxJc2s3O7Nxtt53Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=JYyVRAOP; arc=fail smtp.client-ip=52.103.74.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="JYyVRAOP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7DBijcNuRCtED4ACSdPWGNdeoZaBru5greSWih3zZV5LeVH9+hLVDN/ANK7iSaOe+Sk69QFh4cUu58XKLjkqewi9U2q11GOQu6DQDPWD7DYctt986DVffwcs1CLzM9nFWivi2035RXX0pjUjNHYbV/OOqUvUgSqiLIYBEll6krWDZedmYfJuGfSJyNonJ8CvFipMK0pVIXDKNP72Oq4nBZy2qAKILWPe2ndAJqS7t2jay48I5eI3OLJtOCr4cp9PcFcnAoYPtau5sljfHryo206IIpwbkPL1gawssONBJbw2IlwhV3hdPcY85nqtdeebAxeLStqHpB6x5hx516H0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii6mtg/denUvbN8hn6/9kRMOgBRyebfWjvy8tIQoHJ4=;
 b=r1M/g6W6grtv7g0c3IgRJFOQpi7QBEfR+x2vas9ihSA0RN6UMekSlPDHSReXoCZT/igpE2STNRQN0k1KnvMroQRjGzdc68gU3g3CGVD62fJ78eHcAeh2WNIsTq1FnXw73BKzGwBYLvA3wk9tLilTp3k/Us7LDnWVLpw9dI6j5p7kVa76KGn2eysAEpAGmoHgYPwROqyVww7Jrz+u6GpThQyF5Cc9gksW57POCU2a/2BRZOlLAxn4oMFLJRIA3IKMvTCqoTycefTaxUBPncYdpTx5cBLVFcgvGseL4jmet7idUDUFHF87UDSgFGxsg5roFh8x3rxhwRMRk7m5DbfoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ii6mtg/denUvbN8hn6/9kRMOgBRyebfWjvy8tIQoHJ4=;
 b=JYyVRAOPBJZ7LV4WAq691e7YYPlN3t+u2VIMKo4pjW7IIisq5p4mLBxb9uX9PeXq6t+7O6AJOFu7AxHHY7Iq1TD/V2DjGpOnrnIM9QHGO3v6qzdtdONT/rqUxVdtnxSM/pbxeRKhlIiooFRIhtARhfEH0lPvtdkoxwLQZFG2qUBF5e0aany3ET0cCJfU6VnJH/kQrlDgFbwAbtU/CRZ+zkoSwRk58s2nt5k+gkXy4qEPsYIU1EjG/E0x76hQrifhYCJtxglzIf9FmqXzI4o8FfALhsyOpwIcSv1gylM34/zFd0PRXrAlPm9XoCYcYLl4XTkjvshu/mrYhDxJqLkPkQ==
Received: from KUZPR04MB8968.apcprd04.prod.outlook.com (2603:1096:d10:44::6)
 by TY0PR04MB6445.apcprd04.prod.outlook.com (2603:1096:400:278::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 11:31:33 +0000
Received: from KUZPR04MB8968.apcprd04.prod.outlook.com
 ([fe80::5eef:f449:1a9c:36e0]) by KUZPR04MB8968.apcprd04.prod.outlook.com
 ([fe80::5eef:f449:1a9c:36e0%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:31:33 +0000
Message-ID:
 <KUZPR04MB896814FEFE2D859FE194F45585F72@KUZPR04MB8968.apcprd04.prod.outlook.com>
Date: Tue, 30 Jun 2026 19:31:29 +0800
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
From: DongliLiu <dongli.liu@outlook.com>
Subject: [PATCH] usb: typec: ucsi: Add bounds check for enum array index
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0112.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::10) To KUZPR04MB8968.apcprd04.prod.outlook.com
 (2603:1096:d10:44::6)
X-Microsoft-Original-Message-ID:
 <36849719-1588-491e-8e99-18c85f29fa52@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB8968:EE_|TY0PR04MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 519de6ba-8a74-434a-b35d-08ded69b22ea
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5062599005|8060799015|51005399006|6090799003|5040399003|23021999003|15080799012|5072599009|12121999013|19110799012|40105399003|3430499035|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2pEeHFXbW5hQWJxMGoxbjZ3SGZHd05GV2ZKMlQ1elVyME5laHBTbklUditk?=
 =?utf-8?B?cEEyNmpDTFBsREMvQVdIMGNoa3hQcjJnL01hL25XQUtZQ3lBUk9TdDk1bGNp?=
 =?utf-8?B?Z00vTy9kcjg0N21sZVZrQTg3NVB6ZHNIN3FnenpZdXdEeCtuMVhJSEpMaW8x?=
 =?utf-8?B?bFg0REw3cGRBK00wenpQbmsvbzBlMEtTRldXemVyWGdYUTJxOUhsdjJCVjJG?=
 =?utf-8?B?RDBkbUh4WnQ1WHN6eDJvK0c3cTZGTWdLUDlHWUYwbmJzUkpSWEw5RElxai9I?=
 =?utf-8?B?azNPNzEzeTVQd2pBcUc3NlQza2J4ZmJKbll5SnRrZFM1ZmpMRXl1ajNZNjkw?=
 =?utf-8?B?MUN1dWRTQndId0NMSVM2cUR3UTdvbi9YbUhjVkpzNUZnZWhWOVNTZTNqeGhS?=
 =?utf-8?B?ZkVlM25CMUhwL2lEQXlCNUx4ZGNMYm5hMGpTNFRjQ2xMV0FwbXQrVG5Jd1Nq?=
 =?utf-8?B?UFdZTWk4Z3RxNk1iWVd4WFhFU2czZWlYdGRWUGhFRHdKeUkxZGM5QnZ4UkNB?=
 =?utf-8?B?OEtHdTlGSFBpYSt0dE0zcXNBNnR3bnJ2NHRBeXJNN09helQ5ZFN1cWEybGJq?=
 =?utf-8?B?K2lEUlVQMUxFZlFteEdtR1FVUkJSTy9zaXAzOGp2QmRGbGxDdk1zdGxZQmEz?=
 =?utf-8?B?TFdsYktvdGZpbFdGUTlOUjhRVjFKUmplRVBhaVJrMVBlV3NhTTlrZ1JhRFN1?=
 =?utf-8?B?YmpDekp5RzVRMU9FSFk0TDMwcDNSU0lXRHBuTXpWbUlST2lkYUVFMmR2WXlr?=
 =?utf-8?B?aDRPUFdQeE5LSHpBSEJJMnpmblBOeWE1ckVIS2ZBSktvZzlna2JJUnBmVDVK?=
 =?utf-8?B?S3kwZ0NFYjdIYUxzNTJhVkpXdnVSdzlxdTRiVHR6YWxJQys3RGR0ZnEycFQx?=
 =?utf-8?B?aXI5SFhidi9HbUFrVU4vbkJpUGFSc1paNjFDcWx6RUFzQnZJeUJkam83aEls?=
 =?utf-8?B?NmRCT1VPZGRBR1kreDBFRGxXYU5Za2xxYUtueHh6a0RmYjFRNnNiUDY5cVBF?=
 =?utf-8?B?aERoZzJlUElySGdFZ2lyTEMwTjA4cHpUZFJXUGZXNitaa3NLQW0xU1dEZVB5?=
 =?utf-8?B?VzltYnZKUzlhbUFRNG5odW5KL2xDWDAzVmdaR2FaOHZXakZDMUFXNjdDdVVt?=
 =?utf-8?B?enJZbmMxdHB5aENxaC9BdFFIbElYUHRtd0Q1a1BFQXZ1NnhoQjRIK2pRNy8z?=
 =?utf-8?B?SnNRYlQwUWpyR0NQYVVLUzl0dElkaWdKVVdOSmtoT0pxeVpDSHpDSnQ0dTlR?=
 =?utf-8?B?bDJaaDdMVFpYUzNRaUVXTDBQaVNsT1l1b2ZQM29PQ0pKSnlDM0Z1bmVNdFFS?=
 =?utf-8?B?cnE0cUQyanEwdjJYbHdQT2l5bkNMMkliNWdwMTdpRVR6MFl6NWpoTld6dUxP?=
 =?utf-8?B?UVczaGxhL3laV1E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnIwblU4RWlyVWpyQ2FvdjN2WTdKS0MwQnUyaDA5YmsyWmMrYzBCTVlRclJY?=
 =?utf-8?B?KzNKYUY3N3VqY01yMXlQcVFOZS9MTFB3MXVkaFBYcGJhUDNjY01KWnRNcm1P?=
 =?utf-8?B?OUpTMGx5V0FSREtNcXRUN2hkZ1Irb1AwU3hRMlg5NWJQVks2YVV4N2RDbjRC?=
 =?utf-8?B?Tm96S0VXZ0g4OFQ3Um00TmZLREpFY3NqUlhiT0UzYm80THNaeEpOa3RORE1q?=
 =?utf-8?B?blZHanpvRy9YK0oxUFhGVm1paTJaaW1GaXZYWHpMdk5qM1JKMmtlKzZaL0xH?=
 =?utf-8?B?MGdDY2NYZVBZN3hsVnBiOXBtNlN6MzlsSmNsSlMyRFV4aDkyWmFPd0h5blB1?=
 =?utf-8?B?ZEdtc0tUNURqTFIzRVRCcVNacHR1ZVR0UXhVRjBYalUxRnlmUUJvdGRWcXZF?=
 =?utf-8?B?Unpsd0FVd1ZNMzNLZENlcmpRNkpEYjZGRnJDYzlTaVVVenJiV0lCbG01V2R4?=
 =?utf-8?B?cFZ5bWRRaVFRZ044VXgzVVI3c3hKSzU0Nkk4TnNFVDN4MTZ1NVVSQmhpLzZ2?=
 =?utf-8?B?LzFFTDFrcWIxV0VaZEFQMGpsbC9DdkFPWWpaVVF0Q21HNHdIbUppc3gzeFJr?=
 =?utf-8?B?N2FBUnR5ZFJYOVJ0aHIxaXRIN1ppcGk5dDV3Y0IvMXZtMWFMMWFITUtjNzV4?=
 =?utf-8?B?RzBPQjc4TkxIMFAzNTdMcjFHdWtWQ1RKZVpza01RTGdidWorU2FVZFhtQlhI?=
 =?utf-8?B?NmRva0EyR2xPY2dUeXVyajFEdVA1bjNVQ3l5S3hRMVFWaUtwaEZWanhneHd3?=
 =?utf-8?B?NDFkSnczRUt3bDk0OU5NZTdHYWo3K0IxQlliZVpoc2xVdjNFSlZoaWxQQy9t?=
 =?utf-8?B?WlNkWnBITEtaU2N2YnAvN0JxRmVRUVgyS2lzRnp4RU1uUFo4SnhhdVVoK1hG?=
 =?utf-8?B?L0ZPVUI5Q1EyellZVmR4bkhrczVRRDJXS1Nibll6ZmtaRC9CLzVFWXgxcnhW?=
 =?utf-8?B?U2xXRGoxZnFXa3R0UndmNk5ZRUlKUXZtdXJoWTBkd290aTBOUHFEYTRuVFJ4?=
 =?utf-8?B?Z3NvVThsTGxTMzlRTzgyUEJyRThjZVo4TmRQQjlDYmRRSWFtbmhWZVZLazBH?=
 =?utf-8?B?NkNnVGV3d3QyRzRZT0ZSbjNvaWQ2SjZBY01tVERZd1VEYVlidUM4R1lnNjM2?=
 =?utf-8?B?NTZqRWZvcENtYys2YncrYk5VSU5BZExCK01XWmRFbFJJbEZlN1p0cjNmVFhK?=
 =?utf-8?B?VVhCN3lHbTJPOTVYdkdHYXRhK2QvelE1WmRuaWhCK0FiaXNKcnFkZUtJNG9E?=
 =?utf-8?B?cWRrWWtHSEY0UnRSR1gzcEY3N01IQUNnQmlYL1lvS013K0s1enBhTi9RK0Np?=
 =?utf-8?B?TGI0ZmNTcGs0Z09ab0F4VlBsaDd2d2FvVmRHYTY1SUZ2Q09FZytteTQvUG1R?=
 =?utf-8?B?TzlJOGtEak13cWJqNnJnbXJLNkZhR3lHS1dnc20xWDZSS3JOWGMrRUg5OFFl?=
 =?utf-8?B?NzkwSGpLQ2h6d2x6MW1XRjBzR1dEKzRIb0d2NFBrcEFGbDRKOTk4c2JPMFNm?=
 =?utf-8?B?dWRDZGFoeTkzWW15cEYvbk5kUW5LVXVjMEEwRkphMjJJbUlORWhGU2hIVlBS?=
 =?utf-8?B?WE9rU1p4U2VWaVdxb0xIQXlNa1JaQVU3aVg4S09NTFlvUTdkUEcwZVJNSzZ4?=
 =?utf-8?B?ZHFIZVN5M0RxbjBHaTBvc0ZINVBPV2ZUUFJvQU1sUzN3NktFWG5tbHMzMHdy?=
 =?utf-8?B?eTdTS01VUmp2TUxOdlZvejNrK2hQeEFlUTlNcFZWdkhFSTZROFdlN21YTlBn?=
 =?utf-8?B?UHdwZkRQQlhnWktVS3FsYU40OVdoTU5mRmovcXg3eE1YY1NSOXlFeFN2Q2dS?=
 =?utf-8?B?U0xRVHFvcFhjMHVHcC9Xalo4TExtb0xkaDdhN0JMeWlyU05ra2FZWGI0eVdv?=
 =?utf-8?B?anVseHJPTE9kcVgzY0QvRGxGMEQ2NTcyYTd4WllLMkIvZ0JURjdxZitwL2Y0?=
 =?utf-8?Q?STKnaaXu91jw12xJVA90jef94yCjz+kj?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519de6ba-8a74-434a-b35d-08ded69b22ea
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB8968.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:31:33.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6445

From: DongliLiu <dongli.liu@outlook.com>
Date: Mon, 30 Jun 2026 19:30:00 +0800
Subject: [PATCH] usb: typec: ucsi: Add bounds check for enum array index

The 'sop' parameter is a C enum that can hold any integer value, not
just the defined enum constants. Using it directly as an array index
without bounds checking can lead to undefined behavior if an out-of-range
value is passed.

Add an explicit ARRAY_SIZE() check before accessing altmode->plug[sop]
to ensure the index is within bounds.

Signed-off-by: DongliLiu <dongli.liu@outlook.com>
---
  drivers/usb/typec/ucsi/ucsi.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index xxxxxxx..yyyyyyy 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -xxx,yyy @@@ static void some_function(struct typec_altmode *altmode, 
enum typec_plug_role sop)
      ...

-    if (!altmode->plug[sop])
+    if (sop >= ARRAY_SIZE(altmode->plug) || !altmode->plug[sop])
          ...
-- 
2.40.0

