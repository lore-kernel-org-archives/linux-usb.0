Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012007.outbound.protection.outlook.com [40.107.200.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34432E7365;
	Sat, 15 Aug 2026 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786796430; cv=fail; b=tm7u5EzwYX+i2h6PRTcdFyWuV4B8FJXefaSW15iTpf8Ct+lBvFWzJEAKOcicarlZC7djogv+TdcnO7H1idq6MNcUkvBM/Y4Td6qda6vhQfL6NEL5tjSRqSkUo25i8TZBAxDeU15bSg/of1+HJQtLD0QPH7xaYjYKHSPQQCdOJ9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786796430; c=relaxed/simple;
	bh=KzsQzj/5t/Mn1Ward2tWvHfngx263qMLgwoRbtKb4P8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mO0esgWquwAsERJyGY69zym7TDMeDdqPNJxx56rmdq8lBgpCHGnqWMvlUnENswibIp1bivggPw1d0UEhiLO1wcuJ/13zR247W4NgIjUTmHMHHdLDddof1GAgrRzcNORksIAA75MTcxd0ZKQp9/sl4dW9391+V2VGFTQ89b5dnlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XZqYzHnq; arc=fail smtp.client-ip=40.107.200.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XZqYzHnq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg0VKJnrdiLbzHPtSddh4eW3Ye2kPXzhFxLOhfqlGg6q9CByZXfPeo8ZhFWhXM4N2VM35qhn1prIzAvk1ydiIgYNfYQqGDEwBKSgGNCImmrXN2aitjQ5XkQlBLdwdyFfZK4wlnbawHn17kizA5B3H3hpmv9AMeWCfvRG9uidl7cWNk0+1o+qbeGE0naPNwvFjvjo9UdCAHrQHXau3R3PklxojGwhH3P2W7yl14+8CqyeAUxXeG6RgmtZmcdK/+/vSoRs7tCIVEXLtTZPY7KzQaDpRDQGaClGdNxDpS8O7UZVruxSitIjkOtw1SSxe5njkX+cqNqFqOvvXG1qT4rR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmQ76+yqi/e2G+5d+UnBNECdhLalEnQ4oYPfC75h2mM=;
 b=TeoVqaNbSEX8I91H/EKv0hEhqS3syWrTBpzvys3xu2ix16ddLBCznpZQy3MPUdNJFfQZoJoavWeD2XJGwgbjf7VLex24G6wkLIwGhdW6AElbeiVuJJbhFX+gdEkrWryoEVbr33STTCMZPjdgP4IEsM4HCn+7T7gXpYB/LzIOva+tk2i0xTq+xeTvOLIzEVlozi8lAowbof3dG/vN68FbQaIlO+jXT6G7sHzFN9swmjgsIeIkc2k5izNJw6+XcaORm8SuOl637Jpga3x4h4PFDBhHJ8/Tb1/okqUDtY8y1pp1ZUxlofuFtROH2vvdMb19ZwSn8o4UkoCrz9lLVgmgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmQ76+yqi/e2G+5d+UnBNECdhLalEnQ4oYPfC75h2mM=;
 b=XZqYzHnqwnPlSoFv8fLxYbYIvGr+EA0yyWVvpp1Ki259oGzXa+q0puv5cfKoEAuemZxEu0xGi6CGUGJ/aCgt0KFQ3Ea9elHN6oYJtxkLHHEYmjN+qZP+2pF8ogFQNcRjK7RzdOZGs4ulr/OtdIMh9Vq3/l6hIdFOLHPeSFEarDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SA0PR12MB7477.namprd12.prod.outlook.com (2603:10b6:806:24b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Sat, 15 Aug
 2026 12:20:24 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0315.014; Sat, 15 Aug 2026
 12:20:23 +0000
Message-ID: <92a30cf1-f069-4aed-93b3-acc720a30960@amd.com>
Date: Sat, 15 Aug 2026 17:50:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: xlnx,usb2: Make clocks required
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260810154548.2133565-1-radhey.shyam.pandey@amd.com>
 <20260814-true-greedy-woodlouse-4cdb5c@quoll>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260814-true-greedy-woodlouse-4cdb5c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0068.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::16) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SA0PR12MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ea8024-09a8-401f-2441-08defac794e9
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	94v6Z8Q2mOMs+9zWYmICmAxZMBFUG/A6rQweGZnAycgiSJL2riqSnUE8KWkQY/33OkHT6aDfFDHB6YvQp1FN9M0nfkm0oBz1ht10SUMeEILUtdC05VYMzal6g6OUgFodGIYMCv/8PH2Ia3/8VHpjnM29KLehFn6TI8weE/+5pY2NGdWgmICETfp0S306vwp4QThW65qpzJS3OAarzRFvDWj+tRPHL7qQTf3x7sacTRTSxZ9pVqaatO4QGTmOQsMDMDxWKXOpg4CcU6WSdnOmpNfiJmxoHsJ88YwxjK5Z9D/UTnBv1CI1CZ3Tciv19IXq9vIcgaTAWQTbJmQoFs/U6qjVpIDN3uz8zDpIDZE9xDs9CKqFEuEBM4XtEhS/FpMa+F4J01S44i3UWYee2lzDwjm8a/6OWMImhSSb0pvUIdf++j+1VtfXsOrgaPgTf3QzDill2ick2mAFpJCiK7FsVArv5mhCVaASeLgZhAzzPX7woZKBuOAlusHb9srpIWsCg+AkwRMadFB0qTfoCajiNjWmF8XauRQnVGUhNwrvOOXFyfK3ynRJyN40W4ds4xCjGkNXSWSZPZW7S96jR2kzn66BQ0RBfLv6IQ5Oz9EFzPsXyjW6wJrYGE3PtfliEV9HpZpr0uMwmaUJqmEusLamb2+bsyeYGE3kWDmqmbiY6hQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTcyWXYyRWZxVkl2eW94Yi82KzN0ekp0c0d4NHUyU1IwZG82TGY1MnBEQkR3?=
 =?utf-8?B?VUdrbFZFZ0ZCSjNhWHdKeEZmd0JMSnNUWDJGOXV2WnVNK3NzcmhPWHNlTUVu?=
 =?utf-8?B?dStJY252TEMrR1JEdHdYZ2RzbkZNMTNkMk55eS90NVhsVHdSUGo5eTVOaEd3?=
 =?utf-8?B?OXRWTVJXSGxhT3FHY0FMS2RjUU1JN2htazhUV0FOZ2I1bmt1ZlBCSmxrQlFE?=
 =?utf-8?B?a3YwaHB0RFJYTnllSVRqSDV3Tm9Xb3VRNTBlK3ZVSmlrdXFSZk5Ja3N5b0hw?=
 =?utf-8?B?ZVNQb2lIQ1RmVzBMN21jTkdIQkdEb0FRalBsM3o4UmcyMC9OUENMVWNNSDYz?=
 =?utf-8?B?ZUJFa0RFZlJnWVNRcThQbVFQdVU5RVNBZSt4NmxEeUlKZmlXbWdyTllBY0ty?=
 =?utf-8?B?RWR5K2ROSmJEdWxHTXNpc0YzdHpQbG84MHRuS3hSeFZLTlg2TDZ6YVJmWkJw?=
 =?utf-8?B?NFBtRDBwQXlxNWE5d3NoSmtyNW1YV0RFWGFkazl2d3VvTm4vbFFwTExncHgv?=
 =?utf-8?B?WFdpaDhnbU5LQTJkUjBkdC9DUEdqVTFYWFJUMFJpUlpUaHJDTlVselp3a3RZ?=
 =?utf-8?B?Y2ZMZXRMZjRHTFBrdE43Yk1Gd2VLV2hCRDNTTmFVeUg4YVNSK3A4NkRnM1BR?=
 =?utf-8?B?L3dSZTlJcGd6REtvaWQrdkpaamxZbGMya3Z6YU5qWjZJZnZvKzIzZitiRFZF?=
 =?utf-8?B?ZjcwNlV3QVRQWGNaMjRXY2NOQ1JwcTR0Q2R1NlNFeEhhdlRFZlVJYzhDdGRw?=
 =?utf-8?B?d3k4d2VEaXR4MVkrcCtPQ3JFVml3ajBCdVYxdG1pT1AzRHVHaVJsVzh0eGgz?=
 =?utf-8?B?NHNZNE9wQ3Noa253ZkJJeE9QanFpS1d0QmJjR0V4THg0TTVic25yTTF6STJL?=
 =?utf-8?B?ZS9mcnpiNXVVZUNXTSsyQTR5NFBCTlYyTEpjZDNWY2l2V2RyakNHZ1NlZWNE?=
 =?utf-8?B?eWJSWUd3K2xVekxqeEdNRFQ2U3B4NVdJQWZZbTFCU0hoOHVRdjhtd2M3U2M2?=
 =?utf-8?B?RzNFcDdDZzQwSXlPcXRFVXdmN2lhcGlqRVpJbDROUUVRUGgrL2dReXZPN01C?=
 =?utf-8?B?VnpvcWZmb3lkYW1nY05UWlhkMGgrNXBJNUs5aEo0RW9aOWJaVG91RS9EZjRX?=
 =?utf-8?B?eDRPaGVoMHIyQm5DdStXeGlxVlV6ZzZpYUdweE5DUXk4NjVXMHQ4Ty9FTXFw?=
 =?utf-8?B?VjVXSDJvZEx2dERTU1hVdmJzTnZ6TWMybzV1YlkwMVMzbk1DOEZ5ZVVoWm1Y?=
 =?utf-8?B?OHdybmR4Q3Rjd2xlV2IwVUpUZFp0QlluYmQ2blZmakRzQkJOYk80ei8xZ1dl?=
 =?utf-8?B?YnQzRnN2bS9La1c1MysyUS9GZXdCNER3Y1dzSnhsdGJYVEViNEtmNDNSVEZ2?=
 =?utf-8?B?Q2NxeEdtNndCMThaNHJWYWlqdlZZRGZ5K3FQcUV6OXZPamJjQ1dqQkkxWE5i?=
 =?utf-8?B?aUlGV1M0b1pqSjhOcWhYTnp3VVhrZ1ZQbzFSYlNjRVp0emx3RmRYZitwamVB?=
 =?utf-8?B?bXVqZGhvRzROcUxpWnR2ZFJjN2dmWWhENVlyMVdOK2txaHpBWnZTdHdwZGh0?=
 =?utf-8?B?R2h6S1g2TnNCNUR0YmZQdk9LcVQrSS9CUUZBOVY2YkZ2UktPN25VOVZJUlhZ?=
 =?utf-8?B?WElpTEVmeU5mcEtidk9ZMVJZdkdQSUU4NDhpMSszdGtJOHYwNEwxWmVHRXEw?=
 =?utf-8?B?azMrSHB5ZTRFQng3azZ3c3lhT0lmM0ZZYXhORk5BQVJsaldoN2dqR3hSdEg0?=
 =?utf-8?B?UURVeE1aQnRRcHVxVEdmZCtqUzhkQXZkYm43V0lEMlRzQkRtUmhHdHUrZ2pL?=
 =?utf-8?B?enl6b2VOZkoxclhGd2tzSUF0UWtSVXlLZEdPdDE5dzlGOVR0L0prOW11ajRJ?=
 =?utf-8?B?cFVxVnZ2UWJJSXBHRkdZWlBZSVdueGxIalpzWlA1bllGOEd0V1hyaW9yOTFX?=
 =?utf-8?B?aWZsY21pT0dCczlyQVMyYTgwaTEyZE5oVGI4eVl4SjJ0SEpMTDFyVTJUL01n?=
 =?utf-8?B?NGFyMFloNC9lUWovWmFsQldJQkdjSUxzeDJTQ2ptWjkreFArY1p3d21yZWRL?=
 =?utf-8?B?bnByNmZCVUVLeVFyeHVaRHVhdk05cmtPNExHa2pBb00xUlNTZXZJVmtXdkVK?=
 =?utf-8?B?Q0VHckgzTFB4cHkvS2tmWW8xb0lTS3JOblBxMW9TL281Q2ZBbENKcDVmc0hP?=
 =?utf-8?B?dDZUUnNmRXBXemJncWFaZFVLZjlFaWdsUXU4b0w2dWp1MS9hcUh5emQrY3hM?=
 =?utf-8?B?anJaSkxucE9JbUYzN3lyeFdlMEI3K0lhcklGRkFaa0kvb3ZlVXFJY3hzd1Ja?=
 =?utf-8?B?SDRmUG94SWV0N0xacTBLRVd4cWViVDFKYW5QUXh2WWMxR0ZXQTNCUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ea8024-09a8-401f-2441-08defac794e9
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2026 12:20:23.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6LEbz6y/5FPtyRG/jyUa93LZuRHSsmJig/z4+B5ZZLUQpwONOIQ4E5ROXV+rxcO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7477

On 8/14/2026 4:02 PM, Krzysztof Kozlowski wrote:
> On Mon, Aug 10, 2026 at 09:15:48PM +0530, Radhey Shyam Pandey wrote:
>> Add s_axi_aclk AXI4 clock support as a required property. Traditionally
>> this IP was used on MicroBlaze platforms which had fixed clocks enabled
>> all the time. But since it is a PL IP, it can also be used on SoC
>> platforms like Zynq UltraScale+ MPSoC which combines processing system
>> (PS) and user programmable logic (PL) into the same device. On these
>> platforms instead of fixed enabled clocks it is mandatory to explicitly
>> enable IP clocks for proper functionality.
> 
> I do not see the clocks being added. You made them only required, but
> first sentence suggests you add them.

Thanks for the review. I agree , will rephrase it to make it clear.>
> I still do not get why the traditional "MicroBlaze platforms which had
> fixed clocks enabled all the time" are now broken and require the clocks.
> IOW, what changed for devices which you claim do not need the clocks,
> that they now need the clocks?
> 
> Maybe this should be required only on platforms which actually need it?
The IP has always required s_axi_aclk for AXI4 register access. On
traditional MicroBlaze platforms, this clock was fixed and enabled
independently of Linux, so it did not need to be represented in DT.

The clock is a requirement of the IP, while the difference between
platforms is how the clock is provided and managed.

On PS/PL platforms such as ZynqMP, the clock is managed by the clock
framework and can be gated. The clock therefore needs to be described
as an IP clock consumer so that its dependency is correctly modelled
and the clock remains enabled while the IP is used.

This is the same rationale as the emaclite clock support discussion[1]
where the fact that the clock was fixed and always enabled on older
platforms was not considered a reason to make the clock optional in
the binding.

The driver already handles a missing s_axi_aclk for backward
compatibility with existing DTBs, while the binding can still describe
the clock as required for new DTs.

[1]: https://lore.kernel.org/all/20241002-revivable-crummy-f780adec538c@spud

Thanks,
Radhey
