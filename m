Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012002.outbound.protection.outlook.com [40.107.75.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F33C7DF0;
	Tue, 23 Jun 2026 08:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201841; cv=fail; b=fD+x5ezL0c/iYSj5cc66CNVph+QUXHpo1S1eRuYsul0v3N6Kt+amM5Lgis/d1SiMYNVHtiTxLcoWWebL0H5+BpMRrF14dVU4vhMudtrjuLyoTxkZOgvGAVg2t0bh2QkwXt/r5/hD/GOm6tQ9AViD59mhNMshxed6MohlK7o/P6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201841; c=relaxed/simple;
	bh=RzaHJgIXavsw6y7l6pN4m/1TimzTcgnadGr0kRfHmvc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cWO3TNSpJjqPsSLyuD7ipObKW8wjqhUoMGQSUyUgKGKpQCee/rqX4rtkdp4+f3+7syQR9ml7xoj5qdbcLLMEuJrxXgZd0wMiAuo6HtPwL7GbAoyungL2hX2UEzRnX3ou8Qf7PSmOlunOVtKb5iBmQGkyn/TcjTp5G+Mf95MCPhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=GiFTF3V0; arc=fail smtp.client-ip=40.107.75.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="GiFTF3V0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VaBhEw294CdrC1wbP3Y+bK0cnZKQ8zNesUbAjgTGAV85Yry9HsRJrZlBcyikRDQ/KBCdtKsEsAB6fae5XfkLvGkuLsFrD+qgKun70H/9P5JTssm+g8sXj0Bq1ywjkoI7e1i/B0MTKGcG2tqeJXDL7QlSGwbKdcEapzrCpQ1DB7p00YLCYqJuu9i1YN0vg0/FGCZJRaXIBC/XMjj3TUxntReBZM2huZ32m+bLShyB393EfudbD+VI1QuhA2cI9yJDfQc/W6RvnGEUQoYypPY10/7JNqs3InIj02Qkh18RBJwt4VW+TVpcnbxJi1HTfzH4wx6A1KL7rJK+P0lLi32DgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlXDlyfAoqzTpo+DWj9Tv0XH66Qu6Dquvigrcb5d6pc=;
 b=JuEe8krh9UaAOJaUmqWYBS0UqTH4VzrNMlCETiJD2bpBjXsHH3lHagsALpojhatAFyzL2iTRBvE6fe3C60QfoLQz4RLMmNnYsHbQnraiopBAsSXQniciuF8UBx1dsImsu0Uk43qrp4504boTMwvEYR9Uc6nLvAyZLy0lO4J6+xt3tqoR80bkqJjBKWP9mw7ud6qgoPXNrsr5C2/GSoLWYrJ3yK6NFg8gTKi7tNPUlwlieLkcGgFVUTjjbDm9gAS75JzKNacIOErir8Rcrljxg3+R0H/At9epmkORoMxvthv2lQdRLnA73Wzo1y6eSp0Pjf21lhCwKxCkMCN2ZnbaKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlXDlyfAoqzTpo+DWj9Tv0XH66Qu6Dquvigrcb5d6pc=;
 b=GiFTF3V0/l6l78lyjw2Ef78jVNIa0il0IJaAzwEV1f1WV09Fh/1xX0eF/+P92m02KGJie8tOlwQIR5+7MCH3O2XzCftePxBQwcgwcFrlJ//yHom14kqn/rd0NIuIo8UdXyfBigI3XnERGeaxK0YUiNksfffFNBGr5t7FwQw1sk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by TYUPR01MB5306.apcprd01.prod.exchangelabs.com
 (2603:1096:400:359::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 08:03:56 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 08:03:55 +0000
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	FangpingFP.Cheng@moxa.com,
	Epson.Chiang@moxa.com,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>
Subject: [PATCH v2 0/4] USB: serial: mxuport: add MUX50U support and updates
Date: Tue, 23 Jun 2026 16:01:35 +0800
Message-ID: <20260623080138.166398-2-crescentcy.hsieh@moxa.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To PUZPR01MB5405.apcprd01.prod.exchangelabs.com (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|TYUPR01MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a81cd6b-073b-482c-3f25-08ded0fdf8e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|23010399003|376014|1800799024|38350700014|18002099003|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	uN4vPjjoiED/DOy04VXE1fQgGX23WxAp9GLfQqFjk4cbQnm4FtsjEe/wOH7YM9ULk8nj49eqMqD2BmdBCeSpMvP5gANAOvikXVo3nOgIxaQaipKTJdYu8JludMMttcuDIxXX/9MyYeCOFxGNAYWKHOx/R4K/ySzTWZj6/pQbb1c6I+O3K7UaHCUFUxXXQuvaKCARS9XO/bbb6KX66faHh0c6UBsAWK26Tzq7+tfWuelHMIEIWvvwLKp7d4WcKU5GqWthoQp67SmhRipGkMXnvjsHMOMGe7izuBZhMQbtByoU5tUUu6rtctuea9oeTVFOHDIGk5yFE0LiIXGY8oj22WYxFCbM60dvCSu+Tr6xreAp/tQqzxK35ILCyCCLi1MhFdw18tKXvWn8ctb0d6zL7ssPkAzEhsD9WdsHRQVs1mYPTIJSIFj0Gw5WTnTSsG6V1u85IhHFoz+P3UVQwub7FXGgTDvg1n/pMZUhKNpxbk8GByxCt7lwpND2ZdSwb0jcvm3lXFW+cv8W7W2mQefa7URAqydDKvaqBTFA7p8CASdH4t/3cqN8nN8P4cylAuBtgnfbGq9f11fUwDRVTH4lUmPrrbCWeYz2tXoc86SGG+lv073pk7iX8nbfpTywCZvDjpqeDSGp5HDpFGQir5hqKHgkUSmAABi3lXp0+72NG1B14xX5pwkP3TKezqDxst7efk6Qm1E+E2YeOei6yat/2rixmwMoLeKKz6uMkzPUBUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(23010399003)(376014)(1800799024)(38350700014)(18002099003)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QpL39QuP2cud8hzfEFOsH5P3Be4T5TuSKw9mq2DyUnSVKPk79kfygnI7Luu+?=
 =?us-ascii?Q?tIpDa3mxFf9xWg0DW+9oEIt0VPMnuuMLjWHc9eqWRnrOi+RultS7ENYzI9Hj?=
 =?us-ascii?Q?dY8uCkIIw0b+V5gC2TWZvTJollLkk8mzKb+QIy9h2lhS+EgpGTzqlYJ4btnm?=
 =?us-ascii?Q?+NDEcFAH+gNA25X5TeOmrzI0/wR11FtYJS5+Bz0MgMgAc7D1hkB3m79x4CoL?=
 =?us-ascii?Q?oxarYnWvxJrz91ApuwEoY474tjycj5GgoNOIPBNvsY/0oQ1MLHYd6FG0GXK3?=
 =?us-ascii?Q?E8WlIIs/mqK6COzGV0YsUlCEcxvr0roJqMgIo8mOrv15Z9dFWlcM7ZToOeln?=
 =?us-ascii?Q?zdfrilYnaxsEBJJJtj6JCQCqGlEWZy47l7c6FahswzMBARLI9yRtbvze02oC?=
 =?us-ascii?Q?6sEVXKMEPc8jEGpga/fIxOuimJ1Rybs8VJq6kEuKxF5EwDKO4n8Urx1/Lifz?=
 =?us-ascii?Q?y/NWLx036XpVB9e/jHwN0Ix7AdUTPhLG70k+eO6MqHEFkhEAYSUY2D3vLeEr?=
 =?us-ascii?Q?399TSFsHGIwsjsYe9TGi+blSd9vUsgrdepL7jdI/Dnevkg5z02QPti21SBsy?=
 =?us-ascii?Q?9owzAMali8TiQPu63yLgLX3GbEsjz9XONyNRQh109mEO+bL1A8+1i2Zlacpz?=
 =?us-ascii?Q?iGS7uO+j1SxUvIiEVTRh5rR5UdHg3wMv1s6Ss4gxVYdG1b1EBqHNlwbP99Js?=
 =?us-ascii?Q?UQs+05qz/j3+4DCZWHY4VrUX0Byv+ok0Cc1tDQM0MrNXpt0ECItNZTCjH7Yz?=
 =?us-ascii?Q?Psc+bGqmghIQOxbDwDwDq04Xk+4/OArOp+f2kBRzI7ST+GVlaM3l9WGcfsEl?=
 =?us-ascii?Q?pTImblIQsF/KKWgoIKKZaCZUGKjY6rcNX374EpKvDf2U5WKQiu31l9iNxkb5?=
 =?us-ascii?Q?xdwbWQM4dpKZXsfV/v75BGMGXrJf5KrE8y6d12Fv0sNO4twd2YnskzuW0LuX?=
 =?us-ascii?Q?jC7iJtDek4FySUz3MnyIYdM7/BITjjlct4ON2f32FHsX/br1VhY/+12jgzTo?=
 =?us-ascii?Q?hLMZlEyTk2Arht+VcxWo8FQgIbnc/1Ka+nU/kx5sh/uxbFBbs/BU9lj3TfJc?=
 =?us-ascii?Q?60woAsz3yu8grVZpaNtoeD40cZX8rcWaKR8/dRcQy0MA1mSTlg73PyU/Zg8G?=
 =?us-ascii?Q?JKkK01M6bZYNIg402CIqLryBemkWDUjByd+6s18DR6kjjyZUBxyelVE+gpnC?=
 =?us-ascii?Q?Qg9pXUt1fIbrJxUdca8x8gUib2An/Z56YDelFPfJ7QNPOVy556HRshF9jcT4?=
 =?us-ascii?Q?9mljsupbKrCwkkFZ17KZus6X3tZ+YxRUqDMr69MIu6m6DhUzxexoSTDErUKI?=
 =?us-ascii?Q?j/9yTlQ8hn67llkIgq1u02Lvu0VfgtfKlMte3DN2F6ojhTF5DkkxGYaBc++n?=
 =?us-ascii?Q?o3PI+A3TV40jkAsokYfWm6J3+8UIb/2uzuS8pBQvaR6TE8NFuRp4lTXCXXAq?=
 =?us-ascii?Q?ojmsRP+3QAEAert4pM05hzRTbDpHi1C2eYOeBgLsTtejTN7h6MCb25Qmaskm?=
 =?us-ascii?Q?euFkCIFZTaXqY93lCcXwQRdz/B5c8WrnaODWzMA2l+iwt1eYfboODIe7WUK3?=
 =?us-ascii?Q?IESZW6BJ0XcRurNQNmr3HKSolTYUgdDHWRhKuuIMxJSnDxkXpq6X+MSZAiTC?=
 =?us-ascii?Q?4Egv3NNGG6/SOWn8HMAozBZGOWMiB5CatzJ13IuhfiqJGxgQkhxh7PpsWGPP?=
 =?us-ascii?Q?LipULc8b1Mfm2LCd06bN86N9X7J2HgcBtxVKCRnOyHyy+x6TEMwqjiWKvqFN?=
 =?us-ascii?Q?Qbme6YzlHIJm16VKTCPy61cuvyy9cRM=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a81cd6b-073b-482c-3f25-08ded0fdf8e0
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 08:03:55.7520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bb4nA65w5uh0MI/XMAituGvcVaLl7MrKw104TDF2IZRpp6MIpAcWzJWTBIJb/yW1uS/nOKMlQj7czdhtNleK/96nWfYHLWMqJpdLGMzjrqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR01MB5306

This series updates the mxuport driver to support MUX50U-based devices
and fixes a few device-specific runtime behaviours.

The first two patches clean up firmware version handling and add support
for UPort G2 and Platform UART devices. The firmware family is encoded in
the USB device-id table so that the table remains the single source for
both port count and firmware handling policy.

The third patch adds SEND_NEXT handling to pace host-to-device
transmission. The fourth patch adds RS485 mode configuration through the
standard TIOCSRS485/TIOCGRS485 interface.

Changes in v2:
  - [PATCH v1 1/4]:
    Split into [PATCH v2 1/4] and [PATCH v2 2/4]. Clean up firmware
    version parsing and printing in the first patch, and move MUX50U
    device support to the second patch. Encode the firmware family in
    the USB device-id table and use the system-register remap state for
    the MUX50U firmware download decision.
  - [PATCH v1 2/4]:
    Moved to [PATCH v2 3/4]. Add mxuport-specific write(), write_start(),
    and write_bulk_callback() paths so SEND_NEXT can stop and resume
    transmission without returning zero from prepare_write_buffer().
    Drop the open-time FIFO flush.
  - [PATCH v1 3/4]:
    Moved to [PATCH v2 4/4]. Clear unsupported serial_rs485 flags and
    fields, cache the sanitized configuration, and protect it with the
    per-port mutex.
  - [PATCH v1 4/4]:
    Drop the UART FIFO sysfs interface from this revision.

v1: https://lore.kernel.org/all/20260324035041.352190-1-crescentcy.hsieh@moxa.com/

Crescent Hsieh (4):
  USB: serial: mxuport: clean up firmware version handling
  USB: serial: mxuport: add MUX50U-based device support
  USB: serial: mxuport: handle SEND_NEXT transmit flow control
  USB: serial: mxuport: support RS485 mode configuration

 drivers/usb/serial/mxuport.c | 514 ++++++++++++++++++++++++++++++++---
 1 file changed, 470 insertions(+), 44 deletions(-)

-- 
2.43.0
