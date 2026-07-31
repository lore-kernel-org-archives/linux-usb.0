Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013071.outbound.protection.outlook.com [40.107.44.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409FD33F59A;
	Fri, 31 Jul 2026 03:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785470121; cv=fail; b=NhYaR6O9581STGdtdosARAuBhUOpd/abmfpi9e/EpHkzAD1OlryIshuM1rzScQYSHrjA/qnTMM5tvOIJzzD6UB7aom/SAyBO3yig5xUGlzSArKzEYWTXiF2tt0sB1BBPRyqe2u/AaPnSd4LF7Fmj65Oq2tFHAItxxjPuOLt3P24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785470121; c=relaxed/simple;
	bh=dbPfTcG4rnNE2D8xPxrugfvPVxC7NX2Hb8YTbzjiPvA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bI+K/ZU5Yi3+Rgq698imOQs7KAm1qvs3jWuKIzY88zLvIjjSZvve8BLXXeqD9a5gJBZZFkzLbrcRFMPMm7XeXTnSozFx3NLeJoe+MeuEw27t7KPNet8u2qdOKbeLkKQk3Tu03wgcJppQEUfLLDWZbfKqSughCPp7pMhIVFWhg0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=VEjcwUif; arc=fail smtp.client-ip=40.107.44.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="VEjcwUif"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXazXtm98JKwCrSbtAs78bS4JFTW6mW3nEZGkYmqXcC5gsGVr0lI0WrCsxbwQ4SvyJqB8JCUvPc2i80Ly+4fauQTtB7y7vI889wKJpMyRdDNmaLCGQzil+uGBWD7JHC06P1LLgoFlkqCMERvhu2BMY9gu/nZ+8AFB94ZqKNgCa7lG7ZjfAbVrEp9CD2GpR9C5noKzSBtIHDVipD3gRC3zJsGYk3pBhr+rlETc3oOcQrFbM0c0Z4b7/+1hYnGcTuBQhPkCNU1fgSZ5VvPqd/9kJFxH6BmNudLtgUvXmBwMCKB1MvweFQ8nSQTbNouLFg68ymhtSEq+qJcUYKjp0bF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxD0y1RyWTlm2Y/vncv8hsAX/WwwCGjYgkUJfSm44DU=;
 b=NhGBeWYniz8gPvMUz/TOmFhVXh+ZY38b7oxzxJmZtMhqP88eb6jHKik4J+xfNc4CT/CNW5XEJQK3yyuHApPkqaJEdyr/MSQpAy6/sS8rXD9wYe+9J8hbuWf4L74p4aPzC75UtyXVQWSNkog7A3G8NoPpZxeZNFf2dN72eEgEeDsAYNhmT/MxJRqXE6zcYYFDiVl6ihn/feVSRynGlhpIXT5YZpihKnqyoP9rJmlkZUi/xtzSfvGA0ofund/WHyAQajFPFVRPi4i/7j2aOJ2uZnRhe1Ai4v5gmy5DzD9YOWg/lDq6CFzykSrStoUihyxXfI53DnCkbcjYk1uv0fNz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxD0y1RyWTlm2Y/vncv8hsAX/WwwCGjYgkUJfSm44DU=;
 b=VEjcwUifjwtcJ3sb08art2BJWil25yrdoUchfVqyVbprbIfxZtDaOUC2RoTCAOT4GPieWAARUqOPwQcbshNTMHlQNYsUI0r4sqsF3+pn+RpSzr5vzE5ma0QRteH5x0EwzoNESTzQmOFgT9VDTmQFeNdCqGNc5ZTCP4SqtJm6LrgVSafPFohh1pvHp3M7A/JQfV+5taqkTGdizi43dyoRHbpLPaUDZQ5WqzIfcg8zzIAHZvoRbLhDLXM3X6P76qLex9KAHU/9Ejnfn2sorCXVGn6af3uNoSikOFwtDATiGRZSFgJRHJVSGU4p//nqwmnaNxmsXI4eFLGSvq5pJQqpHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB8782.apcprd06.prod.outlook.com (2603:1096:405:3c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 03:55:16 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.012; Fri, 31 Jul 2026
 03:55:16 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org (open list:CADENCE USB3 DRD IP DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 01/11] usb: cdns3: Remove redundant dev_err()
Date: Fri, 31 Jul 2026 11:54:35 +0800
Message-Id: <20260731035448.252289-2-panchuang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: af3a7a1a-e322-4fe4-50be-08deeeb78833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eM/4rU2b11sgMx7aP0or8z9oxV4EEArdnV6sTvPtMLDBHCiGVgWHiEz1qjsdVm47jLFTEHxzeY71I2HCuGdyVba3JNFaLm3YacVRirTpTeb02MBVXcvPEMd9nLlDPsm9oVNd6xYU8kMyIPeBOoJAaQMAeiVthaZNd29Arisp3KUwQcAmP9S5VWwa6CZPrFSNLObGrrytibDnGjfoC1Aw4po2xN69lrXPPIFCazV6cYsnqzs1F4UoqqwfU5u/+uflI49MWJgXe8x2sjw1zhtvkNKKDz2Pe1uZYT/8fsOo2jt/eVeaS/VlX+UxLb7TZghxhUDkKg69U8pmg0L3PCf30Whp8jGrY+fANmK7hRszeK1xRgTpxXiM+lH/2GqYGWXamCvzijp6Y7pccXvFdaKO7ndexwO2uvjWDwI4KbhNJp0eDPtpt2DEBdcKu7drI5OYsAaBS7MJ7aU/MhYQEE1XDisd4JY48aozYMR9NUTTPlOE0IPaDhnVFmYjw6MdkdegpHLIlkk8LLg8sHuh1+18G4MrkvYC9hXMvE4ktpyzQ1cDhOCKaODssAP26vzcKWt5+u48vC0urJgYla9BR1NMGLSxohk0eyV/94Tc2xxRqUCg44m8/3fBAFaKvsBYVZ6OB+mg38IcoQyJYKt4YS95HQivs7EyvoVC18m0pMGQlXwg56i9hScZwoA3EUqfTrqVjXILsOCSeIkLLtXEb16cjySLxuFJ53jCRCrbpWqYQac=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UT5kQwSFyt2BGFUz94p6AM1VL0u/nKzy827id0cKiuBWjM6g8FmuUn/q1FoE?=
 =?us-ascii?Q?9PWxOXoHPs/25LwKX/lIV/yS3lDO2rfrk0zqtJRNkqyA8FTuCOkwrHm3O/Ws?=
 =?us-ascii?Q?a08J8bZZAluKQl9BOrEFapXuR3SCZeU6k2lXu7/WEauGt3Hp4mv3kR9u9rHN?=
 =?us-ascii?Q?PdyWfQ5qqAfWSpT6quiBcm4xf5gauM7czv+8O2yUTbtibC1KIwPmnsI77mvc?=
 =?us-ascii?Q?aVZ+Uj/RzSHBYBpvRUTi63AzZiue4k3Xms8chLTv5yJZShcyyhATCdkhy5c/?=
 =?us-ascii?Q?o+/Uf0AnSCF3vMF65FZ8zLkV5YuLrncyUYJxOXHy7NlablOuZLU/ubFfotZE?=
 =?us-ascii?Q?zxgSUEyi5SAMsfHPSMs+tXe3h7PoRq5Z6ehOhq4yHsnPT2fo//UTAkhkdICF?=
 =?us-ascii?Q?e+4ONoHqK91HP8Rv5DIG8EA3t4fhepc0R6iNFVzqVKpHTg2H88cn2LnpnQ5b?=
 =?us-ascii?Q?A2lroenV+jZQMVQCtimSER2/889j73aW4HIN8kKxQIjqrSAp1kkpINSf/G85?=
 =?us-ascii?Q?zfpZDJyZhYd+x4e/h1KxAxFqaCKWJN4FcaJm2C5+CQDHMg10SL/ibuCF0K66?=
 =?us-ascii?Q?WKIW34Ehh3up6NXXxiitJOqXMZDDg2W920hVnp+fVATGRw5woQEj53iG6eBo?=
 =?us-ascii?Q?O7Q9Ti9cqv3UYhOyDXN7ewrRuUXUpNelMQw8SPIz7uKSTdc7X8G5t6dkaxBZ?=
 =?us-ascii?Q?7T2eEcJ2NEQOnLptajU1WaJIoH5kVd/2FVaP6Zx9EzOjMMSuYS0yW4EgAWL7?=
 =?us-ascii?Q?vn/VjzQ3eaQvCmu5H4W/h4+klhuVlEfTId/qvcpMqeyVHYfS5hbu2goCLi4S?=
 =?us-ascii?Q?tLLvLgkRA9m98onef2b7Oe9oD4atFYGIoJ+LdoDrRaNJQa5dKBLB2BaVQxp4?=
 =?us-ascii?Q?uNv+LFA5VinETIHopqsGzBVuSaGQiTfvlj9gWX881tddIF2OS3cSfn/SxTJd?=
 =?us-ascii?Q?oIGJ5F6mh9gKvTM2i9OtO3e85+uRa0RVgmgQDJYSnW3rfqt3Hw2eJcdGpjqW?=
 =?us-ascii?Q?Elo3R6EKoy3z1sypOtKpvR8EqLUnAOxXnoOAhHJXiLqoY830Sv/OPzYkus8d?=
 =?us-ascii?Q?CU+hbbplSFQALwwx94+bd5W34oHbOvC3vD3eh/7t/JMNMo80u14CjKNKzcg6?=
 =?us-ascii?Q?/m1uvYJ3cucOQa7L230vwHt5ewYvvoBaCjAqoRJDR5hQFcDf2LfAE2Y6TUEv?=
 =?us-ascii?Q?siQZB3Z5DQFTZGjGqDUoK7Qt2N55iTelRgpGK2XDBTMY02dOD5qusoUGaP88?=
 =?us-ascii?Q?iWP+AuLc3tYycvCXZ9vX4fmYjVHZG/NBHzioPa8dk20TqHMuawS0JdcXa9Hm?=
 =?us-ascii?Q?e3HCl5NcphUgnWsWueYSXF6WlvHidT1S4pT4EdkpMYquBVQkiLBGVvzfZI6g?=
 =?us-ascii?Q?R5rqOIr1rIIU53hW+lOe7sgB1CqWy1iXSIZTQ+9cInXe2esaSfWKAxneRxwB?=
 =?us-ascii?Q?BDa5ERpTdcpOq88Pg9c6Q5wD5DdOexwx1HP1y0Xz5FOOdF4bWZLpm2Sxmo3u?=
 =?us-ascii?Q?GznIID6n3J0iK6TrHFIjn13eTMxJKGgEUQzZxMibBQ4f05uT0lwS1F1DDKaJ?=
 =?us-ascii?Q?c/o5pADDz3DZVYn+RXF1dO5VfZ9VUG/UNrVCqb2lJhZ7ukIU2jOogFUmDVbv?=
 =?us-ascii?Q?/eY2msVa4nWFC7g+oRCUcFdp9P8i0/M17Ths/7yXVJQ2SD1rb2GIfIJeZR3A?=
 =?us-ascii?Q?/mHxAgYuUuIFsjMTMWmYQEcq2CqNwbs8C0E6af0JJOnRabB3eWYYlrfBZkrd?=
 =?us-ascii?Q?ZEJbgVAkEA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3a7a1a-e322-4fe4-50be-08deeeb78833
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 03:55:16.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1svz1oscitNvFDUJi2VBBtdHyHUe4SaNcOfqhUGCzEVykP+iGsDhKpJmtkj1HHuHkWxp4GlgvdRAyXZDUtl3Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8782

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"),
devm_request_irq() and devm_request_threaded_irq() automatically log
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/usb/cdns3/core.c | 4 +---
 drivers/usb/cdns3/drd.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 504bdf13ea80..87122fb5bdb8 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -449,10 +449,8 @@ int cdns_init(struct cdns *cdns)
 						IRQF_SHARED,
 						dev_name(cdns->dev), cdns);
 
-		if (ret) {
-			dev_err(cdns->dev, "couldn't register wakeup irq handler\n");
+		if (ret)
 			goto role_switch_unregister;
-		}
 	}
 
 	ret = cdns_drd_init(cdns);
diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
index d2bb682e4552..42f13757d904 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -509,10 +509,8 @@ int cdns_drd_init(struct cdns *cdns)
 					cdns_drd_thread_irq,
 					IRQF_SHARED,
 					dev_name(cdns->dev), cdns);
-	if (ret) {
-		dev_err(cdns->dev, "couldn't get otg_irq\n");
+	if (ret)
 		return ret;
-	}
 
 	state = readl(&cdns->otg_regs->sts);
 	if (OTGSTS_OTG_NRDY(state)) {
-- 
2.34.1

