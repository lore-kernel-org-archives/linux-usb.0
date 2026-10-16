Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013051.outbound.protection.outlook.com [40.93.201.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF1D44CAC6;
	Fri, 16 Oct 2026 09:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142913; cv=fail; b=Su3hak7FQQR1FWgI7E37ThGqxYvVb5OlH8j3Ta0yqE/gVgnBufeKSQGuuwYks6ik7gtHJM6yaPrSC1FQCT4RMSDB439OZM/FeLPfOKjGjOg4qvh7xvYP1V9k6BTtfAb0pd66NFVmpV5fmSgbgDqGvuwWQKYipZehIbnxQmEmDrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142913; c=relaxed/simple;
	bh=3XZaiBTLAzsPl8wFQu/ImpPMk57kJgBXcfqoMs5xg0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MkniQQ1RxKonw/oQ4V5oOeLnAEAfZEisYfEbyjql31M0kvFIhPU+4V5KqlGwFWOSOLQUut72FnEZklmK81OLqUyEu3Uu82486TesYUjd/ePdz+BHlvNg1AHmkLuBknlVh/GScltamn+mdPCMy0WYO6Ad/XAasZAsoiW5ldGnV1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d8XjqiMJ; arc=fail smtp.client-ip=40.93.201.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d8XjqiMJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8cuM7/UbvWWf9LEFbp+LKM4uNc9HJh2xH7P5nWoyaiPRJfZE02vw/GuSft++Ge6Asu1K5+JpBbN7slrlv6j/BmyDMFgEj9otwAP/9cagBbcHLiB1IYFMCJpnyVjSEfJuE9/o9HfBQmKFlbY8/nSKW2YpUVIMaea0aF+Lo/eHJTxVkvdoc9tno9dIh/as+vb2AJcD3AlBiL/OqR8y/HrPK17F3S/TcSGxx46jvqzogNgr+bXsIVb0ImlIpXmpR+Bu0jyxshkU+P9GkXsBt4LMz9dF5HFPb/5tJa9MuJX81hqRxm2ZpAlAr+JCu1WdcDiuPXc3A4Hwe8o3Nu0FuEKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XZaiBTLAzsPl8wFQu/ImpPMk57kJgBXcfqoMs5xg0c=;
 b=k+NB+XsSqllvbB72DZa8TorXmP8nJaUBbF2EMekaPbbD43BcN4tHtyyuoUW5YVMU94bAJP7yMNmlt0NQReQUd3jCVxF++wGdncB10UAQqre+T0dZhRjDhU2IF8hfndUdFsKI6I4V/CsvfE7QF50xFZ3NTdzK+N+VGtDvSXzRRz+bslU9MFK376AhkLFFMGlQhEuhIWt/B9ehvMOln7wesgO49hZB9E4F+K5SaaGppxxn2BCPA2KIdEkpgl1uuhG6zYZVpfjPAbn9TPP+8Dbr7q+0GLKswPct+jbG81oqbtmJ+QAqFsxER4SU+x4h/O7JHS7Alk+qZNWpQ3/D6ITPdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XZaiBTLAzsPl8wFQu/ImpPMk57kJgBXcfqoMs5xg0c=;
 b=d8XjqiMJECJhy100Mc+v4DNM//8pryh4FqThnorZ/TaKPBFxG8/OUnvuMtRSHPz9xf6Pznx/BqC4Qp2uy9jJz5J3yBswlh47Lvo2OwFxpVIOiJ6yHP3Mefo70JRh4oYJxoVv0p7GaqbCAV2hfjvrSz7qFksRXmwMvuhqapR5tlK182MIId3QpS3+uea2ltqoHueqrIWWsTJZd8c+iz1VtKNPmjkL0HTdnL/Qou9pdbX6WFE4fmUkuGVgAVhSxV7EbTe3Z/fNTFx3NT7AiJtsPLMQ9Ftj6xXbf+8oxZgvR2FzP1dYylhFJcbvkh6y6hcHno2e+OzG3cXG1JUYkoYb1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BN5PR12MB9539.namprd12.prod.outlook.com (2603:10b6:408:2aa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:28:29 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 09:28:29 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: i2c: Add NVIDIA LSTP I2C
Date: Fri, 16 Oct 2026 12:28:13 +0300
Message-ID: <20261016092821.2049721-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168478@kernel.org>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-2-aambrozewicz@nvidia.com> <sashiko-outbox-168478@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0184.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::19) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BN5PR12MB9539:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eef9dae-a520-4ca4-27b7-08df2b67d69c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|261009223027099003|260925021311599003|260925022911599003|260925021911599003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mNl9kOAjJir/xf8Eh/c39XoSoNiYyJkqQHV1yxDWwjRwQm/37hO1ZPBj0vxia2EggNasnXESZ+jjC/poO9nOow7EoGCKyWT+NAO9k3E3gsEkr1KEXaG41+uCV800CnMaB3abjiK1gpxuBzpcFCQYveuS958aDYNYsq+q/eAA4ebzyK5c2dOjdr+dFYJWGPOGswTXuumwNCZt4+upyADDHIFGOmFrQ34rZiAL91be3uHyAd8Bc8Y+zuOdHgHHEA5GmNzU7hIF5LJQ2kD7No680yMa59dqkLakPTuvGWjbdOLlxZ9IKOhyfI8S41bCqbdkLXJ0MbdFh6mMg93yPCQ01gJX8gGCVdDs/UuLSVIcssldaNcRkm6qx2mDydiSk0Bz/7+202JMTL3kIQ0G9bZjVIy/AO4t12E+IGaax2eet2sv3iJnyLBcTp2OQroyzchath+3MehS6KRpiJz5n125zeWsyJZ8Bz9GPjzBwMvd3Ruk8icZVBW0im/yzaet7J/2y/JE7xIE/Al7tnHRCVT3SApagsFupgyul4XCmb37YePHJIothAS45T0VMxUdCtIwUmxeJwaFjSLAUiIRrx3FXeP/ux/WWIa2mOdhID2PmXHSZtBlzKpqjSBUh9P+yzAffa7RyFPGZC7fNGDT/O1STgBxqaNpgWKLzugl7SXdF7o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(261009223027099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?StHPmFu5BwcUATIqFir3o34xMEG6gpWhCD5eap+IxJtqzA4/jdPZZwsUYUzJ?=
 =?us-ascii?Q?/SjLbfDGjxlNGtFX5K2ZfmZdzZzl4KZcCGS3vXnsCuMFuwbiBbjP06XNoQJt?=
 =?us-ascii?Q?yuLzR4TMDzsaqKfnOGlUyE82Ln6zPDcLxLeMYPbFKxtjy//3PhIaAUx1rvvg?=
 =?us-ascii?Q?VmvvfhmA9J+4SVZiB5qnzAVMC8zLomfz4NfR6xVVwoQ0uej2V2DZ0rljudZ3?=
 =?us-ascii?Q?7/rKPbvHNDuN62qG1iHvB9z7hQxu8xjNMzx/06FLVNaodRUhwZu9J6YYhHj/?=
 =?us-ascii?Q?4lweHT7qvnr7XxMtQnOurpHLSWtlEor7KVPTMCOsLKPs0UmVcFKEOKUAmjXh?=
 =?us-ascii?Q?urcuMOHlbtUhNH+k0ivSuFt5t/N/wuGUh9U5QqdOssbOluAoJFY4UnYULdGB?=
 =?us-ascii?Q?Ip3BMzLdM4+UoTjRvsJ1rx0SW1DKsLNzlPcCfL6GVGRzGmrQEEZkPzuynAd4?=
 =?us-ascii?Q?B1wD/Vk9QdJOHfW4ROKhbRLACe0CWclusNp7udpb7ZrBI03026g7QdZy+Fdc?=
 =?us-ascii?Q?/nZUn60Dba2pfQrN4wLQfvRSqB/60BqRnpsZFd+WaazCVN9fSnOi1qIlpLt1?=
 =?us-ascii?Q?y6wyCAPNniyvEE5JgUcgT7xpcvYvnKppcBP+Y03TirtCmTJlFB8tlugvbuUk?=
 =?us-ascii?Q?kBxmQiXzwsygvMrxgZh96G6FqKUxh5Ew/I4JQ3QQ+F4AMdNWgHsBfigD7t2x?=
 =?us-ascii?Q?OaUh21M92SxGhNb86xEBLJj5GQnlWWh8JsQWr/vd7BrB+0kC0ZjiahZ98Ay1?=
 =?us-ascii?Q?nDT4KtJ8JiSscewba1KL0puWMdmpzkgN8ZmMWCVet5CGubFK4WGSKy8YbHXS?=
 =?us-ascii?Q?eQrK9zse4tlEFQIM5X/ga+lgK1macRShKcfK8TARc7o18CC9l/+IZmklYcSR?=
 =?us-ascii?Q?eYZ1OFtneUw47gTDEAXUXD5a0ejV3AofophfGLal2trm6YMOZGO7EcCLSuxK?=
 =?us-ascii?Q?vRd1HGJdGCZELj2FDwNxck40FU2BY3RSj6Ftl6o8OXxcrc8Rq/HovAUO6qeW?=
 =?us-ascii?Q?nYVhkqwI1TrCTy5HY67BKSeO0OpJ3sYUgTu6CxlrSOh1woFFte4O4vdF5IK4?=
 =?us-ascii?Q?hrbVkorbLq5md248z/xja26ViqS6zdE2r/VKOAXC3XSIYVxWOXPOfHo5vDw/?=
 =?us-ascii?Q?mK5l8/bRoRSyTo8mIAlAw5W87Sc1owIt8z/UF83QYefiLzInXfi0hSM7xuIb?=
 =?us-ascii?Q?uagFoVbYd3tQrW8JCZCy2VW2V1FvCM0omvLg8SRpH/LLCPJcPeaxQShDC6uU?=
 =?us-ascii?Q?HnCXMHuABlsSA0KQnvMFh3U+PwpmIGM+wQlkwWbgPp7UyjjWIjIouI0rT7pY?=
 =?us-ascii?Q?s/syYXgXLZkfPyKcf3XF0uvTdPIuhfb1wKNrRBpM8hK/WSXW808XQBJjuBgP?=
 =?us-ascii?Q?Nk78Ko0hqvwiVxwf+G3Hfzxr0pFhzlAw05OiTram8i6epTUxc5jcf5s1WQei?=
 =?us-ascii?Q?/cCDpykMaAYNrPeDiJGAAEnes00KHQupAOWdnLciA4Qaz1FE0dKnY312LPfw?=
 =?us-ascii?Q?O7S/fnqm2QhDjDm4NjrCY4SnNLsszxPFVKHuYGKnKojznThGEqN0usIWOL0q?=
 =?us-ascii?Q?25gJ2NocTFBy0GzLaTcKfUOOYT99mhI+PTwR3OlOBM/dZUl1fUuqZ8xb5WRN?=
 =?us-ascii?Q?Skark8l/uvRYXWdcpktlDeWsJ7+oGwaavz9ysInEWRvdaBhqlXich+vgBuSx?=
 =?us-ascii?Q?2bFptuQIaeU0ODlx0QJS8iFVnLmcUugU+g1fnJ0XKaTYtyB35ZWWYJ4EuDr0?=
 =?us-ascii?Q?Vvcd+Alrpw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eef9dae-a520-4ca4-27b7-08df2b67d69c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:28:29.3072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lZR/cYkzHvrJP/Q+P/xiUt3AO2Da1tkYyKrL1dvEnX32yOw4Gx0TRq4kOVemARsxsgS29n9Nv8DYrJjhTyj4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9539

On Mon, Oct 12, 2026 at 05:41:34PM +0000, sashiko-bot@kernel.org wrote:
> Since this schema inherits from /schemas/i2c/i2c-controller.yaml# which
> evaluates and permits the standard clock-frequency property, should
> clock-frequency: false be explicitly defined in this properties block?

Yes, if the binding stays. Whether these bindings stay is being
discussed on the cover letter [1] and in the RFC [2]; I'll handle this
together with Krzysztof's comments on the bindings once that is
settled.

[1] https://lore.kernel.org/r/2026101355-species-glance-9ff8@gregkh
[2] https://lore.kernel.org/r/20261012-lstp-dt-rfc-v1-aambrozewicz@nvidia.com

Adrian
