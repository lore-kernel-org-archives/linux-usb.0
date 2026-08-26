Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020110.outbound.protection.outlook.com [52.101.201.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6100922FE0E;
	Wed, 26 Aug 2026 05:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787722195; cv=fail; b=QfbhzP20pjD5FMDjtHdgKUZnA0uvsL/Z09o2SzuMx8Snbu5sDnINYVFEDdSVVW+SMlEc7sOLpoibtzMezpK98816KskJDP57N2PZmFATdmGXaFGf7TFtT2fGxcfAbYII12PtzBMrh0Q1/rWlBlTXgaUIGy8nErhTEm2vTbr4pKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787722195; c=relaxed/simple;
	bh=QuvQxTb8uKSb9lrq3ypmUj3uiaCaCNNW6oUT2vRfENc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DElDceM/8ptD66+F7jVUT7HQzHqODPFLououI/hTLlx1NOn5ONmVIGGv2QsHGuqOcffHccY57rd0GwZIl53mOOHmByNeIu2N5QNow4qHBZAlQfjM2jD+zmN62WAZ9mYUic6W0B2eGCdKqYO0BJmpCy/4AvAnI06syyv8aG45iRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=gy+HGylM; arc=fail smtp.client-ip=52.101.201.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="gy+HGylM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoHmb0SjklvNioZdElACgEiaVuPnbZkH/hwj5i+UXK1NecdJGiD4kh57gNiVnB1vnaaNZ29SDaZTLiICFB7ayGNWuYX0SWJ93B3k9mibPDijPFilIPp+a3y35yWZj35CO2bwnR3+jvWU/HQd4p1TV1NbO4VzfuFkYhITc2Q09figM3peC3QCe6tUWb/0NosZXhtsPvNIh4aB+aYoZCTEEg+ZAdyK/PwLePeL/LU3HIHfQ5fixDFgcCmRluzU0cgkjyfARuD5bR1TPxBADb8UnH5r14eUlJcuz4JnRy1PSk2TkuSTUS6L+Qu/BZ/9LHfPaY0UYKLIapjRatiXoQZfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaGR1iexKGBa59Vs1eWaoCZ9zjmoZ3QNzLRWcp3+FZQ=;
 b=Q9fhPgvWQYLU/EhMBvecOPE9JlEXWg2T/C27bHAhPvB8H3LRXTtCukqef6/Gxe+7OTVPEq+qnevTadb2OoEe0uCfW6oLBaYIunZ6sFpG6A48GMNkfxk3a8lmv6UsdOalUuLmYce0/kxtgja+Y22H609oGWLPOshQlhWRPVrSZ1xJm7g+qJDcvfDjk6GIXhrM2EjAb6gW2ykZNVuNHiqhDj2rIgRC9Dp9X4LHZnUwcvR9Ia2OrWfoD+XJHlJgLOFBfdyXbXdKZOMdtCw0G7oBwQHSSxKyz7/lf5Oo8UfFLN2iyLMbCim7jJlSrhzuTcfF1orJAkwxZ7JX5570/jQb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaGR1iexKGBa59Vs1eWaoCZ9zjmoZ3QNzLRWcp3+FZQ=;
 b=gy+HGylMUw5TvKXTVy06Ta4+IFZE3cuU5HPNFEDNRqykgNlfMBe22JFVVHkSCDR53bPYUlMutHXH8rw0ngKIDAVgGAK1QtKcIcSvXLPhxH+mYDc504ZS+eh//pt7ErHqqEp+sxice1TT+bhsTi/DU4psPljck/8t7g5xagWMBzmJTGPcCkYcRcVLG+N6ba6ZfCum+5OjYA4PUXTZxhpmdUmGvsRFL/AAi/SVI6v7ywWFsVZA3q5X5CN2mqk5Sv09EClxP22WGyI1rE5HOHfGKX6DJZ4/9Afqf6w+w4V40Rbcq5yJJyBcK2rSRAwk1pSnHDOturxplRYQtLLM3Ht4CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c) by PH9PR18MB732221.namprd18.prod.outlook.com
 (2603:10b6:510:3eb::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 05:29:51 +0000
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::89bc:34fe:3f82:b3f2]) by BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::89bc:34fe:3f82:b3f2%4]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 05:29:51 +0000
Message-ID: <663465d3-7756-406c-9e8b-64bfbcd50859@axiado.com>
Date: Wed, 26 Aug 2026 13:29:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: usb: generic-xhci: add Axiado AX3005 xHCI
 variant
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260805-upstrea-ax3005-usb-v4-v4-1-796af97bfce4@axiado.com>
Content-Language: en-US
From: Swark Yang <syang@axiado.com>
In-Reply-To: <20260805-upstrea-ax3005-usb-v4-v4-1-796af97bfce4@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0006.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::6)
 To BL1PPF1B62FD55C.namprd18.prod.outlook.com (2603:10b6:20f:fc04::d8c)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PPF1B62FD55C:EE_|PH9PR18MB732221:EE_
X-MS-Office365-Filtering-Correlation-Id: e13ddf59-3cf2-4a60-784f-08df03330d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	YLVkTLjSF5C1X1oNLoVnpLvWfXsUt3YrSfAyh/OS/r+KT3pfk+lBajBg9afabUqUdnKxdxIgpnTduXUywDPdFRx6mPpGKQRz9uzp6X7ETtKxpOuwzQLUtSdqj9iK9oUdSm47AxSaCSlCpXOijsrwo0FIEIQj/mT4n03sozW4xN+ye0nqnWkj+qh8RanqOhVTnOWRijRlNfk12lKY6JFntUcBVrPQjDoSrEDOA8necles3wyLdILEI3+YoZjYPAvHJvFxDT/1TfnDOkapIY3du8GCaghxVwKuDrCC/Fh3ccpT8GaZniNOf89eH7L7KeCkWb7CHNaD5NLCsFpnS7NdwSOMPevryRVXKMzyk50uKPLeeaVSC6yeiXlXL/OOwRjhxuPqYSEfam4V034tuiJFYJoYCZF7i6OiISfXiKgfIkFoMopz4ELTSgr+9oAzgsVbuuM6B23+yHj7k+F0P7asyTQ9389PWTjr9CThK/hkBXDhbB6wOA7yga5v7vkk2iv2ERZ2AHxIGTtOSt/OhhyflSqRFpov7vt9J+9ToU/3cUJfkF79DsLQdUK7qI7GfH2RxLkFJ2Adwrfl6DDjVre5ffEUVsM3/Rh2pXlFLJH+rz4YhMw+j3YMgXBJxzqcm0FqhEbqBYe0ZMw93SyF1gWsTaEiajAC7CmewvWkTa+ZzRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPF1B62FD55C.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzE5U081enZoRTltM2N0L1ZHVWVhTkRJSktPbG5DaWNXaCtuMnlpbXZXZDUv?=
 =?utf-8?B?N2N6M3czS3gxWVZQMGR3aEhsNklCT3N3N25XODlHLzJvbVZKQXFLSXN2UmVI?=
 =?utf-8?B?TGRvcXRWcnd2Q0pWSEZlZ1EwTytaQUMzS2lnWU5Nakl6czkvZzE2ci9wZDMw?=
 =?utf-8?B?SVE1WFZNeXNXd3FBdno0bTUrOHcwVm56RGV5YkJOUzRoMmlzOW1MRnJXTzlp?=
 =?utf-8?B?QUVFUVdQVFliQ09LVklkNGR0K0Y2SzNLZnVIU2JmYzBLa1VtTGZoUk42K21T?=
 =?utf-8?B?OXdoTjFxcmQraGgzU1VzL05ZczNaWi9ZNnNlNTFnbXdTMHMvVVNDUWk4U051?=
 =?utf-8?B?Y0dkVGFxd1BoT2F0d1JPR0x1a2lVWjVIOHR3VzdzNU1EbVlDYUdlT1dXTlhq?=
 =?utf-8?B?c3Q3K01jSmc4TCtaaC92ei9qVEd2TjBKTEd4ZEx3OVlrSSsrTEZZNkNTbDEy?=
 =?utf-8?B?V1QyaGZJbTNUV0cybC96TVUxdmd0OXZPTzM0djlFeWpRUWx5aXNYWTVYRmRk?=
 =?utf-8?B?b1UyVk0zM1VRSTZkWit2RkFVa21rN2VmRDJ1NG1TYkZJN1JzSml5cTErZUhF?=
 =?utf-8?B?V3RJTGcrUWdwdFNoSmZudTlMYU1yWjlUeWNmeXBhZUpHLzBWa3JVQW9abTUz?=
 =?utf-8?B?ZTdGQzNSc2MvVE9qU3EzUC9QWUk5UEhZbmRBK0M0V25HR3hmTDhCTVZzSHZ6?=
 =?utf-8?B?N1ZuOTRWa0l2aTB0cFRGM1p2aFhPd1E4dTZHS0FSQk9xc2hQZWE2WnVCUHBF?=
 =?utf-8?B?VExPaDRjdWJXc3NBa1NGanZWT1JTR0Zub1RrOE5nL2FWYkVmNVhTWDJtM21t?=
 =?utf-8?B?SGkwdlNmMURSS1g0NEpEUWl3OFQwWi9QL0EyZ0xkMUkrOTU3N2RsR3VJdTF0?=
 =?utf-8?B?Z2pyNXFJNWdVNnoxWTVoOE01NXE0aTdmY2gzUWZHcWFFeUQ4YjlIcTRVYUgx?=
 =?utf-8?B?djZaL3MvdnhkUUlhNFFxazF1ODFsdHlQRFJnK3poSi9iVlpxalVta0ZsNmtD?=
 =?utf-8?B?L1h4SzlNbGJNNTZ3MHFNRDRkKzEwVjlBWVZSaHNGYWc3eU5lZlBSN3BqSC85?=
 =?utf-8?B?NitSNXh3QVhhVHZpMUMzek54elBkeEJHRE9OZnU4TlV5TjV3NVdVNWZLVkFh?=
 =?utf-8?B?SERqeGFoOFRaRVQ1YWZkOE52UXdGTXA5VnlnaGh6OW5wQzBUdVVrc0RWZFZY?=
 =?utf-8?B?ZTVBdCtSNFVPamRtQkxxSGdkbUxzQUhaVUpGVHNFcEV1ZXpzUkZocGxKRnYr?=
 =?utf-8?B?cUZnTWJxcmhIVkVUa1BmOU44ZGQrbWNYQ3VMS01RVW9MejNQcmhia3VjWnpM?=
 =?utf-8?B?ejYvWEhUeDdvdkZCdzAvcmpPTGIzNExuZjJHU0N2VkhxNEpPY0VxRWdiVUwy?=
 =?utf-8?B?UzRvL3g3cE1NNTVvd3d3eUpaQk5XTWFHdkxlMFltQXdVS2p0bFNaL3VmRHZX?=
 =?utf-8?B?K3VFRGNJS1hKMm9IRCtWbit6YURmVUpjbmdsb3FjbkI3ZnpXUjJvNzIzcnJP?=
 =?utf-8?B?OWIyRWpzRHcrdVlyQWlPYW1YbS9OU2ZXY2c5TmpwcGFIbm1CdGd2ZGlpSjVV?=
 =?utf-8?B?YWdENjNJOGt3MlVMR3FURU42M2RlYThsL0ZzWkwvNkxNQlFxUm5GWXlNNzBi?=
 =?utf-8?B?dktCUkhYU1MrSWFDUUZsTGxYN1l3N0xzMUN2K0liTEFvRFYxZVdvL0x0Vk85?=
 =?utf-8?B?NE9PQjk1R1k3NVFpMkhzWExsRlk0MWU2L2xaSlpteGJwbEhMbXliZkpaZGpm?=
 =?utf-8?B?YXBNazM3RWJDOXVZczR3cDM5WHRWck8rbmNTVmxtRzNBbXh2SGg1WW8zRzZG?=
 =?utf-8?B?ZzFNdjk1ZUZEdGMyU0dySGNLakhoaURZNFMvYTNaVmE1dkV6NG1vd1l2QUo1?=
 =?utf-8?B?alNOSER6V0trcHNJNXFPYlpBbXdrQWVmcmREdnM0QVo3V1BrVjE5VTd4WUFP?=
 =?utf-8?B?NWlNaDhKL2ppR2Zmb1VJUkNla29EbkxDbG12SktXejVWd1dnbXZ3SzN3TnVC?=
 =?utf-8?B?WlNlbEhsZVZPVUJ5eUNKZW5ySktEd0NUUllSMXdBb1BjMmVydk9sRXRKMWQr?=
 =?utf-8?B?Q2VVUExSRG11cU9XUDN3eWdQVHREM0JkblBXVUJ1emhjNW5vS3Rsak8ySzJZ?=
 =?utf-8?B?enZVanhjWjFSTzlXNGcxMTlITDVWY2dSWTVwVTFHT1NVVmo4MUJGd1FaRHpS?=
 =?utf-8?B?bVVvVEFtOHlSYXNaSnpLQ3p5eEMyaitzTEN1aXhHa3NQSWJySWxqTHUrc3VP?=
 =?utf-8?B?SFZlQzR2ck9uZGYzRGpkNzVjZXVHZURURVNYM2dyeEVpM3czNHNnSU9JSmdi?=
 =?utf-8?B?RHVEV0tHcDF0Z1kvSkhpZmxwa0U0TnlkSTVrTUp2TVJoZjlMSThoZz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13ddf59-3cf2-4a60-784f-08df03330d1e
X-MS-Exchange-CrossTenant-AuthSource: BL1PPF1B62FD55C.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 05:29:51.2819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: us0QjG2zlZ7asXveMwzivbeYoSPbJOuKZHZDRzEzNaFOUO37vYQ43m/5Nwc4yHt/T9f4K9oBC2Pd8N+jGMj1Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR18MB732221

On 8/6/2026 1:09 PM, Swark Yang wrote:
> The Axiado AX3005 xHCI controller is software-compatible with the
> generic xHCI programming interface and uses "generic-xhci" as its
> fallback, as do the Marvell Armada 37xx/8k controllers.
> 

Hi,

Gentle ping on this patch.

This patch has already received a Reviewed-by tag, and I wanted to
kindly check if there are any further comments or feedback.

Please let me know if any additional changes are needed.

Best regards,
Swark
