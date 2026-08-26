Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012049.outbound.protection.outlook.com [52.103.2.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC5535C181;
	Wed, 26 Aug 2026 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737074; cv=fail; b=eIiSaHf3AGwO/t4RapNuNrei4oaZQjLy/TucnPoPDsW/CqpABkkNbvmXgGddA5mvY1RD4QiZZXm7Bhxdg/PHBngoQMfBf6kHaMSbA6TpXjtXMYpI8YxJSA3B5jGyLZOhRI0dcSm2mIY1tE1WQsm2T83/O+FcnfqpgIcpAx5z+Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737074; c=relaxed/simple;
	bh=7uGCl9B1gcH1ota9CN9/XSMiZQcqQqpSZpNfNGkYAPQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D04/kGVrNftAENKeSL4A+P6AdEKY70s07oljZqWNYYT81rsQEeeHyCRM6qxZ65jUDlVxU2dTsWLidXhnt9eYx98g5evrZ6dLrM1Q/fv/pAOXMJOfX+IpbVX1EkWEOVG1Jbo4jBgMf7SmPXDxjulz4Ow7YF2Ksj/7YiL9pWf1VAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=R7usWQLX; arc=fail smtp.client-ip=52.103.2.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="R7usWQLX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tmr3Yrd6CXKyjOXFCCqQlfEYsqgdMMZOV3f1+6ZA3Rm7U7gCEZW38US4jEJkwRQ4T5UMmbORRsufUsFuOIcxxsN1h7xcNkJjYPOs+1Lj+GA4O6HCqKJmZjSLyVe0gJ5xtp0W+dK7lyLSuG1XA/V2opWyRo2VroDFr004itfU9ORVaONcqN4cOphOf7KcjypSPgYDjsyALC1E/YVf5wIULrGqhRK6XCakGz4u6jkwFirUTW7KGjsCCZEGnaH4L/Zx6wzGqyn5Yy7r0CkAFppgAvpoU7efAkQ8Jt5lIEM23Nv8YTpi5NYUejNn7J+E1JXqY/QM31L7Tfm5V1DzfDmGcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOE1gru7ndJtiB+SUcfC8EfNEhY5r1bvm0CMi5cYT3U=;
 b=DzNmVV/YhJpHID+51UBk1whFbdNO6qEHnJal1SN+HbNOXqKCdeta09SNNzgEg4WOzWQ7t6Bk/HlWvOy6/I2seuypjD7huXZU8Q/b+E5kq/hgEMkkFybjQxumrO7g6uX8hlooFli0YdQg95XuMdu8vIIr5Sz4fVx94DJQEPgHaawQfB+D10UKBOgApTjPR1K84teNfnMW991ht2+eQ45iUbkTeNNdpTJcwKK3fqKBtuOxEB43TbILhp53Ja4lBHFI6afR2blVl+Kr4i2orHbYNktJ5mHa1IZIt4AVUPZ7UZdrSFLdFH7zGV8nfhNZnKW5jpS8EVcOtz1YC5oOmfLn/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOE1gru7ndJtiB+SUcfC8EfNEhY5r1bvm0CMi5cYT3U=;
 b=R7usWQLXM1Dx6C1Q0Mq2YbpWNdJVWSIc4Aef05D8+aH9k3W/JL5/rtzMGgIKU/sOv+65KcfIlVcBh+l6+02TtNhRJtgnKTn6G590PmeadfW9h6oGgKKaNW7LVdv1G5jE9U3R4gqrmW3/Ilw1wIRc8BgrXbBOf3GYMMfjCN46X2KdfeXpooks2KThD1KIA2QYioQwykJEJZYsdj0W73Xc+ZB3sycq7aVOzBHEaZDbWzwcCR46X4/veKN/uKZrim4Axt4L7+el6GDLlu039CwzRkgpYB9j1ihmqS+ma/JiyMkomK4RHfUkxOikBCZNKarqNwHhrF4T/XpjqXscp1dKxw==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by CH3PR19MB8161.namprd19.prod.outlook.com (2603:10b6:610:196::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 09:37:50 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0315.011; Wed, 26 Aug 2026
 09:37:49 +0000
Message-ID:
 <SN7PR19MB6736ED851811D9C91DE7BD529DAE2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Wed, 26 Aug 2026 13:37:41 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] usb: dwc3: qcom: Add support for selecting UTMI as
 reference clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-3-5c1f3170bbe9@outlook.com>
 <28002a60-9a40-42d8-9583-947194da23fb@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <28002a60-9a40-42d8-9583-947194da23fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <d2fda84e-0e41-4e3e-b1b0-a044f533a841@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|CH3PR19MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f796dd6-3233-4a2b-3686-08df0355b14c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6090799003|5072599009|4140399003|25010399006|19110799012|37011999003|8060799015|51005399006|23021999003|24021099003|15080799012|3412199025|440099028|4302099013|40105399003|2607281247196008|1602099012|10035399007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SE1UWE44M05xSFNzWXF5VEF4Z0MwTDNOam9XWGJib09pVGpuTmV1aUlZRHYz?=
 =?utf-8?B?Y3ZmYmxBOFVGVjhsTnNnRkFBdUx2TjNtN003VGsrSnMwUnZ6U0pHMEJ3d25y?=
 =?utf-8?B?YUdHTHZVZlZxVEpVTy83V3hKTVhHT2ZEdkUrNUJQUkVmMkhoZDczRWVQOVIr?=
 =?utf-8?B?blA2SGVyemJsdnp6K0xtQmU5VytTNUpza3Z6M3FjRExWNDFqbzdxM2dnTk5R?=
 =?utf-8?B?SE1wNlBlVjR4OGUvSGViRHhyM3NYM1ZkWTA4cTRRMEU1aHU2bktvRGxDVUlr?=
 =?utf-8?B?aWV5RGF5T2ROYTR4OVpSaVpqWVNnK0Z0MlpRY2V6alRPdmZZZTNtQTl6RTdj?=
 =?utf-8?B?Y1YrTWJFWnZ2di9nbU9QWmZDM2JySHNyWndvVVdOdmRMT3lkbWlNYU1VaDBR?=
 =?utf-8?B?THRBTDFwQlJuOU0zU2hBMTNSTnFXWThRdXdkYnVXWG4rUmZDenpDZUJnbE5h?=
 =?utf-8?B?TXJNanNwa0M2dkdRSWk3UGU5SmZwckNpckx1SWF3ZmVST2Z1Sm5aSFRjejBr?=
 =?utf-8?B?eU1MSi92TXBjYWh0aFVTaldjZzd0Q0FzWjRjQVhpeWlpVzNRaTBpQzVNMGhL?=
 =?utf-8?B?Rk9IUGhSUkhkZFpZMStpLzlTZEFScitUNWJKemtKMFJaZkNtdEhZcVFEOExK?=
 =?utf-8?B?N0s5YW5rczlnS1doa0FyM3lzU2c5enhueFZHamljT2lLZHcwTmdqeDdIZFFl?=
 =?utf-8?B?dUcyTnpjd0dBRk5mdVExY0tLMm92K0xNYXpsaXlrbituQitNZjNLODR3cmdq?=
 =?utf-8?B?eXpoUEFOWTVWZkp5bXNqSEp3amttQThtZ2cwNnczOTY5T2dtK3FYRmRwZ2c4?=
 =?utf-8?B?aDlJalBETzZQQUQ4dVJYTXVIdzVpSVRKME1iMjU3N3lINXJIVE0rdEhMY3o5?=
 =?utf-8?B?RG1rZE9VSDZ1WVZYZmJscWpJRjFnbTAvYWtvZjJQNXlwVDdxYnUvaEJWZG9F?=
 =?utf-8?B?Q1BQa3hYS1JNN21jcWVZWUpvMUhFVVBEb0NWYkNmV2VwdTBNeTBMTWlVR2xw?=
 =?utf-8?B?ckFjelFtWU1yelprbkVVYWdpbnN6THd4T1lkY1M0Y04rNDE1aXlCUDFpSko3?=
 =?utf-8?B?UHNZalZXVFNWTzZWVVBtdUNLdzFOMlcvMDdqYjFLaWoza3czM1VwR014Mjhm?=
 =?utf-8?B?VWNmY2RkNUVYZ21wTW0vckdzRDd4TzRRUjhvczVCc3VISys5Sms5QzRxVE9K?=
 =?utf-8?B?REk3TlJwOWFFZWpVM3FVNzREZDdKS0UxcjZRSlIzblBqdHFoUW1oWGxxWm90?=
 =?utf-8?B?VURhTGwyZXJpRnp3QmhDL2JuWUZZWjNZNWRqb2xUTTNuVTVpemg4UmR0dkxu?=
 =?utf-8?B?TGl6RFhhMlZIYytDSzlPcC9QVDN0djJwbWZZRGNPN3hHcG9HNVlKNGdyUll4?=
 =?utf-8?B?QUFybXBITzlZQms5RTJCU2Zsb05tNkR2bGlFYVRPbWR3SDdTK0o3M0ZGajk2?=
 =?utf-8?B?WFBLZHpCSythRnRYQndTZjBOUDN5anc3cmNJNVl5WHNyOEV1bndad0xHd1pQ?=
 =?utf-8?Q?FEm/Sg=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCsvb3VXWDVDRDEzVWRFWXFKVmJMNWkyb0czV1RVczV1dWEwSmYxSEU4MXN6?=
 =?utf-8?B?Q3RWTU9IQ2tHQWtDR1dhTlczOFpjaC8wbTdRWC94WHczWE9WM3lhamRHUWlr?=
 =?utf-8?B?QnNMaFNoa2doRm1zRDdhRmEyZ2tTVCtrbVdkc1Y3RWVsMkNEMVZobXpwNjZo?=
 =?utf-8?B?aUJQMXNYYVpoSHIrMTZXRTNyeVdOekFkeGJOOVdMSjJNZjl0OURmNklYM1FU?=
 =?utf-8?B?aHdLMkRzajJGQ2NjdFBybEJXS3E5Ky9kNVRXeXZYdS9GNW1ZQldSckJrZ3hV?=
 =?utf-8?B?TVBzRWsvTHdOZVJCYnAyeDRHbUQ2bDRSOVByRWNwVlZVNVpodDh1VGtZamRD?=
 =?utf-8?B?TlNOOWJ0MEdzUnVXT2twZEJlU3dIVkxXSUEzV2s4K1BVWlRNaWVkVzZBblNn?=
 =?utf-8?B?UVN1YmxZTmg3dmN5ZWFLSVJwZ201eHV6Si8vbHJIenNmUndtMEczRUJhZU9k?=
 =?utf-8?B?UjUzRnpzbkc5QWx2Q29BbVpKaERXN3J4MEZ2SEdMb1IzZytoYXFFUFZEcXhL?=
 =?utf-8?B?YlZucHpJUnlRR00yQnVpMU9nZC9tT0VsY1pnOXV6a1daYVBORlBPZy9oT1hw?=
 =?utf-8?B?ZUw1ZHU2Vlg3bTVJZytDUVZlS2ttczhrYkVJY0VZbzUzdmhQblZVbVcvczZZ?=
 =?utf-8?B?c3ZJa0FGUkZyVzFqVDN3RmdHTHFmbXNPRWJyOGtiTWRZY0lFaG84dVlFb3Vt?=
 =?utf-8?B?WmNabi9xQXVhQnlBRmFGZDY1MDdKNUxYL1lIOGFSWWswTWwyR29NSXdYOWhv?=
 =?utf-8?B?U2ROZC94S1VWQ3VwbFdGeUZtMEF5VlNub0dXY1hRR3NJNGJPQlpOUHd0amg4?=
 =?utf-8?B?VkFQeWJPa3RCdG5scTZEcGhScTlaUmdESGh6UWRWemRVTXA2UDd5a255bGpD?=
 =?utf-8?B?MUFFVE5GZjhQbGUyUGJGNFlxZ283Zi9vTGhQc2xZVUIyV1ByMWlnb0pSTVR1?=
 =?utf-8?B?WGhKUG03Y3ZvcGVQOUFEcEpxUlo0bTJRNDMrN0w5aTdEYXdwQVhwZDlQT2Yw?=
 =?utf-8?B?cm9haytqYmdDZmhkRW1IMlhzcHZJN2I5Y3lVWkpnNlNUaG44NFQyZjZ3UUdV?=
 =?utf-8?B?MXdrMlhBTTZ3MVNiL0wyQkhSNFhjYTdRbFRudW4wWnllWTh0TGVQRFVFd1Mw?=
 =?utf-8?B?NTdMby9YaWQvMEV0aTNKZWFMZGt1NVBPUFE0MFl4cFpJWE1DT2s3QzZSZ0NS?=
 =?utf-8?B?T0pxMllBcFl6WklpWkVyaUlON2lhZFJjOTJ2YU9uY1VjcG9xYnNUU0JJUmJl?=
 =?utf-8?B?NWFUWld4WE5NSXV2eUFVSzJZZHQrRnVVeW9FdnlBdWhGUmpuL01OK0p4cFdp?=
 =?utf-8?B?Q3lydjJDd2VIQUZzTitMUDJUQ3JKOE0wem1oQTJHQ3JtdHhQM09oV3pMQnJD?=
 =?utf-8?B?UElSaUd4Umh5KzZUV1VFNGxHSE90eTFndDlsUGpKRmZYTHpjWEc4VjhnNHRw?=
 =?utf-8?B?ZFZOUWEvTDJ4NjhhVlNBS0dHNkhPYmY5MEJVTDdoYTQ2UkNRdVAvN3BxS2g0?=
 =?utf-8?B?cE9ZZmZjVDRFakpURXZYRWMxbzBLZENwV3AxVmx0N0VCTHlGZjNxRUJVa0I2?=
 =?utf-8?B?THh2YWZwMk44d0NBeU1YdzVBMjQybHhLMmFyWi9XT2tETlV5aVNabmxJK0ty?=
 =?utf-8?B?S1dxaE5raXliNkhlUDI3Sy9mTG9PTWpLWndhOEowVlZTMGUvT0hEZkpIQ0FJ?=
 =?utf-8?B?UEJHRVY4eE05UHlhOXRmWG9Xby9FWkUwQm9LVDNiamZjWklkRzYwMjgreDJi?=
 =?utf-8?B?NlRIeDB5bGtNV2hRd05XWUhlMjlxRHJ4eURzcTZ5ODg0T3FLdmovaXNLWU41?=
 =?utf-8?B?TGlkT1pnK3d2TStZM3pPTzNlL3JFWUcwcURlYlFIR2dRY2lycm1ueTJaYlR4?=
 =?utf-8?B?SHRab0ZSWlYrZ254L2h1WlgxVlVpT2g5VFFCZEoySXQ0dGc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f796dd6-3233-4a2b-3686-08df0355b14c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 09:37:49.7735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8161

On 8/26/26 13:18, Konrad Dybcio wrote:
> On 8/25/26 12:42 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> On many Qualcomm chipsets, the UTMI clock is used as the reference clock
>> (ex. IPQ5018, IPQ6018, and IPQ9574 and more). Since moving to the new
>> flattened snps-dwc3 model, it is no longer possible to pass the
>> reference clock to the dwc3 core driver.
>>
>> The clock rate is used by dwc3 core to derive the reference clock period
>> and frame length adjusment. This is needed when the reference clock
>> deviates from the hardware default (typically 19.2MHz). Above mentioned
>> SoCs use different rates and, as such, the core initializes with the
>> wrong values which leads to non-functional USB operation.
>>
>> Read the "qcom,select-utmi-as-ref-clk" property to determine if the UTMI
>> clock should be used as the reference clock. If so, set it as the
>> reference clock in the dwc3_probe_data structure.
>> The dwc3 core driver will then use this clock to derive the clock rate.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>> ---
> 
> There's a shorter patch in flight:
> 
> https://lore.kernel.org/linux-arm-msm/20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com/

I'm aware and have discussed that with Varada. My concerns are that
directly setting qcom->dwc->ref_clk from the glue layer is a layering
violation. This patch passes it to the DWC3 core via the probe_data struct.

In addition, if ignore_clocks_and_resets is set in the glue layer (which
is the case for qcom's and others), setting the dwc->ref_clk makes it
become managed by the core which is the opposite of what the
ignore_clocks_and_resets property is there for.

> 
> Konrad

George
