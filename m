Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012018.outbound.protection.outlook.com [52.103.10.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE39179A3;
	Thu, 13 Aug 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.10.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786616915; cv=fail; b=QvKIY/0LX/kMMf/jB+DnDURv/RaME25uhYX8aYbCDJQxYC2g6aLq1S1nD33WZXLAhqP1assY+ovsfKgQAW+Z7Jk0wwsbmm1ieGgSBe4XjSWK3ZsFu97J8gPCx/nYlWT8bfr/DnX0TDUb3xxa12Fm53UQoIVeLoOP6UH1j2xygEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786616915; c=relaxed/simple;
	bh=pwD5Je0Hs6rvzIkRfP5/ZAKCoCsb9/eAztFlF+JeFkA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aMw2HKkiqSO1z6jKB7fNfsE87/COZPbUuLxglr+t8TvQST/eMlldaRToQ7KAVs5aE55eAid6dIfrgbUiejKjJXSjeSzUedGzbwKICkKpP6BECEE3A7Ez3BhO8fQ/5Voum13DnrZMfNgDa3hLM/K44Z7vZxjhA7Sx/Kte2v91j6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ExmWYAU9; arc=fail smtp.client-ip=52.103.10.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ExmWYAU9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCitWYo2+F6zrm8PpuFr/vfDzmqABycCUXB0WrVGFXYpO3FdCQrae0qDzB+WnYYXJb/Q8wVRHiHyItz0UzzRusWbPGyEYyym9bDltQorlh+40m+5j+Fm2sVZBowr3oTr2Rlg76zE6VnJZollcwIm5SBbMKg4TyG0jQIzj8cvJrKHduY0C/ENYTrGS91/bzctOORAup7YzfO0ZQXb6H+wLdIRcjTlzTx4a1P4KjnJJ4+j5V48KxxsytfJpSVfMwRIgvHfpiWZYTqGSa9owQ7OFkRbVvqmJ7cDaoOzfVDg/3MHotfMsEi1ff3+3hEX3/SqIR5oXhuCaygRZGqV4ewWsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPQ/vQIG9zTH5UW1DssA2CS+dLKLQupfwF1c311dz0s=;
 b=frcfavTOVGu/0c0f2W6n0ooOk1RwEKqM6Yp3TBARrho//6p+U1qzcUEFt1A+l8beC5oX4L9/Wch/NoGjEBfXUvkCfdJn4QBk+aq6LBUhHVcptsK+zQX+Tg9MWAR5kweyb4wDISvVYwr/cGmBOg4LfcHqLu/0K1k8/SpDs3927VEWzdSx8eccAIt2vBkXr2wfywNJe9VGswOoj10+IYUzULyxV92CQdmjtgYDY6RyqiQ23JfLK0UsAjrOJYp8SyCEJVJHcirUHnfxmeXjezwew5dlcXnC/YodqlwjuLdcRaXC2oCVF/Yj/s4KdfpbMstEZ6kHDKJ35TD7j53/NlHKSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPQ/vQIG9zTH5UW1DssA2CS+dLKLQupfwF1c311dz0s=;
 b=ExmWYAU9qoBSYAz7HBoHtgCl5cfClYursHK6ajChPWPtbO/FO8o98N3exjXn2xNPMvPKMSBE6dzglFLxfN7SvSBWQCkqsvfx8F7yX73SSsWqkvrGkIwE0mabOyiW80dnza78dCN5E4jrkKfHRAAV66gNpVcVTuHcFhgg1PVIj2q79zow7rHc/7DI+LfPYmBq7pbjEtPglAyAi92oNpR055TaLqvcSXwt6L+FeaO61pTyUFMuQzRxrR+DmQfZvFxIgu7TEAkqiTL2t8mBOcLOLwwL4ot4DhqT6hXzH4PxadUD5IbzurGmyy3msXQB5znuBgWlE26blg1PziNlYCQ5OA==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by SN4PR19MB5456.namprd19.prod.outlook.com (2603:10b6:806:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 10:28:31 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 10:28:31 +0000
Message-ID:
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Thu, 13 Aug 2026 14:28:24 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Praveenkumar I <quic_ipkumar@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
 <20260813-alluring-advanced-jackalope-55e5c1@quoll>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20260813-alluring-advanced-jackalope-55e5c1@quoll>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: JH0PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::18) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <3ea28938-52e0-4ef0-bbd5-28065ceb3e29@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|SN4PR19MB5456:EE_
X-MS-Office365-Filtering-Correlation-Id: 351febb1-d296-46ec-4511-08def9259ee4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|37011999003|41001999006|5072599009|25010399006|4140399003|6090799003|23021999003|15080799012|19110799012|8060799015|3412199025|440099028|40105399003|52005399003|2607281247196008|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVRJTVZLVnF4TG1FeUI0d2R0WlRtbW5vdDRsNWxLUHpYbzlMbnVOa1dTc283?=
 =?utf-8?B?aXpxQW9mNm1DNGx6VTFxTHFDVXgvNk4wZDJkRnRKOU5SUlQvbmJOMmk3Sjk0?=
 =?utf-8?B?TXRlNHFVWkEya0ZJVFc1bW1MUTdibm1TYmpWWkF5bjlQWld2aldRM0lQTURQ?=
 =?utf-8?B?LzJxM0pHaUhqZTlMd3dvaHFKbnNaTzd4VjdOY2pNbnhscjFLZjhhbTg0T3pO?=
 =?utf-8?B?UGM2eWlzWFM5YmpDNjlPZ3V6V0ZQZi9qOXJ2V3cyMnNBSzRUTStyUDRIbjM1?=
 =?utf-8?B?WWxESkEveTN2Vjc2TC9sQzNUK2RtN1lFRTdxaThPM0hlMUUxRDdOV3diT3Bm?=
 =?utf-8?B?R1g1dGw1SzVxZFM2K3o1VXp2NGYxMEgrdUNLVXFTd3cwZktKajFBNytERjNJ?=
 =?utf-8?B?RS9EdlZ3eitySEdJRk5nODBkZytSK21yWjQ1R0Mwa2lDTnpoS2pETW11UDhH?=
 =?utf-8?B?MG45ZndaK0h3MlA1aWkrUXlGUUN4MWRHa3ZaTEl5RW85SEVOMmZhRHdJZDRa?=
 =?utf-8?B?QkNUTDB3a2Fqa2pTWVVwQ1BjeCtVSFBNQmNvRHpFTmlMRDBuUHB4OFZmN0Nj?=
 =?utf-8?B?THVWVXdWZzNreVIxMkJBakpYNzAxZ010MFVZZnBndm5UbmoveDJZN1JVN2lM?=
 =?utf-8?B?eldaMmVNYVRxY245b2ttMjhVcFRaaVlLY2svb2hCd0hYenRqSVdkbENIVlpH?=
 =?utf-8?B?cmw2REdnOFRqaElON1pGeUdKQzVSNGtUMDA1eityM0ZKS3Fiazl2ejlSelpN?=
 =?utf-8?B?RG1sY0JMa3QwSDdHYTRSdG9ueGtrRVJFWnNLckpSbnNoNVlQOEZQenpSbExy?=
 =?utf-8?B?SVNGNFVaeXlNam50NmFjQVFTL0F3RDVpc0JMWjZKRy9NL0hzU2YvNGV3NFJz?=
 =?utf-8?B?UEpUalFnc3dSN0pUTzlhMlNvNmVOWlM5ZVhpVXhwaW8rNGJDYjJhOUR6RVRI?=
 =?utf-8?B?bDdKQm4rZXhpL0QzcnIzS29HN280L1BwcmdFTVVKdjQ4NU4rVEgxL3lEWEZN?=
 =?utf-8?B?b2hiTWFnQTJYaVVET0g4SDl3UGlxVEdTYUE1ZFIzYk1SWWwwaS9hSGxpUElJ?=
 =?utf-8?B?cHN3cVI2WWJGb2NOS3EzeEVsbkFrOWkzVkpxc2F6WS9CYXRsS3B4S0ZvT256?=
 =?utf-8?B?Q2pOcGNkT1VqekNKbERFTmVEcDFtL250WTlWcUJjd3owcjVYK1g5aEM1Zysr?=
 =?utf-8?B?WVJiTndVVUd2R0hSWE1kN0VranBRSGZHYTlrUXNmekVia3lzbmdUZHBzbEdL?=
 =?utf-8?B?REwxYk9nUHhjVGdHM2FtazVjOHJMOWNvT3I4ZHkybDdkMHRsQUJwcm1PRjdU?=
 =?utf-8?B?ZEZTWUgxWFdPTHNqQzVpWU5wZ3g1QTlwTTk1cjZRazdKenNPZktTUnJpeE01?=
 =?utf-8?B?elJBa3NrUkVmK0E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUFINXd5WXdZdGJvbmRmWVEyaThTQ0lGamZueEZFZ2lGeVE3MmZ5RGNuakV0?=
 =?utf-8?B?eElrSjdkdTRVd2F1MzVnKzZsSXFCTWh0WVoxTURPc00yb0FVZE90bEpHenB0?=
 =?utf-8?B?cWhNNlB0WDRtRzlqQ1EvVGx5MFg2dnNhSWZOV2tEZTZCV2hSK2poNXg2cS9x?=
 =?utf-8?B?NGxoWk53MzNWNWYxNnlVTHRXbVpsSkI4OWxDaEdtcjE5MGQxS0Vidy9SSmp3?=
 =?utf-8?B?a3Y2RXAvMDRkZ1p4TEJsZ0RJM2xhMmJpRkVWSy9nRFBma200UnBtUVpwdEUv?=
 =?utf-8?B?cEdpK3pOelFVSkhrZVNDeFFHZUVaWlNuZWVmNGhtbkJaemwvMmx1aXNHelor?=
 =?utf-8?B?YjI3eVlFb29WOHE1aUF0WUNva3UvM05mY1ZqQ0dnK0xXdkNjNFRHUFpleTJV?=
 =?utf-8?B?bXJ5eVhCeUNzc3NZcy9iSlJWcUdVcllsN3hScTU0RjArampOVCszWTV6cDMr?=
 =?utf-8?B?RHZSV3RTMWNHZlo1enA5UlFDUlZWaVBoeU1NWTl1SzdlK0dhQ2FvNEZWek5a?=
 =?utf-8?B?ZGFMMm9ScEo0b1NoMWhiSk9ncFp4VEVucVE5VjkwKzluQkcxRHBRYjR5RlR1?=
 =?utf-8?B?TFdaSFYzVXJjY3pYZXYrV1k0MXNqZi9SV1cxMkZJVkU2dXFNZXgyWVdTRmxx?=
 =?utf-8?B?YjBGbDM1WENyTiszeUx6Rk5HbGpXMXZrTFZBT0MvZnRJUmFqNFh3QzczOFI0?=
 =?utf-8?B?cUc5MGwzaUhBUnZQOTdIWUVIVlFUd3J2UWdSSFZxTU5iWlgzRExBbnppNSsz?=
 =?utf-8?B?ZFZyaklyWEwyUVpOVS8zM1V4RkFVb1JNUm5VaGx6MlZ6KzR1R1ZrdG5oNnhF?=
 =?utf-8?B?QWJmWXN3N3FSdEVvaDM5LzhVWDQ2RnRCeTBXZWYzOUloNTN1OURSanBadHlI?=
 =?utf-8?B?bWwwbUpOZDFjVHQ3dk9Gb3hXUDFrYURBNEQ3bW5DdzFDeXN6TmlhaEFNbm1x?=
 =?utf-8?B?QWczYWE5alZWR293RnVYVW1vNXJESkZmTjF0MWlXYnZjU2V2L2F5RENRdFBy?=
 =?utf-8?B?YlFnbzR4MlA1d3o2SWxkK2xjMGZHNWpnaWQ2Ykdoek1tWXROUjVjSHhrN3FK?=
 =?utf-8?B?S3h6SFhQQUdlZTJ3Q0d6MXU5RHRZQkR5eGVtRWRYbk9YMXVhM3hNbVVvWld2?=
 =?utf-8?B?WmJzZjlpUlBZQ3NOTWZGRVA2Nm1tZmYyN1E3MXlhRXlobVVLQmFyMlM2T2kz?=
 =?utf-8?B?RVpaMk12QzFKWlZaT0VNZ2VndjVkdnkxUUZmcFVUcEQwWUs0cE95NUxCNnRj?=
 =?utf-8?B?aURLN1hOUlRONlNNWFE3VXhpQ2l0TWZQOTd2OUxrT2dPSGpna3ZuNmYxYWI3?=
 =?utf-8?B?elFnY2VvV1M4bkJlSm1oNzRBa00vWDNEZUd1b1VKQW1iMEs4bDU5K3dsRjZj?=
 =?utf-8?B?OTc3enQ5RlIwS2d2N0RYQ25VazNtaFhacW5CVmRPclJMK2FuU0ZFaGZHTmtx?=
 =?utf-8?B?cVlHeTFiNFF6bXEzLzI0d1Q1NC84M0t4a1dpVlBTUUdkNXExbmVQRGNORU1B?=
 =?utf-8?B?UVNOdTBSSHJENFg0V1lCK2pIYjBoNVp5N1Jha0t3S01rbkxWUys3TVJWYmFq?=
 =?utf-8?B?SGI5V1FLKy82N1lIN1BYQkFXazFhemdxWjExUExBMlA2emdJYVFwaThDM3Bx?=
 =?utf-8?B?dklNOVl5ZXZiY0N4OWpQZHVnYkRvQ085c2wrUmV4bUlRRnc4eGhxQ3c5eDZo?=
 =?utf-8?B?L3FDL1daNzVPOEs1ZFkvSStKWlBEc3VUelV6OTk1TmZxNno3eThNdklTOGll?=
 =?utf-8?B?cU9abW51L0pCK2pzZTJzcnZUVlE0eXF0cEVra2poMHJHMi95bUcwdlNvTzlx?=
 =?utf-8?B?QUpsd21MM0o2dXB4NCtGRXpJNFJrYmFJTWszQ1JEcS8rNDN1UlMzZFU1a1Ji?=
 =?utf-8?B?dkVXeWtlajdrQjkrT2liMUpQM1BxTURRYlJ5RG9HQ1J2NXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351febb1-d296-46ec-4511-08def9259ee4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 10:28:31.7304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB5456

On 8/13/26 12:58, Krzysztof Kozlowski wrote:
> On Wed, Aug 12, 2026 at 01:34:36PM +0400, George Moussalem wrote:
>> From: Praveenkumar I <quic_ipkumar@quicinc.com>
>>
>> Document the Qualcomm USB3 22ull UNIPHY present in the IPQ5018 and
>> IPQ5332 SoCs.
>>
>> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  .../phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml        | 111 +++++++++++++++++++++
>>  1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml
>> new file mode 100644
>> index 000000000000..cc9eccac51dd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,ipq5332-uniphy-usb-ss-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm UNIPHY USB Super-Speed 22ull PHY
>> +
>> +maintainers:
>> +  - Praveenkumar I <quic_ipkumar@quicinc.com>
>> +  - Varadarajan Narayanan <quic_varada@quicinc.com>
>> +
>> +description:
>> +  USB Super-Speed UNIPHY found in Qualcomm IPQ5018 & IPQ5332 SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq5018-uniphy-usb-ss-phy
>> +      - qcom,ipq5332-uniphy-usb-ss-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  vdd-supply:
>> +    description:
>> +      Phandle to 5V regulator supply to PHY digital circuit.
>> +
>> +  qcom,phy-usb-mux-sel:
>> +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

thanks, dropped in v3

> 
>> +      Mux selection for USB PHY. The USB3 and PCIe PHY pads are muxed and the
>> +      mux selection is done via a register in TCSR syscon.
> 
> git grep qcom,phy-usb-mux-sel gave me zero, so I wonder how is it done
> from the PCI side.

That's because PCIe (phy-qcom-uniphy-pcie-28lp.c) doesn't need it. It is
muxed to PCIe by default. Only for USB3, it needs to be set explicitly.

BIT(0) of the TCSR register address controls the mux selection:
- 0 (default): 	PCIe
- 1:		USB3

I've updated the description above to:

TCSR register address for mux selection control for PCIe / USB3 mode.
If not set, the setting defaults to PCIe mux selection (BIT(0) = 0).

> 
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: phandle of TCSR syscon
>> +          - description: offset of PHY mux selection register
>> +
>> +  "#clock-cells":
>> +    const: 0
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - resets
>> +  - vdd-supply
>> +  - qcom,phy-usb-mux-sel
>> +  - "#clock-cells"
>> +  - "#phy-cells"
>> +
> 
> 
>> +additionalProperties: false
> 
> This goes after "allOf:" block.

Moved..

> 
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq5018-uniphy-usb-ss-phy
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: USB3 PHY CFG AHB clock
>> +            - description: USB3 pipe clock
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,ipq5332-uniphy-usb-ss-phy
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Shared PCIe/USB3 PHY AHB clock
>> +            - description: USB3 PHY CFG AHB clock
>> +            - description: USB3 pipe clock
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
>> +
>> +    phy@4b0000 {
>> +        compatible = "qcom,ipq5332-uniphy-usb-ss-phy";
>> +        reg = <0x4b0000 0x800>;
> 
> That is the same address as PCI PHY, so you have one device, not two.

yes, AFAIK they're separate PHYs (pcie-28lp vs usb-ss-22ull) sharing the
same MMIO register space in IPQ5332. To enable USB3, the compatible
string, clocks, resets, and related USB3 properties override the PCIe
properties. In IPQ5018, the PHYs have different register address spaces,
hence representing it as a new devicetree node.

> 
> Best regards,
> Krzysztof
> 

Best regards,
George

