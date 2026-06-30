Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazolkn19013086.outbound.protection.outlook.com [52.103.74.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8753CB8FB
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.74.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819435; cv=fail; b=sBULwgBjglGbUUk5kjLIA/8Dpao4A1NRXFVHo8a0ECeg5/mtMmWgPvdi3Pp18h6T3IXVh7q15Jap48nsN7H4GdLUzOEJ1aKmOssJlsMZQnWLnqSL2o9oDN5HkA1b4pfGlJlk9cu+H6D6KW6jEqrFQvxOzLz+wYthbH/Gg4f00lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819435; c=relaxed/simple;
	bh=338o2dJnPxUTrETYGMtI6K8wxxUS9X+spLi7+xaricw=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=PZjO0CI8b7S5M1lXdjDvT0TaMLUrQ7o5E0zb0cpqaNxVcF1u49wvRX8jQMWRRdhcGH119Llqhn4GN3mK74UgXfDMOSO+GGRTcCsQQ7V/LoXBzLWYq+I2drXKVvfBUnPlvyPWYyTD+iisHpyIERRSYLHQuFIoqQdYi5UEQWY/JP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GSaSFYb5; arc=fail smtp.client-ip=52.103.74.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="GSaSFYb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xu8SBG4ZksWIYQYlTRboO0q5kY77gTNR6KTU4gakGokljwkEKttJJG6qbAunwUZ78JhJhXQIfEwtMTZO60kAEqL5po8U5xnCoWMk4aFIxsd2EiO4zjdP9zQL9BPI+ZAkNg6zuhNz14L40y2ugz7uqcy3PfJt6olJUTNudy1wDPJS0d8sGFdivamkGZlCXP1EpU99NHmIcxSX0kOgiGoOmIua71lA6u0A7PdIjeHmAJTR7SDPXoU598Cx+jBPKfDfHVA5Rpm3fC9BKTejm45bqyXBXac+kGeCDyplRaa4vkGN5arieJhNP+2NJBnelmbDJeMA30j4nwsFmS+RO9RnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=338o2dJnPxUTrETYGMtI6K8wxxUS9X+spLi7+xaricw=;
 b=d+xoFFKURUgymlidNBwFeG3ZTkuAomUDPTyMSjcYKdeKdU6Wa6V9TYrO3iz1EC7k5R/ihkZ52M1oo7WUCMh3ajZSakTkg2TY4WE9TMOl1fdkHWft/b0Fpv6f2lrk2or41ZR9XDU7LJ74Hj+9eQQXZ4RsFOWnFNtCx0/Fy11H6s758N+ktDDrPqIK/4/bVh/PfyBhLLq+O8zFb8kX1ZY7RMrOeONc8xGpQSu0BU2tSlR+k/97K5sjxpM0WoszRxanzQoue3Jm1sOyIxhbYUpkSPPuK4pift6BHjieIVX9Xv7FMKXbnJhyog12vzl08ijUBU36aG23A5lFL9Ky6PLGtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=338o2dJnPxUTrETYGMtI6K8wxxUS9X+spLi7+xaricw=;
 b=GSaSFYb5/OvneBOupViI/0EEXn60cqvhMws++eoB7019FekUxoi8hDXZeSs9XklYc7vqmV9NWiyuwa9TaUT8gOeSob23ZY8EsYsmgCQ/IKxD8OvEAoqrw5c6Ciy/PsywfiBPPRjLJbFqZTBPsSIhRoEGjCoKElwc33Z4J0krhq3HnJ5xFNK70zdf5pha6w0sRUEz9xuhsRnYixr6b7eqRDnC/0wPVcfUwEjqI4rqh+90qZRk5D9Zng9WGE1cAc3a0iX3EWC9XcLSo/LXz0J3oiblm4zJjwNtQ7T72+ph/dV8/8f2IZid0uubE4guEpz6QgmkXtmC3C61NsNMW7D8hg==
Received: from KUZPR04MB8968.apcprd04.prod.outlook.com (2603:1096:d10:44::6)
 by TY0PR04MB6445.apcprd04.prod.outlook.com (2603:1096:400:278::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 11:37:11 +0000
Received: from KUZPR04MB8968.apcprd04.prod.outlook.com
 ([fe80::5eef:f449:1a9c:36e0]) by KUZPR04MB8968.apcprd04.prod.outlook.com
 ([fe80::5eef:f449:1a9c:36e0%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 11:37:11 +0000
Message-ID:
 <KUZPR04MB896868553B291C340D89F66D85F72@KUZPR04MB8968.apcprd04.prod.outlook.com>
Date: Tue, 30 Jun 2026 19:37:08 +0800
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
From: DongliLiu <dongli.liu@outlook.com>
Subject: [RFC] usb: typec: ucsi: Guard semantic inconsistency and cleanup
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SE2P216CA0022.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::9) To KUZPR04MB8968.apcprd04.prod.outlook.com
 (2603:1096:d10:44::6)
X-Microsoft-Original-Message-ID:
 <9074cbf9-ca4f-4384-b699-27d2639d872f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB8968:EE_|TY0PR04MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9a3187-a7ae-45f1-3a8d-08ded69bec82
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|23021999003|19110799012|12121999013|5072599009|5040399003|24021099003|5062599005|6090799003|51005399006|8060799015|12091999003|56899033|3412199025|440099028|40105399003|3430499035;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ei9sMGtCNk1JZU9OQ0tZQVN2cEpnRExreGMzalhEalpCUk1aRG5IOVlTV3Ey?=
 =?utf-8?B?M0Exb2ZaNmhaanBLVGw0OHZXdVRoTEw4M09FRTBIenZpR2gwSjBzK09mS25C?=
 =?utf-8?B?YkZlOGZaeTdkOTluOVRuNWh2bjdCa2VDQXZaWGk4Wnhzeit5RDY3UjRJZUxG?=
 =?utf-8?B?N3BENGk1b0doVjhlUEFheVE4R2R1QWlTRSttZGVRcDAzazBrbGpNNDZkYm5Q?=
 =?utf-8?B?YTl3d3pQOC9uZ3pZTG5MOUYzS2ptWWR5QlltSVRRNzAxSS9qZFdVNDAyS1d0?=
 =?utf-8?B?MXpmZ2VvSDBUeVdGRUovL1hqQmFGVGNtcnYzdno0NzVuMVd1amZBVkdRMHd5?=
 =?utf-8?B?UzZVTlhlcXFVUm9nZG1hL3NlTnVqTkpsWFE2QzRzTDYxMURnVzlqRERHS2Fy?=
 =?utf-8?B?blRjYU9IN0lDSm8yWUNpdzRLK0ptQ2xpUktGc3J2M3djSHJHaklDMWpUR0hp?=
 =?utf-8?B?Mkg3a0dtMXVRTGhPM3RzM25EdnVlQWVPUXJnTjkxWWRSVXNYNy9Oc3lYN0lJ?=
 =?utf-8?B?ZHVPK1ZrMWxGZWhHQlBrOGZsZWl3YkNxL3hkVjBGVU9OcHlMVFo3NFpkaDR5?=
 =?utf-8?B?YjIwS0ViN2VzUklKU3dTSFRmQ0JmenNCV1BkVEhuZmsrbm9rNUJoUUtjYldq?=
 =?utf-8?B?em54SW85NVU4aHhJZ3RyRmJJdGJVL2ZIS2hDd1pSalRtcUpMSGFYZzQ5cWRo?=
 =?utf-8?B?WmNRN3BIamNrTWpQa3h1TW50Nk1rUHU4K29DT21RMW9vNy9qMjZjUkFNbnk2?=
 =?utf-8?B?OXhpWUY1Vk12VkIwY2h1R0xvNjNJYU5JMzlFa3VZczBkTHhQNVB0aW1MUzF6?=
 =?utf-8?B?K2RhR0NzZHgySlJnaHpnTmt4a2ttT1lWKzRrajJQSVBNamhWQnZkWGlHR1BI?=
 =?utf-8?B?djhFWXFnLzFVZUJxSlpoS3ZnZFI2OExyOFZDTnBsN0RsbUd3cW1OS3F5RzA1?=
 =?utf-8?B?WEVjMlVPemRwbUNzZFZ5U0h1S2YrOCtobGlUVDlpQmRFVGRPUmV2YjNYdGhW?=
 =?utf-8?B?TXFXV1REeGFmTXlKZGszQVVpTHJuTXdMcnhSRHFKWXAydFlMWTBzTnNKZE9h?=
 =?utf-8?B?elROejJEWm1MZ3V4b0QzMnYzYXRQVUFibFZqU0pXL3hZYXZFVXJQTno2eWZI?=
 =?utf-8?B?bXpPenBZRzVMczdudTdiS3ZFUTJXcURaZEcvdnpnMFRNRTlwd0FndVFZNHJM?=
 =?utf-8?B?c0c1cG1rR0p1MlhQNDdteFNCdEN6Wm1ybU5rZUVmS1VGRmRGUXJFV3NpaU5q?=
 =?utf-8?B?M0MxdGdJVUw4OEhPMkFBQmJSWUt2TXdKSVR2YzFxemFJZUxLbThWajRZdEk0?=
 =?utf-8?B?UEdFakdGbzJTTnN2aGRFUVBuRURwb21PK010cE5DUEtoMFltZDl0aEFXU2FP?=
 =?utf-8?B?YUNUUnlPV25Xc3VTSWNOa0dQb2FpMlZTa25CWXRoUjVmV2NZMlBiSnA1b3h5?=
 =?utf-8?Q?FdGmbObo?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWl6U01BZ1d4RXNxS0F4dDM3bWZSY2VDeUo2K0RGaXZuWDVkcDdnOUUxYTFU?=
 =?utf-8?B?TmZGMWtwSUsyQ3ZlM3VDdFNpRW9JMHJYMWRyTEFDOUVNVktxTnlxWHVUQURy?=
 =?utf-8?B?aFRKZ0hyS0tGejRlYnhyeWhDbWIyU3Q4MEpCZ3NVaDJRTE9SSHluT2pKeHRm?=
 =?utf-8?B?UDd2d0llZXFETXBiYVBnaXBkcDlWK21LNEVXN0c1aXUxQlBhTjVDcm1MTUxU?=
 =?utf-8?B?YzVWOFJncjZsVFBqQS9nZDdFMDZrdUUwRktIb3hzQ1V3Q0JHV1FNZDVXbTlP?=
 =?utf-8?B?Y1FqaUthakJZRmIrMlNrMjlxL0NoODd5QlplMS92Z2hzNGcra2dMK0pKTkhV?=
 =?utf-8?B?TGlxc3RReGhXdlN1MWNWb2s3aUlnQ1Vnd3hranc0Q3lzNTQxUlo5VVdzdzVu?=
 =?utf-8?B?UmovczhiUVVsRUx4NlJqc0h5cGNsMzNjS1VXSFdHbGRzM1ZLVkllU1ZvRHZj?=
 =?utf-8?B?T2E4QVJXQmZWS1VXYUYwZ1J5NEZBcFhsTXFFaSt1Ky9wdkMxWWZFVmNlRVEw?=
 =?utf-8?B?c3BWVlQvS2xMdnRwSm93UjNNR3d6dkxtaEZJM3hTamd0aGIwUkFJdmFGRXo2?=
 =?utf-8?B?dUgyM2JyWUtFaTZ4YlZMVm02bjQvaXVEdUh3dmM0b3hoQXExMWovb24zOUFF?=
 =?utf-8?B?aFRDdUJYRGpaZktVWGFWYVYxUFhqSldjOUVkMjNHR00xVFJmZWVtZDB3bzQ0?=
 =?utf-8?B?dEU3MktzbDZtSVA5RFRSb1JkYVd3eE9TdXZGV0hVVUd5eEM1N0x2eGdhQzRR?=
 =?utf-8?B?ajBFTUNhejNxQjFuQ1BlbWJ4MkdtdjVPQXd5NWlQeEZHVSsrb2FxeEE4Mmgz?=
 =?utf-8?B?eWJ0SnRjMUNSVThwRGlYWVo0NEJvbDFQaDRIclBTVjZQMkZsM0VaSVNRU3pI?=
 =?utf-8?B?LzF1cTVqVkVzMWk3c3V6aXRYNndScjlpLzdNZENJMTRiVzU4ZnhtQUJpNFhW?=
 =?utf-8?B?SXZpc0pZMVRJNFY3cThEb3NUK1p1a0g3UXVidzVPU0ZuMlVpVlFtNVNKWjF5?=
 =?utf-8?B?Tk1rTUJURklLd0dFcnJMUFMxbUN2SFpyY3RITWxaR1k3anVsL3BxbmdIT2FR?=
 =?utf-8?B?VTNKN3JaL2o4Z3E1UERnWDl0NUF6MEYvSWErZnJtRlJpcHpRZkx4M2VxSGpN?=
 =?utf-8?B?R3V6WHZLVVBLMnRPUzU2a2FJeTkxYXBhK1Vtck8zRGtydWVYMVpwSFRhcFpQ?=
 =?utf-8?B?cjBFRCs1UFJja2NWU1h0bm9CeGVScGxITzRaVmtpWUJ2WnZncFptdW44WHdO?=
 =?utf-8?B?SjRmVkZ4OTQxdnBseURsdlRLQ2pXV0o4ZUNrbWs5TTBKVWo3STVpc251eDI5?=
 =?utf-8?B?MnptRm05VGl4V3pmZVVkb0k5WkNQRlU0UEdvLy9tbXJGZC9XTGVRdzM4SkhB?=
 =?utf-8?B?WXlRaW1NdDBndHZMREhPeXpYZnRadjNHU1VINnZZZ2ZpcFRVcllCZlkxMDFV?=
 =?utf-8?B?SmxpTldmU1lkMGlGZFlBVHFhbldnQzNpNkVuZnY4aTVjbnJPenpUK3gvRWRQ?=
 =?utf-8?B?dU15VlhUNzNjOE5HdE91N09GWExKSkp1eFd2S3lodFBOYmdTWGZ2UGNpSDJI?=
 =?utf-8?B?MFpHd0l1MWxqVzZacHRIRUVlOUl5TGJ2TXNlUUxlTitVL1pqb1h3bDh0blh2?=
 =?utf-8?B?bEV5WkhNaHhrNzY1WDBXRE1NZXk0TFJUbWJFTlArQm9QemFUMVZhS3ZySStx?=
 =?utf-8?B?ajdHUmR6cVBkK0VCMGpGTE5pUFg5YS94aHo4WlBDaDZweVBOcDdUUFZ2Z3hr?=
 =?utf-8?B?elhPSUVKQkpSQTFiVkdFVzhDWXcvT2t6S3NzZk9aTWdhYmlGbDFDcTZpYTFF?=
 =?utf-8?B?NTNJRTJXb0NXTHlzeGViS0loWE1CeXRNZElqZEg2eU4vano3WXF6MlpuRFUw?=
 =?utf-8?B?U01naDVIeWE4czM2SVZDbXljdGVNaVlpYTI3Y0ZpUGhOV0NDOE9mbnhIRVhG?=
 =?utf-8?Q?mUEXteQOMDruzgR+BxeOgiz3BBxFAuc+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9a3187-a7ae-45f1-3a8d-08ded69bec82
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB8968.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 11:37:11.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6445

From: DongliLiu <dongli.liu@outlook.com>

While auditing the UCSI subsystem, I noticed two code quality issues that
may benefit from community discussion:

1. Cross-function guard semantic gap

notify_common() uses inclusive check (<= num_connectors):
   if (UCSI_CCI_CONNECTOR(cci) <= ucsi->cap.num_connectors)

connector_change() uses exclusive check (num > num_connectors):
   if (!num || num > num_connectors)

This means the same connector number can pass one check but fail another.
Should these be unified to strict '<' semantics?

2. Mixed comparison operators

The subsystem uses both '<' and '<=' inconsistently across functions.
Would a cleanup series to standardize all bounds checks be welcome?

These are not urgent bugs, but may affect long-term maintainability.
Feedback welcome.

