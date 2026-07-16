Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F43370EB;
	Thu, 16 Jul 2026 18:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226742; cv=fail; b=KmkvsVXBfXD3GkV729GoIDkkm3m4DDisz4ETjTMSJqxLhVHh7uuC3lpLIEgwbYnnRibh+e2e98js+7Rz10yWjHu4xKYAwTfshEioKa5xoje4iEY7HqFReilSOfSARolY0QaGtp8QiAQCTTPFoTsAkbY/nINpT5CqOM3jg8wS4/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226742; c=relaxed/simple;
	bh=8z+FtkbhIbsighVpxgMWs/Y7RCEngDzujnj/0HTIr+4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=prDtcouu/L/dxklI2y6mZiuzMVLPE/zU9DEqwMyRV5/s5mkwIKicL+4jpXS/C6n4GjjwlVcppedDq8dugMjAxGFn3kMQmo7P0JEFKD6D+yHlhBun4KyAdngk9YdSh+fHH7fEk0kRH64JgrcLZOBrj9kg+FAKnEQDMQKo9tYHRMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4cp9YA7x; arc=fail smtp.client-ip=40.93.194.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4cp9YA7x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiDPuNjUmTip0PsSZ+q/jonZTG8/IZiuWRp/eeyKUEFTGdJN7XJ6yKye3OaP/IoVFXQm53fX97N5pF34juHV4Ktr1VwD9j+ihXELLsaR9ScxSAkpwF3/mTBHQgd/IZUIIGoVsRNl4Xc/70kNEmnTCOXO6esbyp4rc1MF84QPLf0IZPRhyP/+jizdYiDY1q/jDpDhPFCScAbnZGFX+ew3wSKEVtWWZH+TEbESXOy+BqFJU320DlEFISdVbmiMarp3OTpWcxjvmf/qGx2+Ws4bXyPzFZ3vhR+IOblUP+WI621l/moI0IBjtphc5afDacO530YYBcc1hRcWJfnqRsQfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0yb5RkZj2d8C30xxnOo5QuUTJ8Vp9bu7MZ6egJkJZY=;
 b=kbf3spxchAaT0m3Xk1uad/d6tMaGcZcFeKgfRNY5H3OC2KquNY1ecVsqY8mO4DXEcS6tFIMoRp2/m0fJfrT1rLzE/1c0K75TnTtFZ2zGNbpuk7UYNViUj+Mdze183zj3id3rYwmYUV+4xYYaeG3vRJ6BsfnxA/BqAx9cEgiTllLe6OHtoQuwoBQjVJ2g4xV2FY2Ci/0SuE7lasdrYtQfxM8mgeCkM+WnOT8YGwrTNwU7genHLyntqa59tIKAFKUjj2+iR+NRYT97ZR2mg/A56YDx8txBIPRJvfiheFLGgTcqb7z3Y3a6FnjUwP5cUB8XgzUZG2SIo/VoUlXXOps+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0yb5RkZj2d8C30xxnOo5QuUTJ8Vp9bu7MZ6egJkJZY=;
 b=4cp9YA7xrwIxG1xf85QPLKX3ICdLrZemoW9IYyEPY7SDVPKgzmJwC4naPtiTxE7KrnTaX5XDd4zViXLH+alB6vTnVE2Jo5OI5od0Yu5JZSXa84D/CYxLJRlDwpB982kZ1aw01QMxhg3p+1XpVKn6z5y6bgjqUcw/GLxsI89uRuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 18:32:03 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 18:32:02 +0000
Message-ID: <bc7c80ab-4604-45d3-862e-6b7d0a2ea723@amd.com>
Date: Thu, 16 Jul 2026 13:31:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Defer DP tunnel teardown until display
 driver is ready
Content-Language: en-US
To: An Wu <an.wu@canonical.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, YehezkelShB@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anthony Wong <anthony.wong@canonical.com>
References: <20260527064121.173952-1-an.wu@canonical.com>
 <20260527064121.173952-2-an.wu@canonical.com>
 <20260527071445.GB3102@black.igk.intel.com>
 <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
 <20260528102934.GH3102@black.igk.intel.com>
 <CAO4Mv0aUjtc66AkPmsRyEFTiV5etNNXoBqocMyKpOfS7uKTVKQ@mail.gmail.com>
 <CAO4Mv0ZbazqxzM9Sjd9=7YzMzZs6w54SLkhq+NtragOau5-eAA@mail.gmail.com>
 <20260601070439.GO3102@black.igk.intel.com>
 <CAO4Mv0bnSd8Vm1raj5bnUqywkuKNjtM-W6zPr0dzGJDKwi0ZNQ@mail.gmail.com>
 <CAO4Mv0YdUm_36fJWrvqtGDp6nsQHJFteh_TKFjM31Exygj2-4w@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAO4Mv0YdUm_36fJWrvqtGDp6nsQHJFteh_TKFjM31Exygj2-4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0173.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::16) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b1df93-8421-4d56-163b-08dee36886d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|5023799004|11063799006|56012099006|6133799003|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Iz25fiuh82kfTkSIsSlEzuCt9Zok022w86ALeK4LkSnaSw4pQSxNnIy/VT5KEPAOx6k20VPoNE8A3pF73N3cm+YXZ712960L7oz1nABrOi/qN/aNNYNLzODlOF6tw0aR/Qtb9oAOIt7ktQreE93VNd8N+WMhdlRB6YXZ2r61Rw71dVSHC2df2NgLfuHPH0wQ6AUkrpXu+hgbOxWxQlFtoJFngsdNWj3ZJKWCjQRHZhOl78QpTaUxhvEBR532W+ZOZQ8+3pk6d+hL29A/Xk4kbPPSqeMhENjCOQ4ArHQobIkQFGXy4jWz/PWP9YA19PjAEjWrAcBqY9LM3co1XQSvlJotPk0kMIVZFE+J4tetoNRdgTmkxwlQssdqy4tOQyH7z3Te6XGl4DnHRl4YaiKArLM3w2g6eV0m/TaZlXxgHUiPgFv8X9Vi7+XujIDlT51agD2hi5CqbhkpETI39bIjuJw0Vlmj9sqVnqtwgbEoWQ67Ucrr1knfGIfHs09+b5dPRqc7D4adfpAGHxN3kT0bF1xj1YfbVLOj2eAP8UaRBKQMQvvwHgQcYctIC+JfnY5dPMd03rLbAgww5s3UdV+mH3hmJ2R2vpHkvwr+6cA07tcHsaQU2icWC2aTW9NT3OCz0ToDEoejdToD2Vx343BBa61ha7RFLbjoeHCBb0MvrrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(5023799004)(11063799006)(56012099006)(6133799003)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGljMmFYRHpjWXFEL05RYituMzlDYTlBWUdXT3doMVNtQjBYZWNRd1pzY3kw?=
 =?utf-8?B?U2VGL25CRXdLVnRGMWljMHBBa1I0RXFlUXRDcENjeTl4RXF5K1ppUTRlM0dO?=
 =?utf-8?B?dGJGZURVUWp0M3ozcjNkQWMwcTJDYjdpTHNlM2p0cmlSTWg4a1lRZ3pRRGt3?=
 =?utf-8?B?RzQzbW9aR3U3MGV5UUhRc0pNRGM2dkJ5b3Q4dUcrdnB5WGtJUTVqV0Z3ZHdZ?=
 =?utf-8?B?MW9SK2Z1WXJIOVNoaXJzTHpnS0x5TWRTRXNLWVhlY2JsamFnaFhFNnV0Wktk?=
 =?utf-8?B?Tys5Y3hyaUwxdS9KUHlCMzZWK2dmRTJEemgzUHRNQ0hOYVdPdHVxdVl3Wm5h?=
 =?utf-8?B?TWRMZXNNaUNNS0VqeUZVa0xFbThUWldkNEZ4bFZsZ0dOZFJ2ZFZHS2d2cE9B?=
 =?utf-8?B?TUdKbjc2RVBLM2FNQ0o4amlZQmRvRHRFeU1Yb2E2Z0MycnFpUyt6aGt3d21C?=
 =?utf-8?B?bzZzczExR1BMeWxBWWV3ck92YUdZZGdaYTlpL3V3Z3R1QkxGR1B1MDFGckFu?=
 =?utf-8?B?K2ZNMnJXcWVBVHliMDgzdkVxS3Jia21HN0lCblJOOUJ3TXlYOWJja0tGUWxq?=
 =?utf-8?B?YldtRGNGdWt2NlZpRi9WNkFzSWlSR1RtVEMvM3AveHl6dU9CRmpieHdTWTJN?=
 =?utf-8?B?MHhUNWlGeXQwWUpsQWxYMVFPcnNvRlFmVHU2dHZUYUJOWXZPajRsN0dTd1Yv?=
 =?utf-8?B?ZUMrQnV5czk5UlZLZHhiSlZSQmMzVEJ6V2VjblhRdXNGLzA4Ti8rMWV1VG9i?=
 =?utf-8?B?dXl1ZENTYzR5MVFBSjF1ZEhkdzhDRlk4M3psR2ZuNFdza2RMOC8wQ25jS25G?=
 =?utf-8?B?eVBXaENnbGtIYWtnY2NKczJCNmUya21va3BYblhDWFdzdk5YRTNSZU05aDRH?=
 =?utf-8?B?V2gyUVVMU3JnZUJXRWQwS0VLZXpFVlNyRFNoYnUvdWxISGQ4Z00rZTZtaElU?=
 =?utf-8?B?dkxqVlUzQThoL1M5VFRHNGJXZ1dqSXdWd1J4S3pDSk1oREh1SzVkeFBhOVRl?=
 =?utf-8?B?R3RhR3VKSTB1YVlUT0kxVkRXREVMUHVCNldlUmlwSUVweEIyTXp6TllvYlQ1?=
 =?utf-8?B?WDZnM1JPYjQ1WTgyZFZwMnNyLzVCR0k0LzExS1NGcTYvMDBiSStwUDdhTEZZ?=
 =?utf-8?B?V2F1MjU2YzVHMU90TG9IdDJMSnQrMWxrVFVLbTNIL2s1S2lDYnJSVW9aVTR0?=
 =?utf-8?B?d0U4NFBlQjgvWm5lemlDSjBQVE51R1lmVnFBQlJuOW9ocnNJeXlQMXdjUjRv?=
 =?utf-8?B?VDNpMysyVE9WK0p4U2VXZGFGTk53eksrM2o5NUFiMFg4YzNhQ2RSSDc4SmhE?=
 =?utf-8?B?OFR1VTNNSytjTUltT1hNU3ZnSEYwNmRsWVhZWjBJWmQvSzRyK3p0dW41U0M3?=
 =?utf-8?B?L0laMVgwcmNhSzBERTh1a1N1WkFnMlAwcmYwaXBlcGtkK1BzdUZZeEZxUXFW?=
 =?utf-8?B?ZVpCLzg2a1RYQ2FSbHp1TkFPaGt5ME1GVkswdzB4eVFubzdHQzlaUmJDMmQ1?=
 =?utf-8?B?c1dvSHlieitjWTdZTERHRVBUZHY4WWxkSll3QnIraFRBUUdLUkVyNElhaGdq?=
 =?utf-8?B?OWI0Z3R4M1psLzh4cTQydlZlY3JqS2V5Y2plUC9MNkt4c21YS2dvTjd0NU9n?=
 =?utf-8?B?d3UxSWVrYVF3UEVGMDdBS3AxQmI3S0hMZ0l1N1FVaERkakhmSXVyaXJXdFhC?=
 =?utf-8?B?SlByVmNMSHZQNnErN3JtN2FVakUxOU01SVpjQmdhUkpUMDQxNTAyczlLcWtW?=
 =?utf-8?B?dlRoTlZQZzdtOWdMU3RLb3E3ZEZYckc4T25GVURrdHZtbW5NWEk4cy96S2tj?=
 =?utf-8?B?eVJPNHVkWW84S3ovZSthTC93eFZHa1VWWXFCVHc0OGFvc2tySGtxWmRGVWJP?=
 =?utf-8?B?N0VjNURZQzlUOHhvMEJKN3RiTldLN3luN250YXo5UEcydXFteTR3d0ZuZThi?=
 =?utf-8?B?dWt6aG5vQnZveUkzOGhDR1JlVXpmbUZVYnBlN202R0o4d3B2bjg0QXJPQ1F4?=
 =?utf-8?B?U1l4S2dtK0ordUdZUk5rVktsMWVsbUZuaVJ0d1ZNZmhVTG5iUlkrSmdHekVE?=
 =?utf-8?B?NndpMFE2QUhZcWNCZkg2alBhT0JLK01aV05jQ0pWMmlZa0ZSL3MyY2dpTVZz?=
 =?utf-8?B?QWoyZTN6ZkY4dTlSZi9XZStoWGFlSE5YaTdoSVh5ZjAyc2xoNUNqRksyTjZj?=
 =?utf-8?B?Z3RVOWNaR0NhWmRmeVZJVUJKdnBnRUVVTjBHYjNnMHA3SzE4YnkxcnEzQ012?=
 =?utf-8?B?bVg3K09sZVNybVp6U1JSWlRlOTVMM3M4WTJTNW1PZzRLQUl0aVF5WEVzQko4?=
 =?utf-8?B?SUVCVXlyYWVHNFF3WHNYdWdteDRxb3JmL3BKTDdPOExXb1VVeklFQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b1df93-8421-4d56-163b-08dee36886d5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 18:32:02.1657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvWFFt9NmmVduiDn4UDF4xWqS2C/GSJrKx5aCFkUbT4J+EhNm1ckMzicWEVbJi0Pll0bdQbVMem9j8zcuh+W3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935

Hi,

I had a few thoughts while reading this thread I wanted to share.

1) Ubuntu builds the initramfs locally with dracut.

It should be possible to know at the time of building the initramfs 
which hardware is actually on the system and only include the modules 
you need to avoid this issue.

For example if you're on an I+N system you can avoid amdgpu and if 
you're on a pure I system you could avoid nouveau and amdgpu.  Does that 
help the size concerns for the initramfs?

2) Do you really need thunderbolt.ko in the initramfs for keyboards and 
the like to work?

I don't think so.  I thought x86 UEFI laptops have a pre-OS connection 
manager that will remain resident until the OS connection manager takes 
over.  I know this is the case for AMD, and I think this also applies to 
Intel.

3) Are you including boltd in the initramfs?

If not; you have a secondary problem you might not realize that defeats 
your entire goal of having USB keyboard connected to a dock working 
during LUKS.

If the keyboard is connected to a USB3 controller behind a TBT3 
controller the USB4 router topology gets reset when thunderbolt.ko 
loads.  This is because the firmware often doesn't reserve enough memory 
for hotpluggable PCIe devices.  Linux resets it and assigns enough 
memory for this to work.  This is the same thing that Windows does.

Well after that reset happens the TBT3 device won't be authorized 
meaning any PCIe topology behind it isn't authorized.  At runtime this 
is solved by boltd checking that the IOMMU is enabled (and was enabled 
Pre-BOO) in order to authorize the topology.

I've raised something about this in the past, but AFAICT no one in 
Ubuntu looked at it.

https://bugs.launchpad.net/ubuntu/+source/initramfs-tools/+bug/2078573

4) This patch may have been dropped upstream, but I still see it 
included in Ubuntu's kernel.

https://lists.ubuntu.com/archives/kernel-team/2026-June/168287.html

What happens with NPI hardware that doesn't have a display driver ready? 
  It seems like this is going to cause thunderbolt.ko to infinitely 
reschedule work looking for one, wasting CPU cycles and otherwise 
blocking CPU low power states.

Thus I don't think this is very good tech debt to adopt in Ubuntu's 
kernel when there are other technical solutions available to consider.

On 6/5/26 05:16, An Wu wrote:
> Hi Mika
>      After further consideration, we've decided to drop this patch and
> probably to note it as limitation. Really appreciate your patience and
> sorry for the noise.
> 
> BR
>      An
> 
> On Mon, Jun 1, 2026 at 4:18 PM An Wu <an.wu@canonical.com> wrote:
>>
>> Hi Mika
>>      We tried putting graphic modules into initramfs and the size
>> increased from 56 MB to over 200 MB. We will discuss with the team the
>> possibility of fixing this in userspace and follow up once we have a
>> clearer picture.
>> Really appreciate your time and patience.
>>
>> BR
>>      An
>>
>> On Mon, Jun 1, 2026 at 3:04 PM Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>>>
>>> Hi,
>>>
>>> On Mon, Jun 01, 2026 at 02:50:21PM +0800, An Wu wrote:
>>>> Hi Mika
>>>>
>>>> Another approach I considered is using register_module_notifier() to
>>>> detect when a display driver module is loaded, then retrigger the DP
>>>> tunnel setup. However, since struct module does not carry any device
>>>> class or subsystem metadata, there is no generic way to identify
>>>> whether a loaded module is a display driver. We would need to maintain
>>>> a hardcoded list of known GPU module names (i915, xe, amdgpu, etc.),
>>>> which is fragile and not scalable.
>>>
>>> Indeed. Perhaps not to try to solve this in the kernel and instead do this
>>> in userspace?
>>>
>>> Have you actually measured how much initramfs size "increases" if you do
>>> include the relevant graphics drivers and their dependencies?
> 

