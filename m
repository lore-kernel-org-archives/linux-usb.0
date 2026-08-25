Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22706390613;
	Tue, 25 Aug 2026 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665930; cv=fail; b=onedylM58wsVFbaXjQTHScHj7OWpY0Y9YewNWo2+5aQWIu7mQGXIe0/I9p/p+Kh172TjjosYTBRY8GfyWooJ7YExCPjSrNY40NoMek7I0SRjXjhuwYeVNJ3z8W2FZUBK1vWDRayzLrQVGcxpm75XrVutkSOuHqa5E8l9e3XZ/Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665930; c=relaxed/simple;
	bh=leiTfwND/Yk0Xa/Bi9qWCFnigCht5vgUp0zNffEpLEI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hZl7x021CiImv+RaEByhCuOWQqlada9Cu7KCAPX8iNQNRGZK8aX6sIpV4Ghj+mh2mCn38ir5YfyP1qF4O8WNV6mpCMIcFBxvzAVeVHSkqgK3y6SD9yZT4K/VkMjC7kRmntAuDCPqGVJexGLK9AevuqEvObvvxOSyEVk8DZRgp2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sSYdSK2C; arc=fail smtp.client-ip=40.107.209.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sSYdSK2C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cagbIzceSn9ko1pw5RuuQ/dbJeE+Yo0Z6AMEOKDzfYNI1eaHitQYv2NO0kjNaboPYOKlKRZ+y4uByWBAKXmzi911X6NxQdfkcxidzrh7GRLQmuBJF+nf0UmhvH4fKoW1I5G/AJxsdqZy8OF4QEyuw5b/GAEVbJdTM+3erb1amQtica0GjM4Dltyp5zdYeX124LWhJQid2uDacU4d9a5LU3uo2OZ9hH/lvCJNZ2nBsBfwesmvZXLe5ki6WeuuPzt3ml5si/KPC+zg7v21d19w4wzVVJJaQN04TmKX01PjNdBsNQZRUugXhLihu5TLDskdkIlZuR1/26OReauCNJ9RfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVnZYTKYJRbmLPmKQXvuQuLawy2TSr+nD6Qj6rT0Pug=;
 b=ERKrU2Q9pKfPlkBjciykUliJ6RsTc7oPF/brLQv39nCc/Kh3YSiH/hDYReGSPkerEVYWIagQRMYmxzmJ/p1zKCb201wUxv075sA/yR76xn5L9Fmz8hx6Y6kRgJrs+LX0BhXCHPqY+7+aEiVsCpg5xA/dmGOHbR9JKDADrLiGNTaJDyMAAW3ttrbGf+M6xAO1qoEMnv0MKwEb2kHx6O+vOMnlXOMK+VY64q362jk+bOZy7AsNrrZKA7ujlnxo25LTc/5CRUCPTP8tCYShiwuDyDryIAtYzYl/VEPCLK7Hfe7qnrdvYYLHx5a0iTd58CeeBw327KlmCaGNQ18rApd1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVnZYTKYJRbmLPmKQXvuQuLawy2TSr+nD6Qj6rT0Pug=;
 b=sSYdSK2CmshdPrb6MKrsuCLs3F3WI8/g7a89k66TFSOCbMH4Zu05w8BsNWHraWwRnVLAZCU/IdVDOguJWnb9EIdPcBNVhU05CluBULm2ZVa0IUCViHzAaDJa/vKPFlbuOZZNKGHwBCWa0NdNZjqyTUCnhqTkHj7CwtqPuHyhYvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 13:52:04 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0315.012; Tue, 25 Aug 2026
 13:52:04 +0000
Message-ID: <6bd28d35-354b-4de4-9097-b9fc7286a8a2@amd.com>
Date: Tue, 25 Aug 2026 08:51:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Fix deadlock in tb_domain_reset_interface()
 during hot-unplug
To: "Martinez, Juan" <Juan.Martinez@amd.com>,
 "westeri@kernel.org" <westeri@kernel.org>
Cc: "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
 "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <DM4PR12MB6134B3493ED0534463F86496F1AF2@DM4PR12MB6134.namprd12.prod.outlook.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <DM4PR12MB6134B3493ED0534463F86496F1AF2@DM4PR12MB6134.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:806:122::21) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b07335f-9ec0-431b-5b98-08df02b00b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PAMcueQ+vLa6N9uVhpeyAPFckjtAvLbmA8IcKddw5rwE4z4hwTCU0zDn3IPP0twA7e99i6sriVOgPuJUs/xVxWRysLR6EPJ1TaD3ljLA3Nt2tYY9D8rYsiGqak5LESi4KCiLdz7Rb/F93+HXIzNKS5/suZp6c1RX518SUMr8BIazJf0s3FlYJA9wgnE6LLGyu/sNJVbbQXKpw07LKm9k7uvilZ5evgim3fVYyMBfu6twZDjrfrKPsntAo6Y5W3uPchzQkdwYIaELzCoNXt6G8p/CY5fpjHOBKi/9AdRE9RGbHxuGvl05fNRPozCUEgmhKqNcmIHglq7pFLV2E4ntPPGKBjM/8NSmRk+mI9GG+b2iDR5EoIUPIkV7w8oU3oQh4bRGWp0enpCM2vABheQGWvnPZkg+XTBVjwuh1aL0AJZe8FHU16xGJMzWiQUAK8EbVQ1jN4jMPCyDMIgDlD1IAS34mpNmwVX+lqGU05PnDpVWMiuIhB9POqvdcTCRby7t1fWX07WyJyKEMMOX3z5dvakCFe/0OEXTB3fIFiNNBirn2cAqvi71iF1mgs29BMrY1KUfEoWZQ6nAAVBzHN/kWysRqETzl9w2vVGqdzbOc5CYxgERnnQcFo3RIIVWpeJ9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFJ2MHgzZGtvZ1VPSWhYdUF3Z0Y4QldCcjZUZE1RUGZIdW5aMy9ndmVvVjQ1?=
 =?utf-8?B?aVlNa0FEVFNGbWNvd0k0SDZtUWE5S2ZKbTAwUjBQeXFRcXVmMVgzZXpEVHJa?=
 =?utf-8?B?ZFVOSkU0Y2dFWUM1RkV3MkNWeStrSTExdUg3WVUzMVJFQURjUHptbTVxeE5R?=
 =?utf-8?B?Yyt3RFdLdWJFV0xOV1JXMFN5YlRKYWhjZjhzRno2Z2VsY3Fwc2FzbmRUZndM?=
 =?utf-8?B?aUhrKzF4SDJwUXZkREpoeUcrTGhxQkV5L1BOZEV0ZjV1ZFk0SEY2MU5zeHQr?=
 =?utf-8?B?VDJVMXA5dUpyTThyUlFMNTRtcml2c2EvdThNekNSUDFhTkMyUkpIUUNOa01w?=
 =?utf-8?B?V3JGMzFqM1RJU21HVkdFelFJQUt3VWdMdTA3MHNaazE0V1pEazVhVitCZmhx?=
 =?utf-8?B?c2RQVFFrQ3YvNlh6VnQ2R0dybVR0RVh0Tm9oaWJYRTByb2ZBMUZrWFJ4alUx?=
 =?utf-8?B?MHp6dEs2WmxSN3RjZEp0MlZuUjJHK09oTDAyRzV3Ui85ZWMrbjI2OFR1WGhz?=
 =?utf-8?B?ZEVLQitUTXZCbjljQUVYVmp3d2pQTUxSVTFGOFQwdTdldGJJbmJGS242UFNz?=
 =?utf-8?B?RGJ2REdiVE04WlJDTitvNVFOalVPSlpTVEsvbE0xbTQ5ZmxuQjJ4eVhOVGg1?=
 =?utf-8?B?U2REd2xVUDJEdXR3Y2JSdGtWdkZrTG03RjRYeDNCRjhkY2FsVDhuQ2R0S3NZ?=
 =?utf-8?B?TitKdVVzRncweUt1eTFJZ050QkZmL0ZCZ2lhcExKWHh3YkU1ZGVWeTZ6OHA1?=
 =?utf-8?B?N053QWpveTlUYmd2eUNaK1o3R1NrT1VESHp2WEpiYzg0bkxJZnFXMjY5WjhY?=
 =?utf-8?B?S0g1SmxRQUltKzdQYWFtYXJTOUVvQklRUkZoeFR1RjVMSFNIOEczUHNJNFY3?=
 =?utf-8?B?dmd3OUw4cTU0MWlGZ3Y3TldtbEFEMlhXRmZvMXRiVVdZVHJZWkRyK2hEWFdG?=
 =?utf-8?B?UVBrcEZ3azJMdzhRMTRSdUJkVk96NjROVFBYWEU1TEVXRytpc010WjBYZitw?=
 =?utf-8?B?ckxmQThjS3VvQ05WS2M0VjNRY1BQU25Na0ZJS0ZCYWU1SFc1Smp6QktwNUNM?=
 =?utf-8?B?VFFMazh5TnVCaDhNU0pGN2ZQVEN3a05aNFRNMkVzZjRtSzRSOU8xeUhUV1VE?=
 =?utf-8?B?YURLQ3ByTDZPRmthQ3JsdjRBWTBsdkJIcG9TYjFuKzg0bWdCRVpLcElGeGZJ?=
 =?utf-8?B?SHBVUEkzQWlJdnd5ZnhjUUUwcXJZQm0yWG5nNHFGTE5hcUszU1dRL0t2MjU3?=
 =?utf-8?B?Wk1FcStIZWFpdTdGeDVCcm9mb0Qzdmk4WFZWVlR4dnFkdVA3Y2h3SFV1dG1O?=
 =?utf-8?B?Q1IxdXRaWWdvd1RtWGxiZm5rMGhBclFjNDBpa1BpWUNkS0w0bFBpd0tPYXpE?=
 =?utf-8?B?M1RWell5dllrUStBNkRGcHBkMEtoMjdlVndPSFk1R1B5RFNLc0dVUmZneHNn?=
 =?utf-8?B?U0tTR3VScXNvdFYvVUZQZVByZ0lITG5oUG9Vd3JkUFlrekZWTWUzWGY4am9p?=
 =?utf-8?B?aXFGd0dpR0ZYSlJLa1FHdHFaSnJ6NVFqbVdRTG1LN2lVT1BVMG8yejFKSmhI?=
 =?utf-8?B?Z2JsMG1jTWFLMFQ4bS9iSThhMjRkaG1WS0hndklQZkUzS011R2hVVDFUNytD?=
 =?utf-8?B?bTY2cElabkNoVmc3UGVpWmwwVHZBWjdMcy9CSDJOb3h5bUk1c2pRR3E2bVRj?=
 =?utf-8?B?OEx4RWtQb0plbU1WdkR2TVgxQ2JodEhpUTdDc0poVjNlc1U5YU4zanlranZt?=
 =?utf-8?B?NW5oSklOVkZoQTdFYjd5MlJvSTR5bVlGdjgwajgwN3ZWeXV2V0FJR21JKyt2?=
 =?utf-8?B?Q0FGQXFKMlVMNjd6U3krODFoMFozcnIyK2V1eklPN08renVscDNhcVZGYllT?=
 =?utf-8?B?WlFBb05xMnltVmhsRmE2bklERi9yNXF2N2dYZUdHK0xjSElxamNHRnROV0Y5?=
 =?utf-8?B?Mm1uZXRZT3Y0K1BpUS9pRlllaktrems3ZitBYzlKVmQzNnNpN0E1MmFzb3V2?=
 =?utf-8?B?ZzI1YTBSbExoZXZWN0JvdURFd0JqZE5ZcVNyOEMrVzNBQWIrVEt4ckZwTVRE?=
 =?utf-8?B?WXZ5OTVRRlJhayt6S3duUDFmaWNSSFZaWjBiOG9vSVJRN0F4ejJmTTNQVEIx?=
 =?utf-8?B?RVF6eHJReXZDb2JqRVhRZE5jWUZGNGprdnQxbEp5ZThpS0h5cktXWGRhWUlj?=
 =?utf-8?B?bHdtMVFDaTNNR3lET2V5TFNBc1VUMExtTkluQ2NxVUwwRklSclUzVVFQQWlX?=
 =?utf-8?B?Sjl0NWRDVytGd2ZSRXd6SlljekI2anlTZzkvdWMyVTJPTmx1REVIL0FGck1G?=
 =?utf-8?B?MjUzblhHSDQ4WnlITmdMT2RUR0dFRFJMZUNxQ21UTFFKQzJkS21QZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b07335f-9ec0-431b-5b98-08df02b00b7e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 13:52:04.2157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIfCuGVVO5HJfE04In+SaYxVNSAGfGYqKW26dID1qh5SOcYRbT0AWfXfzZ23WswVLeLvrdo5KS3zGjZqFzbwUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459

On 8/24/26 10:03 PM, Martinez, Juan wrote:
>>From 6add8f1c36c672e59f5acfd4e1dd267fd4df727a Mon Sep 17 00:00:00 2001
> From: Juan Martinez <juan.martinez@amd.com>
> Date: Mon, 24 Aug 2026 14:00:13 -0500
> Subject: [PATCH] thunderbolt: Fix deadlock in tb_domain_reset_interface()
>   during hot-unplug

Something funny here with the whitespace.

> 
> The AMD host-interface reset quirk introduced a deadlock during physical
> cable disconnect. The tb_handle_hotplug() workqueue holds tb->lock for
> the entire hotplug operation. When an XDomain is unplugged:
> 
> 1. tb_handle_hotplug() acquires tb->lock
> 2. Sets xd->is_unplugged = true
> 3. Calls tb_xdomain_remove() which unbinds service drivers
> 4. Service removal triggers tbnet_remove() -> tbnet_tear_down()
> 5. tbnet_tear_down() calls tb_xdomain_disable_paths()
> 6. tb_domain_disconnect_xdomain_paths() calls the CM callback
> 7. tb_disconnect_xdomain_paths() sees is_unplugged=true, skips teardown
> 8. tb_domain_reset_interface() tries to acquire tb->lock -> DEADLOCK
> 
> The callback intentionally skips teardown during unplug because the
> hotplug handler will perform the actual teardown later via
> __tb_disconnect_xdomain_paths(). The reset must follow the same pattern.
> 
> Fix by:
> - Adding __tb_domain_reset_interface_locked() for callers that already
>    hold tb->lock
> - Skipping reset in tb_domain_disconnect_xdomain_paths() when the
>    callback was a no-op due to is_unplugged
> - Calling the locked reset helper after __tb_disconnect_xdomain_paths()
>    in tb_handle_hotplug()
> - Keeping the locking wrapper for normal teardown paths (netdev stop,
>    DMA test completion)
> 
> Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
> Signed-off-by: Juan Martinez <juan.martinez@amd.com>

What tree did you base this off of?  I tried on thunderbolt.git/next 
(86feaba911f2f1a540a7695c8f4a98fd0fd60ac4 / tag 
thunderbolt-for-v7.3-rc1,) but it doesn't apply:

❮ b4 shazam -sl 
https://lore.kernel.org/linux-usb/DM4PR12MB6134B3493ED0534463F86496F1AF2@DM4PR12MB6134.namprd12.prod.outlook.com/
Looking up 
https://lore.kernel.org/all/DM4PR12MB6134B3493ED0534463F86496F1AF2@DM4PR12MB6134.namprd12.prod.outlook.com/
Grabbing thread from 
lore.kernel.org/all/DM4PR12MB6134B3493ED0534463F86496F1AF2@DM4PR12MB6134.namprd12.prod.outlook.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 1 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
   [PATCH] thunderbolt: Fix deadlock in tb_domain_reset_interface() 
during hot-unplug
     + Link: 
https://patch.msgid.link/DM4PR12MB6134B3493ED0534463F86496F1AF2@DM4PR12MB6134.namprd12.prod.outlook.com
     + Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
   ---
   NOTE: install dkimpy for DKIM signature verification
---
Total patches: 1
---
Applying: thunderbolt: Fix deadlock in tb_domain_reset_interface() 
during hot-unplug
Patch failed at 0001 thunderbolt: Fix deadlock in 
tb_domain_reset_interface() during hot-unplug
error: patch failed: drivers/thunderbolt/domain.c:787
error: drivers/thunderbolt/domain.c: patch does not apply
error: patch failed: drivers/thunderbolt/tb.h:792
error: drivers/thunderbolt/tb.h: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"

Nonetheless; directionally it makes sense.  Can you please rebase and 
send a v2 for review?
> ---
>   drivers/thunderbolt/domain.c | 27 ++++++++++++++++++++++++---
>   drivers/thunderbolt/tb.c     |  2 ++
>   drivers/thunderbolt/tb.h     |  1 +
>   3 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index f46b8b2ee6e1..1f0588bae366 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -787,11 +787,21 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   			transmit_ring, receive_path, receive_ring);
>   }
>   
> -static void tb_domain_reset_interface(struct tb *tb)
> +/**
> + * __tb_domain_reset_interface_locked() - Reset host interface with lock held
> + * @tb: Domain to reset
> + *
> + * Resets the host interface for AMD USB4 routers that require it after
> + * DMA path teardown. Caller must hold tb->lock.
> + */
> +void __tb_domain_reset_interface_locked(struct tb *tb)
>   {
>   	struct tb_nhi *nhi = tb->nhi;
>   
> -	guard(mutex)(&tb->lock);
> +	lockdep_assert_held(&tb->lock);
> +
> +	if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
> +		return;
>   
>   	/* The reset clears the ring state so stop the control channel */
>   	tb_ctl_stop(tb->ctl);
> @@ -799,6 +809,12 @@ static void tb_domain_reset_interface(struct tb *tb)
>   	tb_ctl_start(tb->ctl);
>   }
>   
> +static void tb_domain_reset_interface(struct tb *tb)
> +{
> +	guard(mutex)(&tb->lock);
> +	__tb_domain_reset_interface_locked(tb);
> +}
> +
>   /**
>    * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
>    * @tb: Domain disabling the DMA paths
> @@ -831,7 +847,12 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   	if (ret)
>   		return ret;
>   
> -	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
> +	/*
> +	 * Only reset if teardown actually occurred. During physical unplug,
> +	 * is_unplugged is set and the callback skips teardown - reset will
> +	 * be done by tb_handle_hotplug() after actual path teardown.
> +	 */
> +	if (!xd->is_unplugged)
>   		tb_domain_reset_interface(tb);
>   
>   	return 0;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index d18bcca0b6e6..2370d8669156 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2489,6 +2489,8 @@ static void tb_handle_hotplug(struct work_struct *work)
>   			tb_xdomain_remove(xd);
>   			port->xdomain = NULL;
>   			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
> +			/* Reset host interface after DMA path teardown (AMD quirk) */
> +			__tb_domain_reset_interface_locked(tb);
>   			tb_xdomain_put(xd);
>   			tb_port_unconfigure_xdomain(port);
>   		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 798840b24d2a..9243073cae06 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -792,6 +792,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   				       int transmit_path, int transmit_ring,
>   				       int receive_path, int receive_ring);
>   int tb_domain_disconnect_all_paths(struct tb *tb);
> +void __tb_domain_reset_interface_locked(struct tb *tb);
>   
>   static inline struct tb *tb_domain_get(struct tb *tb)
>   {

