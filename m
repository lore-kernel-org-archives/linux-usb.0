Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012059.outbound.protection.outlook.com [40.107.75.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205733B8BCC;
	Tue, 28 Jul 2026 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225963; cv=fail; b=BSFp35ospqna5AnKMLm0kMjINUhCT82Mkaa9u/eBCCoN4CVaLv7bSJZ9GdOPSm3rKLUt1vMK2hMZUroBGWCgNPYmLkkvDzeKrATa6ixm/al0Ajl/FtHkqSkpMlNEv/RGtszXMNrjSUqV1Y1ayJ2DQ0b0U1gfIKvRn2q2GSLZ/Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225963; c=relaxed/simple;
	bh=xd+jGhN1pDurt/on2x5SwapjtjQokZjRqmNQuKxVP0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IKP21zPH4QdCnBKa79OOB8hkp66MwCWY7X3Io6g38bUAy1H8cOYaa+Ob2+9jLw5p4yhqJiiIV9usGhzueEZkcRmaWj0+/UDVnhInX0HGnG52h75+rr7idy79S68G7WqgzA+VMMjCoiro93rn15yYVYaSSIpNEPsi9TMqOoNABUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=XwEdCSyR; arc=fail smtp.client-ip=40.107.75.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="XwEdCSyR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n03Zc3mms2Dt06MAwFglGnjqOpTbg1YZBZ/zXCJ//vwaFF3+TKOexCRH2PXfUW1s2QFKfVWAb2PDL0xNZ67YC87R0FomIFvGTmjyNeOREFs8Jhs/0pyEJrkWZQQ9PHWaA0lwLEWIHpycmBGt4qvyTKxOwI83Ty4p2ICFPYKIVAIBzuRhZFtKQkJMEbqdGxs4bChOIuIQ6l3H4DDqUzoEC+TMKUXflDCPAUg1gh4ph/QtGFmUHrU+upvzzi2iWrEWF2mQ8ocV8ALvuGTKN1Z0dY9qHnXCp3vli3WcQc/fhkmfF4BUjTvyJhJdZZRtgSxUeocDME15cUxEJHB14O/pVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SAFP5gexV04YEvVjTctydW6NcnHCsiuxf1tfben2DTI=;
 b=laOHcbmsOIEdU3yrleaelGEA0j8Noxe449xwhF2QVMjwalMFaOW2TvMNKHAP1gUAXTYXyCR5nbqXYDEUbqV8ltG6Ll7YD1z4WYjVH+WfPPsrFr4ugDOj212d4BfaFSNRJFDgFoTtd4g7J6rpbs58r+Z2cpLUIMhsSAQi4ILW9Yzvuvu69RxnUTaLAmN5ErUiXP6a0r2s3I40etRBZNw6MYf1cBXPCgl88DmYUFulJNn3343U08p5Sp7iIie0P+3tAAVlKlcG9maVxi8wTTDxbY8aQGcwF6jN7Ol4jeRtfKoiM8K+L0IFcOvuayAwVqaw5XZWpCV9uoX7veiaJqv9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SAFP5gexV04YEvVjTctydW6NcnHCsiuxf1tfben2DTI=;
 b=XwEdCSyR+45SPqKpHXOCkRWaAd0X/R/J9vntfi0QAoZ6uQT1is9EbK+DUlInxW65OLbQhHNZkq8Hbmb8QEQt/lo1FlmwkmGKzABHLUeIewTQ6UwtjKIi5nkrwCQbiCANf1uD6iMh0Wt9ORF0QOz01pDAMPnEj4uWOA05rS+WF/G0Y/zm2sOf3ipD+A6+JPlgwIfSK2w3iN5nny4BSnowqG5HuYLxfmou4qjCbFx0EIsdJPCqb1Av95gc6sgIdn8dYvo1iahueLJCpp/Lan3TeKur6izcR5swhb8p9URy9SaZUr9AZHEGuaNUY+U96IHnuHfJmMGODBeANb1dHM2Epg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEYPR06MB6661.apcprd06.prod.outlook.com (2603:1096:101:168::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 08:05:59 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 08:05:59 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org (open list:THUNDERBOLT DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH v2] thunderbolt: Remove redundant dev_err_probe()
Date: Tue, 28 Jul 2026 16:05:48 +0800
Message-Id: <20260728080548.389503-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEYPR06MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: bd47cc27-8908-4d16-df5f-08deec7f0f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cSrGo6jTs+r+EjfvX4wSikSgsgiixWqo97G8MGwW6K3Z7zxUHgdGq13uwTX1EApHN7SkuDY0lHSc9gYAPkg5hnwrY1yo6fLq8fPKCzeaB4IporPWYAuoPWs3oCCi24gdy0gQfm6i+XGR0trAzZnGF+YmsvAFgpyh4qS2j7H5HVWXAzv4sk07qS41oKfDv3eDgir1Zpjn7sM+ggFupxVobLDeFRqW0qDoP3wDTX7wfoxZ05a8WeWZ/kMjkIXBl5D9tbUKJbNnP07x0wg6EVqkO6jSv35OimrkRO+3p8b982V9WPUvUvcGKY8bdGlWgaqM35HWuubEL32q9WV6Fwbwkqqvw/Pp10uAzcpRMWhyr5ulC/lZlYYGkbl1IbXA2P12cCfVWmj/Qq1X4olIOhLNfohECxKJ0Ffsv5OI28MJvumVqS/84YLJYmYsrB5dYYk3rVr31Tb3atKWpwqAzjH9boncnKPV+GBCq9uXx/0wmDT3dFogZ5q3I5qfkPFZ7ucmX3YWyhnch9k2WQck58sl5NM2MPKlBskBxfVdRaIJLuIiQ40UsejE21u4j5RY83GbnlAJ+hPCxk8gwOq7ASMjVGH1QmaPeupqc4ccpbJXLpPO5Iht5jGE+CLpPgjyOnStcvhZwjkXwry6MXs9DkwaRJe6zXxbrzzzzVJe9KOy0r1hjw17N7FvxsrgGe3OHfSWGAdAOigxXElrMqZb0s9CUt4Oag7Ip5EBl9ECkH5VaSM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dg/r4QbsymQhi7rALedyWe0z392+wwr7IRa53wiuUo4xrmmGHIcopqVIha9v?=
 =?us-ascii?Q?SSAHB3B2ts8BLlBeyiyEWEYDCrN1PaS91SFdGZaz1TuDrfkBlesNaOe2b6Cq?=
 =?us-ascii?Q?B17Is7c7yM90r8ZjIm6LAFWxQDlPAlSBSStWH9X5u6t/tYuC/q+uexbdOrcY?=
 =?us-ascii?Q?vHQgsSgZ6Nx+lYmBKz6MfrEF+cIH6DjY4Z9Xyn4G0G9nyGCfFABCXVS2Uy3c?=
 =?us-ascii?Q?6IL8cTPiiTjSHqdoPgujVe3XS4BQOEPYfFo2q01IGPV+dNyG9UHfhr2YhOWs?=
 =?us-ascii?Q?zq00xM+zBXQB+bsxN22AbDqdAuaPrW+/ByPKkxV0+YlBJG+HfcT0eZf0Kya0?=
 =?us-ascii?Q?pSfmwwL6WkzlFNf+4ZLhXY6CtoBRMPJRvB7LraNPnfZO96w+CBcTlQuqDeCU?=
 =?us-ascii?Q?a4Z0ZYyu1f0TaWw7mTjaXQSCYxV14qyj9x8vzzY6ugjgDQ7cX1sMFXUI+YMu?=
 =?us-ascii?Q?YjsArZaQ+CleMYjvNF6Vvm7zirz+AND25y36CcEJyG/hM3c/IucQsK4IgFYU?=
 =?us-ascii?Q?gYKjnoksIWAYF21PH+9P/vRW7IZuFuRAc8fdPze3U5xRs1JSB961Pn8WyqH3?=
 =?us-ascii?Q?EyNFfQi+H1e22BoMPH3odCUzW1r1a8WP535vZfgS8G4cZOAlSmzdc+90gsqt?=
 =?us-ascii?Q?fI4+xhB0AzyOmh8quzcVa7Q/Ofo+QOcRMCPvskfDCDLmvobre33kbdNyROWv?=
 =?us-ascii?Q?Q0trFHHzukHq6AaytXZMoyOTQj5NfCHUP6lzvhbwpAF8XnYqyeKW4Y1mPObZ?=
 =?us-ascii?Q?2noOvaayZR20zNLG9x7t0AICUvaoNEoOd4/Uw+sBYJdNu6PCQVw4PUFdrn7/?=
 =?us-ascii?Q?TQVKACO/97srnmGofRb25ZYO25Zfer31lBXue9EpigW+tUdcqPLqKGr3hnut?=
 =?us-ascii?Q?Ws2Q+olSxsc7JV42/nPyRY5ley3ZTphsOl5a98qmwh7Iqp6oouwBzBA+neiz?=
 =?us-ascii?Q?gJC0gf5+wcO2cH1tZfVLmkfYdS8If77OjKohLMSNV3ERi4+5ljM7FKPtA4a3?=
 =?us-ascii?Q?iOgSUIAnIprDHQCu9B4ahcZUwgzwPL5Kw3ahamLcG61f0JGpxiV0vU3Cv6JG?=
 =?us-ascii?Q?9a2uXr8MpFfcjoJq3WJrNaVlnWT0HKxbdk3OMaAcaq9rSQk2UD+nFtz60Cx/?=
 =?us-ascii?Q?j5pVti6jbMJ/HvuXuDorztU2bX7jU9RcX33BrZY/v2roDqKtN+UbgZbVEYcj?=
 =?us-ascii?Q?iZkCxitXe6dlxXS5c/8UX+P+gsDmpdUmZw4U9MKjgV8m+oPKNyo12ts1o7or?=
 =?us-ascii?Q?LB1Gy7dwonj80PsdAJ8BvFh1SK/WOHRGIJ7TBd34IVwOBS0UL+u7xDrfQBFe?=
 =?us-ascii?Q?qgZXI5J3ZTtTxGgV/qxCTXSqifKWI85uBvltfIPlffzbf0w2OpGYrLfKsTAP?=
 =?us-ascii?Q?EtP8gp/mkQHGUKFMOUXzWwlYfYuCHdFXAZYdTEBgyt/yn/S9eeT0Oudq7DlA?=
 =?us-ascii?Q?oiOAvABBEjltkKwBYmYVgpSdrWKrU8Bq/YhvnEBC++/8bBuGsT31n59GFt8H?=
 =?us-ascii?Q?LL7h04BvvUamTD8F2eYIQwE5HwtaA2r4Lx0/GwpZSajtaTtpprMNz+oQhT8X?=
 =?us-ascii?Q?BnzDjq75kbmfcDrNHeRzBZmeYfKXHPbC0iJ/X1cOw7lJz3FvFw9wt56691cp?=
 =?us-ascii?Q?cxor8llExsY4Ic+EvKqE90f0knf9FGXXK0zl+KlbdFth8k6wWGMhtSC61Fbg?=
 =?us-ascii?Q?KLMxtRl9PhcsD9Wq9hTSPq7LwDfjiuBcw9dCl4GuMsUDM0U3at83+PXQ04zo?=
 =?us-ascii?Q?/jc4+pbs0g=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd47cc27-8908-4d16-df5f-08deec7f0f56
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 08:05:59.7531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uncYzquFFCz71c0cubv9G32a79RKUXiHlVuVtH5wcdsfOB7r4qrR0ZH2pUDHQj+eiu6Jlp3hxVSlP7v3DoGCvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6661

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/thunderbolt/pci.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index dbb6badda867..8462ccb59b7e 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -112,7 +112,6 @@ static int nhi_pci_init_msi(struct tb_nhi *nhi)
 {
 	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	struct pci_dev *pdev = to_pci_dev(nhi->dev);
-	struct device *dev = &pdev->dev;
 	int res, irq, nvec;
 
 	ida_init(&nhi_pci->msix_ida);
@@ -139,7 +138,7 @@ static int nhi_pci_init_msi(struct tb_nhi *nhi)
 		res = devm_request_irq(&pdev->dev, irq, nhi_msi,
 				       IRQF_NO_SUSPEND, "thunderbolt", nhi);
 		if (res)
-			return dev_err_probe(dev, res, "request_irq failed, aborting\n");
+			return res;
 	}
 
 	return 0;
-- 
2.34.1

