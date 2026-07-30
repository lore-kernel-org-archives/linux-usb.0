Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023101.outbound.protection.outlook.com [52.101.72.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC5403E88;
	Thu, 30 Jul 2026 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.101
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407949; cv=fail; b=CTDugnD8Ndk5frka4K+5ggv0wBggwzQcke2xGqo18zn3eT35N+4M3dqezw2g2xSkt4dIrmpcooUchv+FzbkUaYNLqixIDyhIBspdpzE65hdokw7p+FqAQMKwA5FAGpEjHXa5rwTOD+LNbZWOZcJpbgqU6ULn7Pbq2oC2TkGSzEc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407949; c=relaxed/simple;
	bh=KkPzDE3iI7z/bAPDPu99ZtNyrUBaxfGPQW0pAAYVd/g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=j+s1xc6pBh8/wPAUl14ljR+0LH+XmyzoUkRKrL3wJgh49DfFmy/sTlx4GHzbZ8rqRSE9ylrvWAq3iRepiDyr4bOZiMF8gADBBFaO2QVJ4waEvohrVGPUse6StHMjbgY2K+YnJHGtyEFt+dmdcXhSyDfXUYJXVaOO8SA6U4HBKJE=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=j+ZUv4wn; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=j+ZUv4wn; arc=fail smtp.client-ip=52.101.72.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="j+ZUv4wn";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="j+ZUv4wn"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I/ueQtmISKHgBrpAr0J7LBlzUAdf0CBKLl3wJW8gEVkik38mgku9V/u0VCvxdYfAXh19LUwXAhcCSlOwpXbesVWmpjRSITsRz7k/g7InCns68SN9KkskZHArBZtfx+75kRTg2Ix//W1ooxxdWTObprNin5AgYragMUQvUtrCPCAcxB2eMN/AG6UxIYZdACQNgBVTxOlJIWHlwK4lCRqj91c7/1rQaZNojY1JBe/hmH8tfAyie9wuUKReQUQkJ5q66ZQigVOeZK6JyFTJnJpcr6GIf6KV0gwb/WerOj5cz0RxBEHwFU5zcj3xhSGQ0+GrmgRUzFl7Q9aONkk3RaOOaQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Yv/kXLIi/CJSh+9WuzAI5Iu4SLI8ZwNjT11bw0lJDg=;
 b=JY7HUAIWMjICgI1tw8Y0oYHbHGnomBw55mWhiVPnAtWn9wwJXKr4FE3qS6xOH2j8rHYxRaitzTG35TufFGye2nKfamjPxyTa9urEBNNb9TbVFLBLshDRK898eplcnhTWJ6sxn2XySqVaHSFlrnI+D/5FfSCpqNgGNzbdiRBtHNJr/yEHQv6Qnl9Gk6JB7f6MKt9StS94HYzeeO1SgyN3ROgk4+5/PUoCxpuJwFmaSLL0FdH6ceIKHGs0aegjNJ0YV1SfsGfMnx1Ly/Qc4xIqTS+e1vn+svIQ7sSTWTdfUFqoUokT2yd5wAHTfw6iG6ne1IN8VaYkn+uHHCsPZmOQBQ==
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
 bh=4Yv/kXLIi/CJSh+9WuzAI5Iu4SLI8ZwNjT11bw0lJDg=;
 b=j+ZUv4wnhMuvgweVSFDVprjCIkuHl4AktX2L76oGmSiT+itGr4JB328j9QpReaErQQiYJ/BMy9fdBcEACIfifzYxjIE4eIsfySUFk2TCpRSy2rwv2eJvBCJe2g5A+Q3RFGbYx38sHRpHg92f6PTn5FIcb7S6e62giWLhR2iFe+2MYoZbu8ybAcQwIHluNe1Fmzb8kqGW3jzRK6Yx4HVv3nPlEL+XTcwFxjCcxTmGcf1lDn7qQNjeH6uTsSAJE0xZgZcDUzcwL8cbDEAeHGL6m6xnAQPQORLm/e+7DbQaB/LfWKD/YGUntPTnZhsafRdGnUiEKXs9wl3hIqCWKOebWQ==
Received: from DU7PR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::16) by DBBPR04MB7977.eurprd04.prod.outlook.com
 (2603:10a6:10:1ed::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 10:38:57 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::51) by DU7PR01CA0035.outlook.office365.com
 (2603:10a6:10:50e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 10:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 10:38:56 +0000
Received: from emails-6167264-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-100.eu-west-1.compute.internal [10.20.5.100])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E676A8127F;
	Thu, 30 Jul 2026 10:38:56 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Jul 30 10:38:49 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1785407936;
 b=DCHNPjlPVbC2IivwFhtEXKgev0sMbH0SYmzQjKofvLbi6sFf4vqh+4YpcqCeFyfx44aNV
 Bvcq6WPohmtf3mxxz75CSvJAPARp26Zj758VwoLf88ji1qFUANO+HoNeHAAKazp0St5hWUR
 qEzCprwkpR2BjVa6ct/yYNXOCkRd3FI=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1785407936; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=4Yv/kXLIi/CJSh+9WuzAI5Iu4SLI8ZwNjT11bw0lJDg=;
 b=U1tVRQ/vUTv0YD4FqcDwawbLz5sYaeFrEL+lE0emJDG/HqKcLPhcKQ+5ja9S+LwSSCrrw
 nVopsrvmJws5YJx66fINFCg3748GJEaL/F1i7I3BbygTpF0N7Yv4VG/kdoruo9LeF6ZjbT8
 lGz3dqjGtRuXFj3z0wNyJDdC+Ow+a2Y=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Yv/kXLIi/CJSh+9WuzAI5Iu4SLI8ZwNjT11bw0lJDg=;
 b=j+ZUv4wnhMuvgweVSFDVprjCIkuHl4AktX2L76oGmSiT+itGr4JB328j9QpReaErQQiYJ/BMy9fdBcEACIfifzYxjIE4eIsfySUFk2TCpRSy2rwv2eJvBCJe2g5A+Q3RFGbYx38sHRpHg92f6PTn5FIcb7S6e62giWLhR2iFe+2MYoZbu8ybAcQwIHluNe1Fmzb8kqGW3jzRK6Yx4HVv3nPlEL+XTcwFxjCcxTmGcf1lDn7qQNjeH6uTsSAJE0xZgZcDUzcwL8cbDEAeHGL6m6xnAQPQORLm/e+7DbQaB/LfWKD/YGUntPTnZhsafRdGnUiEKXs9wl3hIqCWKOebWQ==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:38:47 +0000
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f]) by PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:38:47 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 30 Jul 2026 13:38:34 +0300
Subject: [PATCH v4 3/5] arm64: dts: renesas: add support for solidrun rzg2l
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rzg2-sr-boards-v4-3-08bc459578dc@solid-run.com>
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
	PAXPR04MB8813:EE_|PAXPR04MB8974:EE_|DB1PEPF000509EA:EE_|DBBPR04MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d148789-5cfd-4324-a1e7-08deee26c25d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|1800799024|366016|38350700014|6133799003|10067099003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 kqzIbjA91r8AOxeWZJedFQAU1IUPdGG+2EU9KCq4GnmAuDHvY1OWhSQd/uaJQyJzCqlCb7rBGb/FQPrQ+ptT/gk3vJx8HY27tSFU0Re4GdMt3YjCbxRrUoTdy17/1htlDBzden1S+6w0evRKuK6GHxFoQRwe7Lm2SUJyXVEMv7YZXIJbMjs+v/2BRCragerxrG8Ll46Hy24s+paTXG2AY5/K7eHvS2i1pb/Uqyzjx62By5HbLDkxz8BenOBoLJ93Y9uydn2injN72McZLXvu5zzz+KQPdyzrUixWscWaYxnM0nca+KpC0+NBuo+MYcAjP9iWhJqR4yO/3QB+3ERrDAU6L8grxz25JOl7g+EuT82xwrM676/RZKf3jpm0ZtGZ07XpNaJjFd2mJ+OZYO6GD9q/wPoY2KhqwcKXFrwhAiVQD+98HeJ3majWMnNua0RremV5wIe2PblGrCiNyFnpkV5vKDPZB1g5zaPOTO9k8qi+3d8Kh6cOO0Pq722BBuct19OA717kEu1clKm9XQ2bPW4mdMFYBLmvuAOVJYABZCwLC5w3Ntrafe/0eBPLKM74EQ1zBITRkYLiJqyzlSIlE03J46Sf5NmvGIhMit1bB7X3wAc6O5TDbqphZiuc6g8eBu9Un9bR9jbXbfubgzcxJYBw/q3cAVRtnRS6fzbcElXHTkcBKSLEeDKGnswXWgFEJO2pDhQmLJKIhOyrhHyA7epgTgaT8I4KVeNvNSrYtMQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8813.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(1800799024)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 gEuV14lWk2GdopzoPcxjGJbxbBJXrHOPbaIgU+uWWT7ZYaO84TmiXr6JQdIKdV9oAnXvhWxKEL/O3OI6dQxoBTwWKTFIxelyAD7/QfwdBCfUcNIsV2odBnW+eMeo7plQJOHPVJVvBk+XYMDijlWUh3J/Kh5MFNDDl322gmXhuDTzWSHhyKMt+4GZlBfJsiAUUI/Wz0xIH96G6VP69l4YmM0+je+JVLqWv4cQGEaxatZdHmkqGihg6MQb3WfY/v9EHVdeswMUyaowk0JJRYYrlFNneeX7KMq7b7PPhPdY8cRdF65rFbi1YtpWNF1ObqKBzvrcET/mFu02X4WIznsq3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 4d2dd18b29eb4136b9855e49fa874130:solidrun,office365_emails,sent,inline:185e14fe6a660963052cdc6c626bc657
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCafbRLohNi5XCLT0762fwUf6eSs3p23iAPI+Y5Pk4/QCWzBYB2en0fm/DAFXj+4wKcaqz3+zWNLW+hObjeA+kmieRLBXocPkCJCzMiuZVtek/gQ4H+4CmEApVMbfq6IOx2jnMM5SA4c8lQQO2fLPbxqLTFvOBQarEjpKwJR7u+RQQWalcLaRVlYC6sbNFDahB0qGPELLODvwQYYv14htlF+nkHavw+1ck4jkjdboxkWUqYXDQYaHtMfL+ymJeMJMb0sIGdg0n14E01nSZonHCxyiP+HYEvKnCDst2CnE69F7a/q5e5M5eBIDaTQ94ohCh7mnCsGiWoMFAppNSgh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Yv/kXLIi/CJSh+9WuzAI5Iu4SLI8ZwNjT11bw0lJDg=;
 b=UJsrn/VsciJPiYaeaLPbYNXAiy+orynOfUW4mDtvhG/gf1E62em8/lCPck+TE/dgt2grDtQrDrzjidx7TldI55D/MLcMpfFNeZ1Ma6leu+LK6ZD/1oTEutAxW3K0rIVrQ1jQJw49VOhkGhbNm0ljFiNkRCfn0oL3udiu+y7ZF7US1nsW8U7c3iJxmDsvgMk2ROYc2v0r3XVRAX16nJh8O/oQtQIKWP2dLAR1F9ApGGQZNAa+rNHV8VxQuGx+NBOLstAniipVVTOjxKPXsoffIxzrBSvAuscT9LYRFAov7yapmdHZbhuH4Mo/sTYm8MhGojMyO4TBSMRSdGU5ieTRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15bdc347-5b86-46e9-c4ae-08deee26bc61
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|35042699022|23010399003|14060799003|82310400026|1800799024|6133799003|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GJHFyJZXSJ75PGltwjkxRu9OxY1A68svHhY8q9pJuXTYMDsxuZ1AGEvI4D55uXP4Hx3XDDn9oWdh2Zp9HnCeWONkGowl23lW4vW8GfONRlfrQ9NB8WlxzMFnrXGGPqi1ivzG6y2Ccoc3fFHVLGgESQdO92uTKb4N2x3Sdd8ZdXOw4brsjC7nx2plPF0IBFww4nBL6Udn1cDzvTAimL9d3ktEUW0xpHt7y/1JnFZlKwzxNBY97v8nDngh3W6jYZYuUvkDayRZrkBwiddLwn0fMra0YlyKPEQ6DSsLoLXeok50nszjzZG2IJTxOBVLx2y1SloXOSodvvdMsF7Zc5RY+R1T3CekVgNlIvhCEzXzGA4xNRg/KIzdcWhfiW8G+j+4N8KoFBZf7eJC3JzqNWJPyHy7Scezt0M00QOOuqC7byCV1lCrsm2C3s+GYGBD0Z0IcDKXMjdOjgvOVH9+gQh32Jl+MHpJh/KFw59kQ6GwKiDtXGAT2SKipkHp9lqzaY/CmEi0+G2mM01Yb1OTlhubJThvQqI8vJ3VAWfwMGJNQC2IfZqG2rKpOlb1PUfjh5EUJfUtCypJUFjA/LEfDomVEpkwdi7VBZRTs3mVNM0tr5sh4b9Tp0HBb65F7ZmvmQhJ+oBy+3ZHUbaNR3GdgAF3+g==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(35042699022)(23010399003)(14060799003)(82310400026)(1800799024)(6133799003)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NDjhCSxSNNaW0+taEblnKFhfLVLC+fY7UhQWWx4uEecBUi9finklB5BYutWFX8n4bBfpeHQmF0R1C7iBx7RUKTbPn3tjbSfUhW+c6RL0VjHN4U66IQEoLY7+kuePQmRuWlx9qQraQehffxctHFzKBTnBxD9+eCg+o/x19xwl81Y/6vIHF0QjHigN+rgJBjz6//ARwpgCmT61XGoOomg4lHOD3IH3YzJKk3It/INXewSe9kLEIHBoeCkOyXNTXcLomI4CeIm+MhnNzIOhxin1twWC831m3393ma92PT8zSBrO+OjI9JKyITLsQ4zMr5r5QgevFGeDnswOaiW8P+EwfZ8Zhv5Iqeex5JTMUysGhH6TCRRNDZYdWPKl7/nCf3mjPtkumHXymAZKc3dAQdWbLheOebknUmoEieZ0PQBUO3KirYXXxbMy/nucnu/v33gu
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:38:56.9852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d148789-5cfd-4324-a1e7-08deee26c25d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7977

Add support for the SolidRun RZ/G2L SoM [1] on Hummingboard IIoT [2].

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

Descriptions for eMMC, microSD and RS485 are provided as overlays due to
their dependency on configurable mux states.

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  13 +
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 561 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 421 ++++++++++++++++
 9 files changed, 1164 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..e2af196e18bf 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -170,6 +170,19 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 r9a07g044c2-smarc-cru-csi-ov5645-dtbs := r9a07g044c2-smarc.dtb r9a07g044c2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-sr-som-emmc.dtbo
+r9a07g044l2-hummingboard-iiot-emmc-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-emmc.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-microsd.dtbo
+r9a07g044l2-hummingboard-iiot-microsd-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-microsd.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-microsd.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-a.dtbo
+r9a07g044l2-hummingboard-iiot-rs485-a-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-hummingboard-iiot-rs485-b.dtbo
+r9a07g044l2-hummingboard-iiot-rs485-b-dtbs := r9a07g044l2-hummingboard-iiot.dtb rzg2l-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-remi-pi.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dts
new file mode 100644
index 000000000000..eba4f423c8f0
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "r9a07g044l2.dtsi"
+#include "rzg2l-sr-som.dtsi"
+#include "rzg2l-hummingboard-iiot.dtsi"
+
+/ {
+	compatible = "solidrun,rzg2l-hummingboard-iiot", "solidrun,rzg2l-sr-som",
+		     "renesas,r9a07g044l2", "renesas,r9a07g044";
+	model = "SolidRun RZ/G2L HummingBoard IIoT";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
new file mode 100644
index 000000000000..fadcbe658495
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-common.dtsi
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+/ {
+	/* power for M.2 B-Key connector (J6) */
+	regulator-m2-b {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-b";
+		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		enable-active-high;
+	};
+
+	/* power for M.2 M-Key connector (J4) */
+	regulator-m2-m {
+		compatible = "regulator-fixed";
+		regulator-name = "m2-m";
+		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 3 */
+	regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpios = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J27 behind USB Hub Port 4 */
+	regulator-vbus-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus3";
+		regulator-always-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpios = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	aliases {
+		gpio1 = &tca6408_u48;
+		gpio2 = &tca6408_u37;
+		gpio3 = &tca6416_u20;
+		gpio4 = &tca6416_u21;
+		i2c3 = &i2c_exp;
+		i2c4 = &i2c_csi;
+		i2c5 = &i2c_dsi;
+		i2c6 = &i2c_lvds;
+		rtc0 = &carrier_rtc;
+		rtc1 = &pmic;
+		serial3 = &scif3;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup-event {
+			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
+			label = "m2-m-wakeup";
+			wakeup-source;
+			linux,code = <KEY_WAKEUP>;
+		};
+	};
+
+	can_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		/* default J9-55/57/59/61 to on-board transceivers */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+		/*
+		 * Mux routes CAN bus signals between SoM connector pins,
+		 * expansion connector (J22) and on-board transceivers using
+		 * two GPIO:
+		 * - IO3: 0 = on-board transceivers, 1 = expansion connector
+		 * - IO4: 0 = J9-55/57/59/61, 1 = J7-12/16 & J9-54/56
+		 */
+		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>,
+			    <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	spi_mux: mux-controller-2 {
+		compatible = "gpio-mux";
+		/* default on-board */
+		idle-state = <0>;
+		/*
+		 * Mux switches spi bus between on-board tpm
+		 * and expansion connector (J22).
+		 */
+		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
+		#mux-control-cells = <0>;
+	};
+
+	scif1_scif3_b2b_mux: mux-controller-3 {
+		compatible = "gpio-mux";
+		/* default on-board */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches both scif1 and scif3 tx/rx between expansion
+		 * connector (J22) and on-board rs232/rs485 transceivers
+		 * using one GPIO: 0 = on-board, 1 = connector.
+		 */
+		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
+	};
+
+	scif1_rs_232_485_mux: mux-controller-4 {
+		compatible = "gpio-mux";
+		/* default rs232 */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches scif1 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232, 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	scif3_rs_232_485_mux: mux-controller-5 {
+		compatible = "gpio-mux";
+		/* default rs232 */
+		idle-state = <0>;
+		#mux-control-cells = <0>;
+		/*
+		 * Mux switches scif3 tx/rx between rs232 and rs485
+		 * transceivers. using one GPIO: 0 = rs232, 1 = rs485.
+		 */
+		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reg_dsi_panel: regulator-dsi-panel {
+		compatible = "regulator-fixed";
+		regulator-name = "dsi-panel";
+		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
+		regulator-max-microvolt = <11200000>;
+		regulator-min-microvolt = <11200000>;
+		enable-active-high;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmc";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		startup-delay-us = <250>;
+		vin-supply = <&v_3_3>;
+		gpios = <&pinctrl RZG2L_GPIO(4, 1) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* power for USB-A J5003 */
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpios = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	rfkill-m2-b-gnss {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_LOW>;
+		label = "m2-b gnss";
+		radio-type = "gps";
+	};
+
+	rfkill-m2-b-wwan {
+		compatible = "rfkill-gpio";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
+		label = "m2-b radio";
+		radio-type = "wwan";
+	};
+};
+
+&ehci1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
+		vdd2-supply = <&v_3_3>;
+		vdd-supply = <&v_1_2>;
+	};
+};
+
+&i2c0 {
+	/* highest i2c clock supported by all peripherals is 400kHz */
+
+	tca6416_u20: gpio@20 {
+		compatible = "ti,tcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
+				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
+				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
+				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
+				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
+				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
+				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
+				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
+
+		m2-b-reset-hog {
+			gpios = <8 GPIO_ACTIVE_LOW>;
+			gpio-hog;
+			line-name = "m2-b-reset";
+			output-low;
+		};
+
+		m2-m-reset-hog {
+			gpios = <7 GPIO_ACTIVE_LOW>;
+			gpio-hog;
+			line-name = "m2-m-reset";
+			/*
+			 * M.2 Key-M connector only supports PCI,
+			 * but RZ/G2L(C) has no pci controller.
+			 * Keep any card in reset.
+			 */
+			output-high;
+		};
+	};
+
+	tca6416_u21: gpio@21 {
+		compatible = "ti,tcal6416";
+		reg = <0x21>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
+				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
+				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
+				  "TCA_bDIG_IN1", "TCA_SENS_INT",
+				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
+				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
+				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
+				  "", "TCA_POE_AT";
+		/* Level triggered irq does not currently work well on RZ/G2L, fall-back to edge */
+		interrupts-extended = <&pinctrl RZG2L_GPIO(4, 0) IRQ_TYPE_EDGE_FALLING>;
+
+		lcd-i2c-reset-hog {
+			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+			line-name = "lcd-i2c-reset";
+			output-low;
+			/*
+			 * reset shared between U37 and U48, to be
+			 * supported once gpio-pca953x switches to
+			 * reset framework.
+			 */
+			gpio-hog;
+		};
+
+		lvds-irq-hog {
+			gpios = <13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			gpio-hog;
+			input;
+			line-name = "lvds-irq";
+		};
+
+		m2-m-clkreq-hog {
+			gpios = <12 GPIO_ACTIVE_LOW>;
+			gpio-hog;
+			input;
+			line-name = "m2-m-clkreq";
+		};
+
+		rs232_shutdown: rs232-shutdown-hog {
+			gpios = <3 GPIO_ACTIVE_LOW>;
+			gpio-hog;
+			line-name = "rs232-shutdown";
+			output-low;
+		};
+
+		sensor-irq-hog {
+			gpios = <7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			gpio-hog;
+			input;
+			line-name = "sensor-irq";
+		};
+
+		tpm-irq-hog {
+			gpios = <9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			gpio-hog;
+			input;
+			line-name = "tpm-irq";
+		};
+	};
+
+	led-controller@30 {
+		compatible = "ti,lp5562";
+		reg = <0x30>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* use internal clock, could use external generated by rtc */
+		clock-mode = /bits/ 8 <1>;
+
+		multi-led@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			color = <LED_COLOR_ID_RGB>;
+			label = "D7";
+
+			led@0 {
+				reg = <0x0>;
+				color = <LED_COLOR_ID_RED>;
+				led-cur = /bits/ 8 <0x32>;
+				max-cur = /bits/ 8 <0x64>;
+			};
+
+			led@1 {
+				reg = <0x1>;
+				color = <LED_COLOR_ID_GREEN>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+
+			led@2 {
+				reg = <0x2>;
+				color = <LED_COLOR_ID_BLUE>;
+				led-cur = /bits/ 8 <0x19>;
+				max-cur = /bits/ 8 <0x32>;
+			};
+		};
+
+		led@3 {
+			reg = <0x3>;
+			chan-name = "D8";
+			color = <LED_COLOR_ID_GREEN>;
+			label = "D8";
+			led-cur = /bits/ 8 <0x19>;
+			max-cur = /bits/ 8 <0x64>;
+		};
+	};
+
+	light-sensor@44 {
+		compatible = "isil,isl29023";
+		reg = <0x44>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	accelerometer@53 {
+		compatible = "adi,adxl345";
+		reg = <0x53>;
+		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_LEVEL_LOW>;
+		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
+		interrupt-names = "INT1";
+	};
+
+	carrier_eeprom: eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <8>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		/*
+		 * AM1805 RTC used on this board has only nTIRQ pins wired,
+		 * which is for countdown timer irqs only.
+		 * Driver does not support this, disable for now.
+		 *
+		 * interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_LEVEL_LOW>;
+		 */
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&i2c1 {
+	/* highest i2c clock supported by all peripherals is 400kHz */
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/*
+		 * This reset is open drain with HW 10k pull-up resistor,
+		 * but reset core does not support GPIO_OPEN_DRAIN flag.
+		 * The pull-up and GPIO voltages match, push-pull is safe.
+		 */
+		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
+
+		/* channel 0 routed to expansion connector (J22) */
+		i2c_exp: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 1 routed to mipi-csi connector (J23) */
+		i2c_csi: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		/* channel 2 routed to mipi-dsi connector (J25) */
+		i2c_dsi: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u48: gpio@21 {
+				compatible = "ti,tca6408";
+				reg = <0x21>;
+				#gpio-cells = <2>;
+				gpio-line-names = "CAM_RST#", "DSI_RESET",
+						  "DSI_STBYB", "DSI_PWM_BL",
+						  "DSI_L/R", "DSI_U/D",
+						  "DSI_CTP_/RST", "CAM_TRIG";
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4
+				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+			};
+		};
+
+		/* channel 3 routed to lvds connector (J24) */
+		i2c_lvds: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			tca6408_u37: gpio@20 {
+				compatible = "ti,tca6408";
+				reg = <0x20>;
+				#gpio-cells = <2>;
+				gpio-line-names = "SELB", "LVDS_RESET",
+						  "LVDS_STBYB", "LVDS_PWM_BL",
+						  "LVDS_L/R", "LVDS_U/D",
+						  "LVDS_CTP_/RST", "";
+				/*
+				 * reset shared between U37 and U48, to be
+				 * supported once gpio-pca953x switches to
+				 * reset framework.
+				 *
+				 * reset-gpios = <&tca6416_u21 4
+				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
+				 */
+				gpio-controller;
+			};
+		};
+	};
+};
+
+&phy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "keep";
+			function = LED_FUNCTION_LAN;
+		};
+	};
+};
+
+&pinctrl {
+	/* UARTA */
+	scif1_pins: scif1 {
+		pinmux = <RZG2L_PORT_PINMUX(40, 1, 1)>, /* SCIF1_RXD */
+			 <RZG2L_PORT_PINMUX(40, 0, 1)>; /* SCIF1_TXD */
+	};
+
+	/* UARTB */
+	scif3_pins: scif3 {
+		pinmux = <RZG2L_PORT_PINMUX(0, 1, 5)>, /* SCIF3_RXD */
+			 <RZG2L_PORT_PINMUX(0, 0, 5)>; /* SCIF3_TXD */
+	};
+};
+
+&scif1 {
+	pinctrl-0 = <&scif1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&scif3 {
+	pinctrl-0 = <&scif3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&spi1 {
+	/* native cs does not support cs persistence required for tpm */
+	cs-gpios = <&pinctrl RZG2L_GPIO(44, 3) GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	spi1_muxed: spi@0 {
+		compatible = "spi-mux";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		mux-controls = <&spi_mux>;
+		/* mux bandwidth is 2GHz, soc max. spi clock is P0/2 = 50MHz */
+		spi-max-frequency = <50000000>;
+
+		tpm@0 {
+			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+			reg = <0>;
+			interrupts-extended = <&tca6416_u21 9 IRQ_TYPE_LEVEL_LOW>;
+			reset-gpios = <&tca6416_u21 1 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+			spi-max-frequency = <43000000>;
+		};
+	};
+};
+
+&usb2_phy0 {
+	dr_mode = "host";
+	vbus-supply = <&vbus1>;
+};
+
+&usb2_phy1 {
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.dtso
new file mode 100644
index 000000000000..aa85054efa0c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-microsd.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+* Device Tree Overlay for the RZ/G2L(C) Solidrun SOM SD
+*
+* Copyright (C) 2024 SolidRun Ltd.
+*/
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&sdhi0 {
+	bus-width = <4>;
+	full-pwr-cycle;
+	mux-states = <&sdhi0_mux 1>;
+	pinctrl-0 = <&sdhi0_pins>, <&sdhi0_cd_pins>;
+	pinctrl-1 = <&sdhi0_uhs_pins>, <&sdhi0_cd_pins>;
+	pinctrl-names = "default", "state_uhs";
+	sd-uhs-sdr104;
+	sd-uhs-sdr50;
+	vmmc-supply = <&vmmc>;
+	vqmmc-supply = <&reg_pmic_ldo1>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.dtso
new file mode 100644
index 000000000000..4bcb22d518f0
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-a.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on connector J5004.
+ *
+ * Because Renesas uart driver does not support rs485,
+ * users must manually toggle P41_1 between RX & TX.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&scif1_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-b.dtso b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-b.dtso
new file mode 100644
index 000000000000..6f460b3e0b25
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot-rs485-b.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port B on connector J5004.
+ *
+ * Because Renesas uart driver does not support rs485,
+ * users must manually toggle P41_0 between RX & TX.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&scif3_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi
new file mode 100644
index 000000000000..22f066079e69
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include "rzg2l-hummingboard-iiot-common.dtsi"
+
+&canfd {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can0_pins>, <&can1_pins>;
+	status = "okay";
+
+	channel0 {
+		status = "okay";
+	};
+
+	channel1 {
+		status = "okay";
+	};
+};
+
+&phy1 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* LED_0 pin */
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			default-state = "keep";
+		};
+	};
+};
+
+&pinctrl {
+	/* CANA */
+	can0_pins: can0 {
+		pinmux = <RZG2L_PORT_PINMUX(10, 1, 2)>, /* CAN0_TX */
+			 <RZG2L_PORT_PINMUX(11, 0, 2)>; /* CAN0_RX */
+	};
+
+	/* CANB */
+	can1_pins: can1 {
+		pinmux = <RZG2L_PORT_PINMUX(12, 1, 2)>, /* CAN1_TX */
+			 <RZG2L_PORT_PINMUX(13, 0, 2)>; /* CAN1_RX */
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso b/arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso
new file mode 100644
index 000000000000..c59c7e7e70bf
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+* Device Tree Overlay for the RZ/G2L(C) Solidrun SOM eMMC
+*
+* Copyright (C) 2024 SolidRun Ltd.
+*/
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&reg_pmic_ldo1 {
+	/*
+	 * This ldo can switch mmc host controller io voltage between
+	 * 1.8V and 3.3V. The eMMC IO voltage however is supplied from
+	 * reg_pmic_buck3 which is fixed at 1.8V.
+	 * Lower this ldo maximum voltage to 1.8V to prevent setting 3.3V.
+	 */
+	regulator-max-microvolt = <1800000>;
+};
+
+&sdhi0 {
+	/*
+	 * Host controller and eMMC have separate io voltage regulators:
+	 * reg_pmic_ldo1 (1.8V/3.3V); reg_pmic_buck3 (1.8V only).
+	 * Link to the switchable regulator ensuring that it gets configured.
+	 */
+	vqmmc-supply = <&reg_pmic_ldo1>;
+	bus-width = <8>;
+	cap-mmc-hw-reset;
+	mmc-hs200-1_8v;
+	mux-states = <&sdhi0_mux 0>;
+	non-removable;
+	no-sdio;
+	pinctrl-0 = <&sdhi0_uhs_pins>, <&sdhi0_rst_pins>;
+	pinctrl-1 = <&sdhi0_uhs_pins>, <&sdhi0_rst_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_pmic_buck4>;
+	/* emmc io voltage is hard-wired for 1.8V, disable sd modes */
+	no-sd;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
new file mode 100644
index 000000000000..c021572207f4
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2L Solidrun SoM
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
+		ethernet1 = &eth1;
+		gpio0 = &pinctrl;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c3;
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
+		 * 1 = connector, 0 = eMMC.
+		 */
+		mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_LOW>;
+	};
+
+	clk_pmic_32k: pmic-32k-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
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
+		reset-gpios = <&pinctrl RZG2L_GPIO(23, 1) GPIO_ACTIVE_LOW>;
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
+	 * instead delays are added by the MxL86110 phy driver.
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
+&eth1 {
+	phy-handle = <&phy1>;
+	pinctrl-0 = <&eth1_pins>;
+	pinctrl-names = "default";
+	/*
+	 * ravb driver does not configure mac internal delays for RZ/G2L(C),
+	 * instead delays are added by the MxL86110 phy driver.
+	 */
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	phy1: ethernet-phy@4 {
+		reg = <4>;
+		interrupts-extended = <&pinctrl RZG2L_GPIO(42, 4) IRQ_TYPE_LEVEL_LOW>;
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
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c1_pins>;
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
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c3_pins>;
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
+	eth1_pins: eth1 {
+		pinmux = <RZG2L_PORT_PINMUX(37, 2, 1)>, /* ET1_LINKSTA */
+			 <RZG2L_PORT_PINMUX(37, 0, 1)>, /* ET1_MDC */
+			 <RZG2L_PORT_PINMUX(37, 1, 1)>, /* ET1_MDIO */
+			 <RZG2L_PORT_PINMUX(29, 0, 1)>, /* ET1_TXC */
+			 <RZG2L_PORT_PINMUX(29, 1, 1)>, /* ET1_TX_CTL */
+			 <RZG2L_PORT_PINMUX(30, 0, 1)>, /* ET1_TXD0 */
+			 <RZG2L_PORT_PINMUX(30, 1, 1)>, /* ET1_TXD1 */
+			 <RZG2L_PORT_PINMUX(31, 0, 1)>, /* ET1_TXD2 */
+			 <RZG2L_PORT_PINMUX(31, 1, 1)>, /* ET1_TXD3 */
+			 <RZG2L_PORT_PINMUX(33, 1, 1)>, /* ET1_RXC */
+			 <RZG2L_PORT_PINMUX(34, 0, 1)>, /* ET1_RX_CTL */
+			 <RZG2L_PORT_PINMUX(34, 1, 1)>, /* ET1_RXD0 */
+			 <RZG2L_PORT_PINMUX(35, 0, 1)>, /* ET1_RXD1 */
+			 <RZG2L_PORT_PINMUX(35, 1, 1)>, /* ET1_RXD2 */
+			 <RZG2L_PORT_PINMUX(36, 0, 1)>; /* ET1_RXD3 */
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
+	i2c3_pins: i2c3 {
+		pinmux = <RZG2L_PORT_PINMUX(18, 0, 3)>, /* RIIC3_SDA */
+			 <RZG2L_PORT_PINMUX(18, 1, 3)>; /* RIIC3_SCL */
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
+		pinmux = <RZG2L_PORT_PINMUX(48, 0, 1)>, /* SCIF2_TXD */
+			 <RZG2L_PORT_PINMUX(48, 1, 1)>, /* SCIF2_RXD */
+			 <RZG2L_PORT_PINMUX(48, 3, 1)>, /* SCIF2_CTS# */
+			 <RZG2L_PORT_PINMUX(48, 4, 1)>; /* SCIF2_RTS# */
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
+		pinmux = <RZG2L_PORT_PINMUX(47, 0, 2)>; /* SD0_CD */
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
+			 <RZG2L_PORT_PINMUX(44, 0, 1)>;
+	};
+
+	spi1_cs_pins: spi1-cs {
+		pinmux = <RZG2L_PORT_PINMUX(44, 3, 1)>; /* RSPI1_SSL */
+	};
+
+	usb0_vbus_pins: usb0-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 1)>; /* USB0_VBUSEN */
+	};
+
+	usb1_vbus_pins: usb1-vbus {
+		pinmux = <RZG2L_PORT_PINMUX(42, 0, 1)>; /* USB1_VBUSEN */
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
+	/* Murata 1MW max rate is 50MHz */
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

