Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012047.outbound.protection.outlook.com [40.107.75.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4ADA424D48;
	Thu, 16 Jul 2026 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784209708; cv=fail; b=sJziEanThDvfsweTYCkPKZWbu4aL+nH6F+kUGdHhusB0l3FFrFM840Frak/niblecwZkiFSSMaE4Fkrrqgf3YeUhQNShuQ+ZSMZuQPt/CmmhUiV7rNY52xm8OGUTjjkLOWgAL5eo9btQcF19IN0/IE+ziKCeg2CvFqwXdF8at8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784209708; c=relaxed/simple;
	bh=MfDU+hn/giTSIqnSjbEeg8Z846QRZBYYW7/O7ShOuf8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qhrus/Ubli2GCHx1kNU384Bo3s177POHcG1+OvVyt2MLscHc185eQRSJmx8vjjXH4QqaksHhzO+xiaEQ7rX1GAvDQuOAWXXV0b7pNQPG4TzBeDUyNOZnZ8iP54UPf9cX6QFne8YQ8undKo6XnuvSkggFasd1PLwptdk8X9wbAvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QmnUR+Nf; arc=fail smtp.client-ip=40.107.75.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QmnUR+Nf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiwfZJniKYuMZLFyo0x4SPTVX1rWhP4vVSS7KPwz6Hg2ibq5Mb6c1iAEKtYkVYMnfu5led/92tj+I5Qne9MghXCkOTFXkrPLT/bdtCsfocxGLj4rTiXszhVKkCKe9phLGEKA7jpIaiPnhycVSE0fraLBUADAaD1GeD4DplAhKTddrAAI42sRFZTyjGLtkADj4fbkP9wTdZKEk4Rg+ruwscQvuEp5BYaiKjlArsYc49taXsGYLryxQacAg3gtq1ryHGPYMstipR+CrFjKdlwl3Lx5pjg1uezSe6AthozN9WBRMpxAmx+N1wv7CNPR+i/p48W2NkFfk2eDhpfheh33mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1McUmP3EmE3Bfv6YvMbSEzaqSuEfZRYZ3yn4cyKfoNg=;
 b=k1amBzvCepvwK2imZ+zqfr8DVXunb2AVNOXYxUD9e+6Gsgtz7IRm55Oz8oSmoo/aJuz9BxYCyUB3MP0E+mnsK2fwQxOIEvHYhnmhOUPCxBFJLTUBKsj8AVruzGR68UOk4RTNWoPCuQpgi8KQ3QB1D9uYKQVtT+uIsRBbcE/XijdJV1LC/I3P7FiyQLW+iAym1E5Dw03Mx/zDWrnZnK3G+pPPt/SM6yDjH1fUETOO3lmjjHgrKgT7V+3ZyIfrHYQO4T7bgZua0EGSEIhWJE8o7nEy6cIoaz70N2ipoYqeFMnTiaCPJpQlrOFt3hsUXpk4uA9aubip7v/uBQo7Wz6gxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1McUmP3EmE3Bfv6YvMbSEzaqSuEfZRYZ3yn4cyKfoNg=;
 b=QmnUR+Nf78De+VJlyKWn0qjOLX1ORM/n14KBXY2x8NlOP59qSy/wF7fqExHFENhBFOHGP0CJm9TsFCSyAGgqFJqWPiQ51mW+T2A+ZvUsN58Q1m04MAcAjwh7PvLDaWJZU8N+qgAZbr4YE6IW3X84lsq2Dl+xIg8X0CGmQoJbhj2f5tq2oi69tHc1ge8ns3x5mTqEYtyBwEVpuL4dBcJYkbdWN5FVPXvPSxuULLPQNSFeQ6GC9trexogh2IrLg8jSjoMD9JR966j6D/z3COnghUHmqVKgW2qd1bIE7Uib5PTp55oXx5dI9adeK9y8TpHobq812DhcnFtotIdoFrbluQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by OSQPR06MB7278.apcprd06.prod.outlook.com (2603:1096:604:29c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 13:48:09 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:48:08 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org (open list:THUNDERBOLT DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] thunderbolt: Remove redundant dev_err_probe()
Date: Thu, 16 Jul 2026 21:47:59 +0800
Message-Id: <20260716134759.49371-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0123.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::6) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|OSQPR06MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 489c536b-7bd5-4349-3874-08dee340dea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8sV/M04js7Z0q/omnNeou6oWWdY4VGEGjyaawyWoms9Sd2g5wKz866fSAgdjRilkuxOgvd90tiO23tZPT5+yfscKRpAgAycW07XAoAtljDeuDJG6SJN1qBKWItxoCCi7W0RrBGZNYEwFU8e97lj4+lm+OClJfyP+p1axOIQOjEXUKEtqw4BR0225zA8UFjtx18uy9fY9lYGEWCxfA2YGLDmKp4UmSCrXdl52+C7zAYqw7gcVw76dgX3YVgpwFLifzexV2RvsEb8Ck0o+VSZnc13Mcojgmsn0z4lcjU6bPTWHOr4YsYIWHlmUdhieKFbv+t2WjIdmIYgikuDPu/F63eNDA0tEnhZZ4X0g+Akwl/8AIO0q1GVQ+9ivyycDsTBoehY/rC92ZvYh5B8XVjg8Wyb1FulPx8ORlMgsDvZb7wt6Q4uJIOxGDola9BzmtnTjWboeg7C24g2A4pYXCU3zq+TQhEuRmsTCSQCECVANR6qXs9rXqHLKC6WKSpdtrmNXr98pogKaYIeClDRx2Unvr78sG3U/YbQuKNk3RXpkNLsT7BCryuQJHB4tctAKx6Cb3Id2iym9Vygj7VAeXpEIpSzocARBiUH/rRYp3wx6+/amY0+mC7oLefjwWP49/3abbqbIVTePnbqqnXpMR5sh0oaTW1ZsMep/YVsVZTi3Oyx6wjw/05+lIMxkytw82FflJbrVA30OCVTPN2ejU4Z0nkWzTwjX4j2AHYt8rrYOsVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?loTrox+vCUxb2jJ56QA3n1cfNVWuKvNB4yMvfx1j5K2GFMWerOER5Am0HSSs?=
 =?us-ascii?Q?o+2m8EmeIdIKpc6l4SMMSEe4kkJWZwZdHgvOdWxnaOnJo9o6yRIUYcGnPKqu?=
 =?us-ascii?Q?mU4CqKZIN1mDKOF+eDdEQ8Vx51yMjeW8t8CBqMikOxsCX/E8G9TzI0UCA/Yr?=
 =?us-ascii?Q?+8uZ5HkOgG60RIcOq8qJjcJvljQDNsZQjMg/6BC3zJXwS9VY0hLEVmJWxpWQ?=
 =?us-ascii?Q?P8q55Ex66Sa1nwNdA8SqHztv71osqW7Cj4ZSC17VAqo8/gEgmqkTzg/EUbUG?=
 =?us-ascii?Q?+LMSPU86AAl2ykG9yFJHA5Qfgi/N017g7GcaRDJ+URXRV4+tbqA+kmEcVRir?=
 =?us-ascii?Q?np0g4wmyUyMgHjmZizcX0grOwropyb1v2x91K3AhZ4lO4t/OQZJYH/f8rAH7?=
 =?us-ascii?Q?FvPCyxppF8q6G2ST5q1mykvvGTj+TBfKSehvz2UrVnES6QwO7OgRSttHKCVG?=
 =?us-ascii?Q?FBDCNJyLtIsygQypbItGL6tMe/CowoXWDqdTKS09P6aEuSKe+RLbV0m+XH0v?=
 =?us-ascii?Q?AcxSK29YgG2/ldXBguiRAKqGLLsCgVrsjC171w/dD3g13SRTDN6Q29OenOKf?=
 =?us-ascii?Q?Uh41iQT1FaKMeAKhnFmxv3Zzm45nm2xVIgLcV8iHDtMzH+rCOirvcCBP0XvX?=
 =?us-ascii?Q?sM3LEKWulYpu7oURLafDRFjxlMZKw3lGBO8mWONjcKXDT1pMkQ2I22g1rVkF?=
 =?us-ascii?Q?xbRJBsAdgoZ1rkxl6Sh9U79pYNEa7BraNQ5JbjVQMbKVsJba+WTh2FIICmLl?=
 =?us-ascii?Q?cyXuNpwaHO4xhJNMqZYGoWLqW161St/J61mhKpiAKlrK0k/B/9+41aKESt1o?=
 =?us-ascii?Q?11yzqw0eIF4jFH5lH7bTQSRAm/ThSfdZ6gdkeh/yfqQkP+rJmYzXVVLW8TNw?=
 =?us-ascii?Q?w3Mm+cr7PKFlKhZToIYVJDZ4BXW3iNh5HrqoN+IeYbaQ+4PJkngvmWl6+3i0?=
 =?us-ascii?Q?MZ/idBn/4FFICHS/fbMU3GI0yaVb/CcogrruuDQm8LgNtQ1P3yHDdmIbAIle?=
 =?us-ascii?Q?jN6KanuqfnzU7XX3i/cKTYRjmVzPjICvPPtj4ejWwmDV9/d0gcd4tIoTzNxv?=
 =?us-ascii?Q?lqrKRD48G2QA+Isx4RP5H4pxBBPX/8vcQc66npYStYtkk/72Hg4ZFDBXtErO?=
 =?us-ascii?Q?8H2c6VspfvB+Wv3hYxhZRqauROfk5bOmHDZNbATJsWIj0T2U700hNLXnmMJ/?=
 =?us-ascii?Q?Ph5wnjxoPved8d3jBrupmRvnVQwRtn9iw6Y0vfYMHWn9MuUgRSwz2w+hJXa9?=
 =?us-ascii?Q?fv66N0QkJZFwwI92xRCmoctqQPPm5PnfYf/RKTy58Yia4MmhL2X7ju8Q2NiB?=
 =?us-ascii?Q?aVrTKCDEGC9ZHRsOW2535pDkEOGubv1fSlhqcD6FvMS3YJYf5I1XTl4xWa2b?=
 =?us-ascii?Q?8nTyYo58QBerTRrX63ODXWsp83j7Gm1zxRZEJn/xE7JTnjCPsEZptHgenwiT?=
 =?us-ascii?Q?1f+2FraKYTzEcFzWXttymZ+8duUhRcbIIe8nluwslcTOveLFMstZmKBmH6mW?=
 =?us-ascii?Q?17LHPu0iwF0yIpPWv5Qpg1J7shmEX2nGp/+Ox6UJouD9wYthysJI3ykmPrnV?=
 =?us-ascii?Q?lyaT8C7wdXidcLxksQNcGogJAG9g+MEoCNW4gcW9bOlaW4x2z7yfeinX4ORq?=
 =?us-ascii?Q?+kL5lj9kF8Tw6WYsCzFjAeWWln3qDuagTz9Z8dpGd2dybEcZeyNrR2iy5CZu?=
 =?us-ascii?Q?isSqQseQ0qBoB6OP2fH+LcYa7lwbVGmP6Hw3REO6PNxLy3iDDPBcrPUzT4Vf?=
 =?us-ascii?Q?fi7LQJHiZQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 489c536b-7bd5-4349-3874-08dee340dea2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:48:08.8211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: si+EECMYSgXYkvuUio6WrzvoQLQUnS9Dwsph8YVafcHou4WalWOZ/SvPd/ToA9Jeudij0FURsiYmWJbPziGy3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7278

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/thunderbolt/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index dbb6badda867..89ae429d4cd5 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -139,7 +139,7 @@ static int nhi_pci_init_msi(struct tb_nhi *nhi)
 		res = devm_request_irq(&pdev->dev, irq, nhi_msi,
 				       IRQF_NO_SUSPEND, "thunderbolt", nhi);
 		if (res)
-			return dev_err_probe(dev, res, "request_irq failed, aborting\n");
+			return res;
 	}
 
 	return 0;
-- 
2.34.1

