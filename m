Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFC746A60B
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142944; cv=fail; b=RFeHalltOcLlctpwixGGxQy5sYU6AKkUPg3PLp5ojz//GLuTKfNfol7sdzGF8pLt2QL7VgMXimh7dVWqIbJtnZBTShy2K73T4L8JXd/9kDhiy9LkmIpu40pTZ3aS0998ROZFHdia5g5ecYLWev5YLf8A/p7SKPNY3s+O3ncC7To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142944; c=relaxed/simple;
	bh=YQTc78a7j3v5fEDCxQIuiC4WO1N6qVyPnt/pYoY+QQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eFqS5B+itLjEKvITYAFZxnXiUJSMAkJTw6kR5i/s2hLptryBTv3J7rKAhwde0MsNMEiZs0k/+hJW7L0BpNcx9+YKHjjE+4J1gpM2cnA8IBAUkR/kHgQajYVH2L8+548XqsJMQDJrIbJ8EUhW2ZWX5bOs1scIFNRf5fo8nZ+dLoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zwb9ki0z; arc=fail smtp.client-ip=52.101.56.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zwb9ki0z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzkAqR849du3tkkMfNtMPFm345jdNrpDbhTqAgAyoVDxYx8jYfO+Jno7TM66mjVR7mkpOLPeLNcuE/Pe6r+7W2T8cJRjL9yQ0BmMPsBGBy6welV3+zrqOTEynfweTc4i54+lUJjJv2M1T2c/f/ORYhaYVJgEEIXamfqdOBlaESxFV9bUqOhw0+MQ96IMgVRM+syCFmdUrzWF5FME9fCB4KBa25IB7SC3H4+Ii1EKo6ox9CFWG6NtRhRBy8z8b9UJckjxc8lThiXVav+WvGs15mPGIvPHD30kMRImlsrLnOJ3eJz8RJe+WLufYpvC01FQ7cJc5ScYXlJ9WDrjETY2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQTc78a7j3v5fEDCxQIuiC4WO1N6qVyPnt/pYoY+QQo=;
 b=eJAq91rZhuj55I7v6tJC86/bsh4SO7nBNpxobfoJbWD/eFhCOvwoN1RL+ey+d0zU7vQQUjEh1WCGdLzIIcY1EF5EqQISjyjORQol2FUipoGY8T74IhnRjieYDRJFqZ5xUN9Oj+oaP98o+Pc4OBmT+DMddItYBiApknJBLKTNaXB30c9ZgBoyJtD6i6X1+qTERrr5c37dfrt0Bxu1ncwNcFWLozvpP6JfvO55D6R4JUULkE8EVFskEywMH6hbptWGVxxw9b1TokXy4jU4pa/vYOcVHQCLsD1o0G/gjIZe7JMbHGwPSJdrMlHnaol5XQuOd3iMU9kWMt2pmywidwWDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQTc78a7j3v5fEDCxQIuiC4WO1N6qVyPnt/pYoY+QQo=;
 b=Zwb9ki0zEzls05QuZxkaEOaIn2i6NkY1WFNnxGpQzCNNeaAYyredKYkSf+VZ2SrE0fRMJL3LE0Bk+6/cSEzHsoI8F8eIh74NveO4d3lyx5/H3nBrNfD4UgNN4z1x2m8Thq85v2ki03Ascg8G9/DvciOQcdSIHpYlY/GaNAGbvTULTvjnb7Rx9tWjEaJyfEbiwAdGE0s3JoXiga6neGzUw452yfOA9N6hG2DnGc7yr/s0fNNWA4S/EDJkmR4oys9tMhmGixfItVRmfhDD1u6+y34Zt97urOGAcWFbzluGgU3FNBpUs16G6Zv5ywuscT2AAiJwStTYdkG+xvsNjeGIPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:28:59 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:28:59 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 11/11] ipmi: Add NVIDIA LSTP IPMI BMC driver
Date: Fri, 16 Oct 2026 12:28:20 +0300
Message-ID: <20261016092821.2049721-9-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168499@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-11-aambrozewicz@nvidia.com> <sashiko-outbox-168499@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0357.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37c::22) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BN5PR12MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a01b9b-5807-4eea-5d48-08df2b67e865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7QObsH3ZGgiBHlkz5UIf7xI8KCuNi0f6up4D6yO4PXBTMEt/9U8+Ok304OvFSeG/FPXyTHUZGujCI0QmCU2lcpjWAbntlX8byCOwLPnZDqmLKEmB+l4VJB3yZmnpLcApuEWNAXVkIbf1RyMdT5W2dpySNlf3WfyxiBMvGhtCPJcfPASIyLBA9XuQi/7Al79jEsLBVyhGbDv6Ztbr8ZznoEyxI6jc3j5EEd5VwIBiLye2V1aQbbU9wiNoU+IPrsGX6d3gSr2KfpSQfLz/Xsn0ldKpJPmJ4khag2/Cqkl6N8bNThU3TDUA3iyl1jB5s6fFD+LznottTqBD4XIx2vb/b3jWQuwuUIEA+xHFlGASgKN179fEoUA9oFEvWynVUNiGB86tWxHjhaUm5vsILgJMK6DKCo4uRONtQrTYsaGUfb0uhlUnLhS6ZIQBlVhhI+KAA+Acnl077QcvKvL2pxtZTttcTEJSjMKWhD5IXH41oAjbBCGo/4fBCfgX4BF28VV/FU54mBQVZ8uK/IbNKseLqVwp9ihFgc9vB3VwNcyGON+DMREqEulC3eTbQATKGmamu/EqAQLKqn//oV8yOC55M7OiR+9OuG6esXEIIkrqeUycRRScV7qB6Gi5ZhnQCTePckUVBrQprnp84sodFWlGE/S5oYNXXIU5VMB0spil2ok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4UORGuiQSdjfJ2tZl1+S95iqQQiWKECR+OzT+PYqXl43ME7miqvkrH6YJTc6?=
 =?us-ascii?Q?jqNt2+L+0Q2Mndsax7p83bDd19KV6V5/Y3YqxNLdX4KO6entCyls5qxk16xb?=
 =?us-ascii?Q?qLCYmnJFRH/n6/V6+2xwhB0F/PCEcep8cTEzakl3X5yZF9DF8jvaeOKS99ce?=
 =?us-ascii?Q?IGftW8h34dJzvm6QBRo+UK3q6Ey2kTUq+gIyXspz9JRidckVrHRYh+8jGfyq?=
 =?us-ascii?Q?/jQUrla/6GXLkpsrcZp5Ng4lxVtZL7hcnOHqZ+axYQpsn/wkDHahOY6EB+cG?=
 =?us-ascii?Q?bYUzLNIGifexPfEv1489fH2alTp4JnX7ziFvi81HvIF9EPnwMye7pxDJc696?=
 =?us-ascii?Q?5/pJ3U7sf2YxUWxPd6WACBricyvZvTiei/pTn08YoNFJ0sCSzSsxedB2LjSq?=
 =?us-ascii?Q?/HYOXv5bYoHtdeeo0Be0GtFy2TI42X3kOmMM9r4nJDTuHpI6iHeQFyVR67Un?=
 =?us-ascii?Q?SyTFYtZ7JTwFnp0OwWckxLhPLl/TwW58sxNWSJ4gay8zo9zwGPLNozDRWXvf?=
 =?us-ascii?Q?U4Nfg5A6bJMaFbvDUqjtDCLNL2aLuvnJQF3hpjXRsnBDG95XKKNCmy0rS61w?=
 =?us-ascii?Q?ZZtD16F8iAZi+UM6cUGDa/SlWvJCFOTCOn5H2KMGY5v5VrvYefD53CrRGgQT?=
 =?us-ascii?Q?E4CbvoicjgTI4om4XsdPFLDzF/JWLIThbMX0I5+NlGakOxN0Lj84fvEqw2mI?=
 =?us-ascii?Q?c4R0Gg9a0c1azeen8QIXJH+poVMT5lYkX+O3Eg8FmniXOPrtDgDUpixKPfzQ?=
 =?us-ascii?Q?FIHuLA3fNZQU3TdzCtjE69MTfBN3EjbCT8LbxMV3B+lq3Bz/7plkNTlOc14M?=
 =?us-ascii?Q?d/aESU9Glm80dY+da84p9s0UIbrA2MWg8jAI2nYpC9K7BCfcrwalFUm99R37?=
 =?us-ascii?Q?T7ERrNqy8t9rg+H0ee+ITBDMWkjXFiA119swNY4EQC4edY9fQmaCvaKoYoPP?=
 =?us-ascii?Q?bAWoMnbrxhfwbisbs9KL+mGYWzyyVOWShvKivVPmxpPjomITRvzP9Jz+Uh7/?=
 =?us-ascii?Q?HvR1zTYFSrBjXVqQSq5bPPQYgzxO3fzB1GbcpG3CJiL5Q5s9yuWDEjMSYt+k?=
 =?us-ascii?Q?qin3Emumk1Qi/6VltK+eU9oD3QjVE77oMtLQyNGcuSC6NZAg6PFawEMgLOng?=
 =?us-ascii?Q?Z2nsJNBn3SGWj7SsDJ26/3xPPrqVMoYrhpTuMgyHY7JEHLrSnulzI2+3E+uO?=
 =?us-ascii?Q?W64qW8G7AplymL6qz4iC9DSyRJ+CiuQM4wgPp9g9Ivgsk3ynDK7UaOq60w4t?=
 =?us-ascii?Q?NYY4OuecswrdfPdFbG+Znb5g/o90A7ZgCiLmmzv82dOeYNDuluMdec3BioC5?=
 =?us-ascii?Q?hp0LJUxa5FENC4UK/KH2r1HXBeG+tyv21nRUq5kp6+uVUZCpqqNo4xvok3iY?=
 =?us-ascii?Q?ciKrMCkkO2ZFG03LJlQihVpRu8x2d4B8QBdnvaArSrfDo7k2OA7bsLOfA0Cl?=
 =?us-ascii?Q?t5FLUpj/iZpFuHQDlUac5JDXWHc4FJfFPoWPxV7HiLGaBk+JseTMzVMXUMy4?=
 =?us-ascii?Q?TEhS9F/LUcPgIn/bTdKhERr9JUklWEBbWr5CIIOCR3NBXTtE/JwNx4/8FwHP?=
 =?us-ascii?Q?736yOrL/Q10ShekFVMKfLAqYplRR7XoIDmtuI67jdJv1LTWxdNrmIpo8DSdl?=
 =?us-ascii?Q?BajQ+d9TMj9TowZBuPnbVYIlU0DzmBGXrd6DGTXN281RZGa2Rp6i0df4Xgb1?=
 =?us-ascii?Q?+YG7iK2M7n4X43AAQxL9EEshKr5lCSTTE+u36aZxJKaDsqmA75850KJ4UfOS?=
 =?us-ascii?Q?HFd/dpl8dw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a01b9b-5807-4eea-5d48-08df2b67e865
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:28:59.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+aaSFlAzhPQ72jhWKh0j/KRLTfstf3+L5b3g6TbkCrBTxrggn9u87ffULggiARKxZWsIIyTMWCA8Ch9blB4rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539

On Mon, Oct 12, 2026 at 05:51:54PM +0000, sashiko-bot@kernel.org wrote:
> In an auxiliary driver, devres actions should typically be attached to the
> device being probed (&auxdev->dev), not its parent. Here, the driver
> incorrectly attaches its teardown action (lstp_ipmi_stop_and_deregister)
> to the parent USB device (ch->dev).

No: ch->dev is the auxiliary device being probed (the core driver sets
it to &auxdev->dev), not the USB interface. Both actions are released
when the driver unbinds or the probe fails.

Adrian
