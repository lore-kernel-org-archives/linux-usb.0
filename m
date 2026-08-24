Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azolkn19010018.outbound.protection.outlook.com [52.103.12.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FA8374185;
	Mon, 24 Aug 2026 09:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563606; cv=fail; b=M16H9tHUuR2CF3ydAkukb9KtJEjDGLPnl1GtTKkCTGHz/d0qPlFby14qPoTYbfMkTGLOsfY84Kzdw7DeRZGmjkAJ40UpHdXiNRuuAMNoTxZidKB5GXk03SyVdscObUhHO3C5/Z+hzlZ6Y19HXY8f+IznJUnXAlU5hplSYkg3OCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563606; c=relaxed/simple;
	bh=pgj3zBMquQifjhetUVFcov9Kzjuhh2+hM5eDZMg/NU4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CUBOPX1s9AyR9aO3KosN68V9eXon/O7vEBerBdtBxbsHadHSIswa1u2QXNusmiiHn2Waudn5iPif3czmDKV3+yxdIegsrKqCA7wOKJCZ94L2QGclhVH3+kCrcEP5CfsFiN/ZFXK5CLFBWEzjGevBF0Ahipu7EOB0/eh0cIv/zLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=EgHXoejf; arc=fail smtp.client-ip=52.103.12.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="EgHXoejf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDF7Dr8+NeR8hnn6N4cc/LDLyWfm4a6tTLsJyKrHBjdU6msfyBtHZEro0yPJcc8UmvQW6Z/HErBXfy5ztAoYJu8Yknh3NF7YyY28SzVedRav6OrlMZOnoZIwwUhveGaWReIOMM3Fx9TtAxR9CIW6PfQevYHDSGURt6bt6aX7uzH1yCnO3AZALW5qsdIbAzAY2La2MRpBdCcVRedlZruJThtmSrE+z3FqNDFkburg6fwUsLZgb0xjcfy4piY3W6107AjRi/51rsPVhJiXFAqlYkahW/RRtrFM6Pw9YmZvZSZo5QAIO9+QhifaxCbHoC2jd1GiMBAoc1AH832LnKZomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2//YU3Cf+2okyXXzEHo4DGw6IZjLz897XUlq8CfJB4A=;
 b=oDBKZ+6rTY3JT+3ys9p1Gmh+KOxWrerTl/TxRDEO5flE/oK/HBODx1QWmC33QkZPxkhuG1fNGbUlze+w5Oyy+sSc2nTsv2sewYMRW/d3OvszKztxHD3UIJyNTnEHbK8e0t5gSEzBab3KuxDK4XV1k79vr13FVZKg+ELgx4m0mSQCIJAMGmnu2v2+/CHyA4ZEcYhO6MOFflp+oXpqtKDlB2VbbIt8XrVgJg7aTQqV5XvPAs2BmwM/BtzatWtLzWEacjrCVJd1hnpBskqkxg5APHWOxkBTvxCIH9ETkFWhP+KPv2kZjX9ezz7rfvCcqVRvLISgDpH/WdgJIlgzr8wRVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2//YU3Cf+2okyXXzEHo4DGw6IZjLz897XUlq8CfJB4A=;
 b=EgHXoejfmFWKKtMVI5sKsRqjAsnMmW4ZjTpCdFuDjf7paGLk0AHWmjRo48zaKD4zFsyDDH1D9irz4Qr/s3bJCZzeEHEyGG+gjYeDfMsY37cENr/uATgvuG5GaHBqeskJglRW6PLPTNx86hv/we45Lb/cH6iQrK/1/Y0X1SW7jWNHOqZS1VXhuG2v51eys/ln0EKBWAEmSl6sByWsfN1K9Tsoby6YzGIsk7AjX1n0rfRPRHFZJjCaNvLbQz6VYQoo0t/0oUlrybw8DoqhHYgEPtI+8C7wqniwABVlkpaPcxCYiVcJyQiGGGRA7785Oq1hVcC18r4KzIaIv8SF/qca/w==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by SA3PR19MB9451.namprd19.prod.outlook.com (2603:10b6:806:49b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:26:42 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0315.011; Mon, 24 Aug 2026
 09:26:42 +0000
Message-ID:
 <SN7PR19MB6736BC1B0AF80D243B8C08E99DA02@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Mon, 24 Aug 2026 13:26:31 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] arm64: dts: qcom: ipq5018: Flatten usb
 controller node
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
 <20260812-ipq5018-usb3-v2-5-8f355d7ff0ef@outlook.com>
 <8e175474-1275-4287-9101-1c54afdfcd09@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <8e175474-1275-4287-9101-1c54afdfcd09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <5cb4fa9a-f5c3-419e-93c5-f5904d0dfacc@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|SA3PR19MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ef1c47-07d9-467c-22e8-08df01c1cea9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|23021999003|5072599009|6090799003|37011999003|8060799015|19110799012|24021099003|51005399006|15080799012|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0xrSWcyZnl5TDRqQXpKZVhVb1J5MEF5UGFSVTJEbFNZRmVDY3lKWG9Jd1Ir?=
 =?utf-8?B?aURTZzB1OWkyL2ZrME45NmJod21kQkRvUXJHczE4TS9NMC82TTA1MXJWeG0w?=
 =?utf-8?B?YzhkNXUvK1lVT1pjUGpkMG1qbDVxaEJOL0RBWUdYemlLODAxVUI4UkJGSGhV?=
 =?utf-8?B?NGtBV1NwQk5hVkJ4RXNUK1Jla3ljTnNtTC9SeDViSS9Sak9hT1NLNFFRTlQ0?=
 =?utf-8?B?U0Y4MHJxL2JvWUFrbmRqRi9JSTl2ZkJlTkplS0hvYkxlY1FVUE04QXZGckp1?=
 =?utf-8?B?ZHVkMDNGMHFZL0R1ZDNOeXlVbzlLNllUQlljaW0wVnlDVVdjRGNBQkNaUytq?=
 =?utf-8?B?ay90NVM2eUNWSnRrS3VFeEtPcWF1VlNMQjZDQ2RueForNG4vdFV5QjRkcVdX?=
 =?utf-8?B?VG9MK0wrdzdKWVV3Y011ek1XMXdHZ29PZXE3aGRXdnBISHBuSDdyZ2RteldV?=
 =?utf-8?B?M3FlUVZWWFlEaDZINzJNUTFlVEhzQ00yV2xXVURaRWk2VUJxeGNlVG5NejJZ?=
 =?utf-8?B?YWF0Q2xvaXU5SW0xL1NUOENLaklCL3FVbnRRYUNTS0FiajR2WTNnSENuRlBh?=
 =?utf-8?B?M0hsMVE0aGZOUldqbEZ0akEyVGdqZEw4RW9RczZwZ3Qrb21yWXd0MWlBeG1p?=
 =?utf-8?B?WUNNemhqeE9JbFgwRkV3VHZHalRROVR2d1F3Wi9OMlFEelZFbDlveUV1ckFO?=
 =?utf-8?B?YnFtOWNVSHpBc2JZNFhmeERmZ3Bkc1RLYWlTZkswUFhVYkhLUEtIUllTY3VB?=
 =?utf-8?B?UUg4MXNjYzhxeHBqTlIwU294bHRObyt1ZTZRS1B6U0hLSVZGUklwczc4MW1z?=
 =?utf-8?B?WXh0eFlhT0Z3Vm44eWdUREZvNUpna2xQdWZIVkN6cXBiUGdJU2lLVFZDeUU2?=
 =?utf-8?B?bWR0VWorWjhWR2lobm9ka0RaTkRMTU1qMytSRDB4eDVvM1diOGpLVG1yL21s?=
 =?utf-8?B?bnptZkUxamdHdjBQbUw0NXp0cnpzU1UwL1k1allKMFdILzI2d0tvUGJjRVp0?=
 =?utf-8?B?S2Rtb29OclVseUJiUSs1RjZ0TWxuV2x5UjB3RDhMRlhVQmxhbWxaNTkwdHcy?=
 =?utf-8?B?Ryt0K05xT1ZhaGVrNCtXZDgzV0tKdlE4ZWlSVHNiK0FaNTQ2amVmdGxDTkkv?=
 =?utf-8?B?NEg4VnFpTXROY2orRllCb2RLaTQrWW5kWk5wMlVjN29MbmlXOTBBaUQ2NHda?=
 =?utf-8?B?QTBhOXNlRmNCVGJIdlZxUEp0YUh5YjNvb0IyRDlrcFBQMHNDT28xbHhYZlkv?=
 =?utf-8?B?Q2dnS1pTT2NKck1hUy81Rk1FVEJRVmpPcFhHeHUvWmVXV3ZXNDU2VmlJN3VP?=
 =?utf-8?Q?a+Hy9iYrdTgMl1cZtVnMLOkTKEveC6J46I?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG5wQythVnlqRUtMbDM3YjRuSklNWVRmdER3UmgxSVBiQUFNb2h4UlNzL0dk?=
 =?utf-8?B?SDRJRkh6eGN1MXlORmRhcTBJRUg0MjVrbXAveFd5L01iTzZ2Uk9XZDdRQThu?=
 =?utf-8?B?V2w0a2VDbHdrWEFRTG40TTVrSnU4V0N1YkxrTzNIeHhNdGU4V1JhSllkNnJ5?=
 =?utf-8?B?bG4wUGJEMFdPNUNZV1RUTS81Si9sMXMwOGZEWi9xRkQ2Y1l4eEh4VlFQWkZF?=
 =?utf-8?B?UzdDL0dYZUcrY1hramFvYUZmUG51WXdMZHBDRVZ1YVVoMHgxWFA3ZlVlUlFG?=
 =?utf-8?B?SzdZL1VZRllIbzY0QzZjUEhTdzR5VWJUaFl5MWtLNUxtMlpGQ2FMeElvL3p1?=
 =?utf-8?B?M0pad3BwaWRDaytXZHF4UmdjMkFuM2M4WFJaMC9vWmhrVlRxTW5CWmc2OTRJ?=
 =?utf-8?B?MEZVUFI4enh1Z0JwUzFSUkhMV2lWWkxoeW9PL0tTQjhkNWtnRWZsdkJGcmlt?=
 =?utf-8?B?OE5LNDBXWmhxRXJzbkROb3hSaGZuanE5Mm1pUzk5R0JIWVpmN2RsTnhRVlcy?=
 =?utf-8?B?d3E3WkU4ejN3RS9UdXlPSHpWRW5lVTlWUDNtWnVnOUxuTXd5OUpVUVQwWkhn?=
 =?utf-8?B?Z1RYb04rVGlvclFIa2FmZHR5ci80eDkyMnc0ZVZrYk0zdFFVVHJWMG9JNGtU?=
 =?utf-8?B?c2JwNm5oNHovUDU1MmZKRzVKU3Q5cVczWjFEeW14MmNMVFB3cVJRUG8xcVRk?=
 =?utf-8?B?NWNiZDV1ejc5SjZlRks3cFFsQStFbVZUeFNQVTJQYnBVbjhmcTFldWdpQ0Rl?=
 =?utf-8?B?RVBHMkErQlhwVGpXbzE5WWI3aVQyRGRyemhLVmxEQWtrMDdaMFhZL096WkI0?=
 =?utf-8?B?V3VLT0h0MGRUZDR4cUlGZmMrZnF6WWV0K1FIVWt6ZEpwYXBkakFOTVJJL2N3?=
 =?utf-8?B?eDdxRXhVUjdBRTB5U09FSGo2NWcxUCtuVVU3d0loc0NrOEFqWm1LWmtueFBV?=
 =?utf-8?B?NENYZkRxV1puNXBWd3NDVGsrWFpIRTY2S3FFT1B2bTRuY2Q2dUZWQXAyRFUy?=
 =?utf-8?B?d0tXZzhTSU0vaEIzcG9PdFdRY0NxOCtsR3VuN1phOEJCc0d0Zk1XcDh5WXE1?=
 =?utf-8?B?dnhjQ2FGV3d5VU5ZTExDc3N6WkRGNytyNTZIdC9EWVF2cjkvMUlmN1dqVjhq?=
 =?utf-8?B?blpTcmNkZU40bERzeTM3WTJaRzUxWUJZcHNnN1N1SFpURjVHQ1FNRjMrcGF3?=
 =?utf-8?B?QUl1cjUwTUYzV1hVOU05ckdoN2RqNVRRYkRkUDBiQXlwd3dVdjV1aERpcXQr?=
 =?utf-8?B?MWxUd2xnQjg5eVV4VGFCVjJrYXNqaHB1OEZrQ3c5TEtuUW5rNFlER0Uyc01t?=
 =?utf-8?B?UHIvV2xCS0pkR3RjUWIzS0wyWlJSU3RkZm1saTFNQXp6dit5VWRTaFkzc3hY?=
 =?utf-8?B?c3RNL1VPWWVPa1llbWsyYVFkdXcrTEUvYmtuM0hFaFhNZEhva2NDeVVXOWlM?=
 =?utf-8?B?WGxJMFYzd0JQakFhRFVlZjE4VEphM0NMTkdPblhrNDBQcW55UjRvZGRBeUVZ?=
 =?utf-8?B?Mk5kajJPZ1pQd1BjSGdLYzF6bjhyd0wxYklqTWp5RFRtUExUT3loNmNSY1Rl?=
 =?utf-8?B?UlBQTW1hZ1pkanhIdGRHQ2pZTy9Mb1d3Q0IxWHpNNFdRNloreklKR3R0WEtS?=
 =?utf-8?B?WW9RR2hla3RTUW1aTXFMamt3TlpmZ3hGT201NjF4Z2N6RWZEcGJ2bW5SMkpZ?=
 =?utf-8?B?S0YxU2JScVhZZFpYRW1vVXc2SGJrSlhUbDZsZlFnK2hoS2l6clp1b3k4OWJT?=
 =?utf-8?B?QnVEbXR5d3FHY3BleUpycnRJYWpWQmZ0YVVzSHZxY1J2bWJldzVVbXI0RFNR?=
 =?utf-8?B?cXpIb21abnBUUk5RVjJka0hFMlhBMEVPUy90TEJyUWZQUm56cDJ1U0t0V3hS?=
 =?utf-8?B?ZEk4WWNFemZpczdybGtqT0w3K3lXV3FJM3ZRc1IvWVVuNWc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ef1c47-07d9-467c-22e8-08df01c1cea9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:26:42.1637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9451

On 8/24/26 12:59, Konrad Dybcio wrote:
> On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Flatten usb controller node and update to using latest bindings and
>> flattened driver approach.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the RB tag. There will be an update in v3 relative to the
size of the register space which should be 0xf1c00 to cover QSCRATCH
too. Do you want to review it again then or shall I keep the RB tag?

> 
> Konrad

George
