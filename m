Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013066.outbound.protection.outlook.com [40.107.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFB5356764;
	Fri, 31 Jul 2026 03:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470144; cv=fail; b=BRhpsKitUZX6JaGh4wO7JSavaBtkb2Bf06IZxvbpvVaubVrv90Ykd/VixSSBDK5q6DwXkdbFgz7IduAHhjeUOfggXrUS4+hTJguVO9Of4ZnwID+WPXXmJV3floTW/sdA8LOzC1ZbqCjEr3S/ADe27BnKMB4QTDW9TgVxBC1anZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470144; c=relaxed/simple;
	bh=APQnP83WpFEfZN4V5LH3SNymtFjlj+CqGMQ/B3OOYm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JDS+J04PUmJBpSd7ctEBn6jgTbQbLuPVbLBQtii6hddt5dD4ysV2m/Wu8CPPrERkrzkL2DwCm82Enm2vYBbf/2f7vs52S+CmfI+Qef0n9tb4xOXxPZVdKK3Rx0VteN508hTX6fN9yVR3aBJEueQN4P2iPYhfl6IeAcGKnUyiI+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=T0H3qNW5; arc=fail smtp.client-ip=40.107.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="T0H3qNW5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl1sJFG3iWgZS8ggmwAA/iR9s7iJ9QpYeWRR8ugdN53Iihra+U51R5nylR5CGXLYk57nw3cbiByXZTgDABkudIStF9FeU0L7tj4+KJpOQC1UHjAB6EwFKQkAf4Rf++8xKQ1e/nH79l5vb0PMaeYfMZy9c9C/L7y/uQDKIqhUhptzbM6WI3briVodFBh7vN+t8HYWRkFbpCNbK59RLqeC2nQF8Hhlb8s5RH3AEym3/gLGefivDLrRCzTr8LCRpyeYRBpRnHywh8/2NVx6QXN6tqZ7RxL8yRAiKRYCJS3kwOWum4xOmA1WeMhldEp/Bk4htqrloPVnnemLYdtusi/c7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOwLUcjuVFgZaBa53RUgGqTrmIw/HhrhgEeAFN0+pXo=;
 b=kMB6v1/R2dU28MxVk1R8lR+l8z75ZdoGmz+NJGrAF7j1RrjMr5BiiCiQmZ98PA5H4j5UrbnoITbdA+Tf9o6vH7XRu2jQzhMfIYQ4/fwYX68DDUw5IlNeVbNbgV6iLhyVIpJnanOlfiV0c8KG7DmwoGYkv3Sl7ZVIDqi1im+GuCxEWl0UkLYB9Acml0pWvCA4eUf1LRJ2FzdJ6heJ6swNeSFQpI8m89I+5+YBAaQAAJZPxQ3KYEHkpiLJz5PL/53RgEKAJnr9yMF0xC+yXZvy6Qt4JBXKo7eYXSsXw11b0NJ9pW9GBOlQC49sl3v2+4yi87xrD1txEcg3vz3cFSn4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOwLUcjuVFgZaBa53RUgGqTrmIw/HhrhgEeAFN0+pXo=;
 b=T0H3qNW5Nuy2FTb/xWXLe7UObQDmb3Vc4OqtJuw2peq/JiJidyX0fUlYe1dWHTpmqnFixrnEyeNyy15Z3B4YfMshoDqhG5Hx/lHWF9HHroeUyZ+yCVyLsWzaz7UMnnqMtFZwtKez7Gi+xrlhFkeGE9ap01cydIj8d8qsSHCzknNUe3cVBZRmu+4lWq6VkQJEkz/qpaMZ5lxHoev8YJ168gn1mMRraPYh0e7/eqiZw0bYM55i3EBiVZENf2ZK8c7Sazy+24q5M+OEhXmI7I+9tYFgBNC2WmzP9qqRVCDrOwKPB/2YQNZ8kk9FX/BWTcoz/x+Ofs6PTIF4c29+9M3/eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:31 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:31 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 10/11] usb: renesas_usbhs: Remove redundant dev_err()
Date: Fri, 31 Jul 2026 11:54:44 +0800
Message-Id: <20260731035448.252289-11-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260731035448.252289-1-panchuang@vivo.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:405:379::17) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYNPR06MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd525f4-e0ac-4806-42f3-08deeeb790e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RW0ykHonSh/+JTSUqziOsCFyGRInuk9Gh7m9myOiOpaj5XvNyJSfQKMoeCAsRjAfbCQBZEQJ10kmCmZWUi7xDXLIim0NGdyAJyq+ZxjPbPC2xVX+Fkf2xxV6yY3lIo9h80+cVrgGXbAPEafng5v/4844MYREuM3nFoHuuBzF4EApaTsHqZj0xcNjfj8ZKcAtO3VDF5+jfPvZ5gSdjsVkKNunCXX4a60QGYDS/YOxk1m8ITIQt2nLOw7qjBXWFz3DKcofc+7O7sVcsx2ojOsEFdyV1naO/9H5/RU+tk9/LBtIQYNS+SG8bHYXIfpVrHJEGuRko//gEYei7YbVS0eJ1ueucvxnbwQ+HlQFZ4sZLlpRt3zh2J4x94BnvKE1adxEUApd3h91zIIY5TBI+Y/tBIxRJnT/EfNK/T226XZTOk2mRfgosztj308+VikVGB0Zt7IDiiQcYpMCIjIXyjm+dSfHcTPIhrQbBVgmC3oJxpyzmRQWSN5JYfkLJxcdaqOQirr+EIeCwx/SgPfeLLuBwgVWhvkmZMEIFbt3Dl4VQBe/OxeE5N4WiUbkO2EwzcpwclZfaFM+cB6TcFiVXSYJrBFxe81FgXSFuMDW3xjdyQjixCaRx98071ffSYybsZekiWBSCDaM9cPJqBaQI94O7k5w//dfgJkPT5fmem5lqe6lLl1+wnDSQuzdqMorxxBtCFA/zHRbFrsagevIVqIubs1sfhjDWB87fY3WpBtkY7I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IcY0ZXF/THZZ+H49lXYaJZZoM/7bszGUj3kgUXPReqXsRctmAQ4LGDQUZ7Sv?=
 =?us-ascii?Q?t05Jk/qj7iUN6x+Ed72lv1BuNyZSB0GhXg17TrnOIdKf/metaSki78gGcNp7?=
 =?us-ascii?Q?41jlWseBw8WW2VgdVde0J2yrNPWwyf00BwrSkm3rAfjr60vf9V/096prrpMo?=
 =?us-ascii?Q?TffXuF6KH9vqKddHHeckL+WGkfI7BaTnuqk3WzLvWBFJ9F9EQzD0+Y1XC48G?=
 =?us-ascii?Q?YO7szZXyUUvzdjT9IR/Q4gcq3+IG8SvBAW//R4cK/j0JzA/7QjBBLBAatgao?=
 =?us-ascii?Q?m636Ftf2+Mt5zV2cECSxP+1okTPdVWtEtU2p+HZQxowx5y+GF57KnMvAvr0d?=
 =?us-ascii?Q?35p7ohO6fTFLPE9xYmMeACZDgtiN9MNmiF6wA27BwPIVPHY300dE1C8iq+Ex?=
 =?us-ascii?Q?jFdRNtLtwHGdaMRS01AgoxGpRnN8Gr5U0gGB/uPgFPBe0zg5Y5aP4Dj02Ath?=
 =?us-ascii?Q?fPHPtCDFdlp7aNqPX1HfZNy/OMonM+JA/IDEZ5iLiDnDvOVhXx6gxwrxtRpu?=
 =?us-ascii?Q?p2mNpWnFfHREng1ddStuQurbnJsaklrMOCY/joizqjjYvGARsw1H5Vn8qxKY?=
 =?us-ascii?Q?9c3klu72j1jDs3Qnt8+rONySgga2xN4q+cB06xZBglvn+6ajL5jKgdLS7L8R?=
 =?us-ascii?Q?Sw5MpzSo4ZaxUn8Wl0ER2AhS2FJzG+za3o5DQDsZdVCzKxJTM/oBPmKrEEeZ?=
 =?us-ascii?Q?na41qAcYe0JZlvXNLPHsMvqFksJc9OZj03yFQxl+wDgl743wV2wHJNwJsomw?=
 =?us-ascii?Q?kkENj2F8NwWVZpeNdolozG//Yprj4VOocXpU4gcaIJAYODVDXIPQeYFM5Mh3?=
 =?us-ascii?Q?9WhEfmmXoWHsVv95K8dmPCcXD3sfR4xe9+L6U6hUR6jrzgSnBKEOszXAbo2T?=
 =?us-ascii?Q?Yuu2+1F36PCEYxvqWYqC486WvxKMHsisij5yvtSCGSzSQ8byb0S+Ag8GVJHe?=
 =?us-ascii?Q?wgvfPf6ndiFEWa/wWgn09Faog4/PoWvuXVyDdI0+ZSqalc8P1LfwxxY53ndP?=
 =?us-ascii?Q?GsJhOolUh9MwTDv0Y8tnm3S2YycSXrHuTgvdEWZzebVEJrMFeJas5jNXffYa?=
 =?us-ascii?Q?bc6ZDJXUg9dxrg5z88IcCiyLtHseblPXnaq/6CxzAizPwEqychii53weZDWG?=
 =?us-ascii?Q?8lRTlu+by/Txqx55Mn489nE5djQPaKKkbFbfV213Ssz0vaaTvj7m5oR5CHR6?=
 =?us-ascii?Q?zWPwx4x5gbjtsSe68RmdNzqH5cmVaMsxG7ilU0Y+0nRhRTGu9/BCyqHLKZUU?=
 =?us-ascii?Q?LvEIb22f/jxWZOdBTbHnBdh864B0Xt6vFZpYMTjBwb05zoojHzwxjihFS0Tb?=
 =?us-ascii?Q?X+tk8m9PS9WwjEJ7W7hXHSmWS+mMCw4ZS9FBJkLtdYeZnh0iuDF58g3iWt++?=
 =?us-ascii?Q?d2sHVZnYA4xDviskIcwee4U9syqo3FPfG30k1oiAoQZUeT+Y74JucQBf+P1H?=
 =?us-ascii?Q?h0pMnCaHMyLaapcqZ9XM1rN4US6E/P4hkhvD5esx6mmekZyWqiX/5P07jjBY?=
 =?us-ascii?Q?nWfJ12OdSQCCiUrvmbJCpq3+0/TlUZC9yNNmBXq0BncRoHupvlG6XKNO6o7h?=
 =?us-ascii?Q?nrvjsOegJBBLeFRvdN+XwyHO4iGaJUhBGlqVSo6nd9YbCYdND8kXyjCrZJEk?=
 =?us-ascii?Q?pchfqZXy6TA9rUxxAR1yZ5vt4T/6CbmxIRqWGItDcDuPs7XGNwGUS0IWATMw?=
 =?us-ascii?Q?wk1APaGFY2+EJUzzz1WcKIVgSCnbRUvBH/trPasGOQ8GCosIxI9xKMFM3gv/?=
 =?us-ascii?Q?26HjauXhmQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd525f4-e0ac-4806-42f3-08deeeb790e0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:31.2046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiibGqkMEboMrMQAWVJAIbEYR4Y/KSHDTEhe6p0Makg/xipcaVCrjWFlMMf6KajDMpzMwCH1MKGZ2r5ZA6vt9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/renesas_usbhs/mod.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/mod.c b/drivers/usb/renesas_usbhs/mod.c
index f2ea3e1412d2..dcaebcc0614d 100644
--- a/drivers/usb/renesas_usbhs/mod.c
+++ b/drivers/usb/renesas_usbhs/mod.c
@@ -143,10 +143,8 @@ int usbhs_mod_probe(struct usbhs_priv *priv)
 	/* irq settings */
 	ret = devm_request_irq(dev, priv->irq, usbhs_interrupt,
 			       0, dev_name(dev), priv);
-	if (ret) {
-		dev_err(dev, "irq request err\n");
+	if (ret)
 		goto mod_init_gadget_err;
-	}
 
 	return ret;
 
-- 
2.34.1

