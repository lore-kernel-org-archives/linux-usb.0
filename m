Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021106.outbound.protection.outlook.com [40.107.130.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895583FBB5A;
	Thu, 30 Jul 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.106
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407942; cv=fail; b=QjnsX1j9Y4bTBZAjUKPHRqtjwoTIxqhonVb673ywbI1mopbm6qyC+TvBoWfVDzlb0k22Ul6P62f696rbQWsjQfLH0sZdJRTVsRZF3EOCaTjxaLIBe81Mg286CGtBbi/q8+zvfuW1QAsaa1o//2uSiYOkrv/MzrU9O3W/r0vRdy8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407942; c=relaxed/simple;
	bh=QMIWoFumOupHdgVbXnT9oiBXILLhp1asQxJNXCWu7Nc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dy9ekJkiB3/hwylr9o3SDwNisjJZobBqcfExQImGXXd0hznt5gt4vWbXa2a/WUE+uGN8pzQzrJNMkIosyvHnb8eJi6qr3OdZRkyAAaoy/wyk1e5DLoSf+x17p1ash6Cta6/BXfTkgF/hR3iohcEzMoCzP/RED6HQVPw+ryTt6dM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=OGMrjbBz; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=OGMrjbBz; arc=fail smtp.client-ip=40.107.130.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="OGMrjbBz";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="OGMrjbBz"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oCc3BO50fCssQCu9aImHeaVNFON9R3mUUG+RMbvbW3TDq1YDmHfKQdpxh+JAiq9K3Z7uXy3iGvtoTPP0iOxMoZijoOBbp0xh/mB2dKE8EjBkwU7v9DyXKFbtw86/3nLwkWSbvFTKLWToNV8HRI2yD5EqExL+TcYM4SSt4yO1Z2eHK25blBusJvXaEPtUJ4ozA4uJQ5tkEmP+YEEXSpbVuBm6BcCjrUN2J0cTwKNm2XhrAAOqwXcR8zhTilbG6PVSNkaK8Yh570tiSO3q6WYA47XLNH4KpQO8/AHfPxXFi6yln1i0oUhCLs17MqKsCxbHVYVbjlJAr5N7xWZTJIr8Yw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws3gksKifCvBOKaEKZcHIfHl2zQwt57pZkCOD8sWPHg=;
 b=WSJN8OGZHotUFDXOHNRpdQkF4NlpAPDbJ+btfVRnpDJIlWdfheKOD79zdBfinbM/pKIpU4uvCAXQULcDn9RyZ9gfY64YTA68solwGg5dkdBz/pjDQ7MC/tW17gPG1bBYuyQxNZ74Y0Au/ydkZGPeDlf/6wTiMILy5qPAx/fyU5hutrYda59FSVLtOLg/H9mP+H7nkQH+p5gFShKiquf38iPIXZfk1XfE8jyrLyrX2enKm27yLU2f8xj5D0zfTJ90JIWS3n3Z5YIfMf2/rb5MjH0AlZEwGz8usgDzRbz9a2YEwbU6ItCEtq7ihLHW1+IgYQu28F8y2qXhCycr4pn0hQ==
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
 bh=Ws3gksKifCvBOKaEKZcHIfHl2zQwt57pZkCOD8sWPHg=;
 b=OGMrjbBzKS/unLJHnEmBz0BEtq6UGV5fci8s8lN0bDlX6sra74gHt2J0FPC/V1EltWBmuvNT0pFOa851Nyxd6lTidFmeOmByYBhthZgpKTuLwlOhrpowgsORDu7LDBPuJ5mr8fueVzhYR1FPc34R4Yavfx9rZh0ns3ngOBg2zGZPZbHxNWH8DbczRtRTKrXb4IKgzv+aP5CkZrAy960Ct7c0VqqOQN3sgkabLZpTZpHh05vYVSKQ43X4f3rqVYE2/8SHJuA8GbOQXtbKozPObvpn2aovmuAPWQZdieAipEkVco8BjJmcuOd9GYhnJxTXG07wYywjV+OxOkyF92rblg==
Received: from AM0P190CA0027.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::37)
 by AS8PR04MB8433.eurprd04.prod.outlook.com (2603:10a6:20b:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 10:38:55 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::7e) by AM0P190CA0027.outlook.office365.com
 (2603:10a6:208:190::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Thu,
 30 Jul 2026 10:38:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 30 Jul 2026 10:38:54 +0000
Received: from emails-9623763-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-206.eu-west-1.compute.internal [10.20.6.206])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 8D53E8123B;
	Thu, 30 Jul 2026 10:38:54 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Jul 30 10:38:48 2026
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1785407934;
 b=Ho4eizbGrXxwf7zS0CsvoecEOUYmY26FKTTLzPmpvj3DzhuZtuM4vtm+HFZ0JJicwquEV
 g1epP63sXjhMPZqZBW50DakJKQd9c2P49MPWElwR5znEomWWWbanuuL26S+RRN0f/KKVoVL
 oGvsbKnC++rRKGVSUS6Pbr/he7W5VB4=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1785407934; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Ws3gksKifCvBOKaEKZcHIfHl2zQwt57pZkCOD8sWPHg=;
 b=Eq+C5sg380sPcVwdnlscz17RNs3KUNLEltkIZXYYdZeEu+C0AEcMMzxcPF4jQLYxvm+2T
 bY86i4Yj8p5XCseqUZ+P+/JP/XKC0A5C7iZgCY63LVf1UtI3Md5IH9F78tNtQfnD2AOp77g
 Rwe7TvaFfxNTqz4j1JYX6ufQDU+rUe8=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ws3gksKifCvBOKaEKZcHIfHl2zQwt57pZkCOD8sWPHg=;
 b=OGMrjbBzKS/unLJHnEmBz0BEtq6UGV5fci8s8lN0bDlX6sra74gHt2J0FPC/V1EltWBmuvNT0pFOa851Nyxd6lTidFmeOmByYBhthZgpKTuLwlOhrpowgsORDu7LDBPuJ5mr8fueVzhYR1FPc34R4Yavfx9rZh0ns3ngOBg2zGZPZbHxNWH8DbczRtRTKrXb4IKgzv+aP5CkZrAy960Ct7c0VqqOQN3sgkabLZpTZpHh05vYVSKQ43X4f3rqVYE2/8SHJuA8GbOQXtbKozPObvpn2aovmuAPWQZdieAipEkVco8BjJmcuOd9GYhnJxTXG07wYywjV+OxOkyF92rblg==
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com (2603:10a6:102:20c::24)
 by PAXPR04MB8974.eurprd04.prod.outlook.com (2603:10a6:102:20d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 10:38:45 +0000
Received: from PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f]) by PAXPR04MB8813.eurprd04.prod.outlook.com
 ([fe80::4c11:9f48:de3e:a67f%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:38:45 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 30 Jul 2026 13:38:33 +0300
Subject: [PATCH v4 2/5] dt-bindings: usb: cypress,hx3: make peer-hub
 property optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-rzg2-sr-boards-v4-2-08bc459578dc@solid-run.com>
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
	PAXPR04MB8813:EE_|PAXPR04MB8974:EE_|AMS0EPF000001A5:EE_|AS8PR04MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: f410f575-d5e1-422b-0ebb-08deee26c120
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|23010399003|1800799024|366016|38350700014|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 0x7RKj7BPyzQ8VaTjKC+9gI8eP35DWuJrwUrevJj0Ee0RlCKbrq5HEjQ8b4fVPRlMfBpO5hCEmCxnZDbWdt1pwvb2XefNeTF7KKya4IK9Jq07S0vEKkF9lQxclIn/L2uQjIz1vLhSrKylZwuiO1ngOBh1giO55RxOC3G6XdFFjbaNRiu9AZSzG1uh5B0JIktefO1JMY7cg8WaNIqvsfh2mk/pc3X6v6tsaU5/zOtww9zNz3QJcccuql2UOfiikbMZV9zOI/tj6FBmwV9V/9zhl6hIuPLiaDUrMCRTZO0Ey8FmkxqnA+aPSfGyjEG49Va5/tWa5wHV9djaprXUu5mOLBQGPWnvZBQtgrzyq5Os0G2uPI9OFS0MIJ/nqixO510ZVeJM3O4kP5W6n0JnsDL4xm6O757KM0jCO5VXSfUcZoiw5t51HHcJ0alYgJZ4FdGV1k2wvydbMunfiJLf47EglPRPkFOYA2RSYsZ5zndx+/1FQcKDoLFW2v7+OMQ34y5HZePCYUOCt0G+Muf12sMD42n5itl+ZTFCyz9wVIAbwyGwEWESqAgWEtT3gXHuzzfDxxro0n/BFtcC1HiiScD77yMpmR6wQwtbHb+AfCPz7MZgCGzuocW7RgoNMFwBJdf/oba+3jYaf8oEePFIK193Y4Ap2kt07d4jEsakYJbRcH5RDN3xnCgQ73kicsxeX/yHRxe4DOwtpcEsziTdv4jwtbotpeNhbPvB7+QFx3ddS8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8813.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(23010399003)(1800799024)(366016)(38350700014)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 D7bxL575/n/+ynFHtfBisV7wCsX7x+l+k0gwU6m4GnC2Eet3vPg+5MeaBrkz+KjoRsgBCPZYR7R6YUJ+Oh2h3269h8e4MZ+AyzAUYnFEDQhs5QAexDj81uLJs6Nf3KDWtchtti0Ko8sCdwc3Y2Sm4aldDCGqmGAXuPNOW3Mossu6p1oHiE1Lr73xZksZAnd5mUPp01mt5CboZZn1N2Iy17reKh5zG5c8Y44k8EO+fWylBQqNtQWb42X2bB9kDx+GkEsEvzX5KidAOmdrFyQmOyI5ZY0TDbM/POc5uv4sr3Z4V0ZaxeT4n+4+zDHCZB/fQs8YUxVBw76vsHu/iNh8Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8974
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 5c74a0c0bc514ea7811691f89dbdd9eb:solidrun,office365_emails,sent,inline:185e14fe6a660963052cdc6c626bc657
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9pxzBEhHc87w7l04MTeJXt7HsJoQkpZU/XuXarg8FyZ1JjyAvs2IpXxDPzd8DyEPfDZ/iaR4c/Pptk8W4yo5y8Uoh89ee4HaXBQqix7Oi5/BSiNV3m5tp9F7JFEf30A8g55NWcjlMHmYhVihi3ZqWx5hug9hO6ZLz9Ebk3pwvQNjBCk8Nhh7iWYP/g+HG8E7VO2RYOmSzEFL7MzKbXL5WrOJO6Wh6tsWR7+dn1N03yAvolxw1P9qifn0R9RPJBba3fhfLcMe1zoJNBLrARW4fQHvdCiXbO93CBHFvc9epopWgHaWLzmoHrjB+51vMUH7Fq23OmBomuWQmt9YF6T3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ws3gksKifCvBOKaEKZcHIfHl2zQwt57pZkCOD8sWPHg=;
 b=CQ9DlTVnKJspUwLSCSVzCJAjPtT6AbVjuvp3XjRCfS9se75vEfsB+dqT9yJ1S1lEBFO4w4kaWxQlJIxQawnbkdBBNbY40fjKgWjYiekOb2Te737OmgNJbXbzK99r9tyXE3uQOkVcrdHps1Sn46g2GRRozzMfCagiWpBDCKVbwtYcRuLaG2YKZlCRA00HDs6JrEFffs6P85kZxOWHNTzNcHZ+emGqs8mD+piBZbxZJLkNeJCdbqDvJJVjlmxbgvdTaUcPt/5ppuSMo4hmqh9iY2oQBuNiEBBHavllA7wS9YfyHmrJKgJuYplHDSG+RSXNH8TUCO/DR4p1qcT+8IeZxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59000a9c-3c96-4553-d7b4-08deee26bb74
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|14060799003|1800799024|35042699022|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wSHYrIAc9RnwVFmxO+olj2Fxq+qQAmkbRIC3qdAE+LJtvFEh+JHF6f49TPLhcghWgZbTQouiAvUNjaoYbn5uFtXZOjNep0lVs2XOT3WoPfCgeqq7Tp0Cdh86fWT7D2x3qsmskS1U79w2et+XpeHNyYXenJyMZLAfjwkWKc0w+YgTOzsahg5sBqcdPCwfPHmN5OkIWd6WgKpk/pqrT6l03NXp6JCqISbLPCI6AtWBvPXJnaI0zq5LVwcAQAnHsuuHwGdKE+yabh1hoRyPycOILb24SoNUABXRIv6bc0p0J6rE9aXRft9jth+EjheZiphXqplFYW4X14U09nmqixFwRtin01MUnA5nhVgssdG8Q7Nt7rP2oCRGVQKUZkN3XFeo/tiy98rKD6qA9or1UhkU4xCegl9GKh6kRMNtlBVz/3T6SJBZYNKmGVPGz7AdsKGYnF3OJTWCo7LgA0h0IW3Jc8YC4FrG1ASWg9ix5LD/d4vkwcchSS6Mb/Fh3hP29eU+TKWytvZOmnY7Vlc9QVR2wmgeAxNoRZlAzu6BJR+kbxhkKabagkofIta5kbGQKqY6GgKTulyZrsdfQ0M8RaWX/do0yny6gw5Z/KjoID33fShAuVMlBflPG2DQTkqO+0UvYcRM2vQwdtgxMLQoSjXl5kP1tWQi9nYUdtuT+Rr4+7Gsu7mLUKdlXxxF4l7l9FgsZmbSpQCMOP/OSkVFgVvALw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(14060799003)(1800799024)(35042699022)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6e6yXPfnMZixyVTyi0D+oPy1XWwSyV9h7Zu+2gUyFv9e4sne5YzElzdcESXLmOw1rXzyvat3zTGzpOuKwn/c1jcQz7YpNOVUgx4P9G8UifH5/PhtMMdBmHm0+uthtvjqAw8/84RzuUitMzVTPgHJusfoPnFTURPeh5nfEucn6lLD3V81tvqi9MB9XhBs34FDLpnyH0OeXCzVYSWi+7zR1AB+AUFY/K9eDaTRZDGD64mZyuzGjCoRKMQvnzZoKb7qj8VKLZ+86zJHuKzA+8Rh7NzOseQWN4ZlNgQDnPzI0SeHk0GuOTw+MLNnX3WI9Vj47+4F8/H2xY4Q+gi8IN9eCH83wlaYMLiXfQzROazRNTcrmjuLQmnCVmUqrFP3gMHAikgcs8AgX0LJp9qEmWi/sQuMLF/sMWLoxPbFTBzCYq2mDliEuoabsDEGi/6KlaIz
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:38:54.8452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f410f575-d5e1-422b-0ebb-08deee26c120
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8433

Cypress HX3 Hubs are combined USB-2.0 and USB-3.0 devices, and should be
described by one node per speed and linked by peer-hub property.

It is however possible to install this Hub to a USB-2.0-only host, in
which case the USB-3.0 peer has no place in device-tree.

Remove peer-hub from required properties.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index d6eac1213228..aca2fe796240 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -53,7 +53,6 @@ properties:
 required:
   - compatible
   - reg
-  - peer-hub
   - vdd-supply
   - vdd2-supply
 

-- 
2.43.0

