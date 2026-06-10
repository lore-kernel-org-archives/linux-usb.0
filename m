Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E3228FFF6
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098338; cv=fail; b=nPOxUQ5L/04c8Om34rrrmcsUo2UwmU+FFfsnY1un+NY9qKTBX2J94TGtKVWTxag5yEd1CZLHApYMhTX2Bhjdkkl/vNNdkCQ25LEWNWiaD5fUsnEDnRAMy6VgT3jwS0lQflkWUFnH1p98F8HyCdWl6s1jEPnBgzw3PelHH52s1MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098338; c=relaxed/simple;
	bh=/jsvm9UKzQXs8qMxLyRlsRMO2fa245P3kMng7xP9uVo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=usjDVH1ZWLo8QtECaLjPxRB1p+T3vjRwfA0ezSS4oMozv2YdprOqL3mUagg8eoaRRwSLL1Iy1NCKl51JB922ywlGTjPfmS9kUdvwHLfIh9NPbcfzxj7eefvi8iyvQNMxJSxXsGnEbnmxZFpJx2lOsexcdiAo8yN3awe7DLgpg1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AGXA/8jg; arc=fail smtp.client-ip=52.101.56.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AGXA/8jg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTOqzjTogBULS6UJHcQEKVBMb786gI6RCxBoDi2vXdKFA2zR3y7DFRFZHVhg6mnZSD9lBsEShr2SqcJeWba0z5PUZsle25anEzEhjPd4qd1LaoQdFkpGsVFPOGL9OZNQpB+SYSKG9Wvb1HQE1gokMEiT5vOu5gVAQm58rnSZBYlbQBnSTTSP/DxjO6syEiiwSabkq+xh4Cqj+t9AF8O6M4u+fjkZXVqIy/zEfw1sd1hxzXiMjJ7Ypi6M73HnBsbGDjXuxV71Mk1GPLMIBjCKjXa/SCVFhXZklbNnJmAe7XxiQ5aQomuuvKJvDS2HXFC6rvjO3gsfwMbhxCFlKkWIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1hpAOetgT6LOSPPapKzBuFu0I1EAa9H8x6HzoS90Tc=;
 b=LpO3pIsZcyk5Y8AK31FH0yTVPCwAxW7TInI+jXrAkgwK/xJhHI/yskzeM/TC86PHQt18w2aCdq93YwqWc30ntS3nrHNZwCZv9sILFFUNDarGX/v2+iUHlc7SfKLr4GpsORxpywif5sZcSXsoFG+bRqnv4vXxo6x1FqAR6PwGIcFEiVb4zYlC9lUQ1r4LxtxcJEaxgBAIdwdBA5JNB6RzhJESD95IHy4LScUevOwTKi0pKrAcLcGCSdM7ZI0helBFiTLfDj3O1XBsv5+fY0gPWUJLy/LJP2xVoC6Mt2c97iROuXONltHtoBsMlJWV9o2fRf76DNIJGLNlQuahXq23bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1hpAOetgT6LOSPPapKzBuFu0I1EAa9H8x6HzoS90Tc=;
 b=AGXA/8jgRT3TOpAm/0qdmQlOPWuPUdBrTCl8NArN3Z6prIL/DidePQpzttMbGrCVdIWuwGx7UQFM2z9ZtdS87v2MPp6gqyTED+gsHTwQhMUwX4AF6CfaFwLhNKQoOwSmrj+HeDuN+Kj+Vaf3r1tJ9xshn33K1DtTInFZZNrn8qE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Wed, 10 Jun
 2026 13:32:08 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::94f:c77d:ded2:28be%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 13:32:08 +0000
Message-ID: <ef95085b-8c7c-4214-ad81-1ece2adf805f@amd.com>
Date: Wed, 10 Jun 2026 19:02:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thunderbolt: Assert downstream port reset on shutdown
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, andreas.noever@gmail.com,
 westeri@kernel.org, YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
 Mario Limonciello <superm1@kernel.org>, Sanath S <Sanath.S@amd.com>
References: <20260610085006.3735139-1-Basavaraj.Natikar@amd.com>
 <20260610105717.GQ2990@black.igk.intel.com>
 <5b14d6df-bbbd-4c0e-a276-4cf8d370d097@amd.com>
 <20260610115846.GR2990@black.igk.intel.com>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <20260610115846.GR2990@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0050.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::14) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c070c6f-33ad-4ab7-35f4-08dec6f4ab1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	hnoSSoDwz6dEfWzlzo+e1/EILGFALf0HrWR6qMAp1Y6JbipX4V2rDc1hdEcN93WCWpwmDYkvK7A13wfZk8+lryaW/01wKfBQHjkqb47KGdakdMi24ay4EQkFLKtHAcNmgezZVMYgMsfzsOycCi3zskatilYo2naVA28X/DlTkMv5uoRQon2CsxUOP7dWQF/gw4QwWIX1tsEpYg7I7Rp7LrI3G7um44uzJJHXz07k5TrnFUyYHnTFWqiwUduZ3bXmsehfDdQd+MW+sZy2L0T6Y9VocoBBQeCwim/0wgplgYx7vBukgNcaPnjhhQnLEr0uuIDPTcZQPPN2gjQAK6Cw7VE9S5VOisas7UEME7oy1m+XJEa8t4MSRXLBGVX5E1oEL7FNi+KZP7MJuXssgrrje0imfWkNul0HpLNpVPMfxwaEUj7Vg1qJETtEAGMh5qTRDiBE4AT5HYB9YdV29i+6I3fhe1QN7RD9ZMlsqoy6Ey9UNhXgwgGCTMBwOeN3uRSTg9daORGB36wIH+caLG7NrnvNcEgjWus+euzNJWWSnrLqlWUPrY8llLNugMNDJ0iQp+5tjVQ+/8eAxbNAV7ZsP/+Cp6Yxhi7tIpkVz09nriin+fJlxCnFNuWQ1Lk237kDErb9A35BJng1jCg+JxK4IxCj/hyN1K4PxoJaqXXeohg39+JzmP+xI0qTwd0Cj0KRJOsxCOqnspQhKLJG8CqwXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDBZTzZONExsbW9kOGRoL1d3TUx4MEdmaVBGSzVnTUpNdWpuZDZsSWU0b3Y1?=
 =?utf-8?B?L3dIQ1BkZFZ1eC9hZ3Q5RjhNS2laMHAzTEp3SlBUQ0djQkdRRjdjRU1sQnVU?=
 =?utf-8?B?RWJEVkp5RUJKMy90dDUyV3V5dHhkVk05NUlpZHQ2bG13azR3MzhrY0pCK0RN?=
 =?utf-8?B?MEdsZWF6cUNYNmxxTHY1WWRjMGlSb0JVckI2WkpOUkZjbjdvTHF0V0thZVM1?=
 =?utf-8?B?S3A0ejFOQUx1YWExWDdzdmRiZytFZXgyeTI4cTl6Wmh4S2MxdDVsTFpZV0d2?=
 =?utf-8?B?dU5KU0ZOSzU5R052UzJ0SjJMTGViMEl4bVN0LzExczVwQWlCVVFDdUhFczBW?=
 =?utf-8?B?OStxbzNUTTFqQzF1VXduRmZvVE5DTXI4dk42K2ZjeTVkdldXdnpQL0d0R1pn?=
 =?utf-8?B?ejVQci9OMDF0MjA4QWtNZ2NjaHB4V2RaZzdmUUc1Uzd2MXhHSzZXQ3N5WTdJ?=
 =?utf-8?B?Yi8xQW40N3N2VTFkaW12QzNaOUtFTTZFckFmcWdWc0QzOGhhQXlVWXEwU3pz?=
 =?utf-8?B?ZHpYQUQySmxUMk8zYmxmOVRaMFRXaTN3T3d5TGRINzcrVEJQQ2lvRVdrb0tI?=
 =?utf-8?B?b1dwYWs3cjZ3UTVoVjBYNkh5QVpKZkprL212MHR2eit1K3JpSS9EcjR0Ri9l?=
 =?utf-8?B?K3FUcFFLamtuV3BMNElJOVMzV01LQzBVQmtVNzZiOGhneXRlNkg3ajRDdCtr?=
 =?utf-8?B?ejU0bXNoeE44TVVQdWM3SDczTjk0bFFFUFA0UTBUQ3pvd21mOUQwN3N5S1BI?=
 =?utf-8?B?aDBFaCtoR25hU1djYVBVSEJYQTlNWWNJQ2VxTVF0aUtHVjdDNUVKWDlMYnNN?=
 =?utf-8?B?NTdrNStpMDNSRUhsMzBJUUlraFpRc3VwbEtoRjhHcjN6RExGdWRZblNXNlo3?=
 =?utf-8?B?MW9nQUU3QUxKN3Rkdk1YTThoWjNlTlBkWlBIVjJtL0ZsL0lkSW1kS1FNWGpk?=
 =?utf-8?B?S04yY2I5U3NXVUJMU3ExeDBJSm5xeTdmenQ1K1BqcWtYMjNLQ3owVlF0cUhN?=
 =?utf-8?B?VUVFRENZNWk2eHRBT3JESHBSVUdsekZDalhYU2d6Q0xqUXR6My90ajBUSENq?=
 =?utf-8?B?VDRoWmY3Y01BL2Npb0d0NW0wTnpEeHFFOTBNbzMvUTR3S2xwbHN5VW9OaG9U?=
 =?utf-8?B?bFhRWE4reGxFeGlvNDI1NnNtNDFwaDFhY0RXTjlXeWFYd0NPNXlmVmsvbG9q?=
 =?utf-8?B?RFBEbVVuR3JNZkhLR0EraHVndDY5R2pNNjhaTVQ2QzRQWEtpYVVzOE51aGlt?=
 =?utf-8?B?OTJDVEQ0REgva1ZoQ1RZVmhaM1Z2SHFLNUVObndhNE1OdjQ2Zjd4c1pGZGM3?=
 =?utf-8?B?ODFseWFVc05pdlZJaVI4V3ZwS1NOZlZ1T1ZMM0VwQld4dHpGMGhCU1dnMW55?=
 =?utf-8?B?d0ZScHc2UWlqR1ppNFpGeXBwZ0RtQ0YxMXVkODRpbFh5VDloQ2diMGlRNW1U?=
 =?utf-8?B?RlhubVkzK3ZSKy9uSlZiUUcySXVYSllGaG05bWpWYzkwRUZzUzJxWFFWeFhh?=
 =?utf-8?B?RitTY2p3cVIvWW1tMGhJVkVFL2xmRnpER2tEVnpKNzVrdUlBcE9PZ1ZSUHhN?=
 =?utf-8?B?VDIzTlQxL1hUaEJUZXZIR0o0TlVPYnliVFU0dVN1ZXp0b0cycVNPRm9QeFZZ?=
 =?utf-8?B?OGVld1Z2MURlS09GeGhGL0Q1a0k5a1ZkeGFvdFh0bHlpMTYzWnlJWFRlZFNY?=
 =?utf-8?B?bEoyUGp4dittQ28weVNjTDVBTEh6WXFyS2lUVENHR09haHhTVnJNaGE4Y1Nm?=
 =?utf-8?B?VDU4T0xVWXNyMFFTcnFTdCtWK0YzVjh3elpnNzl1UHA3VXNGZVRETGR5cCtv?=
 =?utf-8?B?aXpqVDZTM0gyOGVvRXNuRkVuWnAxbUxpRFdKU2dVZEZBc1NxdjJ1NXcrdHZa?=
 =?utf-8?B?eFZDNVliMm1TcnlZS05Fd3hSTU5UVDRodjJJR2VDSVlWbmJMdDl4MHFrS0lP?=
 =?utf-8?B?dGpxZnppUXhleThISEsyNzd6WVY5a29QelpJeFVlMjQ0RzdNNzY2eVhvSTBZ?=
 =?utf-8?B?bkcwMVhPZ3JhRmYzOUp1QkkxMzZGbnBGNnBIeDlxTkpNTXFYUlNzM3hjdXlx?=
 =?utf-8?B?SkVEbVBwZE1SM1VkRXBXWjZFK0RJVVh4QkJUMEQ3RVpjSHZ5ZHVkWVhESzZ1?=
 =?utf-8?B?bkdhVUd3Y1NSaVZqQnBJNktQWGNzUjZKakNmM3RsQlJvSzc4OFVqQXl2b2Mr?=
 =?utf-8?B?Zjh5N1JJMzFTOUl4ZFJ4d3pnODJ3UGJRQ1U3TnlYdDhYRU1VbHpVWi9SRFJK?=
 =?utf-8?B?enpGRndoMk5DNk9FNHdlVnVVSTdrVVFHOVRFaTdjODlwSEJGN0RzTDJndW1k?=
 =?utf-8?B?WjlZV3p0THZVVlgvRnFSbmxXN3I4aTQxUE5EdmdsVTVkbTRRRks2dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c070c6f-33ad-4ab7-35f4-08dec6f4ab1f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:32:08.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2nHeoLNCMiq/htW1SPPCJjNRHU/HmvqxU8QWyQcs0S8p1D5oackzQZJpCRfn+dFJxiZVIBySwsMzfus6UulFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926

Hi,


On 6/10/2026 5:28 PM, Mika Westerberg wrote:
> On Wed, Jun 10, 2026 at 05:02:56PM +0530, Basavaraj Natikar wrote:
>> On 6/10/2026 4:27 PM, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Wed, Jun 10, 2026 at 02:20:06PM +0530, Basavaraj Natikar wrote:
>>>> On shutdown the connection manager tears down the router tree without
>>>> signalling connected devices. A Thunderbolt 3 device directly connected
>>>> to a USB4 host never receives a disconnect indication and during shutdown
>>>> this can cause polling the dead link for up to 60 seconds. On some
>>>> platforms this behavior leads to a warm reset instead of a shutdown due
>>>> to this timeout.
>>>>
>>>> Fix this by asserting PORT_CS_19.DPR on each connected downstream port
>>>> before tearing down the router tree. This drives SBTX low (USB4 spec
>>>> section 6.9), causing the device to detect SBRX low and transition to
>>>> Uninitialized Unplugged state immediately.
>>>>
>>>> Always do this on system shutdown/reboot by forcing host_reset in the
>>>> PCI ->shutdown callback. On plain driver unload only do it when the host
>>>> router was actually reset on load (host_reset=1), since in that case the
>>>> tunnels are not preserved across reload anyway; with host_reset=0 the
>>>> tunnels are kept alive across unload/reload so the links are left intact.
>>>> Restrict the reset to Thunderbolt 3 devices.
>>>>
>>>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>> Co-developed-by: Sanath S <Sanath.S@amd.com>
>>>> Signed-off-by: Sanath S <Sanath.S@amd.com>
>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>> ---
>>>> v3:
>>>>    - Rebase on top of the thunderbolt next branch; the PCI ->shutdown hook
>>>>      now lives in drivers/thunderbolt/pci.c (nhi_pci_driver_shutdown()).
>>>>    - Add kernel-doc for tb_port_reset() now that it is exported.
>>>>    - Move the host_reset flag into struct tb_nhi instead of struct tb, and
>>>>      set it from nhi_probe() instead of tb_domain_add().
>>>>    - Spell out "Thunderbolt 3" instead of "TBT3" in the kernel-doc.
>>>>    - Reword the debug message to "downstream port reset failed, continuing".
>>>>
>>>> v2:
>>>>    - Add Reviewed-by tag from Mario Limonciello.
>>>>    - Restrict the DPR assertion to Thunderbolt 3 devices, since the issue
>>>>      only affects Thunderbolt 3 devices.
>>>>    - Only assert DPR on system shutdown/reboot (the PCI ->shutdown callback
>>>>      forces host_reset) or when the host router was actually reset on load.
>>>>    - Reword comments and commit message to refer to the "router tree"
>>>>      instead of the "switch tree".
>>>> ---
>>>>    drivers/thunderbolt/nhi.c    |  2 ++
>>>>    drivers/thunderbolt/pci.c    | 16 +++++++++++++++-
>>>>    drivers/thunderbolt/switch.c | 11 ++++++++++-
>>>>    drivers/thunderbolt/tb.c     | 21 +++++++++++++++++++++
>>>>    drivers/thunderbolt/tb.h     |  1 +
>>>>    include/linux/thunderbolt.h  |  6 ++++++
>>>>    6 files changed, 55 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>>>> index 0f795ea58756..698fb124d529 100644
>>>> --- a/drivers/thunderbolt/nhi.c
>>>> +++ b/drivers/thunderbolt/nhi.c
>>>> @@ -1235,6 +1235,8 @@ int nhi_probe(struct tb_nhi *nhi)
>>>>    	init_completion(&nhi->domain_released);
>>>> +	nhi->host_reset = host_reset;
>>>> +
>>>>    	res = tb_domain_add(tb, host_reset);
>>>>    	if (res) {
>>>>    		/*
>>>> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
>>>> index bbd186c29ef7..be63a4647b59 100644
>>>> --- a/drivers/thunderbolt/pci.c
>>>> +++ b/drivers/thunderbolt/pci.c
>>>> @@ -493,6 +493,20 @@ static void nhi_pci_remove(struct pci_dev *pdev)
>>>>    	nhi_shutdown(nhi);
>>>>    }
>>>> +static void nhi_pci_driver_shutdown(struct pci_dev *pdev)
>>> nhi_pci_shutdown()
>>>
>>>> +{
>>>> +	struct tb *tb = pci_get_drvdata(pdev);
>>>> +	struct tb_nhi *nhi = tb->nhi;
>>>> +
>>>> +	/*
>>>> +	 * Force host_reset so the connection manager asserts DPR and signals
>>>> +	 * disconnect to connected devices before the router tree is removed.
>>>> +	 * Only Thunderbolt 3 devices are reset.
>>>> +	 */
>>>> +	nhi->host_reset = true;
>>>> +	nhi_pci_remove(pdev);
>>>> +}
>>>> +
>>>>    static struct pci_device_id nhi_ids[] = {
>>>>    	/*
>>>>    	 * We have to specify class, the TB bridges use the same device and
>>>> @@ -593,7 +607,7 @@ static struct pci_driver nhi_driver = {
>>>>    	.id_table = nhi_ids,
>>>>    	.probe = nhi_pci_probe,
>>>>    	.remove = nhi_pci_remove,
>>>> -	.shutdown = nhi_pci_remove,
>>>> +	.shutdown = nhi_pci_driver_shutdown,
>>> nhi_pci_shutdown
>>>
>>> Otherwise looks good.
>> Thank you Mika for the review.
>>
>> There is already a static nhi_pci_shutdown() in pci.c (the
>> tb_nhi_ops.shutdown handler at line 233, also called from nhi_shutdown()),
>> so reusing that name for the pci_driver ->shutdown callback would collide
>> and fail to build.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/tree/drivers/thunderbolt/pci.c?h=next#n233
>>
>> Would you prefer:
>>
>>    1. Keeping a distinct name for the pci_driver hook, e.g.
>>       nhi_pci_driver_shutdown() as in this version, or
>>
>>    2. Renaming the existing tb_nhi_ops handler (say, to
>>       nhi_pci_ops_shutdown()) so the new pci_driver ->shutdown callback
>>       can take the nhi_pci_shutdown() name?
>>
>> I'm fine with either; please let me know which you prefer and I'll send v4
>> accordingly.
> Put this code to nhi.c::nhi_shutdown() as that's applicable also to non-PCI
> hosts, right?

I tried that, but nhi_shutdown() runs too late in the teardown to be
useful here. On the shutdown/remove path:
   nhi_pci_remove()
     -> tb_domain_remove()
          -> cm_ops->stop() == tb_stop()   /* reads host_reset, asserts DPR */
     -> nhi_shutdown()                      /* ring/HW teardown, runs last */
tb_stop() is what reads host_reset and asserts the DPR, and it runs
inside tb_domain_remove() -- before nhi_shutdown(). So host_reset has to
be set *before* tb_domain_remove(), and nhi_shutdown() would set it after
tb_stop() has already run.

To still keep it generic for non-PCI hosts, how about a small generic
helper in nhi.c that just forces the flag, called from the bus ->shutdown
callback before the normal removal:
   /* nhi.c */
   void nhi_host_shutdown(struct tb_nhi *nhi)
   {
     /* Force DPR on connected Thunderbolt 3 devices, see tb_stop(). */
     nhi->host_reset = true;
   }
   /* pci.c */
   static void nhi_pci_host_shutdown(struct pci_dev *pdev)
   {
     struct tb *tb = pci_get_drvdata(pdev);
     nhi_host_shutdown(tb->nhi);
     nhi_pci_remove(pdev);
   }
   ...
     .shutdown = nhi_pci_host_shutdown,

This leaves nhi_pci_remove() (and nhi_shutdown()) unchanged, and the
host_reset logic lives in nhi.c so a future non-PCI host can reuse
nhi_host_shutdown() the same way. Does that work for you, or would you

prefer it shaped differently?

Thanks,
--
Basavaraj

