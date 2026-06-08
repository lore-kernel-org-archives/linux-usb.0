Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011040.outbound.protection.outlook.com [40.93.194.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EEB3C3452
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932368; cv=fail; b=XSRv1QMflPMymtD2tD1s1Wnx0CkWhqCaORRuS+ZZEErarUnESTL0CS9t0qR0mksbU7jyYkP/p8YJ8yAExzEt3IQEnjR60/mVO5GUxPVaL1oOwwnl2X+LkG5oXxBeL+JtekD3cfv2IOfxq05VTycnrxhAObmdc+B9jjHjPuioYxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932368; c=relaxed/simple;
	bh=5Jy7HTX8QXbNWNKn6P70GL/hVe8mySRjQ1p71g5Gr2w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Pew5rHNd0BI0ABK9vKPNPNtWgTfKv6dsAwRbZ2zHHQtYGCbtc5kUSW+2rPc5Lmb+fIUyLwe0wQbT5K65bNnaVKozjFCmPLFXyLJOywKtEN19j+rvkRvs3/i+VgMW0ES0grc8qNGbO1gD7FH7z/USf7HjGhh6YmNwTI0Z4kN5NJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wgjbouZR; arc=fail smtp.client-ip=40.93.194.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wgjbouZR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXjEmUjzB+nwr00A7od1WFoz9a5MvzN2vqo3XAut0wd9f7CaTQpHEHJs8fJPsVPfILMYZtxWJr2DmScds4lJwRHIvqntQR95ngMt0kVERKQTwK2G+BmJxLnGYKnlV6VLxZGtwL51UC/yb9o+btKD+GdsJEyk3dsNq7OhqiZeurls9OjgfQHegr0HF1ohfmduKcXIZwX8JaaAQcBaqh6u2B5Ok7K5rDtDrDYaur0DM5pfhIv+x8xuYdCwZDgkHGK7BswHjP+YlM90um+/h00lbxu/WVzI/k21Hq64rHt/MX9A8HXrlSCJ/56jfW/emnkeBuCvXtG2rKWhxg4FTFXoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxR+NZL9K/IijrwE763wMshbHIMcjK4TXlAlWxVxqIM=;
 b=VtS2LnAW3+TcplijiHbhIl8CmEzFD29B4g7f1bqD+u8EY/6/gb7E0bQejH+e4QYciomxb8cW2eZ/wtC7x58k5bq6uWHhHrVM3kjFuTCrAgSWMsS8u66v622T4hwSzW8n2jMmmmCTaxRnY79zZE0J07yx3ImIaeAUOzgjKXby8U4EVPNa3D+VQtPBHyWDMvwQC7CzKdLUMycPI66SjiTQXm1mVqe0NFWjPgUCrdYybz64JSWb1sR1a2PO9Fu3UOBd6o3FHJw9iw3nAc44aoBV8NoeWuNF/kT0ONfxGTHC+x4nE9vB5dEe27JxA3s+U+RcP5nMLb2aJHbdQd5qLoIleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxR+NZL9K/IijrwE763wMshbHIMcjK4TXlAlWxVxqIM=;
 b=wgjbouZRq/YoP0eQobk5tybLVG0qLJAPckirN6ZpOTV8CJ5R9ntl4MNzwwrdgr5RLF9sLBuQ+jNHHGmdUOSLob2bN5kdpg1UPju99esZAgYp4z3VGJeDegsvnvAwfH+FNU2R7x8p6PONL75gPCFKKA/BFXHJQktJ0ycl7RGaz+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CH1PPF7A6EE32B1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::616) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Mon, 8 Jun 2026
 15:25:59 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:25:57 +0000
Message-ID: <9010e24a-afa0-4ede-bde9-90299f062dbf@amd.com>
Date: Mon, 8 Jun 2026 10:25:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Assert downstream port reset on shutdown
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <bnatikar@amd.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
 linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
References: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
 <20260604050326.GH2990@black.igk.intel.com>
 <d80346d3-692a-4982-859e-5321c4ec022f@amd.com>
 <20260608064020.GJ2990@black.igk.intel.com>
 <a7f333a2-d594-4e1e-9cc5-265aeda8e5a6@amd.com>
 <20260608152201.GL2990@black.igk.intel.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260608152201.GL2990@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:806:122::15) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CH1PPF7A6EE32B1:EE_
X-MS-Office365-Filtering-Correlation-Id: fccbc140-166d-4716-f823-08dec5723cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|4143699003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iRkXn+GvV2b7noR27qqlDwHMnWOuQmAVFTr+3w1t0NpnckwYnrJEyIUIA/fSdsDcIAOocmv9NRglSWRTI2e/spH+/AfyP2MSlRO2kSKosEjPiT1+7CaxaYmLhSutYV2JIQtT59ihU8Wa5AQ1f9NM3OVUjfWOjWuT/K9EKdTqdPcfBsVBFrOdVv8lLenBB5QT2YGZRg/uK6wDv6vzJk3cYJGFmAAhcBHmsfj/bFGcWVfnqsWGtv1M81UGPG8Ya653KTzS3DCa1baBMtIjnUMjlzF8YH3/H7KLjIEBFouLgnrB/HYezW0GTa4QZ7rf4aqkoHZuUjQ5ePeAj/5iuA3TlJpMcHV8lI3mdXK9z4+ashCiTq3HAuxOLAVb4wTWbgoxyR4qwps7XFDMayQRd03Ca4u8OEt3aSUe+b/0ongER25c+3nmny6Zs8JLL6prJshtrkDEzXqkgRybwGYMxti0Dyf4xrDAzflKcaoKZ2qzW5u4ZbhYRt3ZUWRlCLWGSan6cm++0cTQvTLwAqnAr8iYtOaobJ/T5+T+PhgAtNC/tRq4wqTzrg5SVVx/4WCb09M9WVTOEqaZwyF8whHeA1Ok/S3lVsYFJdmPQU4W+Vl9wauUcGbH9wiYJZ8+aFpGQmQ7HTLy20leEVwaa7jCPWjKOIB0JoFxF3L5iB5+/LRL2ht2hCbKJhehVJCCGu0GWjcv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eElPWkNYWlNCK0lvZGp5b1ZyR3VhNGZKWlczMUhmYVRzUnFBTThMcWRmNHhX?=
 =?utf-8?B?UDNrVy9aNFRlMHE3Rnkyc0FQL0RlQjZMS0d4bFI4emZaWVVKb09PRGdOVGJo?=
 =?utf-8?B?bEZXa1g5ci94eVV2cHlMd1RXdVlRZnF3ZGxjZXBiV21oY1lBKy9LUjZNV3FM?=
 =?utf-8?B?NUlTZkhNL1pNd012dmNLMGVxTDlqcHo0dDFKYmovNmpJbWdPK0FEaWFzVUJ5?=
 =?utf-8?B?VzhwVGtvUUQ5ZjFzalFmTVMzRXowQ1V6amwvbHdKbzh3Q2IzaEdwMjNZejZP?=
 =?utf-8?B?LzBHNmZrY3lEZk1nS1RxN3ZBNFJ1eVRUWjNEK2hjT2JEU2I2Y0VuRElzN1Ny?=
 =?utf-8?B?bld4aWJla1MzMXdsYU5hcXFoaHYyb3lHVXBTY2NLT1VoZDg2dlNNb1Arak9x?=
 =?utf-8?B?MkpLelNjQmljZmJzaEFlUGxkVEJSVjBDR2JrcmJVcmc3c2RkVUFjU1ZOTzdK?=
 =?utf-8?B?V09ET3FlNU96QkJoMDVBMGc0RXE2elFNb0ttZWVjMTFtanFudFhGWFc0T0J4?=
 =?utf-8?B?UjgxdWYrd1VsVVFxOG1Vc3lkK3puUEtSVjR3ZkxrMXVoTVBIOTV5ZWNLS25Q?=
 =?utf-8?B?YWhLUHJJb2IvY0hyZ09QQS9GaUlFUmc1bmlORnVVZ0dMUE0rUHFTLzJJVFVv?=
 =?utf-8?B?QXFKMXhmZTcvOENPZFRqN09nbDVuTUVJQStZSmRuV0hSRE9kWmdoWWNWYnE4?=
 =?utf-8?B?ZXFtWU5UYU9qY3kvc20xckNUZ0RnNnpyVHFPdmdHbm1iUXh1aVN4ZlloVTR6?=
 =?utf-8?B?TjhEUjNVUisxVitROGlGV2V6dUJOTnprbkZGd3JTTE1TTVJUbGhrMEN5OHNj?=
 =?utf-8?B?UHZ6OTA5a3llZUZDMmcrZW80aUZUaHdValVUQU9SZU1FcFlMd3grVTlTK1BZ?=
 =?utf-8?B?S000QWhwOTN6NDdIUlMxN2pyM3ZEbXQ5cVFYZnFNeEgxZUQrZEVWbmMvM3Bt?=
 =?utf-8?B?ZE9WS0Nic1R4cHoxR29iS05YV1ZIODBkc0t2VUp6dmk1ZU0rVlU0NG1qbVBz?=
 =?utf-8?B?TDErMlpvcVQrWnFHOXVJbThUcXRVbHpsMzMxVVU3VnkybVV0WVltVG1LWk1w?=
 =?utf-8?B?dHVUVDV4OXhabzVpaURPMmYrb1VtWWRDaVU1cUZMSGdhd3VmdG9WNTRRVEND?=
 =?utf-8?B?dkhhb2I0NTIwUVNJQUV5dk1mMi84Qzg3UVBMQW9uSC9ZUSt2blVWSDNQVEVT?=
 =?utf-8?B?VGFkdTlTbmFGdUVZQ2g2dTdjUnIrTkNSazE4T09iZlN0OGRITlBZaHJwVFZh?=
 =?utf-8?B?UWU2eThIREVaOE84eDgrZmhOUXhrVVZKbFpYYS9MVS9sQ2h2aGdBZkNLRyt3?=
 =?utf-8?B?M1RaSEsyWnBGcGNGVmdHUEY2ZjNRYmNMVnF3QWZmRyt4SWptN3VZd2ljMzQr?=
 =?utf-8?B?RndMMkJNR1hEdDdhS2RWMEpmc1dDS1pHdmZyZFM4dlZtUmZYdm9jb2NKKytl?=
 =?utf-8?B?L2FIR0R1cWpySFlWMGduR2hxVWcwWVlIOGRSUm1kMTZvMnRVWGEwK2ZweEFp?=
 =?utf-8?B?ZXFlS0dvODdYTHk2NUhWMGlycVNhekREYWkyMTh4MERSQUlMZ3BHWGt4bENq?=
 =?utf-8?B?d0Y2YTFleDhCNDg1QWRRZU15U2lVY0FVVkVzR2J0MUJhVnY4NHNOMk1mSXpF?=
 =?utf-8?B?NWFiUXBERVJsblJ2b29NUnBMcUlaTFdMa1ZrRGJTaVp5UmdBbmtscWpmRXcy?=
 =?utf-8?B?UE1DeFM1Q2ZweXNEOHR1aGQ3RDFwNzl5MTJ2SXNpcng4TWJlMjF4YW5LL1g4?=
 =?utf-8?B?YnFKMmFlS0xSOU9ya1NxcThFdlA3WVY0NlE1Q3RmbXdZZUM4bFUyUzRRMWxp?=
 =?utf-8?B?NzMzcXRPZzZkK3VUeWxvY1lqb2k3bzNmMHpZUU8zQ1IxMlFVYVBZc1NaYWpw?=
 =?utf-8?B?QVFnRk1FOUtoSDhvRWI2NERTMG95S2UxZHlGb3dKcmp5Y3BzU0R6bWFabHNQ?=
 =?utf-8?B?Qm00RzdzNHVaejlkaWZhY0xjU2J5U0prZ1cwbnFJdzZXc3RqUEtpYUU1M0RK?=
 =?utf-8?B?dm16bTltNG9RYTVxeDBLRkQ0OVoxYzZhNnVpKzNTWnFWL3R6K0pkVjBERmdN?=
 =?utf-8?B?aFJOS0M5WmlVK0ZpbXRRWnFIMVRjU0diV0JsSzNYWmNWMHJ1T3hVZ3RjTll2?=
 =?utf-8?B?T0FjcGZBYkJNS0lJSS9OQ1NTWlNHenhaU3FSQ29OUGp1Qm1BQTZodStmMytM?=
 =?utf-8?B?eEdRZlNSWXg4WGExTVEzQkROOWs0QmhOUko0QnZnWGw4MjBJTWVTQ2pQOUMy?=
 =?utf-8?B?QjRHRUhKdmpTajJFcFlBS1BNcmUyc3BhUmUxU0tpY0RRNHo4bFRXTTJBWWt2?=
 =?utf-8?Q?jx4O3QIdJ0uR0UcA32?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fccbc140-166d-4716-f823-08dec5723cf6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:25:57.4851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KC6VaqKIiqI5ZiC6jRj5XBdWvEQIfHywmQeowSQlNzwqqShvZWXn7IaZ6q0v44PBYRf0WmF3sKBwe8ei4Z6zmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF7A6EE32B1

>>
>> I guess I see two approaches.
>>
>> 1) Move to shutdown only (your suggestion).
>>
>> Corner case of user who unloads before shutdown means they could be exposed
>> to this.
>>
>> 2) Link the DPR behavior to host_reset module behavior.
>>
>> IE If a user set host_reset=0 avoid host reset on module load and avoid DPR
>> on module unload/shutdown.
>>
>> If user kept host_reset=1 then do DPR on unload.
>>
>> Always do on shutdown (regardless of host_reset value).
>>
>> What do you think of #2?
> 
> That sounds better. Also we could restrict this more for links that are TB3
> e.g no need to do for USB4, assuming that is simple to do.

OK thanks.  Basavaraj, thoughts?

The way that this was found was by looking at the traces of what Windows 
and Linux were doing differently at shutdown.

Maybe before we make a decision to tie it only to TBT3 we should double 
check if Windows was also doing the DPR for USB4 too.
