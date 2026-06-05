Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC54438238D
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 16:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676894; cv=fail; b=RfVUuUwIwd6IUc4s5KzgAiHnfCAfeor9q/1OhJE6nxm1IT19+g++W2nF9Ux1OidX2fwfO+0Rtkjl1i7nvzmY5VQlOpV8PWK9zyrpU0P7yFQrSc4RrwD/1XzgLVtD88j2JC9286gAiJeN30Q5RHm2dcnKJDeFtKpHgqTjpYewy/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676894; c=relaxed/simple;
	bh=3o8FrYqSHEO0mTxNsqBzMwPnMsqZM+usrnYQ9MNzb3I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HUdv8C8H6Wi0vbAiceFgIOxGBHUhmYwKozSQ8q/JdCigxQfVgxNvvZ2F5b/ROoz1kBD7MqH/jkDE0pFiwwgcT5gsxVYGr7iE/3h3MNdMC9B/haTQ4NlUFm5Hb0Aq070WaRAJWqby+zbB4KVDgdujyvvrJKPLku5epwCoqQquHv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q2psFh8C; arc=fail smtp.client-ip=52.101.62.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q2psFh8C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TynxhMBR2SoSoy6Rv1/YmbqbIBR687hGZxBEaO5udsjM7Ie6zR6pY+wH6kvXKh8V9Pc3D0ISWc1WzVIe812VoFyEFAroKlBC7lsRqhHLHIMX4yW4PnJdUqPRPMMuzzRzwPmjyK4N/EXEwJZA8LYqqAFWUojGrGFwNcL1AOHFL2Dk9lDOlEk/TQaT97xdi8Pqntv1zidBPTSeqODFPMkToKC2++07qJg37OVcuL0LMBrT4nZPe8+RGG6G7dsypULLkEU312nEftzlrJ94H6jNSDDGAlikxyCmPRLGQtM1L/iMvo0RunTpfwc0fIS8lsAhP4izfj8Tt5p5Y9NZpFMbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CV3UiCzwT0vPBK355WTZHGdVLn6a2HMwg3ADkkG3StM=;
 b=rFx5mH0nSWHVm/t1PAUJAv0NVOTmkDUniO5zyJt9aPmssWO1ZiyPeOm+rNBLLLPox3+UHqi1V96+VLDRlJK1x4WHbc9wq5otR814O2bGTRZ+GvWn+ys99iSayzBj8DRKd8Ou8WbEJ/0lGpJ51xe3nXpmqnvh0KISHTBCSdwFVBYzMSd61cLox5j7dhUwk4j0IYSHX1mN4JjON5jN0T7E8KH0yhUDvdx4EzjfdHOsMGZlHuZRUuTikuLnddq0nijkzLrOcC9/Q/IphmwnkmTfrv1D6PxDGrZLMbhLJJQRU3zkkqduM9G0ng1fECM/i3Jy0IYaaZ8p8uBdxTm2owqX4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV3UiCzwT0vPBK355WTZHGdVLn6a2HMwg3ADkkG3StM=;
 b=q2psFh8CEuT88lJ4FPSqk3/36pmFT61VG+uj9ZQXJs3j8xdyV4+duln2UNolEpd6KY4S+JqnKC6I7N4yCKzJ8sp8Zvx4x7bK4Elcahnm5bs4qyHtZhDAyxVR2PZt8H/1YQB/rUmpEJJb50ma7IE8neCJH2FDHQPu01bUNItand0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by PH0PR12MB8774.namprd12.prod.outlook.com (2603:10b6:510:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 16:28:02 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 16:28:02 +0000
Message-ID: <d80346d3-692a-4982-859e-5321c4ec022f@amd.com>
Date: Fri, 5 Jun 2026 11:27:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Assert downstream port reset on shutdown
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
 linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
 <20260604050326.GH2990@black.igk.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20260604050326.GH2990@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|PH0PR12MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: 0600cbcb-50eb-4d80-dafd-08dec31f699d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rqcj8gYDamRuYc+T/+r7/YUh+RgmayhwqzqcXiQmhDrgswjTxy7QSmFmtqKGcaZP2QfUyCTeg4IfjnRCCYJ9Rslfb7G7/IKGS8/GOX88KjiL7qAgID062gxnKBh4klJbNPaG11UNcGoiphDb7i6Vrj7HX21gbBdOaJGZUeC3+V4J27vcVQ7nuU6WDtPNPNXlaNMMGJLb/TWFeAYOCnvDriuR48fRnpvQmiOM7MT4heDW1MsPV0iY6g86jF2vB4DrLnHoStkR8lc/YRwJFoeyHheETDUO59o7cHWUbJ5zarXH6MML9JZf/geStCcP33u9cV097kN9rnSwj1zoyMQAGgwwVT3B1IFJWMwdD5CQ0TGjv1v4u+huWFeps2P+4e+ls85kW9MRsI1Uw/0qD/7frQOOzsNY+oDmAuXZAxOmUcwIJvYMVf6EKpwLoNuepgTGvEYu7yMBccVLf3E0ZIdtm+Maf5NsSt3nrQSUc/0C13y4XdJdeK9hHAfE+mNj5ynaI1s6j1x0p9Dk1HnvjfWeIJNcOiL0t5V6Oa1JgKNfusfrCZgUPBeOsKonHjpPug3waqyhymn2x03OyHTBtEy0k4V9PznQcOZ37pw+q0WMuY5/wJnIlajI0p7235UqNt/C+7zuCSWXRdDJQlM97NjkFbqpKLlAHu9BkOOR9kwIZWC0k7exJaYmB9wb9tSbigmN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b09WVXduMXpLRVUvR25pZjhVTmJTdjJ2dFZReGljTHp2ekdDUzRmU25tdytI?=
 =?utf-8?B?SHFzbjB6Z1F1bGJBV1lvYk52djdnOUlXa1VmclhJaS9CTEk0S2xDZjZ4M0N5?=
 =?utf-8?B?YXR1MXkyRDgvc25kc0o0U29PWFF1OERHeEx1QjA4cjRoakM3ZWxNejNSTmFP?=
 =?utf-8?B?ZFZnYndxajYrcTV2ZDZtQ2swK1YwRTV1TmJ1SWRJenpMSUVXSitMcVp1TE5Q?=
 =?utf-8?B?QUZBRi9qWjFxckFDc0Q5QXpwRkRWdlFnY2N5Q2JxQlBzbVBRc2VFSy9KbGVC?=
 =?utf-8?B?VHEvYmp2ekpEd1AySnZmSUN1bW9Pc1hjSXFkQks1SXV6NUhkWEs5RW4xMjNT?=
 =?utf-8?B?OTM5SWErdmF1ME94SW5IM01vSERJOThueWR1aDBXV2dRR1ZuNmExQy9VRDFB?=
 =?utf-8?B?Z20rTzZUcFlqN1RaSG52WWZuaVAyVE1GbnVTOWNGaXJleVlGN0lUNWs0elRt?=
 =?utf-8?B?ZW50aHlWOGFRd0ZjNEg1NVd6SmJRdW9UcXJsL01UcXlzclp1TXhWalBoV08w?=
 =?utf-8?B?aXB0Q0gwd1hucnhJWXBQOXJTZVBRNWJncmVLdnF6V0ltQ1ZYMWtFQUhVRm1u?=
 =?utf-8?B?Mi9nOHpiVTRLVVIrYms5UUNKWldZVjF6VUFJRXgvdHk1R1pZekhnVG1JQ0hj?=
 =?utf-8?B?YUtUbzNLelllQUllN1V0VEVnTkU3cW5iVG9XZkk5bFVrQlhXMUllMWhHM25Y?=
 =?utf-8?B?dktjWUdBbmdoTW41VS95L0FuaFRnVG1BK2FwVXduRGNTR2U0bGxkbGVVMnhB?=
 =?utf-8?B?NDJKcWNmdVVLcnJKeWxhVU5LbDErTFo2L29nTWZYL2FXYklVaHFEVEROOC9t?=
 =?utf-8?B?SWNBVkptQVFpREo4c1dmTEVXSWtob20vVjdqNWNmSlQrZXRYQ2JiN1NRYThG?=
 =?utf-8?B?aFFwVW5tVk81cURhMFpOSWZqK050eEU3bjRIWmsyMVRPaXp0QlRRcnFZVERp?=
 =?utf-8?B?U3BKd0pZUFhtakhib1QyOWs5blhmRjUrOGgzZEM4bEhnSGQ2TzZTUnF2RTFh?=
 =?utf-8?B?NFpmbGZkR2JvMjc5c041ZkMvcWcvSFE5bGJYY1dJem9PUW9heHRQTUFuVUI1?=
 =?utf-8?B?S1BhQ2s1RXRuNVZtYmRoKzVhM0V4YmpPVzYzYko3ZnZXeFQ2M2ZETXlpdnJx?=
 =?utf-8?B?T0FVTWRhRWZXWUFVL0NBQlVuSHV0bEdLN2RyV3ZLeU5memo3RHJRVWJjbG10?=
 =?utf-8?B?REVXWG1uTUpSUDZKYVh4bkdsUUxDS1BDdVFESnJJQlZ4SkpXQWtBZFZ3cURx?=
 =?utf-8?B?bU1xaDJrMjR2WGIwb1YyUElsaGFMNmhaWXV1d0hCNlNZME9OYnNXWGFob1FM?=
 =?utf-8?B?TnF3Z1U2aC9aT1dFNGhlcC9JYUQyYVlJR1E3MHZvRDgxa2V2b2NpN0drQnRi?=
 =?utf-8?B?ZDdPaS9QdzQ0ajJIS2NXS0NTNEt0OU5xNW1IWVRNMXVqU1JCRURNRm5ETnhz?=
 =?utf-8?B?NXlFbkJ6YVlSajlIbW9wT2ZIQW51dDlyMnNLd2NvVzcydGxxSDRlOWpIb3FK?=
 =?utf-8?B?M2NmeHQ4ckxMTlFBSlpFQThSeW1QNnpXczlIeFVTMTNsOTRzeVRvOFp3NFF1?=
 =?utf-8?B?Q1J4Q0U3QlZGbXpRZ0RkV3VLQzBCb2xnUmJVTWhEcEdUbE56MEhFRHA1YjM0?=
 =?utf-8?B?b2YxR1I2M2pMaTJWQUVUNm1NSG9zZ0pOQTNheCtpL00rdTJpMjdPZHV1SUdx?=
 =?utf-8?B?dS9VODhzTGFDbnNOZEpMRjFqUUNzN1NpdEQwSCs4VFZrM2drcDhUcDRpWTNt?=
 =?utf-8?B?cFFUTEtQTlQ0aFVOYTdoREJ0ai9VUXora2w0d0JhUVpleXQ4V0VIYm1hYkxs?=
 =?utf-8?B?dUxMbHVnOHdUaUlEMmZqdVNsZGh0R1M3MlhzeEpoK2hEVXo4T011dzh0amd5?=
 =?utf-8?B?Y3Bxb2ZocVFZRkNNb0dZb3hYV0VXL2Y1UlJGZW40SklRa0hLcWd6TFdEd2x4?=
 =?utf-8?B?L05jM0FvZUpQd21VemZEY2V5UWcvZjRkaU5iTXhHM3BEeEV2bnB2VDNmSUls?=
 =?utf-8?B?QVhhb2U5OTVTWUF0TmNUaDRybVQ4YlQ3bmJoQTRWdEhkV3g1cDhadzZHOGFl?=
 =?utf-8?B?QkRjNnlKWXhIazVqOGRwK25iT3JkYlljSmt2NFhFZjIvTFBTVGo5cFQ1Snc3?=
 =?utf-8?B?blNNNWN5K2duOXhvTHk3T1NKOXJ5VmFJeXFIa2RrdEtyWmhiWHR5cUNhN2tQ?=
 =?utf-8?B?VUZtLzk2VnBqa0RRbU1MVDh2WXF6MnZSZmlDeXpZN3ZGRkxzc3BORVBWeCt5?=
 =?utf-8?B?bWVmQzk1VjRXM2hzU29tZ2FUa2gxOE4vbGZDZ1EwVW1hbVB4VHB4M2dWVzRq?=
 =?utf-8?B?M21CNGtOLzJnNDFLUUpFaXFXdG9GeDQ0bFdvaUp3Q3Q1UUFKS1Zodz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0600cbcb-50eb-4d80-dafd-08dec31f699d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:28:02.4090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PMGfKu2VJ4m93bAi/tgaSR50Xos5gP1abq2Qxqq0PaVo5vWIdoyJ9CzN6ODO1/3UTmL7SSzntaVxB7FfbBOwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8774

Hi,


On 6/4/2026 12:03 AM, Mika Westerberg wrote:
> Hi,
>
> On Wed, Jun 03, 2026 at 11:31:46PM +0530, Basavaraj Natikar wrote:
>> On shutdown the connection manager tears down the switch tree without
> router tree
>
>> signalling connected devices. Thunderbolt 3 devices directly connected
>> to a USB4 host never receive a disconnect indication and during shutdown
>> this can cause polling the dead link for up to 60 seconds. On some
>> platforms this behavior leads to a warm reset instead of a shutdown due
>> to this timeout.
>>
>> Fix this by asserting PORT_CS_19.DPR on each connected downstream port
>> before tearing down the switch tree. This drives SBTX low unconditionally
> router tree
>
>> (USB4 spec section 6.9), causing the device to detect SBRX low and
>> transition to Uninitialized Unplugged state immediately.
>>
>> Co-developed-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   drivers/thunderbolt/switch.c |  2 +-
>>   drivers/thunderbolt/tb.c     | 11 +++++++++++
>>   drivers/thunderbolt/tb.h     |  1 +
>>   3 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
>> index c2ad58b19e7b..52812908818b 100644
>> --- a/drivers/thunderbolt/switch.c
>> +++ b/drivers/thunderbolt/switch.c
>> @@ -704,7 +704,7 @@ int tb_port_disable(struct tb_port *port)
>>   	return __tb_port_enable(port, false);
>>   }
>>   
>> -static int tb_port_reset(struct tb_port *port)
>> +int tb_port_reset(struct tb_port *port)
>>   {
>>   	if (tb_switch_is_usb4(port->sw))
>>   		return port->cap_usb4 ? usb4_port_reset(port) : 0;
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index c69c323e6952..ca57b5181422 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -2935,6 +2935,7 @@ static void tb_stop(struct tb *tb)
>>   	struct tb_cm *tcm = tb_priv(tb);
>>   	struct tb_tunnel *tunnel;
>>   	struct tb_tunnel *n;
>> +	struct tb_port *port;
>>   
>>   	cancel_delayed_work(&tcm->remove_work);
>>   	/* tunnels are only present after everything has been initialized */
>> @@ -2948,6 +2949,16 @@ static void tb_stop(struct tb *tb)
>>   			tb_tunnel_deactivate(tunnel);
>>   		tb_tunnel_put(tunnel);
>>   	}
>> +	/*
>> +	 * Assert DPR to drive SBTX low, signalling disconnect and avoiding
>> +	 * ~60 s of link polling before warm reset on shutdown.
>> +	 */
>> +	tb_switch_for_each_port(tb->root_switch, port) {
>> +		if (!tb_port_is_null(port) || !tb_port_has_remote(port))
>> +			continue;
>> +		if (tb_port_reset(port))
>> +			tb_port_dbg(port, "DPR on shutdown failed, continuing\n");
>> +	}
> But now this tears down the topology also when the driver is unloaded? If
> you want to do that in shutdown there is ->shutdown hook for that.

Asserting DPR on unload is intentional and it is harmless. After a reload
the driver re-probes and the router tree comes back up cleanly.

It is also needed. Once the driver is unloaded it is unbound, so a later
system shutdown has no driver left to assert DPR and the ~60s link polling
hang comes back. Doing it in tb_stop() covers both plain shutdown and the
unload then shutdown case, so I kept it here instead of the ->shutdown hook.

Will fix switch tree to router tree.

Thanks,
--
Basavaraj

>
>>   	tb_switch_remove(tb->root_switch);
>>   	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
>>   }
>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>> index 217c3114bec8..875eb538eacf 100644
>> --- a/drivers/thunderbolt/tb.h
>> +++ b/drivers/thunderbolt/tb.h
>> @@ -1102,6 +1102,7 @@ int tb_port_clear_counter(struct tb_port *port, int counter);
>>   int tb_port_unlock(struct tb_port *port);
>>   int tb_port_enable(struct tb_port *port);
>>   int tb_port_disable(struct tb_port *port);
>> +int tb_port_reset(struct tb_port *port);
>>   int tb_port_alloc_in_hopid(struct tb_port *port, int hopid, int max_hopid);
>>   void tb_port_release_in_hopid(struct tb_port *port, int hopid);
>>   int tb_port_alloc_out_hopid(struct tb_port *port, int hopid, int max_hopid);
>> -- 
>> 2.34.1

