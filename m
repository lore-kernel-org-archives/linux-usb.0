Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795679611;
	b=Au75aaXUR+I7QlBPnOQBlshlmIwdIK8sZtuXaS6Zc7WgtPr1V6peywtW04mhPzgNSwZL
	 CoqYTUsxL2Bh1OR0ZhS9yerVAIu9dbOfABqBCcn1D/OfubLoY5Qi5xubS0T5alZ0l4EMI
	 JGarZYiq8cdrjBqhR1/y+iMBCG8K3bpKD/R4hRiU76bfpGskFfzKKJeYKfcddSir2UbTc
	 fqlO0696fu8Z+PB4MItEDI1Rb2oZY8DNuASQYOEUCWDahVrz5b2c88rBk1yeigRB53dqI
	 wW9gBQfKqVa20UvGSe8NR8ytrKewjPblpxufbr80oq1YYR7ec2QN3gvlNDyvIpeeROg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679611;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=fr3CIXT/zY+Dd66im8T7URQgP71Yt6sm2eZZdVmN6Gg=;
	b=rM7PQ1/qPK4VOG8k26f3IVSLiNOTp4pwrbMxRKY0PvR3YMjVVHm3lIbBBfUqdFcxRmeT
	 ZCsXw8PSznb/JDvRDtwOTvy9CwyDVKMVrlh09lJmwdtVTIfDFGXWvfxxF6mMzN0AIGGbb
	 yb89iiIExg6tb/rUjh0ZtxEdvIxTGu4tw7Sysgu2HkAio7MYYe9kfRrt4zuhGznG7qgwt
	 vUZkUUUiKMHEslCtBHGanQrG42aahjWNXKEPOxCZKcEq3wTUa4DHBD+SHvens/q2p8hBn
	 QX2o115OdlVmBCEktaOl+WMhmFp80f1H2+XxJT68zqUv6ryz4y/SxyRHFfN3DPCBaSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uOfzpJRa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.45
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012045.outbound.protection.outlook.com [40.107.200.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFF7606A31E;
	Thu, 26 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDFF7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uOfzpJRa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4hiGB4TTLGNV3qu3QpMZp7l2+3yVLYzP953WNJw83SO8JTPosP46aDjl7PzvjTf3Buq8E0N2sxtF8h+5y9nHBmgZXZMc25iXj6QkTu6oWFw7nXDKrUI89wIXhaZxA307GwQrg35NfHhwpQY99Y8lbZVknYdilpuDxwqpTJyG1XEuDxbdgK2CPIANznwtFKtYxvdl2hEblS05N5S4+U8cnsDPGSe8zurJ0FKq3PC5i0R7UMFhTq+nFpr0pBy7UY6P2t7tNSfN3tGqsFHzIpzWvkD1eHcngpNB49XcKeDOeIbxbBTUT5Zy+CfqH5x4W5mazZmnoa8VxeQSoZEKz2uOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr3CIXT/zY+Dd66im8T7URQgP71Yt6sm2eZZdVmN6Gg=;
 b=chxWRqO4VGqAosaaW39ZvBq2XkcOb0bTU+0G2XxhrNw/TkEdjdT7kFrr+JA4qzIJ67D/8cNE8gMfXvctOsYap5XOGbOEVEZ/vJ/3qOO9m0ea0qUY9j5wkwi+a5llaNTWTvsskaiLInzx8hjFjSn+emHz/0X+hOWSZtlp4EnF+AQBGPjPIkmAg7Ix4SQuktStXEfHFURtNE27jiwVi3+jnVKzQ6kiBE4FGvKG3Tji/OM9LmPVA+RaeNGTHYPioL1BYqItaFT54pra1tRRVMrm9x1fzRlVDG7Kr7nxlhyAsixfy43pOfLVjDazvgHMOi8DgtzutK9Xf7Dyy3wvuRkxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr3CIXT/zY+Dd66im8T7URQgP71Yt6sm2eZZdVmN6Gg=;
 b=uOfzpJRaDlzYbCMqAVR1fMfteG4sVZt3gAl4yQZloa7q6tlLamsOk/+67n59KNVAUf7aEF2etJyYoEZQe3GwtYgaOHdwyOxie+NQZkXOlZnLZoCifnJ3w1CaiUsKHA44+vYJEDNz9USjBrJrllNftprtc8reVeNXFBGJAlpAVFQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9717.namprd12.prod.outlook.com (2603:10b6:610:2b2::8)
 by DS7PR12MB8203.namprd12.prod.outlook.com (2603:10b6:8:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 07:53:27 +0000
Received: from CH1PR12MB9717.namprd12.prod.outlook.com
 ([fe80::b26:bd7c:5076:9cd4]) by CH1PR12MB9717.namprd12.prod.outlook.com
 ([fe80::b26:bd7c:5076:9cd4%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 07:53:26 +0000
Message-ID: <4adbbf12-5979-4d65-96a5-9a95a90301c8@amd.com>
Date: Thu, 26 Nov 2026 13:23:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: check i2c_transfer() return
 values
To: Siqi Chen <chensiqi@uniontech.com>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Jonathan Stroud <jonathan.stroud@amd.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261124022500.1020611-1-chensiqi@uniontech.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261124022500.1020611-1-chensiqi@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25e::14) To CH1PR12MB9717.namprd12.prod.outlook.com
 (2603:10b6:610:2b2::8)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9717:EE_|DS7PR12MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec22b2d-11d8-422f-3c7d-08df4b925a8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|261009223027099003|18002099003|22082099003|56012099006|10067099003|11063799006|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	AP/9xJA/cufk1DqJhykwDkMRF89Pu1YV1/VB+o9CXZjsqfzz/6JkV/+xDF24pFYSPgKMxl9Yzw6RIEFTppOqUv3MUQTKHWVP2hN4Og/QTAcpULyjO93C00jxxMSvO9L8COwfUGucnDIzp+DoTxUBcCNUFWXB3CbWPEEN0OPASegFfFK8BdIkd7ef+b/nuVWGJL4ovG3hekZDmYdSwPMqU7XTvoExKMYS3X3Jn1TuUrl6NLfVAUJsg2yhPiqlkmcCQ0/Gp1arChg97bMm2KONAziq5YVOlP1lH9lfNZnw4e87zvMUontEvWYLPPMBz+ZKwau66r31kpzQ7Lp6RnjJuN36Dpfse8iiJvNC6TVPS6ec6HM3tIlHjRe19bUYAomHSFoNVNOTZ2FcfxSuTeX/nyiE7amXFCdN+UeGvjkIdPST7u7wkowFnQ/0gQ39Sx1hZwlK3YZNs4BlUunWXeqmE78SixSizA9OCwGvkLuUa+ju35mXdwFy5V4UmNInztzDksM3Aw4mqC90DJ58XnqpSMaYtJy/Eb/Jr7znQ0IgF+Zk4RLGXtelwVsb4usWwe/2MMtPag/amI7WYila6VEp59AijMLBuA5TXyJY4v/yq2VJObxbciRIhrj45zRsf/c9TvuQ2qeAacVYUVtlbSB+ySYjLbvqLnafsIOvew0LLVw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9717.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE9USDVUVytQVVVtaFh6c2kzVGRSL2ZHUzY4Y1Zyb2xLai9RVXc4SUszNGEy?=
 =?utf-8?B?M25hSEJ4NGxkM3BKK3MwWTltRkVlQXhITlM2YWFudG1zck1SRHdDeXZyUXBH?=
 =?utf-8?B?VXFyOEZrb1RIdHBPZDBBRTg4a0hKU3dleEt3L01INEtNZUVpdUZIcnFIZmY3?=
 =?utf-8?B?b0t6WTFJSjNTZys3SDh1TW14bkNNd3ozcTZqTWJ0ZTRvd0syYmN1SlB0TmJ1?=
 =?utf-8?B?YXVEUStWK3hIZUhlY3BQYzVTamhQb2hQV2twWWhCYkZrVFpHVC9ES2pGSE9v?=
 =?utf-8?B?UXE1S295OWxiOWVZYlZ6OERYbmIzVGFZbmwrZ2Zuc1dFRDZNTHRIT21qTEJY?=
 =?utf-8?B?eFl0TEhtMFpFL3F3VGp1MHc5Z2V5NENRZG1iS2JYQ1dzNm12aTllZGEvdStO?=
 =?utf-8?B?NEw2QlROWkV4SnAwL3FYdm12V0lxUEpXWGdQbXZIalFodWMzZzh5ejFXUWJ3?=
 =?utf-8?B?K1BQRXJ0c1QyRDVZMTBQOEhHU0ZyakZZd3BzL203Rk9GblpvUWpsY2dhblJE?=
 =?utf-8?B?ZUswZ2c5NjFuVGt3aGIyL1Z5VXJ6KzQ3eWpkRVljc2c0akcxSGhFUnpQdnVq?=
 =?utf-8?B?RnAvTzF3b0xMOHNNZkhkbWRsQ3FpZU4yMVZVcXlhZFM4RDhQMmJsbllHZ3FS?=
 =?utf-8?B?bnhDTDVRNm1CdnJzN3BncUIzcldyUENsZ0dxV01NeFB2aXJxVFVoZmd0WkRT?=
 =?utf-8?B?NWQ3Y3ZhRTA5U3YvUGpkaHBkZUttNmRMdmhYUEk3SnloK2lVVHFyeDMyeHNP?=
 =?utf-8?B?Q3RUMVJBZXkzWDNzTGo1Y1htYzlJT2I0N0FxQ09iM0czNXIyZFV1VUtmdGFw?=
 =?utf-8?B?ZUpsakFNa1NobFdLK241TCtvVy8vd3ZsK21aaUpUUVIvNHord3d5ZWoyUWM0?=
 =?utf-8?B?SGo0ZEdjUFNBcGg2L2hIajgvNCs3aW1ORjhERlE0am5ld016THpSSENRUEo5?=
 =?utf-8?B?VklVRkRWWUZCSFEzZVVSUlZkUmMvbnZBOUdENTBHMjJjdmhabmVvY1RVUkUw?=
 =?utf-8?B?RzU4TFlDdG9WYXo1anFJdDFtQkpGN2p3ZlhBTlk4cTYwamhPWitoM3VzQURn?=
 =?utf-8?B?RitWU29qMFRwVVZuSmFkMytOR2xlNFJWRi9JSkE5S2QzQ3luMitNNUFFc003?=
 =?utf-8?B?VVVkZWNrRzJCOVUzcEFqYUZqMnR0S2s3UFRadlNJZllsU01MT3poVE9GUjFj?=
 =?utf-8?B?QUZwenBXVjkvbGE3NGx3T1V1UHBBcVJYcUZ6TS8zVFdxeVZIdGZYTEtQMzBz?=
 =?utf-8?B?a1h1cEVnRkg1UEJDUThSV3RnY0JmRm9JOUF5TDdZUzg4eldmT2xNNEVZRGd1?=
 =?utf-8?B?cWx5VFlxR0xBcU0rRkJDYWxHZXZYcDBkMHFCMnlMY0ZPWHpSZHlGcmdhVkE4?=
 =?utf-8?B?M3NmVTY2U1hPN0xEVmxSd2w5NDQwY1R4UmpUVXBNeGFtNS9oQ0FsZTJVcUhG?=
 =?utf-8?B?MStDNk9RdE52ZnVFSnBQTDZCR1NvU04xTWdES01LUXU4SWdmQjhoVE5KZVJC?=
 =?utf-8?B?Y3kvZU9Hb1dEbmpWREpBNkNMUHJrR0FibDRPRmRWMFIvWjhKc3pXOEE0VlN1?=
 =?utf-8?B?UTZHeTFuMXRGMlU4M3VvdTV5T2Zzbm93SXAxU1BZaHowMzJ1eXcwN1NOM095?=
 =?utf-8?B?SmpzcnBqOGp2bXNZWWovRGdWTkJnR1QxRjNjTFdzVmFOcGdoT2QrNEY5cURF?=
 =?utf-8?B?SExnVHlnRi85dGFFVm5HVHAvQnRHZDF6K2lqM3AxYjFscUJxMnI1a05Tc1FD?=
 =?utf-8?B?UTNXZkJSU0EvNXp6b2ZKYUpzbVlvM3ZyUWhGRk1SSy82cUovSGE4TFFuRHBr?=
 =?utf-8?B?cFFZK0loWHhHRlVnK3BSZ3Nsb3dvQW9kVVNjYjdUOUtwSVpNSUxPMW5XajFW?=
 =?utf-8?B?Um8yYXdTeXBoUWwycGdxSkRSb1JKeXJ3Y2x3OE9ibExSdlRWdFFVdWhiTEtW?=
 =?utf-8?B?dzNmeEFaa2ZRUFM2aXdqU3FodGhrNXhnN29YMU43dVYzNzk5UW5Pc0FkYnF5?=
 =?utf-8?B?dHpWS01RRXk2TVRlZVRGVWEzbWVGM1EwUkduMUxEZW56V2pTMFNIcVlSZEh4?=
 =?utf-8?B?SGhIeERYSmxEeURnOXBobDZRYmJIMDNvVXdMVDdSZjdFUWphcCtwYncwN1ky?=
 =?utf-8?B?QW10S2VrT1NVWHR4MEU3TU5yUFdJaXk4OTVvUzYwK2ZUczFySUM0N2k4Yyt1?=
 =?utf-8?B?aHBZeG1mMEFFcWY2NlF6bUlXdDNzcXg3N0JQSmsxYmY5eVRHVmMrb3NoZkN3?=
 =?utf-8?B?YkZ2aDdiOCtxcWRWQk9qMGlWekRGdWdkSXRvSFh2S3pOMC9LTWVNbFhCSTdM?=
 =?utf-8?Q?ZUmFJLaYgbF1VhVW4M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec22b2d-11d8-422f-3c7d-08df4b925a8a
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 07:53:26.8433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bye5GeZSTbWElO5C5Qu32mTkmkOXIgTjMEFLPMYK+68227t0yQ8rmkvHf/QwZd68
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8203

On 11/24/2026 7:55 AM, Siqi Chen wrote:
> i2c_transfer() returns the number of messages transferred or a negative
> error code. The USB5744 I2C helpers only check for negative errors and
> therefore treat short transfers as successful.
> 
> In particular, if the two-message read completes only the register
> address write, the driver consumes uninitialized data from rd_buf and
> uses it in a read-modify-write operation.
> 
> Require every transfer to complete the expected number of messages,
> preserve negative error codes, and return -EIO for short transfers.
> 
> Fixes: 1143d41922c0 ("usb: misc: onboard_usb_dev: Fix usb5744 initialization sequence")
> Signed-off-by: Siqi Chen <chensiqi@uniontech.com>
> ---

Fix is right. However five identical blocks is a lot of churn for one 
invariant. A local helper like below simplifies it.

  static int onboard_dev_5744_i2c_xfer(struct i2c_client *client,
                        struct i2c_msg *msg, int num)
   {
       int ret;
       ret = i2c_transfer(client->adapter, msg, num);
       if (ret < 0)
           return ret;
       return ret == num ? 0 : -EIO;
   }



> OpenCode was used to identify the issue and draft the code and changelog.
> 
> Compile-tested with CONFIG_I2C=y, CONFIG_USB_ONBOARD_DEV=m, and
> CONFIG_USB_ONBOARD_DEV_USB5744=y using:
> 
>    make O=/tmp/opencode/linux-build-usb5744 W=1 \
>         drivers/usb/misc/onboard_usb_dev.o
> 
> No hardware or I2C fault-injection testing was performed.
> 
>   drivers/usb/misc/onboard_usb_dev.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index e357cc8af34f..98380f8459b4 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -329,6 +329,8 @@ static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u
>   	ret = i2c_transfer(client->adapter, msg, 1);
>   	if (ret < 0)
>   		return ret;
> +	if (ret != 1)
> +		return -EIO;
>   
>   	wr_buf[0] = USB5744_CMD_CREG_ACCESS;
>   	wr_buf[1] = USB5744_CMD_CREG_ACCESS_LSB;
> @@ -338,6 +340,8 @@ static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u
>   	ret = i2c_transfer(client->adapter, msg, 1);
>   	if (ret < 0)
>   		return ret;
> +	if (ret != 1)
> +		return -EIO;
>   
>   	wr_buf[0] = 0;
>   	wr_buf[1] = USB5744_CREG_MEM_RD_ADDR;
> @@ -351,6 +355,9 @@ static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u
>   	ret = i2c_transfer(client->adapter, msg, 2);
>   	if (ret < 0)
>   		return ret;
> +	if (ret != 2)
> +		return -EIO;
> +
>   	*data = rd_buf[1];
>   
>   	return 0;
> @@ -374,6 +381,8 @@ static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr,
>   	ret = i2c_transfer(client->adapter, msg, 1);
>   	if (ret < 0)
>   		return ret;
> +	if (ret != 1)
> +		return -EIO;
>   
>   	msg[0].len = 3;
>   	wr_buf[0] = USB5744_CMD_CREG_ACCESS;
> @@ -383,6 +392,8 @@ static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr,
>   	ret = i2c_transfer(client->adapter, msg, 1);
>   	if (ret < 0)
>   		return ret;
> +	if (ret != 1)
> +		return -EIO;
>   
>   	return 0;
>   }

