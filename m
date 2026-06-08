Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4E31F9AA
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931594; cv=fail; b=IIjT/wWM9LPhciUlMMZ9dsnCB38UlunGUWVe6hIjLGsHqrhL05s4NsdP4jarR7SWkBOEpe8J8mk1KPrb/MhKMV+8ALVmvNOG1DWhO8YMSlsgmIWhA5L6bBTuzYb7xS/BJA0lUroH0bvysYa74SD6kUmXzcUWcPktENW5xacvFgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931594; c=relaxed/simple;
	bh=GDevqyoevhj85sui099dpM0Ks9PdaR7bqDw09qia2OY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R5smHwLsKwJWaUEUyVBsE+jhgufOmu+mpFlXWsGbGBkVgOiOMRHf2L8a0gMPsMfpHXG1jhp+tQONYSgVUslPFYDgmBpHRjS+HmrFMHikMXT2lQ9jLYxlx1pHU0oHjXa01wtTGjvaxgka5uPtY9VpOZNeDgqc+8cQtXNGVu7ovbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z55TEM7u; arc=fail smtp.client-ip=40.93.196.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z55TEM7u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLM3b9lYXwSFoIhWVJK96bWGShqDdbMJYe8J5Ax1aCBnhzrKqVEa+DVjmFO2KkKMWkf3kuUHyNQezQywE+U1Q7oBtirxuW6pIBxJtgPZB0OWmm2VE0r9MMtaM6cWBNfZRR3gIHOfDZX0/hGy7pOeGmsSWT36LRVnLfJCJezziNS0sV/U3Vu9pAXousUao9U6TYGQrzcGbDjeoObPJ7mJxMf5IcjDcqFtFU9ddt78labtictfQa30/rM+Ea2dIkEfmGfmc58GxBHpzKFda54XUbeSdC0bYCnAcjsBdEuYjU0O/+sKk86WRl2BxnfQDEJGpy4Suy7wDC3AAYl6baC8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CghTJNcow4o+WisUkrh2jYaYsTcpJwhSf1+IGag6WqI=;
 b=BSFedQKrTuIyaW34yVPgLxM6+6FaVDBg89/W5c0ro+sTkIFdv7CyronAHLhZz3WiTuFZJw1AXwFxTKGFeJ2mdX11y1Msasyr94t0t4jgAk+177EFyPZTfYxP83ooSuQoOdTSi+gfgAK2MPvFj8Q7uQ+6wsfj3oZkMQlySVsNmobQ4Qdwc2xmmXNAG/QPeWlUKWyIrLiC9uqz+2L9Z3VGee7FDP8gMRoq+v3VM1EMxWT5WZtRXdmeY8EY1QJ8RT0NigssupEaNUseeCgDpTIWtc3zBzkBaMoVjK8cB0f4AUjJpWYlucVlVi14++6Lv7cTKABimlSnOsuN0KRsZaVwNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CghTJNcow4o+WisUkrh2jYaYsTcpJwhSf1+IGag6WqI=;
 b=Z55TEM7uRspHDKaj5Z8u1Eu75wwTFo3iW0n8mHlu4JLIQKLuQxtCWOdoE0Xo5JZzcSbH4rJNKGPgRPH2EqpK3/66D2qxOiulqM32JOUWN3jYJzfhg5lMj8GsICj4xzAPtwoLOGMzlZXrWUDkOiKBnzqPxsRZsplj1WcGT9pHpmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 15:13:03 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:13:02 +0000
Message-ID: <a7f333a2-d594-4e1e-9cc5-265aeda8e5a6@amd.com>
Date: Mon, 8 Jun 2026 10:13:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Assert downstream port reset on shutdown
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <bnatikar@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, andreas.noever@gmail.com,
 westeri@kernel.org, YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
 Sanath S <Sanath.S@amd.com>
References: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
 <20260604050326.GH2990@black.igk.intel.com>
 <d80346d3-692a-4982-859e-5321c4ec022f@amd.com>
 <20260608064020.GJ2990@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260608064020.GJ2990@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:806:20::25) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c525f4-779b-4df9-a292-08dec5706f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qveIodf5duTVNICod6Ousy39eQxJfhESw0/xfNlz5gw6DypXfEiQTdkJh2S0oxxExU5pA8iGQm+QQ+NurxVg0/bWBoiYqPdUITuRqU3wCHokXR8/zcAdNUKMmUJ6G7KsSJ2h7pe/h20pGQdojDD3yb64yT+/2NW0zjPSEh9j8+QokDjSRaAuXb9LdScUsTtxekAfjZ/hApvXGR8vK0ADX8Dv99iSXkIVOYhCyoV60cSMbi+Dgjd2TzCW+elWdbzwbt+DEAMum++GtHwIpCZu2olqNlk1wzE9yri67EcqYPoyX0hQZVjOvcJUPXTFwekAdaIRF0HA304YAqAd/N5H0T8aQ/lJ4kijhGdnmbevtP4xqJqfI2jRjiyyyiTeYeijw2lCkUCCSd3fYLi2cNEt/epr3h6UmZysnP2BTBICFFJVHGYP/ZSldvuxjgiwWqcmaAhIsb0GCxOTaPuLyuP7YvNoWDJz+Xcdh7rMwoGZkGQ/Ascag2RyMZQPwH1uD7GnhKSRD33XmWIRP6NRaJoimhiAka/R8dE5fPJy9jrLzczn3eBy+7BCBCMYwEiL68RnFjoy1UF2DofdpytjfTsEKTJ8mIK8fCz2hkwoueAUlyIIeu+FiExR6Apfs6DJ6ZHr2Acs7sOSf23lBTUQv/lfoLeHWO70GmogMfGeFfD3JMxGlEUkvGrSOE/KApmPxuug
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVZPQzRWZm42Y2JpL3VpNThGM2Z1REtOZDRYMHBGVGpJcDkzN2F3QWdGdGo1?=
 =?utf-8?B?dFJxdVoxOS9oK0VuVWxaOTk3dXQ4T3VhN3BuWjQzRk9aUmloWG1hTC9EV2ta?=
 =?utf-8?B?SnhjSEVmQ0RzbEFSRlZPZ2RsRlE2MVJBMElsc0YrR1EzZjFzeVo2MnhsZnR1?=
 =?utf-8?B?TmZVUG9Wa3g5YnpmMW50bVptOWlLdmZjaDBNaW1CcjBsaloyOWR5bXZlTVhI?=
 =?utf-8?B?VU9CZFFKb1kxRExSZkNwem1CcWFSOW4wME9tUDF3SEVNbXVZZHhZUkxxQm01?=
 =?utf-8?B?WmhVWk5DRFRTbFl5dUt6dWZMVUNxcXVTV2l5UVUzRWNxYVpqVCsrNFd1Uzhr?=
 =?utf-8?B?Ri9WTGNuQTByT0IwUjdnbmJmUUt4ZFFONmc5d04vN25ydlNFQS9RRmVGS0Ur?=
 =?utf-8?B?ZjgrZEh4bFduNTRSRDlPcTQ4L1NkOFJGeGNIeTZvK1NkK2VIYlRxa1ozMUlt?=
 =?utf-8?B?Y0xGM3NvMUxoVEQ1OGs3WlUyOWlFbFhoWEZNaFNxWkUxTnpHZVV1MEpEYmpQ?=
 =?utf-8?B?QWJLOGhaTEhURGk3RFZFWXZVdVNabk9JenE3YkF5RnB2Wm41bEhieHZ2MVFZ?=
 =?utf-8?B?MUdUZ1lyZG9TaXJZMCtVSjhUUUhBOWVEUVlGSVVEMDljNTBWVTV4cStwWUpZ?=
 =?utf-8?B?aXJOcTAyK2hpa08rMnkvQ01rUEdWMzEyZEtmZ0d2S3J6ZTFMaUo3TkQ5NXZU?=
 =?utf-8?B?UmEyOENxMnkycCt2b2xlaUJGRi9jcFVWWVlEeWVYOGxTN05DNE8wWDhIMWVn?=
 =?utf-8?B?NW92eVJKTHNLU2lvd0NRREkrRThiN2RPRGZSUjd0Vi9zZGdBa2RoVmsrc1lj?=
 =?utf-8?B?TTBSZGtPd01NZWNWaFBsR0lGdCtzMWJDVXVtT3hKRE9aeGhtRC95WjJmZmVZ?=
 =?utf-8?B?Y1l4KzkyOFVzKzhtTDBCMXdzdHZ6SndnQWFlNmdHT1VmVzc4dlZaZUJIYi9r?=
 =?utf-8?B?dXJFWTU0eUtiZUZ1SDFSOFpRb0JHTUw0cFN6OEgvQzBNeUhLRXJneHd4UVRI?=
 =?utf-8?B?c2dLWXNXV0QwYmhtZm1kVGxmUmZiNlU0SGJHb2ZoWXYwZ3EvN3lnY2RuVE9E?=
 =?utf-8?B?U0JJNFpTZHVVdFU1WHQvdUpGMzFRSmx1MENuSU1yTFhqVTc3KzZ6Ty96WnVU?=
 =?utf-8?B?YXpwSmdDNm5SQlFqd1ZJM0FxVHJ6bmFBRnVESWNSSjFEaDJndXlpSHlPd1R3?=
 =?utf-8?B?KzVvMStTcDZ1S0hwVWV6OXMzZU9ZcHZidlNyd2VGT2MrVDdodml0WVZ3MkxV?=
 =?utf-8?B?M3d1LzZ2NTJkUTRJOGNPNmVyMHdhd2c2MGhjdll6ajJ3M2tQa0hwRmRRY0c5?=
 =?utf-8?B?ME5LSEdDazVDdWxaMEowTGFCUFpGYkwxRmJxS0E2Nk4yRGVkSlpONEZtNkVZ?=
 =?utf-8?B?b1BmNGlZMzhGQTNRMFhRall5WS9Gam5sK1BFZzlnRmErcHRKS0xXSWVUYWF6?=
 =?utf-8?B?dHFQTlk3dWF3d1Jtb0Zic1VhbEdUaE1kZW5kNzRsYldQSHVxMVpQVlhndEUy?=
 =?utf-8?B?NGxWVTBoM2dvenREY05HRDl6RGU1cHE2Rys4WlZSejhyTUdCcithSWxWL0JK?=
 =?utf-8?B?amZxVDNrMndSclNmU3h4UCthRzNXKzJ5MHRqSm1sOFkvWEIrQkxoR1I3YTlE?=
 =?utf-8?B?WUQ2K0NMMmhxcUpidjZWMkh0VUlFODJHbVJnWFlrNzJ0aWZrWk81Mlg5TUVj?=
 =?utf-8?B?WHNzaVp2WWlubHdtY0I5S0hMZFRuT1BUKzN6MUxnUmltOGhzQ0VVT2R2TlNU?=
 =?utf-8?B?OG55VGdtRHVQZXZLNTFDbm8wU25Fay9CWSs0WDYwa2JRS1U2d0paNmxyNlJ6?=
 =?utf-8?B?MXRWNzZVVlhHYjhWbFVvQXhrdmNENVByODdodkxVSjhhVTU3dHN2WGIwLzVo?=
 =?utf-8?B?Mlc3WEtQTFRXeStjTEQ0QWJpczJHWjJURkkyRGNMQ2JreXVoNSthdE9HRmlj?=
 =?utf-8?B?YWhsRWR0ZXo1dWVqL2FMb3EzS0FUVkZwa1VoMmhSUWF4ZVBTeUg3bHVOY1R4?=
 =?utf-8?B?alR0eEhiK2hRNENBbmZONmlxS1Y3ZzY4NkV2aXFmbjVBK0s2OGNyRVJqYUlC?=
 =?utf-8?B?bFM3bkdKWTk3WkdSRUg0YktReXIyVnZKWGhPSVprL0M2Tk1KSE5ZYWlmczJE?=
 =?utf-8?B?OUhYUzlUWlBnSXNENGFXVGRUTjU4OTN3bG5vcWZGVFNuVm9pMzUwRmRtM291?=
 =?utf-8?B?bnBMK0pUQzBQVmVqaDZJOS9WRlF6QVpORzQzSk9XcXk0alFEalRESzJyUklv?=
 =?utf-8?B?THZ4ZGErNk5wYUtmMjlzbTIwUDI4VmNzamV2b3RjUkJrWkdrK2d2UFhHVVZQ?=
 =?utf-8?Q?dVUX4oqT+RP/iETWS/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c525f4-779b-4df9-a292-08dec5706f32
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:13:02.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eXE7N3EgbN3UO/HklTKKpUmqC/Q9MqHQ6jeMCxrrn1SQl+UOWzsuE1bn1iW3izkrvM7NhEIEAyEOGdknl3eCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569



On 6/8/26 01:40, Mika Westerberg wrote:
> On Fri, Jun 05, 2026 at 11:27:52AM -0500, Basavaraj Natikar wrote:
>> Hi,
>>
>>
>> On 6/4/2026 12:03 AM, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Wed, Jun 03, 2026 at 11:31:46PM +0530, Basavaraj Natikar wrote:
>>>> On shutdown the connection manager tears down the switch tree without
>>> router tree
>>>
>>>> signalling connected devices. Thunderbolt 3 devices directly connected
>>>> to a USB4 host never receive a disconnect indication and during shutdown
>>>> this can cause polling the dead link for up to 60 seconds. On some
>>>> platforms this behavior leads to a warm reset instead of a shutdown due
>>>> to this timeout.
>>>>
>>>> Fix this by asserting PORT_CS_19.DPR on each connected downstream port
>>>> before tearing down the switch tree. This drives SBTX low unconditionally
>>> router tree
>>>
>>>> (USB4 spec section 6.9), causing the device to detect SBRX low and
>>>> transition to Uninitialized Unplugged state immediately.
>>>>
>>>> Co-developed-by: Sanath S <Sanath.S@amd.com>
>>>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>> ---
>>>>    drivers/thunderbolt/switch.c |  2 +-
>>>>    drivers/thunderbolt/tb.c     | 11 +++++++++++
>>>>    drivers/thunderbolt/tb.h     |  1 +
>>>>    3 files changed, 13 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
>>>> index c2ad58b19e7b..52812908818b 100644
>>>> --- a/drivers/thunderbolt/switch.c
>>>> +++ b/drivers/thunderbolt/switch.c
>>>> @@ -704,7 +704,7 @@ int tb_port_disable(struct tb_port *port)
>>>>    	return __tb_port_enable(port, false);
>>>>    }
>>>> -static int tb_port_reset(struct tb_port *port)
>>>> +int tb_port_reset(struct tb_port *port)
>>>>    {
>>>>    	if (tb_switch_is_usb4(port->sw))
>>>>    		return port->cap_usb4 ? usb4_port_reset(port) : 0;
>>>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>>>> index c69c323e6952..ca57b5181422 100644
>>>> --- a/drivers/thunderbolt/tb.c
>>>> +++ b/drivers/thunderbolt/tb.c
>>>> @@ -2935,6 +2935,7 @@ static void tb_stop(struct tb *tb)
>>>>    	struct tb_cm *tcm = tb_priv(tb);
>>>>    	struct tb_tunnel *tunnel;
>>>>    	struct tb_tunnel *n;
>>>> +	struct tb_port *port;
>>>>    	cancel_delayed_work(&tcm->remove_work);
>>>>    	/* tunnels are only present after everything has been initialized */
>>>> @@ -2948,6 +2949,16 @@ static void tb_stop(struct tb *tb)
>>>>    			tb_tunnel_deactivate(tunnel);
>>>>    		tb_tunnel_put(tunnel);
>>>>    	}
>>>> +	/*
>>>> +	 * Assert DPR to drive SBTX low, signalling disconnect and avoiding
>>>> +	 * ~60 s of link polling before warm reset on shutdown.
>>>> +	 */
>>>> +	tb_switch_for_each_port(tb->root_switch, port) {
>>>> +		if (!tb_port_is_null(port) || !tb_port_has_remote(port))
>>>> +			continue;
>>>> +		if (tb_port_reset(port))
>>>> +			tb_port_dbg(port, "DPR on shutdown failed, continuing\n");
>>>> +	}
>>> But now this tears down the topology also when the driver is unloaded? If
>>> you want to do that in shutdown there is ->shutdown hook for that.
>>
>> Asserting DPR on unload is intentional and it is harmless. After a reload
>> the driver re-probes and the router tree comes back up cleanly.
> 
> Well not entirely harmless as it also kills the native tunnels and now user
> cannot get rid of that by passing host_reset=0 during load.
> 
> Prior this unloading the driver left the tunnels up and that was
> intentional.

I guess I see two approaches.

1) Move to shutdown only (your suggestion).

Corner case of user who unloads before shutdown means they could be 
exposed to this.

2) Link the DPR behavior to host_reset module behavior.

IE If a user set host_reset=0 avoid host reset on module load and avoid 
DPR on module unload/shutdown.

If user kept host_reset=1 then do DPR on unload.

Always do on shutdown (regardless of host_reset value).

What do you think of #2?


