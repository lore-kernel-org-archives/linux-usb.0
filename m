Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023114.outbound.protection.outlook.com [52.101.83.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD03A382F;
	Mon, 10 Aug 2026 07:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.114
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345945; cv=fail; b=lIxCU0GlhcRRTu+pb2V7p5iqBEixKrBT86AsUHzCoZ9iRtGoA65r/E4BkkIo1Z2wbl3QM1jg2VR0l+Yv14MmfqfdJiSWdel+/azDSbXBkqjfQBhOMGt1RnMIxiy/ZcPROJ85xyZK970nQDDnTf/alrFlg01y2d+I15B5cWndDfY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345945; c=relaxed/simple;
	bh=y7o2w1yMSPBxOJljnW8lhrcqquuTpwCROHm5t4n4l64=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=F8tofD/yLtNBtwaZASC5XyyTKSEAcmGqexLd4WpGOY1LwSnbLl/X/x9PJhWa7GnhXDbNFkmWNmJymd1sg0BfsAsWJuQV7FcG3wrW4NKCYxOji7QTRn88X3HKKHvoYObBS4jdBMnvXZvkF3RCqgPoCYo7YBZqdzf/CutkJXMOrVM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=InZy4QWv; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=InZy4QWv; arc=fail smtp.client-ip=52.101.83.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="InZy4QWv";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="InZy4QWv"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=V+uy6oHdv9pHfCz31Y9S53yzw6rBRfjVFO4JY4iAxSmdWsRnGIHHeUKYKbrsC6QWkVtIiDK9dL5J8dEDJbfMJqKl7i1USsL1mo5yvcz9DbgMLI3714u2mZOBhbwSUSYFEpZwxlRk50DyNkLBjajLxbg9DqotINx5jStRZ9rD/LD6Kekli/eCEL5q+kpfjkbtBkmyBZB3d7yT0RBFwQFjLUfpp/YMFXjb+Q2e32gUs4BDc3aFVMTI7lIQwpLiXfXTUmEiFAO1hsn8J3loOmc+Z7Nx6+MqMyW1zLvSteIqnF7619Ro+qtEEdZy8MhTq4EHmqj0Tmxwl6Q2ZantVajfcg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=gAIOrG6JVgdzeQLHI5rr1jALDrsAuUZ1MgHMo36g6+J2l5APo8T8Jp02fsXeqw1JFoi8zl+pdSSJ6slv5cJRQv+y84Q0XZIdemJV9nk2a+qVlLIo/fg1Oq9dK0VQ9KU8ergrrww3BZ3qEhwSKJrvt7J9N5/oIBxdUhrAmhIjm9CezsJBNLpya7OhmWN2UB4xSl0ckxmCbNUth9ptcDkOAihpudjrV5B8HLJNo+mGZxMmTWAbWyVUxWnkjh/1VZc2AQdLoBZXnSzOfslImKezOKmnf7yFTyMQdCn31r5Xtld7r22cxsi638sQYGMwJRWGhn3gvtkUXVZHdC3x7d+/xg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=InZy4QWvlSEYtYJDjeSTZLMbctlREaup7URUrNv3tUdTcRZo3/hsl9YfZbUp7urhv+rogFdcXfOMiKa1Us7uwpHujDtNcFgIENEKr0MrE050Fh7zecq1QgpCvxmFCdNGHAYiGGWZnqZqDOl6mGBaZC2vVORUjmDMkHgOT+t0OV2Rwg1KifpCWaNJvmKSC1RNa9GIqJSor10Tl11bPyYci7o3Vj7zeXKt9P6EzbMQ15vBZqhvs+vLDmHdIeCNGj3RECRn+rlNXo0vAhidW5HqfJLh49a6qk09n9iYE2VQUJnkbxKCjeGbQwCftIc+Brjd1+JYISGaCP9FkRIY1EsOig==
Received: from DB9PR06CA0026.eurprd06.prod.outlook.com (2603:10a6:10:1db::31)
 by MRWPR04MB12145.eurprd04.prod.outlook.com (2603:10a6:501:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Mon, 10 Aug
 2026 07:12:16 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::3e) by DB9PR06CA0026.outlook.office365.com
 (2603:10a6:10:1db::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 07:12:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 07:12:16 +0000
Received: from emails-8828329-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-60.eu-west-1.compute.internal [10.20.6.60])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E37FE7ED94;
	Mon, 10 Aug 2026 07:12:15 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon Aug 10 07:12:09 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786345935;
 b=ccvIoFnPM9Wx7RkPSr6zrP2b/ncRgNPGM/AAZ5tEfSvleZihe1DvDT0YO0rbuCnZzY0as
 1CgR4R2C1U5DCpJtpMJuE+h7K1K5i16huPw6LGCWA9ATqh/hq09G2pR/HMvbAou7iIF4Bt7
 Uaus72LqmX6x57jn4w7xvEFC/9gy0/Y=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786345935; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=naFQzs57tk/rpEMl6tHnHvsEdBA/jIKqgs7GPzj3WnCOi/l1PEB15HfwvMiRJN6eql5j1
 hwzCSqALFiZV+qahgyEalUjAtklfChT31V9Js/wnS7yKnSWBsY5RP+a9Djh0o8xmos8gXEH
 Y5tqrV+NpnIoV+Pmb2EsEpgQ3PnX+bQ=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=InZy4QWvlSEYtYJDjeSTZLMbctlREaup7URUrNv3tUdTcRZo3/hsl9YfZbUp7urhv+rogFdcXfOMiKa1Us7uwpHujDtNcFgIENEKr0MrE050Fh7zecq1QgpCvxmFCdNGHAYiGGWZnqZqDOl6mGBaZC2vVORUjmDMkHgOT+t0OV2Rwg1KifpCWaNJvmKSC1RNa9GIqJSor10Tl11bPyYci7o3Vj7zeXKt9P6EzbMQ15vBZqhvs+vLDmHdIeCNGj3RECRn+rlNXo0vAhidW5HqfJLh49a6qk09n9iYE2VQUJnkbxKCjeGbQwCftIc+Brjd1+JYISGaCP9FkRIY1EsOig==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:12:04 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%2]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 07:12:04 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 10 Aug 2026 10:11:53 +0300
Subject: [PATCH v6 4/5] arm64: dts: renesas: add support for solidrun rzv2l
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-rzg2-sr-boards-v6-4-41faa32cdafb@solid-run.com>
References: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
In-Reply-To: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>
Cc: Josua Mayer <josua@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI1PR04MB5807:EE_|PA4PR04MB9688:EE_|DB1PEPF00039230:EE_|MRWPR04MB12145:EE_
X-MS-Office365-Filtering-Correlation-Id: 64abd526-9be1-4732-9467-08def6aeb563
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|23010399003|10067099003|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 ++ENENhPYwMCqW5JAqLhOoVpj6pMY0GTaM+40lAJhuNGZ8p6x7ywNChp2dhfFhoQH4o34pS7WpULx3UK4iysvxgOAKBTfUgSNV1X9/4gMtNgmmDe+vxsNVbAatSLcRGkWDtGlnshaqT95Q+Su18i8rycpLWpVnJhY61HPc8lLvJYBihYPuIL+iRDHv2+sxywHmqyRLB6mVCDuIGkgYLc1TXK8QAcDvLpD/5G1owC1YGEduXUfbFfHEhnxdokqAmJsEHC8Yrjs6bSxXueFIT3+JzOl6VL6e9zT/lrPQCdf7l0FPFfMmFH3j2+2br/tnYdvmgzYqxBIXDOuPq84O/K3o36rDY2G3PJk3LFb5GXRcLMpuygU/mBGF80Pf/YJmxSK31yPkBXDXbXCixEMeO4ZrqAQcm4TSZ0Z1k5RXfjLVki+QVAByYRN0uunh29pgs4LxguXk/rBqB4/b2XtCt6u8RHpK23KHufBveTn0CJGXTGoZNP+9zH/LzFZhrISGdt6w0RI5v/qUzADBOc2X8j2rG6SVjEG8HC9JJVW/ULcv4jkHCrO95VSX+KINGLk3QZ8rDMg0EEaz3T1SMkMymdhZKF26CPWq4G0DReE4bm79jPgaHdcKj35g0CuFLYeSQtsZb+9Gezb/aAMNBBQ5pfSom0Rj60u/kVCRVJwERHFgApoFpE2Z3zaUUS3ePxKcvCrdWYEa4TMzcNiMwEyTjBOHiWerVdOze6gNCrKj0k8BI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 lRkUE2G0CL+MZE9HngqMdznlms4+BKlMTJUGzv0g+2ERj3RKtjNxqB0bIEsXjsLgKmiaK1Ri6PzpUD/LPiTGkAU5fKQ6fR7ypcDtkfbH3JUrjNZMpqMK4UFyQ8w9youLWWu+9OWZd5wBAJo3bxERUbp6IxDCQQuwhtE4Mth9Bp+uqBtwkFvVBb6C30QUyfR7SKyzkgL0o2xTQWhwNusfrJGSFa2aFVokTqso1L+7o1m92WOjgCAMBLy32kj/HuCGCtnri6Q0I86AcvDOpsyNJrE2rP3nFuHb1hE90RjZDs3c0mnNBIkVj8u7BAEd38Us1P3NrTrMy17xZqDo9Q27yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 31ecd143b7144d869fa101f7fa5ee885:solidrun,office365_emails,sent,inline:296e93809dba7f6842e6e1e7503db0b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGLUSFL15+fIvY4k/2XFOe0hZ5ZDxjvilriZGI+AgBZuaMmPmee4aUGYFs+xYXGajLoT1mJwzYrd7Acun42WGd+mXtM87FMunAC5UYR8XbTbsxZYvYOJZWxW+VPx8e/2j7Mig35D57ffaKaEnmnfYwrG1gKiD9CH8P0bh428JX3RHg1rQGV1olpRyMy13eFrGHaxSbnBRhGs+xqoJZQMkNsZEhPjk/0IXf4kn6LVdd/5XDsijxrVHlBfFPIgMQqKDv7OQPIeFQVbApggQHObG3QJcT9c434ovHbYvoOzVVyKXdSXQ303C+LbLMGyNZXkkyN47ETUUDt1k97SIX2WfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIqdjVfCfVhRgnSkiTYGBOtxTJhbqSiorzxZBIMmqGY=;
 b=Wn8Vwk5vOPZW2mSWPv3tcuICxaOMYPoEpS203wpwlU1TnFKyVDcaC0JcocDAAuewLJHVD3GdOGXCP6VFxoZZBWYgYoLMrrZL8HrPV+FCbj8oyKEXgo9OV+/9WppoPRPASb6WZVX0edAicjupeF/IZIiLbfdCWZnENyyfmKFwf8ZihECXUHW/8ITnpyqeUG+4HX+v7e+5wTuprrron6OG9zebTBeapVSZyxLb8Qx6ERUhI87cqMuLRNrPHyKEfASSa/erE2glyiCf0Fc8rZGj0y3WkAS/LPkBC1Ddlkd9FK0kKaxp0hMfO1K489HxXeGQDG3YAk92JBTdEAYVMaHH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f6a4563-80b2-4ed8-3949-08def6aeae58
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|376014|7416014|14060799003|36860700016|23010399003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zG/mDGrfsRos6R9lLCj6RcVwgD9OlcPgcKxrKv4MZi+uQ2QR7O4gTLNRpV407lWfA8BM9NcN2LRrpLudtbovzNglVpjQ8rLMY/xpIba+8EzG2W0xvpuQBtPvUuiVC3Co1B4qf05UPnviJaO9KQ5W0q1//rf09STnjwZZwUFffNkwBYxU/4OoNtr0cbp7TUwGVm/GwlLMJl7cZlMF8/BJIK9UsPr3jUOJ26gBNj9UOqhV2SRPDzJ+6mJ3u/31boKmwnToVWkxK6ca3KUKilFwGh64PSUzRoBCS5La+9CKdRbpVCccydFh1tzQkpss+AjvyEa0i1D0UDWXazPFNnJUQoU5yEGZQfH1rnKpJA49fcntftJjPbHzeETQzvvEw2qnRXH7RUgX96liK3fWSRDDRpgeHA2XUDPTmpfgq7ZAD4dnaMcRN6ZkfuKQrom0GT5MgP7u8hnbPV/Zs5PFYemmk93uLEhVDQFSxwvLqxrFaIUKLnKKekKUUHwweeoCtxWUrfI9/7HJ0SEvSigRxyPTjEDhSGTips4Y3TCLFVkXpLaxLuuMqyemloANFs1U9Yh0bXjRd7CilRKVLpTOA+l8SqOGXSn0685qGFSekL6VRJpZ3/QGLbhHe8sE/81q8peRKtSYSjxJGW0IMtUHFe74UpZ+cR9in1+KHjn/XC4cI/xb3FIa6q9shkrNTjh0SN9Ma91zi8/g6jS68KJAlNMVQw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(376014)(7416014)(14060799003)(36860700016)(23010399003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	smxp62W+8WdTWoltSY00S6Z9Pat+YzNkz6fXxeCnIL1NDYT664DdQs2LccCwn0+PEsdFUkT3fhPAAI56fJxCRiVYWMLLZlfIzUKj0Jv/vr2sFTQvJr7cL9TLIHPHtcq8LjglAuPD1ZkiePD0C5JEQee8Q/WuhGXyFwGn1Df7UbM9ewv2wqou+dmbWfDJIoC/nT/IVyWvxVRuFo6MCjXWFMKC/dsya1/4NsfGqhKDViEtcir27R6//q9IJS36mctAH0Ty5OoZIo/iYOPaSFL0n/bTKVY7LRQmcTnfUb74Bnq0LexRPxKpl45qZYdgxsXHkuvSAPczxA6+3/LWgcrdHYXvXSPaErznRGhbivzuHV7gulLizv0lqPpEsz/26acNSg5qkg7W+o+eVeLVZb6mU6UJlTQ39xd2WjX1h7Cy3IOf71goVfayHkAEAyLh5NJT
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 07:12:16.0712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64abd526-9be1-4732-9467-08def6aeb563
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12145

Add support for the SolidRun RZ/V2L [1] SoM on Hummingboard IIoT [2].

The SoM features:
- 2x 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 2x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)
- 2x CAN

The RZ-V2L SoM shares PCB with RZ/G2L, differing only in the SoC itself.
V2L is adding a powerful DRP-AI NPU which G2L lacks.

Due to the similarities most code is shared, including DT overlays for
eMMC, microSD, and RS485.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile                     | 13 +++++++++++++
 .../boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts   | 16 ++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index e2af196e18bf..4a0cde8cc3b7 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -189,6 +189,19 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-sr-som-emmc.dtbo
+r9a07g054l2-hummingboard-iiot-emmc-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-microsd.dtbo
+r9a07g054l2-hummingboard-iiot-microsd-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-a.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-a-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-hummingboard-iiot-rs485-b.dtbo
+r9a07g054l2-hummingboard-iiot-rs485-b-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtbo
 r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
new file mode 100644
index 000000000000..d77a6ff163be
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g054l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot.dtsi"
+
+/ {
+	compatible = "solidrun,rzv2l-hummingboard-iiot", "solidrun,rzv2l-sr-som",
+		     "renesas,r9a07g054l2", "renesas,r9a07g054";
+	model = "SolidRun RZ/V2L HummingBoard IIoT";
+};

-- 
2.43.0

