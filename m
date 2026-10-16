Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0EB46AA98
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142936; cv=fail; b=e9HnqEBM1m1GucLlBBvQpt2k6f0BvMch2XYmB4Wf3HXvk6cELiLxZxIR5mWUmIdB85phAamnqJW3G2coMsyYf6ozFfbT4cNEwq9fRQEFLZWzd2sZKAH9mYfo4y8ebcYmDqPHem/H1JMXLyo7wuPSQxqFQ2nzbVVWQGZ8Nrf0M8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142936; c=relaxed/simple;
	bh=wQnr2/J7qy/vhl4m8bBaGVxdWgJYq1HpsSeeJ2FyogE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Re82lBt6cOMKNjmWsXI55px5jLgyVoSD2z8QTYiqFdmUG5XKxAod3IUaIOeOlixpg7X/EWXAeNKaI9XJlkvwiloxxXehONXa7w2/+8zC2eKOSx7QK/a/4823EcGo4m33KdfWxsyelXQxwREA5xuh+Y9aAWUkXNYS3SBc4TzmFoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WpkXOqfr; arc=fail smtp.client-ip=52.101.56.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WpkXOqfr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+FaywE5anC5e1F5uC21ZfzVrWquE5XuklWYtX3K10DvRHKkSenKL0uD3ulQJtIJuux2WXzyhnPbkU5hYgSBcnAYcTjm5XUgYkPC7rSWC5gPNiBKIO5E48n2rcxNDlpIYcff5uSp929J+5f4ETv/cICjgRCdd1ae3MI5d6I/mDuB7ENxmYIep6wSPjW7NP8/uKMe6cBcTFNUxIpcy/5jlk59phV9TZNNBizW8SoO8NjJHD89JIHh9gvQ+Qh780RlKBT6P1wjNVmpOGCbqM4NmoT0f5vrDxKR/TEuuATlWIUitZclSj7DNe0uvLAiMuXB5SWsb1QpLyw6bj0cQJPnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQnr2/J7qy/vhl4m8bBaGVxdWgJYq1HpsSeeJ2FyogE=;
 b=L4jqbr+MhzzPOFh/wr/qWeixMX160thGwzdk5ck3wkV1D0n+//tHf14Ku9wD3H5kC+pw0D8Y1YyVT5V9S2XWc58yMHr+10j9R6rTFkcEh7Uekd1fVWg2rJh6xNsNr1ekcI4g8MjVjYXQM/ekjnnkVsA3cDgHXZQl8DgxhLGbmLGWdPzXNH7hDs3z3OV1Ms5coki55aCuTpzQDqiPpk9cKJ40U8M3mwpJI2mq/8oNtR76ir9eMWmD1cQqPrSbyW9srrAMRAF3GCluzprOb1Eyr7v7L97Oswmkuh7k425fQXicw8dskqHwGywQaYyCx4v/gpT8vzcEr/uMEKLsofCXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQnr2/J7qy/vhl4m8bBaGVxdWgJYq1HpsSeeJ2FyogE=;
 b=WpkXOqfrrMuGoKrfb1juuagPQu1F6d/ygG2GuT8jQMQeYyWhhvEz218JZsAXaCRP5z2qqbm8/ORrL5fJTZs05/Pes/Vh1qHpS8FVGeLtpOJTqmjDsvZSSAdXrSEJZuc9fSIPwEw8LBAwb3FnidGYmRI6644VHvNo0BLaoKln9lxxmkPIFy83orbo2/QvbL5uiNevV4AGQxVduB/tdS0LyJvbQ2x9ivGkaeFJmH0vHRwpBDHnbFYT1goPAS/SIAjRmFVzTuG3z5VH+0dI7Vx9lqtGW08L22EitubISB8tP7AQSNLpmYqSWPjsPeDJa9MQnebqCCqfSQZ0jsdlvD9+Mw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:28:50 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:28:50 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 09/11] spi: Add NVIDIA LSTP SPI driver
Date: Fri, 16 Oct 2026 12:28:18 +0300
Message-ID: <20261016092821.2049721-7-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168486@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-9-aambrozewicz@nvidia.com> <sashiko-outbox-168486@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::17) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BN5PR12MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: 873c4abe-625e-453c-6766-08df2b67e348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	HtCX45qMs0izE6X+Yd78bd2/Egv5kPFpinfOMYniAPa1+vCPZJM5A3mzXucjUsbSMwO93I1iPGWHLX/8ka770Ya9Inu9tePp0y7O20vPL0IolTTa+mOz57KWORKQPwilFT2/XeoKWQjWybgscsZBsHihJfo/75I3/eBzKMn2M8Fl/+BaXLzW/F3WfKfeDU1IEVPebb3RUPe4y2Cwe0MxWCjKsryADQPMmMyIxh8TRk1WuK43ax9N5zYcGBaAYS6YHhfD1n7Y7gUyZK6jWLIS8INPh0XaYcGau8QgON6Dsj0xGO5CXwePElon04CK/L5qUA7Fuf1RPs+pdteLZyKnUpSvp09iEiYeluZEhID41feEzARsivDLtMYe3RSyj6BUiI7eEwIrAK/fEYJrC5hwVMgKXXHeHgJuXHzJgRodOoDRQKIe2lgxMusw59Z06MStpHnXWo81FKnO8cxARSk8001kpobokKAjoPH+z2hved0g7FJRE3vBIwy1VyMHz3T/Lcn7aKyeKnF224tAS4Gpj9WdfAP23k/7rRAIFTstb45J/TsxMXsfafWnxPmdeVS3OepvOl78wkHrRhjr51bUTSfYwEYgO4NykGJhGTpq6+WoeBubn9avvlhJOilI7e3Nhf2tZkSVbLxVYzfJEHDBK7lAg8f4lL+nbDO7Kb7mmYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iZD3tdoRdvYGkbPQxJqApWbfTNB5SUwdNMyMsvlH7v9or/aQJbax58VnL/ju?=
 =?us-ascii?Q?psZ4JsQ6wt81AXi4fiBZje/Nzrj31XHvt97ICkhArIutZJbMeuJIsLrG3X8R?=
 =?us-ascii?Q?G8i6h1PBmny5qzBhf/OaMDHv7JD1mHiHC872MfhLC5bokxwUDau0TWB9y0Rv?=
 =?us-ascii?Q?DmWwW/9Ufcn846A4jmB2fgpbmuDx6KwhORlzZM+sB090KQXLdu9FfPzV42eS?=
 =?us-ascii?Q?YRxcnrMigndZLdaNqJrxwIlYVrhayar75gqa0pEbYZlwp7/CR772dt6uYR7J?=
 =?us-ascii?Q?8GisDWSbYL2p9H5s/0FzlN09Do+alQDWuDpUxsqq5b7yRksq1HNAVLH63SGn?=
 =?us-ascii?Q?GNYoEm8ihFTS7NGAPdeYKISZmj13g2+LJpFRZQxTomk2uS0ZRznyVoJcRnI/?=
 =?us-ascii?Q?JJOOGt62kaoF9JlxTgblQCLWR2JQI1anw0d7dl0plmGOO2iG7uZXRdCGmME3?=
 =?us-ascii?Q?6W96/0wrNNaC+ulbw67+pi7FIWgtluDVyuvOXEy5h/Lpa+jdL3tf8UvzPOlz?=
 =?us-ascii?Q?5ZUIqEPXoAQaAKc9900oQWf2kUgC/9yqbYtEy/cwJktxAE4p86fAQs87F6aY?=
 =?us-ascii?Q?aIfijNEOZ37tk5/kSbF4veDxqbHxHMUQuFC5Y4bh78eE63ADV/u+U8OrtTRi?=
 =?us-ascii?Q?Xuhb95d5D2PeMB2QKypaRM/0KMfOOjX2ya0E8mukzJ9bXyUXoFZG6qrJN8ov?=
 =?us-ascii?Q?6v0AXT1Hf+SZK62K61dBSyGGqVWRbHS3EvHjGxl9/WQJEUQIOwJoaPXzodzM?=
 =?us-ascii?Q?p9F3xO4CXJ5Pm5x9OmpkFoUSINR9s/AinuabwJxiFYP+wK8OLdQBlFEOeGD9?=
 =?us-ascii?Q?v0iIjPMJ8S7U6IMhFzvlA9HNLoThREtdMULMZM6vhJdGHSVwFn3A8qT9Xrel?=
 =?us-ascii?Q?/cmjLF3gIuuu1OdnEqR1jtbhAiDQTfh/yTsN1yg34Ta/x3ZZO3hK/IWIMeaw?=
 =?us-ascii?Q?ByxPYxrmBS+Keh47WSh31EE/uOEmCqho2+kPwAfL1vsxfqftunvuLLyUUYhP?=
 =?us-ascii?Q?zLk/tr5cD5sCFHyp3t6XFd9qglQDgxZSEV79WST2agIdNP77Spco5PEISH2w?=
 =?us-ascii?Q?2vpALyej56H7SCeYELnzFraGJ1tfSfZIonJG7nMy+Pc5BRMgVsTyXQ0FTKd8?=
 =?us-ascii?Q?6Cx5hR57c62r96bZRTHSXVt8ex4lUo7p/1UFo8/1og3Mo02TRdYBSGyFZkB2?=
 =?us-ascii?Q?TpssqAFMauilCwm7wn/9IpXcQVOg8BhCrwL6I+kX7Xak6i5KHH7Dd/DGU2ZW?=
 =?us-ascii?Q?Z0tntOuGy3wLQt3hp/p8nPRkswDsC3BkT1RMIkzxhSUWR5DD4N6LsIGiThkl?=
 =?us-ascii?Q?+r8M0Mm16AbRfk+MIab8i6vF30nWfuC/XhLvID++bmz4kLQFyw8GdNxH5adE?=
 =?us-ascii?Q?K9laZUtrHfDG8EJM0gaIg5L1yk1woiqMxa6yhY/U7swwnxY2BR+YP5qGCenN?=
 =?us-ascii?Q?yjm/36fQ6yya1tksf314OSg5TdjA/mCb6NAUK6PStx5APgwx0n1fZk3CZifc?=
 =?us-ascii?Q?23xsIx5VnYOwFNoltVjYYbG5FLO3SEe3OfvnObtn9dUQX31ybxmSfuNqVJnq?=
 =?us-ascii?Q?FMq6rDRIKGgQ433crhw79fLJlQ4u3pam5La3pHJXqEbyMNXRQShgi2bFki2p?=
 =?us-ascii?Q?/g9gEgsaYGeIFGgdrVFtsflCkAvCKSZwKtu2V/GorYLj91EsohehlV5NlDLl?=
 =?us-ascii?Q?W3oRjsnDVOnmBIgw7nkqdR59X/gk4nSZUYFskNZompSDl9DpLwV4cnOu/D9d?=
 =?us-ascii?Q?TwAGI+FK6g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873c4abe-625e-453c-6766-08df2b67e348
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:28:50.5454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fug1mydEwCY9sO5/9xgTMn5MpMnOWtzwoQ0RfeHOitRLhnPFzipX6nHtLW8qquE8fqc4MYZRFoLadVefdHufYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539

On Mon, Oct 12, 2026 at 05:45:43PM +0000, sashiko-bot@kernel.org wrote:
> If lstp_spi_do_transfer() fails mid-message, the loop breaks early without
> appending the LSTP_SPI_CMD_CS_DEASSERT flag, permanently leaking the asserted
> CS state to the hardware.
>
> Additionally, if a message intentionally ends with xfer->cs_change = 1 to hold
> CS active across messages, the next message targeting a different SPI device
> will start with a local cs_active = false. The driver will assert the new
> chip select, but the old one is never deasserted, leaving the hardware with
> multiple active CS lines.

Yes, both are real and will be fixed in v2. How to handle cs_change on
the last transfer of a message is still open.

> However, the host CPU executes spi_transfer_delay_exec() after
> lstp_spi_do_transfer() returns, meaning the delay occurs after the hardware
> has already completed the command and dropped the chip select.

Yes, this is real too and will be fixed in v2.

Adrian
