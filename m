Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C3E31960B;
	Sun,  9 Aug 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786266298; cv=fail; b=EKUrmt044exASdPgte6ZXacVV3EqzhH1B1G+sbI4VOKHVZCOyq2hls81ydwkRQQNg1w14XPDevSZ3FRK8G/MMyRIfsvxowqRGyjFfGe1gYvWqzhrH2fQ14Eq/+pbFp2HbPLKEPCxMF0kZw5/l1vgOoU0YgyYsdSReZh8/YT2EIA=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786266298; c=relaxed/simple;
	bh=b/tKKvM2jJE0LZTZgyiX+DtXMWWPk0yt6CAPS2X4LF4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KcUdi4qbPGUb3E+mV8IpDAj7/JeEyUBdIsYQo1ivsVEI7/oAqIf20eRNMqOjwkiceWmXRB3ffurolGdNyNXtMoosOS2y1s81G5FbcHAW5y89jcnKmNkEWoh+ELTEL9TweIHdD7ElI/oD/dhdPJT3NhNaL4gM3UbVl4Vu+b3kS6A=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=l1TeWT4u; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=l1TeWT4u; arc=fail smtp.client-ip=40.107.130.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="l1TeWT4u";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="l1TeWT4u"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Lj+ttmSpJ2J4lV1l++4Z9qPAl0CNiEy5sjpwItfdQdGTEiFJsScIUdh441uLT6ZM7jaS8zvNU6/Zb0Iou0WQdzXN5sR1sn9hxkvSWF9+XdvLTj8tbLj87wKHXYiMIIXq6hOHAaGMbk3Q6t185RyMqNqYekP/Fs3A95k6RknRqb8BHE//cGOvPKFwVtqjMLrYfid+B3K+qhqZNnd6jd3ElIJ/ePRXBFgNsxxhuTPx3j0xplkBLByv+nE2hgcnNvfblJrqrQEKkFvifT5vKEtrIKQ5nLySpCzmmEjtE4S4Gh66ihf1dZUGQx9sduItK08/iIaYAKLbpMLluffPuUft4w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=kOQ9doAXcDpAzBoOTR+2jILgVlthsSTzl49dtunQwWdjO+rpduzx1cKDtJa50AFGU0e9e0rwcuAnQ1STNbRIRpKuZe4uhVycbXZrmIISZWaLqD72f4X7JQeNwd9BAZiVgFiPew7ZoTmwNdcJSgUEA+f/2bT/2MU25qy3W8HoWGGbCV9MeDgVnsX87dTv25Yi2AND9LLydMuILE+ODWkvkn5dAAEDJB396E8mJcEjP9Qmk+3hzG+VFw6hCY8nP2GJSoSwdqY3rxYC+yAEzgETGeZXHOvzQK5KcSIXlFKhGQoXJMeCgPYgzTDMpThyBpWlhK3XVFiCKcNZ+60ana4TYw==
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
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=l1TeWT4u3ZA04ytBZXbHxQ/L2RstaCgWhzgg71O04V/2qWWRUpwpB1J8p5iF6XrX66FH+w4rCqUJQnlQaUwAhBVILFHtF6S0DjbDlboCw2HdssgFvhi9mmecLiPRLBdqXwwYUHeqQ9Cf8ZLNYsUAmIYPSUA2eQF58+HYE6QmgQNZDjhQ8uB3Ug8BPUXnnWtqGYyPlEuldGXPX4NeOf4dYI0Tg4p4qVrXcvYxVqYYoK3VYcAw3rmRJxqK8jRcQRJHFsQjzvvw/ID+EkBH+HAZP6d22Feg3sJXdNvvpof8qrRLZbsOA52ngY9wIabQpb7pBUH3bon3G6AkiUe+EB7O+g==
Received: from AS8P250CA0008.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::13)
 by DU2PR04MB9179.eurprd04.prod.outlook.com (2603:10a6:10:2f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:51 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:330:cafe::99) by AS8P250CA0008.outlook.office365.com
 (2603:10a6:20b:330::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Sun, 9
 Aug 2026 09:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Sun, 9 Aug 2026 09:04:51 +0000
Received: from emails-1882748-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 0C2DA7E8F3;
	Sun,  9 Aug 2026 09:04:51 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun Aug  9 09:04:43 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786266291;
 b=fXDBIRryVO6/bBqTYmLZjkQiTXkJGSn6yBf3Yz99ISg4C7IBcaZHWTxE+ohLuLhFsVlde
 zFTS3ISTgadeFmohq+evjIAwhgvjAg8XS4ZUEp8+JKK/J3MXRbOBDa9lB4s7QIuAOGyR6zK
 r2cocbaofvDYEB2Q+d1NIPv5RnYwkFg=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786266291; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=ARdyOQZ5okAolYVWP4fe6BG6d2ypFuHGoEkhj2bYuUZCOaU/ofiqW63rh1KDywRQ8AeCF
 Cz6rW0Eh1YnNY+UAStUNvA818MMxSdfVsHda99INnogH6F3phIImyUMLXTuejgdeosh4yg/
 BPoc/2Fx9Ywg05zq9V8215H6K+Cubzk=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=l1TeWT4u3ZA04ytBZXbHxQ/L2RstaCgWhzgg71O04V/2qWWRUpwpB1J8p5iF6XrX66FH+w4rCqUJQnlQaUwAhBVILFHtF6S0DjbDlboCw2HdssgFvhi9mmecLiPRLBdqXwwYUHeqQ9Cf8ZLNYsUAmIYPSUA2eQF58+HYE6QmgQNZDjhQ8uB3Ug8BPUXnnWtqGYyPlEuldGXPX4NeOf4dYI0Tg4p4qVrXcvYxVqYYoK3VYcAw3rmRJxqK8jRcQRJHFsQjzvvw/ID+EkBH+HAZP6d22Feg3sJXdNvvpof8qrRLZbsOA52ngY9wIabQpb7pBUH3bon3G6AkiUe+EB7O+g==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com (2603:10a6:208:132::21)
 by MRWPR04MB12072.eurprd04.prod.outlook.com (2603:10a6:501:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:37 +0000
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97]) by AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97%3]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 09:04:37 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 09 Aug 2026 12:04:22 +0300
Subject: [PATCH v5 1/5] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-rzg2-sr-boards-v5-1-19c662358e36@solid-run.com>
References: <20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com>
In-Reply-To: <20260809-rzg2-sr-boards-v5-0-19c662358e36@solid-run.com>
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
	AM0PR04MB5796:EE_|MRWPR04MB12072:EE_|AM2PEPF0001C713:EE_|DU2PR04MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 2874aa34-3f31-4931-2942-08def5f5456d
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|23010399003|376014|22082099003|18002099003|38350700014|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 N1b+C62D+K1hFUJ2N5My3tx1eklq1XWNU15lgWfA+6vvNZotZcnL7Fajns07lgTkx3vQ0UogQvmvyYBKas7Rs3Qg0FdSxBOxPiwLhT1gLXVLrVJ3Z8Zb2vZZpJynMc++/vKBc0Ob2GcXYRD81zW1ukBkqz9gjfHvQugk/965lPa+LPzYR5KXMStIzAih2lcSILfkv3rV0smf2kCsG6Q9Z0buFPbOWqEvappGqze2AcjpqwvtRwdQa6SUX0uQ+PhfpUOs7kticIeq88wlu/PLrwhfz3bQiQfMYKKzc+pGyOK3y+5MJQrt3TqSgjhkxWTE12HXI3qCq0Sk8g3GCRPpm/0GAP6cJRWapBwQ8Pl78iVE9JF5P/Uokf3N3Y6AMIluf/+qNw+fEqhq5kp1lf3LcQzRb3m+yoxuUk0WelQ+gdojUXM1+Ckst0Wc+ETj251FyaLtW/EF/A4j4oMln52YQ8u2cSfHzG7mYvOIgJ/ji3pzhPgE1PA6D/2KJgGmlubDmqFxls1CKMMWhHKXB0GQcg7RxhtzCq9y03gOjoS2aldB+z9icQMfMAhoNtNy+pJAa5sESc7aycrvQ6y0Wkjt3MEglVcV3TSGjQWPbSC6uH6eZzL6zXbJu2yreoFVFW6/48fCbKr1CRjnYaFHdkXwI2CDnov3/TgiL0jWyS1YZNmUfVG/GAZQ/t/MD5l0uceo7/eyci27sB9pNMrIyVZqTslBkHzENnYXwHAv1w4pYmE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5796.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(23010399003)(376014)(22082099003)(18002099003)(38350700014)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 hdXhlGUg60MO/wh0rnSAQonMNBRt0c7KldTQJvtXqT5Ry3tCUn0RQMEbxCfLmQ0ixA9RtMhO0Dy6ERzQFNGEOjoFBJbqasU/PH9YfOST1edA/hwhx2skDyi4FIO07fPUI1QS2uEB6NOz2oZaGaSsBiCN5fAMl+vuaiMvFvqdrJxoXaHPQIb6tJSZm+2Jtf/J9WmH+ZwnGeYV6UudOLJthMQrcfB4kvLQulmqFlbd9FRTEcZd7qJpv9rWm/j7qElF4Q1lCzKMUZBsj+Lz/5S5oYh2Nha4NXpV5OyDe12X8SlOjgA7wnlp4lOReY78F/6aiPc1gDJLdbD8yw8rSk55DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12072
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 361f49e2c71645339fea3458e67a3039:solidrun,office365_emails,sent,inline:4f55ef6175bfe561320e3e87cb30227b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/2wzwF3tqp1FwFwQv2ETQBLyg4r753PcS4HixPnTjXHIXx/X23+Ul2arVNqQHDAZ7/C9xl86FLnv+HhwBW2QLZelvhpKkQoQ5jC11HOA8MjqxOjHcDH1oVn4+7OAilViq8dHx7Vln4x3Z86+dCrBzpp4kOHeQMrjFELt8I63HMntj2CitbgEGOc/nzL8E8Sxlcu4j0aqkFHSEYLKO6nDKW2XlCQbSak4KKWgjz8amr5XN2y7gxsJSSEUTRDuI+FV4Kg2RAgTF3H9dsQ75bRzTvpoM3naXOvZJPXj0nBWPN1WYAUEGTRXA1m5elZfg3rfkFoDWKKjtQaLppXxV+SFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zNdL7tWham87HoHwn8xz6ueibe+Hh/aJgP8wcB7vHs=;
 b=lrpwfsfQ0PsiJVzS7PKQCMLcHP+BE/tAvKVtkoV5Zvums8xIDLp6asCsIHUWVTP2YjuiZrCF6Wl4b/5jgb6rrLugSEytlR/sxMMXl7R2DK5VcxMhSf30tc6n6nno8ZbdYco9LOmee1Qo3Awl+5ATqRHa6R6NeNAWwndDR9T9vtQt5FDYFR6vHwCLpunIuaVyTBcKMumS5oWwwTNbybvDoauJPbJXLhyZFHqh2xq4bUTMTw6mrfyKQZOsWiqudbgDDALrRfvssB8G1FG3NB+d0VTGFPOO5LivUrBAYM7HkD3PBhsD60AKW7Q0OZpWEmb1cngrquShcQtVxZQTVlVwmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	17966be4-20b4-480d-d8ec-08def5f53d3b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|35042699022|1800799024|23010399003|82310400026|14060799003|36860700016|13003099007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zCbYzVsmNKNtUOmEhS4yQkjK3qKsywmcJdPKd3U0p2X6x1SCd49M0aL752Win2ckAkHuaqfHs3Jn+YoEMlKt75d7sbGOJUeajhvZu0gisPQUdFxyh1v9lOYiDZLONvVtGQpg4qsY92aFzoaQesMpIR5SyQsDmZbXM8lGXiv/VovB2OEksyV3s22HyCATMixq2D4UmbylfgUr3qio8laov/Cza5UMm7W/MwjW9vkQsSRfonKJD47iWzKW9WDqF1Mzdmof+/hdDK+92+t4xtRDElebn1JX1aFwlztvLDXr3x9N3CSa1c4k15N830jbtunxaKqVIqZ5taahba5vHMRoJaXVj75E90Z3E8Aur7JDSeVv8fHwM1hYGDletG/1jQ9o7aBiYpnF8+dW8Y97d0hD391VnXpFQKl7ELNtwyMf4oLI1QMWwJEnpV4X+OlgIExeZeFmeb5yptPJ9/AanrNM0Dpmoa82d76oWfD3JlciEEK9KqebkmH58BhWg1l2QkMcMKaJyLNNxQFbYg6a+RvxmiZKE3I3CD2lwOxONelOG0AOeEKuWzsUcNQe00ZFcI3j5NJdqZINNoiw8gs8xbvkw6xKnahWJyFPfxPUJlVh2R1Ad6Bkq7TrZWhfbSPPBHLADu+6OSmyPH1NJ8/1Mkl7yYbX5vh+Cqnyi0pKlznoQdK2rF+Y2OHS+LAdzq3IQcXeA+wHvmPi5yitZ7VJLjLqdw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(35042699022)(1800799024)(23010399003)(82310400026)(14060799003)(36860700016)(13003099007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	joL7LlPVC3XDVaRCjXPIo/sN9bsvWND+xgc0p3SIvrlt8rzZIOsv2VpVyW+Llwv+sL0dYXhVump65vH4rFy1rpJDt7emDinZLe8TX4p4botKGBEj2vxmku2m/SCNKRDAwrLhNESkx0fP+qgmYqGAjrOe9+hsVhSU3UJNP1O37m1u2QH7d0ynLr4gT+678+AlR5RxcXb4KvousTCxSRNBnS7ppPE49DT1IKH2BlG0ztWLjPx33Ca3lf32PJ48lOY6BoxAfRqnBG0EdMvRYVrVLOQFmf7MKL+IpZGZyQsNUMaSEDShUZ9d4eeC0ZwjRl3UE69kwkvE26iydsD12d5OarS8jYJ2eCMaHIzlvPgMDcZ1vHHT0O2aXJxKrl5xhxPPJrq/3/jaRSKsKhqodHnlP2KoNNyTOSgo8y+swnL2blMEJiG/ho4YHDNPQvr4dE+/
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 09:04:51.2764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2874aa34-3f31-4931-2942-08def5f5456d
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9179

Add bindings for various SolidRun boards and System on Module built
around Renesas RZ/G2 family of SoCs:

- RZ/G2L SoM [1]
- RZ/V2L SoM [2]
  (shares PCB with G2L and has very similar programming model)
- RZ/G2LC SoM [3]
- RZ/G2UL SoM [4]
  (shares PCB with G2LC but programming model differs largely)
- HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
- HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
- HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
[5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
[6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
[7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index eeef34e3d7d0..1673005a3d93 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -508,6 +508,14 @@ properties:
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
           - const: renesas,r9a07g043
 
+      - description: SolidRun RZ/G2UL based boards
+        items:
+          - enum:
+              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
+          - const: solidrun,rzg2ul-sr-som
+          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
+          - const: renesas,r9a07g043
+
       - description: RZ/G2{L,LC} (R9A07G044)
         items:
           - enum:
@@ -519,6 +527,25 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - description: SolidRun RZ/G2L based boards
+        items:
+          - enum:
+              - solidrun,rzg2l-hummingboard-iiot   # SolidRun RZ/G2L HummingBoard IIoT
+              - solidrun,rzg2l-hummingboard-pro    # SolidRun RZ/G2L HummingBoard Pro
+              - solidrun,rzg2l-hummingboard-ripple # SolidRun RZ/G2L HummingBoard Ripple
+          - const: solidrun,rzg2l-sr-som
+          - const: renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
+          - const: renesas,r9a07g044
+
+      - description: SolidRun RZ/G2LC based boards
+        items:
+          - enum:
+              - solidrun,rzg2lc-hummingboard-iiot   # SolidRun RZ/G2LC HummingBoard IIoT
+              - solidrun,rzg2lc-hummingboard-ripple # SolidRun RZ/G2LC HummingBoard Ripple
+          - const: solidrun,rzg2lc-sr-som
+          - const: renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
+          - const: renesas,r9a07g044
+
       - items:
           - enum:
               # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
@@ -535,6 +562,16 @@ properties:
               - renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
           - const: renesas,r9a07g054
 
+      - description: SolidRun RZ/V2L based boards
+        items:
+          - enum:
+              - solidrun,rzv2l-hummingboard-iiot   # SolidRun RZ/V2L HummingBoard IIoT
+              - solidrun,rzv2l-hummingboard-pro    # SolidRun RZ/V2L HummingBoard Pro
+              - solidrun,rzv2l-hummingboard-ripple # SolidRun RZ/V2L HummingBoard Ripple
+          - const: solidrun,rzv2l-sr-som
+          - const: renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
+          - const: renesas,r9a07g054
+
       - description: RZ/G3S (R9A08G045)
         items:
           - enum:

-- 
2.43.0

