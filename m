Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023112.outbound.protection.outlook.com [40.107.159.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4D6351C20;
	Sun,  9 Aug 2026 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.112
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786266298; cv=fail; b=dxxVhkaxx3B+oZt6eFG8GcME2qBkEb5pF3WwkK901Vs0srRMqWfbKRz8aUsfKfCQ9xtgVR5wWaPzHR3VHl+JGPI37uYCQNERo3cxnfnSwxSRRvUoz020939QZBWLoEpaGjweSst6yvY8Jv5iDyaKjROJg4txDqBBCJbkTbUbQ8k=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786266298; c=relaxed/simple;
	bh=IMNVCn+Q3YBBLE0LImFNtzYjDmx51OqAQ2ouuoOdtGc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=r7uQiMCuyxJIt9N9m0NWDZ+Unswd++LNLpf8xyry3xxsUdjk2rqWQInVPGU4zn990TJwEkuL7Spg+XYKq+BTMvOCdXCmugvKinzgKTG+wP4yteYvxCJ0mNeEy4OwNciJlyABt3E8XpVuvpqWBkLhx9CDIRX3IJPdUA/T1paM1JA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WWTWbbJ+; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=WWTWbbJ+; arc=fail smtp.client-ip=40.107.159.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WWTWbbJ+";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="WWTWbbJ+"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AcxpezVz0mEiSghfZFn0yvQei4/IYprpllWmA0sv3y0bcFQzJA8EMfcRxy03zURzsr4BxFhk4ci2As3GlZHkpev/KTkXr+4nJYA3dW4Dq0aBSkKJmaQm8q50m90qNT61DFKbR0feCqCibsbEJxbxeabSBk054CUme5ugR/a9x6bNKa6FEGkIFD3tlrip0E0QUaiuwC1+VbD+2uGSLw9dozcBaw4MGzdNBBUTYfSWQdZc0/weq1c+0hJewrrE+VDATFst6mzTM16AqfkcAki9iXDNy0a3JGFaAc+bu0u8Wf5nNG4dKu6qwDP+J9pRPG8Ap1AAMQZgdbxJD4rVuY/dow==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVcUoUMsvOlLiclzHNWvbPKKw9A/RvNfEwEH17xLcDo=;
 b=yDbWEblDD01uZzgGPq69rXe+pFCMufNotLoSYCFKfGwskIBSEwsDAnm4TID+aB2VCxJhNzaajuUzCv8P9wHjDXrJo8/qcRX1iOetWAif3dQxcIutOXiEE9pRnpYU6/zD1f1n1Zc6O0BKW/hBLiQf4Lqtd3v5ZQ+yNU+l86zqEd7ivRQr7ZADbvTJ5nzScVWmCuiekEwGrPHF3VhBl491yXJBvuVWu5tm5k6FokUBvGxzXw+KBXqtm76tLpKiSniwvZRkRXBllEzLyNCyjFoufXOVVEzI5uxqRE0M/LKHDlvxR2nI0zDu+E7u7yE5EibQKgBXc9U575zn0JJyp4qhow==
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
 bh=XVcUoUMsvOlLiclzHNWvbPKKw9A/RvNfEwEH17xLcDo=;
 b=WWTWbbJ+Cam1LfRnMQIiNu/htry9uqbNJ7J4I6zNzwWi7lYGaXVyA2eOrvbGFwaIulWn1EwFeff7kzz8mNJGw6WWzHvznM03uGra4xMFzhMl3ZWMGQTI+wmc0NDT4dQDt+x5W2dxUzF8pzAWNHacr2OmET7MSWckPnAjNO7spSgQKL9Ccp4BZHxEcN+Di4p6HCBU2R0tWnjasGqwoC5TH+3C0bH3z7V0++85V8M3HmtHru6UCpyN/+mZsk8mDcHUPKS4i7BrRpHyqLnmxiGyzke1OddsJ6GrGPECl+TrM2T7hM3knk52VW8qQe0Yw9S1LWDbmUgg/ZjUAttc3YXhdw==
Received: from DU2PR04CA0182.eurprd04.prod.outlook.com (2603:10a6:10:28d::7)
 by PA4PR04MB7951.eurprd04.prod.outlook.com (2603:10a6:102:ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:51 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::2e) by DU2PR04CA0182.outlook.office365.com
 (2603:10a6:10:28d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Sun, 9
 Aug 2026 09:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Sun, 9 Aug 2026 09:04:50 +0000
Received: from emails-4669013-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-76.eu-west-1.compute.internal [10.20.5.76])
	by mta-outgoing-dlp-765-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id DC3AF7E8E9;
	Sun,  9 Aug 2026 09:04:50 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun Aug  9 09:04:41 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786266290;
 b=bVkcF+uYG5GXynp5GqSpU9eR9RNdIZkITwmmqW3bsmnZPukN8c6jkeQj9TIm19vtqZl55
 SrBfQCYVzQEBQXudYIE2Me1BRcfc9P+W8qsrkpfnGpBGU4E0FEtB0pqie85mWPppOpl33Az
 aQGf+unLEeEUp2JvJEskFTusiwHLjTE=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786266290; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=XVcUoUMsvOlLiclzHNWvbPKKw9A/RvNfEwEH17xLcDo=;
 b=e4u+9XaDq1EHzf2qqZZBmcDQibCA6qPI79wfYO+m59EMR7jr+etFx2L5dbdfeem578SEB
 SGe343UwyMN+eOv1b2bL+K64Vu99CVmb5UokQHWcRXDVd4ArXC+h40aupTfJYDX2ebkzrjo
 n2knX9NGbBkfsxs4Kfqs0tQbsFXZAaE=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVcUoUMsvOlLiclzHNWvbPKKw9A/RvNfEwEH17xLcDo=;
 b=WWTWbbJ+Cam1LfRnMQIiNu/htry9uqbNJ7J4I6zNzwWi7lYGaXVyA2eOrvbGFwaIulWn1EwFeff7kzz8mNJGw6WWzHvznM03uGra4xMFzhMl3ZWMGQTI+wmc0NDT4dQDt+x5W2dxUzF8pzAWNHacr2OmET7MSWckPnAjNO7spSgQKL9Ccp4BZHxEcN+Di4p6HCBU2R0tWnjasGqwoC5TH+3C0bH3z7V0++85V8M3HmtHru6UCpyN/+mZsk8mDcHUPKS4i7BrRpHyqLnmxiGyzke1OddsJ6GrGPECl+TrM2T7hM3knk52VW8qQe0Yw9S1LWDbmUgg/ZjUAttc3YXhdw==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com (2603:10a6:208:132::21)
 by MRWPR04MB12072.eurprd04.prod.outlook.com (2603:10a6:501:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:36 +0000
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97]) by AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97%3]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 09:04:36 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v5 0/5] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
Date: Sun, 09 Aug 2026 12:04:21 +0300
Message-Id: <20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJVCeGoC/23PzQoCIRSG4VsJ1xl6HP9adR/RwlGnhBpDS6ph7
 j0niKJp+X5wHjgDyj4Fn9F6MaDkS8gh9jX4coHswfR7j4OrjYCAIJwATo894JxwG01yGTPpOBd
 CKAMO1aNz8l24vcDtrvYh5EtM95df6LS+KfZLFYoJVrzhQspOM2s2OR6Dw+nar2w8oYkr8EVQO
 iNgIsD4tnUglab/CPZNzB4qrBIdYayzWlhNxD+i+RCSkRnRVIKo1jZcc6mc/SXGcXwCNgEXoHk
 BAAA=
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
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To AM0PR04MB5796.eurprd04.prod.outlook.com
 (2603:10a6:208:132::21)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM0PR04MB5796:EE_|MRWPR04MB12072:EE_|DB5PEPF00014B9E:EE_|PA4PR04MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d2ec41-104d-4ac0-04f7-08def5f54535
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|23010399003|376014|18002099003|38350700014|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 /ijEaQdFEWkFmSltl+YRnfDOxa/FnO+sXWwFoxpx5oghgHXejT1RCP19X3Gb2D3kbgNbrDdr8kPpzW9HH9xuQiGliOekhoXjEhZFdQ3HGIRAMke2k/URuqNe03TElPX7PabqlkChvfG8C9LbR2pBauPYc7vNlCgyG4R5hruzihG0oca8NT+3T9nAWEdeR6xwO1ppTzZH4YF+Wwc5KBLcq/pTneRyqptiZ15FPrPBqqQ/21PYYE3U8WhpBQD5h3eT9yWBfMUNkwkIWpT1jqCjN6L4Tgx2tbpiaLAxn4tvSQllMoKQx1BUiyRfS6FtYF0oWAUWoPf3W72fCUaaiG9xhgolOQ56rf9CwyIifGfVRHNZi5M4p7klONYNXKJ4ac90VzZdOLgobKIxZdWtV2+Lfd9ucGSWAIl9320cy73QzmZ2efki2ttn2HFwv4hcMqifnSM4JMCgod5lDD1BCE3s/ROMj/2qs+L17vy/ZGILNx3//DyOtBcV6QE6TrnKdfNX696OugDaLtdedqT6bKx/9XBidpEIdxLj3gSaWj9HBmsQIW+gvIqZ8U0gVvvqjXMoMWkOoJwvvMuCqMQ7aMI42q71GhyETNfFsWqtYxKWDV0/mpeM/QYZk+4kN2plzqjua2k3mQpPuYqRyxJtry+VGgB9uzDfLISb5fF9RbXlJ9OWGv47gGA/6xLNYezyZGI2jM/Qo5E+tKRdlU9h1IIu34eySdEgiJKG2um0crGejvA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5796.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(23010399003)(376014)(18002099003)(38350700014)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 JQUSl7vVPCaLkdErAJvX/3EpsckN4vZbNoZ/JuoLXA4tkprdLo8kO3Vq7cHCrQ0T4PykGI5piLvJzZPYSQAU1lZKfl9kLyhAEAa3TL+zE0Igfbf3x2A9ME/WWChb20Ss0sRJfsfqFuJ3ooVcFHfgi2igKihBsW/7yVu5opsTSi+l5uOk/OZEAguxLmiRWL6Z9nx4Ubmqp7r9ZfXdnfla/Npr5vkeO5eCLweJgP4Yaz+PeuYgnETyqRt0QEzknp88QfvJ2dXxWlM+HOqOisXD/916wzeW06ajeX+WokxQ/wLzZ0V/7lMYPrGbq01Idao0DCV92zUtOyEY50UkGEL1zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12072
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 91f7c666d6444f448bb636205ee84fa3:solidrun,office365_emails,sent,inline:3964eef6715610532bdd7dbc94539426
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDjO0Qc2JI1Q8vHYE7IIAnBLOf/vhlNEKtcumpgwD39fDG/z4epQAmlIOWkkNA6XPSm9ykH9OPMefgPCQrLdowgTO+wJWGaK1P/zmJ0e16QNOhMWRg+VzKzY1d+xLbVQKCjK8Bk8vvKh0aHIKw2gHI5w7L1/YkICR5v2swnQkd79YRMeVo3GtoXG6Fe+Jm5vSicYrzwlGvOankSU88LuF3QBqEulVWtoFBPMOK6XXl2h8L9IWKm/T0K2oT5IzTMr7qNKBWl3lLjPhpryER1xB/pYLacHMDX3J8AhDqoZRuYnECTE1csjNv5LKvrOPIaudGi4ZFbdq9t1lvH6vX+pJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVcUoUMsvOlLiclzHNWvbPKKw9A/RvNfEwEH17xLcDo=;
 b=p0tOOL2UwhXILlvkLvl4TKRQvPRVq7981CcISNoEncerXMu89LgAV8vM+AKA3QYBC5lHEMgEJu7O0GxI3AN8kqAsIr7mgqA+VYTN4h3nYNWIdEJ0HJyT9BbsllAzsgiHGP1W+To13GaAmAwMTcI7AOHt3go/YorJuPuEqjnP9Sa6lidH6oe7yWkIL2jUz9Qs745P3jQG2JXy45yrv10WJ5SEFI2RzDSMhWVXzKU2E8rt9foCJmX6Ua0mgnNbOEL3LaR3348TQiRu2341NC3EkHQxEYNoUvDHXwDHRIVyIeFh6AhVmy2v45+nCX2RfKyeBSVaSZ3nMiEqM+urYpTpGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	199aceda-d501-4726-ea7f-08def5f53c51
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|1800799024|23010399003|82310400026|14060799003|36860700016|13003099007|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hph1JKIa87v3zTjIxsex4mFlmAJZUbU57Pto63wrN+5cxviPK+vL96pALMPbRU4KkJHdkYbHmYKInxwkat7N5xxh+vpxkSUTybUm7MsSNkz/i0DWbTManizsYVrH9f9lSCZfHqD1NV8vyNiRR/FsIfmg85C63PUqv0ZM8gclWeOynj2IBo09H8VMF58hVADHDLoquSp6/8xjrRlakMYwSgkj5MrvC3LYpyMQHxsWsSE30/vK4gvEWgy3C6fRLlBxry3kd/YNYSdpteKWMnJiNocGq97j4oSR4hnRetat+4ipFJSKdtwhTJQvo7n27uwJ2FKi8LwZ/bF8l1klQ5LjjRFaAwC5D+mC9iP+xzeHijBzeCe4t4TlWUNgbCFqz5eXVaLEM9JlI7hRkWN4Fjyi16yTAqIGcLondLyQEWDSmcgZ6PW9iB+oHnDbJFogwNpQx/ZLgYsPPNm7bbHqjLNKteWw2zH9AxXsMrc+khnHqHxrPHC624v5sEnxuIEk+SDE6KXcP2iYuVl/5WksRHpzG7h7Yv0dYlOzZRFX7n04OQgrWydQI4fOe5JuqdxjXIBtPBWCmwW3rylewnKa8ddRpb7xobuTc3llmnudRGaSdQKgdWDDxaJQOrTgtBTg0LFJaXEJmLYsETs3ogkyGRNODPsaduIKm27SGJ0odVt45+Hq+gGB7qFnKOrkVhJIM5N+zQjqssCko6lAyhNNOv0mXw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(1800799024)(23010399003)(82310400026)(14060799003)(36860700016)(13003099007)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5PUQpJ9k909MP9MzVOQT2LYWz2ZrJt+K7K+pvdATJzW3FbFHAdlZxXXsqDuIOO2oyYM2oEDx5kutMYN5LJE3o6bmS2fipzKz9A/hiOrQt58CrCTJHxo1iU28nWz7RySfhspHfEH2bQj+zALOPXxDxIhqcoKKyeNV1KHYh32ZRlyInghrFc+VM7UOnLUQ6w78ckxIRTsYQEFC/BnNTuZ3irMOpKo8XskfuD5nSh/vlVy/bcgdPCVLBw7jaq1Fvwhsur9ZAEzQKcr52B9MpzlNiKidl5Ht3YKTzUjRbX6iDfEqDfi/AnXNFqr+6NFXK2M0qACOk9eOFqagWdGr30yrtnu9lIiPUHjVoBHZdhNPpewEUzUxRbVmApiratyNt5Unjr7vKZuCyHrWD54Dsc7ZIWv2XYaCZ8yPBK3d6Y3UuFnUbasDiLamnwFa+1XUgoys
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 09:04:50.9635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d2ec41-104d-4ac0-04f7-08def5f54535
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7951

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
 arch/arm64/boot/dts/renesas/rzg2l-sr-som.dtsi      | 461 +++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 414 +++++++++++++++
 14 files changed, 1712 insertions(+), 1 deletion(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260502-rzg2-sr-boards-37d556668a2d

Best regards,
--  
Josua Mayer <josua@solid-run.com>

