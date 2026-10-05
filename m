Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013018.outbound.protection.outlook.com [40.93.196.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91831716D;
	Mon,  5 Oct 2026 19:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791229126; cv=fail; b=tFRZTEiH6rSCpQJ2V8kZaPzpPyo4sZya+vaacNthZ72tauhoQ4LGT9MujdNd25Pc7apuJ4kwnKMIaLa8tbVi8u2jPUFH5Bcm2051Nk2PmYM8ft4MD6M8rwj2kNd2DkPN7iUVQUPJFwvO927HCJRHZ3fsPNWtVpUuaC8zwSecdvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791229126; c=relaxed/simple;
	bh=S7dz/TDgs+PpxF3ZUxGDbaj1eB8dsxnORoy/UWogn0g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TcHpCHbes2aqbabEAah0EN8V4hVcYQIMkkSt1PuezGS788GTR79bX/WaWMmRkMS0TSS3f6AWuxqYV2JGpDW2RsMPm4OwDqt36K0hlnJvbRWR9B77UXQXlspht3nxc68Cj2wxM0hOJngvK88j+v9kz+y4WHM5KEOfHAPJpGT/AvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yA4iV0uI; arc=fail smtp.client-ip=40.93.196.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yA4iV0uI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRKUp2KFi7dyStx5IyzqVEELxBdMyjyt7eJ3IM98/Hok/UnLR/SotdWE3ZlS3brh4nsagJh6iM6vBXc2xuuqSF7QBR8Scb/ssVD/QI9G07T0cQSH4X7f9baXstKS5VIu+a9rFvfDPJxDp/2F89EFi3+dEafAvelUCiHgQsPcFp9Fz8O5rTV7jX481xGSbKACXhAi4+bvEy0ER6Etj8/Bg3q52EURM7SI4/k7RsJ69UCxn2CURFpx2UNUJLmFhXHhNcLdPBh/OMJmbaD2eS4ktQAnvHoWDyJ0Miwr3zbqhZtkF12ZYKpb4kChtbTnenWi9HbIsU4tghqsZzkWslwD0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnM105RhThHei28QZaGMoD33HwwS39tSk1pd2GqIKgA=;
 b=WzqKaFcWMsI92knIOzdTDouECuwGmaw2na+D26RKNC+C4jhpWL5vw6ZOqg/TQV+kHckeJfj6meFfzNuCt06Y1GhTShF29tKNeLEHRl825Kd9omkm7opjTSYqU8gIBENryRb0phLmSwqqMUQaJl+BQIZwRRlTEo+Asru3HkG5z97tKxvwQJ4wSQp0V2wyQ/uB4f25s3B/cfZsPMiPLgyzN0gRFvut2iZZT3n7yhsT7maTl+3q5lZyFch8rtjk7Oa/M+y0oYaVI7UV4yMn1bn57T+zMpwtT5279Xac74WWLY01VUyslIyAqoJ2RXhbOPA8e4qx94pkNL74rUrsJqsNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnM105RhThHei28QZaGMoD33HwwS39tSk1pd2GqIKgA=;
 b=yA4iV0uITsXiJPNPcb9ZaWewpboI239r9S6+gA2aa7F7mB4ozFce19MS9Ep0oKrKd1W3lra4Zher3TnjPTKYU9FW2chCp7DpgYGZlOjTOR60pOrWGwJ0Ic83TcULUiA7yVN6gip6GQgf91BE6hr/vWCssFvEe+HT3jSKnq8pcf0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS2PR12MB432622.namprd12.prod.outlook.com (2603:10b6:8:70b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 19:38:39 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 19:38:39 +0000
Message-ID: <396730a0-5a45-4509-b0fb-9b16229cf567@amd.com>
Date: Mon, 5 Oct 2026 14:38:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v2 2/3] thunderbolt: Reset the host interface before
 reusing a DMA HopID
Content-Language: en-US
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 Sanath S <Sanath.S@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20261005164718.4166200-1-Basavaraj.Natikar@amd.com>
 <20261005164718.4166200-3-Basavaraj.Natikar@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20261005164718.4166200-3-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::6)
 To PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS2PR12MB432622:EE_
X-MS-Office365-Filtering-Correlation-Id: b2f2006d-0cc3-47c2-d63e-08df23184162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|7416014|18002099003|22082099003|921020|5023799004|4143699003|56012099006|11063799006|10067099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0+CcvXOkg77bd+kVXSaGqDaeg32TUzpxofGhSnPx+8iPi0dKN/QAt9hmubuWtbGQ3FWMu9OoAHP+AUTXnHVmjwLV6CSRZZb8W9UUaGhyOnuCNYoDS0n7cJxIfZ4eWXe94Ny8kinVnKhKn4bMbDBsxysaL2j5VAZqGSI6kjp1YS2gL74nDNUmMX3+ofeAe9/Wpw15JDAEwaHUSnnOqfjqqSx2f70EYLu1Y2c7DkTNbtEgEul35PmWk9LQJ1zYy4aJztflXwGIN3XmouBxKv3jgAxNBGU02Ia5b7VVovzRb6Nm7ZlO85nyP/0h1kxNp6tpGETHaaxHVMw0dv8saksOWQ0sRxNZ07bRT64mdR1jP7UYKgeHHvVztnXMgUgyO1F5Ev3wKyuODF/VksnhiBEp4e4SgmqLFBwrOdEw/n2wNFYAH0EtO+LPIN6uHzT3G/nv/DLDsL8BjoWKxBC04MkuNGnV0q0eTVA4QX1eodErsjaj7sSmZDQ1KBOSYsFu/10avOM7DX/Excy7cXib2WwNdkvFQ9MTchHf3rBz8A7Tb2VUsGkXpycmZivPL+WimA16qQss2VJlrJlmTPFJm2vnztqBKQrOpExF7Ms9fO2X6HneHhP5RGQIArswyuGcEEkITV68eJzQnXMYswtdOlvR7vuWwVd8jrhH31xT5IBXyCw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(7416014)(18002099003)(22082099003)(921020)(5023799004)(4143699003)(56012099006)(11063799006)(10067099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFlCMVVKelp6NTNHU09NYzVFYnhqUkU1bkJDUXVmSE5TSHUrUkMzdUVuSjd6?=
 =?utf-8?B?ejZJNWNMajF4VFVucWlCQXNiUjBIb1pQQU1lcjYrL1g5RjI4UEJGZWlLL1NR?=
 =?utf-8?B?VTVhR3ZSN0o2eHdZaE5xamhyeE9XempzeXZxTCtTd2E1NHJuaDJ5MGFuQnAy?=
 =?utf-8?B?d2xNZW1STHZHNklXZ2U2cmt2VVA0dEZCT2x2cWpmU2k2Q0tkWlNYdTE1dzVp?=
 =?utf-8?B?TUk5VTlFaS85Y0JCaHB5YlIxZjZjQXI4SXdzQmIvdTJaczlNcFBLc01Pb08v?=
 =?utf-8?B?WTF6THJRRDhIbEtOWEJFRmMrR1I3cmtwZ0xCajZlSk9ZdUFBcXY2MEJkOHM4?=
 =?utf-8?B?K2twTm4vYytHV1RPeGJDLzNNSkxzeUxUL2x4SEkzM3V0SFRlQVNPODNzYXhZ?=
 =?utf-8?B?Vk1iOGYxbnBYdnkzNVBBTEtYdlltS3RNQnhqTVY3ZnhKU0tJQjlDRzEzSmd0?=
 =?utf-8?B?Q090QmNlSS9hNGt3V3VYZ0VyR3p4Mks3TzdVcUNCT2VCTE9ZTXZ6L3dXem1y?=
 =?utf-8?B?S3R6RHFTWlNIbFREUW9QSldLYzBHTlNPV0FSazYzdms3anRuYlZBY0h4N1Vp?=
 =?utf-8?B?NGlTN3B4ek5pdGo3Q3FJRXBrTkloUElGb3cwL082OWViV2FGaSt6TWlucE1X?=
 =?utf-8?B?ZXM4Q28vT2tuZUpHS1lzWHRCeDNYVy9CNnlyMDFQQnJ5cDA5NGd3V1lvNU1p?=
 =?utf-8?B?b2w5Zit4MWgyTkZ5MjltQW9XcUtuZ1JHOHkvVUFUMnMzRThSMGhqZGhmUlRX?=
 =?utf-8?B?OG5ITU8rNjZoZGJ6NkRpamJnR2Y1NitqeE9WZDJ4eU1OcGl5b3pONHEyRUR0?=
 =?utf-8?B?ZXhOaG1tYnp0b09ZSGJ6MUpDRVp2akVyOFFRTi80UGtWSnlDWDBqZ3ZTRE82?=
 =?utf-8?B?MTM4MTIzMzAxbjE0V2pNdU16MkRUVUlOUnhyU1o3S29QSXVrQTliVFZmUEZ2?=
 =?utf-8?B?VVZXaFAvdXRPaFRnVlB3cmlJeXhGYkhJM0lpRDg5N0xOb2tqUUhtdDlKdmdQ?=
 =?utf-8?B?czVRenYzSVptN0l0akgxS2JjVGdtMENBOEhaR2RjVkRYd1hCTU9pZE5RbjEz?=
 =?utf-8?B?Uy9XaXJBRktGSS9rUjdRZkYxSnV2bFFmbHc4TVdNNnl2bnQ2TTdKeEpqSGNK?=
 =?utf-8?B?K09HbUZqd3R6eURPTy9KK0FhSVVMQ3cyYTNaU1M4NmY2VFZQclR5QWJOY1Ew?=
 =?utf-8?B?djlxNXRGSk00NlBhbnUzaUZaS1NxMzIxLzhocHltYS9XaGJvL2xUTjVqdUJG?=
 =?utf-8?B?N1VRSmxIVmRQeGhjVkF0aCtmRHZHWGM3UEIvV1FhQXRSR1RPZHNsSW1hRG50?=
 =?utf-8?B?VUNCbTNhNnRvc3RibjhtckVoTFR0bW95T25NeGJ4RXI3bTllMGt3eWMxeSti?=
 =?utf-8?B?aVdBUjVkZmhCREQ1MDFWbGJMVG5tSEh6UGNrTjZVaVFQVjZRaVVsV1dDRE9O?=
 =?utf-8?B?dEpkRytzOFFGeEYvTkNyVlg5MmNVbHdNalBlMHFEUEJaN2xUcWRvN25ucUFM?=
 =?utf-8?B?LzFaeEdLQms1RVNRSEtXSzNuOU5QbThFbnZ1MUpYOW1WY2JVQWQyN1RNdG82?=
 =?utf-8?B?REo1THZUeHp4akIzaWdjNzhHTUdVOURwK1ZFQU4xeElNVXB6WUY0enN2dkZ2?=
 =?utf-8?B?dk1QaENldHJrSkkzZWpEbG1qRlhVamN3NzR2cjd2a0tSR1dJMGdoUWRxLzU3?=
 =?utf-8?B?cVFQY3BmbnFVRm5zak1WZW0reEd6a043aU5pWFg0eFVFdUd5YWR2T3dFWUNt?=
 =?utf-8?B?c2xrOXVKRkhxUDc0RnVkbXlzSWgyVWNaYkErejQrMTBXVHBtSVFrRk1KNytv?=
 =?utf-8?B?dEJ5Tmo1T1plN3ROZUF4dk94bVpya2IvVWMzZjlCM0EwT2ZzcGlqTWFiZndi?=
 =?utf-8?B?MFBrU3pLWkdhWDViSFNJTTlEMWtycnJtOEtReXJLeEttV3hUNEt3UFJBRXpQ?=
 =?utf-8?B?ek1BczJ1bkJNenJiVGdqTlVhdWJSQU16d0YvWWlBaWZod29PTTcvU093dlpj?=
 =?utf-8?B?WXlrV3VGRkZ2eFJvNWo1SjNGVTB0ckpVZW13Z29ZMWxwWTNJY0tNWGtLVWc0?=
 =?utf-8?B?SjFQTkd4bjRXdFQ1UHl6RGt1bjd6TW9RSkluR1N0cXVzTnM0dHc1TkNmUGw1?=
 =?utf-8?B?dVVEVityZGFEeHMxTEpvdVRFeGg4dnE3V2M4YWlRYVJORXJkek81SW1wMkl5?=
 =?utf-8?B?aHFIYk1oM3dZVk5PU3RKaGUxZlB2dXhhTHdtVVlnSnY3VSs0QjN6NGFyd3Bt?=
 =?utf-8?B?SUFQWEVCSzM0bU5BRFdKTHE0WHUreTVYZ21BcS9LSFRrYzlQNnJWbk5mZ2Uw?=
 =?utf-8?Q?8L1dQtTKzjh6bSarFS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2f2006d-0cc3-47c2-d63e-08df23184162
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 19:38:39.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiuS2EXiSAwiewv0dtbe56fjallLsz7tq/GEMmb96Iru1sTpL3dSMwzp/i2b675uqzPrytb0zDpPWfxXE/blFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB432622



On 10/5/26 11:47, Basavaraj Natikar wrote:
> Reusing a DMA HopID without an intervening host interface reset can hang
> the TX ring on some host routers. Resetting on every DMA tunnel teardown
> clears the state but, as the reset affects all rings, also disturbs
> unrelated active tunnels.
> 
> Hence, track the DMA HopIDs programmed since the last reset, prefer unused
> HopIDs when allocating rings, and check for reuse at tb_ring_start() too,
> since networking retains its rings across reconnect. Return -EAGAIN instead
> of programming a HopID that still needs a reset.
> 
> Run the reset from a work item once all DMA rings are idle: serialize it
> with the connection manager, stop the control channel around it, and block
> DMA rings from starting during the reset. Fence the work across domain
> removal and PM transitions, preserve live DMA rings across freeze/thaw, and
> restore the interrupt-mask shadow under the NHI lock after the reset.
> 
> On -EAGAIN, retry the networking login asynchronously and block the work
> producers before teardown cancels the workers. Keep peer disconnection
> separate from administrative shutdown so it cannot reopen the login gate,
> while stream and DMA-test callers unwind immediately and return the error
> to userspace.
> 
> Enable this only for reset-capable host interfaces marked with
> QUIRK_RESET_DMA_ON_REUSE. A competing DMA tunnel must stop before its dirty
> HopID can be reused, and retrying does not interrupt that tunnel.
> 
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Link: https://lore.kernel.org/linux-usb/20260831130638.GK124825@black.igk.intel.com/T/#m668c2efcfe2f298632537721d72b17445b39211a
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   Documentation/admin-guide/thunderbolt.rst |   6 +
>   drivers/net/thunderbolt/main.c            | 106 +++++++----
>   drivers/thunderbolt/ctl.c                 |  13 ++
>   drivers/thunderbolt/ctl.h                 |   1 +
>   drivers/thunderbolt/domain.c              |  84 +++++++--
>   drivers/thunderbolt/nhi.c                 | 215 ++++++++++++++++++++--
>   drivers/thunderbolt/nhi.h                 |   2 +-
>   include/linux/thunderbolt.h               |  20 ++
>   8 files changed, 371 insertions(+), 76 deletions(-)
> 
> diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
> index ff25fe853706..5595d307ac86 100644
> --- a/Documentation/admin-guide/thunderbolt.rst
> +++ b/Documentation/admin-guide/thunderbolt.rst
> @@ -410,6 +410,12 @@ transfer data::
>     host2 # cat /dev/tbstream0
>     host1 # dmesg > /dev/tbstream0
>   
> +On affected host interfaces a DMA HopID cannot be reused until the host
> +interface has been reset. Opening a stream or starting a DMA test can return
> +``EAGAIN`` until all other DMA tunnels stop and the reset completes. Retry
> +the complete operation; it does not interrupt an active networking tunnel.
> +If stream resume fails, close and reopen the stream to retry setup.
> +
>   Once you are done with the stream you can remove them::
>   
>     host2 # cd /sys/kernel/config/thunderbolt/stream
> diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
> index 93ccccc5cf8b..f2dbb6fb30c6 100644
> --- a/drivers/net/thunderbolt/main.c
> +++ b/drivers/net/thunderbolt/main.c
> @@ -160,6 +160,9 @@ struct tbnet_ring {
>    * @login_sent: ThunderboltIP login message successfully sent
>    * @login_received: ThunderboltIP login message received from the remote
>    *		    host
> + * @stopping: Administrative teardown blocks all connection work
> + * @disconnecting: Peer logout blocks login until teardown completes
> + * @connected: DMA rings and paths were successfully enabled
>    * @local_transmit_path: HopID we are using to send out packets
>    * @remote_transmit_path: HopID the other end is using to send packets to us
>    * @connection_lock: Lock serializing access to @login_sent,
> @@ -190,6 +193,9 @@ struct tbnet {
>   	atomic_t command_id;
>   	bool login_sent;
>   	bool login_received;
> +	bool stopping;
> +	bool disconnecting;
> +	bool connected;
>   	int local_transmit_path;
>   	int remote_transmit_path;
>   	struct mutex connection_lock;
> @@ -311,17 +317,21 @@ static void start_login(struct tbnet *net)
>   {
>   	netdev_dbg(net->dev, "login started\n");
>   
> -	mutex_lock(&net->connection_lock);
> +	guard(mutex)(&net->connection_lock);
>   	net->login_sent = false;
>   	net->login_received = false;
> -	mutex_unlock(&net->connection_lock);
> -
> +	net->stopping = false;
> +	net->disconnecting = false;
>   	queue_delayed_work(system_long_wq, &net->login_work,
>   			   msecs_to_jiffies(1000));
>   }
>   
>   static void stop_login(struct tbnet *net)
>   {
> +	scoped_guard(mutex, &net->connection_lock)
> +		net->stopping = true;
> +
> +	cancel_work_sync(&net->disconnect_work);
>   	cancel_delayed_work_sync(&net->login_work);
>   	cancel_work_sync(&net->connected_work);
>   
> @@ -371,11 +381,7 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
>   	netif_carrier_off(net->dev);
>   	netif_stop_queue(net->dev);
>   
> -	stop_login(net);
> -
> -	mutex_lock(&net->connection_lock);
> -
> -	if (net->login_sent && net->login_received) {
> +	if (net->connected) {
>   		int ret, retries = TBNET_LOGOUT_RETRIES;
>   
>   		while (send_logout && retries-- > 0) {
> @@ -413,13 +419,13 @@ static void tbnet_tear_down(struct tbnet *net, bool send_logout)
>   		net->remote_transmit_path = 0;
>   	}
>   
> +	guard(mutex)(&net->connection_lock);
> +	net->connected = false;
>   	net->login_retries = 0;
>   	net->login_sent = false;
>   	net->login_received = false;
>   
>   	netdev_dbg(net->dev, "network traffic stopped\n");
> -
> -	mutex_unlock(&net->connection_lock);
>   }
>   
>   static int tbnet_handle_packet(const void *buf, size_t size, void *data)
> @@ -459,7 +465,11 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
>   		if (!ret) {
>   			netdev_dbg(net->dev, "remote login response sent\n");
>   
> -			mutex_lock(&net->connection_lock);
> +			guard(mutex)(&net->connection_lock);
> +			if (net->stopping || net->disconnecting ||
> +			    (net->login_received &&
> +			     net->remote_transmit_path != pkg->transmit_path))
> +				break;
>   			net->login_received = true;
>   			net->remote_transmit_path = pkg->transmit_path;
>   
> @@ -473,8 +483,6 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
>   				queue_delayed_work(system_long_wq,
>   						   &net->login_work, 0);
>   			}
> -			mutex_unlock(&net->connection_lock);
> -
>   			queue_work(system_long_wq, &net->connected_work);
>   		}
>   		break;
> @@ -484,7 +492,12 @@ static int tbnet_handle_packet(const void *buf, size_t size, void *data)
>   		ret = tbnet_logout_response(net, route, sequence, command_id);
>   		if (!ret) {
>   			netdev_dbg(net->dev, "remote logout response sent\n");
> -			queue_work(system_long_wq, &net->disconnect_work);
> +			guard(mutex)(&net->connection_lock);
> +			if (netif_running(net->dev) && !net->stopping &&
> +			    !net->disconnecting) {
> +				net->disconnecting = true;
> +				queue_work(system_long_wq, &net->disconnect_work);
> +			}
>   		}
>   		break;
>   
> @@ -644,9 +657,9 @@ static void tbnet_connected_work(struct work_struct *work)
>   	if (netif_carrier_ok(net->dev))
>   		return;
>   
> -	mutex_lock(&net->connection_lock);
> -	connected = net->login_sent && net->login_received;
> -	mutex_unlock(&net->connection_lock);
> +	scoped_guard(mutex, &net->connection_lock)
> +		connected = !net->stopping && !net->disconnecting &&
> +			    net->login_sent && net->login_received;
>   
>   	if (!connected)
>   		return;
> @@ -697,8 +710,13 @@ static void tbnet_connected_work(struct work_struct *work)
>   		goto err_free_tx_buffers;
>   	}
>   
> -	netif_carrier_on(net->dev);
> -	netif_start_queue(net->dev);
> +	scoped_guard(mutex, &net->connection_lock) {
> +		net->connected = true;
> +		if (!net->stopping && !net->disconnecting) {
> +			netif_carrier_on(net->dev);
> +			netif_start_queue(net->dev);
> +		}
> +	}
>   
>   	netdev_dbg(net->dev, "network traffic started\n");
>   	return;
> @@ -714,24 +732,34 @@ static void tbnet_connected_work(struct work_struct *work)
>   err_release_hopid:
>   	tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
>   	tbnet_connect_failed(net);
> +	if (ret == -EAGAIN) {
> +		guard(mutex)(&net->connection_lock);
> +		if (!net->stopping && !net->disconnecting)
> +			queue_delayed_work(system_long_wq, &net->login_work,
> +					   msecs_to_jiffies(TBNET_LOGIN_DELAY));
> +	}
>   }
>   
>   static void tbnet_login_work(struct work_struct *work)
>   {
>   	struct tbnet *net = container_of(work, typeof(*net), login_work.work);
>   	unsigned long delay = msecs_to_jiffies(TBNET_LOGIN_DELAY);
> -	int ret;
> -
> -	if (netif_carrier_ok(net->dev))
> -		return;
> +	int ret, retries;
>   
> -	netdev_dbg(net->dev, "sending login request, retries=%u\n",
> -		   net->login_retries);
> +	scoped_guard(mutex, &net->connection_lock) {
> +		if (net->stopping || net->disconnecting || net->connected)
> +			return;
> +		retries = net->login_retries;
> +	}
>   
> -	ret = tbnet_login_request(net, net->login_retries % 4);
> +	netdev_dbg(net->dev, "sending login request, retries=%u\n", retries);
> +	ret = tbnet_login_request(net, retries % 4);
>   	if (ret) {
>   		netdev_dbg(net->dev, "sending login request failed, ret=%d\n",
>   			   ret);
> +		guard(mutex)(&net->connection_lock);
> +		if (net->stopping || net->disconnecting)
> +			return;
>   		if (net->login_retries++ < TBNET_LOGIN_RETRIES) {
>   			queue_delayed_work(system_long_wq, &net->login_work,
>   					   delay);
> @@ -741,13 +769,12 @@ static void tbnet_login_work(struct work_struct *work)
>   	} else {
>   		netdev_dbg(net->dev, "received login reply\n");
>   
> -		net->login_retries = 0;
> -
> -		mutex_lock(&net->connection_lock);
> -		net->login_sent = true;
> -		mutex_unlock(&net->connection_lock);
> -
> -		queue_work(system_long_wq, &net->connected_work);
> +		guard(mutex)(&net->connection_lock);
> +		if (!net->stopping && !net->disconnecting) {
> +			net->login_retries = 0;
> +			net->login_sent = true;
> +			queue_work(system_long_wq, &net->connected_work);
> +		}
>   	}
>   }
>   
> @@ -755,7 +782,11 @@ static void tbnet_disconnect_work(struct work_struct *work)
>   {
>   	struct tbnet *net = container_of(work, typeof(*net), disconnect_work);
>   
> +	cancel_delayed_work_sync(&net->login_work);
> +	cancel_work_sync(&net->connected_work);
>   	tbnet_tear_down(net, false);
> +	guard(mutex)(&net->connection_lock);
> +	net->disconnecting = false;
>   }
>   
>   static bool tbnet_check_frame(struct tbnet *net, const struct tbnet_frame *tf,
> @@ -1008,9 +1039,8 @@ static int tbnet_stop(struct net_device *dev)
>   {
>   	struct tbnet *net = netdev_priv(dev);
>   
> +	stop_login(net);
>   	napi_disable(&net->napi);
> -
> -	cancel_work_sync(&net->disconnect_work);
>   	tbnet_tear_down(net, true);
>   
>   	tb_ring_free(net->rx_ring.ring);
> @@ -1397,6 +1427,7 @@ static int tbnet_probe(struct tb_service *svc)
>   	net->svc = svc;
>   	net->dev = dev;
>   	net->xd = xd;
> +	net->stopping = true;
>   
>   	tbnet_generate_mac(dev);
>   
> @@ -1456,7 +1487,10 @@ static void tbnet_remove(struct tb_service *svc)
>   
>   static void tbnet_shutdown(struct tb_service *svc)
>   {
> -	tbnet_tear_down(tb_service_get_drvdata(svc), true);
> +	struct tbnet *net = tb_service_get_drvdata(svc);
> +
> +	stop_login(net);
> +	tbnet_tear_down(net, true);
>   }
>   
>   static int tbnet_suspend(struct device *dev)
> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index ef98ef83fd61..bbd31b1e35e7 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c
> @@ -780,6 +780,19 @@ void tb_ctl_stop(struct tb_ctl *ctl)
>   	tb_ctl_dbg(ctl, "control channel stopped\n");
>   }
>   
> +/* Close the enqueue gate only after all existing requests have drained. */
> +bool tb_ctl_stop_if_idle(struct tb_ctl *ctl)
> +{
> +	scoped_guard(mutex, &ctl->request_queue_lock) {
> +		if (!ctl->running || !list_empty(&ctl->request_queue))
> +			return false;
> +		ctl->running = false;
> +	}
> +
> +	tb_ctl_stop(ctl);
> +	return true;
> +}
> +
>   /* public interface, commands */
>   
>   /**
> diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
> index db1646eb4fd0..a88c61fd628a 100644
> --- a/drivers/thunderbolt/ctl.h
> +++ b/drivers/thunderbolt/ctl.h
> @@ -25,6 +25,7 @@ struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
>   			    event_cb cb, void *cb_data);
>   void tb_ctl_start(struct tb_ctl *ctl);
>   void tb_ctl_stop(struct tb_ctl *ctl);
> +bool tb_ctl_stop_if_idle(struct tb_ctl *ctl);
>   void tb_ctl_free(struct tb_ctl *ctl);
>   
>   /* configuration commands */
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 12c88509a54f..c34f12487b9e 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -314,11 +314,20 @@ const struct bus_type tb_bus_type = {
>   	.shutdown = tb_service_shutdown,
>   };
>   
> +/* Reset work needs tb->lock to finish. */
> +static void tb_domain_cancel_nhi_reset(struct tb *tb)
> +{
> +	lockdep_assert_not_held(&tb->lock);
> +	cancel_delayed_work_sync(&tb->nhi->reset_work);
> +}
> +
>   static void tb_domain_release(struct device *dev)
>   {
>   	struct tb *tb = container_of(dev, struct tb, dev);
>   	struct tb_nhi *nhi = tb->nhi;
>   
> +	/* The host interface reset runs against this domain */
> +	tb_domain_cancel_nhi_reset(tb);
>   	tb_ctl_free(tb->ctl);
>   	destroy_workqueue(tb->wq);
>   	ida_free(&tb_domain_ida, tb->index);
> @@ -505,8 +514,14 @@ void tb_domain_remove(struct tb *tb)
>   		tb->cm_ops->stop(tb);
>   	/* Stop the domain control traffic */
>   	tb_ctl_stop(tb->ctl);
> +	/* Keep reset_work from restarting it again below */
> +	scoped_guard(spinlock_irq, &tb->nhi->lock) {
> +		if (tb->nhi->dma_hops_used)
> +			tb->nhi->removing = true;
> +	}
>   	mutex_unlock(&tb->lock);
>   
> +	tb_domain_cancel_nhi_reset(tb);
>   	flush_workqueue(tb->wq);
>   
>   	if (tb->cm_ops->deinit)
> @@ -535,10 +550,24 @@ int tb_domain_suspend_noirq(struct tb *tb)
>   	mutex_lock(&tb->lock);
>   	if (tb->cm_ops->suspend_noirq)
>   		ret = tb->cm_ops->suspend_noirq(tb);
> -	if (!ret)
> +	if (!ret) {
> +		/* Keep reset_work from restarting the control channel below */
> +		scoped_guard(spinlock_irq, &tb->nhi->lock) {
> +			if (tb->nhi->dma_hops_used)
> +				tb->nhi->suspended = true;
> +		}
>   		tb_ctl_stop(tb->ctl);
> +	}
>   	mutex_unlock(&tb->lock);
>   
> +	/*
> +	 * Make sure a host interface reset queued by cm_ops->suspend_noirq()
> +	 * tearing down a DMA tunnel above either finishes or is cancelled
> +	 * outright before the NHI is powered down below - either outcome
> +	 * is fine since a dirty bitmap is handled again on resume.
> +	 */
> +	tb_domain_cancel_nhi_reset(tb);
> +
>   	return ret;
>   }
>   
> @@ -556,6 +585,10 @@ int tb_domain_resume_noirq(struct tb *tb)
>   	int ret = 0;
>   
>   	mutex_lock(&tb->lock);
> +	scoped_guard(spinlock_irq, &tb->nhi->lock) {
> +		if (tb->nhi->dma_hops_used)
> +			tb->nhi->suspended = false;
> +	}
>   	tb_ctl_start(tb->ctl);
>   	if (tb->cm_ops->resume_noirq)
>   		ret = tb->cm_ops->resume_noirq(tb);
> @@ -576,10 +609,18 @@ int tb_domain_freeze_noirq(struct tb *tb)
>   	mutex_lock(&tb->lock);
>   	if (tb->cm_ops->freeze_noirq)
>   		ret = tb->cm_ops->freeze_noirq(tb);
> -	if (!ret)
> +	if (!ret) {
> +		/* Keep reset_work from restarting the control channel below */
> +		scoped_guard(spinlock_irq, &tb->nhi->lock) {
> +			if (tb->nhi->dma_hops_used)
> +				tb->nhi->suspended = true;
> +		}
>   		tb_ctl_stop(tb->ctl);
> +	}
>   	mutex_unlock(&tb->lock);
>   
> +	tb_domain_cancel_nhi_reset(tb);
> +
>   	return ret;
>   }
>   
> @@ -588,6 +629,10 @@ int tb_domain_thaw_noirq(struct tb *tb)
>   	int ret = 0;
>   
>   	mutex_lock(&tb->lock);
> +	scoped_guard(spinlock_irq, &tb->nhi->lock) {
> +		if (tb->nhi->dma_hops_used)
> +			tb->nhi->suspended = false;
> +	}
>   	tb_ctl_start(tb->ctl);
>   	if (tb->cm_ops->thaw_noirq)
>   		ret = tb->cm_ops->thaw_noirq(tb);
> @@ -609,13 +654,30 @@ int tb_domain_runtime_suspend(struct tb *tb)
>   		if (ret)
>   			return ret;
>   	}
> +
> +	/* Keep reset_work from restarting the control channel below */
> +	mutex_lock(&tb->lock);
> +	scoped_guard(spinlock_irq, &tb->nhi->lock) {
> +		if (tb->nhi->dma_hops_used)
> +			tb->nhi->suspended = true;
> +	}
>   	tb_ctl_stop(tb->ctl);
> +	mutex_unlock(&tb->lock);
> +
> +	tb_domain_cancel_nhi_reset(tb);
> +
>   	return 0;
>   }
>   
>   int tb_domain_runtime_resume(struct tb *tb)
>   {
> +	mutex_lock(&tb->lock);
> +	scoped_guard(spinlock_irq, &tb->nhi->lock) {
> +		if (tb->nhi->dma_hops_used)
> +			tb->nhi->suspended = false;
> +	}
>   	tb_ctl_start(tb->ctl);
> +	mutex_unlock(&tb->lock);
>   	if (tb->cm_ops->runtime_resume) {
>   		int ret = tb->cm_ops->runtime_resume(tb);
>   		if (ret)
> @@ -788,21 +850,6 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   			transmit_ring, receive_path, receive_ring);
>   }
>   
> -static void tb_domain_reset_interface(struct tb *tb)
> -{
> -	struct tb_nhi *nhi = tb->nhi;
> -
> -	if (!nhi->ops->reset_interface)
> -		return;
> -
> -	guard(mutex)(&tb->lock);
> -
> -	/* The reset clears the ring state so stop the control channel */
> -	tb_ctl_stop(tb->ctl);
> -	nhi->ops->reset_interface(nhi);
> -	tb_ctl_start(tb->ctl);
> -}
> -
>   /**
>    * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
>    * @tb: Domain disabling the DMA paths
> @@ -835,9 +882,6 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>   	if (ret)
>   		return ret;
>   
> -	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
> -		tb_domain_reset_interface(tb);
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index c44ec3aa04c5..461d39410740 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -174,7 +174,8 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
>   /*
>    * nhi_disable_interrupts() - disable interrupts for all rings
>    *
> - * Use only during init and shutdown.
> + * During runtime reset the caller must hold nhi->lock.
> + * Init and shutdown callers must exclude concurrent ring operations.
>    */
>   void nhi_disable_interrupts(struct tb_nhi *nhi)
>   {
> @@ -512,7 +513,8 @@ void tb_ring_poll_complete(struct tb_ring *ring)
>   
>   	spin_lock_irqsave(&ring->nhi->lock, flags);
>   	spin_lock(&ring->lock);
> -	if (ring->start_poll)
> +	if (ring->start_poll && ring->running && !ring->nhi->resetting &&
> +	    !ring->nhi->going_away)
>   		__ring_interrupt_mask(ring, false);
>   	spin_unlock(&ring->lock);
>   	spin_unlock_irqrestore(&ring->nhi->lock, flags);
> @@ -548,6 +550,84 @@ irqreturn_t ring_msix(int irq, void *data)
>   	return IRQ_HANDLED;
>   }
>   
> +static bool ring_is_dma(const struct tb_ring *ring)
> +{
> +	return ring->hop >= RING_FIRST_USABLE_HOPID;
> +}
> +
> +/* TX and RX HopIDs are tracked separately */
> +static unsigned int nhi_dma_hops_bits(const struct tb_nhi *nhi)
> +{
> +	return 2 * nhi->hop_count;
> +}
> +
> +static unsigned int nhi_hop_bit(const struct tb_nhi *nhi, bool is_tx,
> +				unsigned int hop)
> +{
> +	return is_tx ? hop : nhi->hop_count + hop;
> +}
> +
> +/* Returns %true if a DMA HopID has been programmed since the last reset */
> +static bool nhi_dma_hops_dirty(const struct tb_nhi *nhi)
> +{
> +	return nhi->dma_hops_used &&
> +	       !bitmap_empty(nhi->dma_hops_used, nhi_dma_hops_bits(nhi));
> +}
> +
> +/* Returns %true if the HopID of @ring cannot be programmed again yet */
> +static bool ring_needs_reset(const struct tb_ring *ring)
> +{
> +	const struct tb_nhi *nhi = ring->nhi;
> +
> +	lockdep_assert_held(&nhi->lock);
> +
> +	if (!nhi->dma_hops_used || !ring_is_dma(ring))
> +		return false;
> +
> +	return test_bit(nhi_hop_bit(nhi, ring->is_tx, ring->hop),
> +			nhi->dma_hops_used);
> +}
> +
> +static bool nhi_dma_rings_running(const struct tb_nhi *nhi)
> +{
> +	unsigned int i;
> +
> +	lockdep_assert_held(&nhi->lock);
> +
> +	/* ring->running is only updated under nhi->lock */
> +	for (i = RING_FIRST_USABLE_HOPID; i < nhi->hop_count; i++) {
> +		if (nhi->tx_rings[i] && nhi->tx_rings[i]->running)
> +			return true;
> +		if (nhi->rx_rings[i] && nhi->rx_rings[i]->running)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int nhi_find_hop(const struct tb_nhi *nhi, const struct tb_ring *ring,
> +			unsigned int start_hop, bool skip_used)
> +{
> +	unsigned int i;
> +
> +	lockdep_assert_held(&nhi->lock);
> +
> +	for (i = start_hop; i < nhi->hop_count; i++) {
> +		if (skip_used && test_bit(nhi_hop_bit(nhi, ring->is_tx, i),
> +					  nhi->dma_hops_used))
> +			continue;
> +		if (ring->is_tx) {
> +			if (!nhi->tx_rings[i])
> +				return i;
> +		} else {
> +			if (!nhi->rx_rings[i])
> +				return i;
> +		}
> +	}
> +
> +	return -EBUSY;
> +}
> +
>   static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
>   {
>   	unsigned int start_hop = RING_FIRST_USABLE_HOPID;
> @@ -565,25 +645,20 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
>   	spin_lock_irq(&nhi->lock);
>   
>   	if (ring->hop < 0) {
> -		unsigned int i;
> +		int hop;
>   
>   		/*
>   		 * Automatically allocate HopID from the non-reserved
> -		 * range 1 .. hop_count - 1.
> +		 * range 1 .. hop_count - 1, preferring the ones that do
> +		 * not need a host interface reset first.
>   		 */
> -		for (i = start_hop; i < nhi->hop_count; i++) {
> -			if (ring->is_tx) {
> -				if (!nhi->tx_rings[i]) {
> -					ring->hop = i;
> -					break;
> -				}
> -			} else {
> -				if (!nhi->rx_rings[i]) {
> -					ring->hop = i;
> -					break;
> -				}
> -			}
> -		}
> +		hop = -EBUSY;
> +		if (nhi->dma_hops_used)
> +			hop = nhi_find_hop(nhi, ring, start_hop, true);
> +		if (hop < 0)
> +			hop = nhi_find_hop(nhi, ring, start_hop, false);
> +		if (hop >= 0)
> +			ring->hop = hop;
>   	}
>   
>   	if (ring->hop > 0 && ring->hop < start_hop) {
> @@ -732,6 +807,47 @@ struct tb_ring *tb_ring_alloc_rx(struct tb_nhi *nhi, int hop, int size,
>   }
>   EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);
>   
> +/* Cancel only through tb_domain_cancel_nhi_reset(), outside tb->lock. */
> +static void nhi_reset_work(struct work_struct *work)
> +{
> +	struct tb_nhi *nhi = container_of(to_delayed_work(work), struct tb_nhi,
> +					  reset_work);
> +	struct tb *tb = dev_get_drvdata(nhi->dev);
> +
> +	/* The connection manager must be blocked over the reset */
> +	guard(mutex)(&tb->lock);
> +
> +	scoped_guard(spinlock_irq, &nhi->lock) {
> +		if (nhi->going_away || nhi->removing || nhi->suspended)
> +			return;
> +		if (bitmap_empty(nhi->dma_hops_used, nhi_dma_hops_bits(nhi)))
> +			return;
> +		if (nhi_dma_rings_running(nhi))
> +			return;
> +
> +		/* Keep the DMA rings from starting over the reset */
> +		nhi->resetting = true;
> +	}
> +
> +	if (!tb_ctl_stop_if_idle(tb->ctl)) {
> +		scoped_guard(spinlock_irq, &nhi->lock) {
> +			nhi->resetting = false;
> +			queue_delayed_work(system_long_wq, &nhi->reset_work,
> +					   msecs_to_jiffies(100));
> +		}
> +		return;
> +	}
> +	nhi->ops->reset_interface(nhi);
> +	scoped_guard(spinlock_irqsave, &nhi->lock)
> +		nhi_disable_interrupts(nhi);
> +	tb_ctl_start(tb->ctl);

Don't you need a request_queue_lock() here?

Since this reset path can run concurrently with tbnet_login_work()?

> +
> +	scoped_guard(spinlock_irq, &nhi->lock) {
> +		bitmap_zero(nhi->dma_hops_used, nhi_dma_hops_bits(nhi));
> +		nhi->resetting = false;
> +	}
> +}
> +
>   /**
>    * tb_ring_start() - enable a ring
>    * @ring: Ring to start
> @@ -748,7 +864,7 @@ int tb_ring_start(struct tb_ring *ring)
>   
>   	spin_lock_irq(&ring->nhi->lock);
>   	spin_lock(&ring->lock);
> -	if (ring->nhi->going_away) {
> +	if (ring->nhi->going_away || ring->nhi->removing) {
>   		ret = -ENODEV;
>   		goto err;
>   	}
> @@ -757,6 +873,16 @@ int tb_ring_start(struct tb_ring *ring)
>   		ret = -EBUSY;
>   		goto err;
>   	}
> +	if (ring->nhi->dma_hops_used && ring_is_dma(ring) &&
> +	    (ring->nhi->suspended || ring->nhi->resetting ||
> +	     ring_needs_reset(ring))) {
> +		ret = -EAGAIN;
> +		if (!ring->nhi->suspended && !ring->nhi->resetting &&
> +		    !nhi_dma_rings_running(ring->nhi))
> +			queue_delayed_work(system_long_wq,
> +					   &ring->nhi->reset_work, 0);
> +		goto err;
> +	}
>   	dev_dbg(ring->nhi->dev, "starting %s %d\n",
>   		RING_TYPE(ring), ring->hop);
>   
> @@ -809,6 +935,9 @@ int tb_ring_start(struct tb_ring *ring)
>   	if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
>   		ring_interrupt_active(ring, true);
>   	ring->running = true;
> +	if (ring->nhi->dma_hops_used && ring_is_dma(ring))
> +		__set_bit(nhi_hop_bit(ring->nhi, ring->is_tx, ring->hop),
> +			  ring->nhi->dma_hops_used);
>   err:
>   	spin_unlock(&ring->lock);
>   	spin_unlock_irq(&ring->nhi->lock);
> @@ -881,6 +1010,11 @@ void tb_ring_stop(struct tb_ring *ring)
>   	ring->notify_pending = false;
>   	ring->running = false;
>   
> +	if (ring->nhi->dma_hops_used && ring_is_dma(ring) &&
> +	    !ring->nhi->removing && !ring->nhi->suspended &&
> +	    !nhi_dma_rings_running(ring->nhi))
> +		queue_delayed_work(system_long_wq, &ring->nhi->reset_work, 0);
> +
>   err:
>   	spin_unlock(&ring->lock);
>   	spin_unlock_irq(&ring->nhi->lock);
> @@ -1113,10 +1247,30 @@ static int nhi_freeze_noirq(struct device *dev)
>   	return tb_domain_freeze_noirq(tb);
>   }
>   
> +static void nhi_reset_if_idle(struct tb_nhi *nhi)
> +{
> +	scoped_guard(spinlock_irq, &nhi->lock) {
> +		if (nhi->going_away || nhi->removing ||
> +		    !nhi_dma_hops_dirty(nhi) || nhi_dma_rings_running(nhi))
> +			return;
> +		nhi->resetting = true;
> +	}
> +
> +	nhi->ops->reset_interface(nhi);
> +	scoped_guard(spinlock_irqsave, &nhi->lock)
> +		nhi_disable_interrupts(nhi);
> +	scoped_guard(spinlock_irq, &nhi->lock) {
> +		bitmap_zero(nhi->dma_hops_used, nhi_dma_hops_bits(nhi));
> +		nhi->resetting = false;
> +	}
> +}
> +
>   static int nhi_thaw_noirq(struct device *dev)
>   {
>   	struct tb *tb = dev_get_drvdata(dev);
>   
> +	/* Freeze can preserve live DMA rings. */
> +	nhi_reset_if_idle(tb->nhi);
>   	return tb_domain_thaw_noirq(tb);
>   }
>   
> @@ -1161,6 +1315,8 @@ static int nhi_resume_noirq(struct device *dev)
>   			return ret;
>   	}
>   
> +	nhi_reset_if_idle(nhi);
> +
>   	return tb_domain_resume_noirq(tb);
>   }
>   
> @@ -1216,6 +1372,8 @@ static int nhi_runtime_resume(struct device *dev)
>   			return ret;
>   	}
>   
> +	nhi_reset_if_idle(nhi);
> +
>   	return tb_domain_runtime_resume(tb);
>   }
>   
> @@ -1339,6 +1497,7 @@ int nhi_probe(struct tb_nhi *nhi)
>   {
>   	struct device *dev = nhi->dev;
>   	struct tb *tb;
> +	u32 caps;
>   	int res;
>   
>   	if (!nhi->ops)
> @@ -1347,7 +1506,8 @@ int nhi_probe(struct tb_nhi *nhi)
>   	if (!nhi->ops->init_interrupts)
>   		return dev_err_probe(dev, -EINVAL, "missing required NHI ops\n");
>   
> -	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
> +	caps = ioread32(nhi->iobase + REG_CAPS);
> +	nhi->hop_count = caps & 0x3ff;
>   	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
>   
>   	nhi->tx_rings = devm_kcalloc(dev, nhi->hop_count,
> @@ -1360,6 +1520,23 @@ int nhi_probe(struct tb_nhi *nhi)
>   	if (!nhi->tx_rings || !nhi->rx_rings || !nhi->interrupt_mask)
>   		return -ENOMEM;
>   
> +	INIT_DELAYED_WORK(&nhi->reset_work, nhi_reset_work);
> +
> +	if ((nhi->quirks & QUIRK_RESET_DMA_ON_REUSE) &&
> +	    nhi->ops->reset_interface) {
> +		/* Only v1 host interfaces implement the reset */
> +		if (FIELD_GET(REG_CAPS_VERSION_MASK, caps) < REG_CAPS_VERSION_2) {
> +			nhi->dma_hops_used = devm_bitmap_zalloc(dev,
> +								nhi_dma_hops_bits(nhi),
> +								GFP_KERNEL);
> +			if (!nhi->dma_hops_used)
> +				return -ENOMEM;
> +		} else {
> +			dev_warn(dev,
> +				 "reset-on-reuse quirk requires a v1 host interface, disabling\n");
> +		}
> +	}
> +
>   	nhi_reset(nhi);
>   
>   	/* In case someone left them on. */
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index b2e2e2c413b2..6bd519d70a51 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -139,7 +139,7 @@ struct tb_nhi_ops {
>   /* Host interface quirks */
>   #define QUIRK_AUTO_CLEAR_INT				BIT(0)
>   #define QUIRK_E2E					BIT(1)
> -#define QUIRK_RESET_DMA_ON_TEARDOWN			BIT(2)
> +#define QUIRK_RESET_DMA_ON_REUSE			BIT(2)
>   
>   /*
>    * Minimal number of vectors when we use MSI-X. Two for control channel
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 598357b048af..c5bbb02f7cfd 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -514,6 +514,21 @@ void tb_service_properties_changed(struct tb_service *svc);
>    *		    MSI-X is used.
>    * @hop_count: Number of rings (end point hops) supported by NHI.
>    * @quirks: NHI specific quirks if any
> + * @dma_hops_used: Bitmap of the TX and RX DMA HopIDs programmed after the
> + *		   last host interface reset. Only with
> + *		   %QUIRK_RESET_DMA_ON_REUSE.
> + * @resetting: The host interface reset is in progress. Only with
> + *	       %QUIRK_RESET_DMA_ON_REUSE.
> + * @removing: The domain this host interface belongs to is being removed.
> + *            Set before releasing the domain lock so
> + *            reset_work does not restart the control channel while the
> + *            domain is tearing down. Only with %QUIRK_RESET_DMA_ON_REUSE.
> + * @suspended: The domain's control channel is stopped for system or runtime PM.
> + *             Set before the control channel is stopped so reset_work
> + *             does not restart it while the NHI is about to be powered
> + *             down. Only with %QUIRK_RESET_DMA_ON_REUSE.
> + * @reset_work: Work that runs the host interface reset once all the DMA
> + *		rings are idle. Only with %QUIRK_RESET_DMA_ON_REUSE.
>    * @domain_released: Completed when domain has been fully released
>    * @host_reset: Host router was reset on driver load, or forced on system
>    *		shutdown/reboot. When set, tb_stop() asserts DPR on connected
> @@ -534,6 +549,11 @@ struct tb_nhi {
>   	struct work_struct interrupt_work;
>   	u32 hop_count;
>   	unsigned long quirks;
> +	unsigned long *dma_hops_used;
> +	bool resetting;
> +	bool removing;
> +	bool suspended;
> +	struct delayed_work reset_work;
>   	struct completion domain_released;
>   	bool host_reset;
>   };

