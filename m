Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020084.outbound.protection.outlook.com [52.101.69.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B43BC696;
	Sun,  9 Aug 2026 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.84
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786266311; cv=fail; b=b/hnURK5JWnB2OYKzZvk1qM09FE2qQDHwqkLdMjY6aKFmyoCItyZy9muwGlMr2dNjo8cVMNMHiDZ0MtKcFgl06gk8oInypP21VpjsB8FHnWlHUTBpierS8nLXkTkLne2Yn2bx9OkElfymsIBK9+75mEZEQkkFkEDTHL+kS6fY24=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786266311; c=relaxed/simple;
	bh=0N7tjC6qDuGgFmAsnjdO+uTA1BywnTzbgJOzS+N9dtE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jKwIm3HhomXbwtVMfZGjlysBUxGOhNwk0Zwy8KZvC79bNxTNdWx5qxz5V9uTwpLJiVKhdnOgaEpbbYMj9zxR4H/RKMN8ocSlZGDUr8JLEUFu3457bsnAG7Uy3ZCieNMj47vQjfp/iI7HztBX8TlsnHsxDdmhHwAZRSrAxLrCEdg=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=az1TKEyw; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=az1TKEyw; arc=fail smtp.client-ip=52.101.69.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="az1TKEyw";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="az1TKEyw"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MS/IRSPoql5AEo07BaWXDGD+qz8GYHdOyGCk9Zc4a5iZO5MEmXwu3Vk+9MrnF04LNZjpMxM7MYdnS0uKs5wVof0NV+DBqovnngC4QjMWv9J6lJOiioa9w2/ZOxPI/d5JrrsQFXD/KNQ8MidZCAFWGh0t+tems2lt9M6xDpLomQYjhNBGv2I6M2LMbfiFprxg/4VlvCh+rijcFqoTdjjwJ3w6YLP1y/FgJ6VgpulqL5bzK8NqcZaJiNPAYv5pmZjDCG2rBUxRNDWKhoWvlluRAkRQtuG/dxDJQw0QmG8dNpvUabYDuz30QEsmP6hawO4q2AxJZpy3DNJbFYBUkOotMA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er8MfJaROIq/Ei3VRj9WdZ3KphU3IDum4UsOnndo+do=;
 b=dAB59gg9as1UvVul0UYe6RtXpM/xr6PyQsPtHeShblXUbzC/V5TRRe1Arpf9+FQovSFGTO5Pw+L/WpkFepzeqkMdyfCotTeTrtaQQ9an99no3ZjJMWck8l9hjPWi/soCCwwIGXAgdVo7WOUt/Nn7cj94lUxsNAebf/4MjXZuaMkrgjUt3GfguO9uRKjgsL9xt/AJy7Bj6g/r41V6rGbgEwuRETXWdYRmh7yJSD8ZK7vYznNdWmI6/mPl3YBVX89e5rOw1D5HaoGA9qvntGhWJroFiQEOH+FglWUx2tvGGgIr05OCPZktojd0OHJm0aLihH9W6YT9dUE25xTNHH/Drg==
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
 bh=Er8MfJaROIq/Ei3VRj9WdZ3KphU3IDum4UsOnndo+do=;
 b=az1TKEywIdYTprjU43YRBM4+rdMnpmdD3OzHn7CSb8V9KbRi/zr078dLrTtJ4l3rHWqHhEnvm4+0ddnP92/kajTxEwEuFCTR6MhJeDvrJzjrXAdTaO5n5URxU90JHZVWHxlDNs0HuTmFsvjINtJjP9kwj0SGw3zU5YhM6WX9fFB5CvXwy6uT6RRRAyDqkNEzXrLwszEH0oQySamOGuJnaapRJ1oz8fk8BFxRxY3PoiTy10TAgdpShoFXLagOholrEkmWM+noyvvfhTiEB29hfbjcajXWKtktb8AKPxxBIaOxIBlX3k8/vVuZ6KGCWiCD2kL5Rlyimv2CfAzntNKndg==
Received: from AS4P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::18)
 by AM7PR04MB7110.eurprd04.prod.outlook.com (2603:10a6:20b:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:57 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::21) by AS4P191CA0003.outlook.office365.com
 (2603:10a6:20b:5d5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Sun, 9
 Aug 2026 09:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Sun, 9 Aug 2026 09:04:57 +0000
Received: from emails-7143450-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-511-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 317937E8F3;
	Sun,  9 Aug 2026 09:04:57 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun Aug  9 09:04:48 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1786266297;
 b=Qo23ybgug0tQxr1swleVgl+9yZoSnXM1iDDPWQdUmiC+5Kwl3MzFViKvuJbuCy82CbO3i
 lyDL5JDheaEycON/6jhMrTRR9Pe69w4cxfx01pfobU9Jb593rSDe8gK7cmuRTER5H3WSuAe
 gu9woWnn8NwYGD5XppPlDOvzKo+t6wI=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1786266297; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Er8MfJaROIq/Ei3VRj9WdZ3KphU3IDum4UsOnndo+do=;
 b=HBpB9uapoGtQfCf3OA4Jy4yMbsHyalAapkYkgB3n8TmvZfJNzbi+x7I1f86cIDhxgDqcY
 c5+LqDOwcMLPYccs7/PRNL1Ct8gZ26Sn8l57yO6NFrLTPdbr9k0hF6t4VUhbxrSLfTzRuaL
 e9mX23pQFwsLEUdAS0yIm/VWSauSRE0=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Er8MfJaROIq/Ei3VRj9WdZ3KphU3IDum4UsOnndo+do=;
 b=az1TKEywIdYTprjU43YRBM4+rdMnpmdD3OzHn7CSb8V9KbRi/zr078dLrTtJ4l3rHWqHhEnvm4+0ddnP92/kajTxEwEuFCTR6MhJeDvrJzjrXAdTaO5n5URxU90JHZVWHxlDNs0HuTmFsvjINtJjP9kwj0SGw3zU5YhM6WX9fFB5CvXwy6uT6RRRAyDqkNEzXrLwszEH0oQySamOGuJnaapRJ1oz8fk8BFxRxY3PoiTy10TAgdpShoFXLagOholrEkmWM+noyvvfhTiEB29hfbjcajXWKtktb8AKPxxBIaOxIBlX3k8/vVuZ6KGCWiCD2kL5Rlyimv2CfAzntNKndg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com (2603:10a6:208:132::21)
 by MRWPR04MB12072.eurprd04.prod.outlook.com (2603:10a6:501:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 09:04:43 +0000
Received: from AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97]) by AM0PR04MB5796.eurprd04.prod.outlook.com
 ([fe80::f8aa:4e29:bb34:5b97%3]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 09:04:43 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 09 Aug 2026 12:04:26 +0300
Subject: [PATCH v5 5/5] arm64: dts: renesas: add support for solidrun
 rzg2lc som and hb-iiot evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-rzg2-sr-boards-v5-5-19c662358e36@solid-run.com>
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
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
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
	AM0PR04MB5796:EE_|MRWPR04MB12072:EE_|AMS0EPF0000019B:EE_|AM7PR04MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 962a82ef-2444-4caa-5b5b-08def5f5490e
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|23010399003|376014|22082099003|18002099003|38350700014|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 OS8La05mgtCJ5BZ6fSRd7NHcWqgrKwlr6rcn2mUH5p1FU0YMFShNXlqBfEIIWfwE6dnrBWt8ClqTyMN7cVxduX8U+fzMpUPNfmAKH6QnIYmgUoYotYNtil0bvgLGr6dxwnL9xZV9pJPGRA/eYp20etwU/8yHxW4kNqSeU5495E6hNVIa8X+11MpSe9GoUMf19WXIgcg/053cf92+GsW4r5V3OPpmXEPgST88g/00bmGyzTcvbFxUZvK/XNjIYnR4rjyZWa7b6mao9lrkwBv8Emzs/oa+NspPPy1omTF5bVWjmTBQ9+rihCZvWHStarNjvOEK8MqvoXeSIw+UODRquhgC2q0+ta+Jo2XsVtVYw6fYP5YLwd7zLynNEh3+lhYCvrCcrYHl+KKyzsNj9FAUVKCZhNgUxlJLIYbltvostyEud60jX3m54v2ZICmkPSFzSSTV953BYZSVtJYpzAsKqU4gjd8n2/eGLovWcKcToTmv57HS8uNv8kpSIjkWtpPJjsiapiYBiSFhuEM2g7iWwkFGb6k1qDWMbftRzNO+6wYGUojDqLDKFHOrILxaoEQ913Viygm7mq3uS8YEYQFeSsw9sz1GFuZmGN6CAkmvdQxS49R2m9AQ8tgMD3LE3l/d3RN5INgNXPfcdkKO4m/fb3XALgeh80rmiJ/0DcOT28J2o13//4tl4v6GQYXikbtAm0y5lTbKCar/gQir8OM/dZ/A185lYjxe5/bkrM1a9JA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5796.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(23010399003)(376014)(22082099003)(18002099003)(38350700014)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 g/8QfDbDLzeWcEU/7J/0P62oJkBNC54Hk3e3gpj/vXlOpkNwJ8BjmYgOM8W/pn+3+Cz6aZdCBxPhR1iac8jmbM4dSd1hu/05kiupgAujouiK+OUV5bRiHGIzQbJO2N9hs6Lpxckzkwa2QTTcxM1g7rg8QLzWnRX/kzhItjuMqanilX6aEZpTKN1uxQK2Pj15np55Tb4TdfY0XHsLCz55jrbbt3dLiP+vu6OGApw1mGdh/bxs9UIHeIchhv8KjBRNn39VPXNHHGdw1mUBIgO/Tw4jIZqDZDZoYhMML+0jtxf7EYyukwADSuk6hWBW1g2vMyD74EJNrt1qxYI2ht4N3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12072
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: da9cf65eb82b485187d2c569cd5ae007:solidrun,office365_emails,sent,inline:47401ce07148f66409882c1c73d510ac
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/gJgXzbd0Q7lvrsBI6NSlb8Iy8Epq95AxEU/xHfwnRAt6B+3KIve803P4eNzzpTlLzsGzHwV8P364CJq72OFhaQPz2yubyYOAMVQMzWQooOazWVMvbHI37U7Gh51qdpwU6Tz1fZsqj4SvbKlxiBqP5EHyxIA2mWkhZyIJBYkFC/vBk8BKgW1CxsG8DmYEl6ulgzJhxa4UzARA9oo8gs+1CLU7DWcdJ+rCCW+us7szM74DmBDBa4rhHE5CI7W0QpjmQal9V/lfqXQdwn9JC1DCwhQtjzbvj09KhUSYnesK3+rAuGFFGBBfg6jd85N6atjIGQpSnZKJBW+W5QW8bgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er8MfJaROIq/Ei3VRj9WdZ3KphU3IDum4UsOnndo+do=;
 b=DtQK8WEj+Fb+XZZvKe70wPUZdGkZAqgtgYvmQI2yr657E3Nh+PdHPKgUDAzseB2sKO0cYgiaoZpn0YeEC/qMZY+eKhoqbh/ojb7PAOVpDVm5SDBVFqlN78hZrTS01HPUBrMRoNlLfoBhledgw3zvOH7ANeZkIOiVJ/j2zHwyBD10gbQEvy1W30NV47Y6Pb8W+/arQiw/7ZZEf57JO+XC1YVScwtBU+N49CSlVkHIePSleAIsIEJIMDxe8/stdO0Yl8u1RQqP9U1Rxbu/ZvfKXGK8JeHLqjySYFvdjO83yLgebLyB+rNhNGsUHZi8m43imK6rREp0PVh4GRO5MxYGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7bbac126-a27f-491e-9d35-08def5f540ae
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|23010399003|82310400026|14060799003|35042699022|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/5K7uOnurQhrlq8QqLadOYLyYABVC5Mz1jmo1xK7XtV6GindUdzNQYdIlIldl2RcqLvPg5AvOHAioSrWM27L7QjJleMZTR0iYNm06ZlrLiJzPPlYsU+p9uHwdCQS6W8eDj+he3yaqoyJXBJy31VRnuOhiaZgX/2yhaowcbBquAXq4tGAY2qgrF9qTk15fnXxrQR4o46yR1agQbhdVLmTP/p2NSLKDo5z4DjMRicXyGcPNMvewG/AiH9fvBFTvtGWwKQ0m1yjg/JAdf40u7ezytOqJ9grCilE7DQBYA+7a2ot8DuovJ7IwOrlWIrIJCgpDEdMs/imVMtB5ISe4DE/tEobfOIVXjx+hZMfFRaxDyf/l+ioMmydMW93Pojfer6Pz98dBArdoYBXJS0tY70ClWcR4RDG9zZOXJeSBDe2D3lhE9oHjglJUQ0UWa6EF6tP/4/o7V5c57uRHzoF+3DF3Mlz5D6LzXIue2tGNrj3ix8hqpDMIDM8fcgYLuU+aTl60fY4NAoNByE6nF8IZZgWqAhJEie0xPveL2RVV4woOwclKHKkrV3wdRIzGxd8gY8jVnbqz5V/xaFEJj04o3NRNcHL6GsWqXa3tfrxTbJnzXSBVO9c2HpPxPBC1bOUTOVIky5T+peBbdpMjkpbXYWX/KSiFKfWsu2FXK+P8yBWolyFJP+zQaaz6E11YW/yCPj0oj3WQbPg4DvxBme6c1L9WQ==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(14060799003)(35042699022)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j9wV6cwEiCzeXp3IwrlNrdGbbhKjACwFd7z1oSeTyDpm0pYABdJapcfEhi+ca5q88kgaJpPOJWei6NhNF1YwZgFHwxO2gXJG8igJCOEirFobc04ack8ApAl4OWNF9UZYl5Rsy6WLXRKbjT1eA8JHIXw2lKKr7fGCZWsB5bnZrGEAXoeXdmTWRXJbPim2zJQ7WSwctOq+AzkN0bG7k66MkrYcooAsDgN1WVgwguhqcDOCHabpQaD773IQcb9EAi8pI9mwqQKZnH/IBgiQ5Tc/orIwMCdFambG6ZvPLf6/cN7v+9LkISda9oSYvpRRpyfs5Rs+BdtFq5K1ToMrySqB1G+dzTdstvCGkDW6sRj7rkU4S06aUpj0wl/yrijd1xQEK6x3hwCsg5PYCqKvSA2XwGlDEvYvunfK5LKV7jxDzITdruo/V5Yixwfpt422wkIG
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 09:04:57.3960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 962a82ef-2444-4caa-5b5b-08def5f5490e
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7110

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
 .../dts/renesas/r9a07g044c2-hummingboard-iiot.dts  |  20 +
 arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi     | 414 +++++++++++++++++++++
 3 files changed, 443 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 4a0cde8cc3b7..69b1f7515601 100644
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
index 000000000000..d98d544a0fdc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-sr-som.dtsi
@@ -0,0 +1,414 @@
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
+		 * High = connector, Low = eMMC.
+		 * Define active-high for logical mux state 0 = eMMC, 1 = connector.
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
+	sdhi0_4bit_pins: sdhi0-4bit {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <3300>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * Configure as input without pull to avoid overvoltage,
+		 * and accidental use e.g. as gpio (default pin-function).
+		 */
+		sd0_dat47 {
+			bias-disable;
+			input-enable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+			power-source = <3300>;
+		};
+	};
+
+	sdhi0_4bit_uhs_pins: sdhi0-4bit-uhs {
+		sd0_ctrl_dat03 {
+			pins = "SD0_DATA0", "SD0_DATA1", "SD0_DATA2", "SD0_DATA3",
+			       "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7",
+			       "SD0_CLK", "SD0_CMD";
+			power-source = <1800>;
+		};
+
+		/*
+		 * Pins 4-7 are hard-wired to eMMC with 1.8V IO voltage,
+		 * with all pins sharing a single voltage domain.
+		 *
+		 * Configure as input without pull to avoid accidental use,
+		 * e.g. as gpio (default pin-function).
+		 */
+		sd0_dat47 {
+			bias-disable;
+			input-enable;
+			pins = "SD0_DATA4", "SD0_DATA5", "SD0_DATA6", "SD0_DATA7";
+			power-source = <1800>;
+		};
+	};
+
+	sdhi0_8bit_uhs_pins: sdhi0-8bit-uhs {
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

