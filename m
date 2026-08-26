Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FD91C5D5E;
	Wed, 26 Aug 2026 03:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787713362; cv=fail; b=XLnIEIt0EDnn2lHkGQyplap8GBqjNJLbpsPrtFWXqUtuoS03KN10zlXjND/m/KlY/TGm/qao2SYmvEp/PZUrjherfxNqcWtE8gljas+Udqals/LR0kWqDUItQ63wpxvKEFddG7mqiw73IGijcVrztWWO4IlP16jxTYrZQaQ5s4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787713362; c=relaxed/simple;
	bh=9BelnUOGB5HvRFZWclpB0HiKZpWr3LKp7KdTLRmMyjs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oCJGToM+N3XsmdPusc7z/tyKYHJ6/HtrRBZPS3aLRl6szK6TFxC+DN7mJvNgVa9nqapGXfRQYpUdkdGNSYusa4/ENJtyHhSKvmEhrLZihN+8mstqD6l6w8oAzbWv898Gt55hMlM0BA93YeLlruGa3cVfTvzG6QzdviTx7lWHoE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oTAkY+3C; arc=fail smtp.client-ip=52.101.61.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oTAkY+3C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5HROVeAj5jzuYfAS62Aw63TcgDW7Z5TPmVgOjp3sRKm/A9Z0oSy8Nq1VRRn5EjJ6drwmHbGAJzHD2HhanoYdTzC0CHXcFBzP/NUZmt8zVctb45kk84ZXsJGmKk+gPut1xXa3Q6nyc4dZdUVhkaQFep2cTom9wqpwDBk9RiJYnDjKitN3Fh7DNn2ek/Uk6d0ryaQrhgzBvI29d1P91C/P+9g2ucFFv1sVkxRWVmT9KSpKtGZtNt6fvCbkAw0v+5WvmMBR0FiJbgWmhJz3O/EwK2weMnMpQxldv77JX18ZCKdcq8NxqhgTJIon9+S5XkQfoTkPnV6zbKFR9oWFrU+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8D43y29aSuSSZT+tTruvt0xqHqLbq6FiBBi8vl3Tt38=;
 b=N5kELI8b56omZGKwfNNL+geKBL+YW6shW+eJPObhX6wM3ZdHlI6tb5yUtj9Phhw8mmDT7M2GnanzyJT++ctliPJ4/7pfJm4GqapUBfzK3nPStv6j07r/KLrNh+Uv0bOK6smNyQuq/VAxkVJojZvt/OeFOAADS7hVy5lNqJt+YZeYnAWd0G6CMk1IGN9kG5EA6Te9el6Uth8JqNJ98dPkSL/zISgtMONAvNlYJTLhMjt685nzKqdv3RpwHYPOIZRAnqkQolFD/VPCmk82mXF6aHxnyycc63T/dGI9VCMc+kaO3mXXm1+J2KeDT9jNOwPv5BCWeJkE5Rik7BwEWzvNhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8D43y29aSuSSZT+tTruvt0xqHqLbq6FiBBi8vl3Tt38=;
 b=oTAkY+3CP5a/sDQy57ZOT5WPdZNJOYYr0VbTqCSqwbSIESTNkebSNDjBLClgXHNDUrgFLMJYfhMLkt7CHILR2MUi9J5mmIBnrfV9GVADGX58evOW7YszlT9CRp3pyrlPSo6CTM64VD8fiZqK/QsZXnGVv8hgHQnN8ohETBIvesQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by PH0PR12MB8051.namprd12.prod.outlook.com (2603:10b6:510:26d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Wed, 26 Aug
 2026 03:02:38 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0315.012; Wed, 26 Aug 2026
 03:02:31 +0000
Message-ID: <e16c6ae1-6ba2-4fe6-b30b-180e7a5c3af9@amd.com>
Date: Tue, 25 Aug 2026 22:02:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
To: juan.martinez@amd.com, westeri@kernel.org
Cc: andreas.noever@gmail.com, YehezkelShB@gmail.com,
 Basavaraj.Natikar@amd.com, Sanath.S@amd.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260825214237.4179813-1-juan.martinez@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260825214237.4179813-1-juan.martinez@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0106.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::11) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|PH0PR12MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f957d2-7a8e-4d84-7d3d-08df031e784c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/0GQDgaxSnVCbYQi+Dl6MhrbdamCLGJ+YrhotblCK7lkKRr6FeT+LdGez0OMLA92jBwU9KcvwRNeVtrRq3GHY6isn5QbWfLlijt7HtWSSu3fQsxR+/kTrxgmaavtue7q591dMkGXLXmMFh2A4TnmDqgBEyt1POWZS9EvlamuIBTlXOqjTSsCNRAD3gngNPP+//LH4xCvk9EIUZjT8IEEH1o9MTUSf0wYNCF1nlLBa5yye0sxV4VbbFUm/rfJ0VHocTJAqqEMT+1ab2+txrFIeJN9SkvYNbJutoGHwlQ0gj4rwVEBgGlLkCuwKNLiSKA0Y7qlmGtvQaKkPMUYyod7aqX0zagiL2+ydX3L/JyE2E8cicQwT1+5JoZ4k7Ry4pFwvNRHyTouRfCwFh9w/g9Jk/p4dn5ACx2QGUB6/8lvQYSVV350TUK0u2e8XLKf6QJL48A4z4FRVFbhsalNtKfOFAYE/tFK6odZvmFCgwxuIc5Y5KBhQ8rIJcfq8zID8JZeJ6YR8L6xq9lxz7bEUhDyX/ZXwob9lWdAQ3qOt9ygEp9+4+z+75csY57GIa8KuoLbGUYuHcq9rk7gZfXk/wXftmIdiPG8OVmBud7np29G4JZdQY44mk/l9odpZKNti04rZyt3k2z5qUbE6bgNV698xnw1d9L6TOeRI5Jl8gMr5lQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlN1emVKSTBOc2F4Zi8xeTdSUGdVSjh4SXliVlcrL0hhSWM5QytUVzB5MjJC?=
 =?utf-8?B?WFF3MWJDVGxvb09Mc3NTT0VLeFVSTlM0TVowa25UVllYNHBpM2FWUjNBcVM1?=
 =?utf-8?B?NDJoY05kZXV0OG9nMGlsOW0xRXJORWx3dUtlZG4rWHpJd25lNGpteThoRFJ6?=
 =?utf-8?B?ckk1a0gwN1hyOFdhVWtHU1BuaVF1d0FzOFVWV2kxcjk1Vy9idW1OQTZMdkNN?=
 =?utf-8?B?bnBuOHIyWDBaWkxoL05ZWmdwZEpjQTdQc0dESWVVQWdYc2ZoQWNydlJXZm0r?=
 =?utf-8?B?TGlVWE1mQ0EyUUxUQ09vOFRqc3ExY2FpN1dZQjhZLzBkWEtLV3JPNkRmcTJw?=
 =?utf-8?B?dlBITUFQSW12NE1tTExobWtwRUhYekU5VzBjNm5zUEdHWklxWU9VNFNkZFZl?=
 =?utf-8?B?UXJJSjkrUXNOekpaZ3FNWXc4VGpCRHJHdE5MWVNMd2V2Wkk3ZjBFN3l1STk5?=
 =?utf-8?B?NEtid3RHM1pOLytZNlZuanVRYVpjbDF1VEFSN3lrL2UzVWpGZVZiSzhnU01O?=
 =?utf-8?B?SFAzNy96a1NmMDZNajFXMHRXZjBPUVVmYmtzbFdseXFXOUE3bUVzQ3Z4dkVT?=
 =?utf-8?B?elliRjdkeFBRYkk3R3pFand5bzRTR2IxQWNMV3kwdWxMT3llZW5UK0dXcUt3?=
 =?utf-8?B?MGl0MUdsRG9Yd3RtckppaER4cWlFZ0lzWXo0ODY0SG9uc21oaUhpM0ZTcDJY?=
 =?utf-8?B?c0FZQ3NuTXdGQWlIZ05KMXVtcTVwOG4xVXBVT3Z5NVJENzZVMkg4NlVGdUVL?=
 =?utf-8?B?T0dwamdTcUt2WHl6aDBUNGxldzE1QUM1WWtIb080b2wram9uVzR3SjEzczFV?=
 =?utf-8?B?N0tTblhaeDhySW15bjhTNnl2TU83YmRZa1ZDS3Z0S1I0TE5OdDdSWlRoTzFo?=
 =?utf-8?B?ZHdZdW1LY2FqdCtydDlpc1ltbGRMV3VMbTc3bFkxVFVBWlVVdzkrYVlEclNw?=
 =?utf-8?B?SHhESllINnFyR1V0R2NXODh3K2xzNlhaSElEZkNyN2ZYcHhKTVUwTEgzK1R3?=
 =?utf-8?B?U0kzR0VuRUxTeUtsUS9ySGdPVkhZVGlVNk9PNWNMczJ0aHloQWJPUEtnUndC?=
 =?utf-8?B?MG9Rb2hPNm1VaWd4U2JyRWVRRDUyREc4b2NvVWJjd2REWkhLUUtmR3YzUDVw?=
 =?utf-8?B?YmlBaEVZS1ljYjh2RU9UcG5vVEVELzdKb2tXMFQzSVRFZDRrZmc1enFacTVL?=
 =?utf-8?B?QWxBYzdkLzBqYjRBaXYxTUovaG9JRWE5eCtoV3FjdEdOSnFqR3RpcVFCek9y?=
 =?utf-8?B?SUlIekJtVnM1b1BuTk95YzlpUFBHQlJjMVZORWk4MWloSERwMU5UbTIwekxQ?=
 =?utf-8?B?YWZuVzVNRXBuNEVLQktNTkhGU0t6ejV5bmNqajVtanVEQ0NqYmZLNmkzVTc5?=
 =?utf-8?B?b3ZjRHlMRS9ON0l5MEY0M0Rrc0hHNmRackI3RDhiNzc5NUNlSTBuNi9kMld0?=
 =?utf-8?B?aHlGZHZrNzVIK3EzRTJxWEUzSElsMi9oWklpdXRZS25ITUhGVDJQVHd3TlNU?=
 =?utf-8?B?b0NTNlplOGx1MTU4V3ZOeTJwcXhCejMra2N5MVR6UzcvczRXQlJDb2phRnpU?=
 =?utf-8?B?d1ZNbnlmaG5jdGJLVEZUYXZNVEFOVGFNUlJ2bFV6QU1XSDBJek5xUWloVkIz?=
 =?utf-8?B?MGkycllyaGdjV3lNWFNnMnFyUGVCZHpIdjBJZDB5VmpBekVOWFpqWjQwdlNB?=
 =?utf-8?B?Z2t6ZXp2TGRQU1RmZVZlN0R5WHJjQkxQVy9yYXJRVEt0NkhLY2dqT1U3OWJP?=
 =?utf-8?B?bVVHUUVNUjRycDRqNEJGaFljRkVhTm8yek16cXhxU1UxMGxmRG0yYUh5NHBq?=
 =?utf-8?B?WVI4QzVNL2RMUGI1K3VtMkpWelo2dHpOMHFIZnVVdGFpSVZBZjdTMEljTTRT?=
 =?utf-8?B?aUsrZXNiWGVaSUVqUmpBL29yOGFiTnFKYVNiemJFMkZIaG1HNDNHM1lDeWhx?=
 =?utf-8?B?UXlKZTNYL1hZb3JkZ2Jvck1GS2w4SEx1Qk54N2JRakYvYTI3NXhPVWNGa3dG?=
 =?utf-8?B?UEZCTlpiZzFoSkZHWXlYYXBHdzRuY1dIL3FQNVJVeEhFQmFmN1JYT3RvQkZs?=
 =?utf-8?B?eTh2dTBsQlVQRWVqWlNQYU1MSUxsb2MxU2RhRzJuSWxyeWhtNHd6TkNDNWFB?=
 =?utf-8?B?WHZxN3RReGtxSkIwQ0tnWU1YRFBFa0lFVm1kSG95bVRBQTBkemVDNHNpRVM0?=
 =?utf-8?B?anhPb3NVWGc4akR5VSsvZ2p6U3Z3QkZUT2JqN3VnRmFpNXlla01XK0lGSUhi?=
 =?utf-8?B?WW1HVGNKMG1KVE9UN3MvRVEwakt6MTNuWHcvRVhHS2UwRUNObFJhSzBsbWZx?=
 =?utf-8?B?YkNjUlEyZzdZVXMycXd1eGZPVjJNY0lCa3g3R3dIK2NKMjVxYncydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f957d2-7a8e-4d84-7d3d-08df031e784c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 03:02:31.3773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqyxH9ZSXBP2TJksuSe+0iPVHKn9dv+OgoUKFZ2Z3UM3icmRqroTUBKe13cfuV3cGoq9tp/4ZLvk1zcqjxAa5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8051



On 8/25/26 16:42, juan.martinez@amd.com wrote:
> From: Juan Martinez <juan.martinez@amd.com>
> 
> Commit f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on
> DMA path teardown for AMD USB4 routers") introduced a deadlock when
> physically unplugging a Thunderbolt cable on AMD systems.
> 
> The problem occurs because tb_handle_hotplug() holds tb->lock while
> processing the unplug event. When it removes the XDomain services,
> tbnet_remove() calls tb_xdomain_disable_paths() which eventually calls
> tb_domain_reset_interface(). That function tries to acquire tb->lock
> via guard(mutex), but the hotplug worker already holds it, causing a
> self-deadlock.
> 
> The deadlock manifests as a complete network hang because
> tb_handle_hotplug() holds RTNL while waiting on its own mutex, blocking
> all network operations system-wide.
> 
> The existing code already handles this scenario partially: when
> xd->is_unplugged is true, tb_disconnect_xdomain_paths() intentionally
> skips the DMA teardown because the hotplug handler will do it later
> via __tb_disconnect_xdomain_paths(). However, the reset was still
> being called unconditionally.
> 
> Fix this by:
> 1. Splitting tb_domain_reset_interface() into a locked inner function
>     __tb_domain_reset_interface_locked() and a locking wrapper
> 2. Skipping the reset in tb_domain_disconnect_xdomain_paths() when
>     xd->is_unplugged is true (matching the existing teardown skip logic)
> 3. Calling __tb_domain_reset_interface_locked() from tb_handle_hotplug()
>     after __tb_disconnect_xdomain_paths() where the actual DMA teardown
>     happens and tb->lock is already held
> 
> This preserves the reset behavior for normal shutdown paths while
> avoiding the deadlock during physical cable unplug.
> 
> Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
> Signed-off-by: Juan Martinez <juan.martinez@amd.com>
> ---
>   drivers/thunderbolt/domain.c | 26 +++++++++++++++++++++-----
>   drivers/thunderbolt/tb.c     |  1 +
>   drivers/thunderbolt/tb.h     |  1 +
>   3 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 12c88509a54f..253ea8c6b757 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -788,14 +788,19 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   			transmit_ring, receive_path, receive_ring);
>   }
>   
> -static void tb_domain_reset_interface(struct tb *tb)
> +/*
> + * __tb_domain_reset_interface_locked - Reset host interface (lock held)
> + *
> + * Caller must hold tb->lock. Used by hotplug path where lock is already held.
> + */
> +void __tb_domain_reset_interface_locked(struct tb *tb)
>   {
>   	struct tb_nhi *nhi = tb->nhi;
>   
> -	if (!nhi->ops->reset_interface)
> -		return;

I'm not sure this is correct to move from here to 
tb_domain_reset_interface() because you still call 
__tb_domain_reset_interface_locked() from tb_handle_hotplug() which 
doesn't do this check.

> +	lockdep_assert_held(&tb->lock);
>   
> -	guard(mutex)(&tb->lock);
> +	if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
> +		return;
>   
>   	/* The reset clears the ring state so stop the control channel */
>   	tb_ctl_stop(tb->ctl);
> @@ -803,6 +808,17 @@ static void tb_domain_reset_interface(struct tb *tb)
>   	tb_ctl_start(tb->ctl);
>   }
>   
> +static void tb_domain_reset_interface(struct tb *tb)
> +{
> +	struct tb_nhi *nhi = tb->nhi;
> +
> +	if (!nhi->ops->reset_interface)
> +		return;
> +
> +	guard(mutex)(&tb->lock);
> +	__tb_domain_reset_interface_locked(tb);
> +}
> +
>   /**
>    * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
>    * @tb: Domain disabling the DMA paths
> @@ -835,7 +851,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   	if (ret)
>   		return ret;
>   
> -	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
> +	if (!xd->is_unplugged)
>   		tb_domain_reset_interface(tb);
>   
>   	return 0;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index b7cc6894a598..89dfb3381345 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2489,6 +2489,7 @@ static void tb_handle_hotplug(struct work_struct *work)
>   			tb_xdomain_remove(xd);
>   			port->xdomain = NULL;
>   			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
> +			__tb_domain_reset_interface_locked(tb);
>   			tb_xdomain_put(xd);
>   			tb_port_unconfigure_xdomain(port);
>   		} else if (tb_port_is_dpout(port) || tb_port_is_dpin(port)) {
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 4373336d9425..2e6e0920cb1f 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -789,6 +789,7 @@ int tb_domain_disconnect_pcie_paths(struct tb *tb);
>   int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   				    int transmit_path, int transmit_ring,
>   				    int receive_path, int receive_ring);
> +void __tb_domain_reset_interface_locked(struct tb *tb);
>   int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   				       int transmit_path, int transmit_ring,
>   				       int receive_path, int receive_ring);

