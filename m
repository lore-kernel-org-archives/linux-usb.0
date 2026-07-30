Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022125.outbound.protection.outlook.com [52.101.66.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D025F3FBB5A;
	Thu, 30 Jul 2026 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.125
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407953; cv=fail; b=WMLJyaPZrMCzGVhRkt6FRuARMGFxwqCVbMYhfGRkKKq+0gG/8ieL50CslPQocqpXYlgg9/X3tQkPWTUqUUZwUl7RosdHZbRQIjiodk7t50+SY4LMrT5ta4PJDiv6EDEPNiex2Odsc4M+CRlpxmEU87SpZcHHFLSLBEWD5yIVYds=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407953; c=relaxed/simple;
	bh=Xi2TSzREafuX21RPyKuvS97gFD/c8R082BedsKvNlK4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h/BEAY5KRbLjm9cT8yfoylHLByI12wqggG2qODYQRfXSrJxv6T7EtOqJsHD7FJjyA/W1CnJv8RMnoEu6TxVGnjEzfYcsKyuDVT7Yr/O+4kPoQct2ImdzBIpTw2sutMKGGnlTHKsjTaY5FyPmY+VdVDqIxjxTBHV7eQKkSi8Jx10=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Q4PTXcpP; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Q4PTXcpP; arc=fail smtp.client-ip=52.101.66.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Q4PTXcpP";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Q4PTXcpP"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PPbe5aYmhGHyMVBmMGK2Jv5R19y1SZz6km9NcerYqVV2TlABO1SWv87wbLSITxNlggHZ1kyb70Br7DzSHCh+78BvDAzVq3DdaSmUyKQJLAvAgC4xM1XwAcOYTzhhF4BtTZX8ijPDD0SY16jokzSde0mPZWVut9blawxnxdK9NZA1w5PAPBuBwDhhZHKUiO5Td862ntjR+C9utUE46csNdqyB2kogqIVDN73ZJEVjnd/R7tMmQSwnCPEsXekgQCOAcHEmTML95mEuxsQrBs+yOgJCV4by6585vLk3iJaaIlM8jUDcPskOLNzsCIACF7yl9t3D+6ue3vQo2ronyRTEwQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOk+aCFNa+CuOSCIktnzE5xRua2Vt2jSvN/+3FfoB8E=;
 b=K+ZsbpdyRQ49XRYd88ImmQkGfvUYNq3YecjyJXUixpMdg6z3XKLDkWP9kUNZ0d0ipP0nMoDHcrHZZhyfm15fXh0brTCFEoUoALk9Rs6Ed+Sjfym8CdcdwqD1Zozv+UbNrgW4VZH6tvio+KYMM6tK6J1MPVeeZIWtsuund9siB17aQbTmBpT/YKfrvk99jH8M9bZnQMwvobTAGIPTQlAMYYhaXmWJcWpOEiBmQOf12mLgtCeNRqz9LuPDOFv/MU8SJAnMCSnH4+XyysDm1PK4gaQ6HPZdiG5mJQTPP6gH0NFGvB5OC+W1g5CiIL5DUVDoie1hLEFQKlCVZDAiuwDelQ==
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
 bh=iOk+aCFNa+CuOSCIktnzE5xRua2Vt2jSvN/+3FfoB8E=;
 b=Q4PTXcpPIgFaSO/yTQ2L4cPV9gGvubzvU6IUjcemVJCtx7yh+p4O0rA004mIaZE2/UprceAfkgUTHJ7ciM5ieWew4wILf92nEXnuyRiXyDjc1NO/EHL2pKpOknoRdls69RqSQlp++nDymI/TPQC3R78rY3F+VDqjNVE+dmmu6gphKyIgxMqIyLYl7AiA/516UOtifbq0TpaE5yOfH8ETHH5X2tqYI4tp3OVcXISYFKJ2Dq9zKoOXCSS0U2bbiySIeNdmF4trSPLaD3jamcX8XJ3RIda5qCObRoUB3BYA67i6S6dg4W/vBinNlfV5Kuc5RCFAFE7/FsrzGMomaYZh+w==
Received: from DU7PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::15) by GVXPR04MB10540.eurprd04.prod.outlook.com
 (2603:10a6:150:218::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:39:03 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::61) by DU7PR01CA0012.outlook.office365.com
 (2603:10a6:10:50f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 10:39:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 10:39:02 +0000
Received: from emails-6980821-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-100.eu-west-1.compute.internal [10.20.5.100])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B952C8126E;
	Thu, 30 Jul 2026 10:39:02 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Jul 30 10:38:52 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1785407942;
 b=UTg3shUrRQuz0i5dS+zv2iyZhD2PmcIiR5SrDcc3kixbRwFUCKDrHZPYjw7x4laz/uD3k
 514DIzfMjXj3NJUw+sy9vqpf0Y0hsB6LXIlbFBJccrwgE6nQBWbCp7rrUWaFwPpwDjyMWi1
 5RpCCTA54DuGW5FavN4oszJL/14lEDg=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1785407942; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=iOk+aCFNa+CuOSCIktnzE5xRua2Vt2jSvN/+3FfoB8E=;
 b=fj5fujIlv1eyj3wzkUBXljuN8/1jxTid1x8LTPQoQy7yCBGUlVT49p7MbALFw8KPJtlWx
 SEJZTlhfgw6dzwTmdkCQ9EQd6vcivAQTUIDNvdh6rAxOUv9mHoF22O/OvDE3WtwDbxpCRYQ
 oMYEJcfj12pHQ3aLQx2FsAqxHvmSsQM=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOk+aCFNa+CuOSCIktnzE5xRua2Vt2jSvN/+3FfoB8E=;
 b=Q4PTXcpPIgFaSO/yTQ2L4cPV9gGvubzvU6IUjcemVJCtx7yh+p4O0rA004mIaZE2/UprceAfkgUTHJ7ciM5ieWew4wILf92nEXnuyRiXyDjc1NO/EHL2pKpOknoRdls69RqSQlp++nDymI/TPQC3R78rY3F+VDqjNVE+dmmu6gphKyIgxMqIyLYl7AiA/516UOtifbq0TpaE5yOfH8ETHH5X2tqYI4tp3OVcXISYFKJ2Dq9zKoOXCSS0U2bbiySIeNdmF4trSPLaD3jamcX8XJ3RIda5qCObRoUB3BYA67i6S6dg4W/vBinNlfV5Kuc5RCFAFE7/FsrzGMomaYZh+w==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:38:49 +0000
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f]) by PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:38:49 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 30 Jul 2026 13:38:36 +0300
Subject: [PATCH v4 5/5] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rzg2-sr-boards-v4-5-08bc459578dc@solid-run.com>
References: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
In-Reply-To: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
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
X-ClientProxiedBy: TLZP290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::18) To PAXPR04MB8813.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::24)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8813:EE_|PAXPR04MB8974:EE_|DB1PEPF000509F2:EE_|GVXPR04MB10540:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c430d1-cce1-464b-7e09-08deee26c5d9
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|1800799024|366016|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Leln77MMjNxGKDhedBLqfL4h4jkwaztvWXyyThaSJ/tudQYWdeEUehb9WHXIRbEdB0Sfg8SaEdJAB3Tq902YLwSFXgknwjGDSkodRkqMnLgWpxpS6X/aLqTOOdgOu1xXZap3UNAAerNCgzyt3qhCUhiC9FAnr5m4aurTL+xXsyVVEOwUf/VdUprAueYl/miVHdYB46gQkJuJHoUReRExuttSG4i8Lh1RI0nNPfRpi8JAgN1cXvLXCa8Yy4oAOdUtl7jAZgAKTMQ7idIZR6ddgHSEhgmAjob1GqeWAKQfDFUTu9oztH4kT+y6Ta2jSjnJju1D4FPmOxGhJt5dHXOxiknm6RcRWySCKapuNH2iWJ+jL+qMXZqBd6vxJRP1h24JCtLVfBGa6RBllc6EozjfREGwY08waBOLV1AuBbEAIHwkkuMqfSMlQKutK8IwlwmD53l2MvVXZqyRGog3sHEbCqcZNypiT1CkKY0RWsOVWZoCDI/Cp+4xJFDeSD3U1n1eu3lAaKttJIyFAOz/aGfrzeSvsNbMaLqaEA+VO6jDxAaTMi8yt9Ac/rUMd4eyYJwtIMJ6MGvAiRBtHX+wdVe/J26Ned4D7xlukQDLewcFOxSAIj+BOv0qTAkpVcz1iP+4aJIBXkEBSKrTEzquZ65rqAhg8yvX9mv2S2fhN9W6nyHePBG+DID2+KfX7yyTuAxZQpsxVAC6P0ducWpUNjI4E0AcoWFEl52jpSsdWjbI3t0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8813.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 cqEoEYsmvHiTRymJVLNWBu8VOCSqXjVjKr7V5OQspycqJZZdLlO/lKbPxPoyFg8CPU8uglLqK3Tb0VTbliZwKOBCy/lC2QQ612TCiG9ox9urwBF1TVhK1LVsPD0P5VcbUhlKsaKmTV8hHra5hV2YYLRqD1MNHvUBn21o84wCuiIl9Ei1zt2gRC5Ql7QQZz0uHkRtfwvlPPfGrzoyg7G9itCeYe+Y9hsVHrwen5+jghfzOwlHDEJxJ0WJfMUAI1aqVqFbDErXLFLN/NQACkNVUpHktMHTpXsdxMKgnh4nm1rFkrxmadLtx6XQgzExqO5Fzcv/JKH7a+mB+RcVmk7mCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 41b6a91452a243d09b620927fab622d0:solidrun,office365_emails,sent,inline:185e14fe6a660963052cdc6c626bc657
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJFgMf39UXpBC5iKAsOKYC59c94g+8KaIQZnB/nqn2CA+Dvym+HgWO3Id7dL7uZh9RrZ20U89K72b5f5tzwFPtlC5PhZUd36ZjV+gpDU3sVbYKDF4eRGs6+wauyAc6UcxmHoDABqBh61FmNIqHN7RZCpVxuXljG3/Fo62F/lreXOhQpEA+K0ueGfZbzo1Ejq73b812vo3JdqooFaLp1yiLQk3qbHco+PgdReD7JrKCMsHseYkpkQaHKv9c1cxQBBDoWqekEy3barepBKqvk4IDz7yxCk7AWx14tiossXq3shXY+xY+tyMDEQLCDNNBgoPce3DteshoFR5IlljR5haQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOk+aCFNa+CuOSCIktnzE5xRua2Vt2jSvN/+3FfoB8E=;
 b=CcYPHiNKM6kv3lkXsjJxmvg5dyMbCVQoApBltxjU4Az28FMv3VOVH/AOwOsy5ZPW/upi4oylGGyT5oJ0L6E79OV5wUeGHrvuMdtKERsB7pMp9v5oZenZRbiHJ1UOGiChQ3nLPDZO1itItf0VV/FLul+RMoAdc1fwTeQtbkmFXF/CJmdxmR1YFywTiFiN+j83UKWfdG11XGUf9Zihug2T2XaIFFTiPmyQsCr5NmgllubidSHww4Z+mtMaB0bwriZitxwldgf6NH6xQxzxiwBtFTv9u7OFugoUmYRGCt+QxTiCCXPxfJURY/fnX6PP6u9xqS4zDSUlGVm2c2Oa1VBtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d3e3452-e4c9-487a-c593-08deee26bdf1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|14060799003|1800799024|35042699022|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jDJJRK4YA105UEME5aNEpD08m5wbBMxJlktpI2Mr34zS1zCLv8622goIVWaQd8QLRHj3gevM8mfB6LAzh3qhGrTtMENHpBeQSefhhypRBbTrqQPDpPvdorPKutHmEGzxq8cbH/dBsZSPad3grUFJxLIL1Q2T4cVFlXskT4cxMP1VxFDVcMZ7dYrzOT2iPP2zVaqHep+NCYMtK3kVqXMpyelusLafAgUTK8Hozx760VNa67fKF1kLqSEEzyB0nP5AsR8NSnX4A8DSuswBRpCeVwYBDBzTqyCTQq0FeYT5EWNZJIP5JmDxlpla5c87cBd6+mNeOiF1DAmWykRtSLofAHnD23Ui0gbAkJJpqQHQrqOBo5v1UQm9cDNHnjIs+OEJADSN2lDIfUfTcQeX3q1OxeAOqz9kjf1nXvGcx+tzwVqj9bjLMAC/XYQjidHaLh+7TvxAdO6TB08ui4juodJOprHJ6x9xf2ClUfMl9JIn8kFpE/5/LJZ4lA+7Cfe3zpqhut987ZeUi6t8L9uAjPci4i2o5re0+rbeS2nJlwq8oDAIfXSJj7b8bVOPrh7n/o5C6zUgRzNIGYdi+I3vkVjHLwT1KzuMbLSf2owzvloXyx+HfCm2giJ+Qz+0jq39tRowZkCEsihymq+3g0aFPlcVJJ1z1SaGiS6eNeLccmxMfTdxeV4Qs2y5WGNN/CuigOgCsigps10DOIaVzcVZX6RfkA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(14060799003)(1800799024)(35042699022)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ACed4Y1u+pLhWpog16EaBtLjg2YZDlpB/2FHXsTJXIt9l27tsEIF6bJD9LiuQ0eOcwFwm9eNEd4ArFuH2K4NCbiKuvO5zU6RwG/Bs4wz66gPkewoX/vgSXVyb+H2br15WEtWKfRwiinKNC3GD7bLI25UpHnrYEQh01Glj1jYXGWd3v86qZzQsRm9iC5Lw5J1jEkF0bKr5j5A8P47fCvnFOirLiwm+yQzp5+tCpTvn7Ipyni141IlZtn6HKC6O2O7Kcb+hEQ+x4iUskZ1eYKzca/PjZoBRi47gzdliDirHrE222ApD4RovPccL5YqOGsM9yjvkeJ3qEE6D1quehBHIlMhLYGos6JZZhwDA+1MdI4LFcuU37jLEJo6Oe1K0FdY5K56AdW2njcc6g7GtGxJTlSROJPzbk60OWPvGv1ExC8l6yyyEQ14NeymOhiGAJrL
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:39:02.8307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c430d1-cce1-464b-7e09-08deee26c5d9
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10540

Add support for the SolidRun RZ/G2LC SoM [1] on Hummingboard IIoT [2].

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- WiFi + Bluetooth
- SDHI Mux switching between eMMC and Carrier Board

The HummingBoard IIoT features:
- 3x USB-2.0 Type A connector
- 1x 1Gbps RJ45 Ethernet
- USB Type-C Console Port
- microSD connector
- RTC with backup battery
- RGB Status LED
- 1x M.2 B-Key connector with USB-2.0 + SIM card holder
- 1x DSI Display Connector
- GPIO header
- 2x RS232/RS485 ports (configurable)

The RZ/G2LC SoM was designed to be pin compatible to G2L SoM, with
slightly reduced feature set.

Descriptions for eMMC, microSD, and RS485 are shared with G2L.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |   9 +
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 ++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 374 +++++++++++++++++++++
 3 files changed, 403 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 5242eff76ef5..79c06db9ab13 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -165,6 +165,15 @@ dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot.dtb
+r9a07g044c2-hummingboard-iiot-emmc-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-emmc.dtb
+r9a07g044c2-hummingboard-iiot-microsd-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-microsd.dtb
+r9a07g044c2-hummingboard-iiot-rs485-a-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-a.dtb
+r9a07g044c2-hummingboard-iiot-rs485-b-dtbs := r9a07g044c2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
new file mode 100644
index 000000000000..9cc21ae32ed4
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044c2.dtsi"
+#include "rzg2lc-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot-common.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2lc-hummingboard-iiot", "solidrun,rzg2lc-sr-som",
+		     "renesas,r9a07g044c2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2LC HummingBoard IIoT";
+};
+
+&vmmc {
+	gpios = <&pinctrl RZG2L_GPIO(18, 1) GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
new file mode 100644
index 000000000000..59635ac842d3
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC Solidrun SOM
+ *
+ * Copyright 2023 SolidRun Ltd.
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		mmc0 = &sdhi0;
+		mmc1 = &sdhi1;
+		rtc0 = &pmic;
+		serial0 = &scif0;
+		serial1 = &scif1;
+		serial2 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	sdhi0_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		/*
+		 * Mux switches SD0_DATA[0-3], SD0_CMD & SD0_CLK between
+		 * on-SoM eMMC and board-to-board connector using one gpio:
+		 * 0 = connector, 1 = eMMC.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_pmic_buck1: regulator-pmic-buck1 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck1";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+	};
+
+	reg_pmic_buck3: regulator-pmic-buck3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	reg_pmic_buck4: regulator-pmic-buck4 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-buck4";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_pmic_ldo1: regulator-pmic-ldo1 {
+		compatible = "regulator-gpio";
+		regulator-name = "pmic-ldo1";
+		gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <1800000>;
+		states = <3300000 1>, <1800000 0>;
+	};
+
+	reg_pmic_ldo2: regulator-pmic-ldo2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pmic-ldo2";
+		/*
+		 * This ldo can switch mmc host controller io voltage between
+		 * 1.8V and 3.3V by assembly option of pull-up / pull-dow.
+		 * Default assembly is 3.3V.
+		 */
+		regulator-min-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		mmp_reserved: linux,multimedia@68000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x68000000 0x0 0x8000000>;
+			reusable;
+		};
+
+		global_cma: linux,cma@58000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x58000000 0x0 0x10000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	sdhi1_pwrseq: sdhi1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pinctrl RZG2L_GPIO(23, 0) GPIO_ACTIVE_LOW>;
+	};
+
+	/* 32.768kHz crystal */
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	memory@40000000 {
+		reg = <0x0 0x40000000 0x0 0x40000000>;
+		device_type = "memory";
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&eth0 {
+	phy-handle = <&phy0>;
+	pinctrl-0 = <&eth0_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2L(C),
+	 * instead delays are added by the ADIN1200 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(27, 0) IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&gpu {
+	mali-supply = <&reg_pmic_buck1>;
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+		clocks = <&x2>;
+		clock-names = "xin";
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+&ostm2 {
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
+&pinctrl {
+	eth0_pins: eth0 {
+		pinmux = <RZG2L_PORT_PINMUX(28, 1, 1)>, /* ET0_LINKSTA */
+			 <RZG2L_PORT_PINMUX(27, 1, 1)>, /* ET0_MDC */
+			 <RZG2L_PORT_PINMUX(28, 0, 1)>, /* ET0_MDIO */
+			 <RZG2L_PORT_PINMUX(20, 0, 1)>, /* ET0_TXC */
+			 <RZG2L_PORT_PINMUX(20, 1, 1)>, /* ET0_TX_CTL */
+			 <RZG2L_PORT_PINMUX(20, 2, 1)>, /* ET0_TXD0 */
+			 <RZG2L_PORT_PINMUX(21, 0, 1)>, /* ET0_TXD1 */
+			 <RZG2L_PORT_PINMUX(21, 1, 1)>, /* ET0_TXD2 */
+			 <RZG2L_PORT_PINMUX(22, 0, 1)>, /* ET0_TXD3 */
+			 <RZG2L_PORT_PINMUX(24, 0, 1)>, /* ET0_RXC */
+			 <RZG2L_PORT_PINMUX(24, 1, 1)>, /* ET0_RX_CTL */
+			 <RZG2L_PORT_PINMUX(25, 0, 1)>, /* ET0_RXD0 */
+			 <RZG2L_PORT_PINMUX(25, 1, 1)>, /* ET0_RXD1 */
+			 <RZG2L_PORT_PINMUX(26, 0, 1)>, /* ET0_RXD2 */
+			 <RZG2L_PORT_PINMUX(26, 1, 1)>; /* ET0_RXD3 */
+	};
+
+	i2c0_pins: i2c0 {
+		input-enable;
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+	};
+
+	i2c1_pins: i2c1 {
+		input-enable;
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 3, 1)>, /* RIIC2_SDA */
+			 <RZG2L_PORT_PINMUX(42, 4, 1)>; /* RIIC2_SCL */
+	};
+
+	qspi0_pins: qspi0 {
+		pins = "QSPI0_IO0", "QSPI0_IO1", "QSPI0_IO2", "QSPI0_IO3",
+		       "QSPI0_SPCLK", "QSPI0_SSL";
+		power-source = <1800>;
+	};
+
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>, /* SCIF0_TXD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>; /* SCIF0_RXD */
+	};
+
+	scif2_pins: scif2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 4)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(42, 1, 4)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(5, 1, 2)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(5, 2, 2)>; /* SCIF2_RTS# */
+	};
+
+	sdhi0_pins: sdhi0 {
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <3300>;
+	};
+
+	sdhi0_uhs_pins: sdhi0-uhs {
+		pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+		       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+		       "SD0_CLK", "SD0_CMD";
+		power-source = <1800>;
+	};
+
+	sdhi0_cd_pins: sdhi0-cd {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 1)>; /* SD0_CD */
+	};
+
+	/* SD0_RST is only routed to eMMC which uses fixed 1.8V IO voltage */
+	sdhi0_rst_pins: sdhi0-rst {
+		pins = "SD0_RST#";
+		power-source = <1800>;
+	};
+
+	sdhi1_pins: sdhi1 {
+		pins = "SD1_DATA0", "SD1_DATA1", "SD1_DATA2", "SD1_DATA3",
+		       "SD1_CLK", "SD1_CMD";
+		power-source = <3300>;
+	};
+
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 2, 1)>, /* RSPI1_MISO */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* RSPI1_MOSI# */
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>; /* RSPI1_CK# */
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(44, 3, 1)>; /* RSPI1_SSL */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+};
+
+&sbc {
+	pinctrl-0 = <&qspi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q80bl", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif2 {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* WiFi */
+&sdhi1 {
+	/* Murata 1YN max rate is 50MHz */
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	cap-sdio-irq;
+	mmc-pwrseq = <&sdhi1_pwrseq>;
+	non-removable;
+	no-1-8-v;
+	no-sd;
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/*
+	 * Host controller IO voltage is provided from reg_pmic_ldo2,
+	 * WiFi module IO voltage from reg_pmic_buck4.
+	 * Neither is configurable at run-time so either can be set here.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo2>;
+	status = "okay";
+};
+
+&usb2_phy0 {
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	status = "okay";
+};
+
+&wdt0 {
+	status = "okay";
+};

-- 
2.43.0

