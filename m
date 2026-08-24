Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010045.outbound.protection.outlook.com [52.103.7.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CAF3F0AA7;
	Mon, 24 Aug 2026 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564298; cv=fail; b=iE1ctUiIEjbN1RUL0UdNO1fnhGPtKspF7YFJy57xEnEy3Km/L2+6F5Vveu0IWfxyQ/DtnivnSQtwvW+3oLu3G9dd9M33qbzUoBQWWIg1p5CTonFW2IKfCorwF/tMlNK/ELV9FhDLzvrNxAds/r24Of9a8hMbpqdRodmFMLN02wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564298; c=relaxed/simple;
	bh=nlffFd+yooxLnDdid1WpUxAvewHYB21htQj1YgxA91U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=urtR9PZrUMTVSzsivj3/VSzq6jbbEQPfTb70Hf+S6yOIvunBcH/t4e6WHXhMFC+4B6N/8xCMnf31SfccnMgWKInTRd0vs0F11VL8Uqxe324umahclEyTa1YutUV456Ru+NhMkdrdlmMoBBkYKwVx4xAoITarOAKN5pDeuksnUoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=J4JNp87X; arc=fail smtp.client-ip=52.103.7.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="J4JNp87X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOAWN5hijo0a3LuiOeDYR1NRM/I0jyBsEHZwbwewULclPHHV30oMJ8hwg+XzWDOw52VIpwRSO4J5o1XXlyNzMD1JJP9lXBvteKt4QXnOAlTabpalKcejGUiHFNds+bEeue77ty+1xzX3Vy2F2Vu4uRc0GbMETKEm6IROfUgPlB7KXF/Qc9IOSvaRS+veEcxKJU0prn5aRxSdwECAJEF78NJAzZKc/VRoyb/LMQysQIC7jXGmoOPHX/0+3iFeXBsbJus0INvFYBzCe8aAiOEj1G84TiZ7dOG3G93mrokl1sVbVBHObbMPAt7sxcSb0FP2OcWQvDajY0PMPC8eVCJp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKhme3OtfMl7A4G6WCx5TXaX3X9xdCCPfPGQLp6B34Q=;
 b=lGcq+EW2dpS+SAEqmz1SwMnUusN8kMKcG5FxHvXWOJOoIZLbUFhSG2xIJXhZXxJCsK/JiHsZKcebXFoitKzPBHizGvsfqu3/fOovKRgO/GfA0HgdYPg7lQO748XbbjM/9v+SJvShkk06jK0CWcywlh/0ZKRXBByOFv5djh8/FrWahuFSXLs+R8ggRZebK9iacWnwkcYpxreU/HdWH03aAYNepZFhw3A6IhGmoQFpP5R6riSTd0rRK+TCFa907zxpVy3cGJ8WYZkEOVsg8dOiYIxi9Agf+dV5dX8QNfUSREzkj4dKlCacq66BlAqC4+NX/SHczX4eh7awLPmgvaWkUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKhme3OtfMl7A4G6WCx5TXaX3X9xdCCPfPGQLp6B34Q=;
 b=J4JNp87X/TQYE+TFZhZZsgS8+u+Dk8qCXxupPMEFvgA0Bi9qFLi0oGCVJwlwqUsldsA4McdKz9YfJSoI1+eOW2ap/fufT9n1L2QqDDJDmjSEH2k7TRnHBL6PoBymN2mkyR5wWvXZ+NcA1qKh8UEqez5NQDDtghgzezTWYKEoVGChQPp9tLBPkfXhRuFjtCEicjafmVL4yzvc6WMlW3W4ZCX+4TqMzvkOv3t7+ZHIpqAMZQiRg633tD9WsTiqhz94o2AlNyfzMTuF+QqraMzcTuKm1JLHOPWsPLCo5ic9oENtzXSaYxKIXq9M8l04ELBv6U0SrRVaVEe2kEfKlZk86g==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by PH0PR19MB5003.namprd19.prod.outlook.com (2603:10b6:510:92::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 24 Aug
 2026 09:38:13 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0315.011; Mon, 24 Aug 2026
 09:38:13 +0000
Message-ID:
 <SN7PR19MB67361A3EEEC62A06BED447F29DA02@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Mon, 24 Aug 2026 13:38:02 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] arm64: dts: qcom: ipq5018: Enable USB
 Super-Speed PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Praveenkumar I
 <quic_ipkumar@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-13-8f355d7ff0ef@outlook.com>
 <f95e1af9-0808-44cd-8323-687b4de3f158@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <f95e1af9-0808-44cd-8323-687b4de3f158@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <f458cc09-1450-4ec5-a2c0-353e7a2981e9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|PH0PR19MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: cea15da3-c274-4369-4b48-08df01c36aa6
X-MS-Exchange-SLBlob-MailProps:
	V85gaVfRD4/uZtbPKQiHMaRLDxOOyjp2lINP2f5SwsWvslj2DcoIG0DOzDAgbkH3M2f7Ps/b6I3Pmwi7iBVoIr/6hNI5ZmCb4sDkLO8fUB5QgqgEqGvLyaCQw6b3d7rsGSMGRNBYeppy5xn+0f6XBzRTTY/JJVLVzvqqVdExB/LJlfawfTb55CtWAt78QCTpO4YYM7kMdd7DgzyWbpULIP073HOsR0DPdQJsDC58SXt5M6jDp9NRtqhFnbroG15RFYnh+M7dhdtWjl0B+KqDDmwSnxLQQItvHvP68koFUt2iVw/VjtLZIYEzioaRdAVAAY+joj/EuTyQejWxs91TMXGpIUe9JNqrXdScpIh4P+cuYTW4iYRr+uxDc1G+oblBnE3WFXAt4D0cKycxe061wwrnM04aMZ1LGkgdxQ3asvIxZoyzT7teXbOmSJmt4fNiQ1T6ktriKtOWtGARhPuWjt4qr2kRbGHRtRn650lBhPbON98aSZMQwu7MckWIYRPEz6YLZDPU9KYamYJMBa0TTJ5kS6QY95PDPweWT2tZCzzf2rGo7sJQmcYgEAVTS1heDP1q3WZ5l2BBpQsq+5wTctC2y9SmW3j39X8L/RgDu0nbdKcOjhrFRjaqfJzu+yG2bAv6sb6WMSbWjXM9ScKstNhSvIl6KTMJGUvyvS7tQB/Tr0G0Cg5vdoJhMStxTOMWvvJn7cOjQ6D7AaoWCIKwh852ZbF3vKPQ1QVCeTy5H85rfAFJIUFcBVEaE5VZHXB1/9NowSjmvUArMn5HoctoF9p839ypGbhoAqFT/BwNgmdibI7QJ32gaSfxUn85pqo1QmSZ9kh7pm1w0Uk64OlPZw==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|51005399006|24021099003|19110799012|15080799012|37011999003|6090799003|5072599009|23021999003|25010399006|4140399003|40105399003|1602099012|10035399007|2607281247196008|440099028|3412199025|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2J6eW1vYmthQmNKQVNxaTl5ck1Td2ZZMm1YS1RWdGtpbTExL21OL1pwWVFY?=
 =?utf-8?B?SVpjNnNLdUgyWW8rOHIydHBYWnRpWjRjUGErMWtEbTlhUXJMNWQvb3J5cm92?=
 =?utf-8?B?dS9pS1pBTGJMUDdXTzFNa01BRDR6aGRYYTJFZnR0Mi9NNUh2dXpHT0ozdFJN?=
 =?utf-8?B?S3NTRDJ4WTREaDdkcElobTA5Nm9VMVJuUnlXMHRRTE5wNjAzbkluWTJzOTda?=
 =?utf-8?B?eVBSRndqSjdIL2tBZmZXOFdCY0hmMFNmNW11aTZ6Ti9yK2dLMUdPdFpSclh0?=
 =?utf-8?B?QWM5MHdiUFBKN3lKb2lab2tMYWUybzNBcHdlRHc4eWp2TG9VQUI3VHBrcDBt?=
 =?utf-8?B?NDVXWW4rSDh6UTM1MmtNTk9VNnBmUE43Q3JMU21iYXJIa1JERUVVZWd3YVhp?=
 =?utf-8?B?di9FR0tjMFFMTEtxN2NpN0RmekZiTm9PaVFUNUhKZHhyaVArS2h4ak1DcUdx?=
 =?utf-8?B?Z1YvUm5xMXdkMjZ4VC9hWTNoUEpmckFHTTNaUk9Ud3BRcWRvWC85czROUElk?=
 =?utf-8?B?c1VJOW9FeG5vRkdpM3ZqcUlJZzJSSDVjMnJ1dWhWUUtxTVhJS0dUdjlQKzFq?=
 =?utf-8?B?NTN3MUtTZ1hFK0ZaYk5tWUhmazNYK0ZvKzVCaTRsZEJPMEMrNVZzMVlEWkhn?=
 =?utf-8?B?WnVWeHk1a2xrTzJMajZrN1VuK0JXQ2FNZ1BXcDMzdTNXV2U1Z3JJMU5sRzFn?=
 =?utf-8?B?MnFoRkhnY2hkK0xSSlRKSW0wS1gzRm45UjlNODNIZzlnY0ptaXo4ajAzRHNG?=
 =?utf-8?B?c0ZveWdlRzZ5MUZWcXF0TzFHdWRSandETmNxZ0l4dzM0OEJkUHFUNHJuSkJk?=
 =?utf-8?B?aTdQVHVWaWtoRVNKLzRVRVoyUEllV1BYUkE1SVZFQ0ZFSTh3V09LVGdmNEYw?=
 =?utf-8?B?ZFNGNjdJQWJJelhyUVFQZ1lKdEtLbHEvWi9mTVJKVGRWZFl5bFVYM2dFeEtj?=
 =?utf-8?B?ZXFBZ2RWeWdXK2JXeWJ1K1poVWMzOG02Rk5uNmVCM211c29pcktkTGdodjhO?=
 =?utf-8?B?ZWNSbWhXQm14OXlrcVFsQmtSYTYyWk8zcnl0WnVIWGorSS9HeXNBU3lHaytM?=
 =?utf-8?B?RUdDWWVscHQzbHNwdUE4V2MrTHQ5YmR6T09jaE9CVkhXNGtZcFFNS1MrN3FD?=
 =?utf-8?B?b1JVWGpqSVc3eUxtM1pvSUtwVmZjNm1mNjg2RFAzSE5zcjNhRkN5dElWdnY3?=
 =?utf-8?B?SDMvWWcvNUNyVVlGcVBJcW9BbVFibGh1TTFJcEtmbnJDU0FiSmhlZWI0N0h3?=
 =?utf-8?B?bmlsODZ5RnF4L3BsUHdIY0RLKzRydng1bmM4T3hXNFl2ZXRWK1dlQlVmWDRJ?=
 =?utf-8?B?VzVUZHFWVWZlRTdtWmFCOVByT0M4NlpzL0RBc2Z5MUZBNTc0RUE1NXpiVVlx?=
 =?utf-8?B?KzE5cjZaM3JTaVRYQ1RVMEVpK3ZyNGJCWE04WEs2RnlVMVEyOTQvenNOWlVl?=
 =?utf-8?B?NWg2dEs4bkxOS0lMRE9qSTlhSEdaOVM1UEtJa2hKcmZPRmNpazB4K1RuQWM5?=
 =?utf-8?Q?beay9I=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXFTalV5bTljWnBLTGpLeTRFb25hajBtL2N2cnBWTDdFZlpkZE41aHVDNVBP?=
 =?utf-8?B?ZGtNSHZXbThpV25FSkxLS2pjWnBpalVmb2V5ZjIrdDc3VEJ6NjV6RDlGZEll?=
 =?utf-8?B?OWEzcGNWMkdac3pjYWFmRnl1V0p2QzJaL3BwN0UxTUkwK2hmS3dlVkVDUU9W?=
 =?utf-8?B?TEp5TzBXdTRhdXpicjJ1MlhDMjlsSFpLUXo0c1FZb2NxYTJBZE9NMlZFWVZR?=
 =?utf-8?B?Y3JTbENkQ0p5S0pHT2hpZ0dpeTFLS3UyZG4xem53cUxXNGpYN1ZNMWxNYjdN?=
 =?utf-8?B?SmRBMCs5d2JkMWtpS1Y5ZHN1M3FlMjg0N2svSFpkL2hxZ1ZkTG5teW5CRjRJ?=
 =?utf-8?B?cGlHRDU4SDBJZjZ5RkhmOSt1UFcyZHZrWkZ2MjdkZG9LbW9qMmoxeEFWNVFp?=
 =?utf-8?B?WnFZM2drVjA3eGwxbXFPUDRoMTdZcGIvSXFNSzloUGRLNWdscjJFV1Q0cno2?=
 =?utf-8?B?bndTVGR2MlV4NlhGZnFxS0RkLzBZb1AxSGZsQUZQMG5yUk4xRWZwME9ZSC9m?=
 =?utf-8?B?ZUdkdWdrdFhmTThPaDdEMklEUW9nL1hNK0tQbStsMkJmOEVUTEMzYWwwYnZ1?=
 =?utf-8?B?Yk9WWStqaHY3RUxoMWF0eW5pOC9ncHRNdktoTWV1RXlUZFQ0Wml6ZFZUVUdq?=
 =?utf-8?B?bStjSTdWMklteEhaK3NkRDZGQmFKdThnL1k4TC9vZlRSQ3hWTVFxejRsR01B?=
 =?utf-8?B?S1kzajlkMGZNeHRGc0hCdk1PWWFybEJuaU8vTFkxeTJtVVFaQ1lHSTBsYURL?=
 =?utf-8?B?aUZPK3N5NjV6NllWRUR3UkJobzlBQ0tMbVVGUzVGaTBlTjU1ZW9reXowWktV?=
 =?utf-8?B?OWM5RmRqTW5lSjNCY1JyZFluVHd4ZFMrMEhLZzZ3eEpFNUdEZkxlZENMTzJE?=
 =?utf-8?B?YUp0TlhHcmNpbno2cFBRTUtHL1pUdVVvcVUyOGI5bTZXNVB5Sk5PbHZTVWYw?=
 =?utf-8?B?VERCSVc0aTUvT2JRZndpK2xOOWNWcXhCVGhMVWo0Y0UyaXlMMWo1amdKZVhv?=
 =?utf-8?B?WmxRU2IyYTg5cnBKdi9mdFc0NzFFcHJ4NWpBV2YwMjhXdGw1cDdpOGNMQXla?=
 =?utf-8?B?WGZxUE4zR0dNZWh0SVVXelJiMmZydG5Tdi9oUHRnWUhrS0NNR2FsY3FVclVp?=
 =?utf-8?B?M0dLNExnd2YrS1crd1pSMzJjTkZSOFprdlBxU013UnZPdDczaEVCZjBVWTBQ?=
 =?utf-8?B?VG1BVTlxTFJHRE54eDRQQVIremlnY0JJeWVCK3VOaXpsQlJRRnlxV0pzbjVB?=
 =?utf-8?B?cVhhZUVLS041Rm5OQjdHanJuZi8waVdPbkZKeVYzYjZrTDMwaGc1ZURSdDZC?=
 =?utf-8?B?V2JEQWNyUFpCTXFpNDdQdzVockFxeTJHeXBjWXQ5TW16QndPaHBtWlhIbkp4?=
 =?utf-8?B?dHZxSlVtY2FmYzJpa2JjUCtDREUwRjhtNXBJNTNLbGdsUWVvVVhlT0tLcEZH?=
 =?utf-8?B?d0JBY0ZlVlF1Q0NwOUh5MUovSitsemJ5RVVXbDRkaHRHN3RoZ252WFhmZCtU?=
 =?utf-8?B?WVJZeFJxc0gzbnVlL2JYZzNhWjQ5Y2RQL2FSaUpiY2NWL2ZMeFBudzRkWDFk?=
 =?utf-8?B?WFVnc1hicnd6QjdaNTB4QlprVWNtVjNMSHJLSGllUHdCSHRNWnJjZURVK1Nl?=
 =?utf-8?B?UjliYkNsbDBJMElJbEdxUjNURFRtcHloa2ZFb1J6WC9DVEhkcXErV0VpYjRk?=
 =?utf-8?B?bG84bWh4UTdLQXB1RmJTMklMYjF2dDk0MlN5UHlQRG1yc1l6MGxOUHAxTGZP?=
 =?utf-8?B?WTZ0L3c3RStkRHkvbkZLeTJwNkhMU0hvdTZSeHRMUlZubzdwbU1hWklTbDVk?=
 =?utf-8?B?c0c0Y0k5eUpWNDhJcHlOKzZVSzE1THJEN2toMDVuVGlLM1VyQVcyVWhFVkxu?=
 =?utf-8?B?TWhvMEVGL1VuOFcvQ3VIVUFMaldjazhOMHRuSVA1ZW85L1E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea15da3-c274-4369-4b48-08df01c36aa6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:38:13.5228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5003

On 8/24/26 13:03, Konrad Dybcio wrote:
> On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Add the 5V supply regulator and enable USB Super-Speed PHY support.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>> index 8efb2b21ed9e..ca29f271e673 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>> @@ -22,6 +22,14 @@ aliases {
>>  	chosen {
>>  		stdout-path = "serial0:115200n8";
>>  	};
>> +
>> +	regulator_fixed_5p0: regulator-s0500 {
>> +		compatible = "regulator-fixed";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-name = "fixed_5p0";
>> +		gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
>> +	};
>>  };
>>  
>>  &blsp1_uart1 {
>> @@ -119,6 +127,12 @@ &usbphy0 {
>>  	status = "okay";
>>  };
>>  
>> +&usbphy1 {
>> +	vdd-supply = <&regulator_fixed_5p0>;
> 
> I think we'd see fireworks if this chip got a 5v input. I'd assume
> this probably needs the usual-for-qcom 0.9 V and 1.2 V regulator pair,
> but perhaps +Kathiravan can confirm whether this holds for the router
> SoCs too..

I've taken it from:
https://lore.kernel.org/all/20230929084209.3033093-8-quic_ipkumar@quicinc.com/

and 5V is also mentioned in one of the vendor init scripts for Linksys
MR5500 to enable USB which is GPIO controlled.

It would indeed be good if Kathiravan can confirm..

> 
> Konrad

Thanks,
George

