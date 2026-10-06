Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F9737FF46;
	Tue,  6 Oct 2026 14:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298068; cv=fail; b=uiwNaR4hFmxSO1TUqZhfyKQqZEfCJyUnMatfwPJ5B6O1z5ZYpV0Qhl8kFaUB6H3ji5er0Iy0gQS9Uexxm0aeHvOtDt80ynBo2h3ML2lu9E6FRRZKec9X1zsB4KcaTPxcDbeQahBf6ogkSEeLMYWPkK+AQWxiLstRc6zONe++P1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298068; c=relaxed/simple;
	bh=JeIx8kmcLxuuotHnfzZnSCcvkAsezVYayZea6h/gsv4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QADMhE4Jts1K8YQKM+ivys6RDOdspcnKSHHuEyPpOeacJDP9l8Wjz+mjMh3xvQW2UyLb994y5d3FAwtCrWRYaMrzYmhf+KGHFxfwtLVQC7tEMcbxEXKYmj5iCAeFNEEBJ1rQhlGfYsEN+506TcceK4hZ6BjwZX7HsUP7t8WE1yY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tkc/b3pn; arc=fail smtp.client-ip=52.101.56.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Tkc/b3pn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToDruz2vnC3rl5Kv0mA2ohUKKgVZZIo/spAR1Qs4mWzyEQrk+2N9mcW1xKmi4YIrUPsoK6brwn2rqtio2Fg9cwnY3V3cLCv4Yh4Dfgfgp5Rse/PGNCLTv4hBOURkjbdXaTp+Gc8LPW+1T0/pVY1jRSPWfuS7pabWK7lEaRUIJowr5QzBxqvM+VphoNgMKDMACOfx4Bmo7/qFCo13VxhITxl5nqUDb6rxuy4U5ryuxycOib1EglVBuzyYvPtEhsMfr6X2Q953ijNDO5pa5YX6EdvmNelK4nk1egb2W7VFJq0lJVZlL+FN30QCh60b9NffamQO0gve2Ls2v+pvLHjvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeIx8kmcLxuuotHnfzZnSCcvkAsezVYayZea6h/gsv4=;
 b=yfJW6qJF5tC3A9dxjoJhJ5gDs720sgMxtw7Yg/0qB/nVeAOJ1f6n5fxrCvciTNu3M7Mzw0rdTGrDIOkWoEyL0zdJMKOlyAfxe1FCgWjkwaf3p0UewwiUDuefVzUvimPFetdM5KLWAwCfYoz5DkuliYiSD6299AqCoUDDeQd8lGvwBF8H9nKPk5F3lzMEKs2w3ej3vcwQ5liHVVTqC4a9+E48nSr3WVHrTFX5Wb72tJmWIvPouqfrzFNZ+rvX96AlsjIFCwHE+0dpE3eRf3wNXh+8dm48o9MjL0pCr+1K7BXRqTmEJElgPGWkS5WF0RnCXu2huRVJigYxiyAhU1r95Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeIx8kmcLxuuotHnfzZnSCcvkAsezVYayZea6h/gsv4=;
 b=Tkc/b3pnE4zzp6WFaWVwolS7FDYBUvqdXBrql9Wn97ie5aYRTTmw3kW0uu4ZWwExkjHukQK5HhVeMmiIcBNtFNHy56QIkBl3ZKf5XwvmqzqHi2vBLYr8a8YoP2a8hlKPkQ6sQIgzdYWPTXG105LhduHrh8c1qjZxMewjtTddo2Q=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) by
 DS4PR12MB9817.namprd12.prod.outlook.com (2603:10b6:8:2ab::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.15; Tue, 6 Oct 2026 14:47:40 +0000
Received: from DS0PR12MB6559.namprd12.prod.outlook.com
 ([fe80::3f99:f532:cf6b:ea46]) by DS0PR12MB6559.namprd12.prod.outlook.com
 ([fe80::3f99:f532:cf6b:ea46%4]) with mapi id 15.21.0451.022; Tue, 6 Oct 2026
 14:47:40 +0000
Message-ID: <2338ba8b-ddec-4727-89c7-7760937d690b@amd.com>
Date: Tue, 6 Oct 2026 20:17:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] thunderbolt: Reset the host interface before reusing
 a DMA HopID
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 Mario Limonciello <Mario.Limonciello@amd.com>, Sanath S <Sanath.S@amd.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
 <a7e066c3da8e1a92fb018008861775b33909ab0a.1790854235.git.Basavaraj.Natikar@amd.com>
 <20261006043306.GO176164@black.igk.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20261006043306.GO176164@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::7) To DS0PR12MB6559.namprd12.prod.outlook.com
 (2603:10b6:8:d1::6)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6559:EE_|DS4PR12MB9817:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b0ab4dd-3e28-48f5-8816-08df23b8c544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|10067099003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oL2nt5p4OvTl3HlFyxZXwaBKJnFCuzmUJmPV56LLcx7oSNFXAnKE2kJ8lSgadTXF2fA872RNg+TZVOQn7jC2Y7cb58E8FZyQE47/noSE1lZOiLltSCMc6JLUrjAplmqgnj+z5J4BvMwQLH9yd3KVkJr8kdjEmVjW4nAPwOsTt/RDpUma5dAoHv1b/MFyXt0M5L/9d9EEGKf8u760iJ31GSxbEwLHNhBST1C6zOoMuAv9TOv/hg4Gh66Xw6yKR52WGfT/I6vlw9rP2eLrrWeRkwlczytVRcmcMfyQFP5ha0nNRRxyGiQlUyWDyvI9rvBlLrBfSpLMl31wufq4g4+Wub/fT5omvIywg+hELLsJulAkgLpLEpTyAiNDzziGJB4zvqrWWgb4vu1GTDsTYmyzS8wOguxNiN0r+cDKEtTjpqdFsVOv2uGpNFLW6L2JLTysXprujqYRvVHRZMmDXBPWAv+95A/ZTq4hzakbEuA/Pu4p+nPs1C6luUSF9cfoIcLng7EcYHlWJqrTvRehA2X1nPVbL4lxMqHt5GqJRpQXtvM1xb4wUnNL1iYY+qYAUPJvJhvivq0bdZC3DoJAi3Fc3LfScxIAxAQRYR+aQOln+s1JvEu9yeIbrRlT9OK4sH4DGrSkJHRLkMK4RhOZsuCOOXKy0fgIeQmTi5U/0JIv6A4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6559.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmRvWkVraUNsSGZGRFpXZ2luL2JEYUpmbXYvKzR3aGUrQ0RyTHlYY1hzTElJ?=
 =?utf-8?B?bjVaZmJ1VzVrRm94RmRGaGNMcW9NWTFFMmRZL2NqcEZaRTNGUFNVVlBOdXgw?=
 =?utf-8?B?TkhUZGdxSU5hN00yeXVCWkV2Q3loZmZ1eEEyVlQvR2E0TFJKUjhDN0FWWG93?=
 =?utf-8?B?U0V4bW9oQlVxM1AwSmpaeDFZQkNRMnpFS3VNVGNGd2o2alRMbkVZeEt5cHZZ?=
 =?utf-8?B?R2s2dVdYVmVzMndHRGdPUnFxcG5XS0s2K1ZlSWxmRmtqQTFDTTRNTVlEZFda?=
 =?utf-8?B?SlFJZ0t4NEhZWlhocExkRDZvUUY2Q1VnY1YyakJMMjR3WkV0cjBvNjNLc3VI?=
 =?utf-8?B?YWRqajlMbzJnK0FwKzlUelhycnRxU2plNE1RZy9MSndyUHNXOFNlcjUrdDNH?=
 =?utf-8?B?TGJXbU1KcmpuV1p4bytsWlJmK2N1M2ZOWWlYeXZkRU9lNGJzbXVSa3hEYUg4?=
 =?utf-8?B?UEhLdnhYRXZsb2VST2JwTXJMck80YjdMbzVudE9LbDRxVGJPMjF4SGJxaWM2?=
 =?utf-8?B?RGlzZkRkNHFhd3lLLzh5WllGQklXd3diWFZDSEpFQStYV2ZVNG9aZUxIS0tJ?=
 =?utf-8?B?aTBXMkdCVXlVbWI2NW9mMG14WXVFd0NDb01SanY1T1Y5clFFRnNodUFFaDRr?=
 =?utf-8?B?VDJsMk9ZRDJjTStTdGxnWllBczdLWXhrVDFCNFAyTlNYOUY0ZE8vVzFBN3RZ?=
 =?utf-8?B?eUl5TWlWK0MzRGxERGJaM1VsVWQvczZ1WVdlWnU1TVJRTi90T3I0d2p3ZG42?=
 =?utf-8?B?QVdVSmx4M3AzS29KaUV1cWNUMkg0N1VRaTVQM1BENDZZWlYrT21DN0lZQUxX?=
 =?utf-8?B?RkQ2UHhRQ2hsWEZJTFI3dTB3T09Ibyt3NUZsY3ZIdWg1N20vWXZsZmc1QVp2?=
 =?utf-8?B?dEpYZGRnZW9TMWtFdDRMOTFjYjJUVnhDWGNCVHZIT3Jjb3RYYkNleHRhOGhY?=
 =?utf-8?B?STZKRW4zcDVjVW8xK2lraTFEZXZ4cGU0cG50MUVGcmZ2cVNwS1grbk9BaDJS?=
 =?utf-8?B?djI1b0orRGlNa1lod21Pdm5MTXNnM21SZVgvd2lkZkNmUFEvY1pCMlNNamcv?=
 =?utf-8?B?T2tvWkZhbVUrcktDT05Tb01QMytCK3lIZ2QrWm5uRmVTSlZYbmQxVHRHQnQ4?=
 =?utf-8?B?VHZQWEQwOEIwWGpUZFZFM2Q4bzV0QUVBL2REaXg2NnJ2eEYwcWM5QVNXZ2Fs?=
 =?utf-8?B?UE5jdDZ2bDBJVlpHY3hkY25ybUxRUm1BdjV3cmZCT3RzM2ZtclcrRkx6cEQy?=
 =?utf-8?B?dVM1NjB2cVpBaFVKQSthYnBYMm8vb2NIZTlKVnRNOHh3U05DeUNrSjFQN3Vj?=
 =?utf-8?B?bTdTQ3lkWm85bExHL29GelpvakFkZjkxNlJsaXhNUHJONDlzWk0va0hFU1lV?=
 =?utf-8?B?NnA3Zm5veVFsdlE1eUFldmdFaUZDd29xNjVoWU01cW1IOU1KTGZKc0NuVTF1?=
 =?utf-8?B?cUpqS3dkQ2tsQTFtTi9WbGxTTThEelZtYzVFSmVCejFKTWlpTG5TR3VmeEpw?=
 =?utf-8?B?SmRtclFpZXhvcUcxOHdMZ2hrcXFVRUZLT0pXekFmV2pPN1BwUHBsMjNMdDla?=
 =?utf-8?B?RTZJdXlkaWdOY2ZhaDA0VjBYVjVaWVVNSHFrRWU1Z2cyRC9TTUdBTWJoOGZM?=
 =?utf-8?B?Y2k3NzRNOGVTWDZXdTh4UHgycHU3UTU1dzlZejU5dFkwQ0F4RFRBanhXVVAy?=
 =?utf-8?B?aUdzUlVscHhkTGpLQW05NU5sVGdkcTBXRThhMWUzb2xDN3R3dk1UUmorbzNx?=
 =?utf-8?B?Y0xXeGpFVzZFSWVkb3VsN2xoV0VLWGVYdW9sVkgrQzYzTkRCVENEQ3BHTUdM?=
 =?utf-8?B?OHlDVXE5bmM1NTRCbmJ3VW5lU3lnUk8vQ2F2OUhJWFZJZ0d1d0VuSFZPdHdX?=
 =?utf-8?B?aXcwclMzM1lza1lIcDBreHVCWXFidGM2dlIxeFFWRWs4Y0N0azlBWjY1TnBz?=
 =?utf-8?B?TGczNWE1VTcxV3c0ampvS1RsQnNPbG5KZThyQjI5eGpYTDNqaVlDcTNkOUJT?=
 =?utf-8?B?SzFaUDdjYVpyL3dTUTVNeVdJYnpodGp3d1RqQVRRYnIwWU50bmk3YnFWZXZH?=
 =?utf-8?B?SEtwUVRkL1RhY3k5REZBNDBrenRtdTlJMFM1V0FoSGFodXVlQ0NiOTQvMEp4?=
 =?utf-8?B?eVhZWDVtRk83REtoUFF6UmJ2NGttd0kwY3ovSEk0MUk1VU9IeC82TEdJdEJz?=
 =?utf-8?B?UVkvTEJUR1FURUJVM1BWVVN3SmJVaUMrblVvUnFaWGlOVUhvdUs1NUdzQitC?=
 =?utf-8?B?ZUdNYjZ0alpibGJXcnRVajBsRHZJSmZZSHhnNVJsK1YzRy9wMmRBb1FhUVNa?=
 =?utf-8?B?cTBqN3ZJQlhGYnlJeTYwVkljZG9lWUUyUXNPT2xlSTFLMTRYZ3JBUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0ab4dd-3e28-48f5-8816-08df23b8c544
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6559.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 14:47:40.1823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cBFe405dUMdK93GMB2jKkQeGz7NvbS1xQysYYF7JHPNECqWInpL/+QlvkPNNmt8cIYkskWl1/HyroiOqG5byA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9817

Hi Mika,


On 10/6/2026 10:03 AM, Mika Westerberg wrote:
> Hi,
>
> On Mon, Oct 05, 2026 at 07:13:40PM +0530, Basavaraj Natikar wrote:
>> Reusing a DMA HopID without an intervening host interface reset can hang
>> the TX ring on some host routers. Resetting on every DMA tunnel teardown
>> clears the state but, as the reset affects all rings, also disturbs
>> unrelated active tunnels.
>>
>> Hence, track the DMA HopIDs programmed since the last reset, prefer unused
>> HopIDs when allocating rings, and check for reuse at tb_ring_start() too,
>> since networking retains its rings across reconnect. Return -EAGAIN instead
>> of programming a HopID that still needs a reset.
>>
>> Run the reset from a work item once all DMA rings are idle: serialize it
>> with the connection manager, stop the control channel around it, and block
>> DMA rings from starting during the reset. Fence the work across domain
>> removal and PM transitions, preserve live DMA rings across freeze/thaw, and
>> restore the interrupt-mask shadow under the NHI lock after the reset.
>>
>> On -EAGAIN, retry the networking login asynchronously and block the work
>> producers before teardown cancels the workers. Keep peer disconnection
>> separate from administrative shutdown so it cannot reopen the login gate,
>> while stream and DMA-test callers unwind immediately and return the error
>> to userspace.
>>
>> Enable this only for reset-capable host interfaces marked with
>> QUIRK_RESET_DMA_ON_REUSE. A competing DMA tunnel must stop before its dirty
>> HopID can be reused, and retrying does not interrupt that tunnel.
>>
>> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Yeah, I'm not really sure I suggested this :(
>
> My idea was to done it so that it is nicely contained inside nhi.c without
> distracting the service drivers. What you are doing is complete opposite of
> that.
>
> Given the complexity I would then rather just take the previous quirk with
> the deadlock fixed.

Agreed. The current approach spreads the handling into the service drivers
and is more complex than intended.

Thanks,
--
Basavaraj

