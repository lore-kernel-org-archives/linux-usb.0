Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011024.outbound.protection.outlook.com [52.103.14.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF84418A48;
	Mon, 17 Aug 2026 12:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970741; cv=fail; b=Yx3X77DsuXT+vNjBZDQcMDPsLTr6YpnCY3d0y3t9j7WmFstqhxP/5TQXrxqbDB2koHtk/V2Vt0nE5Ql4v0RfVyhDVBRWpd4lX3d98GDr3jhgEauly7ccyL7sFNouHI5JCAdDGxX6cfsKEmvxFsZpgURgiz7ZqKnfZU7KQr/oqXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970741; c=relaxed/simple;
	bh=1BgxA5m5oPgkFoLBczVpbHbxONBbNXYL7bV1DTShnjo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sv0BBwNVE4z+sM1Im3rFzXfeUFbH1Yy7mFUWWpHURkDdb3RttdH7gJGKYva735OYaTrRXBMSxYTK6fQY8pW1f8QZerMWaxGgKWVr7qgrIMQlvT0yAwvkxbhZIKW5t8BO86ouWNyDPP8D2RCW3xGnUuM5+VwKDtN77WHmV9Cx/k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=U1sSJUDZ; arc=fail smtp.client-ip=52.103.14.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="U1sSJUDZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DumPaLk1kABQfnKIe5VIy7tsN+Z1phhKJhKZ92cWOVH4+6L/EnhvkolTubvhVYlZwVH2po57hNw+MEhlbXlO69k/OJc0kEgDx+516kFbBwVpX0s9j1wlXd1D+lRaHlpE5YXbpo05nwibN2Q4t8ZIu8EB9QrWqObgOa5/74ot8dTx3g7YAKZAWt1MLrijikw/34LdrIErRzStIiSSZyCsgW8EigRUFtVhMlMCxk9gRXnwQEnXgZxiCy9yCEjEv4TZqeS23Y+pOZhFnFshWZi8XmhNMwb/x0X7WalPNZFJTfoNRmOqAlOM8ySjqItieDnJw83XEz8Ny+RX8Ggi3rAl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+N59QmTzyklT6yt3+MEWemRjHyaGKsWS8YsLfv+K/U=;
 b=US2mCxZazolIS7s9q4xDh3Z40OFVCPWz+kb35Q+5JISRI1KgJmojV1k78ivseP7renffXDzXLYwLXNroyaJy5kGFZSxB3HqpP5P2ZreuANaqpeVrRp6RKNP2fO+s5lwnn+sAlM2HofiVbGq4hLQc2yNPErVmK3DmM5fLbpseMWCBTujva6xAA8+oti9tC0Onr/z44RT1ys6xEaHvbdrAKViFegmmR1tfh/w2lvaQxkHCvLuxbUhAni2vCsvbLS2IYtgrMzN0pFGT4ScWLr78nWq24xp0D1pd8SakSE1U74YeOJY2i5B7G+/QycpzbLXQugiXp0qEUCD0rhgu/k61cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+N59QmTzyklT6yt3+MEWemRjHyaGKsWS8YsLfv+K/U=;
 b=U1sSJUDZDsceU3OZMnWy8bojywFJgrMkV7u2vWSaq8NR+PP0GaC34egHHOyc6RFdv+S5E2tMuafbMKTc468E4kc5x4EcnpCXi/quhQSkzdLZKL7DBnFma+WTwAs/SS4mZ0e6I9L5G8ah9aXnj5//tGUE5MKAHnFQnYOqOJ+G+cQqqbUKC6giHGM4DF0A8yOThDH/OyQLjgMXp23WMKYKZ9Iwjhek/oXH70Z3aCETrNXNVdIx+37S8fe+eibJssaf3xMRyZWryRFUPVxumrwqHnjpu+bYVVd2FpEzDDSG7zggOozlm4Hmn/LhpJY6M6W3NZ9jkv8JfLUZvlt3EF4o8g==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by DM4PR19MB6049.namprd19.prod.outlook.com (2603:10b6:8:6c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 12:45:38 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0315.011; Mon, 17 Aug 2026
 12:45:38 +0000
Message-ID:
 <SN7PR19MB6736C6F52894B351836F583D9DA72@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Mon, 17 Aug 2026 16:45:27 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
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
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
 <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
 <f13b0be6-bc1f-4024-9881-59f522566f64@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <f13b0be6-bc1f-4024-9881-59f522566f64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX0P273CA0009.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::17) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <f2ef87bb-d470-45d1-ba56-52cd417eb762@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|DM4PR19MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe9cb7f-ab37-4a77-9612-08defc5d7015
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|5072599009|51005399006|41001999006|15080799012|6090799003|19110799012|24021099003|8060799015|37011999003|23021999003|440099028|3412199025|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUtZWjdEU3cyRmhSWCtGOGFKRVhoc2NaT3RsenUxUTBTUDFHbkFBY0lMWnZx?=
 =?utf-8?B?a1gvWDgvMVZRbUVFM3lLZWlJbVBIU1lFZkhEMFJrU3REQVl1YlhPT2lsMHla?=
 =?utf-8?B?RWFtN1IzU1g2dmpvV25YbFVLbW9BSzhWcXlOcEtneWxUbWluMjJEbUdSQzRI?=
 =?utf-8?B?bitVYlgwVjBKbVV5MzRoVVVWY0FCZ2UwSnN6c2I0QjN0d0VEQUhnby93VEhk?=
 =?utf-8?B?VTZXUDBCQnY3dFA0amQvWDROTnpBUFlQdHlQemszQmpHWGhnWUM4Q2RMdERL?=
 =?utf-8?B?Sjc2ZGRKc2xZOXNSRUc3TWdkb3A3NlJPR1JBck04cEJ2WCt2U251VE5XU0Ji?=
 =?utf-8?B?TmVjOFloeTQraStTcVJPeEVITW1nOXZ1eG8wcWt5TTc3RHZRd3pPSWFweUNF?=
 =?utf-8?B?V3Nlay8zc1BlZ3VzV2UveUYwUVAxNVVTRk84RjJNcUJoQVF1V1diRlZUUHow?=
 =?utf-8?B?K3l1Vzh0ZlhsV0pKcGt6cWFvdXYveXB2UEIyR1VySWtROHBhaXNqcDlEVkNW?=
 =?utf-8?B?anRxRHlkRkx1TENIeG9pbU93aW5yY2xuWklndnJZOEczS011ZDhZUnJJYXI0?=
 =?utf-8?B?eWhUdjEvUjM1VmlaZVZSWVQvY2g2dUY1NmdNLzFVc3VtK1pnb2FzYXRtOWNZ?=
 =?utf-8?B?RmZpc2pCYjgxdmxmRWh6UGlMalBob2JaZTRhWlQ5cWRHNERzZnNjR01uakxJ?=
 =?utf-8?B?d05qZXNwR3YrTXo5NWlmU3Vnd2RGUnVPN1pFUzZvSHcyRHk1N1dZY2UvM21v?=
 =?utf-8?B?T0dJRXF0Tk5hMnNJSGhnN0tZYmdQMGh0QTVmQWVTV3U4OU55cFpFWWc0VnVF?=
 =?utf-8?B?OXZvTVczeHNQODhTL2RUMTZ5czJ4UTVCRERDWFJUMk13dlB4RjVSaSsrajBO?=
 =?utf-8?B?R3gvVm1udU80RFJTVzRqLzBGQmFKdmN5c0F2Um5ydHkvUG9nTUVyUitCREZR?=
 =?utf-8?B?a2V6UG0xWlV6ZldaV2hBNnJ0L0UxOCtjejl3VHB4bDJNdSs0a0k0NmE2UTRF?=
 =?utf-8?B?clNEMXZYUHRHNGd5Qjh1UldKVGQ3MGF1TTNpZ09LcFBzREkvRkNZVkZzNEFX?=
 =?utf-8?B?NVBnNWJyNFlHd2Z5V0RNc0NlSXBjSGh4dnpvczhzczEreWhUbm82ZThFTGd2?=
 =?utf-8?B?eWdlTVV4Z3VTZ0ZWNnh5WllmNTV1eG0reFp4djlJS1RFejVKNEFpWkZxOGQx?=
 =?utf-8?B?TzdBQkZacUUvbmxoZWRHNlduTUtEa3MxTDhoRHNsUTBmS2pzdHl6ZithTWNC?=
 =?utf-8?B?UWxSZG40Rk8ra0U3LzhWZ3BBL25FeXZEWGtWSUN6VWZuOWc3K3dxOVlSc3kr?=
 =?utf-8?B?MjZzOVNCSEg4NnJodmhXZU9nTlc5b3ljd0RmNlcxbGhPSUw4Vld3cHp5eHdz?=
 =?utf-8?B?Y3N0bytUeEY2NlE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU5KOVRCaGhmNXVWekV4ZG1aZFcwL2RYL2lHUnlPRVMzU3lzOUZhSmJLL25r?=
 =?utf-8?B?L2ZTQVp4NmFDRU54SGcvOXBrWE02THovdVAvV2Y1d24zaG94aHFOOS9Yd2p1?=
 =?utf-8?B?MlY1TDlBMHpBRHZhSnhjbEN4RjQ4blMvNlU0elorcmdOWHNBMnpOZWhMd2Qx?=
 =?utf-8?B?a1loWnpRejJXeW9jUnVQZ1d5OTBjRDN6eFl1MmV4WU5Za2ErZDJ3elZTUWVh?=
 =?utf-8?B?WTQvdVBNVml2R01TYTRTc1JyOHFHMG9oWGVSQkJYWVJlcEFDWTFKemV3RDEz?=
 =?utf-8?B?cFE0Q0xpLzV2bnV1UVliWjEyY1FMVGJSM1ovejFxai92QklUTGV6MG9EOHJv?=
 =?utf-8?B?a1lyRTNKVnMzV05UdkhIQnJNemdTMWxpaDFTc210em8yeHNCZnRhUWdaSXVo?=
 =?utf-8?B?YUxpUDgzRCtpSjFyNyt6cVp0Z1ROc3ArektuUTA1dS9qa1NvTTgrTURKMmFw?=
 =?utf-8?B?S0lsZTc0c1JXNEk3d2lLanFiQzEzSlltYUtGSWtra0FZeFhEZ0FaTkYxY3hL?=
 =?utf-8?B?RThDdEtiRWxnTklpbEpQS2EvVEFBN1EzNkhLQzdJamp4UTJsOGdMVzRRcDN6?=
 =?utf-8?B?OHJDc1ovcDRJMUtVWi9VWDJCdmptOTVGa0xWMU5IK25NMEh3MGs1dHgxWnYw?=
 =?utf-8?B?U21WRlgvYWwwYTh1ZUZ4STkxRk1KZDNRZVFIcjJQWTJtclE5czV2c1FJWS81?=
 =?utf-8?B?ZHVOSS9LdkhwNFlUMVl6dmZaa3RwZXNTMVFLbVRuWmloZzdZaS9jaWREYlJo?=
 =?utf-8?B?VWdBME02RXE2clAxRUtDS2JKT0pwSjQyQS85aG9OZE4xVEZzTkduVW9LRCtx?=
 =?utf-8?B?Njl4MWVmRDZkSENDMzh1OUlFQ0E3ZGJSTHExaVZZb2xpbWhJaFBud2NmcTIx?=
 =?utf-8?B?eUc3blo0aEcydFBwR3RPQ3JWUzlqN1VvaHEvQ2RidDVWMWw2Y3NHZWUvVzNP?=
 =?utf-8?B?Rzl6UWF5VGgzZkp4eWZMd3Z2dzhMNm9KZ24reTlmUE9UWitwc1o4OTg5SzFM?=
 =?utf-8?B?Kzd3MGtpT1FIQm5TTkF5NzJDVVZERFBoMmJwU2pCclNYSHNSc2pmazBjTDhx?=
 =?utf-8?B?U0dEM2srMVNaZ1c3SFN1bVpHZW9XT29FTFVaSUtnY1lhN2QyS1BvZ0JsN0FK?=
 =?utf-8?B?NXlkTWE0ajRBeDRNaHpENFpIM2R5Ny90d3JQMEU2REhKcDlUQ1NpdkZ5bm1v?=
 =?utf-8?B?dVFWeEVMczRCbHFwaHVyZHoyQXhZZlFqNU5QOE95WlFvaGQvWjN5T0lZbVJu?=
 =?utf-8?B?c1ZtZDdFWEF1Zm9Uc29CVWVxdTdjZ0wydGJHOWVVN2lXV2RQYWJnT2FHMDU3?=
 =?utf-8?B?VmcyK3UxQ0dEUmxYUXdkTXJMUEJYRHRzeDVLcnJVbmdiekluOVVkam03OGpH?=
 =?utf-8?B?WEg3U1VqeG9oYWtMTVVnZEM1S1A2Ni9kVjhIUGRabTFGYTVlT282aDhlVTJz?=
 =?utf-8?B?dzJRUEZYR2h5eEFCQUs3aGpza0U0OGo3L21IOSsvZ3ZQN2RML1dPMFZZYlVI?=
 =?utf-8?B?WlZReUtrbDdpZWZZQzJ1REMralZDV0ZTaHVrMm1kMjcrazYvOU80LzZZYnpu?=
 =?utf-8?B?dHpVaW4xWHFpRTV5SE1QNnNmei9nS016L1NraE9MNGZLb3FNL2dMa1pHeWFL?=
 =?utf-8?B?Njdpbkt3K3lUbkIvUEEwQkUveVJpSDE5TkFsNGJDNzAxZGtFQ2JMVHRPbVJt?=
 =?utf-8?B?SHFUU3ZSNUpRT04zbVZoUkpVYXg4RXNBeS9heTVRVWVLNStCcTRkWHJHOWZk?=
 =?utf-8?B?akZ3elNFaXA4ZjNjM3FzQ3ZybFhJSjVlWHFlWDY3S0lYNDlIS2I1eVNDSXBM?=
 =?utf-8?B?N3RnV20yaFJ6YmxLNDA4b01UM1dzUk11ZUVRWENmdU1HY2RjNzVKQzFNcmF2?=
 =?utf-8?B?dEpaREJicy9odjF5U2c2eHBqSkFvMXdYc3Z1dFpFVU92d1E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe9cb7f-ab37-4a77-9612-08defc5d7015
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 12:45:38.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6049

On 8/17/26 16:38, Konrad Dybcio wrote:
> On 8/17/26 2:37 PM, Konrad Dybcio wrote:
>> On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
>>> On 13/08/2026 12:28, George Moussalem wrote:
>>>>>> +examples:
>>>>>> +  - |
>>>>>> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
>>>>>> +
>>>>>> +    phy@4b0000 {
>>>>>> +        compatible = "qcom,ipq5332-uniphy-usb-ss-phy";
>>>>>> +        reg = <0x4b0000 0x800>;
>>>>>
>>>>> That is the same address as PCI PHY, so you have one device, not two.
>>>>
>>>> yes, AFAIK they're separate PHYs (pcie-28lp vs usb-ss-22ull) sharing the
>>>> same MMIO register space in IPQ5332. To enable USB3, the compatible
>>>> string, clocks, resets, and related USB3 properties override the PCIe
>>>> properties. In IPQ5018, the PHYs have different register address spaces,
>>>> hence representing it as a new devicetree node.
>>>>
>>>
>>> Same MMIO space is same device, IMO, especially that you have the same
>>> registers (looking at the driver).
>>
>> It's indeed one device, fittingly named "PCIE+USB COMBO PHY"
> 
> so the implementation, matching prior art for similar cases should be:
> 
> - phy node with #phy-cells = <1>
> - consumer takes a reference through phys = <&phy FOO_PCIE> or FOO_USB3
> - new driver in drivers/phy/qualcomm to coordinate the two modes

Thanks for confirming it's one device. I'm already working on a new
version using phy-cells and having the consumer select the phy type.

However: I'm adjusting the existing phy-qcom-uniphy-pcie-28lp.c as
that's the driver currently used for PCIe only in both IPQ5018 and IPQ5332.
So I'm adjusting it to register 2 PHYs and provide both PCIe and USB
functionality. Any objections/concerns?

> 
> Konrad

Best regards,
George
