Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021077.outbound.protection.outlook.com [40.107.130.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51293A05FC;
	Mon, 10 Aug 2026 07:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.77
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345937; cv=fail; b=YOrV+eM+fc6xYl4CtKm3uZQMc4+5DRcFPgP1GWxkQUZ2FKIDbWvYy+tNfj4/cV9jOD7Jld/1Yj/YwJ0XRkVWnSTgGScgwHC77KGUobHI1B+9Avf1ijkMMJGLUnGBRzwv/NGXfe6OnZ2lQgahMTPYxwEHnGpijAnaN7PAT1f2Wa0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345937; c=relaxed/simple;
	bh=80/S7jSennw1SlQq3sE6YBuAYKi3uvX5nHr+eVx2k10=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=N8T2z3tMA+cccHJNJcjImF0ramblUOihaeacDyN9a52lR2+YnydDtchyazQuepHsyPwQUh/kV2he55dyg7MdXXb8NP5WJvGdilzV+UCoI5b/xwMkO3hLkwmVyH4DCy2TttSZOJ6Cn1hWafmuIvGEP+WXB6qt9e3MK3BC5eyAfss=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=nec8ngHd; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=nec8ngHd; arc=fail smtp.client-ip=40.107.130.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="nec8ngHd";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="nec8ngHd"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TWOLiffZYDjeQ7iMhUu1am7EVNbfdQHWIaEEcm09bO4gSvkKrPgDbaXxT7TRr2B+GlQeRWlhCBOUjwrZN3VhL3UYlchfbMPxKBNSmxxCyc6detTwrnkMhxk7m/WvwGKWL+N/Qs1mM2WkGSjxQVxwZ3OAyJFs25hXbOGG1IauR7uRCoLf76RYRSPlXiHlD3Jt6gR0JBLb5NI2rC6jTa0QPM74FerlKr9j26TlfdsLODh2TX/jpHwjezyk2MlgDFvg16bTSe2WtjpdYMNNjCP+uaGpgGUyYP3Gfbv8dlnGe+/J6I0EgCRVOVVPzBPWHIUZgoAFP/SWy84eTnBGJ7eAwg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGpl8ysJRCyfrT2T+Bct2Kw29wTXQPWQdoQsJqxrx0g=;
 b=YGPQehb57i9ADX6+SN2jzQEfJddCM8iLA/mWFqxkYWt2sX3CjIR0w2tSyUX6o0snTfRRTIZJOVh9eKwZjCfqHSa8neMTLOg5ZxlY63p7LvDfYMcQcc9uB0nMaq4eIi/B7DopO9vAPDJlV/9URjDrYUVUWlci3nhiKYKwyccsJYgHnzt8zBATNWNUxxvYRox1rK1G0gll0rqYcOyWK90XiYyJ8kijKfzZ4oy3LuPsXieGg515SHNkCZBnuJzgvQo9VAXuup0ae9G8zJXFeox2EbPvfxsS/qMlFDZjvV0ThGwNd7S9zU4O83WehykMmChFx9/bsQWWkZZjSC/kkTlplg==
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
 bh=mGpl8ysJRCyfrT2T+Bct2Kw29wTXQPWQdoQsJqxrx0g=;
 b=nec8ngHduUQnFawPuuMAKHo1AH1/P4rbSPHcNkv3LVN5S5cDD9uqn4l4y/hK5Rd9sTQSf8mNGrpo5T3eJTtfv7bHyOghLn87/NwMPdSCPbRcBuyj7bxikHXcYWn5cpbGQ9vyuTcBr1pxZEqbQ+uX7+BzXfNCaTcTGuJCIaRJklw9PQDDTph4mKfG6JyIITN4F1pDMwP1x6KFcHamAFeSwW7ldRFIgk2NNNlJY+HoUorJRtMFmDtes4Nwo8a1l+oXLYP5EwWwh9rUvLbQ+M83y741HyHmI099BcbAdHyLSCl8IwSPq+kaoYU9RU3Mu+m6eoQzK4p24mPu5vKvkUq+Ww==
Received: from AM8P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::22)
 by GV1PR04MB9515.eurprd04.prod.outlook.com (2603:10a6:150:24::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:12:08 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::35) by AM8P251CA0017.outlook.office365.com
 (2603:10a6:20b:21b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 07:12:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 07:12:07 +0000
Received: from emails-2880923-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-60.eu-west-1.compute.internal [10.20.6.60])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6F30F7EC17;
	Mon, 10 Aug 2026 07:12:07 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon Aug 10 07:12:01 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786345927;
 b=DjxCeQgSE4JYpXcc7hkEJkEGJyDq+lRPk0/UZiFF7zjtfRzodZnI9JHu5zqzlVXHT49oa
 mAA6H5Y+TS1C8YJBwMFSq06cq9lfMQlnZOd3E+jJS68Zd3XVRW4/h13U0HYX2F+rdl47MZW
 k8TrOWSaa59trHA4CV7U5t1Hndb+fI0=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786345927; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=mGpl8ysJRCyfrT2T+Bct2Kw29wTXQPWQdoQsJqxrx0g=;
 b=Mmq958fEhwKFEcPxPsGb7Td3RaKhXVPAgdj9xWOLFll1iYdR/mmmKkGCPs6uMJJBU044v
 9lWC78L2uCfAr3Y/5evacIhlRFydqJ84LX4fQ49s5ofrcSf+2ofoCdy3NoPOqtVv5aYDHO3
 D9qgWogIS7TakdcYsPX9D5Rk3U83TtY=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGpl8ysJRCyfrT2T+Bct2Kw29wTXQPWQdoQsJqxrx0g=;
 b=nec8ngHduUQnFawPuuMAKHo1AH1/P4rbSPHcNkv3LVN5S5cDD9uqn4l4y/hK5Rd9sTQSf8mNGrpo5T3eJTtfv7bHyOghLn87/NwMPdSCPbRcBuyj7bxikHXcYWn5cpbGQ9vyuTcBr1pxZEqbQ+uX7+BzXfNCaTcTGuJCIaRJklw9PQDDTph4mKfG6JyIITN4F1pDMwP1x6KFcHamAFeSwW7ldRFIgk2NNNlJY+HoUorJRtMFmDtes4Nwo8a1l+oXLYP5EwWwh9rUvLbQ+M83y741HyHmI099BcbAdHyLSCl8IwSPq+kaoYU9RU3Mu+m6eoQzK4p24mPu5vKvkUq+Ww==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA4PR04MB9688.eurprd04.prod.outlook.com (2603:10a6:102:271::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 07:11:59 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%2]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 07:11:59 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v6 0/5] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Date: Mon, 10 Aug 2026 10:11:49 +0300
Message-Id: <20260810-rzg2-sr-boards-v6-0-41faa32cdafb@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALV5eWoC/23PwU7EIBCA4VfZcBYDM2UAT76H8dAC3SXRsgEl6
 qbvLt3E7EZ6/CeZLzMXVkKOobCnw4XlUGOJaWlBDwfmTuNyDDz61gwEkFACeP45Ai+ZT2nMvnD
 UXikiMiN41pbOOczx6wq+vLY+xfKR8vfVr3Kb/lH4n6qSC27UoEjr2aIbn0t6i57nz+XRpXe2c
 RXuCCk7AjYCxjBNHrSxco/Ae6J7qGIjZoE4O0vOCtojhhuhUXTE0AhhJjcoq7Txbo9QN8II2xG
 qEdI6IkBlAnZXrOv6C4MJEtO8AQAA
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
	VI1PR04MB5807:EE_|PA4PR04MB9688:EE_|AMS1EPF0000008F:EE_|GV1PR04MB9515:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa512ee-c028-4143-a164-08def6aeb06e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|23010399003|10067099003|56012099006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 jw3qTX66s/JlZtS3gfzlu55IkvDv4HGWyfGUeNl5YGNpcBiYNQmPGMAHp4Vsl58tuL0Bu9k/zFoFDJCSniQ8Ixheomzr8u+boqpQ/bFeFWy0D5re/M54Anv8q0k87q6iffMNJFrEpLhybDrhiBk1fIEJDYNAMzeYJWLQpYFsB0ys0b59cTeQ3lnOa4US8UvU6WPBN/h3jaRQmUpVRFdzjS96fhC8YkZaEOuEeOKqYamp6vkgTKGGxg9MMss3Yq/jE/AopIWtqwJzv0KiVXoN7JojrpIrWsFflkjzoEJN96PhAE/dmc2W2DEiEFoCZ8Rtj8NfVsgMvQsU0zPCbSqv7p2dEWo0F4o8wbfU77JiikBW+y4B2JWMphvXa50YZ94Mypb68Cob8lgshSzR27aKw5IBSF63wSh6iQIN340pSUXBsN7iKBmUlkw1pWyEvBA1cRJ59zhW0Y2oGYCkQl4vsZnw0i7mcIjujzkq2GqM2LA/KMbnyU3N6rcWS4hHfZcCYCOgrm+OnhwdoPkplnquMbOiRQc6795iC4agZIKmwjnirIyhmHqctydB2ysepvMfAvcxp8/sqChyWjAHsP6WlX3P4Mzm8hw48JxbO9jROxTPfzH4scl3HedqdQfj8b5J/FU/p/qmy+wRolbUHrPpSM4+cPek9dzMGxzBi69p/tMwWTxZEHGC3mGNaDCv4VxATLWx30O7uOyheq455nG1PWmYDJD7TJ+UoxO2xBB1RKM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(23010399003)(10067099003)(56012099006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 rnSBeHvR71NLif+Dv0A4kM07mDn+abQA2FPrTNtgp2jYop+7scR0B5k3aGVCFq/5+m8/w8OWPbRrCRQdgyxy7Nv6NKRG979mt5HspmfTa3TZ8KD4ftIrBMIFk91H6dPM+PNJHHoLsSL3TFP+1tpVnJVX23f/YIgyZmpuHttwPFx+ti9xbKukTorT2eRKB8Yz249fZyVxjwtLf0JVqfDtZ1hDw8m4ogVjhiyqB7GDAchlD8fFREKSraJdXhKbxpGuMWPb9j52/GIbbBdoQOq3/1It1tr9rweyDZfWqmCVk3/kCAruhYqTLVfOi4Awwn4IGS0R+iItxKOFtjwB+qY48w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9688
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c1e6d38b80254a5485d54a5ed63912bc:solidrun,office365_emails,sent,inline:861ddfbf4d31d0554dab2616f44bffc4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWb089bj7VNfO9LLkTQwnBlltmOZJ5Rq/gB1EBoxFjlOPf2Ogt5tunA+wemqMHW/5gg6+8uXgmBpepSGFSBGMJtdfR7wl4PE7rTJOU2ZlQ1QX2uits7cW/eOd6KB+Ir2LagMNcO3zxYY6mr4aEEg4yXIC0eKj5aVi1+KvynTpw6kCox+CWgMbL1xMRtDjZzjlmtHS/m71uHGUDhDBwcsKQ12+iKaLp7NGrF8UZEcDoJTbM6X3EqtpN6H1o40pAE5FFgBSpLGY0tWFFKB9pt0JzijL649670GP+XNRaOj673YcfaVQ4IDFMV2cEs1gI5qcjMLDZ+mTM91dbAR49sKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGpl8ysJRCyfrT2T+Bct2Kw29wTXQPWQdoQsJqxrx0g=;
 b=tF6mZnnNQEhZuzRzZhvD6fw5GXrjbhyD/O94+lNNH9MQqG0k1K/etvWN+krDJSkY2OBlS4kCQXE9mxK/KR1yf7Pt1446+kNb5R6aMjfJP3D1Y0bJKkZaQLgst5q3EbuCDy8Rvac88r/cj4EicZ7Wyia8Bx5LlwlN7koj1v7o9PKG7RXEynDuE1Fezyyy0xlysE+1IhL+AEREk/SIZPAUuB35RYk8xzudWXfHY/SLFxpLV7n2hEvvaCo6aFa/twM7e+wjKiSWSf3/ijWcv30CRiR67giwUFXE7IkE7ATGBwbC5nzmLpUzLy+WId5NWGOxMFn0OKNgNJn6Aszxa8mDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99e7e056-1712-4bef-2dcd-08def6aeaae7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|35042699022|82310400026|23010399003|376014|7416014|14060799003|56012099006|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	E2P4UBPjKxpQnwXXnjCr+vsKtM5yuvMCPxh8Abt+7D+XKwcphMQIo9RV25sysEqKXiadFFZYgOWrzkweM4ojtOiGxrE8uJeQEutIqHcKQD2ygu1Thknm7CDjtKVMQ1MVCAyBtlKtY9LuxPN3bwMn6OC9Ahc78IWnQ9iBSvntFjCI2/peayj6DO8ND3bOiBTxoeTHEfRgUg27cBfFIpBmeJd1CYlgUm1FgzCx8DZ8v/+en/r+eAsKVX85PU3Ff7hukx9iL4OC3y/sCuiPhSWvGZ+TKJ8zpI4vMYBamZB0Rwkx3OHI7XenXCHQaw726UU4tF99yR9ZrtoaDwOoadUoozrFuMehf25V9R3oSv2W3mFl5gLnLqAHN7WWut0oxYZExUIamMKys9V5cP7w2T7MiYcV6F/IvqYKLIipjExmyuvKdLBawQojobSitK9chwPn/o1MWg2cOhtCx1vQGorfrBN0apnIxTYErYsZWRn5ROAuahWy9PvAZ9G+hTNkh9JM2/NvlmLy2SwJxAYlc5aiMB4p48YHr5yeGdQr6l3fQtyEFzu6GThaeYrweNYobtT4nxfFsYjrXZiKWGfs6+PJ+Q6zCqksQBg51C6nsB6mABz0pU5wwj3V6uxihRkdqCFYhY5YUv/6vCz1UqGw7Snazb6yaDr8w2rBq4h3Gi5XbNV8IDb2GgLRzkfYzuiblA+QXoJjOqWWneJ7CxjP2lMuWQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(35042699022)(82310400026)(23010399003)(376014)(7416014)(14060799003)(56012099006)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ijvc2rsQ9MWvnZAIiQITkzqaGTsc3q/5q/0Pu12nlXoagGxYo3PBEWVONYEAzwmsrIuw6tCzCCtvvvA/3xvAm1KEDLmUiMBpfj5BjuzUd0esdG+ZClxJK/TczR0xCHoHZd/zxvJUidlHRE1RlsElYz/QAAKS+x5VHDEwhA2CWB6Ahdv+vTIKzd+K0ln5unkXrHZ3FdlxxRSsqdgARdcSHmNSYluZPyFiqpPvAQ/7KZx4H/HeJSxcIIY/eOkqLVEDyWjPFoWRVupICm5YKr+kuWEHLIb1OZuNG9ICxnUSstxQAXe2lDdQt7oxmW+SWI3mXfHPS/HCUmz7yBbjRO6QxjwtO4Z7hCdoJ8dNh5QcNmSO5ttQ+aurkfDER56z87rp893X6fuXgIgo45aeomh8rJTz+cGQWeL+2oUGr0WtCeC6HYeHiT0EY8PRx/le2NoO
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 07:12:07.6957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa512ee-c028-4143-a164-08def6aeb06e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9515

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
Changes in v6:
- Drop currently unused usb-vbus pinctrl nodes from som dtsi, reported
  by sashiko.
- Fix duplicate pin config mistakes in split dat0-3/dat4-7, reported by
  sashiko.
- Link to v5: https://patch.msgid.link/20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com

Changes in v5:
- Clarified sdhi mux dt comment on mux and gpio states.
- Added microsd & emmc dtbos to Makefile targets explicitly for V2L SoC
  too. Reported by Sashiko.
- split 8-bit and 4-bit sdhi pinctrl to avoid theoretical overvoltage on
  hardwired eMMC DAT4-7 pins. Reported by sashiko.
- Moved dr_mode from usb phy to controller. Reported by sashiko.
- Collected acks.
- Link to v4: https://patch.msgid.link/20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com

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
 arch/arm64/boot/dts/renesas/Makefile               |  35 ++
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 .../dts/renesas/r9a07g044l2-hummingboard-iiot.dts  |  16 +
 .../dts/renesas/r9a07g054l2-hummingboard-iiot.dts  |  16 +
 .../renesas/rzg2l-hummingboard-iiot-common.dtsi    | 560 +++++++++++++++++++++
 .../renesas/rzg2l-hummingboard-iiot-microsd.dtso   |  26 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-a.dtso   |  17 +
 .../renesas/rzg2l-hummingboard-iiot-rs485-b.dtso   |  17 +
 .../boot/dts/renesas/rzg2l-hummingboard-iiot.dtsi  |  49 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som-emmc.dtso |  44 ++
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 451 +++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 408 +++++++++++++++
 14 files changed, 1696 insertions(+), 1 deletion(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260502-rzg2-sr-boards-37d556668a2d

Best regards,
--  
Josua Mayer <josua@solid-run.com>

