Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021080.outbound.protection.outlook.com [40.107.130.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695913B6C14;
	Thu, 30 Jul 2026 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.80
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407946; cv=fail; b=J9TbUyDUO4z1FYEo2o34VS/NMAoHQrA2eeygIV7uqeoWJN2xEYFDUD/lUjJaUgscQT/+5CgVuWeKf1zVuuG5oIqMj3SZ2vkR1R8uTRqcS8kBGyR9t4U4EQKqAAJ2Q1qO7RBdMawxIry5UUeqsrEy9E9rwG55REvVmTV/VzQ9NfU=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407946; c=relaxed/simple;
	bh=jFTcQtfu+Tfm8tF4JZ4Y73Pcu/QHqml8e/r2Pep61/o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fBU50xT3sZmY1blg+4WI7z9F4SsA7h33G/aDoUH8fHsRdLI3htlQzPg3bw0pBOQ8DEjptmG0IHgT+45+YxN4BspZvxUn7Y9zmjG35Kw+Hx06bXdT1vd3ut+wv7H4+tGguvDkjXq4aCRK3XBSpmnokc53sT8Qpuk/N8vKv/x01qI=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=o2DCU5qk; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=o2DCU5qk; arc=fail smtp.client-ip=40.107.130.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="o2DCU5qk";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="o2DCU5qk"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vu0xJd73pIuhSeo/RtJRqXghUGW7HPGAZeaXW6ibWZuEr4XiJAbArhj4WZGz9BwwQu5GUED7H4sHe6CVec9hG/3pM7uHP+/agkC1n5KJh7lHlUPonK1g+OxgsVAKTWUi+vLzvOfqtG6403XKxHvm7cjZvgXonV41H6yzHAO1XOmnu+ZTY39U8mODyLxION9yeS/Nhnq/iVkAc6QfrtPd+ObTqwJYmEJfF0w2zPnvZVWRafO98KHis13v6IUi8Qwrv6GaciFXZh4+kLrAxMskOyxKpyQw7upLnRxCc0VweSrGfh10EZ5k9wZaagunZeVceso8M6q55XNcz9PIXYdzOA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPR/xUHsxsq/maoT5I/nEWRfkAzhEKallHVHmsrflNQ=;
 b=dB0vBhqi8pBUyRWjZsB5/H3+qp/A5Ufwm3iSGXaHl2PZ3ZO/XP9PMQDJIKsgHA67EzXbVJK/e3sUZ8O6ZKP+czQZBLtzXeRhbg4Rg1lnrhdqPikEn7V7XYoWLQzp6h+0RFou2QqAWujLMw9X+frJzWr1U6xE84zLGRr1b0GoSKZzRx1yRkTGKKuSvMkU2BETrfkEXnEWJjMhTlh9jDvBlRnnFaqch91bnPbGmqp9QphlcOvhojKEJ87MxzKHYW/ktHbPcknK0p67p8fEbN4lPQ8I6V7tmREqLCIdawmyteCK3IWO2OcFtEU1eh1fvg9NJqGrbzGdmgwg5IbAq7S10w==
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
 bh=cPR/xUHsxsq/maoT5I/nEWRfkAzhEKallHVHmsrflNQ=;
 b=o2DCU5qkPIP+ctr6k5YRJlv8hPdwYA6qD/SepFxbRJqK5OrJ+aawGux64yPS2hAVz5F9VhcECpiFqPBI53gJi7yl65FplcMez85qM+lP4buVB3a9lgro9ATlf+WggFfsEIpXJXUqn8T3F/oMTO9u+AKL/tIPxO5W2Q48YQ0JlJw2mznbnsTuB0C6m8TFreY/cmsm6MqiUNGNFNdo8HYUW1Ah1SNvScWBZN5LfxCfb+jPOPB/noEHP+qX6W8hQu32Dn3hGJqeA3ixk1SR2WKQbPUYk1O/sCixpGhw7+pyAzfoq1HoLcPqdq8ibYPBKx5Z+kO2evL4emII9490wlyHaA==
Received: from AM7PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:110::35)
 by PA2PR04MB10311.eurprd04.prod.outlook.com (2603:10a6:102:413::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 10:38:59 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:110:cafe::43) by AM7PR04CA0025.outlook.office365.com
 (2603:10a6:20b:110::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 10:38:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 10:38:59 +0000
Received: from emails-4764909-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-206.eu-west-1.compute.internal [10.20.6.206])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D38C681230;
	Thu, 30 Jul 2026 10:38:58 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Jul 30 10:38:49 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1785407938;
 b=ni/Y9VWzxx1oXFVa0N2qZcZ5l1yylTOPCm8/FIDX3xwBlPg23qZNdvJ22eAff8frhq9lB
 qRIROuhMVO2AtoHZ5LS18DH4eyFM3Rik/BxOrFsa4TkIU7r8NmBhsMJtmRp3dwOFcDc9iq6
 DZwaWARMKO6MHqDIwTN+auK3Er2y/s4=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1785407938; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=cPR/xUHsxsq/maoT5I/nEWRfkAzhEKallHVHmsrflNQ=;
 b=AwnAUbTeUJpADpTRbH42EmFz0Gf8xzVC8uF7LqCgvzS+nrl/phXWF8FriVB0jtkyKnGV7
 4CCKwhEcfnGm+vJ9g87JB04TEwtm0/qR1/6NjYe0bDTLFhcd0vM+XaEI+VpfB1qpceaaBe6
 fU9rhFa6gAS1QvMB5pbjmof65+wTjkk=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPR/xUHsxsq/maoT5I/nEWRfkAzhEKallHVHmsrflNQ=;
 b=o2DCU5qkPIP+ctr6k5YRJlv8hPdwYA6qD/SepFxbRJqK5OrJ+aawGux64yPS2hAVz5F9VhcECpiFqPBI53gJi7yl65FplcMez85qM+lP4buVB3a9lgro9ATlf+WggFfsEIpXJXUqn8T3F/oMTO9u+AKL/tIPxO5W2Q48YQ0JlJw2mznbnsTuB0C6m8TFreY/cmsm6MqiUNGNFNdo8HYUW1Ah1SNvScWBZN5LfxCfb+jPOPB/noEHP+qX6W8hQu32Dn3hGJqeA3ixk1SR2WKQbPUYk1O/sCixpGhw7+pyAzfoq1HoLcPqdq8ibYPBKx5Z+kO2evL4emII9490wlyHaA==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:38:48 +0000
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f]) by PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:38:48 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 30 Jul 2026 13:38:35 +0300
Subject: [PATCH v4 4/5] arm64: dts: renesas: add support for solidrun rzv2l
 som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rzg2-sr-boards-v4-4-08bc459578dc@solid-run.com>
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
	PAXPR04MB8813:EE_|PAXPR04MB8974:EE_|AMS0EPF000001A6:EE_|PA2PR04MB10311:EE_
X-MS-Office365-Filtering-Correlation-Id: b1eda098-e30e-4c48-2917-08deee26c3ab
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|1800799024|366016|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 T+YthH0vrTjEjf+YJoSmid6neTfJ7lTwGQvEdEOdq2Sr6qt5FIrF2K4tqaIvnM64BMAYb7jH5x4GhEWhgplHocCg1zwSz7X+NKG06JLSpPW4hvYYEr/i0r5psIuCiTeLpEt/8qkA1US6c8Xt2pt6QcdqzqTy5amlJUAIfOEe6TjGMKXVqT6ju6K4imc0Atozz9dYIj/Ar13/WiT8CaLR5ztE9uOh7T1PjV65ssaOYVMRFsuHTb3nkX9yfaSqpbFu1BUiwH6Md/M2QFcs1QMDBo6TNYyxZrweqL3u8cKpppNbJ9VILtqOrq7joNiF9TSzQSbtV9f19rYsfGXnXjtDaLnIXkTY2C8sFcfgV4oIzOfLcUUvQjv+mmKdXmtXaCEDdOW3Y5dGD5oVcQUFR9KmukL8kRDqcLPXoFuTVvUwRB0LbC9oKnC6P9HQ2j6xu/1TO4v92yKhhnE/e2UqzUm190H88Qqzwd9UZW+vxg+NT0JpQ0YgmbTU6uTgLj4quQcBXBJ8PHVLgtcwKJ5ZwHTvd638d3fQGog1GtsaWb1p4zLrlMSF8/9pf3qBi+UirUfW0xWDvGRfiWisDbJ0nhJo7/AEsscVj2NlI9fqGd+HotGrACZJZRkpWWu7oOiNAdCpScg7fu2ngt9ESYbrpDODUZ06NbL9cAEvFvVKLeygXsxb6UpQeJLbZZXbWJsrCUaIvGjiVtTBfZFKUlBnyZHGWLFhRN55GVe9Srhr/pfxk1o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8813.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 gev6lAMrEiCi7voJhnXi+/AZsqfAvF54bByBjtNlOWbmPZ4VCqQ1x+4Lr/rJaQ846uhRzJmQShLo9kIXvkkL8jo3KQRQ2kz4G0DCUCtPuZBILGb53p40IDCiW36Olc67jvI2kbak17FYaLmTJ7dHliOESw9rGh0E9KT0kQkuzGJ5ICOwungpFgZUI+50IyklKWBkG2kNFTNVArah7iORN6mEetqb5ZSkHTrIfnY5cv/FmlvH3LILpjdD6r7pT7X0ucIVW2OMLOzPOe0QYQtLHhQxQd1ovl8waxyZZDwM4AOtzWWYNIqw692KqwrBD54zB1ZLRf0wSAy8y7vb6gg7GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 54e2a296b3b740c7a250769eef493f18:solidrun,office365_emails,sent,inline:185e14fe6a660963052cdc6c626bc657
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TncSqd64CK2SLPV79qoRwi0TF123hkqVTuSiImkN9YgDqEFpfIqbx3Jbxol5cxNe7OhxmFLZ5YQfu9BP++mkcUHsF5DaxlvB1++zUHdUAbCyGacUh+67vpJOY52KCTnhM5zedguYIdC65K13K/mn5JYo2LFClhdPiVbi9CW/8187Jh2uESKW2D4s6+kTFhEU6yodTx9rKAWngemOiA0ZXj2aKZTVyu1w+ZilJLTnV7cXStxdD8OwtIV9Iuf89qAyPy61kWbRKK+1fTcbYMXShJSnU3L3jajZLbPp6kWAl5/gACci4PVGTXQh0UHj+5y0i3sA/RumGNE/TD8wCueiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPR/xUHsxsq/maoT5I/nEWRfkAzhEKallHVHmsrflNQ=;
 b=KEevzIf+MN+LQ4Tar6+M0YI/5lhgrLhx7PlGyGCp5TMcG/WKR1A6+9JQtyCqpTWx+j6TPCpNAKTvOMEXby8LFLFoUQhVKj91PrsuayOQOldtgZuVzRIKT0tWKmuBNs/TeRHu+Ps4xnwRQ+GMJFtUP2NTnN7g+1EjSiZMR5baK3b7IjN+6jte3KS6oSGpIFslKjD9En8JR4dw5AysLIQAmwJnnpY5XNEZmwF/UW0zyu3noSawrZ5Fvv7Dhd56BhfxiURrmn6OsvdEC8cf/v2a1Qri5t2xw0bVtVK5LPqCsQ5+VFl/H4/FycvwD2eLOXUdy3Fxxm2SNeYnnmzj/yF5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db4262c9-5884-4514-bc2f-08deee26bd27
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|14060799003|1800799024|35042699022|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4FWFccW0ixXKEqHprt3/BKHW0QECk8RL9Glrwb6TwWkkpbNlZyHzO38qqmokymA3RpDcR9bJJn4P0y/t1CgH1ohFfVVaDroy4xHeGIz20w2DoCHEyl7A5IozN6xo63+E0FPTCXLwdHTBh/boLdCuhWLRKuljNdC4faQO7qWljW5LeFzznTQSRlNN9WPvqEiG/50rRmSGkvxyRi7ouBz5uQOzWNa/RJVbe20baJ1Uf5GeRtI7EiaOmvA6ayxeH9UjtdhHtzIZr0O59FgPGTGw4lHz9sRBZXzl2nQ0c2k8cTP2BWhN6+hA8jj7xM/soQhh+U612s7SstAPn0d5FhGQx1mUy+njZJifzibWuHd20aNnvv//uwfYu101XQ5kbg7FJPZNSIWrRIKaq599fyqVcenUX469a03Am+Klg4XVqTViImqJWP4/pcY4n+t5RDy7x+NAt+mpW49pAxhtJJzakF7R/YQGuptCkb8suEf6fnyQDQMacgaRtjdfiOGT7FVLBoy7pb8rHsiLeMjDlTNwOJdtH7vx3xaSHXXd5hVua+F0g4BymyrUNZzCDlFNOWegbViriIFUFYY25rxtdAfKKoHVyXnW6He2bjWaltit8Ox9ynvxTwq+JxTGH1Cd+4LeU2lJhG/95SFsnnqdIgUgL34nd794DZoBIS9CxMoEjO5w0AS00ji0TRSlL6akIbOK8OSjFxJdHVpVFHSdP7rOEw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(14060799003)(1800799024)(35042699022)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5sjUf8mbtboiG2fpB+R4eOh+k95EG041MYC9jnHiev5vWuaYB+Xr6XBDOB01sngLCol2JGKqWPUAOK7rO2kQSLY54HbK5OQE56AHHQU8YaBO/URmmmioFHEcbRQAScryvD2kq6uyT6z/R1uBw750mGvMpxXi1MagxKfPeDFT/SHdzYL8W46SLrL5TZFTWDkxIZUqQSXBTVgWqQXqWLmLT4bhrOa0wKLqa8m1W5JWHxbIJc21l5VhXEyTr5ODQcVhZwWkJEB4sCBWmQMccMUVVxDvO36ov1TPzYX74ohA0EVJIwYQ9PlU9Py9xrcTmKPSndwXis76k2FFYpKP0acZBaYRtdLVSbbUQ4JnEzydCtJ7pcnGXH0kiGjG3ZNBV3YWViP/anWUb44I3rY96UxxJDdv8GLbiFbwl4ZyT2Ji5eQMYtu/LriiuuSZvOCsiF5K
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:38:59.1125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1eda098-e30e-4c48-2917-08deee26c3ab
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10311

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
 arch/arm64/boot/dts/renesas/Makefile                     | 11 +++++++++++
 .../boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dts   | 16 ++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index e2af196e18bf..5242eff76ef5 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -189,6 +189,17 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 r9a07g044l2-smarc-cru-csi-ov5645-dtbs := r9a07g044l2-smarc.dtb r9a07g044l2-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtb
 
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot.dtb
+r9a07g054l2-hummingboard-iiot-emmc-dtbs := r9a07g054l2-hummingboard-iiot.dtb rzg2l-sr-som-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-hummingboard-iiot-emmc.dtb
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

