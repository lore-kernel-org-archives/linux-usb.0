Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1E3E6DE0
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525709; cv=fail; b=erwRaSraU6/X6s7+S7CUynXHou9kv9OS+JFSUiEKFg6k0lhcqqKz5LK/sxWQTUfdw/XE+KmHfY8HAQA2NnlIe4lD+VzrMa3tVMXqnoxrJAIvOMz0Koj6bb7Ur5fOUr1+FKiZ06qDjTZjSWK6sKNjx35adl7LPjlQIU0Ci/fyrHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525709; c=relaxed/simple;
	bh=wlE63p+eID3+zB6SgMN3vgfEBuufRPT+NRp+8VPH1XI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TEpXl39oUNK3Fm4ld1THuef+w0yr7F6VHw5dvKPftjfoZsDpUCYlb1Gfe9wpKK98gxUqN0IsXcX1nH7kmpvNKhZ02GKk6yzue4zQQxsoZAOzhRaZAlXzqgOwaRel+n8sezpII/s+dRoA8HdsmVQ4enelM/U1BVMFZTOHLXkYfm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFjYi2+J; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFjYi2+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781525708; x=1813061708;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wlE63p+eID3+zB6SgMN3vgfEBuufRPT+NRp+8VPH1XI=;
  b=VFjYi2+Jj87utI6mCebzbFhDk9N5LLyCRuAN+sRaM/Lo1AoI0F/xK6zx
   lxELnnDhKJwJueiVhFAv/UqPg18m870wGypkdEu3+HRixMFlqQpDVkQLF
   TGnSoLMZ+8JwqB9UVoGYSPZEKnVc3PzAOJGDiUjdCcBEE9eSG7ByK5ls4
   r1EglJMkb4KuOPpE3D7nRQajvolUryoZgP5bZOHriGXDU+46VY9AFZtml
   kD1u6JHUNvte3mcBOybR6DKZmGXKYpWwfXrlS4hSDohYzJ0v8n1f8g6on
   S21KSk/wEV5pSp2+PEQqD1Py+vbOjYPT69Bn8xFdNQDU/YZqBoimmVyff
   w==;
X-CSE-ConnectionGUID: iBi6E45jQ2OguG7o2GtxGQ==
X-CSE-MsgGUID: rpUB9KNrQ62xAB9BR2Hz6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99839366"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="99839366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 05:15:07 -0700
X-CSE-ConnectionGUID: TaC4/R0zTGGnmbsirONdtw==
X-CSE-MsgGUID: 3sCnHQILS8aT8wF+qjEuGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="247545626"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 05:15:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 05:15:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 15 Jun 2026 05:15:06 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 15 Jun 2026 05:15:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZHI+zSRUS88xUeQojZbCMemoHH1rxRc3VOwGmMCX5bCtmhXmzCMZ0I477pWol2+OwOCAnC03DHxY+3BluxalqM8NXHpuk/KpkW11W9UTEeyVHCsknpFMxEXhGU4k4wcy+09Qjk2OydxxQcm/YCmvLL8GpFuL6bKJJNLkt2IB67eTrcJfMYqPPECcWJxnGfzMNUBLc/P/9pHcbOvwImyYoNDjR2WnFkvXd/B+fxdg+WwVRznni+ucjXv64hlZ3T+Xyu2lwXh1Sg7A3n6i5T+09Qd5UIYYGbFmDxPPvSpPsBjmyBDmYS/670rDH+S8cbMZB3hNQ3jBFxAcayYaMVLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zx2uKy70uuyM/XoMjS4kzkv7zNgYOH9WRJ6EFUPAeFk=;
 b=ka4+J9WAOfV0oVsLH3VUJgZVC8MyJ9NMvnXXCzHbEA0Ng/i7pyRlAiHXPpgPnxjnYBxIpQVponsdhqqfr55dAVbwfx4XXgAAwG0k2Up6Zu5EsKnrphdHx8kNfwUNyPwWkS8jBkqqbA9lza3z08NSYn8nrC+MpMiTDGRmMjG2ub3mJ/mfk4UjtuwaGfzhvMuJtvSHeo8p+X33af9WupgJgCAgLQB5v+YYUg0RfDoXlYYSWmRd+uenSOR52vxjaCZ1iiTo9AN53/cMScPjbDJ0/pLr9kDPf/2YN9C/SAEJ0iVZ/sQ5cWHPllXQUvJ62nzyFimQwLsTlwO3kWzOeoVp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14)
 by LV0PR11MB9814.namprd11.prod.outlook.com (2603:10b6:408:382::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:15:04 +0000
Received: from DS0PR11MB7631.namprd11.prod.outlook.com
 ([fe80::cdd2:4a9a:9dca:5825]) by DS0PR11MB7631.namprd11.prod.outlook.com
 ([fe80::cdd2:4a9a:9dca:5825%5]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:15:04 +0000
Message-ID: <8ed92dde-c6e2-4dcf-92d0-fb395b2c26fe@intel.com>
Date: Mon, 15 Jun 2026 17:44:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] xhci: dbc: support runtime suspend while DbC is in
 enabled state
Content-Language: en-GB
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
	<gregkh@linuxfoundation.org>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<linux-usb@vger.kernel.org>, <ravitejax.veesam@intel.com>
References: <79a7df51-a2ac-4206-987a-83737e1d316f@linux.intel.com>
 <20260615085508.2096592-1-mathias.nyman@linux.intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260615085508.2096592-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::15) To DS0PR11MB7631.namprd11.prod.outlook.com
 (2603:10b6:8:14e::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7631:EE_|LV0PR11MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: 987cd17c-068e-4c0a-05d0-08decad7bae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kwHwy/5jS33nG/kT7BkksCGNYnWOoh6Aax1FABRSlfeYNvVwZjdgg3UCkh97mCXTqjyJ9oIrGUW98u+o0s/wNmclb5gQBsVrlg4gDzvt9SuvhmdkGLk4vbhJYTH5Olez6xjb+lYr4ZsRbKuExZ7GOIFYXLsoj+rWLMkh9cwSIP6OH43Z8X22TQC3LOCBtlRbH1cd7UxOhdCYWRjrUZ4/o+7/H/9isBfOMqCGNXJriRozzWMYnq/h5TlAK+0ESfqSRsSp6+kTwQeBo1KZkfQ/0gQ5yoz1L96t4x/0czS7Mer+3l2eDsLOde+lXsr4wqgjoB4CjTZNNfJanRsKwniUQbiH76qiOHkiSYNAtBC3P5PbMsYkkm7oXluaJRM4BEDfxmffur4Dh742r4ny2JqoH4GbsLCICS0otAKWKX+Dnemd+glcpu2ENZveZ4vb3xEq/vYBBQEjayvlNOnWENdxKYAthlvrMNyakMRk8mCJeL3IqlmcZprajStPAWlbvI0EyW6hKtfhwO/zxjgb+x7HPVsPZuVk1L0fUhaGQUNouhO+SC2HZsNIQkarMQ+lrVceH6F0gvIzNPLu6xSlykdRXTktufNcMXoOT1HcJGHW0BR4LCziz6+GAd3aBNIp00UZ1qqYkcjm9YeHjCUnuOcF9sELEyk8kFAyXQs1EwlJR1cNJovAWInE/ptZ9dO6J3ip
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7631.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dS9jYVlxVitUcm1FTm5GYWFVRkszVEVGOEJWOGRrNkJvMVEzMEE5SGJ2a3pC?=
 =?utf-8?B?WVRFUUhSWUdubXJpVnh1VVNLMlc3SWxiRmI3RFNKQUxSWUtDTUptd2ZibWlJ?=
 =?utf-8?B?R0pQVlhGRTBIUW90a2hnOGFhak96WGlISUgzaysrcDVzMG5jRVh6ank3b1ZI?=
 =?utf-8?B?VTJRRE1PS1FXdnZpU1ZHaGF5MmpaRm1zYjRrNDBpamdZb241dExMb1RRbVlo?=
 =?utf-8?B?U2wxdDFKNDBHVXdORlVIZzJjY3RtdjcrTzZDNTZ3cnFvU3NRYmxpQmo0Nm5j?=
 =?utf-8?B?REIzM25HRE93TG9YMDZVZWkwb01zalJab3J4ZE9XT1JsbE5LandETVpNdnVi?=
 =?utf-8?B?QUlGOWREU3B4ZmZRdFlnRlNCb3Q1ZUVIN2V5bU9JbnZlMmQzM3NxOE51TElU?=
 =?utf-8?B?SytQMkJPSUV5cVpuVnFWejVOTWZlQ2dxVllGeFNLNjQySlhvSGpjZjVMVG1L?=
 =?utf-8?B?S2ZxZnVDVVJQeWdnYVg3bkNNRGE0NEh1bVllRXN0dUdUQUs0TE9YVDRNOGNT?=
 =?utf-8?B?VWEyTUpINjg4bnluOXo1ckpMbC9EdlF4TjRlYTI3SGthVnZmZmFmcURoYTZV?=
 =?utf-8?B?Vzc1TTFyZ0doR1hPaGk1Y0lyVWh6ZUJ0bUg2c3hIN1E1Zm1ZQ1p3TEo1TkNI?=
 =?utf-8?B?NmNwa1JZVC9JaUtVYXgxT0NnM3ovU3Bqd3hWQmN0QjlvbCs0WGNLMFovUVhx?=
 =?utf-8?B?ZVpoU3hjVzYvdUF1NHgzUks5MjdDYnhuOFBIQWhHS1I3aTNBNjY2RXFmRG53?=
 =?utf-8?B?QXVyT3hZbWt5eDBYeTlIaGtWRWVRYnpmbnVVSitlUlNqUjNXVTBQWE1aQzZ3?=
 =?utf-8?B?dVIvQU9DVm4vRTk1ME9YMlp6dUxuc0FiVjd3Wkxaei91elVNL1g0NXREMG1w?=
 =?utf-8?B?cXJLaHMzbVVhYmkzbUY0WEV5Z1NoNCtUK1pDaGIyV0RqdVZndE1UNnkzZzh3?=
 =?utf-8?B?cjFhM2ZGTWNOOWxncEdrTlUxNnNtN3ErUSt6WkVwSk9nd3EyRWFvUXpKYzE1?=
 =?utf-8?B?YW5RQnMzWjhRQ2hHUnRVWmZ2WENIem9HdWw1SlZwTDBXdExuSHdJTERyQTM3?=
 =?utf-8?B?Y2JxdHk3Y0drM0taMFJNcXBWY25yRkhTakJ6b1VpTy9yNDhpbDhDaENUUXR4?=
 =?utf-8?B?KzBGUU0xUUlCUm1GejVqM0F4WDlnak50dEh6NEpYUXhmQkNJSTF5T2tha3dH?=
 =?utf-8?B?anliNWRiZjRTdGJCOW5FN0d0ODE0OWlVMTZkTnlYNmNSZHFVMGN6VVo1TDlr?=
 =?utf-8?B?RFgvWkxKbGFhRjRqQTRDaHkrbDZWY3RPcE9jTlJDV2xrVkFJbHprejdrRWdP?=
 =?utf-8?B?QXZuY3pPYVBuSkdmU3FvbjA5ZzUzQWUxRENmTS9jamxZQ1lVVlQ3UjlVMTNs?=
 =?utf-8?B?eGtJNjJIVXBUMDh5OWNoZzRVUUQ5Wm1vbFpPS1g2dzYxdkFNWVE4bXhUSDkz?=
 =?utf-8?B?YUJvL0dWcGsyVzA0UFpMMmtTNWV0ckxsYUsxV3ZaV1VrYSs4KzN5aGloUEpo?=
 =?utf-8?B?cGtSM241UkJtOGtsdC9FUGdUcWJ1eDZzR3VKSTRpaEdGeDFxMTBtNTBWWEJI?=
 =?utf-8?B?VGNTUnJ3R3Zzd2FnZitpRjZiUm9zcGlNZGlVeklYOFpBc3RGQXVtRHNFQ0hT?=
 =?utf-8?B?NGY0Yk9LUzBWS1pQTGpCMDlxMitrVWg3VS9IZFNMZG9Gb2R4U01ucHJ3TGRo?=
 =?utf-8?B?NFN6QkRTVSttWTBYbjliMmduaXJnVTRLZDVrZ05HMnRRbkV6NVhWK1g2K0VM?=
 =?utf-8?B?RGllT2svS1ZyNHg1V0RNck42b3BTc0g2MWtHb0I2eHJYcjZGbktZR0hGSGd4?=
 =?utf-8?B?eWY1N2hCejB1VGR4NkZhT1N5U2Qvcm5Va3Arcmh1dE9hcHNOZ215NlVKaTF5?=
 =?utf-8?B?V200V1c5NHpkckVPT3NVeXE0ZDlEQWJQRTl3TjhFV25hVk9Wd2FPbmxGYlpX?=
 =?utf-8?B?N2ZIQ1Q4RGFteG5EZ29KUlluWlU1WnEyc2tneFQ2amxHT2w0bkcyK2NQTnpk?=
 =?utf-8?B?cFZkS3JsK0o2ZHNpQ3BjTnd1M0NIR29kM1diV0trZTZzanI1dTNiUDZrNkFW?=
 =?utf-8?B?clN3VEY1N2Y1ZDZrN2hURk4wekwvWS9CSS9QVEtObUtyc3NvV1hiTHlPWmY1?=
 =?utf-8?B?V1hJdjNqTlcvZUpWQkQ3cXlOVnoxL2pZald2SWxZSWtKMkVwSE0vNTA5WkZ5?=
 =?utf-8?B?dURFcnkyL3ZGQ3BnSHhmT0JTZm1EUURZY1BlQytBUStkVm40cnJJTVZ0WkJ6?=
 =?utf-8?B?RVJHaGUzbVdSVXRtU1N6dXRvc2hvOGtYRUQ1R0xLQjM5SmdTdWRwME5nRTBS?=
 =?utf-8?B?cDV4eW4vMytXdFVyMTJkOXNpMW1XTjJTZTJSRk5ZYWxlanJpRlVYUnBXWXRN?=
 =?utf-8?Q?uoRXT3Bw6s0EKIpM=3D?=
X-Exchange-RoutingPolicyChecked: gXl9vDbnDMS2i6LxsUv68gbFwqlKdkV5AOJ4yJFIpU1YrQAJTuGtFYFZxIK0UR5u5qvOfccKorubBROyGose20cqZ38FYMPi1ElmF6tohRoCfcQd8d359L9OVpP0+YcLf2EOzxPjbZX3s+C+19okNvmHhJowiaOjEnf+Z0BbLk3uVsWIoArp3B+E/QJWMXgipkBJ9dva0PQRa2CghJFYAkz0JGxSn+HoeJTEdbxiR1TQ4gqiw7H6WRBe+v2oiaxN0UkuEQ9ZR3WT6Jf3faDRZWn8u91JTySzhC+PwO06puWll/59O/Vl6dGS39UTWlQTVSF15+UDrWGJ8tStVmQRgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 987cd17c-068e-4c0a-05d0-08decad7bae5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7631.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 12:15:04.2069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rphQs5U0oBg0lUfNpOAGhb/HhMiowrafAgOkh2cggwP94yT+wNyeMMKjkwIQcePP59zOqDbQsmJuWKP3ob/3Nbbp3ZDYVgWSWsOC2+9Iqzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9814
X-OriginatorOrg: intel.com

Hello Mathias,

On 6/15/2026 2:25 PM, Mathias Nyman wrote:
> Allow xHC to runtime suspend if DbC is in 'enabled' state for over
> 15 seconds without a connect.
> 
> Idea is that every time we go to 'enabled' state we make sure DbC runtime
> pm usage is '1' and save a timestamp. if the event loop still finds DbC in
> enabled state 15 seconds later then it decrease DbC runtime pm usage by
> calling pm_runtime_put().
> Enabled state is reached either when DbC is enabled by userspace or a
> connected/configured DbC is disconnected.
> 
> When a connect is detected we make sure DbC usage count is 1.
> 
> If DbC has been in 'enabled' state for 15 seconds and DbC usage is
> decreased to 0 by pm_runtime_put, then the whole xHC controller may
> runtime suspends to PCI D3 state if no other devices are using it
> 
> DbC sysfs file will show 'suspended' when xHC is suspended and will wake up
> and enable DbC at cable connect, or when user writes 'enable' to the file.
> 

The patch helps. Thank you!
Anytime time line on getting it merged?

==
Chaitanya

> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>   .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  2 +-
>   drivers/usb/host/xhci-dbgcap.c                | 60 ++++++++++++++++++-
>   drivers/usb/host/xhci-dbgcap.h                |  3 +
>   3 files changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> index 98a8376a83d2..991765d84201 100644
> --- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> +++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
> @@ -22,7 +22,7 @@ Description:
>   
>   		Reading this attribute gives the state of the DbC. It
>   		can be one of the following states: disabled, enabled,
> -		initialized, connected or configured.
> +		initialized, connected, configured or suspended.
>   
>   What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_idVendor
>   Date:		March 2023
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
> index 8ff8ac300927..f228c46293ca 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -647,6 +647,31 @@ static int xhci_dbc_enable_dce(struct xhci_dbc *dbc, bool enable)
>   
>   static void xhci_dbc_set_state(struct xhci_dbc *dbc, enum dbc_state new_state)
>   {
> +	if (dbc->state == new_state)
> +		return;
> +
> +	switch (new_state) {
> +	case DS_ENABLED:
> +		/*
> +		 * DbC pm usage is 1 here, both when moved from disconnect or
> +		 * configured states, or when setting initial DbC enable state.
> +		 * Just enable pending put
> +		 */
> +		dev_dbg(dbc->dev, "DbC set pending_rpm_put = 1\n");
> +		dbc->pending_rpm_put = 1;
> +		break;
> +	case DS_CONNECTED:
> +		if (dbc->pending_rpm_put)
> +			/* DbC pm usage still 1, just remove pending put */
> +			dbc->pending_rpm_put = 0;
> +		else
> +			/* DbC pm usage was put to 0, call get */
> +			pm_runtime_get(dbc->dev);
> +		break;
> +	default:
> +		break;
> +	}
> +
>   	dbc->state_timestamp = jiffies;
>   	dbc->state = new_state;
>   }
> @@ -682,7 +707,7 @@ static int xhci_dbc_start(struct xhci_dbc *dbc)
>   
>   	WARN_ON(!dbc);
>   
> -	pm_runtime_get_sync(dbc->dev); /* note this was self.controller */
> +	pm_runtime_get(dbc->dev);
>   
>   	spin_lock_irqsave(&dbc->lock, flags);
>   	ret = xhci_do_dbc_start(dbc);
> @@ -707,6 +732,7 @@ static int xhci_dbc_start(struct xhci_dbc *dbc)
>   static void xhci_dbc_stop(struct xhci_dbc *dbc)
>   {
>   	unsigned long		flags;
> +	bool			need_rpm_put = false;
>   
>   	WARN_ON(!dbc);
>   
> @@ -732,12 +758,20 @@ static void xhci_dbc_stop(struct xhci_dbc *dbc)
>   
>   	spin_lock_irqsave(&dbc->lock, flags);
>   	writel(0, &dbc->regs->control);
> +
> +	if (dbc->state == DS_CONNECTED || dbc->state == DS_CONFIGURED ||
> +	    dbc->pending_rpm_put)
> +		need_rpm_put = true;
> +
> +	dbc->pending_rpm_put = 0;
> +
>   	xhci_dbc_set_state(dbc, DS_DISABLED);
>   	spin_unlock_irqrestore(&dbc->lock, flags);
>   
>   	xhci_dbc_mem_cleanup(dbc);
>   
> -	pm_runtime_put(dbc->dev); /* note, was self.controller */
> +	if (need_rpm_put)
> +		pm_runtime_put(dbc->dev);
>   }
>   
>   static void
> @@ -911,6 +945,12 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
>   			dev_info(dbc->dev, "DbC connected\n");
>   		} else if (!(ctrl & DBC_CTRL_DBC_ENABLE)) {
>   			dev_err(dbc->dev, "unexpected DbC disable, xHC reset?\n");
> +		} else if (dbc->pending_rpm_put &&
> +			   time_is_before_jiffies(dbc->state_timestamp +
> +				msecs_to_jiffies(DBC_AUTOSUSPEND_DELAY))) {
> +			dbc->pending_rpm_put = 0;
> +			dev_dbg(dbc->dev, "DbC Enabled state for 15 seconds, allow rpm suspend\n");
> +			pm_runtime_put(dbc->dev);
>   		}
>   
>   		return EVT_DONE;
> @@ -1099,6 +1139,9 @@ static ssize_t dbc_show(struct device *dev,
>   	if (dbc->state >= ARRAY_SIZE(dbc_state_strings))
>   		return sysfs_emit(buf, "unknown\n");
>   
> +	if (dbc->resume_required)
> +		return sysfs_emit(buf, "suspended\n");
> +
>   	return sysfs_emit(buf, "%s\n", dbc_state_strings[dbc->state]);
>   }
>   
> @@ -1113,12 +1156,25 @@ static ssize_t dbc_store(struct device *dev,
>   	dbc = xhci->dbc;
>   
>   	if (sysfs_streq(buf, "enable")) {
> +		pm_runtime_get_sync(dbc->dev);
> +
>   		mutex_lock(&dbc->enable_mutex);
> +		/*
> +		 * DbC may already be enabled here if xhci was suspended with
> +		 * dbc->resume_required set, and resumed by pm_runtime_get_sync()
> +		 * above. In this case we end up calling xhci_dbc_start() twice,
> +		 * second time returns an error but is harmless
> +		 */
>   		xhci_dbc_start(dbc);
> +
>   		mutex_unlock(&dbc->enable_mutex);
> +		pm_runtime_put(dbc->dev);
>   	} else if (sysfs_streq(buf, "disable")) {
>   		mutex_lock(&dbc->enable_mutex);
> +
> +		dbc->resume_required = 0;
>   		xhci_dbc_stop(dbc);
> +
>   		mutex_unlock(&dbc->enable_mutex);
>   	} else {
>   		return -EINVAL;
> diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
> index df7aca8bfe99..5b18efb2c1ea 100644
> --- a/drivers/usb/host/xhci-dbgcap.h
> +++ b/drivers/usb/host/xhci-dbgcap.h
> @@ -114,6 +114,8 @@ struct dbc_ep {
>   #define DBC_POLL_INTERVAL_MAX		5000	/* milliseconds */
>   #define DBC_XFER_INACTIVITY_TIMEOUT	10	/* milliseconds */
>   #define DBC_ENUMERATION_TIMEOUT		2000	/* milliseconds */
> +#define DBC_AUTOSUSPEND_DELAY		15000	/* milliseconds */
> +
>   /*
>    * Private structure for DbC hardware state:
>    */
> @@ -166,6 +168,7 @@ struct xhci_dbc {
>   	unsigned long			xfer_timestamp;
>   	unsigned long			state_timestamp;
>   	unsigned			resume_required:1;
> +	unsigned			pending_rpm_put:1;
>   	struct dbc_ep			eps[2];
>   
>   	const struct dbc_driver		*driver;

