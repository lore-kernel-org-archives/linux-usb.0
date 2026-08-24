Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazolkn19012054.outbound.protection.outlook.com [52.103.20.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDFF374A0B;
	Mon, 24 Aug 2026 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563406; cv=fail; b=eSzZdcBW0UHN5Tbg8eW3zfGuzbPFdI0pO2Koh6CAi/6tyDxlrMtukjKNnls5V0yed5NP3gIiPPInLxcHtgzmljkyYU0cKVd86sFbgSdDXGeTPBMEnYpvb6oV/E0Q9zqVwoX+13gL6bp62Ef4wo1nRKciZO7yjq4SWJpMlocn3W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563406; c=relaxed/simple;
	bh=2wjXakoPjYidF7YhD4fOvyqAmqBpBGbvB8TNKWLPDzY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lFw+KsbAfvG5TpJalUpf8CFNMsaxGxn9wZxKnkJdkiGu24HW78FoI0vJKIbtgG/eTJSZxawUZXxcKz/e4SpcwNwIQVtR0VhCDzYqU1wmfv7w/dwKe5MEC2wNyQwxPv3ao2I3YDLdSKOhDLTy+JTn1d8yTnfFJOhShRbYoILDQ5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=p4DQe0II; arc=fail smtp.client-ip=52.103.20.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="p4DQe0II"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yf7jbmJdkt3Q2j4O9/C0MewH2N4EgudJ84v8viPFlsk0p5/wCSJTKEl1xx+YfuOeNouwMe6zh76MtXXL4zhivMjdLAO8n7fvIF+ZsZe++BD8fb8H9/81xrbswSn16d4+Y4dKEWea5kj/qe45CKsCAghzdvydT2+ARB08GmQXJmLIl7gXUw00jq7AQAWCWH0z7vJ9eqIujCn2fqO2DJCbkakJ5Hxx4Pem16YqBiS79AQRofDnyJC3mgm6hUhAvy1VK3fiEqrMvf9slmU3S+9bkAdQIqgYCemOsxlpzca5YE405bHKacpha+5omhvuCAsT5LfpozKUcur7JB4LXG37hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5DO86lDxe+hl5guOZhl5sXCeO8/9oxZTUJtTv6hxAQ=;
 b=VgD2kzLugZWSOuEzxTZJYycziHUGZGQBRXh/i0q0h7s4f79/4uzomYEpqYVk2OrAoepfUkbyFa0nPuvZiwpGquGO6XrtsnteAU+9CjP2GTOgFkDVoCLX4CcZaCa4eLRIfw7Y7SF932sUMr2HYGDXGJ2tiaJ1o2jJ0K3M2/JQoVGaDr4ZPZXNDxkxKkOUAUkrqxYkKUc3DM8vrTOUKGR7BmjZQ2MstoamJQLxbPVSdEWLfMkupBLTQHXYKJ0WgamVtbtjBe5OdGATXQGcaP9xFwSQ0KRJB9tDN0n2wnxVs4D5iziStkadYf4Ej2PFHlnid+fXPoz1AsVaLZ/AXJCX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5DO86lDxe+hl5guOZhl5sXCeO8/9oxZTUJtTv6hxAQ=;
 b=p4DQe0IIiLI+cf1LZhkDMytdRwsIquFpJZOUFZ14BOGrmMGdjT8ac94+hmCPPROt7EUcpnEMNiVCfR65qnBItrh1E+cxH8bc2uttHQ5LAm/sUHUFU3deXCI94VApYjEFWkdrPnj7DZTs82L0b7zPSrNiTKsXW05T5Odc+U5owkhD5Y9loUx7zUIx5+yPmrDIgGDgQOH/yy5DjJNWPG2iSlcFIgAglwEKfDUmvac0w0vI2KbzQTrz0R8L1/1cllLx/TN8vOunncdHV+pnltt6OPdtSW+E/shxX2NTJ4Ye9zymtLFTIXEsKbUcQSV2756Jh9idcKT8qagQr8+NWEiGbg==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by EAYPR19MB129701.namprd19.prod.outlook.com (2603:10b6:303:2e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:23:18 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0315.011; Mon, 24 Aug 2026
 09:23:18 +0000
Message-ID:
 <SN7PR19MB673604430A26373A840F691E9DA02@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Mon, 24 Aug 2026 13:22:54 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] arm64: dts: qcom: ipq5332: Add clocks required
 for USB3 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Praveenkumar I
 <quic_ipkumar@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
 <2e9f6fe9-31ab-4107-a623-b15470fe68de@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <2e9f6fe9-31ab-4107-a623-b15470fe68de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <b4b575e2-6604-421b-9800-bc1413e32004@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|EAYPR19MB129701:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bc34a8-a414-4bf7-0b55-08df01c15537
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|37011999003|51005399006|15080799012|24021099003|23021999003|6090799003|5072599009|25010399006|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UndDVzVEVitWVXlSdnppMzdtVGdHZnF6MzVOcGVjQ204aTZyNjVnditqdVkx?=
 =?utf-8?B?RE9vMFpvanY5d1hiVzVTQ3JTMmtsSW5RT3hVMENMZWV3MlpGWnh0eXVRdG9F?=
 =?utf-8?B?UlRMR0JEOVFpUDJZTXBnZko2dmFkK1RCaHJWVkxiYS9XNDZudC85R2ZLaENU?=
 =?utf-8?B?eXV3N2tQdUxld0Ezek04M0VRV0VQRGNCeWVaOFVlYlVlUk5iMHNJNGszVnE4?=
 =?utf-8?B?UFEwSDFkb25NNEEvWXlKWDB3UGFEWlVVWU1INVpIZ001NCt6eWd2MGNURDVG?=
 =?utf-8?B?b0tIUmM4MUlTc0h1TURIMlVPaXRYcWxXVzlwRSt1LzlJTEYvU0craDZPTEZn?=
 =?utf-8?B?SlpBaE1PL3pvNmFlNG80bHh4eUFhejhIOFpKeG56cFpoK2U0VnVWZWJ4bDQ0?=
 =?utf-8?B?M1pyM1ZpVGtXaTFwR1FvdVpweFVlcmNWNUdBY0toRjN4RWdaRzNQTXBLU3V2?=
 =?utf-8?B?YTVNcHV4UXRmQ00zbXAyZnEybk5ZbVBTa0tqTG82TXRGbXRRWGtSVVhMS2F3?=
 =?utf-8?B?ZEY5R0JuKy9KMStxaEM1NGRKeVAwdGN4dFlVV1hmclNRTEZXb1FmQlZ2ZCtu?=
 =?utf-8?B?bjFHTkdndXE2WHUraXFrZ1pXNzVheWFQbHk4ZFVldk1KREI5WEdJZ05HZTly?=
 =?utf-8?B?emtmb093bHJjNW1obktRT2hhMGVJaXY2SWlpeW9MVDBoQlpZZUx6aUJVdzY3?=
 =?utf-8?B?cnk3WlNzZmhmSWttSUROOGs2U0FVV3lIVk83bWxFb3RSL1BxNlpsZmFreWlO?=
 =?utf-8?B?ZjRkS3duOS8yRStjWWY4ZjdmQ0o2WnRVTXpWOXN0am4wTzVZQksvZE9xckJN?=
 =?utf-8?B?alYwcGJGdXdRYnpLeVhTWVlmVXFPSUR5Uzl5ZmpNeDBLa2J5SGprM2d3Zm9T?=
 =?utf-8?B?ZUJUOEh6R01uZkNYcko3NTZoNms1SFF2ZGtGT1BJSjVueERMUFNScENReExT?=
 =?utf-8?B?L3ZoUW9TREFaNk1tdmxGdW1NdEtzMU91VDVmZTJtQzdDVDYzMjVHa2NlRjJE?=
 =?utf-8?B?bVgvSFFwWkIxOUxxbmVFTWVFdkNWOUkvdStUMFpFT0VqdVV4ZmtNTVlYcDZS?=
 =?utf-8?B?ckl2NEwwT1F1bS9kZHFsc1E3a3c3Y1hWZnBUSlR2QmV5L0VMSTRQQitCVW52?=
 =?utf-8?B?M1doMDZXdUo4Y3FoWVVPU3R3NVI3aWd4dlhkOHN2VGdQTFdybVovbEJwcjRt?=
 =?utf-8?B?QUFaeXlnVXNWSm9uUVRhVytQbUNUM2REYS9zNWc5NEpGWUVUUHUrOXFGTnB1?=
 =?utf-8?B?d0NaU3lSUlJMZG9EMWhjU3l4dmxuMk5hdkJvUGhKbWpDZ3JTdVJVYmpUVTFJ?=
 =?utf-8?Q?IGI8/ndpxRDAtWDnXV3fDSPz5AZX4DBOlY?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1dRWEwzMDZLTmxsOHM4bWdZUVUrTlJrUWV0MXdCSzhaL2JYdXA4Ym5DNFlI?=
 =?utf-8?B?bGRWVGg0SFA1WGpVSm83NEZOVDhwdEhaL1dUczJlK0NOczhYRGZrREZlKy9C?=
 =?utf-8?B?QTRWaTRvWGF0NTdVcTFFWTc5SEpXSStiQU1nRXJkMFRJMjhJek0yT0s2VDFT?=
 =?utf-8?B?MFNLNDFka3ZnNmk3VU9MZlZ3N1dUK0xLdjBmUEl3eUFibENoM0liT2UybXV3?=
 =?utf-8?B?RVdxazMrMmxzMUdBbVA4QnF6N3RueFlrL3B5MVp1T0NPUzVVL0FCTDZQVy9W?=
 =?utf-8?B?WFJ0K2xMRnlCbElJQWJ6UnVHOHZBQ1ZaRmdEREh5N0h5bGtUUys1ZG1wUUxB?=
 =?utf-8?B?Mk0xK1JrVWluMnFQdEVYbU1zMS84YkZ4KzZCMjNzVkFkWjd2b2hwYjFqYlhi?=
 =?utf-8?B?aVo1RmlRZzJqeTd3MExQN0VWNzRKdzcyQlFhbjNFcGk2V2x5bXBBUTEyZmJr?=
 =?utf-8?B?WHpZa24wRnJrS3NrVjBJbllqeXZMOFdTWHlyUy9QcjMyYWRIUGU0NWhueDVM?=
 =?utf-8?B?b3lIWUgwR2cxZWZFdytybHVVc1Zrd2xDM3d6NjE2UlJ1L0I2c1d0aDFJRUZw?=
 =?utf-8?B?N1doQjZsUWhiK2o0NFNtcWl1c1ZXRGVRYWlNTld6cHFHOE96OUtBREtGQytv?=
 =?utf-8?B?Ti9aMVFyTmh1b3NSWjRuYUc2ejZrWitvV1RKWWd5L1VpbVlDUEJUQWZOMzN4?=
 =?utf-8?B?QUtrTW9JYmF1by9vcXJaK2hSelJFVjlwUDJjQXZXZUtIdkFGV1VtajZrejZV?=
 =?utf-8?B?R2prbDRRbXNvT1NVY3BKWlNGT1cwRWJMNkxiK1pIcWQ2ZU9iekIwK2NWL2dh?=
 =?utf-8?B?bVVQNGF1SXVuZDdLenlodDloV2Y3YzlXZnFNRGhhTis1SVFVWTN0dDQzZFda?=
 =?utf-8?B?eVl3QjB3UXFSSDZCT2doYm1VN1d0SWM4RnhDTGRkOVBBZzU0SkVaajJPL3lT?=
 =?utf-8?B?TDVJTno4b3dTN0J2WUpmZ2FpVjNHbDYwYUUrUTdkR3VjZDFRV09jNFZTV0I2?=
 =?utf-8?B?bjhrSTlZTG5VdzZhWlYvYVdpS1NobmdOMWdrTkNaZTZ0dkExSHNZaUNUL1JC?=
 =?utf-8?B?Zm13N2p6TlZQUVNXTXd3SUFSczFtT0pSNVdYZndZK2N6dXlOa1RpZCtaazNX?=
 =?utf-8?B?OEZGZHNQMHRXTTdVckNZT3pIcXhlL3hQSHRUY0RLZy9WNnBWZ3pVYnVYYTAz?=
 =?utf-8?B?VkNZS0RMUkFLL1RMT2k1VjRocVJsd3NEV2xlOXBmcTMrVU80NUlyN3A0VXcr?=
 =?utf-8?B?L2NsR1RDSDFBdUk1SmtBTFMxcjYydXllMlhJcHdNM0ZZOEZxN3ZVNkNhSnlR?=
 =?utf-8?B?UWdQV1A5R0ZLeFZ5TWphUWtIQkVkMjMxM2E3Y1BLYTZWYXN6ejhxNE5WSE5F?=
 =?utf-8?B?NVYrRGF5Zm4renpBVHdyY3dvcGJMUzVCQXdjNGNXU1c3NTYydFRyZ1V4K3Rq?=
 =?utf-8?B?MWhmcXBsY05RZlFnZWpFamo0K1Q0MEVScHdZUmRlMCtGTWJzVTIxVW5tUEVz?=
 =?utf-8?B?Sks2WlFoVVhOSmZJSVI3cytwdEN0d25oVVp0Q1pBZ0dNU0luQ3FKVnZCdTJJ?=
 =?utf-8?B?ZU4wSkRjQUR1REJYdjcrRjd2a0U4YXppaGNRUzZTWkZxQXdCdEphMWlSL2Rh?=
 =?utf-8?B?TmhZL2RqWHJuL3IxWkdiODFzL0RnMjhTcTdPSVZ4UGJCRENqYWxyeGV3bFhK?=
 =?utf-8?B?YW5tdTJOakM2cy9qZWNFZWpob0V3WkthWmMwNWZLY2RzWWpiRHhzQldQdENZ?=
 =?utf-8?B?UHJHdEFpMEM3c3lKN3dQelRVMnJ4OXVpTkYzS1Vkcm9SeG4wdGcrelhsSm40?=
 =?utf-8?B?OEFYbzRkUUQxd3FmTXNQYzEza0x6T01GZTB4UkxBdWZKbnUvWkNLL2hib1Nh?=
 =?utf-8?B?Q1ludWJEUjRkMG5nd1grczU4ek9tbFlTQnd1Tkg2ZXlQN0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bc34a8-a414-4bf7-0b55-08df01c15537
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:23:18.4808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB129701

On 8/24/26 13:02, Konrad Dybcio wrote:
> On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
>> From: Praveenkumar I <quic_ipkumar@quicinc.com>
>>
>> Add aux and lfps clocks to USB controller node for Super-Speed support.
>>
>> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> Is the GCC_USB0_PIPE_CLK not necessary too?

No, not necessary as the PIPE clock is managed by the PHY (see patch 3)
directly which provides it in the first place.

> 
> Konrad

Best regards,
George


