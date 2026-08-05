Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013024.outbound.protection.outlook.com [40.93.196.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E996E449B11
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785928254; cv=fail; b=Ej3iqD4VmL7aYmEdaWnoPOmkqLG4eCMH8PJiu/DMZypob7aK3YBRl4X3TKFEEgdouG/cf2aSGI6Bhlg1DO0wn345eANzvz4A3k0yEjEfEY0l8eU9Ep8ABOTg75OrlMKNt+ceProFnYLhU3pO87pYl0621KMGoqws93dZ/xvvl7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785928254; c=relaxed/simple;
	bh=We3s1JP1w9bqOE2CrkifHmSp2mATtvWNrE/OQm1d4OI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qG4QOqxij7NU1iqhLNDNGKa3qgEpyjTUzqbMRLAhiafGj81Bm53pV/GsFLZTsUfIgxckN9BkVrnMc1roDf/WLJj2nUcRcOKhdXjGo5/rUe7CI6tBhzc/XBfBaYUSGRjVNJqEHqektV1hjvawQShBNWlErvHu5kEPHAC8HqYXrU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R1WnI0bP; arc=fail smtp.client-ip=40.93.196.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R1WnI0bP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQFOq11n1Ys4qgX01CuOGTG2Li/dW4T4OyO+647O5mB8o0cXZTNgVwXmlhSlx2f6IqTrTGqV0f6cBWyxHeXG9WuTe1lLj1MHJfMMBHeK0wDk6kziCWXXQsvbjxyq4ZxDcuxARZJpA7k/IAGwVTQSYFayZjULl5v124d1hEpaQ1l77hGMCT1YACulHPzu4bmsD1mPcw4V3Xvn7pR46Mk5uhfeglWM4lMHrOFORa6SeL7IwNJeZV6WbslcqVM/vbNrwjKjLEjGbGu54ua1EU96t4hCFfClizOp19drZ6sknvsZF2t54tIMfXGsUm7t4cdSurocG6X5827IW3CO/mYP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLR7PgcySjv4A4Ei5aH1VzZb1cw9c9ZaJREI/RWolaA=;
 b=V9+i5mFml8YqgD4AvTF46ZHQZrZH6t2FFZ111zr9+5B6rL1Qsnq72xrfGsNk/qsM+dzJNhquN1BwDmcrANDJda2YHpI9tEnLcqsjsjfHmIF8K7gx1gay9H08ZyXp1VVumZcDWB4MPOgCEsMJ1k07QKo31vTZA4wIJfVl+fs3n7EUBGLy98X9snBEwk4CflxyJ4ZS1TB3BFvcwQGunHwDCU83NalDXGUAvqLZ7/EUEFq7VDSugtJlvMp9BXwbeW5//UZLDHp/M+AjqAwpSk5EpmA6CFBaJR7tWoCmFmkabQHaUWw71+ONHmVwL6QGW/YCb9y+s1goN4UHjubhT/fEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLR7PgcySjv4A4Ei5aH1VzZb1cw9c9ZaJREI/RWolaA=;
 b=R1WnI0bPZA8NHKjDR4GRF8qF2T4qFBvcpYqGpc2BbEVwL5kBJQ4Ka2AUOE8M/bZ1fm2o4BUKjGg4qQOmDKnIStyZYkgJiFp029co3dYcw2+FlUVN5aOLXl726d7TokX0EJ8UOBanSAr/o4JjIOITH9XvpftK3Q4+r9IiY9lg7Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 11:10:50 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be%6]) with mapi id 15.21.0270.016; Wed, 5 Aug 2026
 11:10:49 +0000
Message-ID: <7624adcb-77bb-4556-8e43-eeaa6735eb74@amd.com>
Date: Wed, 5 Aug 2026 16:40:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] thunderbolt: Add quirk to reset host interface on
 DMA path teardown for AMD USB4 routers
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
 linux-usb@vger.kernel.org, Mario.Limonciello@amd.com,
 Sanath S <Sanath.S@amd.com>
References: <20260804122638.1623429-1-Basavaraj.Natikar@amd.com>
 <20260805034908.GC235112@black.igk.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20260805034908.GC235112@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::9) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|DM6PR12MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb28637-b209-4097-8c18-08def2e2344c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yBXPIimMnFSfqddr89/h8ZG9qowjOF0Me1k5C+SAEN8qsDXUVBQqPRZWWAQ6pnsAzZvvUxZC91kJQ/02Cgf+pOzhY2ifbILcpc0DWcUNJw0BNmyOuc4kQ1AbG7S5ooLXzHmXyRa7OkMu+IvV3SwxiXrfTLmYWzn0wvJBsAlGpgwKQE2NGfE8YklEVfWducOsODaxljXf3m8liMfmEqco3rRw2xXoC/51mzKTmwrahC82rnJ6JkDRLEr5pD17nLYGGCoDFndQ9NT92KrmQxA1Lo9LfBdQqADv3WfA6Hf53Q8VBzSpjbE7c6GtmxWgYzmK2oqCRCAIxbntoVmJyHEChpfNvpgqKAAZIDNDSiRjEglt/iq6uHiWWMp+8WGTmtdZIrWKwkEAomxJiG1mBT1HlJtR9f+vEpYGs7HvorC/jcIHUm7lgyP5U4sikf8OcOSkN94FnLXJgSp89eBhX5SDl7AzI/IlwFZ4RGDHHOhcRmjucKznraGmefywPNPTq5/kEM1hg1mb0PwgoOSTc0cIwU1ZLqWbkm+dp8zXE4okA1HFoUIZ16d5vFUAFRk2KZ0rUqGFHLVSZqkAfi7ik2phI6gwoQgjZ825o/Vc9+/6gXe0UXwM8g6BjasjXXLFGx8W54wxsRCCXB0xHMo7cLAVaE07tHb6baD8tVg7OmRKnFQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEZnQnd5ZTdlV1VtL1lmT1VjbTNlUElHV0Z4WXZ1R3djcTNESm9ONFVIdHYv?=
 =?utf-8?B?TFVxZ0NGem04NVJtT0d0V3QxRWJHK0NWYW1zS3RleFZNUGNXUC9ieVNXMzNr?=
 =?utf-8?B?ZXFhMk9GQ09wNk5UNm1Ec2xTMVZWT0pjWkZXMzNmQTIrUEllM3ZRQUV2TFc2?=
 =?utf-8?B?ZU5pZ1FCWUw0YzZKQUNLZXBJcnFBLzJQWmdyWWVSSUlZT1VTT0lteFErcTF2?=
 =?utf-8?B?YngvY2J3cmVQTjIyb09kTzVuaUpobVBpT0ZBZkVYK0hOZ1pZSjRVZ2dxbGhJ?=
 =?utf-8?B?SVdMbCtBemFReVlyMGxrYm10eG80VDBVaWtpVkd6V2NuNWxIV1kyYlFUcGF5?=
 =?utf-8?B?RHFxeGNPL3JBT1p3b2lUOUNQWU1OWVBmSm1rZG01VUwyRUI0QTU3NFRKOS84?=
 =?utf-8?B?bnN5OEVRRW5MeU03cjQwNFNyNitibXR4Qjl5cUExMndDWFYyRVJ3SzJXR01V?=
 =?utf-8?B?TnFtYTJVYnkzQTc2YzhrbDdjeXArNkhjM1dFTEtueGFzVGloSTNLd2FCTnF5?=
 =?utf-8?B?aHlpKzNIOEFuaW1lcEhrYjVXdDQwU01DUURhWDRHZDc3VGpIeDRTZ2lISGpE?=
 =?utf-8?B?M21FSmJHSkNGbTB1d2FDdjAwQzl1RjVpMzZiZFdGMVhqbFl5Y2E2Rm5WQVY3?=
 =?utf-8?B?bHFWVXhyYU1VeGwxSnFLaUhSOGlNSHVCS080TU1JSmU3OUJIbUorK2ZOYkV4?=
 =?utf-8?B?QW1Xb3cyK24rSW05SE1xS1pDSWRabUYzaWNMNzh1OGhhdmdRL1V5eklrS2c0?=
 =?utf-8?B?WFErdEJFTDUvTFc2Z0oxNTBUYTBRMlFER2dGOE41bTlaUnArc1NPbWJSVGt0?=
 =?utf-8?B?dmNNZ0ZGc0xvTEhpaVcxbVZEYjVVNGxiQXNjSmhURFFueDNLazNNT1lzWk5l?=
 =?utf-8?B?RUVWdU1tRE5BUUc4UTA1eHIwa0d3TVh6QlBiN0UyMlpQTE9mbXdVakhmdzhL?=
 =?utf-8?B?YmtUdHVsR0ZRN0M2S29JQW1TZ3hodENMVnIyNG9LeTJwdk5veXI0YXJSRFh2?=
 =?utf-8?B?Y3FzVE5sTVFTK1BuLzdubHNSQVU4SzI0aEdCM2FiaS9zbWcwYnlnV0pRUmtE?=
 =?utf-8?B?NTRRL1VkeEk5STduUzZqcXc2NjQ5UFlJQXlXQ0g4QisvZVhzbWNSQTVTTmk0?=
 =?utf-8?B?UW5EN2xQRHlkVC9yaEZ3aHZNdXkyeVZqb3EvenIzclg0VVkvVTB3aUY3VG5a?=
 =?utf-8?B?K0VGb3ZYMG4yUGpYTHNaWVM5Ums2SW1nU2QrMy9oaUNTMVY3NXBYSjBJTnd6?=
 =?utf-8?B?MVN6NTdzUlhrSExNVmJwaEpGZGZjUmFMQ2pQN0RiejVYVjdtY3JDTVZzMWNX?=
 =?utf-8?B?Z3BmRlpJKzJ4OG05V1c2UDZTRElYaWdqZ0R2QWJCNEFEV3BYM1RkSVVDOVd2?=
 =?utf-8?B?V09SaVViVm5qL1ZsWStiQUo3WFVJVE96bDhYNkhQa08zME1LeU5RSXphSTRK?=
 =?utf-8?B?R2hBUjZmbGU4YjZGOFNBMXEvWnl3dWN6RVVLK3RLODdBeGdJRGhwTGZrb0Qr?=
 =?utf-8?B?THdaMzlraE1Kdkx6REhlSXNWNVZVWmtlQ1A1RHpDTmszbXkwK2o0Q0hwUSs2?=
 =?utf-8?B?aTdNZ2hxcUpDZ2xia0pBOWpqeEdJYWt1WDFXQWI1VEp3UXh2WTI5dlcvM2hn?=
 =?utf-8?B?Q2c2cVpxMGxmZjJRV25GVWpoNHhuYzh4QUV5V0hYSDRXQzJDWkdhbkRpY1JO?=
 =?utf-8?B?enFiVjhoL0J1RnN4VWtXOFJZcktaS3JZbVAyanpoVGFva0JEeHdScFQ3dFBu?=
 =?utf-8?B?b2ZWNWhTZVRiTi9Dc1JJZ3FwUVEvaE90WUVGd2k0aHV0RHlXSDVKQnkyVE5l?=
 =?utf-8?B?aU5EMGg2NUlROUNvTVE4NWNuOE9ENGZwRWFKNmRwVm8wa2VaMWhjVXZkQ3Rp?=
 =?utf-8?B?dExiMXdLL0tqdjhxZWU0RVBleUhmSDZwMCtXMmVsbFVXQlVDdDNpeHdjdzZw?=
 =?utf-8?B?RWhwckN6eDh6VE9aQnR1dE1lVkU3alRwbFJEOTJORENNdGVnNFBzNkJ6cXlH?=
 =?utf-8?B?TzliYlN0aldnQ0tDbXZiMG10MmdFd3BwZHd2ZU80dU1OYXczK3hjZ0RGbFZE?=
 =?utf-8?B?RkZGYmZYKzIvclozeUdzejJxMHFHOCtBbk5OOFBKaWpJN0NRaFVmRGJkVFdo?=
 =?utf-8?B?Vk9tdU5tOERrSXVIeXFraXowdUJKMGVZMGozZ25uR3paZDhSODhQTmRPS0l2?=
 =?utf-8?B?dGdLNGwyS2lxV1JEaENWbXNmSTJHZ1JoTFlVTUlMNE9HemtGMVFuSWs1eWxx?=
 =?utf-8?B?TjB0L1luQ3R0bkVRZG9PM0NUeHFXcDBOcER6aGxLRFRYOTEzT2EyUllMUm44?=
 =?utf-8?B?cEhtZWtIbWhwKzZtZUpJRllBY1RhTnlVT01ENnZRcjRiNEZFcTF3dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb28637-b209-4097-8c18-08def2e2344c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 11:10:49.6340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQHEed1ZLtExeVjQauJs3rcxZh5hbVHECeC3bfSfdBfOzYjiC93NYjp7VI5nogmPIRPJR4HypIn00S2Jg3dlFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219


On 8/5/2026 9:19 AM, Mika Westerberg wrote:
> Hi,
>
> On Tue, Aug 04, 2026 at 05:56:38PM +0530, Basavaraj Natikar wrote:
>> Some AMD USB4 host routers have a bug in the Host Interface where
>> DMA path setup and teardown cycles may cause the Tx ring to hang.
>>
>> Fix this by issuing a Host Interface Reset on every DMA path teardown
>> for affected routers. The Host Interface Reset brings the registers in
>> the memory BAR to their default state and clears the End-to-End Flow
>> Control state, preventing the hang condition.
>>
>> Co-developed-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>>   drivers/thunderbolt/nhi.c      | 48 ++++++++++++++++++++++++++++++++++
>>   drivers/thunderbolt/nhi_regs.h |  4 +++
>>   drivers/thunderbolt/quirks.c   | 16 ++++++++++++
>>   drivers/thunderbolt/tb.c       |  7 +++++
>>   drivers/thunderbolt/tb.h       |  3 +++
>>   5 files changed, 78 insertions(+)
>>
>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>> index 383a36212f70..0865cab582e7 100644
>> --- a/drivers/thunderbolt/nhi.c
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -1160,6 +1160,54 @@ static void nhi_reset(struct tb_nhi *nhi)
>>   	dev_warn(nhi->dev, "timeout resetting host router\n");
>>   }
>>   
>> +/**
>> + * nhi_host_interface_reset() - Issue a host interface reset
>> + * @nhi: Pointer to the NHI structure
>> + *
>> + * Resets the Host Interface by setting the RST bit in the Host Interface
>> + * Reset register. This brings the registers in the memory BAR to their
>> + * default state and clears the End-to-End Flow Control state.
>> + *
>> + * The caller must ensure that the control channel (Ring 0) is stopped
>> + * before calling this function, since the reset clears ring state.
>> + * The caller is responsible for restarting Ring 0 afterward.
>> + *
>> + * After setting the RST bit, waits for tHIReset (10 ms) for the reset
>> + * to complete.
>> + */
>> +static void nhi_host_interface_reset(struct tb_nhi *nhi)
>> +{
>> +	struct device *dev = nhi->dev;
>> +	u32 val;
>> +
>> +	val = ioread32(nhi->iobase + REG_CAPS);
>> +	/* Host Interface Reset only applies to Ver. 1 routers */
>> +	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) >= REG_CAPS_VERSION_2)
>> +		return;
>> +
>> +	dev_dbg(dev, "issuing host interface reset\n");
>> +
>> +	iowrite32(REG_HOST_INTERFACE_RESET_RST,
>> +		  nhi->iobase + REG_HOST_INTERFACE_RESET);
>> +
>> +	/* Wait for tHIReset (10 ms) for the reset to complete */
>> +	usleep_range(10000, 20000);
>> +}
>> +
>> +/**
>> + * tb_nhi_host_interface_reset() - Reset host interface with control channel
>> + * @tb: Pointer to the thunderbolt domain
>> + *
>> + * Stops the control channel, issues a Host Interface Reset, and restarts
>> + * the control channel.
>> + */
>> +void tb_nhi_host_interface_reset(struct tb *tb)
>> +{
>> +	tb_ctl_stop(tb->ctl);
>> +	nhi_host_interface_reset(tb->nhi);
>> +	tb_ctl_start(tb->ctl);
>> +}
>> +
>>   static struct tb *nhi_select_cm(struct tb_nhi *nhi)
>>   {
>>   	struct tb *tb;
>> diff --git a/drivers/thunderbolt/nhi_regs.h b/drivers/thunderbolt/nhi_regs.h
>> index d6a197fabc74..99df60b6db36 100644
>> --- a/drivers/thunderbolt/nhi_regs.h
>> +++ b/drivers/thunderbolt/nhi_regs.h
>> @@ -115,6 +115,10 @@ struct ring_desc {
>>   #define REG_CAPS_VERSION_MASK		GENMASK(23, 16)
>>   #define REG_CAPS_VERSION_2		0x40
>>   
>> +/* Host Interface Reset - resets TX/RX rings and E2E flow control counters */
>> +#define REG_HOST_INTERFACE_RESET	0x39858
>> +#define REG_HOST_INTERFACE_RESET_RST	BIT(0)
>> +
>>   #define REG_DMA_MISC			0x39864
>>   #define REG_DMA_MISC_INT_AUTO_CLEAR     BIT(2)
>>   #define REG_DMA_MISC_DISABLE_AUTO_CLEAR	BIT(17)
>> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
>> index 9f7914ac2f48..cc04d0873931 100644
>> --- a/drivers/thunderbolt/quirks.c
>> +++ b/drivers/thunderbolt/quirks.c
>> @@ -52,6 +52,12 @@ static void quirk_block_rpm_in_redrive(struct tb_switch *sw)
>>   	tb_sw_dbg(sw, "preventing runtime PM in DP redrive mode\n");
>>   }
>>   
>> +static void quirk_host_interface_reset(struct tb_switch *sw)
>> +{
>> +	sw->quirks |= QUIRK_HOST_INTERFACE_RESET;
>> +	tb_sw_dbg(sw, "enabling host interface reset on DMA path teardown\n");
>> +}
>> +
>>   struct tb_quirk {
>>   	u16 hw_vendor_id;
>>   	u16 hw_device_id;
>> @@ -114,6 +120,16 @@ static const struct tb_quirk tb_quirks[] = {
>>   	{ 0x0438, 0x0209, 0x0000, 0x0000, quirk_clx_disable },
>>   	{ 0x0438, 0x020a, 0x0000, 0x0000, quirk_clx_disable },
>>   	{ 0x0438, 0x020b, 0x0000, 0x0000, quirk_clx_disable },
>> +	/*
>> +	 * AMD USB4 host routers may hang the Tx ring after repeated
>> +	 * DMA path teardowns. Issue a Host Interface Reset on each
>> +	 * teardown to prevent the hang.
>> +	 */
>> +	{ 0x0438, 0x020d, 0x0000, 0x0000, quirk_host_interface_reset },
>> +	{ 0x0438, 0x020e, 0x0000, 0x0000, quirk_host_interface_reset },
>> +	{ 0x0438, 0x020f, 0x0000, 0x0000, quirk_host_interface_reset },
>> +	{ 0x0438, 0x0210, 0x0000, 0x0000, quirk_host_interface_reset },
>> +	{ 0x0438, 0x0211, 0x0000, 0x0000, quirk_host_interface_reset },
> These quirks are for things inside USB4 fabric. Since this is the HI, we
> have quirks for those in pci.c/nhi.c like QUIRK_AUTO_CLEAR_INT. Can you
> make this one follow that convention instead?
>
>>   };
>>   
>>   /**
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index 47753a5c0f2e..d40cc9e57364 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -2395,6 +2395,13 @@ static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>>   	 * the same host router USB4 downstream port.
>>   	 */
>>   	tb_enable_clx(sw);
>> +
>> +	/*
>> +	 * Some host routers may hang the Tx ring after DMA path teardowns.
>> +	 * Issue a Host Interface Reset to prevent it.
>> +	 */
>> +	if (tb->root_switch->quirks & QUIRK_HOST_INTERFACE_RESET)
>> +		tb_nhi_host_interface_reset(tb);
>>   }
>>   
>>   static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>> index 4373336d9425..d21feb631f3e 100644
>> --- a/drivers/thunderbolt/tb.h
>> +++ b/drivers/thunderbolt/tb.h
>> @@ -26,6 +26,8 @@
>>   #define QUIRK_NO_CLX					BIT(1)
>>   /* Need to keep power on while USB4 port is in redrive mode */
>>   #define QUIRK_KEEP_POWER_IN_DP_REDRIVE			BIT(2)
>> +/* Reset Host Interface on DMA path teardown to prevent Tx ring hang */
>> +#define QUIRK_HOST_INTERFACE_RESET			BIT(3)
>>   
>>   /**
>>    * struct tb_nvm - Structure holding NVM information
>> @@ -1507,6 +1509,7 @@ static inline bool usb4_port_device_is_offline(const struct usb4_port *usb4)
>>   }
>>   
>>   void tb_check_quirks(struct tb_switch *sw);
>> +void tb_nhi_host_interface_reset(struct tb *tb);
> Also we don't need to expose this then (and if it needs to be exposed it
> belongs to nhi.h not here.).

Sure Mika, I'll address both in v2:
- move the quirk to the NHI - set nhi->quirks in nhi_pci_check_quirks()
   by PCI ID, following the QUIRK_AUTO_CLEAR_INT convention.
- move the helper declaration to nhi.h (out of tb.h).
Will send v2 shortly.

Thanks,
--
Basavaraj

>
>>   
>>   #ifdef CONFIG_ACPI
>>   bool tb_acpi_add_links(struct tb_nhi *nhi);
>> -- 
>> 2.34.1

