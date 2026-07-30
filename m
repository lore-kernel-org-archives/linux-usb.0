Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023123.outbound.protection.outlook.com [40.107.162.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E388B3CB907;
	Thu, 30 Jul 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.123
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407942; cv=fail; b=ra/x1UivbhNQs99E08I4R9kTfWH/K+x+criIpX7AkD8fZ/0DAN+a2qaJWBpPUyO9/pWZvDpM4c0H7Qv96SCXkVyd2ZLqPokuIETblnSfhUAFdRrfziSSFVeZe6mBLu58+PbokPHOFH6y5yXg037mNxhkP+e+Y5S6M3zNRLnSUdc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407942; c=relaxed/simple;
	bh=k2vWH+Ri4jHaeTRjySiQJYt+C21+VFbgdSFZIYh51JE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=bk6D31Yn8CwbfUg1BLqsr3iqyDcRZgm435KlZLSmMWyEmPZkiN7jepdmSONIU+WT/jiLxQQyrGieSpmzoqU+3C9EhtvcN1Oiby7PulTae6SNaYsA5esBYsc1awyaNonWNk1okcnoDb5lRuT/M8g+atjZbQGr5q0YXe3XlGfjeF4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=aIVFNsAK; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=aIVFNsAK; arc=fail smtp.client-ip=40.107.162.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="aIVFNsAK";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="aIVFNsAK"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A3i1XbI15RjnYDnEl+hCrZ8smQA7gOavcQ/rmKVTMFtVutZ4JAUc699WtZWrTaLR6SegICbJI6IP8i6r10ytEfJB1yr950gjrlJu7B5yWbIcTnDXAfJSwHuMt/GgwxvDWXbEdKukTreLC0SN17u2kyKaE+aXbB20GiShVds1g7nQJPSd98T54zwjeTTFzTXUI0pGQelHEiiMG4OlLA5+/sMWEzbwEhpYgRjTGrJdRNPeSuSncxWo09ZwfZYNEi1xAd+bKwCF0y6THmgeC0sBAmo9luAicO+OQKsMiB3Iw1WesSoJyRZP50gJ1hzFM8ZMqwUA4dnRrCF7U8nYTQgK5w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLqGam/CT7jezNXb47mfPpIw3a2AHGumo8CT5QCNnfE=;
 b=LvWpFvZa8D2yrQYHaQakde34bGQHfFLslQa8pmoQHL6EoySpLynp2wq0Rdooyy/7/2nDa2mvyqKak3vGmrgjkkLndQG8gbU3yOiapK9JfsVYeIu3vPU0/JO+YMqgs44Z7uefHXXrrTjuisqC+/Bne2pjmfTLa6Cm2DG+lzX8/ZK5HnaAbnOXynpBFpIYQlmmFpyTpwUSc3ZdRhpQLPpy8alKERIy/t5Ae5tQJDZThOi3x6b9fTT/LQnzShCBM55g9yJTd4I4EDgcQc6fq86c6LLgUNCzFJeEsFXs108NAA3T4mh8hiFC0VEk6shzPHdR5/L/E4/TiEVPeOljZ7yxEg==
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
 bh=OLqGam/CT7jezNXb47mfPpIw3a2AHGumo8CT5QCNnfE=;
 b=aIVFNsAK96dfJWhEBdvprUj7YFjj2PMYE6oGCCTASQxbG6EiVPeOs1GqkujHTgzrnH71JPk3BQS8EzfkWHknNRSOrolReBzlnzZGJXJv7adOqs2GavEc3jbRkZKKNGPUhp3+LjrS0G2RzfiMw6LDgLhzFAvAw9tQ22N2DbW2YrmEuehp2iNoItSLwEU1NTMYVjfELpxBLb859su7DJxHb+ySbdtxFeX3gA1U9Kj7ObQw9k/sLJPM4rDY+KPXwduLxNjYd88Ywqe+KCRB1J6n2M6xaZCoYxOCeq7yVNJiyQas4Sf8ifrLxmWYHOrHruDGn5yqx6NVQPrgeTbyrD1v2w==
Received: from DB9PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:10:1db::18)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:38:55 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::9d) by DB9PR06CA0013.outlook.office365.com
 (2603:10a6:10:1db::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Thu,
 30 Jul 2026 10:38:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 10:38:54 +0000
Received: from emails-6167264-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-100.eu-west-1.compute.internal [10.20.5.100])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C6C8E8129B;
	Thu, 30 Jul 2026 10:38:54 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Jul 30 10:38:46 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1785407934;
 b=mZsCJZtCR9Yh2nM6ta4wqHAQAkSQi594UWZc+aoT+MSoOWJEwy4z8lEfotZgUGXHe8zW+
 LeGhhW453WkXPUJeBQtl2i+4t/+GtUAOt8NDR/zKiwecb4uYAPBrqH+Dv6YkkYPa6IRneW8
 IvVlhzy5p1RJHiSvMHnbny1v6NvT73Q=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1785407934; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=OLqGam/CT7jezNXb47mfPpIw3a2AHGumo8CT5QCNnfE=;
 b=N07XlGYepFwrRWu4ZucP51beS4ZOPE1Ar41YZHNYBBAPLnpFa40wQYTmq7SpsgxtZUrsE
 lKW3fnzx+p3mG32VfhPJzVaQYT+5YJsb3HNWscxEqnHIbkryMalPKMi3f9bm16KZkT/aStf
 PirA00Ug8ZOQThhhV/b4KPI3PygHafU=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLqGam/CT7jezNXb47mfPpIw3a2AHGumo8CT5QCNnfE=;
 b=aIVFNsAK96dfJWhEBdvprUj7YFjj2PMYE6oGCCTASQxbG6EiVPeOs1GqkujHTgzrnH71JPk3BQS8EzfkWHknNRSOrolReBzlnzZGJXJv7adOqs2GavEc3jbRkZKKNGPUhp3+LjrS0G2RzfiMw6LDgLhzFAvAw9tQ22N2DbW2YrmEuehp2iNoItSLwEU1NTMYVjfELpxBLb859su7DJxHb+ySbdtxFeX3gA1U9Kj7ObQw9k/sLJPM4rDY+KPXwduLxNjYd88Ywqe+KCRB1J6n2M6xaZCoYxOCeq7yVNJiyQas4Sf8ifrLxmWYHOrHruDGn5yqx6NVQPrgeTbyrD1v2w==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:38:43 +0000
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f]) by PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:38:42 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v4 0/5] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Date: Thu, 30 Jul 2026 13:38:31 +0300
Message-Id: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcpa2oC/23P3wrCIBTH8VcJrzP0ON3WVe8RXTj/bELN0JJq7
 N1zg2BsXX5/cD5wBhRNcCai425AwSQXne9zFPsdUp3sW4Odzo2AgCCcAA6fFnAMuPEy6IhZqTk
 XQlQSNMpH92Cse83g+ZK7c/Hhw3v2E53WH8XWVKKY4IoXXJSlrZmSp+ivTuPw7A/K39DEJVgQl
 G4ImAiQpmk0lFVN/xFsSWweSiwTljBmVS1UTcSaGMfxC1pCFhQ2AQAA
X-Change-ID: 20260502-rzg2-sr-boards-37d556668a2d
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
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
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
	PAXPR04MB8813:EE_|PAXPR04MB8974:EE_|DB1PEPF000509EF:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ff2500-812e-4520-9deb-08deee26c121
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|1800799024|366016|38350700014|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 /qDmDKzuv7z4ai1/DGtzRw9RXttV9CeSGV5Hw9cGR6Nzm7zGmb4mOrwVoDdAk+L/fX0WBhylys0y3vr+UrUMQ37fDoWdjJHUs4n5Xonei3aInuQS/auD1FHJjEkRGIBj7WfYFDGTe/YZ4HDZn4w4+dzHgVWdXBD3kxQBzUV6WDz4VHjWq7w/+SQVSwPnpDITULf9/DLqQ3RlNzsVoaU0RLCl4e8JX9bZFEaicEWcA5UBsicvzneVnCbqf3WjtEK23mbnUT0pyaNVTrztgFtW2JYO+NcxswenmCvzLLq2mbFtIfHeLFyk2M2zKlOLzg/w5b3ONB4xIAj+YFrk+9Kn9BOFBpp7xTSmiDTSvhAGa6aDmc8+C2Nu/EkXbwn9HaHAouqXMJRO1wJV6+EW6hhX/Mv8qShve/yPW3bH7ukxEr4MNCquThO30NELEG50f4KJ6Khf6rRQZAZvz5BhpcipyvsVnS1S/sEuqED/+6j8VXV9lg2/vQEEDNE+0JEQHgHZhxAEkZ3mYJxSXpxde0/gBBltquXM/l+dS1JCwZ/t3y8jwuoI8xcA3mWgi6Fq/WDgVsnlAYQBe+MZjriJNFy33ZSvmEaWHVHuH+DRmNXbccRDwrc1J+HCYawaaczsY2o2B7F0turxzH0QU8LDV7g1lbnFU6a1pIPuOsAzz1i6gec=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8813.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 I2x1O9ShXL6pt+/N0dUYDyBjAlYYzTx1vTzdqeYUHz9qQztWqfDs9T5zXcFOUydnMeHXBW2J7RbZOW8wCzoNzEGfCQVScTLHX3Yli6SV7Q1kf3PX2fMcH0KjfP8/x3cOjDM/4Sz4dScCG092hbHDk/qDZsXNFYFUXEOPCLbTLodSTQ2pgv6wk5wJFFtAdxYc/7R5zBrWqAfUke8hCl5GILkYwjW7akxmlE36Kar+Z1Bl/oAhF67KLSd1m2W0ElVYgMBhyPQSsMI1/EezliRnX3cUvXRTF/LQUYfVhSr0H37dB9Q3bWMHR6/N8b25hTuFlTqWtjrN69J2sNnmajZWHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a6939571af9e4e35b1fcf36bc33dce11:solidrun,office365_emails,sent,inline:5f0ad432bf879533a30be2dc15704e07
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUOmNf1gZTrQaHSnQdM2YdM3ZJ+ejEHMnN98WQpdCQxpEkhk49rewqfiZLPMwIz97qodcf1wG/xwXILb9P1spaEtBsEVDQbFsZ/YvmVvR1Y4Xk9K/MXfQFeKXEemMFu80LlGGMFoJaj1UVsCH7pnt2YMxGWtxMfy8bO8++OhvOwRihhoRf5eDPdsMEX9+suNoVTiiMiYIupztN3+Ffv/DkiBGXZwG9ZCczu5qWstapPC52jna93D57KwWL2vgfVR5WRiZcmy2VRTxBzRnbDAxgHvWZgb+rg6aKKIbTjWdnc3sxhZ4NuO3B30UK2XK5SZHc0HEQl5a962AydnmZZQew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLqGam/CT7jezNXb47mfPpIw3a2AHGumo8CT5QCNnfE=;
 b=CgfuMfT826UhdLIXjoYjbliB+8vPsSa/o3W83Far/NUm2tA21g10ZCkVbWP9KQyDfEXgyhSLBvA6zdveFqnQXYTMxOrt2WcKneGOdqaTUGnTsJqqcvb6rHGtyJBHYoQ4cdLVNQ86mB/TuoH41oBpIRKrLoum9/4daabNvHr1ROxgKvMy9IKmjJdGopseuZRJCcvqOkahMB8rwSsd32Ynne+PKXCJFWHcpraRnHsYyJdMptzBOgee9rONkOtPlGMc8/TJ35d+RNDJT0OkyzNLfkjNQBOPWo6hmRF5e7phCnXUZ2h8UKinBizQcTyFtSxHvzRyDc4ueR3KZ8HX75aqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75c79ea3-fb1b-4778-d71d-08deee26b9ce
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|14060799003|1800799024|35042699022|13003099007|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	WK3hkhLR2GzReDfUucz/7MVLrdnzEphLn8vdgzg5nXHzP+QLOa24U/orFR7qUQxcVvPXSmDoenAGR7nvCif9XAlfarUXvfUocKo/aWvSBzkyyn7nC0Qr6xD21Htnetn3iHCPl+0CJWeq6De6MJLIy3MNC+wjQpu6aRKn4jySADkVcrLQjL16QOu9L+QZtzYLoex+oljOfYl19Zu5lJXSYotdcLuYHWjj8FAxRYnVUPYKni4zXzyEppZAV3xnU8ZYMCRU7tXcUMJWVrOm0dC5FLWh1dQi//Y/SXJpTrG02c+RY2Du+xkpKpp1p5i5wbdgjGzocuZ26qH4rCSr5w1iGwouIkLnx0ffyP+dvPcevBnxBorFssqBOxx1Wo1xSiLroJSEmD0a+Lb+vZd7TeuKd+Z7r5HuNIEzOqYdZmFNrHaG0GJv5aChhi8XQBUdeN2AKjKQZARDdkdHuGougZ6sEUwJS/DgRX3EfJYgPMJ7DdImZKS8r14Op5lOJ2Tv7Mtqifdx8WyE/F1klH3ARdNLYbvbgep9RFYKwzww2pNLlgio2v6Ikh+YDfgp6L/9KQ61WmUO6VMaXh1G6alRKI7P3/pUIrgpwv79zm1eSoN4L++gWSrf+sRKxdDiniXh5mo0tQmwaDcJwcXAYvEBBpSEYQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(14060799003)(1800799024)(35042699022)(13003099007)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1oJGXmT9oEdYNXOaz177F8dJ/sODiOlqGBjsjMHDSuMWzzndltQfI2moIYkmlBjHniKi6BETWAOrI1aJ+6LoFYH9/kW9LYCIVcxWri8j04HhhSL/2/78u0ZxQVG7LW8xilMdVP2WS9wxI5x1QXO6t3QoRpkQGZvpNpxBBCk4bfIY4QMf1ehQzQsCEdBztHYsGqCk6QZ5VpO9WQP4+5RF5Z6u9JiZo8Idl8DReCdJ7H6w9Lf0Nc3VBkKt3dKWMv+tBT85VfTKierNrA6fYBa2n/MS3Tr9bGO9dfFcllH/2SMCtQzd4nl5XwBMz24zpofW1AacCucEZ+mZeDoqMBMLtdgLwo9kUL2kszIKJq8SSwL/UntmvSh88Q+Ia+m37Inqy4bR/MHsVPeLE0dIEPBS8BIUF6DMN+uAW2gYutTdaYbi1+J98zAZq7XWOo4RX7ey
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:38:54.9117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ff2500-812e-4520-9deb-08deee26c121
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

Add support for a variety of SolidRun RZ/G2 based SoMs and the
HummingBoard IIoT Evaluation board.

Bindings are added for all SolidRun RZ/G2 SoMs:

- RZ/G2L SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
- RZ/V2L SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
- RZ/G2LC SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
- RZ/G2UL SYSTEM ON MODULE
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/

And each supported carrier board:

- HUMMINGBOARD RZ/G2L IIOT
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
- HUMMINGBOARD RZ/G2L PRO
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
- HUMMINGBOARD RZ/G2LC BASE (Ripple)
  https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Device-tree are only added for the first board to reduce initial effort.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v4:
- Rebased on v7.2-rc1.
- Addresed sashiko comments for g2l som & hb-iiot:
  gpio dt property -> plural, irq levels, memory size, usb-3.0 hub.
  The usb hub ids however are correct, 6502 and 6506 are usb-2.0.
- Addressed sashiko comments for g2lc som & hb-iiot:
  gpio dt property -> plural, vmmc gpio polarity.
- Link to v3: https://patch.msgid.link/20260512-rzg2-sr-boards-v3-0-f033fc96c906@solid-run.com

Changes in v3:
- Added explanatory comments on won't-fix sashiko findings.
- Added cap-sdio-irq to sdhi controllers used for WiFi.
- Drop redundant addition of common device-tree overlays to install
  targets of G2L(C) SoC.
- Add common device-tree overlays to install targets of both G2L and V2L
  SoCs.
- Assign kbuild composie variables with := operator.
- Link to v2: https://lore.kernel.org/r/20260511-rzg2-sr-boards-v2-0-82aebbd27891@solid-run.com

Changes in v2:
- Added relevant product page links to each commit description.
- Added product page links to cover letter, thanks Geert.
- Link to v1: https://lore.kernel.org/r/20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com

Cc: Jon Nettleton <jon@solid-run.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benjamin Bara <benjamin.bara@skidata.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org

---
Josua Mayer (5):
      dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards
      dt-bindings: usb: cypress,hx3: make peer-hub property optional
      arm64: dts: renesas: add support for solidrun rzg2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzv2l som and hb-iiot evb
      arm64: dts: renesas: add support for solidrun rzg2lc som and hb-iiot evb

 .../devicetree/bindings/soc/renesas/renesas.yaml   |  37 ++
 .../devicetree/bindings/usb/cypress,hx3.yaml       |   1 -
 arch/arm64/boot/dts/renesas/Makefile               |  33 ++
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |  16 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 561 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 421 ++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 374 ++++++++++++++
 14 files changed, 1631 insertions(+), 1 deletion(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260502-rzg2-sr-boards-37d556668a2d

Best regards,
--  
Josua Mayer <josua@solid-run.com>

